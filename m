Return-Path: <linux-gpio+bounces-26912-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 006CCBC5662
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 16:11:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0FD093E543C
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 14:11:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D435928FA91;
	Wed,  8 Oct 2025 14:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kigDg2DB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0474C292938
	for <linux-gpio@vger.kernel.org>; Wed,  8 Oct 2025 14:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759932704; cv=none; b=eXH4g5gaD9nRfOIcy3CQprAGDaPJCm9KPrUnnjV3JT1Vl4e5olpmPaN8/7Xom+qnGsDyCCVm8OXJ/GqUZgSgB+agYAxZyzJkqdK0tvRh1+CRujlkwdFt/qvWZCAjNLJ2BK/alH2Ji3tfL9fMymXBjTV2MacArCEOkauiqPFXW4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759932704; c=relaxed/simple;
	bh=xEKgBPD2FWJYrAHF8UNcbIBXhsA+Ha6n0qDTzhc6Ox0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TXFf/62kzaIIgZ/CMl1f9/qE/jrgIZSK1geaVb+QJEMR3WlxlAO3yA0bwlolT9/VJB1elaFNkP6uJc3NRrbq/tc8Gg60Qa3WF9dgRtwdnRi4XyCbrvnugQycm8znJQN5l68Beg4q7DY9FNqvRHW2eZlqckcNP36zBhWnClvNo9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kigDg2DB; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-28e8c5d64d8so73515835ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 08 Oct 2025 07:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759932702; x=1760537502; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GmmBQDP6IlpQ0XMPGEd9567yGOXHE3IaykdAbxwNyhA=;
        b=kigDg2DBkXk+CGSiIy8kor23P68VgnlSzMT3R4Yb//7BLgbrOhY8ULMPgn4wfYe6Px
         gV/4i0DOiQYok1Pn4/bGY+k3gC/rB43O5LwhrPLfc+8Y7Kmu54FR6+jdtkWUUPZBNp/a
         +/ql065nN7ktnAdXcc9SKcWyFBr229Snc3H5j+aykJSibr03zpc7YKiOVZ7z3wCHCFL5
         hCcHSma2Awm/0ScxkNVH0Up0whCnDoktYTIiSPANkmBxOS2+ZE+3eyZTXWAHtghFZP3j
         QCivJPi1GJZbE1PFzrs+DkK2bR4Xmc4YmOUaEU8CDp7d0VyTtBasFfen3hGLqa+faf/H
         7BIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759932702; x=1760537502;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GmmBQDP6IlpQ0XMPGEd9567yGOXHE3IaykdAbxwNyhA=;
        b=T6zNNLWIMsynZUW4zsb/HI+8AWL438a3Jlziml1E9u7cDqZzo8u+xf1/rtusPP3ZpN
         mEkh0u9x3iQ7EcWmpokeZ9f3IiB7F7GVHr+mjIGChA6BUB3UJ0LCDZtlaMybxlKxyNO6
         25AvNWMoygdpVuhvUNx95q+V/BcDBIoIq9cxoJJCg0JVLLRr/XlXU06yIEhypZq6Mf1A
         WzzhvPThahR1Xa/WJRtVTSTetH8BW0tKswtH7CCDXF905cOkuzT+XxaO1brCiPJMmiwM
         U4rU2I5A+5HnMeIfGlYv4Op1l55BkDU+u/0o/OVBkk7ALA1Q8quny0z4ocSeM611k5FD
         lr0g==
X-Forwarded-Encrypted: i=1; AJvYcCWOOOpAxhfoAZFciJnWuhRh9+R2zvmt186wfyE7mUsadjCA79kn609o2UEdqheewTZ/TqHIQQWZBucZ@vger.kernel.org
X-Gm-Message-State: AOJu0YwuiuxmdWrpYCC3wpS9zILCyi1OEtEYiRO8x8jeHs68eOqhFfkv
	+wLw8nGdI3wOHzwkR84CHMl0SDB9m6+Yap20+NDBHVAgy6NryFQlyWN8
