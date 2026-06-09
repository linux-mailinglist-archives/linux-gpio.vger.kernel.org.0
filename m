Return-Path: <linux-gpio+bounces-38201-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /u81Eg58KGpUFQMAu9opvQ
	(envelope-from <linux-gpio+bounces-38201-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 22:48:14 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D72664222
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 22:48:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=none;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38201-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38201-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0AB49300D7B2
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 20:48:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB69C388895;
	Tue,  9 Jun 2026 20:48:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 509DF1D0DEE
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 20:48:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781038088; cv=none; b=fVOP+sjA45T6M9TgZgkU0bBaQXUlrJr7Wfwg199Aj+nSOZoP3+JPOnkYzJaEBfJCY9snTM+OhQI9uBnjCUMJfTed/rD2udzQuhmFetLJORTS20l++C0igNH8+kooDSYbkyI62BPemzzHbZkON1damf4qvvfFIZBzcvg+n2SX76U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781038088; c=relaxed/simple;
	bh=EkIojasr4cXbtWr5ijvAwh+SxBjfIRnenZmdIfrX/Aw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N3o3JEqjBzuwzHF0wqEusZxhzvTwg40nFAIIgXsZguRZWxJT/8tHE8r6P+2uuTPaIdn052gpUHuXfNZrVGROuz45a6Bz1XnPeIJ+z8PnJ7lEUdEPMcIGyxk88w/Xwc4A5cLbmrs5pDtIDOTsuAQaqDS5WA3s8BdapgaXJv7zPjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reactivated.net; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.54
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-490be29c1c5so76483995e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 13:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781038086; x=1781642886;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oJ/YXPB/iVQYKnH/A0lTAooADjyGEwknQY/Na+W/VMo=;
        b=BD97VCynh0f5jmlDfbfkIBrqkqIWYPnOLbAsEN2+NpZF96SboEZXVMWHKUqURiiHth
         fB4AVg/nHTtNOT9wZAu1mvVdh+zt5cY5ZCvmEo2Loh0has+OL5GQWfN1LDsR1eawQ5b+
         qJyL2C3ewgnYH8QkaPcyMA5zt59QxtLV40TYPPsfgE2TPP2ndmGoYOoqzapDj5eYSndi
         VrQ6RaDeYxntChoR9PQZE/XSiqyxYSW+xjm4y3fvPgk1MGXFLvn3oJXw9A59WctfR3hW
         N57vjt7H8CUP+G1uTg+xqXcWBbAkxOVmRXrNeJJjDKfgyZJWSJYR+Ei0X9/MzmViAK3u
         oDiQ==
X-Gm-Message-State: AOJu0Yyad0iFpL/kyMrCt4bRQpni1HBvIMGxYWIS7z6Hw9WOtSmkxzBX
	fRwBNnL/QwWve0ll88gkimSdkHL3iuY7h7BbJ0Qcx90TNBo8nXY8SHFg
X-Gm-Gg: Acq92OHhKk3K/W3gEEX1XYxAJ7gsod0toDaBAcngRzIO4ysRDVc/m+uFDFBtLmRxz8E
	nGUnWJkpv6wJu7G/qb2s6EWG0o4g/kngcZi3vVdiRZux9OF+TDxDbIRUmwGGcwF/4QLyTrh3GX3
	af95j5u3TT6tFLYndt6iE2PpzEVJvnWZIJ8Wi9h3gj0IA/0XJPT4TNdGpwgX8nkDv4GEHFNTF4j
	QuTsj3kAkIXbHwbJpMApOUsLPPxlouQ5yDqOGmvegXkp9g0EBNEZ8SaV71RzC4qdARQ1AMw/El2
	lvnizLU2X4imJghN1pz8yp9zVzJWQckhic83OUMo1cUYlckbs8mz8C8bJv+EJ8Z51IQS5f42B0l
	7vr+TqZ+BKiWHYX/AaLiD7L0iuKPJNkAwVJiYEiORj2WAFYobZ84fQJ9jK9TPI8qRDMJYzkVw8l
	PeqB8nHrbMPvDZEn9Z5+yntViAjrqeyb/56amd2ZPiE+JomwZioAcDMbEqU+tm0UtkDyb5I0WJC
	+bWt3VR3/vBaRujRai853t8D7SPqnNbSWJIiH4xnA==
X-Received: by 2002:a05:600c:4e45:b0:490:c01a:5f10 with SMTP id 5b1f17b1804b1-490c257f8cdmr363952705e9.15.1781038085472;
        Tue, 09 Jun 2026 13:48:05 -0700 (PDT)
Received: from ?IPV6:2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183? ([2001:8a0:d6cd:9000:86f4:4e71:9fc8:3183])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc3fd502sm509551525e9.11.2026.06.09.13.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 13:48:04 -0700 (PDT)
Message-ID: <b07f5bd8-26f8-4de4-becb-4f76f9d33361@reactivated.net>
Date: Tue, 9 Jun 2026 21:48:03 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] gpiolib: handle gpio-hogs only once
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linusw@kernel.org
References: <20260608210108.36248-1-dan@reactivated.net>
 <CAMRc=MfUd3nwpjgz-87hrpQ9AV6T8_1zwCm+tfYFurkYHKoKTw@mail.gmail.com>
