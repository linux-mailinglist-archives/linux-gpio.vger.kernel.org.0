Return-Path: <linux-gpio+bounces-36005-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHRZMfI0+GmxrQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36005-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 07:56:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C8614B8B60
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 07:56:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D7CF300B985
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 05:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A0202853FD;
	Mon,  4 May 2026 05:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cpeGvX2V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8388A2797AC
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 05:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777874159; cv=none; b=aUZZqsDa4407IXTJljfYnQmZwurGeSyb9GSjzjoyMki1d1AEHIqHgBahKGIHo9K5QPEJTLfBi76nE0E2CB2XJ3KShPJ6o58MmcKkjytFvCxOXNAegnZk2uoHQdzSRQ8FuarGdzXbAfqiz6UID67ts+gGPU9zwoNXKOSakwGfalI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777874159; c=relaxed/simple;
	bh=0JYb+47SuTUvKMIjNtlWIKxuIpEYewG2doFKKx6vhiE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=T22gFzSo0HioFUQcUvk4ytJf4tOkQNdmgtFb2isdTdtHTloHtR6P/TeRKiEBGJasc7tSbp1wXFkxR9Bf6+RSLVOiQ1baYvHtEwMVp6ox7LJiyEASTQSQm7QgsKUjpDY/K/LCJeQCQmooi2gjyxeK35Kg/U4M98g5FZwfi4ZWHOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cpeGvX2V; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-358ed696623so1615806a91.0
        for <linux-gpio@vger.kernel.org>; Sun, 03 May 2026 22:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777874156; x=1778478956; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qSbGg0k0BvR8bHpFwu2SlmO/vZ7U24qUHDBvD74bJMk=;
        b=cpeGvX2VD+eKwqRK/mTAQSu7JYqkRVOgDCHPK7JH/eHxK6YfwTqSONZhoGh8J6G2sL
         d1pJ7HtPRF2NpKOvB6dM5bvdyhPOT6FeXCnfD0ZhfZTRJJKcSxMxRuJyhg+UqOT6a7SE
         5PM9aIUYDLmrPnJlvrD9veY2YdPEsR2ohRPSIygOVqzbwwEVF4KzaiCa8Z6/Bdt1IPJb
         WZ1SGmedNImDOdcV6ZtMSiNYv4E20zc8getbujpVSNyZuUcg4D/EeVwvvfTnOVxHB8vU
         R/652r/kbzLE4hpkAWjTLK9aRxwKOzmBC97xAkKmo7d60tzzd0fDeWny47Tpm7Yv4WM2
         9mDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777874156; x=1778478956;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qSbGg0k0BvR8bHpFwu2SlmO/vZ7U24qUHDBvD74bJMk=;
        b=dE1l71IKCSOwhHLMtVwXeJkU2SVkKhu0TsN5gIR0UT2/noP+h9C/oUFQHQ05XzWnUP
         qMjHzdKDi+h0BJQJ70M4VQujLjJVPdQYC/bxKf1wxfYNxZVIqtvZWPPIPbLnPcmmw3Wi
         an9mfvtOtJNjz3SVVx+W/2idMsk1gKQ6fGDoYhJphMlPsRYccxcD5abq7CJMNybgVLhs
         +OHgwCU+1c5BeuQaRbJJkcrnGEcwb1hHBxeoaHSlIFXnstt+fjRYgHvY4x/5ilh3xEJ/
         3LRqmZ/rOrKrwapkDzBeUormEFqrNKptB0n2BhFeq7wy55JL7VbcoHP8NEXoNwz83tHJ
         9q/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/RQ3KUhWYXZUIZhtW6xFmexeCBMPYkSLtkTcLMO13B5vYxUqe5lvi0pHYYZ5X3FW210K3TNDHPcTP6@vger.kernel.org
X-Gm-Message-State: AOJu0YxDI7Y20+MEiiKd0YhoVjQBeL0T5Nmxs27TnpDQscJ8eG8qEWfB
	DTAF3lHkQIvL3hc+JICdgIRVoFQIxdvLf7ziAhwoIOzJezsCI++WUjK/
X-Gm-Gg: AeBDievdOlAcTjGelEpME7vF+OOS3hShTYRYPXekCSGVieY0BP04A7IBLBX/Z7xkeLG
	///Jx6tg1rXxZem2oRuyWbzxCM24DqTCsbI5W67deeQs/hEyaXu0AkqYSyu6b+sP+5jh79oYN4G
	1QNonc/xfRYcOnbpy4lif/Dqu43/otNXSR4dFlIIQorX2rJNXqrRe9t0WnRSXbP+XlDZ/hY77Lq
	59hQD00nR0wxbb9R15j1eOVAvXO8fosIvurYrb2rTFi+1g5/bCnfr9uhNTuNVVw60Z1xc9jWKlM
	Z8thVzATLM8epIFHejEotDa0L/d5+XgDqfAnK47/TZArcbI0tu3nvhu7rVj3B8zbxBLx3LEH/4e
	6Ao8SGL7X3ppjtpXKyXDxf5ArSep3Q1LKfsvG1k49mAix8i4T+1tufPYI3IKWzvZf+K7YBY751g
	d1mgaYYFlD0EzxghbppXNlDMfaSFL8T0orBetalgrHvIWObEKU4uNheo88X9f+baQpu1Fpb/YOO
	m6p
X-Received: by 2002:a05:6a20:9392:b0:3a3:a5cd:560d with SMTP id adf61e73a8af0-3a7f1a1df35mr8814589637.9.1777874155812;
        Sun, 03 May 2026 22:55:55 -0700 (PDT)
