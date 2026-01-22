Return-Path: <linux-gpio+bounces-30953-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK/IKRF6cmlSlQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30953-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 20:27:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A146D024
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 20:27:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9E338300827C
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 19:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B6335D60F;
	Thu, 22 Jan 2026 19:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FkLnFaM+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4878338BDAB
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 19:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769110029; cv=none; b=QLNbeGPZSXjyxTuMRvKW1WHR/lBMXxNwoKKCg5EyCV6JoiWqvNnvMb/Jvqr/PPJ+n/5IzmAsGjCl0j6b5GY6w4c33hj8rGP3kYRtDdhaoGJNuzhnJ2BNc8TvzJhqiPWwDCnT4naWhYHGWktWTtJFHmgvp5bCqFVVa+7u7hAjhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769110029; c=relaxed/simple;
	bh=Nw/nInipLCUu+jLQhKIbrMH/RHjA+u5/sde1eZX0c6M=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=C42E7YaRImIW97nGa5WrtgWvf9FI4z775CLyPFg03sX2dgI4asDda8qhVsgHg5pcwDxwQCAgEqoHbqXZMpQpZYFtNFLQTzHjd2xBFPY8pGTyyW3471TI8JtrzzgO7OgXq5CdNIP3sRbU6tSNtYbSdoIhBemsZFlQiGyc2I5TCLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FkLnFaM+; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-82310b74496so357675b3a.3
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 11:26:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769110015; x=1769714815;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4UUagfqRa3jCP2fBiA3Ur8fXwirA3RKoOMc660AuSI0=;
        b=K1M7kwLXF3h0jXCvhmcQ94B4Z02RuAA+EeecCCv69BhJhiJngMT4pbmwZN0br1Wcgi
         Qa4oxF0z6qLXzZHKsRmoSIRQcjadVcIgGTs654TtwDoD1myWk+qasNItLIEUytFW/x3D
         mDqnVT9U3Vtha0tQRXdX6NEDffkYd3LM3CSeddJ0yVH1ozL/lBX4uTo9bbQHsCQF/ZGu
         AKcTk1mTbPZo1RCl97XEMZnseNEykcPIteR+5iPjfOgjsfIwmeKK6RJpt617rAJobW09
         OOFQVhVnhOorrj2iBUA65/2avEjYNDHW/WGBa7dG+b9uHPnH0eL06x4W3mHcTBpiQQ/X
         KFUw==
X-Forwarded-Encrypted: i=1; AJvYcCUH7wJ2QsewX+jc3cNwbd9CO99itkw4xMx5YOKXoWH3r9rJO9cwHhMOUpd6avtxYZH8MvrkeobbWIxE@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx8DIrOheY2ebLYG/v+wgyR/PKgtFirbFglmAaQYvPxJeFemZG
	5SWS8/yJnOb5xqykq7F8B7ph4USmibEPpkUlT4XdZHsZV3v7K3wh2/zffo/p0+KEK/yosOimlQm
	sGYQRoWo1TfrpBWDmR9OGIMfjN+Uhs681C7HNMcq8R9FirhC0+vgFI8lr5uHYD603AHQt1ay03Z
	PECLzh47OFjCm5PzRW63SCy342CEDVUu4YpDFGUMWV7Rqd0GDqPK+PYvax673Lpau7Ynyy+S/IY
	1sOQHQ44UJvS9RjpkNfVQ==
X-Gm-Gg: AZuq6aJGB2mVzEdiyQ+/sJQi2sWw80wIdNIlnJzWvfC6wlyuk9GV2TpKSmZZpW7wpmc
	0bU7zfOTGnlbrRrnPLnJ24TZD3xUqXlg95XPC0mrqw0HXj2osP53u0O7SrMIwoE0IlRYkXFd8O3
	zSq1XJdWoNRNVoHS5Bm5KxxABzKIOlGKSbRqWGUBiLN5qVk9jKEtnv4hehP+XG3Su0vZAphsYNC
	ajfzDdcQpvQY4fQCysSYNkMQca5BV0z+Wvc4vOdv+JLR2owbc1RRKSF5iCeucpBaU5D+q+cMtqx
	Li5p1S9ycWfWnda4A6SsGPUuCmI/XYAXq1xfvl8XD7m0YtPK/40zKRB+HHGPx5txkAGaKP/mScs
	W5XeKSg0mFxULLNiW4JIetJvKSr6lzEekoBHkObw1I+tC4PJpkequGMEZvcJuCZgzF/nt5w/VNT
	0Rw6h86aUhif0DbmfWIyScktMwymjuPI8qNnPhtng3XhatkmGJldrr
