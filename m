Return-Path: <linux-gpio+bounces-13992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAE49F6C57
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 18:31:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 60E01188F062
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Dec 2024 17:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78EC71F8EF8;
	Wed, 18 Dec 2024 17:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="DMdNt6sN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928961A256E
	for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2024 17:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734543061; cv=none; b=gxgdgtmvhWwXUSTAPVwTiCfU9llsS1ojrbWzuqcvfL2fPH9z5tKxcZw33kF4WmiPJEs8V/iJ0KYr2S73Bt5SD90290cqCuKTRpji432fZkJxG7eGTfmrR+icLldOwA0AZz6KuWuWJFf0eQrD6uqb6uPSq2UirQ0NP+n1IsLs6Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734543061; c=relaxed/simple;
	bh=fOJlZ6aiCeoVh1+ph+wx0w+A9mq5NmMbLM7xLF33gns=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FU1d05u/RM6nXi6yOZQz4kcpmOf10bC/gGIi6MdO9ojLX3/9A6gKzxfUxYk5vo5i8MX7UEXzKmA+jqUK1E2u62sPo+basmmmzFMPjc5o9WoIj1GdkhOmMQ/d5FZ+Jh/nJHkq5dt2+ULX9VdFxuD0QZT/Aykia4PDM1qle3vbRMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=DMdNt6sN; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4678cd314b6so66145941cf.3
        for <linux-gpio@vger.kernel.org>; Wed, 18 Dec 2024 09:30:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1734543058; x=1735147858; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=HcVrOzBS3DFrP/a6tiA1PBGwTzGq41w/Sq1RFzRynec=;
        b=DMdNt6sNy6o6Put/BPkOSAqhy6Di9JqqHWK9TjldZ4Y3k6Hd4Iy9ZkFi1CpodUcuYq
         dJZLK6xyrQ3Hj+FwtJWrshvfLh8sjQbP74MyxsZ9kBpaak2rXbYtj3yG6RXnQnUcOWjr
         lg1tDRkt4zNAo5Ycd4rWavtVmkMXY+Cl+h1Zo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734543058; x=1735147858;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HcVrOzBS3DFrP/a6tiA1PBGwTzGq41w/Sq1RFzRynec=;
        b=ivZgfxF6j4ox4H/ELnaQAjVxrDGf813xtJWAw7cnUpx8l0Knyz1QVBHjYV1UBeWnOT
         l4FpfyFNeIAQ9XyCm9AILhQOl4IvjDOhpAKRs4yeQL724FF20TWt9epoUUZl+VS4EMoJ
         sI+7Gi3RgTorxtLjL3291FoHPap4zIcVGeku0zFPk2KvyvgJcnp4nDk3qI74l5cwKm43
         cZgl6d65zEAkhj29UuCN32+fvbBvzwucEEmil1m2rM0SyEl0AXDaNLf39sDre9bRsWhT
         Y5eiD1VtaIz1vXqU++RPci2ViMTfqJQd4Scjo8rT1c+LYSUhd+kTrPmRm1A3gnygS2/v
         a1dA==
X-Forwarded-Encrypted: i=1; AJvYcCX/hr7/IGGrV6kNVMzspp+mTKxbfA0RRmcMn66NhzIgxyxP3f7ZU5I24pLeOfGbQKYVacBoWEhsm7du@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd+dWBdsIoSmqqGBKjeYCBK9LDOxjtuLxZVcpgg3mSaifMQyk1
	OBR6ycpbHOGYhJAPypJeNLfP2aYTNucLmBMkjFgKGWGTkzR7fqFdTP/Owox8yA==
X-Gm-Gg: ASbGncuxxRJHCgLSgFCjPMdnw2zQDpIoxRWw5mnP2d53oC0WRHSxN3yAwBBLFm3E/QM
	ivOH0VbiHkaH6SBTomziCaAB6N06asgRbff8wnumx4ihCQbPALL9pcViozMynNk25REemus0RCx
	8cGtw6R5RIH5EfRl3Xc5XcYA/GAa3zdG9RsHeetAO23Opc58nKF/5CZv2wXc6O/102YS/n8VPj8
	Z2Epzh17Io8NHel5qG/5qErkyesxKRfmYpP3M7curO6zzBNVBkm/MEOnw9uqgSWDHHW9sxCrLIk
	oiqEEW14Dp7MD75vjcch
X-Google-Smtp-Source: AGHT+IHgarmgH4Yfc6eXQMq5lh6BKBRqUsqM0vXPmwT9a+J9qaC9Hg9RJtZr6jXkN5Jkiqwu/UA9aA==
X-Received: by 2002:a05:622a:118e:b0:467:7cda:9375 with SMTP id d75a77b69052e-46a3a7b4857mr5652781cf.24.1734543058491;
        Wed, 18 Dec 2024 09:30:58 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-467b2ca5ee7sm53024261cf.34.2024.12.18.09.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 09:30:57 -0800 (PST)
Message-ID: <5d7fbb08-4f24-4c98-ba44-f3a457729dde@broadcom.com>
Date: Wed, 18 Dec 2024 09:30:52 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] dt-bindings: interrupt-controller:
 brcm,bcm2836-l1-intc: Drop interrupt-controller requirement
To: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>,
 Stefan Wahren <wahrenst@gmx.net>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-3-54cc88b6c229@raspberrypi.com>
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
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-3-54cc88b6c229@raspberrypi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/24 06:48, Dave Stevenson wrote:
> Since commit 88bbe85dcd37 ("irqchip: bcm2836: Move SMP startup code to
> arch/arm (v2)") the bcm2836-l1-intc block on bcm2711 is only used as a
> base address for the smp_boot_secondary hook on 32 bit kernels. It is
> not used as an interrupt controller.
> 
> Drop the binding requirement for interrupt-controller and interrupt-cells
> to satisfy validation on this platform.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


