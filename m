Return-Path: <linux-gpio+bounces-19311-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B0A9C4A8
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 12:08:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ADDCA1BA8483
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 10:08:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACA923A9AD;
	Fri, 25 Apr 2025 10:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hi9sU/dE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA0D23312D
	for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 10:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745575669; cv=none; b=iExIXqUbLYC833ffV0cq+ey665xrOPQMKDa8wrs1F92KVpwLSFSQinjS4+TTj4KLwI1osNgnBxH6wG/uBkgbxpcLpnK3HYvcwV9q+M5xhKCKmrginVEoWlPj2sVl8dL9fWJbxm6GBbL7qtQ5kOZGCgAc9njaFxj1hKNZkEUacmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745575669; c=relaxed/simple;
	bh=qV1pZ+3JNp92kKS0xXXAb/pAJaziKcnWjRvO2Z5j/JI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=BkhiNyAIqC+4nntv2nYLo7uiNHPoQcnztf1oKAuwQL1GC7Eoq2rSLaeup7JO/uhZ4wht8q898PIanmoJOnZ3YwvTyQyp25y9xOlZjvx7O626tI9V2gX3z1Sq/BLvNPqKGciAgUvYxR5ndca9tH3WuAgAsxe6hZ4nJs45t/dnzZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hi9sU/dE; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-736dd9c4b40so2797226b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 25 Apr 2025 03:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745575666; x=1746180466; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5B7y37K/WGDfH6iYqZP3IbPETHIDt3dOJy9LPqxh618=;
        b=hi9sU/dEpFQfBFlaD5a7O2qhVFpneBbrm9Jc4YWpt7nxK7cZtmdKE50fsj+XqWrp1+
         F8Wx4KzDWJBw7F25oW1NleaBjZB90nyK6+CRT7lQP0TbSYv7aRmSSYzKQQiib9HaV+CB
         wX1A5dfcphrBYCEpmV3tY6oaAYsNC9wy1bImo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745575666; x=1746180466;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5B7y37K/WGDfH6iYqZP3IbPETHIDt3dOJy9LPqxh618=;
        b=WuSjdv9hOXdd1B93btrV0a3iF057NXPaXwJgQf856m+iTKbhLiOX4FWT7QnCtGRs61
         hCBpBIr7a5eRN9fevka2y6BVnG8cDBwKMIeAtaUiGBS3t4XaLKaSLXvjeAdNMa2kZY5d
         ICwvUf1QqBO4SqYXmsjtufL0yzxEbxK8wFWpeRYiGh+dDe6UR2zfagWFDKgzlaqRAVsq
         r62jat3Ad6Vt8EKY3ltzMrOkoEPePiwiv4AAEgSCQtNOU8qUhPW+Be1ktHYYpYsOknMt
         crpK2H/ySCqh13Hp+h7bLw/MxJM8XvI7XQjG8xIuP+vbhCbT0LLZ5d384GrgdybSu4Mn
         J6hw==
X-Forwarded-Encrypted: i=1; AJvYcCU09pE5NDs2mBhxqq+2shOckCtEuIAL8jVXB1jCWK6n1s4gpogRBg3ZC3eo4c9DmjtmFX+DWmDUMgX0@vger.kernel.org
X-Gm-Message-State: AOJu0YwjUaTVmaBiaySQm6ujVkkFOx/XDhAJ9P70OO/FA4XiUEI0Bzvw
	oJduuQrZn++luf7WHCY3VbWodF8CbZjI1hpC9KLMarGfLXYtwLFJR3DPIpj1Qw==
X-Gm-Gg: ASbGncv5MsEr4TAgAEq8ANDvOkwKALfivPAfY2zqqyvRpLrhDxvs0hCwVTqI3V+m6L1
	PZsoRqWbjrTJt224rSf0tXeJpNuM/KodNQkeB8FwRqqeLKVnh//IlgR7Qae1waPDoAXe04tZKLq
	BDW9eocwTgWQZyO7/XTmiH6vCWplaGPjbGuD5ECT3qKKaSJ7VpbZqgxPB/etDluV9DKth5MG3E2
	QQgiLkl8AORovqpOlNqvQyLxrlNPhWha+a2F/FySqGtX7RaKIDMzBUtOC92VBlSPPJ+6FbB/Dc2
	DAsX/2rKFP0ZhuWyIJ43C0Lg04QeCxdmFiYIVy6t2dDzsxFUtSWdwcwYsvdVFMTzFSqi4uk/c/b
	MjHSoplrvmTL5PxRcABhFXpEWWSuzAKAOfw==
X-Google-Smtp-Source: AGHT+IH+RPx8vMoFBrGnE2UELbu76oBxdqLLmuOZ9MxvthItxwA6UQaxgwbV1lK1NsLiE9He6IufKQ==
X-Received: by 2002:a05:6a21:6b0b:b0:1f3:1ba1:266a with SMTP id adf61e73a8af0-2045b1257f0mr2341262637.0.1745575666250;
        Fri, 25 Apr 2025 03:07:46 -0700 (PDT)
Received: from [192.168.1.105] (88-187-52-200.subs.proxad.net. [88.187.52.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b15f76f48b2sm2564155a12.8.2025.04.25.03.07.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 03:07:45 -0700 (PDT)
Message-ID: <78cdc9c7-47f5-4522-8dea-b0bb3228dd7b@broadcom.com>
Date: Fri, 25 Apr 2025 12:07:33 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 11/12] arm64: defconfig: Enable RP1
 misc/clock/gpio drivers
To: Andrea della Porta <andrea.porta@suse.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof Wilczynski <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic
 <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-gpio@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>,
 Stefan Wahren <wahrenst@gmx.net>, Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
References: <cover.1745347417.git.andrea.porta@suse.com>
 <928679d1511a43b8dda150009eb023b4eaaff5a2.1745347417.git.andrea.porta@suse.com>
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
In-Reply-To: <928679d1511a43b8dda150009eb023b4eaaff5a2.1745347417.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/22/2025 8:53 PM, Andrea della Porta wrote:
> Select the RP1 drivers needed to operate the PCI endpoint containing
> several peripherals such as Ethernet and USB Controller. This chip is
> present on RaspberryPi 5.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> Reviewed-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


