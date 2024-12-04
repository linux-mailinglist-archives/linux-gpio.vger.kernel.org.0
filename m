Return-Path: <linux-gpio+bounces-13510-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BB79E4413
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 20:06:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D66B3164848
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Dec 2024 19:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E1101C3BF3;
	Wed,  4 Dec 2024 19:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="e+HTR7Y4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBD41A8F73
	for <linux-gpio@vger.kernel.org>; Wed,  4 Dec 2024 19:06:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733339169; cv=none; b=PRGYLEDvTpFuvj4XmPR/tpqaDez/m2T8o2fuCtPC7DU/vCJLs8CMabRR3LtQLbxoMlT0gK7+zfDYidYYE8bbHD7xwUBG3geQxERf2k/eqBg2GKaCmilT/8HmNdm+TmWqn6ikvucy+YH9u11Z1h4rhF0dCxWi8/Ldq94PKWcE/F4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733339169; c=relaxed/simple;
	bh=65fxsdph7FrFvZX6a2W4aEbZiEgacsW3UUoh/EurRa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gzQh+Le037fFan4WnxjMJYhy2oizdVE7lP6MaWpQ880QM8JrpM2W95G0lrHLknA6bvPBqpTERX6bM2fUphqCtVaNfK5cUT2FH5mbrDDWVlOCCk6m38ALgI/KdvVLXUWDIcJEiCRjXZ8ZgHUp4RjneSgu+YqNt8kUWPyLv1mlQW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=e+HTR7Y4; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-7b673aacf13so101233585a.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Dec 2024 11:06:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1733339165; x=1733943965; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rwAMqF5C2/XSwGsn6tg9idQ+gKok1OrDZ/TQYQQC3ME=;
        b=e+HTR7Y4brFOEn+P1MjdI0U2YLGGW/MjqhUWA4PRZjUQoDrYnL7TzQZBODnxKDui8A
         0DPv/2SW0ObETQh7aBmz27o3YfeEBxCT2t9g6d7ZHAgu8yvrL3U28ElCxA+0rpPnQe1N
         2GXeUAqNt24Ptx5e/BJ2YnTYiiI19XTFJJSm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339165; x=1733943965;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwAMqF5C2/XSwGsn6tg9idQ+gKok1OrDZ/TQYQQC3ME=;
        b=uMfe15uIRnlddVy+gWvAbyeApsmHY+u+Xyvc8Y8v6E6bYoxzkskrswPUtZ9WtwWXcJ
         ZFP0a86geVPsjWP4zI40K9BbrOZe/docJP+fGQ5URs0x2S8WBPTC9CRvVTW2EV5H/3Ao
         qkXM08DI8gWujRHDptfPsskZNmixs2VQlSnDs0V+AFRZ0nVVa7ydgWl7kxiwUc0xT5sr
         DF9ug8bpwiSFTqVqT8xAx9yOdzwNHwmxV5xCwU0C/ntm5gCBEWW4tToUB01LuC43RPXl
         F+RnYEc4DA1bkV1Vm1lP90WVVcKx+OWb61uqyaSVrzOZkGvmC9zaWlYZxJUqQguehrpQ
         MRJw==
X-Forwarded-Encrypted: i=1; AJvYcCXpHlZoaHBDVq85ngiO70ZnferoqIHgEwv0U19T8VGinzk+98QjnJnFlWqCxRUJ1BgZa1iY4PNnS4eM@vger.kernel.org
X-Gm-Message-State: AOJu0YzQJckYTjXobydqYhbogBrnGoSaaLqBfk+7eOx6W8SIIp87pzAi
	bqnrWVcVxfiK1eTiWayjR3rUWNJf9K43pu9hV3y9Dsa/YMweKy0rHT8+RtnU2Q==
X-Gm-Gg: ASbGnct4qAFvVG4deC7uFg3G2lcqh6+kDNPKd43Bps2Tv3R/TP7CXYC+STQ9QATUjNr
	KfPKYrd6DpOVJYZ2OVOp/j3R4yj6zu9HzGg9Jthz9A3+nA7TSlWwyPz0B+YAr8jQEiHUkGLmfes
	pAVbRORVzdZrAj2/ER0Emcm96phAfppWDP2KFZSKPiA2XnRV7csa4Fz8SwC7kefwMijAB7N7zOY
	U890T8lsx1+uERLeCh0DM14CINE+0SGYheqIwL6CU5xd5ctvw8ih/jpcZKHb8blc7Px9SiTAzfw
	dtcD0pxkmo5eVg==
X-Google-Smtp-Source: AGHT+IET8ru0K2M3tO3OOrXNHAiQ22hdOskTrfOZXT2O7Z5zjNnzqqS/g1Ime/BQv4SnXZ/y8604qA==
X-Received: by 2002:a05:620a:6005:b0:7b1:48d1:574d with SMTP id af79cd13be357-7b6b4185bdfmr97267185a.8.1733339164891;
        Wed, 04 Dec 2024 11:06:04 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b6849aac82sm635574085a.94.2024.12.04.11.06.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 11:06:04 -0800 (PST)
Message-ID: <5b36a3c7-f691-49e5-a4c6-803ddccdd5ea@broadcom.com>
Date: Wed, 4 Dec 2024 11:05:58 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] arm64: dts: broadcom: Fix device tree warnings for
 BCM2712 display pipeline
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 linux-gpio@vger.kernel.org
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-4-fac67cc2f98a@raspberrypi.com>
 <c8093283-f2c1-4a66-823a-50aeabb3c82b@kernel.org>
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
In-Reply-To: <c8093283-f2c1-4a66-823a-50aeabb3c82b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/2/24 07:20, Krzysztof Kozlowski wrote:
> On 02/12/2024 15:31, Dave Stevenson wrote:
>> Fixes up errors on HDMI and interrupt controllers that weren't
> 
> What errors? I can't find anything in the commit. Describe the error.
> 
>> noticed before merging.
>>
>> Fixes: de9bc2dba3db ("arm64: dts: broadcom: Add display pipeline support to BCM2712")
>> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
>> ---
>>   arch/arm64/boot/dts/broadcom/bcm2712.dtsi | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> index 39305e0869ec..f42fad2d8b37 100644
>> --- a/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> +++ b/arch/arm64/boot/dts/broadcom/bcm2712.dtsi
>> @@ -336,7 +336,7 @@ ddc1: i2c@7d508280 {
>>   			#size-cells = <0>;
>>   		};
>>   
>> -		bsc_irq: intc@7d508380 {
>> +		bsc_irq: interrupt-controller@7d508380 {
> 
> 
> Do not mix cleanups with bugfixes.
> 
> BTW, do not mix DTS to DRM. DRM has its own development style. DTS
> *cannot* be merged there, so combining these series is not welcomed and
> leads to issues (like DRM applying DTS!).

That is not what was done, I took the DTS patches via the Broadcom ARM 
SoC tree, as I usually do, unless someone tells me otherwise.

We got a number of DTS warnings after I took Dave's patches so I asked 
for those to be fixed, as it turns out there are binding and DTS fixes.

I intend to squash these fixes with their original commit, so all of 
those commit messages will be discarded, they are only meant to be 
transitional.
-- 
Florian