X-Received: by 2002:a05:6a00:2d91:b0:821:81aa:ae3 with SMTP id d2e1a72fcca58-82317e7dbabmr328848b3a.68.1769110015077;
        Thu, 22 Jan 2026 11:26:55 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-8231854a66csm24060b3a.3.2026.01.22.11.26.54
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:26:55 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11b9786fb51so7957419c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 11:26:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769110013; x=1769714813; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4UUagfqRa3jCP2fBiA3Ur8fXwirA3RKoOMc660AuSI0=;
        b=FkLnFaM+HuJCu9z3g8mqel4eNLXCnfzKOtM2RDb8vLOYW+rIRxF29ZR33yuJv9ZRBb
         U4kdloWC46HvaZMW/Wtaksb40xuMTUMoaYNK+qsqRZcL1qvitN1P8wFw7SKM/S3NdPH3
         jgluJc+aORb63pZDuGCKxpQ6honPCMX+uPnTk=
X-Forwarded-Encrypted: i=1; AJvYcCWhEVO9BJilDWxv6+qVXCKqe5tz8S0ROuPcCaehdY4p366Z1ugVDql9Xl5ailxruQ2JYfz3TilJ0/QD@vger.kernel.org
X-Received: by 2002:a05:7022:438e:b0:11d:fc72:e17f with SMTP id a92af1059eb24-1247dbbba5bmr270190c88.18.1769110013230;
        Thu, 22 Jan 2026 11:26:53 -0800 (PST)
X-Received: by 2002:a05:7022:438e:b0:11d:fc72:e17f with SMTP id a92af1059eb24-1247dbbba5bmr270169c88.18.1769110012532;
        Thu, 22 Jan 2026 11:26:52 -0800 (PST)
Received: from [10.63.25.133] ([12.75.221.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90ce0dsm597516c88.4.2026.01.22.11.26.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:26:51 -0800 (PST)
Message-ID: <ba9005ab-f757-4018-96ed-a10bcef08165@broadcom.com>
Date: Thu, 22 Jan 2026 11:26:47 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: brcmstb: implement irq_mask_ack
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy
 <chleroy@kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20260122010516.1200630-1-florian.fainelli@broadcom.com>
 <20260122010516.1200630-3-florian.fainelli@broadcom.com>
 <CAHp75Vc=ejHPwA05MHBxJQdJWv49pcuTNax0VikXruvwVM+Y9A@mail.gmail.com>
 <cb4ef2ed-ba94-4475-b02a-5b6e39943e81@broadcom.com>
Content-Language: en-US
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <cb4ef2ed-ba94-4475-b02a-5b6e39943e81@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30953-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.983];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 44A146D024
X-Rspamd-Action: no action



On 1/22/2026 11:17 AM, Florian Fainelli wrote:
> 
> 
> On 1/21/2026 11:36 PM, Andy Shevchenko wrote:
>> On Thu, Jan 22, 2026 at 3:06 AM Florian Fainelli
>> <florian.fainelli@broadcom.com> wrote:
>>>
>>> From: Doug Berger <opendmb@gmail.com>
>>>
>>> The irq_mask_ack operation is slightly more efficient than doing
>>> irq_mask and irq_ack separately.
>>
>> I would refer to the callbacks as
>>
>> .irq_mask()
>> .irq_ack()
>>
>> et cetera.
> 
> Ack.
> 
>>
>>> More importantly for this driver it bypasses the check of
>>> irqd_irq_masked ensuring a previously masked but still active
>>> interrupt gets remasked if unmasked at the hardware level. This
>>> allows the driver to more efficiently unmask the wake capable
>>> interrupts when quiescing without needing to enable the irqs
>>> individually to clear the irqd_irq_masked state.
>>
>> ...
>>
>>> -// Copyright (C) 2015-2017 Broadcom
>>> +// Copyright (C) 2015-2026 Broadcom
>>
>> Shouldn't it be rather 2015-2017,2026 ? (In one case when I updated a
>> driver for Intel, I went via Git history to gather the info.)
> 
> Ack.
> 
>>
>> ...
>>
>>>   static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
>>> -               unsigned int hwirq, bool enable)
>>> +               unsigned int hwirq, bool enable, bool ack)
>>
>> This type of interface is usually discouraged as it makes code harder
>> to read and follow. Since there are a lot of duplication, I recommend
>> to move the ack op to a separate helper.
> 
> Good point, knowing the order and what set in those parameters can be 
> confusing.
> 
>>
>> ...
>>
>>> -       gpio_generic_write_reg(&bank->chip,
>>> -                              priv->reg_base + GIO_MASK(bank->id), 
>>> imask);
>>> +       if (ack)
>>> +               gpio_generic_write_reg(&bank->chip,
>>> +                                      priv->reg_base + 
>>> GIO_MASK(bank->id),
>>> +                                      imask);
>>
>> Id est this piece...
>>
>>
>>
>>> +static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
>>> +{
>>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>> +       struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
>>> +
>>> +       brcmstb_gpio_set_imask(bank, d->hwirq, false, true);
>>
>> ...and call it here explicitly (seems the only place for it, so it can
>> even be just moved here without an intermediate helper).

Actually we need it to be part of brcmsftb_gpio_set_imask() because this 
is where the guard(gpio_generic_lock_irqsave) resides. I can't really 
see a better alternative, short of create two implementations: of 
brcmstb_gpio_set_imask() and brcmstb_gpio_set_imask_ack() which does not 
feel any better than the proposed patch.
--
Florian