X-Gm-Gg: ASbGncsWNoaj9KRPnWdGxCZNxVZKCLeci4yDxjkFKER87QrvEWidy2gJaqGqDli/0Sc
	8X3wz79LWaOpg7Fgmihx+xzEY4O/4xJINULreEJM0oZstAluLws/UjyYYfUSDcb2oz7s3yEu+1M
	AM+zpeiZUscR4+NQfE66gzsHbjo33S5CsblI8ujaHsnzi9LrYRKLObUpVP6NpAAFSrzURbUeqh2
	8hfOhDihbXFzs973SoqxTl7xBIV7VN6FGQT01PebmkEV/lC/sNoHThFKFwxH0Do8WFd62jpgU5m
	cj2OJGFvR7KhaM+fYe2uHGrccNkf4Z6CamsP1/u+fx1wp8AbsZufIBamdBCpahDF2ea8n7BAjp4
	YHwvhJyKM7Db5HVlz8RjNqTAlS1jh/c2yx9HhWBnzSwYBrj8KiMCa51ucHTjEWUjp8fHSbHJhhY
	BPZpCgzoX7m5rZWK5q7F4=
X-Google-Smtp-Source: AGHT+IEUaMAzqydQUY7rcmYcdJN2KeSU5DyaMA7BL5qXKmBA78miWwo0IcVrvLF3lUiIlIQkFHAieQ==
X-Received: by 2002:a17:903:11cf:b0:252:50ad:4e6f with SMTP id d9443c01a7336-2902741d0bdmr42254705ad.54.1759932702237;
        Wed, 08 Oct 2025 07:11:42 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1ba024sm199838995ad.68.2025.10.08.07.11.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 07:11:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9312235a-b051-48fb-985d-be2b1d3c7c1b@roeck-us.net>
Date: Wed, 8 Oct 2025 07:11:39 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
To: =?UTF-8?Q?Nuno_S=C3=A1?= <noname.nuno@gmail.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jean Delvare <jdelvare@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
References: <20250903-ltc4283-support-v2-0-6bce091510bf@analog.com>
 <20250903-ltc4283-support-v2-2-6bce091510bf@analog.com>
 <742fe9b5-bc53-45f2-a5f1-d086a0c9dd1c@roeck-us.net>
 <0765a0b89779331c62a3f136ef030f7f2f40ea47.camel@gmail.com>
 <0ce54816-2f00-4682-8fde-182950c500b9@roeck-us.net>
 <35733a7a33301330260c01b1e59af904c8c4da6b.camel@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <35733a7a33301330260c01b1e59af904c8c4da6b.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/8/25 06:07, Nuno Sá wrote:
> On Sat, 2025-09-13 at 04:02 -0700, Guenter Roeck wrote:
>> On Fri, Sep 12, 2025 at 03:00:22PM +0100, Nuno Sá wrote:
>> ...
>>>
>>> i2cdump -y -r 0x41-0x79 1 0x15 w
>>>       0,8  1,9  2,a  3,b  4,c  5,d  6,e  7,f
>>> 40:      b004 0000 b00c a03e a03e a03e 2501
>>> 48: 0000 1a03 e07f e07f f07f e07f e07f e07f
>>> 50: e07f e07f e07f e07f e07f e07f 0000 0000
>>> 58: 0000 7002 7002 7002 b07e b07e b07e a030
>>> 60: 9030 a030 0000 0000 802f 1000 1000 f0ff
>>> 68: a004 a004 0014 a004 a004 c004 0000 0000
>>> 70: 0000 0000 0000 0000 0000 0000 0000 0000
>>> 78: 0000 0000
>>>
>> Thanks - this should do. Note that I am traveling and will be away from my
>> systems until September 25, so I'll only be able to look into this further
>> after I am back.
>>
>> Guenter
> 
> Hi Guenter,
> 
> I was planning in letting merge window to come to an end but I might just ask
> now. Have you forgotten about this one or do you want me to send v3 with the
> superficial review and then you go deeper on v3?
> 

I have not forgotten it, I just ran out of time. Sorry, I do have a paid
job :-(.

Guenter


