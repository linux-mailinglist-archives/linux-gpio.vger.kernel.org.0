Return-Path: <linux-gpio+bounces-30950-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CzGMNp3cmn3lAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30950-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 20:17:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDF36CF3E
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 20:17:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D19ED30041CE
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 19:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38BAB36EAAD;
	Thu, 22 Jan 2026 19:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UPQO33jy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f228.google.com (mail-qk1-f228.google.com [209.85.222.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCE535D60C
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 19:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769109461; cv=none; b=QyYPGhHBo9iWukwp2AUQWHLqJXMQXQRqmgWQLb9IzCO/dnyFMTrOi1OFpd7+ffYfv8MvJUBWAVevCamW1s0MYL5+Q5svI1W5txYbZR/sFSFuKuHefD5FZEYYohnHq8qUE/kxtOhhkDalx0Kx7zXGGBZGxNK8HdpgFjrMyMm7WDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769109461; c=relaxed/simple;
	bh=tEPT05n2Q9wBV7F2HsYew34a4H/4RFfQ3k0++weScEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CJ3jp93BKt3AaInpb/0bB5XvuyQz0CjflvJrFKqCemXr61r3XBNulB9RvJs2c1H+YChOsbIDQA5nfoYfRHDvPa4Nlg2l/+k2/666LfOeEl23P41BZJoY3d03FhK8y7yDR9tbNAVpFeLMCmLS9AGjNnB9piJxPqWun4AyPchcZ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UPQO33jy; arc=none smtp.client-ip=209.85.222.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f228.google.com with SMTP id af79cd13be357-8c537b9fcbfso131936385a.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 11:17:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769109451; x=1769714251;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=71tizYyQqK+qEeiQ91p1bi+H6ziLWzyeylLQFrcF44E=;
        b=Yi3BpfVvVw8cU5GkN4GwiRxrNqKhEqtbovP/oAlMI9BDE/RFzV2yjxLk1liHLRYPUA
         PUAhrNFEvM/IH75qR55UtMZT+GaDBjYiagBqvF4ji49vZsqESPIBSn0F5SY+BhvCjoi6
         nQGFW9rsPKR3m05C/2dLHodovAN3vWE/iN1i7R3q/Pgy87zJts3q8dH7MWRosdDQm2eK
         VuTuFcE3mbbn1d9qwZ3s2oKJYTlsjaM5ZcKR36sV0L6Q1genVIYrjUtqGjCKPZc4rtAt
         Xh9eStJJo+iluZqZPtgCGuJBFcIo+v8i8NmLreOeCj3RlvziJX+KIbMcgUiswEa/wwPZ
         jtbg==
X-Forwarded-Encrypted: i=1; AJvYcCW3G7+IDyAcs02w944JHnliqA7Yl0NGz/a7A5SZ5d0hSO2wnFpdgeUfFP82cv2EoQFA9N2sPLqT9jgF@vger.kernel.org
X-Gm-Message-State: AOJu0YylN3uSDV8QJPvrsiguUXdYTYas0vsb3LkbSUTL8RzhypdvFONN
	guRlt+99++wzBO1GTVyRFRjjqMrcnBfGYofkA+piMtbIns/B+n1ljTWEbxeUvKkzaRXBqjfijxK
	CdhIe4Cfael1BWg1CJ9PQE5IvzWKgI3eiqy5IdaaKAICiecYOSo3daj8LheaCn7/EXmHDNzFt/c
	+S238WzSRrnNmMHpbfcT2z3ctxUXdh/iRnusMwmdpO2OW0PTESeBgXDls0sYnvMLK4QSSLVBCIM
	Xq2aoXT1m0DVvAhXARZXg==
X-Gm-Gg: AZuq6aKKPwMTfTWw6nseLYleu+r/w9W4prxMtDjhRiLmaGBrNYwLs8NE6TNH1wB2ipZ
	CS63wURFyQtPg+4cvnO3E5n2pN6UTgijOHKOntVI2jV39zqeNoXf46Fa2eACenVy6EwEMtXJmDF
	nXJ7gX0hbHnqVpn4fVY5BblRBVKkLlC73H/2HxgLdBGmvFw5XBy1DRQgil+NedIDnJRl2HvXt/W
	jm0sLYsh3q16jsT3ZfYk7fA9pvePzqYi7m+Qu9JSI6ATmRQ/zdxSatC6V7s8/TVCyzBHbNz/dCq
	ejEpG/od+RVYu2xaWoFU9T+6JMZ/N39oqzS6mS55cqrmeJ4NKOjB5ZVqYBzN94llVSP4lSTR06Q
	mzJ1G+hTAN4fKhSidVJDa8iyduIW0aHQJ+RcsjdD4IiaqFiAEkfJawtTsSqNzo10bNgbV4Z9IoT
	JiarXJALkPMr5vjRg1s0WZugh0W02YJJ5r4Lj5FTfLbtrJhTMEfqWI
X-Received: by 2002:a05:620a:4045:b0:8c6:a64e:f66a with SMTP id af79cd13be357-8c6da8ceeb6mr538990985a.21.1769109451273;
        Thu, 22 Jan 2026 11:17:31 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-118.dlp.protect.broadcom.com. [144.49.247.118])
        by smtp-relay.gmail.com with ESMTPS id 6a1803df08f44-89491821be1sm143066d6.11.2026.01.22.11.17.31
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:17:31 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-12335cfaf90so279318c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 11:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769109450; x=1769714250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=71tizYyQqK+qEeiQ91p1bi+H6ziLWzyeylLQFrcF44E=;
        b=UPQO33jyy3q6o7BKpemSBUGHpey2MiHB4W8PqlANAwGgQ6HqNr51b84chpe8nXrAz3
         iB6gksIflS1ye23SRDVOc4ruIg/pYIaMBViOe82/0BV8KCcejkomuf/V/Qul+JP0A2wV
         Q8al2U4yCghBVAAjTURSLIkU2wDMVLeMQP59w=
X-Forwarded-Encrypted: i=1; AJvYcCWujUbcnHwwX+W2LRkIo+aJyWEt3YaoVvWspa6UQQeCD/DQ62s1PRdr1xj42ZLu+/CxAxZ2Mg9feblO@vger.kernel.org
X-Received: by 2002:a05:7022:613:b0:11b:c86b:3870 with SMTP id a92af1059eb24-1247d74215cmr260414c88.4.1769109449826;
        Thu, 22 Jan 2026 11:17:29 -0800 (PST)
X-Received: by 2002:a05:7022:613:b0:11b:c86b:3870 with SMTP id a92af1059eb24-1247d74215cmr260397c88.4.1769109449292;
        Thu, 22 Jan 2026 11:17:29 -0800 (PST)
Received: from [10.63.25.133] ([12.75.221.34])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d997f7bsm611297c88.11.2026.01.22.11.17.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:17:28 -0800 (PST)
Message-ID: <cb4ef2ed-ba94-4475-b02a-5b6e39943e81@broadcom.com>
Date: Thu, 22 Jan 2026 11:17:24 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] gpio: brcmstb: implement irq_mask_ack
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
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
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
In-Reply-To: <CAHp75Vc=ejHPwA05MHBxJQdJWv49pcuTNax0VikXruvwVM+Y9A@mail.gmail.com>
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
	TAGGED_FROM(0.00)[bounces-30950-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,broadcom.com:email,broadcom.com:dkim,broadcom.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6CDF36CF3E
X-Rspamd-Action: no action



On 1/21/2026 11:36 PM, Andy Shevchenko wrote:
> On Thu, Jan 22, 2026 at 3:06 AM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>>
>> From: Doug Berger <opendmb@gmail.com>
>>
>> The irq_mask_ack operation is slightly more efficient than doing
>> irq_mask and irq_ack separately.
> 
> I would refer to the callbacks as
> 
> .irq_mask()
> .irq_ack()
> 
> et cetera.

Ack.

> 
>> More importantly for this driver it bypasses the check of
>> irqd_irq_masked ensuring a previously masked but still active
>> interrupt gets remasked if unmasked at the hardware level. This
>> allows the driver to more efficiently unmask the wake capable
>> interrupts when quiescing without needing to enable the irqs
>> individually to clear the irqd_irq_masked state.
> 
> ...
> 
>> -// Copyright (C) 2015-2017 Broadcom
>> +// Copyright (C) 2015-2026 Broadcom
> 
> Shouldn't it be rather 2015-2017,2026 ? (In one case when I updated a
> driver for Intel, I went via Git history to gather the info.)

