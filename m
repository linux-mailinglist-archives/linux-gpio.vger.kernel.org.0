Return-Path: <linux-gpio+bounces-30952-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OKRQBYt5cmlSlQAAu9opvQ
	(envelope-from <linux-gpio+bounces-30952-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 20:24:59 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C88F6CFB4
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 20:24:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D5DFD300908B
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 19:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DC5936E482;
	Thu, 22 Jan 2026 19:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="acWLR66u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C73F38A9DB
	for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 19:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769109893; cv=none; b=BWa7i0KbVVaTt5IJNHbDw6wlSMO3+c8zDHlBVuQqA9FQ3HXalZ+ivBzm6XJSWhAbmk7mnoagQMFM7bjc84P/po297MYIO0qjL6vqp/4Qm+ZSkQAGVnliz1V2OrjKFp0ktKRJX7QLCvX8DdMiJWOtqq3IECE2fdufCBg0hjnSLG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769109893; c=relaxed/simple;
	bh=GvXk4V9By1D5PBjofkvhUU4qulOtHL+4ytfRSMIiTwQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WVX/FubnivL9iOiAxZe1ET/JhzqcGrpkahj8gg0zzBfkhhkdrEXUPoIsfWi4fyqfImVgxlpNm82OmLSy1tzElk2PBVJLXvC7NowK1NNlITAT4rvKtcxxTiz2sxlNqUqOg3YrcvwVTJj9HYgFXzVQANDWgS+nkSiUflr1GTZg2XM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=acWLR66u; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2a0c20ee83dso13295925ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 11:24:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769109881; x=1769714681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=R1gfDRebGX8h9HwfZ81icDjDx7dxW6g0V3ctKkIDrxQ=;
        b=JfsVyyp+4tomA2jttyAFijceeCLDQQXTB9PeVxQVC4p+/0LyilaYoPJlemq7B0GzTJ
         oCk9JGjH+VonP3DRr4+Uak1WdcEqZ5HiCsiuD8CW8LetJ+r1TCCx6OgmzMXA5IiT9tSJ
         f9cmt2c5OsPNhoUrXcYj/TFzR3KYulRF2tYX/+WGbBpvfdRdAlAOflnVJAgoVlwB8qhY
         KVtVVQ0qerNuot7aUbZu92xXWMDmx4980/CmYwqeMdnaM7r5WSSLXM2e3LfOrMt39uT6
         ynVKWEBOaVAzEZIDFMDxKf7pR6XPEP6vVHe2aT+T20KqZTrY/CUN+lt698WCjHZtYUSP
         3i1g==
X-Forwarded-Encrypted: i=1; AJvYcCWfwQ2/eXWJ9Uvi35iZz/Md0A+TDbNVhHmD4MqmeGOehdfQrZE9tQhL/4Tgec8Ty9XjvvV5/CxTcvbx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2AyFTf/Y1/MyQ80YLCcfAMUMCcb1rOMe1Bo1dJ4dadaG2NY+0
	JSdaewVt6P0AX2yVP8sBU/K5O2fo0WWSU4OHSgToy/F4FUj3tkJ8j6IAZQBtB6nkQNU21wnsffe
	khd4cfkIRdLe/XQiF4IzJTZIz3rTAFtvAUjwb+GLKgqxGRgd/27pm7ENP4XhY4NV3ni5A9znCMN
	D8KNWlhnKysT7anB70LoJwVKMh+EDHycIX7W0JY4TXjcubRElLfpivIG0POKeoHsGCOP8SgMKVV
	sKOWjf0jT18mx6mtlP/yg==
X-Gm-Gg: AZuq6aLqozlM8oThkjKOt5qpgSg9Tr4rl7V/ZZdW44R6fsYcJojUULljDmwDrCEsS/w
	u1bPgp4mPqwz+aPWv+7nO9vFud0nCF05n3YmeGQ5JZAN6h7MzfiuCfSUWMV+c0JkPlC3ykec5PD
	C2EINkqkQik+G1aZWzjFuurOiNxq+TQYOXAEFIxPT5R4e9RhdOHGnMuVtY9Nt4PfBOb+2pZKCxA
	oWkRQNyM/7BlNzb5GaMm2ZNIEWraPDecPyeS85lJTYh1bEVzeAejgUFYA58iz5yZr1C8OmDvL/V
	jIzuf8ZbyGmtW+A2Bc+MeFTdEJEe2VLdPGnoYDreeTb6xX8LCzkySJvxWC9ZkWy4z4sFfqNtFzc
	cv6+kpdnfZw2KCBCdttO1sUuVMJE6ocuQuQGv89M3eO2tAG4JhVbMVhpHfgIAtSYIMWXE5wcyRd
	r84xtqDqQSpib0/yxeTEPzGWqMsqsdrOi8ftSiENcHAhXBFV8G4Q==
X-Received: by 2002:a17:903:124b:b0:2a0:abba:a2ee with SMTP id d9443c01a7336-2a7fe441eb5mr4114085ad.5.1769109880728;
        Thu, 22 Jan 2026 11:24:40 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a802fa4e8asm29145ad.44.2026.01.22.11.24.40
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:24:40 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b70c92f404so1870456eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 22 Jan 2026 11:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769109879; x=1769714679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=R1gfDRebGX8h9HwfZ81icDjDx7dxW6g0V3ctKkIDrxQ=;
        b=acWLR66umiz4/L3DVnvzJGBfd6x5y3GARY0Pu8gRMHZIFpkzez7ZqcENNPjETigZVI
         m1Vv+nsJsSQv14qj7ziK6D2WKHBUH8eHDP1BrGhdA1MopuofYXmLG7BmPjVMihbfmar5
         WzyzGJ+Fq8oLUt0Osb9Oh+D4L+trDeqHL2fNg=
X-Forwarded-Encrypted: i=1; AJvYcCX/8aa6M5Vgoew/tf64divjYs5gv2i4g9HylY4/Egko8Ol5mIaMwNivEdIphTVH7zY7WJQE7lt/jt0/@vger.kernel.org
X-Received: by 2002:a05:7300:2150:b0:2b7:29f3:8db9 with SMTP id 5a478bee46e88-2b739bce1d7mr176228eec.40.1769109878776;
        Thu, 22 Jan 2026 11:24:38 -0800 (PST)
X-Received: by 2002:a05:7300:2150:b0:2b7:29f3:8db9 with SMTP id 5a478bee46e88-2b739bce1d7mr176213eec.40.1769109878206;
        Thu, 22 Jan 2026 11:24:38 -0800 (PST)
Received: from [10.63.25.133] ([12.75.221.34])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73a6c4a68sm400450eec.12.2026.01.22.11.24.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Jan 2026 11:24:37 -0800 (PST)
Message-ID: <a7b2f013-965b-436d-95f0-8ce1e2ec0c41@broadcom.com>
Date: Thu, 22 Jan 2026 11:24:35 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] gpio: brcmstb: allow parent_irq to wake
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
 <20260122010516.1200630-4-florian.fainelli@broadcom.com>
 <CAHp75VfhEZ60F7ZHkjNDZ3JR6B6tNF5ORUDPoN8ZibbvF=js8w@mail.gmail.com>
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
In-Reply-To: <CAHp75VfhEZ60F7ZHkjNDZ3JR6B6tNF5ORUDPoN8ZibbvF=js8w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30952-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C88F6CFB4
X-Rspamd-Action: no action



