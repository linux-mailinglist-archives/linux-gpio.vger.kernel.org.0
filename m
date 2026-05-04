Return-Path: <linux-gpio+bounces-36004-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id tMAuNaMy+GmUrQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36004-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 07:46:11 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9084B8AB1
	for <lists+linux-gpio@lfdr.de>; Mon, 04 May 2026 07:46:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D0993007AEE
	for <lists+linux-gpio@lfdr.de>; Mon,  4 May 2026 05:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8348523E334;
	Mon,  4 May 2026 05:46:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jA0YhjvF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117954086A
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 05:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777873568; cv=none; b=Ofp8SES8x9b6HPrmrMhWw3fS0CAIlXkfh1nkGN5TTdLLLEDVcafbOepU8ILNV+UUa6j4cLMjOV+hRZy13SsaLTDYIraX3ShCqiiu28bNbdQYXPHFWFYyTq0THHoTIgJOuwVhw/BNq28iRhtE/auQljzDsPczoDVFEEsch/UehvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777873568; c=relaxed/simple;
	bh=9JqMPn0RXpz+fcD36D3dFToJCRezEpPBGiispDmrjPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=axyKKRZ8vJiB9Q0lDK9QbNh5gEEb0XCA4aOWLMluDI7Fviy4HlQ1ZFBULpktaXANM8K+w3JzWldknXzjni1rItEKf+4ZhAXXMyhJnU9yFX83GfipMLpmzrOy7pxQeulR0O2DQ9IxdsJ5UuHOrNyy8OTsdnwnl3xVap7t8oGTvps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jA0YhjvF; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c70c112cb61so2102409a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 03 May 2026 22:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777873566; x=1778478366; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JMdrqXAeZlHZMAjNWM5ngvOGBdh+mR1QfsCscY7ufQo=;
        b=jA0YhjvF1Ld81pQIpOJeHUPNpOwHVIeJ1r1/t3HX1NJ8UNJQZMVAmp3fFCQPCsEf7b
         NfqDGuay8vtp8EwO/NYpazjV3Gs7guJihDKai2Ah5K1/D50iujD+7xZgqUWx4N/H1qQM
         bKU+sf050EcJ5Zu/izSzmmr2eTlEHudcolQmLD3MoTiGRuK5VOfqj4A8zaAg1OGFnUIF
         aL7DTGLLP7/6VenhDulD3AG/sPB2T/TEPDqJxP4DSm6QJ20HHvXHg93H6IvehWvUop4T
         fnJuZbdmtjHAoi1WU3GwDGR4obZI2V2H72v5R05/sgul3He+iu/7WVEoIHoDxgn71e7j
         WhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777873566; x=1778478366;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JMdrqXAeZlHZMAjNWM5ngvOGBdh+mR1QfsCscY7ufQo=;
        b=Ii7iHGseaURK2ojfUefJ4OSBONYPeEv3pSQT6MfSu6dlerHFvn94y50qdDZZsebdlL
         8yO5RasiWbtJLEyshWhX96cgM6Kucsoal0MhNPHyL0o/7wUYs+H7zUQOF4sVQv2ZKRjL
         ZTseYP/srv/ThaLT5UcVJ8Nzg/fTLVTv6jWcfMbBqKBksRkOJCPH62u60H4cqv3p00ol
         ihsnL2N8b/AQqs0u1ybr0jjjOph04Bv+pQDSg6S6EGmuJaoqQhC1LUMsAVfpzuxcQPs9
         TbS9WPg+R8xBhBnndvIwnQlaYEjAcf63P+yhfeBKxnkhr/e7DrZs3JTE/XmJjOOeTQxo
         3NJw==
X-Forwarded-Encrypted: i=1; AFNElJ+hmUh1KzDEvZdsDF8+dI+8Z3H/aTrvWtWbDF3ijAC7JpT+r1dH0WHa8XdlgXjq7xdHZds4YU6xsWn8@vger.kernel.org
X-Gm-Message-State: AOJu0YzXxBFteGmiGadwxY8MhhSMljShTM//5+zm2rHMUunyz5edkiUi
	tVnrqVLAeqL3k32UfqtPyky9f6oCVjqxidJfdFWxv8RA/MmyQGZjivH1
X-Gm-Gg: AeBDiesm8alUAmsdGxI6Zn0u0d7jxorUg+Os1yGlYgYopD4+gAl6E7Cwkkvy2zAS5cd
	ZL+KJACs+yrF097iLRBS9l6p18nwAUP8D/23Jk62js9m3VqEO9+csL27Xghe4fjjbZAwq9hlUpL
	QtSksMYIq3iIK+vK4Prfc5uqa/ukqlK21OV5GMxPxVgSjCI6mbfqD4MW58KfPm3VEo/kd2xSrK5
	Vik/GveIrMqu1DiXP8glhCF2UKjRf0mNZRw1nvJ0tfMgGqYFIpf7b6qjwh2X0MkQFADHbXMCy0m
	wzl/QdSzaFkdzhsyGEjY1azynrukbuvUS0IKpX5A/BSYSRKKSsBRtN8KzppAq3f0uD8ktVLOpYP
	A2LfVUl/wUS31inGP1AT9GXScI9IrM5gR8CNt5uSL7fsCvZpXeXTmBddzolg4kC2CxZaJDRiV4f
	onjBgzMIeyziJN5IaPOgfi7zqHrUNxevazzkpdl3NVFCFfBRnMYLUSuvipW6/dj2HHrGABFjE86
	sEDO2A=
X-Received: by 2002:a05:6a20:3d84:b0:398:8002:8033 with SMTP id adf61e73a8af0-3a7f1fce0a8mr9056079637.49.1777873566326;
        Sun, 03 May 2026 22:46:06 -0700 (PDT)
Received: from ?IPV6:2402:f000:2:4001:427f:2eb3:870d:a19d? ([2402:f000:2:4001:427f:2eb3:870d:a19d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbc6f063sm8457392a12.20.2026.05.03.22.46.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 May 2026 22:46:06 -0700 (PDT)
Message-ID: <81958e85-da7b-4b4d-927b-f7515a2b02a3@gmail.com>
Date: Mon, 4 May 2026 13:46:02 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools: gpio: fix buffer overflow and add bounds check
To: Maxwell Doose <m32285159@gmail.com>, linux-gpio@vger.kernel.org
Cc: brgl@kernel.org, warthog618@gmail.com, linux-kernel@vger.kernel.org
References: <20260503190016.13439-1-zxl434815272@gmail.com>
 <DI9CBAF5FQU5.P8X4WBBUR6FZ@gmail.com>
Content-Language: en-US
From: 007 <zxl434815272@gmail.com>
In-Reply-To: <DI9CBAF5FQU5.P8X4WBBUR6FZ@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 2D9084B8AB1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36004-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

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