Ack.

> 
> ...
> 
>>   static void brcmstb_gpio_set_imask(struct brcmstb_gpio_bank *bank,
>> -               unsigned int hwirq, bool enable)
>> +               unsigned int hwirq, bool enable, bool ack)
> 
> This type of interface is usually discouraged as it makes code harder
> to read and follow. Since there are a lot of duplication, I recommend
> to move the ack op to a separate helper.

Good point, knowing the order and what set in those parameters can be 
confusing.

> 
> ...
> 
>> -       gpio_generic_write_reg(&bank->chip,
>> -                              priv->reg_base + GIO_MASK(bank->id), imask);
>> +       if (ack)
>> +               gpio_generic_write_reg(&bank->chip,
>> +                                      priv->reg_base + GIO_MASK(bank->id),
>> +                                      imask);
> 
> Id est this piece...
> 
> 
> 
>> +static void brcmstb_gpio_irq_mask_ack(struct irq_data *d)
>> +{
>> +       struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
>> +       struct brcmstb_gpio_bank *bank = gpiochip_get_data(gc);
>> +
>> +       brcmstb_gpio_set_imask(bank, d->hwirq, false, true);
> 
> ...and call it here explicitly (seems the only place for it, so it can
> even be just moved here without an intermediate helper).

Will do, thanks!
-- 
Florian


