Return-Path: <linux-gpio+bounces-31315-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNYPKuO8e2mnIAIAu9opvQ
	(envelope-from <linux-gpio+bounces-31315-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 21:02:43 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B56B4210
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 21:02:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0F094301D303
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 20:02:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C362F6930;
	Thu, 29 Jan 2026 20:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="NrDPrZnG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A997719A288
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 20:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769716958; cv=none; b=im934j8Xq7kUPecarXv3W3+kTJ07XmpUJCGHFoaEZWd2KRFG19na5wSbVHtRuqE20hBV3cGLH5W+Hk121Gb2OQcj0X4bZ9kQoW2406V9QinP2huRZCAksi2LD+/0Fy9rwztAOisPd0sEJIczCT9p/s0g3SBttBVaY65XGn6JDq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769716958; c=relaxed/simple;
	bh=SsBF9PaGeW67il2cCRkLQnQdEDVzxDmXtRsTZBSoC5k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfJht3WN2VEFmYmUsm3jIhgmw24qm6pz+vXS1nCaylzcAxbPThfB68A1ppFbVYCXfdREqppKkkzdwMH+6LWoywrD6XRTTX0trJERIGYY1YYlhOAoKzx3wSIbHXuQU8XuckAzDm+R2CwhEPFd4eMUDeVIhlXTJ/GHAY+ev+TVraw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=NrDPrZnG; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-c2af7d09533so776825a12.1
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 12:02:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769716957; x=1770321757;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ioB3D6BXyeLcWD9XhvHoJBhn3PqyGRuLvXy6++BvIU=;
        b=uiWkkZsFvN8NEqx4TFzyBEAgnW2Nn73Bp2U4lnqM/hL6gc5q/z/0MVHUsKHnTY8OI/
         QEr7dJrvuEAUXJT8nkNCV8v3jpuB3KZKw8/O2uzPjWvXQ4tZ5bE4bpTSl/JIhzy3hcr8
         GtkETpwMoOA63IuqOstt8xIRCUMPmab6oGZ9dLnGlb0eb7GYbQ3mU43UI38LBY5pf7qv
         u+cQjfafOEAuOETZ2EwJX/zO0CChJFe0t7ltFnx3UxMeKG5Z4ZhQeUUzNd+v7XFqFU2M
         SUvDcEj6rK5TEWVTBJDNuW0r9gwuPSSK8KWXXwhYe0a3lzEkrg+DbUSCprEgWu0YoPW2
         5GQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIsjhA1ENn/K5vVTJ+eEJVCZ2KQeZClmr3lDxgdccxSa+lfZtzflLIxCORjk5WBG63fa6ts6n7KoOI@vger.kernel.org
X-Gm-Message-State: AOJu0YyH/fWnOMwx5QZ1YLL2GIa95gdvXre4Bq8pV6KSuvKWnu5zLBGG
	669iYukk8nX8UfHRy/dOUHp4K9GPzdt0SedIeeeSSjyc44LTJywJKHpvmKOP9YPkjdmBtOHh/Lt
	kHjacddKCOOHNcYeZu+GtZjMV3UmNuvfr5+VCg/+4bCO8LFyA92ktJD7dI58IcgG5kM/+43ROK3
	RntxIZE9ZvtziUIQplhDjuD5k9vHoiUybcFMY32d/snHjPzzHV9PgnOT13SutD1YRVbWk3O73ye
	HmH9KwQsUUTqUdg3w/GlQ==
X-Gm-Gg: AZuq6aJVXCmkllaaT6lj13iVemkIRFG0GAZWUM6+efBig2b+kMcA7i4x6Wpjj+p+/OB
	nXKC9yxWUK3m8qdQPkznU6zXHReDlhHLRWfd8Szg6WS73hoeU0PuDjtI8E+lIohJghHJ9IR+lqn
	/FqhuhwBx7qymsuz5Ff5mTPZF3O4vDU819sDZki4JvNo0eEvyNJTShCT7bHJ+ovKZoYABEd9nJV
	Jb3wlU63GHkDUZaOJuJKuv/vM3OvzYIZFNGSVre2+D4zFlJR4SDHXMsjrP/QSKbYeWcoLSBfnpS
	PrRtoHMev0DNOiGqvgSlMFDQwkF2WQeDBpyAjuMK+wbS/hnbiLP8wYG1ekNibKf/iHtdAWuwgTM
	mI3rDUTaZB19SleVHdNaHLb7zsjwJ+GYn5bf7ur30goJu+G506xFNc1MjEQfoOTNeI48idRyTkj
	E2Yk+bVM2CXfzo/4WgWiNy46fS1w6QmlL/tRvpt6cyrtIJwPuepQ==
X-Received: by 2002:a05:6a21:6d8a:b0:366:14ac:e1f6 with SMTP id adf61e73a8af0-392e01a710amr212901637.72.1769716956912;
        Thu, 29 Jan 2026 12:02:36 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-17.dlp.protect.broadcom.com. [144.49.247.17])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-c642b3a5396sm390530a12.12.2026.01.29.12.02.36
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Jan 2026 12:02:36 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-45c72be7f0dso3839512b6e.3
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 12:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1769716955; x=1770321755; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7ioB3D6BXyeLcWD9XhvHoJBhn3PqyGRuLvXy6++BvIU=;
        b=NrDPrZnGvykIQYCuLc8/MXSb0njszQopoePP23dZgHQ/kTVh8MmA0zBX8L/lp6idYL
         pcR7tRkt5NCWOGPtVC5R7nmMRtAP8abpC7aZ9qAwXZPIoOYFKEI3NG1Z0i+y/SzhDOzq
         /y2nZR+RKKGwG5OwiinIKk4GEmq9jxUEja2BU=
