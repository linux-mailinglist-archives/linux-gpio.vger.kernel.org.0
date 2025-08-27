Return-Path: <linux-gpio+bounces-25031-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 52314B387C5
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 18:31:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 06B224E177C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 16:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 009232741A6;
	Wed, 27 Aug 2025 16:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="cqZIwIO7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D964A926
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 16:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756312309; cv=none; b=DONuauof+Y1nEmDf1HQrbqTHHAxiCv2g0vs44VCxiD7XDhLUskmQoa112tUXW0Fx6cynl2w/6PCt0mACRMEmPmalsiYBOq0SUf6+9J1tWidATzhRoRl7HK4M4sMseCkAQkqRYM19D8L9m81fPU3ZXU7VjH4IZtgH0fJ2FbFM8vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756312309; c=relaxed/simple;
	bh=WNplDj6444cvFfgkdx5yb1hLFDsGklovtizp+wstmrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=IF5bUw292NL14XZMzu3zKlfZiK1OWRjtL3armufjQjI2wdT2xsYsM97sxeicXZsNnYp3ndVS92Ge7x0IZLKT8mgia80ViuMXPsGyCRTrfLiqTUo31gcsYuEOQaaf1QZ5qaepUck3+FL7ge/J23j7qiU6R5sp84cZNhGqXAMijBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=cqZIwIO7; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-71d603acc23so54638107b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 09:31:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756312307; x=1756917107;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=rcmoYrSO6K0i6WXr8sztyfu6DTAP/aOG70ic5dYuN3s=;
        b=LRIkokoIvcButf8noWD69txU26ucp0nrYEB0Bjz9keiQZM1pf2Y3CJ3dpuVbQHVXTi
         qm8WPZJDeXzMVsrnXOuCCsuIxm6H5kfoiHE8N/C/r3dq3iSNdkAFQs4AQBihBPfC5M9D
         JWqI9d1dL7LkkatfqkeuA0ESG0F848GNaLzFNMJJ+TiD+xhU9/I5QL/j+9SD334/8dYs
         J3iAmu7CKDRWamluvVKZPpbhS4uMNRs+eMRV8942NugF9wjAGpjRQqnsQC6RljZ0rYk+
         rKHnqmYpo/z+soRN7iO5x91wK+vBgBIUds0ougnK8HcjfRcCcy6xGLOHYGS3la6aPLWc
         t5WA==
X-Forwarded-Encrypted: i=1; AJvYcCU4tXAHJ7V55G2uLzHL5qAye1g3Lmg+r1hCfEzcwwSP5ij5+KNaC8tytLH3WZHQTbrSQBuIk2ktWyTw@vger.kernel.org
X-Gm-Message-State: AOJu0YwBrFSfITSKWQm8jGHnIinwEs97kDC/QAYxohPBKRV9Om2TF8Ey
	8ulSWPOjK/PMPkuTjhQtNZhA1u3fNo0egX/JTd/DYwZCj0LJ9Qsru8/TZOZ8fzk/3YUgGx/zP3N
	VKXN8tq/wZnUZ4LOaWArSnE8f9keoNRNklXg/4M9K3URascZXfnC/RSHcZMO4tg7Uj+eiBp18pP
	KoRgZudYfSm/0K7ZtrD+dXD2Pf9NwwmIMZJhGzqIoXPmP72AME5jg5BzzmyO1DbaLWcYjghT2c7
	/yfPoVsXZfydT/sBiOHZw==
X-Gm-Gg: ASbGncuwW24y2q8tbFQD8+q/nYxMSdiIHfzz/DiN36evzBMdXLbidP53hIRHavtKuQ+
	WCtfO8WGeSSI3/oF9hrj232WszBQCWWfxh9ZDeYUXnRGvGww6AodmKl5/P5G/DGbhTi2mIBjtcV
	0HrU1y4t2PVGKBi0y2LoyZ0C4waGo1ZNYm32lLKqqLnY6GSdOMjfTj9DQNU/96g8W2SWREexbtk
	j3NLZR5RiOh+rNDi4Y12UujNnoaQ/UIWblSRYA7YKd4i3UTsGc/5k4ELcjCQ89m14AqlVj2paQg
	mYZlRSrK30oMfz5Q1eXalG5hHQWW5KGdDeA7zn0ZzgQwd6I2OIm2grC2LC+6Owsm+97nFgMme4Q
	41ct9oN7Io/1I4AEUEfO9QfD96RtIqJ3rdCnglCbRvk7IxqNNIY42iB4qe9+urT0PbKYEmd7SMY
	KbYBC8zw0=
