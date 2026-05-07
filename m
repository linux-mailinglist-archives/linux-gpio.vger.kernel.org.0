Return-Path: <linux-gpio+bounces-36329-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMlvN6fW+2mzFQAAu9opvQ
	(envelope-from <linux-gpio+bounces-36329-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 02:02:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0614E1A44
	for <lists+linux-gpio@lfdr.de>; Thu, 07 May 2026 02:02:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D66B330277C3
	for <lists+linux-gpio@lfdr.de>; Thu,  7 May 2026 00:02:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE7A315E8B;
	Thu,  7 May 2026 00:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QPj5EecP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A826540DFA6
	for <linux-gpio@vger.kernel.org>; Thu,  7 May 2026 00:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778112153; cv=none; b=POh0d/+Z6ysmQIfU6/eu8zWbpeOsApMyabT9FI33vFUvPbdGdAXsac7C32rqhFq5hNWY6cX5qHLodrtkWLzMvaYSiKbiCIsWdKhJaW4SQZTaWDt8Mwssub/uPlPKX9o59kRonxvGTgigqirV2Vh2/LeQi1Of76uFZ8p5x8gb3BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778112153; c=relaxed/simple;
	bh=RIL+uKE+JKvB9b/wIGnLk/iWkr3FY/lrO2LwsKtCOvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PLiYA5TWnW4ZZ8WjYb1ysyiixL7G0Vj8VpSE0mpeJDoJ8yBlvRjAKCpKZvQbKrEpcJ7qi98rxBActQi39ZK1saofCClFZKqCrzWMAHV3t4uUDWC9ZSee+h6b8Uya6lTnLuwdEpmhfikkZszxh/CJ12//QoRbFk2JULV4v8c+f1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QPj5EecP; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8353ca0f1f1so94298b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 06 May 2026 17:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778112151; x=1778716951; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tw88zLW0m82aJmzaLGMGmwWBNKAe++QmUNLT/L5tpB8=;
        b=QPj5EecPShsdjiiz1CWEOS6NH+rN2SYqe9PJjDV+tiMiqrofdYssVsmzj+VyuFX/Iy
         UmaNYsw5bbPyU5v35BIkUahf9IkblsnJFBNAU3oR42rZ8ngpkInBVW/GYMZYminflwDV
         H5dH9A5H6NiB9RiwYWEl4Q3yZmhpTs4sQtbdn2Z6uQ+voRUB598KFRWLF93xW0Zz5Eul
         4eHWLNbEWAdaeHvv2+u1bHNm45aM/3T91wc+0AGQ/JRzltb7QCG/MTCW7A+fsMakzIF7
         gQNpuynzPbm11fP8wy2a9Mt8UIJps8AAq40tSZokBpdpnV8KIMSBErr2Oet8lniBTLGh
         2uPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778112151; x=1778716951;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tw88zLW0m82aJmzaLGMGmwWBNKAe++QmUNLT/L5tpB8=;
        b=U7vLNMY9nYjuaWOpCMv+Z+BCyyUjmM8ialGKJzA29H5Jbawi/5Sf44uybSQJB5zfk6
         umT3qg7ajAEvjCCUj1XDOYvyPaNp9ZSN5UfsqgIgPYzvjq5cQ1Lp/0t+3DqH+scFVCsR
         CtSfFrQ8eTaiBfe/Q91JZrADiJ/MbXbcAge6d1HprNbASp+TqeDZqtoby5pgToDEjYRQ
         fClPfdrGDabWWvKmfrilgBycRnrXbkL7I2OWq+iM4uvGLB69h69Gr+xj+2pXNU90Qw4Z
         of86KhItdnw4KNJZqIBBSZ42BltJBdKFRwTmTqYMFbgDs9DAT/uiPwS4iVbxCLyHxFyX
         XGog==
X-Gm-Message-State: AOJu0YzQT1lzgcrV+d6k/HJd31en+VwaqvFz4lz4yddi9Dz5qlS3w7zw
	0G9xJxywTZUi+CGgJbJLrJrFN4RQU3RcR9lu5dkZi8k2HNm4nM9ZrDqG
X-Gm-Gg: AeBDiesi7ElzwFUsZrNFO0c8G3NcKxhzgHyyt8IfBJbOMR/KZhmUgSeGMi0BtEWLlto
	PV/f4v+YVemvYCCY2U86e2diTVorNW5uMOkc0S0Qo5aRLBKDm4uKEicFk2j0uILpqyUy7i8Y6KB
	jwtGfdU20LAzrYW3mE0NEMtS9X/DMVn0FDgV8fPhKFZ74/BPK0erriKcEmHkEqP+rXEbwyfWw+T
	eBgxvgVPNnZYMddajmJtm4Yg8aGQLxXUSyyaYdF7CdVpi4An3YN8CJW1UkAwT+Z9ZCcyd4fJeCx
	2t5qczrv6+A9q6EFQsyzdhOqlOJriT9tGRJadM/qOjxvucx2+WVGx3rbahH+vBNPYbritU3W7BW
	Nl/wFwkWlgh9Cjltd+OxN0u9YHusaxp0QkYxgPH23NFPItKpBupUh37goL0w3Gwfx1sEtDRFIUc
	aj0HGKMGG9exlp7YWEY8sCpj5Onm7Dpd1Ki7cROb48uRo+1bEWuJnAbtShAGuSs74I/J/qwmvQH
	QZwyLo=
X-Received: by 2002:a05:6a00:124b:b0:835:35c0:dff3 with SMTP id d2e1a72fcca58-83bb86930f8mr486947b3a.26.1778112150891;
        Wed, 06 May 2026 17:02:30 -0700 (PDT)
Received: from ?IPV6:2402:f000:3:1001:8803:d9da:dac1:4a73? ([2402:f000:3:1001:8803:d9da:dac1:4a73])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f03bsm6748603b3a.9.2026.05.06.17.02.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 17:02:30 -0700 (PDT)
Message-ID: <a8b1086d-467c-4d9c-959a-c11b00d678d7@gmail.com>
Date: Thu, 7 May 2026 08:02:27 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] tools: gpio: use strscpy() for consumer name
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-gpio@vger.kernel.org, brgl@kernel.org, warthog618@gmail.com,
 linux-kernel@vger.kernel.org
