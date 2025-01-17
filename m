Return-Path: <linux-gpio+bounces-14920-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6EAA154E0
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 17:52:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE57E169741
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jan 2025 16:51:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFBF1991CA;
	Fri, 17 Jan 2025 16:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="BlH8rQpI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7153A199249
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 16:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737132714; cv=none; b=RbT9ENTTP7MVS5hUeLSIBBx09xHWBJ1xO3yu2CMT31NR0fof7DTUa0O9M7NaKLKkoli/GXXAZx7YNRcjujCb91Y4XAKLU8RkZ9vuYyP3pGnmN5GAKuf0uDwL+airXpzSlVGgHLV2BD8oIkA0rscdJGWXTe6mkz8wOsf9odeizRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737132714; c=relaxed/simple;
	bh=uui2Sb/nR98UE7vz5pY6pAcwpCHVX8jKfmCHOcOYoUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Eu1Voubl9NDSgosqkwk6eRKjBwlN855lfghbCLuSDhB8Aw3O+1nHzIyDScIwZFRijrtpTpJkavWmBbk0ci/UfJCHHptm0Wq98YVQ38Fm/0QP+2C746DT2wbGBybM2Ahl+Hb2mpJV8BUwrb4QfVywZEd46upaOdqQzMsvHdqxtbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=BlH8rQpI; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f6497fbccbso1933258eaf.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jan 2025 08:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1737132711; x=1737737511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=7TyQ9sWoiZbB8k64OE2Im+cDXMFp/ewsO6hps1JJeq0=;
        b=BlH8rQpIna87mcNzBmrfUVk0lNuZCmYAg04PU6K/oPf6XvqLAcwJ8TvjRiOaRll703
         asDA97/T+pQT/rTAaYYT3LPww0vEREFgeaOda8FTdwyk2eBL7GsVWaSUSUUJ6vrZEdy3
         AmayeBYMjLEtTvUVHoCbDgJpW6Le0qbw21ArA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737132711; x=1737737511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TyQ9sWoiZbB8k64OE2Im+cDXMFp/ewsO6hps1JJeq0=;
        b=hbTHpKjb9xjYWaerH6uWcFEj55RxVtioAeb9lL1MJn0yCyyf7naybOvyqPFZkZSpJq
         Jv9G7+5pBO1WmHl8WtWP3J21qDfcHAQNZ8H8TRtrxcfvnxv3ZCCd2JZCa4cEj7KnQPmw
         FY/t2j5JCP4gWAbu+WZv1XgSNwz14T9ByPOHnZbG3OZT34DfFDorCnE+5buROB5sipuo
         kPEuM4OfIduylhvHDmZoxpCgFsxzrQd356y+yq9t0wuunjMKmjk9xhGoe/2cX7aAz0JA
         ltEVfpLnDhUe4W0FBDjG2I48oAMOLeih7J8GY473gK6PlZ7vcZ+Gpk+ZgTMfsEIM82tf
         T/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU73KZMdxG6seVO3KNcHjuGciV6sIHVTcMpJrbZQ/HcBuY/hjQZLBMZiHnXazx97InGqRY/Ny27yW1R@vger.kernel.org
X-Gm-Message-State: AOJu0YxGp4qlDSn2q10l1UiC34kGgMl9oMEgsRmZN3+hwXwt73H4WCwg
	K+oztd3BYiHxFeYPOdnqmnPUVy3g+/foyrezerOjSqJ7bupAm8bmSM4bG6x/DQ==
X-Gm-Gg: ASbGnctroJTt1Ve/b+gEfpdJYLZwVGdqv4hZUuZCzd+YHNqUInlGdyhi9GO8+juDSof
	u4Yx+d/zpEmHBirIw6pC1aIWfe1ttUfD/K2wh02kydh9mHpcyUqus7hoUQCgXE2WrXeoXiNuNvZ
	iv6v5WMCYXIqwjws4NzD2EwcB4cUAyDEAofbeCqxrlWXBl1t+WlX3OuKgvnKokYLijWXqHoWz8E
	jXXF39iG1F4dzJADTJAD3QLQtKXD9UEBM/5k0FpnRSKaQCyXrupP8r4vkasnUgNgGzP7RJ+uIFi
	o7P+R4manTdHN0wMGuJJc0W88qj2ZmM=
X-Google-Smtp-Source: AGHT+IFEXRpIK2u0R3TQRER+gWkdA+fDKCiwAOfJZ25H/fck0A9Kyq2nWPEMtjRT7GQv/6CdT+xJYA==
X-Received: by 2002:a05:6870:d146:b0:2a7:8b78:e902 with SMTP id 586e51a60fabf-2b1c26407e4mr1988157fac.7.1737132711553;
        Fri, 17 Jan 2025 08:51:51 -0800 (PST)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7249b37c517sm978403a34.6.2025.01.17.08.51.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jan 2025 08:51:50 -0800 (PST)
Message-ID: <5cf48ca6-56bb-4625-9914-b3b1cfeee9d7@broadcom.com>
Date: Fri, 17 Jan 2025 08:51:47 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/10] arm64: dts: rp1: Add support for RaspberryPi's
 RP1 device
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
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn <andrew@lunn.ch>
References: <cover.1736776658.git.andrea.porta@suse.com>
 <528c8c136b31483e345d07803b5e8ae5d2cb1b68.1736776658.git.andrea.porta@suse.com>
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
In-Reply-To: <528c8c136b31483e345d07803b5e8ae5d2cb1b68.1736776658.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/13/2025 6:58 AM, Andrea della Porta wrote:
> RaspberryPi RP1 is a multi function PCI endpoint device that
> exposes several subperipherals via PCI BAR.
> Add a dtb overlay that will be compiled into a binary blob
> and linked in the RP1 driver.
> This overlay offers just minimal support to represent the
> RP1 device itself, the sub-peripherals will be added by
> future patches.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>

Same comment as patch 9, I am happy if Greg takes this patch directly 
through his tree.
-- 
Florian