Content-Language: en-US
From: Daniel Drake <dan@reactivated.net>
In-Reply-To: <CAMRc=MfUd3nwpjgz-87hrpQ9AV6T8_1zwCm+tfYFurkYHKoKTw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.46 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38201-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[reactivated.net];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linusw@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dan@reactivated.net,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan@reactivated.net,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,reactivated.net:email,reactivated.net:mid,reactivated.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 44D72664222

On 09/06/2026 13:39, Bartosz Golaszewski wrote:
> On Mon, 8 Jun 2026 23:01:08 +0200, Daniel Drake <dan@reactivated.net> said:
>> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
>> index 1e6dce430dca..b02d711289d0 100644
>> --- a/drivers/gpio/gpiolib.c
>> +++ b/drivers/gpio/gpiolib.c
>> @@ -1031,9 +1031,17 @@ static int gpiochip_hog_lines(struct gpio_chip *gc)
>>   		if (!fwnode_property_present(fwnode, "gpio-hog"))
>>   			continue;
>>
>> +		/* The hog may have been handled by another gpio_chip on the same fwnode */
>> +		if (is_of_node(fwnode) &&
>> +		    of_node_check_flag(to_of_node(fwnode), OF_POPULATED))
>> +			continue;
>> +
>>   		ret = gpiochip_add_hog(gc, fwnode);
>>   		if (ret)
>>   			return ret;
>> +
>> +		if (is_of_node(fwnode))
>> +			of_node_set_flag(to_of_node(fwnode), OF_POPULATED);
> 
> Sashiko correctly points out that on errors, the state will be corrupted. We
> could maybe move the clearing of the flag to gpiochip_free_hogs() and track its
> state when processing fwnodes in order not to clear it incorrectly?

I guess you are referring to:

> Does setting OF_POPULATED here cause state corruption if a secondary chip on a
> shared node fails to probe?
> When multiple gpio_chip instances share a device node, the first chip processes
> its hogs and sets OF_POPULATED. If a subsequent chip fails probe (for example,
> returning -EPROBE_DEFER), its cleanup path calls of_gpiochip_remove() which
> clears the flag for all hogs.
> If the flag is unconditionally cleared, will the deferred chip attempt to
> process the first chip's hogs on retry, fail due to a mismatch, and
> permanently abort probe?


I don't think this is actually an issue. If we have two gpio_chips 
sharing a device node, a first one with a hog that probes fine and a 
subsequent one that fails during probe, both of the gpio_chips will 
brought down and the flag is cleared. If it was a EPROBE_DEFER case 
which is then retried later, the first chip's hogs will be set up a 2nd 
time when the probe is retried.

It is true that the teardown of the 2nd gpio_chip would erase the 
OF_POPULATED flag of a gpio-hog node that it does not "own", but the 
first gpio_chip would also be torn down at the same time (and 
OF_POPULATED unset a 2nd time). This is not ideal, but harmless as far 
as I can see.

I don't quite follow the suggestion for doing the clearing better in 
gpiochip_free_hogs(). It would be neat if we could go from a hogged 
gpio_desc back to the fwnode, so that we could only unset OF_POPULATED 
on the fwnode at the point when we are really removing the hog, but I 
don't see a way to derive the gpio-hog fwnode from gpio_desc. Also, this 
would be complicated because one gpio-hog node can hog multiple gpios.

Let me know if I'm missing anything or if you have any preference to 
handle this differently!

Thanks
Daniel