Received: from ?IPV6:2402:f000:2:4001:944:3690:ccf6:2932? ([2402:f000:2:4001:944:3690:ccf6:2932])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-835158bd62fsm9894938b3a.24.2026.05.03.22.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 22:55:55 -0700 (PDT)
Message-ID: <75dda615-d4c3-4e14-8c5b-736a42fe4442@gmail.com>
Date: Mon, 4 May 2026 13:55:52 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: 007 <zxl434815272@gmail.com>
Subject: Re: [PATCH] tools: gpio: fix buffer overflow and add bounds check
To: Maxwell Doose <m32285159@gmail.com>, linux-gpio@vger.kernel.org
Cc: brgl@kernel.org, warthog618@gmail.com, linux-kernel@vger.kernel.org
References: <20260503190016.13439-1-zxl434815272@gmail.com>
 <DI9CBAF5FQU5.P8X4WBBUR6FZ@gmail.com>
Content-Language: en-US
In-Reply-To: <DI9CBAF5FQU5.P8X4WBBUR6FZ@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3C8614B8B60
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36005-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zxl434815272@gmail.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Maxwell,

> This looks like a patch that could be split, since you're adding
> NULL pointer checking, a potential overflow fix, and a style fix all
> into one. I like the idea, but we need to split functional changes.

Thanks for the review. I agree that these changes should be split into
smaller atomic patches. I will prepare a v2 series.

> First off, this can be split into a different patch. Secondly, I feel as
> if we should make two if statements for this, one for the NULL and 0
> checking and the other for checking num_lines. And returning -EINVAL
> will be ambiguous for the caller, so maybe change that.

Got it. I will split the argument validation and the num_lines bounds
check, and reconsider the return values.

> Another thing that can be split.

I will drop the O_RDONLY change from v2 unless it is useful as a separate
cleanup.

> This seems like a stray change.

Thanks, I will remove unrelated whitespace changes.

> We already invented a solution for this in the form of strscpy(), so
> please change this to use that instead

Agreed. I will use strscpy() in v2.

> Another thing that could be split.

I will split the ioctl name fix into a separate patch.

Thanks,
Zhang Xiaolei

On 5/4/26 04:56, Maxwell Doose wrote:
> On Sun May 3, 2026 at 2:00 PM CDT, Zhang Xiaolei wrote:
>> Replace strcpy() with strncpy() to avoid potential buffer overflow
>> in req.consumer. Also add validation for num_lines to prevent
>> out-of-bounds access to req.offsets.
>>
>> Fix incorrect ioctl name in error message.
>>
>> Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
>> ---
>>   tools/gpio/gpio-utils.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
> This looks like a patch that could be split, since you're adding
> NULL pointer checking, a potential overflow fix, and a style fix all
> into one. I like the idea, but we need to split functional changes.
>
>> diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
>> index 4096bcd511d1..1afd9dff2bed 100644
>> --- a/tools/gpio/gpio-utils.c
>> +++ b/tools/gpio/gpio-utils.c
>> @@ -65,11 +65,15 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
>>   	int i;
>>   	int ret;
>>   
>> +	if (!device_name || !lines || !config || !consumer ||
>> +	    num_lines == 0 || num_lines > GPIO_V2_LINES_MAX)
>> +		return -EINVAL;
>> +
>>
> First off, this can be split into a different patch. Secondly, I feel as
> if we should make two if statements for this, one for the NULL and 0
> checking and the other for checking num_lines. And returning -EINVAL
> will be ambiguous for the caller, so maybe change that.
>
>>   	ret = asprintf(&chrdev_name, "/dev/%s", device_name);
>>   	if (ret < 0)
>>   		return -ENOMEM;
>>   
>> -	fd = open(chrdev_name, 0);
>> +	fd = open(chrdev_name, O_RDONLY);
>>
> Another thing that can be split.
>
>>   	if (fd == -1) {
>>   		ret = -errno;
>>   		fprintf(stderr, "Failed to open %s, %s\n",
>> @@ -78,27 +82,29 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
>>   	}
>>   
>>   	memset(&req, 0, sizeof(req));
>> +
>>
> This seems like a stray change.
>
>>   	for (i = 0; i < num_lines; i++)
>>   		req.offsets[i] = lines[i];
>>   
>>   	req.config = *config;
>> -	strcpy(req.consumer, consumer);
>> +	strncpy(req.consumer, consumer, sizeof(req.consumer) - 1);
>> +	req.consumer[sizeof(req.consumer) - 1] = '\0';
>>
> We already invented a solution for this in the form of strscpy(), so
> please change this to use that instead, something like:
>
> 	strscpy(req.consumer, consumer, sizeof(req.consumer));
>
>>   	req.num_lines = num_lines;
>>   
>>   	ret = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
>>   	if (ret == -1) {
>>   		ret = -errno;
>>   		fprintf(stderr, "Failed to issue %s (%d), %s\n",
>> -			"GPIO_GET_LINE_IOCTL", ret, strerror(errno));
>> +			"GPIO_V2_GET_LINE_IOCTL", ret, strerror(errno));
>>
> Another thing that could be split.
>
>>   	}
>>   
>>   	if (close(fd) == -1)
>>   		perror("Failed to close GPIO character device file");
>> +
>>
> Might be another stray change.
>
>>   exit_free_name:
>>   	free(chrdev_name);
>>   	return ret < 0 ? ret : req.fd;
>>   }
>> -
>>
> Maybe another stray change?
>
>>   /**
>>    * gpiotools_set_values() - Set the value of gpio(s)
>>    * @fd:			The fd returned by
> I like the idea, but we should be splitting some of these changes to
> follow the atomic commits idea of the kernel.
>
> best regards,
> maxwell