On 1/21/2026 11:42 PM, Andy Shevchenko wrote:
> On Thu, Jan 22, 2026 at 3:06 AM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
> 
>> The classic parent_wake_irq can only occur after the system has
>> been placed into a hardware managed power management state. This
>> prevents its use for waking from software managed suspend states
>> like s2idle.
>>
>> By allowing the parent_irq to be enabled for wake enabled GPIO
>> during suspend, these GPIO can now be used to wake from these
>> states. The 'suspended' boolean is introduced to support wake
>> event accounting.
> 
>> Signed-off-by: Doug Berger <opendmb@gmail.com>
>> [florian: port changes after generic gpio chip conversion]
> 
> Likewise in the previous patch I think this deserves the Co-developed-by tag.

OK.

> 
>> Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> ...
> 
>> +               if (priv->suspended && bank->wake_active & (u32)status) {
> 
> Why casting?

status is an unsigned long, which is what for_each_set_bit() expects, so 
it is intended here to ensure the top bits are not participating in the 
comparison, I think this is just being extra explicit with intent here.

> 
>> +                       priv->suspended = false;
>> +                       pm_wakeup_event(&priv->pdev->dev, 0);
>> +               }
> 
> ...
> 
>>   static void brcmstb_gpio_shutdown(struct platform_device *pdev)
>>   {
>> +       struct brcmstb_gpio_priv *priv = dev_get_drvdata(&pdev->dev);
> 
>> +       /* disable interrupts */
> 
> A useless comment.

Indeed.

> 
>> +       if (priv->parent_irq > 0)
>> +               disable_irq(priv->parent_irq);
>> +
>>          /* Enable GPIO for S5 cold boot */
>> -       brcmstb_gpio_quiesce(&pdev->dev, false);
>> +       brcmstb_gpio_quiesce(priv, false);
>>   }
> 
> ...
> 
>>   static const struct dev_pm_ops brcmstb_gpio_pm_ops = {
> 
>> +       .suspend_noirq = pm_sleep_ptr(brcmstb_gpio_suspend_noirq),
>>          .resume_noirq = pm_sleep_ptr(brcmstb_gpio_resume),
> 
> May we use one of the PM macros for these two assignments?

Sure, can do that!
-- 
Florian


