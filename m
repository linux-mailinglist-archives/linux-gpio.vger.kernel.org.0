Return-Path: <linux-gpio+bounces-31023-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UCcTFq/Fc2kpygAAu9opvQ
	(envelope-from <linux-gpio+bounces-31023-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 20:02:07 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B4979EF2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 20:02:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E8443303295D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 19:01:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E7961DA628;
	Fri, 23 Jan 2026 19:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="c3quSrMp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vs1-f98.google.com (mail-vs1-f98.google.com [209.85.217.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF09F246778
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 19:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769194906; cv=none; b=M8uvstmhdtr0yWNOAlS1c+xkg2lJtmU66zaox6uM8dREIf/Il1pc6f4Kh/i7zR66gWFXkos380zLRgucDwOYERaS9gcJ8TQrJa4Ce8HvVciUlD0BgKc7DBnKTdo2yup8yjL8pHJn2p7VH2wPN5f0PEqXgiDqsYrJDJ48POV1W9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769194906; c=relaxed/simple;
	bh=5ehmAwSnBuoLdoJk3P5h3xy0mm9XgalyzfCH5yFeZtY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=IlzhUU1DKAQhPxVJfNjZ88MRkaLMfzy1i+z1mauCh/ItOSk8s/NmMXp4z+Ua31RGsTBoZWvM/U71zHNP6QoiZ6qcelz8wXyC7oN3WZMGWZRspxG+KW92J77oGjK76bLUSQ8z5OQYRQCFr8cPAR4Bbgo/i+G76tHOzzQTcitPoK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=c3quSrMp; arc=none smtp.client-ip=209.85.217.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-vs1-f98.google.com with SMTP id ada2fe7eead31-5f52ed75c45so1976267137.2
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 11:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769194904; x=1769799704;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cT5TBo/dI90+wcDSKNtZ1iy//ljekx3o3pFpFS1CjKM=;
        b=QJPGZHLbG1HPJU16w524Cdob5mfU84VSSoYtXQ9aXcqdpmhxcdNMT4xlMA46UPF5Ld
         p/lU41tN/3Kbzy4Z7R2cut41UqfUuaDVfUTCp00lScrNVhBKayG94OKGneB6ODF86Uwv
         7GvODZWI9/ezRWoNeJNsN9/1+Q4ZPyoTnzsdx8NdST3T6URRtc/L1tmN6NNVO7PSMoH0
         aQ2A/lFkYl13MAyEnBiE7Ht4YmPM7ktII5dXwrNGoz306czU4Kz6FzntK4C0dZFEJknV
         yXrc9QMl5viX4Ddfh1qpTqDwz+QhcR4JIvbKW4/3y1+EgVWXpAnsEvYsqbN1TkVyG57U
         QHTw==
X-Forwarded-Encrypted: i=1; AJvYcCV+tgcJySXyWntB16Az1Mg5VzEQLzvmXJdxIh9KbwzTDQfzVnzuP+ui46dynA2rKp/DYlhylpYnHn0b@vger.kernel.org
X-Gm-Message-State: AOJu0YymtGX0i7C11mz5kxYitaHCcfpLMTIoYtFAn8teFM7KrrsW5OIm
	Em0isYk66+1bOF6RWQIWDtA1g+6pt/WoZbfoAdOoXSftIpFVDAElltbbYUaeS3YZOEz30AlAiWk
	9cV7j3EF/OrRpc8wwY7bz3q2+PvWsiIzSUIF50KylQ5HgOigQ3XMXPIjSSqtuw2yXDtl7GbXVY2
	qV4IqRSHtEvVr7Y7rGawQsoTibZ3b5rhvtD9pwg+WPwi3+FrOguoWk1jkdPoeVCTZGHBy2br/uA
	hNFJUFg/JmbEdH9s1CwVw==
X-Gm-Gg: AZuq6aIp4mQxK07vcY2BFdyLFcWT3yPxJ3upNBu23FQmC82dOL6PdERr1k2DOlR3now
	wdi60u9R5PdJmKonIiSVCLZYGnQgO5gG8Xh5ZtucgvTGHTIArYgIXlsuOlR6jzgHV+m9IChOsMm
	x5EdGOE1aWXzMm1RHqdvx4KGsG/4ECtXJblO2En7JuAUccUo5x3keyXTXW6l2N9Zk3JqBsjDzLk
	QleE3X8nwYuARV457wMQnLaJIDW7hh8On0HLJWmmMGocav4R0AHO1pywt/DBuH5mrLjGcb+zhSB
	UsYvy0/ZN06ML3KpMCWq5ctVgax3zWlREptIK9CeUjgpp10ZTp3QJk3ZnP1c/9gRWrUVn1Rm7Fn
	0LrRKAHsOTBII8r42LhD/XVR4y1E8H+P3X8fTDeTlosHvNkv3f0yfdTsfT7YHhKXFHiUdy+Ka1f
	1D77v/cFwXTdkJRLkOp5JQ8vVpriA2cwenqx1bQz0pSEbI2QAOzApX
X-Received: by 2002:a05:6102:3594:b0:5f5:46f8:466f with SMTP id ada2fe7eead31-5f54bb459f2mr1366719137.17.1769194903591;
        Fri, 23 Jan 2026 11:01:43 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id ada2fe7eead31-5f54d650df5sm381582137.5.2026.01.23.11.01.42
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Jan 2026 11:01:43 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-123349958b2so1934516c88.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 11:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769194902; x=1769799702; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=cT5TBo/dI90+wcDSKNtZ1iy//ljekx3o3pFpFS1CjKM=;
        b=c3quSrMpTEoEEfNzmkG3iTxzlV+JoxO7swW+QeMztEMjpN1KSyNtTdqZIHxs17gHGH
         5M9nEQ5sdofTHUPBaYBm9zs6nK311GYRUQwKUZjyGDURVuFiB8Bqqv28vtglNl7pM1jq
         PrRB8ZAcClVb4mFy62DAPT2AXPbO/x0ZnuSfs=
X-Forwarded-Encrypted: i=1; AJvYcCU+hFS7k+Rt07ZgRMUmMbzTm5TyWzGj/XaQtm25/gSI52WpEV2gTGTPbcGQAz9zm9nwfdijlPgLGtTQ@vger.kernel.org
X-Received: by 2002:a05:7022:248c:b0:11b:2de8:6271 with SMTP id a92af1059eb24-1247dc0b07emr1814341c88.39.1769194901680;
        Fri, 23 Jan 2026 11:01:41 -0800 (PST)
X-Received: by 2002:a05:7022:248c:b0:11b:2de8:6271 with SMTP id a92af1059eb24-1247dc0b07emr1814325c88.39.1769194900947;
        Fri, 23 Jan 2026 11:01:40 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d91ca0fsm5379709c88.8.2026.01.23.11.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Jan 2026 11:01:39 -0800 (PST)
Message-ID: <ad346f69-c2f1-4319-ad59-cadbf2554322@broadcom.com>
Date: Fri, 23 Jan 2026 11:01:37 -0800
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
 <ba9005ab-f757-4018-96ed-a10bcef08165@broadcom.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <ba9005ab-f757-4018-96ed-a10bcef08165@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31023-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:email,broadcom.com:dkim,broadcom.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-0.986];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E2B4979EF2
