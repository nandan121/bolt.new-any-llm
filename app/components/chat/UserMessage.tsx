// @ts-nocheck
// Preventing TS checks with files presented in the video for a better presentation.
import { modificationsRegex } from '~/utils/diff';
import { MODEL_REGEX } from '~/utils/constants';
import { Markdown } from './Markdown';

interface UserMessageProps {
  content: string;
}

export function UserMessage({ content }: UserMessageProps) {
  return (
    <div className="overflow-hidden pt-[4px]">
      <Markdown limitedMarkdown>{sanitizeUserMessage(content)}</Markdown>
    </div>
  );
}

function sanitizeUserMessage(content: string) {
// nice to have the model name and provider in the chat
  return content.replace(modificationsRegex, '').replace(MODEL_REGEX, '$1').replace(PROVIDER_REGEX, ' ($1)\n\n').trim();

//  return content.replace(modificationsRegex, '').replace(MODEL_REGEX, '').trim();
}
