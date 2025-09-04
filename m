Return-Path: <linux-gpio+bounces-25626-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A38BB447FC
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 23:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6C37EA47669
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C62C28D8D9;
	Thu,  4 Sep 2025 21:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Q4p+faGe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f225.google.com (mail-yb1-f225.google.com [209.85.219.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD2528DF2B
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 21:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757019751; cv=none; b=A5KHaJ117XA58/qb6T1JYUVMft6H3LkMGOVOd7mXR/rOuBkS6q8kELzGpax1afUsQ8VaM4ZYZdOeqfoyk59eORtUfjijRQzbfS7lOSF0VJSn+aeNkNqETVPoVz0nIQkSKs8JDtrLwBbEfcSNpOvs3bmDV6sFP6GkuoixAtxx2sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757019751; c=relaxed/simple;
	bh=5Ei1nYFy9rOFyR9SqTl5vXwgQSieYSpxExrDTBn06Xc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=niwp7Bj2wIr90owaa+kJMqZbe8rfHpQqQp8OBIs4kCbbj0ZSrJrcMj54s2DdWtIrpRIT2eDfQhnQjdUEVhqvvVy/ZrLl/iNjJv3tWEunMMTmeZHDHy9NCb+Fg1MfJgQDOOTBw3XcDWb10ZI1ihNGAibIMB03ICnE9QXQaq6s0lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Q4p+faGe; arc=none smtp.client-ip=209.85.219.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yb1-f225.google.com with SMTP id 3f1490d57ef6-e970acf352fso1577724276.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 14:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757019749; x=1757624549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PRBZV5G/HcBkypwOLz8mqvMSu5Xawkw09o8QhoPdqzk=;
        b=uQeKTVPjns6gaLRZcKwFJwnsqtMFye1joB1g+WhyUopc28S6iBIszn0F5VuztQecaj
         t/1QZumgZU3kfmdAKPj9seLGuuULAbULFGXvmcfVnJGtS69Q/lr4dbmniB6B2VT6S7jx
         d9QDPs8Ce8ADnrYv8D+Ycv2nz5cpJbqvItdXosY3xJ5UGAU5swIEav8LibAE/9zE3cWY
         N8B1ZZyoUOTA2PmNBbRvdLkpzGKpXy4CfKZIli0jjaf9MBsDdVKLN/Wey3H7uEHZ5B3N
         5EKIeaTOQVrHfwvTzKO5mqsYQElYFt9Dfp2zE5UKy+Q8XGGIsqhCRpF0e5JEPaTZGyHJ
         SY5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWhBSM5/XueBXDd+6t7A3tDP4BPa6ssyLYEaVYQz7wUyZkBMuuPig67cVk9DcUFGNdZPmDDJsclqueO@vger.kernel.org
X-Gm-Message-State: AOJu0YzLbJJQSb3uFuKQYOeg11Zm3USBL6wdveJhVtufnKEJedaFyBHf
	A7zVLg85NYZ+zQJ62N1Yefx/XeJIaBhAbbyyDAPtKT0gh5uyS5rwOySCkxax5qkSK4DWgkt+9L4
	CAav05GFDqRKWYrJn4m5K12raj0FblGw52+LAtnFOohsMS3GuQ3li/x3h25S3ozv7mkkrsPXr9D
	ZnHarvAt9mkj9ixTv/NkIb+miMgPdfXgNNo9aIJiaJxoKIcz3ZSL/cLe6Znwh/dgxOBceXI0/NQ
	QBB94dGafFSreeRkSocKg==
X-Gm-Gg: ASbGncsMPZT/iC7ygnlSH1HtTXxYpVMTLMbxOyPhQvpqpbEzi4L6Oygh79ww4JeeZS/
	baDcM2z4a3JQY/nZZEeed8tq+hi0nRtO2u7hTe66cqRF/R8JDnyfU3YPJdwIu+RlHYTGtLz5kf3
	voZNFDXAoXzFG1fke6zUhexjdCmI8gqHdGOWCf2oBGsTihDyuo5c96+ExdJfJg8iShrsmwkNyWA
	qJGUkhai97fpmdL/jdJroD9li5lzVlaZwikNjpJHnTIbjPgeKAFiuO/cMBRsuITGrwlw7cOcS/w
	UEoUgj8cqHkQPiiCt6PVyAE2nTuF+8USoHXdbnkGluEBspWNNWaNBJhsUAp9QqIunWMji7P6sMZ
	14ONgrs2+xKEMWU9oUOPtacYHQ/ydmv/JfW8/3TTV7SQMi89Lnv11qH9s6iE8vCb0UinuKRttV9
	/i6BguWjo=
X-Google-Smtp-Source: AGHT+IGMushGxhAEk+GN9mHquMEySZfRyRsH3fyoNJdZRhj7NX5PYxWDxgrzxmFw/zJ/pLSnm8xWpHTibrPm
X-Received: by 2002:a05:690e:4107:b0:606:29d6:64ef with SMTP id 956f58d0204a3-60629d669ebmr4462577d50.15.1757019748929;
        Thu, 04 Sep 2025 14:02:28 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-116.dlp.protect.broadcom.com. [144.49.247.116])
        by smtp-relay.gmail.com with ESMTPS id 3f1490d57ef6-e9bbe06ad28sm649733276.9.2025.09.04.14.02.28
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 14:02:28 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b5e178be7eso18906261cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 14:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757019748; x=1757624548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=PRBZV5G/HcBkypwOLz8mqvMSu5Xawkw09o8QhoPdqzk=;
        b=Q4p+faGeTc4aBsS3Q4RvOZY8fouqMSYWBlQlvcluCxl2+Zbait6Vd6vN6mCjNNU1Tc
         wu3yqtWGW9E7XRcMSsJ8+CGwHS4uuW479SmYrMNKoAm7P6Hf1m6ApvNazznu7Ftj4irH
         HaFMG2mcRApnCLDNRDKJV4qpTJrHQdAmEDFeg=
X-Forwarded-Encrypted: i=1; AJvYcCU6Xffgyw5f5dMvrh5GMvsDSW+pwe1h37OLWgMNFy2XO1sK51JwYMxwx0I+rOkQ3Gf9jpUuiTE7zCyX@vger.kernel.org
X-Received: by 2002:ac8:5e53:0:b0:4b3:48b2:aa9f with SMTP id d75a77b69052e-4b348b2b623mr131348341cf.50.1757019748003;
        Thu, 04 Sep 2025 14:02:28 -0700 (PDT)
X-Received: by 2002:ac8:5e53:0:b0:4b3:48b2:aa9f with SMTP id d75a77b69052e-4b348b2b623mr131347871cf.50.1757019747585;
        Thu, 04 Sep 2025 14:02:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b48f660517sm34712351cf.16.2025.09.04.14.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 14:02:26 -0700 (PDT)
Message-ID: <710ae88c-b1ea-4ccb-9fb9-1b30bb9a079f@broadcom.com>
Date: Thu, 4 Sep 2025 14:02:21 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 3/3] arm64: defconfig: Enable BCM2712 on-chip pin
 controller driver
To: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wahrenst@gmx.net,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
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
In-Reply-To: <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/28/25 05:47, Andrea della Porta wrote:
> Select the on-chip pin controller driver for BCM2712 SoC.
> 
> On RapsberryPi 5 devices it is primarily needed to operate the
> bluetooth and WiFi devices, to configure the uSD interface
> and the power button.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Applied to defconfig-arm64/next, thanks Andrea.
-- 
Florian