X-Forwarded-Encrypted: i=1; AJvYcCX5gtP/lSfF28Zy3Q+vpI6MGEPPxp2zLY23aBFWBRfYXe2JsI5e+syoMx1ButB5S+0w1kwzXRrlRu4K@vger.kernel.org
X-Received: by 2002:a05:6820:178d:b0:663:389:6acc with SMTP id 006d021491bc7-6630f3850e2mr356025eaf.44.1769716955278;
        Thu, 29 Jan 2026 12:02:35 -0800 (PST)
X-Received: by 2002:a05:6820:178d:b0:663:389:6acc with SMTP id 006d021491bc7-6630f3850e2mr356010eaf.44.1769716954859;
        Thu, 29 Jan 2026 12:02:34 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-662f994388fsm3657258eaf.4.2026.01.29.12.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 12:02:34 -0800 (PST)
Message-ID: <b9732251-936b-4935-a586-25993881ce4e@broadcom.com>
Date: Thu, 29 Jan 2026 12:02:32 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] gpio: brcmstb: allow parent_irq to wake
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: linux-kernel@vger.kernel.org, Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>,
 Bartosz Golaszewski <brgl@kernel.org>, Christophe Leroy
 <chleroy@kernel.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>,
 "moderated list:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
References: <20260127214656.447333-1-florian.fainelli@broadcom.com>
 <20260127214656.447333-4-florian.fainelli@broadcom.com>
 <CAHp75Vc1om1XDT0os+md1D-mwYxrVZJGfbpepkdPJrHOmFPBvA@mail.gmail.com>
Content-Language: en-US, fr-FR
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
In-Reply-To: <CAHp75Vc1om1XDT0os+md1D-mwYxrVZJGfbpepkdPJrHOmFPBvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,broadcom.com,kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31315-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 10B56B4210
X-Rspamd-Action: no action

On 1/29/26 06:23, Andy Shevchenko wrote:
> On Tue, Jan 27, 2026 at 11:47 PM Florian Fainelli
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
> ...
> 
>>          if (of_property_read_bool(np, "wakeup-source")) {
>> +               /*
>> +                * Set wakeup capability so we can process boot-time
>> +                * "wakeups" (e.g., from S5 cold boot)
> 
> While at it, add a period at the end.
> 
>> +                */
>> +               device_set_wakeup_capable(dev, true);
>> +               device_wakeup_enable(dev);
> 
>>          }
> 
> ...
> 
>> +       /* disable interrupts */
> 
> Still the comment is useless.
> 
>> +       if (priv->parent_irq > 0)
>> +               disable_irq(priv->parent_irq);
> 
> And looking more at this, I don't see why we even need the check. Does
> the code WARNs or so when there is no parent_irq available?
> 
> *Yes, I saw this is the original code, perhaps can be addressed in a follow up.
> 
> ...
> 
>> +       /* disable interrupts while we save the masks */
> 
>> +       if (priv->parent_irq > 0)
> 
> Ditto.
> 
>> +               disable_irq(priv->parent_irq);
> 
> ...
> 
>> +       /* disable interrupts while we restore the masks */
>> +       if (priv->parent_wake_irq)
> 
> Ditto.
> 
>> +               disable_irq(priv->parent_irq);
> 
> ...
> 
>> +       /* re-enable interrupts */
>> +       if (priv->parent_irq > 0)
> 
> Same here.
> 
>>                  enable_irq(priv->parent_irq);
> 
> ...
> 
> All we are diving into is the 2 questions:
> - is 0 on the particular platform an IRQ number and there is no sparse
> tree enabled?
> - is maple tree implementation clever enough to not crash (or have
> side effects) when we ask for a non-existing index?
> 
> Anyway, this can be done later on.

OK, I will remove the superfluous comments, add punctuation where 
necessary and respin (removing patch #1 since it was applied already).

Thank you!
-- 
Florian