X-Google-Smtp-Source: AGHT+IHVOZzl3ngkl6Xa78YXMKdx332jVgxoEGbnxxXrkilTQbVAa3JbsvkojNq21y9FWu2Mwm0LhUzmvA4G
X-Received: by 2002:a05:690c:6803:b0:71f:b944:1033 with SMTP id 00721157ae682-71fdc43970emr241833157b3.48.1756312307220;
        Wed, 27 Aug 2025 09:31:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-71ff188d745sm7152827b3.41.2025.08.27.09.31.47
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Aug 2025 09:31:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b109ad4998so642251cf.1
        for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 09:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756312306; x=1756917106; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rcmoYrSO6K0i6WXr8sztyfu6DTAP/aOG70ic5dYuN3s=;
        b=cqZIwIO7l4awV+5sm03RwWIxbEoRNdPc8aiswK6f1/5o4z29D7FNYWTYAw0PhSazR3
         Fo8Fr4G5JkC9YWT0twUq5yBN7bnGx4C3RO41ny3pektpBY/Hmbc3WOFjU6CktbAgYF5J
         IvTtAm7nRfdZ8hgzq75wl9T6Io5/CeT+J2ygA=
X-Forwarded-Encrypted: i=1; AJvYcCX4quy9Ne1DxiKgjZw58ViSAU/EsrdOGEhSILZIvwt0h3Q/NybcOY8riwrRnM8b4m54EQCBZyWccQx2@vger.kernel.org
X-Received: by 2002:ac8:5786:0:b0:4b2:fd79:9ea3 with SMTP id d75a77b69052e-4b2fd79a035mr516751cf.52.1756312305678;
        Wed, 27 Aug 2025 09:31:45 -0700 (PDT)
X-Received: by 2002:ac8:5786:0:b0:4b2:fd79:9ea3 with SMTP id d75a77b69052e-4b2fd79a035mr516161cf.52.1756312304895;
        Wed, 27 Aug 2025 09:31:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4b2b8b0312asm96801691cf.0.2025.08.27.09.31.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 09:31:43 -0700 (PDT)
Message-ID: <3c3beeed-a545-4dfb-8199-b57066d3eff7@broadcom.com>
Date: Wed, 27 Aug 2025 09:31:38 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Stefan Wahren <wahrenst@gmx.net>,
 Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net>
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
In-Reply-To: <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/19/25 02:18, Stefan Wahren wrote:
> Hi Andrea,
> 
> Am 11.08.25 um 16:46 schrieb Andrea della Porta:
>> From: "Ivan T. Ivanov" <iivanov@suse.de>
>>
>> This driver provide pin muxing and configuration functionality
>> for BCM2712 SoC used by RPi5. According to [1] this chip is an
>> instance of the one used in Broadcom STB  product line.
> i'm not sure about the whole driver naming. The cover letter describe it 
> as "pin control driver for BCM2712 SoC", but this patch is described as 
> "STB family pin controller driver". So as a reviewer, I'm a little bit 
> confused of the domain of this driver. Is it for a single SoC or really 
> for a whole family of many SoCs?

The structure of the driver is applicable to the entire Broadcom STB SoC 
family, of which 2712/7712 is one instance.

> 
> I'm asking because all the other BCM pinctrl drivers are mostly SoC 
> specific and not really general for a product line.
> 
> In the former case, I would expect a driver name like pinctrl-bcm2712 to 
> make it more clear.

pinctrl-brcmstb.c for the main part which is agnostic to the 
chip-specific functions is adequate.
-- 
Florian