References: <20260503190016.13439-1-zxl434815272@gmail.com>
 <20260504075036.12190-1-zxl434815272@gmail.com>
 <20260504134532.0438e390@pumpkin>
Content-Language: en-US
From: 007 <zxl434815272@gmail.com>
In-Reply-To: <20260504134532.0438e390@pumpkin>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3F0614E1A44
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
	TAGGED_FROM(0.00)[bounces-36329-lists,linux-gpio=lfdr.de];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
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
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action

OK, I will check it next time, thanks for the reminder.

Best regards

Zhang Xiaolei


On 5/4/26 20:45, David Laight wrote:
> On Mon,  4 May 2026 15:50:34 +0800
> Zhang Xiaolei <zxl434815272@gmail.com> wrote:
>
>> Replace strcpy() with strscpy() to avoid potential buffer overflow
>> when copying the consumer string.
> You ought to run code before submitting patches.
> This wasn't even compiled.
>
> -- David
>
>> Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
>> ---
>>   tools/gpio/gpio-utils.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
>> index 4096bcd511d1..176bccfcccb0 100644
>> --- a/tools/gpio/gpio-utils.c
>> +++ b/tools/gpio/gpio-utils.c
>> @@ -82,7 +82,7 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
>>   		req.offsets[i] = lines[i];
>>   
>>   	req.config = *config;
>> -	strcpy(req.consumer, consumer);
>> +	strcpy(req.consumer, consumer, sizeof(req.consumer));
>>   	req.num_lines = num_lines;
>>   
>>   	ret = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);

