Return-Path: <linux-gpio+bounces-19724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D34D4AAD845
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 09:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1190E3B9FF7
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 07:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0ED921CC4E;
	Wed,  7 May 2025 07:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eh+Qi/9d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73C6215078
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 07:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746603143; cv=none; b=eneILbAMAGgA7FhhWSyCUHqKoqF7kFaf8FMsXgQKpI7ZFy3pl7dKgay1c+QSfzULNuC8KdIcP1eUfr8BBEK2TcgMF0JEtIHSU28I3Gf4WYKFCggxu6oRY2Ah2SouEb0sS41nA5BqsB8wo4kW0dvSCH0HjNoqnjWT0u/jPuv9GPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746603143; c=relaxed/simple;
	bh=4GJWSGDKlJnMIWGtNQ7AH+MLDqEOVwEj8uKjnSOFYk4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uvq7ClDDIsrbm8ZLL7sUmOWj2wwIUs+Y2nlVkOueddP25zcqgB3gUh3MrvHIHRyMBTeNPrtQtcM2OICSM4OruFGvOuXIqMqYHsuBBe05iwsY+30Xp6zOVpxJV1KS93cv4ARoNA/45p52HxQcFfjEJS1PtKI2wbQTopZrH5tm9lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eh+Qi/9d; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so56078795e9.1
        for <linux-gpio@vger.kernel.org>; Wed, 07 May 2025 00:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746603139; x=1747207939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/oowGCRlPnH53+dvEhVfbik3/aGzqGnubNjPU1FCxSc=;
        b=eh+Qi/9d13bHoy9Z+QrOnegQRg7q/L2wXZUEj53aO3EIhbkow8+KLBRc4TSY/HLxAm
         6QQF3jxyyZ3zRCsUqqY/SawkLhPlCPfRsUjIg+bXXrLNHtbNP82Zmm2rkRqSSYAJzAQJ
         PiRW39Oyw9TCcbvLrOTl1nnFrl5NMOUtFXs84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746603139; x=1747207939;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/oowGCRlPnH53+dvEhVfbik3/aGzqGnubNjPU1FCxSc=;
        b=saQXaS0TaRyKTV6ruYDAWjpy2yFhLOTJcArii9QYqhFM9F1c5Hiw9mh5z7Y3M/Z8mx
         CC7sOwEPQDsgBmIHttLFd/yt1ZBp7GWt4aaoAnHDxp2CW9RXqzWDZegh+EF5jgGz6Fqt
         SWhfD4lHNjTj3RV+AVQLQ5LP9ASOTXleMbhizn5fBljyElw/h17fjnzOleLrg1yB2lM7
         Tx/mMED/xtxgzAmmpxfztzlHljL6vj8KU2asE1hBtSdIO6HTygPRI/JEpqtjI2iorVP6
         7rI9GmIIPi9ktyiZLkWf0Hc0G4QQyiqEXX5ZFq3FZgw7rd0Ads0wJ+4qEzSvNHbJztXR
         AJ8w==
X-Forwarded-Encrypted: i=1; AJvYcCUZkjm6Yd9n7oqM6hSylH9ClE1Js/5LgLlqEQAQEtJMXqX9oBGbUXk33cPcGLisu+HqlLfol2tdi3EK@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm0eOCQlCsgGgtzOZlJWTGq9pNn5iTn3dCV3/ff6BIx0Oor2Vx
	Q4MtYXb42TW5nZFpaexz04MRVXPkeNXeXGwmiEZRYu9iXzY6DA0NPt89gwS/ag==
X-Gm-Gg: ASbGncvs/gMN64us8qfxKwOA2kVSnUjvNnhOnPW8vqhiFc8PHPqkWmWcDg1Ma5dnrWq
	fxfPBhArLioHXk4NDqaFsV5gjQL54Yg1bx38HvAi1xqO79hQNYTlsFJrO69jbpaBax+mBGP4ttB
	F4t9tdABIpPKCuwwjlX7Ub2N9whSuhHnSq7vgYBK5z0eMfbn/OW4soOUAeuDsBWrC0xGRVneW0T
	t6Bmhbf0fRfyVDp0PVcOaHYfvioHXARC7yCnWSiS1q3LWNmSURtYaTt3JZAD7rV/iJr6x6fu5Ym
	cYdN/px+eIrCKDOJ7u5A8+q3jTbUnPwX3TP0P4fwVorwE//4Nu/xdsTmE2mD8CofOCB8kcjFRDh
	vnoS6l4L0bNLnZDn6hSEg2P6/YqLt/jpnkGvGgeY=
X-Google-Smtp-Source: AGHT+IHhnQ0XoKBKM5DMQ7zEqqg7TzLxsMCpqS1ZcloLnADNH5WKFeYw2vsLW0QXNRCZ5zE1p7gAJg==
X-Received: by 2002:a05:600c:8289:b0:441:b00d:e9d1 with SMTP id 5b1f17b1804b1-441d44bbf50mr17486185e9.2.1746603139011;
        Wed, 07 May 2025 00:32:19 -0700 (PDT)
Received: from [192.168.1.24] (90-47-60-187.ftth.fr.orangecustomers.net. [90.47.60.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442c98fd955sm5285245e9.7.2025.05.07.00.32.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 00:32:16 -0700 (PDT)
Message-ID: <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
Date: Wed, 7 May 2025 09:32:16 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
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
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
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
In-Reply-To: <aBp1wye0L7swfe1H@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/6/2025 10:49 PM, Andrea della Porta wrote:
> Hi Florian,
> 
> On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
>> The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
>> Add clk_rp1_xosc node to provide that.
>>
>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
> 
> A gentle reminder for patches 8 through 12 of this series, which I guess
> would ideally be taken by you. Since the merge window is approaching, do
> you think it's feasible to iterate a second pull request to Arnd with my
> patches too?
> 
> With respect to your devicetree/next branch, my patches have the following
> conflicts:
> 
> PATCH 9:
> - arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts: &pcie1 and &pcie2
>    reference at the end, my patch was rebased on linux-next which has them
>    while your devicetree branch has not. This is trivial to fix too.
> 
> PATCH 9 and 10:
> - arch/arm64/boot/dts/broadcom/Makefile on your branch has a line recently
>    added by Stefan's latest patch for RPi2. The fix is trivial.
> 
> PATCH 11 and 12:
> - arch/arm64/configs/defconfig: just a couple of fuzz lines.
> 
> Please let me know if I should resend those patches adjusted for your tree.

Yes please resend them today or tomorrow so I can send them the 
following day. Thanks
-- 
Florian


