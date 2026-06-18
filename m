Return-Path: <linux-gpio+bounces-38674-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id kVtUKqzHM2q4GAYAu9opvQ
	(envelope-from <linux-gpio+bounces-38674-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 12:25:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F20069F48F
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 12:25:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=broadcom.com header.s=google header.b=Z7vUWiEn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38674-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38674-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=broadcom.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10444301BC34
	for <lists+linux-gpio@lfdr.de>; Thu, 18 Jun 2026 10:24:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3ED3E6DDA;
	Thu, 18 Jun 2026 10:24:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8423EB0FA
	for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 10:24:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781778266; cv=none; b=s2Uy2EzcWaEZ3/dOE6wmZbQsCmf2/7lBD/zL7pkIlzcNL+Yf3cUYSbUUp27PlzLa9rjm2CxYWy7XoOIBQwt5LwALBde0sMzVHXDZW3ycfM4MDniEzT5pM46Gvc3XhYShOg7gDx6uBgp3pmvmt0KUqNPrNmg++UZjg9jXSnew5Ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781778266; c=relaxed/simple;
	bh=Oy6XczUB+ZuFM4YDdDtZ5kev7dydRBH6vThVkgDZT2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D6PHKB8v/Y9q3hR2hNwX0eiPpBD7dtYX/Xh657vbLU1W5D3XVPHkb1DyyRBz6BXiuOlIy3C17rxmJdSCqtK2T6OniJw9CkusT4+BVguLx34C5//23hVvsaiFirPAWOc/4Sjyhqxk5ua6IJeNwPaJPlVdW+DB3vKZVjGplCqmzr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Z7vUWiEn; arc=none smtp.client-ip=209.85.216.97
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-37cab825ec9so686648a91.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 03:24:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781778257; x=1782383057;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pdxvnHNhBcxBAvNVWg4iUTwWhk1g8ApNBvxiWkMn+Ak=;
        b=j2kKlI7Rw/ydqCnMtlNZ6+ZL+UDIvBvwPksEdV0fLdWqzQTzz8v0GsL+6NNYdvfE4Q
         5lJjLOX7A36sdRLD/TvywmYpxstUlhTQjz1MI+g74UvRo3Ojmcd/975HwaG4n0tb2f2t
         VP4/Id/50TMfq4gsrOaYtWWBpoGoKjgJVVJIeigSyJnBJzIJZi7hho0SFO2vpMSKglqI
         qFAS2arsB+QfQGeKxFIYU7/SJoC6Iff4d3TwlRMGbu0E3yQbKB59Z/rUKnsLvLC+GgAf
         PmPCAawlI437uy8s2bX2Mub3zUBcuytI9YBhXY9rDSdasRStn+e5bolUkBvO6ZB7q7Zq
         UoZg==
X-Gm-Message-State: AOJu0YzOeqPWbqc+mTOxFwRb9p3cnp2H409fnEnNJ3L3eod9po1bEc1+
	q9XiqNzcaR3924Gc4hfgWG+Qc45TMquccllwxa58yQjDmB6XkKnlzJKc1EFz2Ufi1+QHqaT4YUs
	Aei7hWXwztmqYIIRkoy9Km9Kl0/Yy6cc9m+tRojez34nS2wH1/Kut0ZxkxGVm96ul4ygq1JMMDB
	xM98boW5Wv1gfRQjvJUwa2bw4Fwx9i60ZCCHG+Q7udeUcSWODmj2B9t3R44FN/RD9/YHIRZYqQV
	lkMIlHuqyGDxiK7TNB4r9qs
X-Gm-Gg: AfdE7clAPtMSGet2fur1XLKkfiMWbyFLN/WqGwv7kRt/T2HtL4tUsWuUuAGdhP/EQv3
	zxuYZ1cfB9ayOcAfsP5hTVJu+OAdfXc3J76OYF+kGiMI9+vgKnLT4Vg85VirryJcQ6Tb9v/UqPG
	dc2PI5l/Y77XR1NC6y3CbZdJYgpm7p17MoZyMWVhGT8kDGJyHel+xuNV38pOvh7q/PZzh3hpHLh
	5Afe4FX8aWJH94pFkEdVBpJwCNhQK/kHbbPvWisbnuLgRk1JDAYOd/b8nbe3r/39EIFAWOt7Fhq
	7wroT2nKtcN9XjaQuC9pOxRy9O/YhYa7eFGRpuAMRzSn3LN+MQyGkS/qCsbgpEInthBAl7Txchn
	sRLhGvBVOIxhirnB7PPxZ8AtL5ih4F1OX7GFbSn0pcX2eri5mnkZPLsBrxpEGUTmP7KObforr73
	EryNK9weEWFv5fNUkJ9v5VS+RHd5xT/Azel0b4KXwO+3+MFfKThfQ=
X-Received: by 2002:a17:902:fc50:b0:2c0:c4c9:4cb with SMTP id d9443c01a7336-2c6e4749e19mr36013605ad.14.1781778256438;
        Thu, 18 Jun 2026 03:24:16 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2c6a492a182sm6027845ad.53.2026.06.18.03.24.15
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:24:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-490d3f03883so5455205e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 18 Jun 2026 03:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1781778254; x=1782383054; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=pdxvnHNhBcxBAvNVWg4iUTwWhk1g8ApNBvxiWkMn+Ak=;
        b=Z7vUWiEnJrDWh91iUAT20XfPmBDjqSszwvr3LTl+qDZFp7HcHAfgw4SRjB05hg/HI4
         vlKNguLvuy86ZiuL4j6is2hUQqaesAd6mL6XXBctFNOzsR50DFUOFn3y5Z54RgVt9rVo
         dR3JUM6TLDh23KrpUK6ulr5/p6iYe+q8ozHaU=
X-Received: by 2002:a05:600c:3e1a:b0:490:e974:e01f with SMTP id 5b1f17b1804b1-492333ecb80mr132153655e9.28.1781778254344;
        Thu, 18 Jun 2026 03:24:14 -0700 (PDT)
X-Received: by 2002:a05:600c:3e1a:b0:490:e974:e01f with SMTP id 5b1f17b1804b1-492333ecb80mr132153045e9.28.1781778253884;
        Thu, 18 Jun 2026 03:24:13 -0700 (PDT)
Received: from [192.168.1.21] ([41.140.50.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49234daafc7sm117621445e9.10.2026.06.18.03.24.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 03:24:12 -0700 (PDT)
Message-ID: <4f4b2f95-e61b-4008-b54a-fdd3101dc492@broadcom.com>
Date: Thu, 18 Jun 2026 11:24:11 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: Match DT helper types
To: "Rob Herring (Arm)" <robh@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260612214939.1883911-1-robh@kernel.org>
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
In-Reply-To: <20260612214939.1883911-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-9.16 / 15.00];
	WHITELIST_DMARC(-7.00)[broadcom.com:D:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-38674-lists,linux-gpio=lfdr.de];
	FORGED_SENDER(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:linusw@kernel.org,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:bcm-kernel-feedback-list@broadcom.com,m:linux-gpio@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:dkim,broadcom.com:email,broadcom.com:mid,broadcom.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1F20069F48F



On 6/12/2026 2:49 PM, 'Rob Herring (Arm)' via 
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> The affected pinctrl drivers either check for the presence of a standard
> property or read a property documented with an 8-bit cell encoding.
> Using boolean or u32 helpers for those cases disagrees with the binding.
> 
> Use a presence helper for "gpio-ranges" and read
> "microchip,spi-present-mask" with the u8 helper documented by the
> binding.
> 
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


