Return-Path: <linux-gpio+bounces-36240-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOLZG1Ys+mlXKgMAu9opvQ
	(envelope-from <linux-gpio+bounces-36240-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 19:43:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 081B24D240D
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 19:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 128073075BFB
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 17:41:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A11B14A33F7;
	Tue,  5 May 2026 17:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KJMbBg7v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f226.google.com (mail-yw1-f226.google.com [209.85.128.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DE264A33FA
	for <linux-gpio@vger.kernel.org>; Tue,  5 May 2026 17:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778002876; cv=none; b=e3G3b8Y1V9YPr6LU2fTPNoBTAEH68uRPO4ohnh3a5MO0IeSWPgQ9IwdQxCqompxtZ5jXSCM06CTB0SakoN4rPuFypmtKHekTmYCiGsUbiS046E+Cl6FYTKxHil9ZB9ZrcJDNj9V6V/svnxfAUUD8maiyhkyeNg3KnDe8bgYdX3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778002876; c=relaxed/simple;
	bh=GQNkioTZY8zsJN6NDokufPbM8F0jKsJOPiFzG+FzFGc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=PgATcvhtiI8J6T0w28RSPAawmuKR33OUnkGSfIgXIiyuTmfycUjLXQS9Ap3cxbqRQHUeReyE87bsUpRLM6gD+D3sNI3Fw8Qbh2sfnfPfDXa7feVNKzhV5YfesSvtjzk0eu+NPtBFXp5SVXeg0W3dvHcJ7GJ+OYUvmOnV/WUp6Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KJMbBg7v; arc=none smtp.client-ip=209.85.128.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yw1-f226.google.com with SMTP id 00721157ae682-7bd87e5d8ffso1593607b3.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 10:41:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778002872; x=1778607672;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EbBVbZQpK7Lvxj1vVsDLr4pX2aQ5pdv85p+B8cI0h8g=;
        b=khoGj2SqLa6leLzV1lT2y6EGpnnHEGkrnI44Nrw2Xb6ohNRpvAqBSzpEnlXet7p7Rk
         iwi7NcDcDfcso/gwZBWAqm1VzQwcEwnIlgqmc9DmZl8RxCN+MJYs/kC7Hag5jwk4ZA/s
         2fr8oA8qc388AwzjjNXrdcsdLoKd7zl7xm1FtSrV9Be6x6H1B8/TTTP9ZfIjtxbcmyWn
         1O9Be9NmL6hI0UAlxzok65Qgh1yyUIdf7F7ehUv6v0i8xGWv6O25JuIkm0SLrcXCVw/z
         t3wrRnD1B6PXsyLuPQfpPQqtUvf39+DKMiCGPWhFAxCUTTBWP70raocSW9qQPN05A9aw
         lGFA==
X-Forwarded-Encrypted: i=1; AFNElJ+g17W5ygedndKHHeB0VW1RygAl3nrx0IB6j01JTmrxUns9avCzrTKftmoF3hHHFjKOJkFH2YnxIllN@vger.kernel.org
X-Gm-Message-State: AOJu0YwxaSR7UCOH/RD5dQ1FjvwDLgsbHj9KaSKej8/zNPHaKcMZpcqY
	3N/NjLtYvkPNlA4Epv15Kxk9pIm2xwXmR8WnTyk0zE2f9r8xTvT+mAKyi2zMKmaEtA6/+TXNZCW
	BR7eHCRCcwdWJX7cPErCqIwwUAGtT8e4mIkj3kk9AfvbvZJq1m/VY+04ohHBPDf5hP1FxtwhF8G
	G2CouZMKv65hZLBiCubrhR0AHasKYd0vpdzltSe3CBC33jNSnONsRsQtQohdXwt9PfvOnR7RD4Q
	AkJWl+SgVPutQNDlkb+dg==
X-Gm-Gg: AeBDieuWgZZ8hstSHjjG6bMYJuwdq6os6OVth+HJDKiHUUA8Ar8E8Kylzheob7mQ/k7
	a4a3ezmmTNb1qyT01CmRaOBLcTWoYavxsFKwZBC+PjrR5CLpCyO1p1p78DHnmyHu7Ip8tE5BLLm
	LiNGcdp3F6KfQFDDqXzXbwOVcQzS5Im4Ni5BYLFMAbt7eRKR/tEhMcqpvDh9qNJDYnA5RuMmg3O
	lAA95M008gYcA0ekfzcAkfXUR+2/Cn3BPJsRbsgh6iX/kvbdUNXPytj8C9PdLE3D4LZZ/NtoNqK
	eJX+higAW3W9UCKyY9pnnA4/BJj+83prJSmMEkH+aHQNVmARj/WyE8EnWP1Y8Gm6TiblKet/CtD
	3HUJuT2XB+TeDBc09kQYUe9mAcf1cICLI1ZU1HzGEIZ30UyzJse7muLncyxPGN5WOLsWPGJwzd4
	bHPmPyIz9QKOBMlRjyYSGtWYO/CSZHjwCEF6rhOBLahod6GlQiS/FigZ3AMb1sek3BjAUKE9da
X-Received: by 2002:a05:690c:39d:b0:7b2:9347:7ba7 with SMTP id 00721157ae682-7bda8b53364mr44873087b3.22.1778002872352;
        Tue, 05 May 2026 10:41:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-16.dlp.protect.broadcom.com. [144.49.247.16])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7bd667fe89asm8663927b3.14.2026.05.05.10.41.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 May 2026 10:41:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b4bebd2b2aso3214776d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 May 2026 10:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1778002871; x=1778607671; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EbBVbZQpK7Lvxj1vVsDLr4pX2aQ5pdv85p+B8cI0h8g=;
        b=KJMbBg7vy8QoWGQ37Abuk7abqfVs/C2WsiY+VhTuvnFkCJoR55Q73PJRX38DTzArcw
         u9vG5u+eoEzubnBv7epIliyxvzCqX4NgepFDxHwJ7O1igQ+FaaORz1uuKMBhzw92o41V
         y0MMnzyGPNQurIk9fUZYV4+8Ot1UY7vVWON9s=
X-Forwarded-Encrypted: i=1; AFNElJ87Zk5wQsUVbWNzyP3hWDnf+IpbmoLOEwAGboHFltx5CMjV4w64JwVLj/zK5z5FWvTS80Hbe6Tg6bcG@vger.kernel.org
X-Received: by 2002:a05:620a:25c8:b0:8cd:8e8a:3584 with SMTP id af79cd13be357-902e299dd70mr664633285a.11.1778002871614;
        Tue, 05 May 2026 10:41:11 -0700 (PDT)
X-Received: by 2002:a05:620a:25c8:b0:8cd:8e8a:3584 with SMTP id af79cd13be357-902e299dd70mr664627985a.11.1778002871100;
        Tue, 05 May 2026 10:41:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8fc2c253259sm1372131985a.24.2026.05.05.10.41.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 10:41:10 -0700 (PDT)
Message-ID: <e095fec0-f0fa-4a6f-a758-9d45f804cb3e@broadcom.com>
Date: Tue, 5 May 2026 10:41:08 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] pinctrl: bcm: Move MODULE_DEVICE_TABLE next to the
 table itself
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Linus Walleij <linusw@kernel.org>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Heiko Stuebner <heiko@sntech.de>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
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
In-Reply-To: <20260505094321.75040-3-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Rspamd-Queue-Id: 081B24D240D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,broadcom.com:email,broadcom.com:dkim,broadcom.com:mid];
	DKIM_TRACE(0.00)[broadcom.com:+];
	URIBL_MULTI_FAIL(0.00)[broadcom.com:server fail,tor.lore.kernel.org:server fail,qualcomm.com:server fail];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36240-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]

On 5/5/26 02:43, 'Krzysztof Kozlowski' via BCM-KERNEL-FEEDBACK-LIST,PDL 
wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the pin controller drivers already have this correctly placed,
> so adjust the other drivers.  No functional impact.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> ---

late to the party:

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