X-Rspamd-Action: no action

On 1/22/26 11:26, Florian Fainelli wrote:
> 
> 
> On 1/22/2026 11:17 AM, Florian Fainelli wrote:
>>
>>
>> On 1/21/2026 11:36 PM, Andy Shevchenko wrote:
>>> On Thu, Jan 22, 2026 at 3:06 AM Florian Fainelli
>>> <florian.fainelli@broadcom.com> wrote:
>>>>
>>>> From: Doug Berger <opendmb@gmail.com>
>>>>
>>>> The irq_mask_ack operation is slightly more efficient than doing
>>>> irq_mask and irq_ack separately.
>>>
>>> I would refer to the callbacks as
>>>
>>> .irq_mask()
>>> .irq_ack()
>>>
>>> et cetera.
>>
>> Ack.
>>
>>>
>>>> More importantly for this driver it bypasses the check of
>>>> irqd_irq_masked ensuring a previously masked but still active
>>>> interrupt gets remasked if unmasked at the hardware level. This
>>>> allows the driver to more efficiently unmask the wake capable
>>>> interrupts when quiescing without needing to enable the irqs
>>>> individually to clear the irqd_irq_masked state.
>>>
>>> ...
>>>
>>>> -// Copyright (C) 2015-2017 Broadcom
>>>> +// Copyright (C) 2015-2026 Broadcom
>>>
>>> Shouldn't it be rather 2015-2017,2026 ? (In one case when I updated a
>>> driver for Intel, I went via Git history to gather the info.)
>>
>> Ack.
>>
>>>
>>> ...
>>>
>>>>   static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
>>>> -               unsigned int hwirq, bool enable)
>>>> +               unsigned int hwirq, bool enable, bool ack)
>>>
>>> This type of interface is usually discouraged as it makes code harder
>>> to read and follow. Since there are a lot of duplication, I recommend
>>> to move the ack op to a separate helper.
>>
>> Good point, knowing the order and what set in those parameters can be 
>> confusing.
>>
>>>
>>> ...
>>>
>>>> -       gpio_generic_write_reg(&bank->chip,
>>>> -                              priv->reg_base + GIO_MASK(bank->id), 
>>>> imask);
>>>> +       if (ack)
>>>> +               gpio_generic_write_reg(&bank->chip,
>>>> +                                      priv->reg_base + 
>>>> GIO_MASK(bank->id),
>>>> +                                      imask);
>>>
>>> Id est this piece...
>>>
>>>
>>>
>>>> +static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
>>>> +{
>>>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>>>> +       struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
>>>> +
>>>> +       brcmstb_gpio_set_imask(bank, d->hwirq, false, true);
>>>
>>> ...and call it here explicitly (seems the only place for it, so it can
>>> even be just moved here without an intermediate helper).
> 
> Actually we need it to be part of brcmsftb_gpio_set_imask() because this 
> is where the guard(gpio_generic_lock_irqsave) resides. I can't really 
> see a better alternative, short of create two implementations: of 
> brcmstb_gpio_set_imask() and brcmstb_gpio_set_imask_ack() which does not 
> feel any better than the proposed patch.

Or creating yet another set of intermediary helpers that are not 
including the locking, and then using them in places where the locking 
needs to be used, yes, that's probably the cleanest, let me do that.
-- 
Florian

