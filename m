Return-Path: <linux-gpio+bounces-14792-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C41A5A10DED
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 18:36:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D8553A2E92
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jan 2025 17:36:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9241F9EDC;
	Tue, 14 Jan 2025 17:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BF9w555s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A91D1D47BB
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 17:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876204; cv=none; b=AuBJvx0YEVUeUiBSfRSN2gJtreeeWIz6Fq63wAkb4Fz4QUhpyqru2iiH4M/ZpBPhzC5vRTtK77x5C+i1jKbVi1JclA57dM7oCDdm8RKlsZYh0JDCAJjBMoqIE7/aLaW67lUPBpY7X0qV9lF+wLxAj9qFry5Y5z6/XS6tQqAsHoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876204; c=relaxed/simple;
	bh=Zoam3NccY2hkXQi+945AzddhavkpRgLVv/dodR1easM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=oveKcffCtHmCfcjtEjSJtDahN3+d7eKDDut4IAqqCukw+jB4OMTHPQjkOmRGUIxmnkOpPMJ7XFIkqOwhGS/OHmOmo02XF59gGro7JCOwLRd5OBkHfD8azEDSoJ1s/IOYKtzTfSqzhjL9en61k/lxaNqUk39BoNOQxqWF/73Arkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BF9w555s; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f441904a42so10003462a91.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jan 2025 09:36:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736876201; x=1737481001; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl0OQAceQNZiTRMXXYgPYqORgysEC5Wk2TvfRZlvXhg=;
        b=BF9w555s/GFS+GXroMJDZX363NEYQjuu8UGSLldzkOlMrMMjorTLi6MXgsILDD7lNz
         KPDFpYwScJJDlzqnp9YbTmhq6OkKoJlbPRitC0WqVraA82LNo5f4DxRILukSWyGdhPxi
         R1tHCg22aLqtjnpf67tXjlDt2oa8X6iEFoCVM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736876201; x=1737481001;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl0OQAceQNZiTRMXXYgPYqORgysEC5Wk2TvfRZlvXhg=;
        b=Toum03lIZcVtCLC9IBA2yonPX3/0ZtyVKyksCwBFEhT3GEbN7hJ37YXzqJJgllqClg
         9XrkZVDps3229Qy0zgezorRjhfT5clVBdQIbiweGKfw93vidGOYJTKaROITNpYBKvyfF
         b46Pnxfa5dRzEfB8FEUCfQf6Kb3z0aumqLvn+b0uvzws+3HuCxtz92a81DikD0GlMAdo
         Qldk2zkuZwafq7jON2lolwurYBGVtJJ4X+9l6tfMAEOV2mwDI5JIYQg/+L4J3vTpAaRK
         KqRNyTlQ73N4U8tPgLjBxCncRZpuMaOHcN6svLjuom5dkUE3kLZtJw2e0+8kSW02bnUz
         pxWg==
X-Forwarded-Encrypted: i=1; AJvYcCWuyjhynIJGqD5Uu8SESt8m0+SmuUx5G7Qp9gai6OOgRUIobK7N65zwU5tIY0HVqOQZQx1qw/VJT9lt@vger.kernel.org
X-Gm-Message-State: AOJu0YzCZnZUMxv+KUE2tLm+sgNDf5Yl/kHRafc3vE7p19jIeov26D+T
	aqIHToKuTrlcQj3yFxaccgPglEGYBgWO7DO8TX/qZzjUJNYD6xla/CTdXBukLg==
X-Gm-Gg: ASbGncthD7fsdmgFOJ3y6ZwIMdzZv5kn8BSIrzOQp3PbgDVNJxXehJdwHhcc8nMcsUn
	KOOWeObOBvfGj8fb55A5D4gY91lmWO5g820pfuQ6fddfPgi0Ucn50MuOB8bztMDthxk64H1o5EK
	/A7kJLhszY5enUhenMq/Q4mkMNqyG0Zq4FvXDnhBT0ocJnbVG56D59swsK3A6cyG1IJLKSrn/xx
	VKdU7EyzP96FQ9vVJCZPYL9RWc4+r95aQx/Bypr4C05bS6ZRehqSgv4ZszqYvBfmNexJ9txOObI
	k3Puo4GdQkPSy2sEmEFU
X-Google-Smtp-Source: AGHT+IHHsWEv45wozGJmxuqAfNmVOO/eL2E6IblEH5O05wgleycnhwaLm+UfIHZkEHKBKpY6IxmalQ==
X-Received: by 2002:a17:90b:2e44:b0:2ee:3cc1:793e with SMTP id 98e67ed59e1d1-2f5490ee8ecmr31229108a91.32.1736876200871;
        Tue, 14 Jan 2025 09:36:40 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f559439ae4sm10697210a91.30.2025.01.14.09.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 09:36:40 -0800 (PST)
Message-ID: <169fe40d-021d-4229-85e0-5dc74cf009b7@broadcom.com>
Date: Tue, 14 Jan 2025 09:36:38 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: Use str_enable_disable-like helpers
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Doug Berger <opendmb@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250114105553.273085-1-krzysztof.kozlowski@linaro.org>
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
In-Reply-To: <20250114105553.273085-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/14/25 02:55, Krzysztof Kozlowski wrote:
> Replace ternary (condition ? "enable" : "disable") syntax with helpers
> from string_choices.h because:
> 1. Simple function call with one argument is easier to read.  Ternary
>     operator has three arguments and with wrapping might lead to quite
>     long code.
> 2. Is slightly shorter thus also easier to read.
> 3. It brings uniformity in the text - same string.
> 4. Allows deduping by the linker, which results in a smaller binary
>     file.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   drivers/gpio/gpio-brcmstb.c | 3 ++-

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

