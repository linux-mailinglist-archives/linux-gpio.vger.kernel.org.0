Return-Path: <linux-gpio+bounces-20821-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D10AC9870
	for <lists+linux-gpio@lfdr.de>; Sat, 31 May 2025 01:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A2681C20692
	for <lists+linux-gpio@lfdr.de>; Fri, 30 May 2025 23:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF37128B7F5;
	Fri, 30 May 2025 23:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gm/dZo+m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440A22192EF
	for <linux-gpio@vger.kernel.org>; Fri, 30 May 2025 23:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748648797; cv=none; b=i6jU47bAaSsN/w+3+9A1CJvH88ObJSCCqKMgpVGIJAIT0Uxyyfp+BqmDGUCl+lI/bTJdISbUEUWIUQUwOfy6XIJj+5B2cyzBZ7ogqu3ErC1FaOGkH/sUmWqUtfFtUQwmxCoREETpvsa7IFZri2qay0V0TW4fgUMPrHWXne/kcro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748648797; c=relaxed/simple;
	bh=ZSDszH6DLZu8UGHrETxkA+vaMK7FtZI8vbb53B5onD8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pxK/00To4+Fd2oYVkhq3rOQ1MfTBn5NU6Mzz1oq/A4hbO/gD3iEjNvmhI45oH9izLTt1ezXzSYKGOZY5dm5sYlY+wqiugoTvG2f3CpdG5LkMlsm9xjTgjXjHsfW1GUbo1fjrZfYMveOynykDdVHtTFtX1/vDstkPGYJNirAQKzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gm/dZo+m; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-234fcadde3eso31482545ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 30 May 2025 16:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1748648795; x=1749253595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=uw+SDAnpbyE75QriiKMqcjkIQkdnuBseYuvRivKp4tE=;
        b=gm/dZo+mF7EsyjCVM2ztZxfVsTT2mWkD9O7uKt4n0yvWpp8YJXI8/6KsN+R/eQKnH9
         7lxaCzxZ8O9x7RQP0idHwz0fZksjabbK8R8kD4J/bulOZRPWLi3HglaNqQ2YJuhrRQdk
         bLTRa7wi8bRIdNdJQVY+To+4D4SBYCXVYo+ks=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748648795; x=1749253595;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uw+SDAnpbyE75QriiKMqcjkIQkdnuBseYuvRivKp4tE=;
        b=NEunnKD5Zs06dDuu5rvMqhZzZ5YiqHLKFLcJlp/4txvUblqbwaWAAz+BD1vBDrpmab
         jMC1wRicD87hF1RUle6RULuV3n5pdeWQqEwP+Zk3xM7LR4V0aRNCDfs6tN3I/RIP95HB
         BfXHFpGgUs833eTH5HTAxoEwhpvZl3UlG3zQxCwiRCQL5BaxOzBk9J6dfm09+ffV6gcu
         OFZRKa89/ysoY3sNh6xke25/sBtm/hWUDINJ8GgSFKK0S140w6jkTt3NZcjfcz+UpyAQ
         xZNuPuuMq1gcZCqgUX1DvPJgl3pfT8Oxiu8ork/2aSNBQ2MScBWV7Hoe8JPw5FJBsl6J
         kxEA==
X-Forwarded-Encrypted: i=1; AJvYcCXdUBpdJt3fHklbqT7npQWN/4e96ke7BumpA8MHJuX7qzaN0ZoE1WAdt/lz1dC3upjDoL1VqwdQrsb1@vger.kernel.org
X-Gm-Message-State: AOJu0YyU0ZAQIIenuPQBE8C+QhCsl3U1k5WKotM6JYk2Go74TaR8XYPX
	RnPlQ+VEMYHtuevpTKEX+kGKJC2Db4lqqHjWaxndD4RW4Ch+eBJ7HPtFxmKpAHAfSw==
X-Gm-Gg: ASbGnctDz8ScIwaHIQebVeoypyA/mYERH3ylMqZ8Bx6HR24pUhXWz9jx4AuSuDcYtWu
	f67+4rAh3OSH7lZO9kwmu6L70EPDXTEj9k81DRsCCxhdCYMZIx4nzr08an7z+bV0uqduQz5ZhvJ
	SQJRNb8Fg6xSaAMGHR7nCbfqE9P3pVLwVn/vF4yetHusvtijPqnNPxcvyaZ/I6VXPP+tlHbdQ7D
	lXm4N0F9JKzrFoSRKMDyYEwc2D8Y/GIFYBhG9Tm+jQh/LRymuyeCHeSVnU3L4W4kW/reK6DeQz/
	DEJqVGhbj9nRlOqc+3P5FbV7pGHSC0GlTGLTv2p7HTtUCRbNggff5UNWFDVVWcRxzVwOYEQqng1
	NRVrFKpOTIK4J/II=
X-Google-Smtp-Source: AGHT+IG83D6Hba6mlpJeLWEewKcWggxnySdPP7v+S+J2gMmNbRwekT+k4Hu5mnjnjd6GtQ0EvgHHiQ==
X-Received: by 2002:a17:902:f792:b0:22e:3e0e:5945 with SMTP id d9443c01a7336-2355fa0125dmr1403535ad.50.1748648795586;
        Fri, 30 May 2025 16:46:35 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb0a005sm1768319a12.7.2025.05.30.16.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 16:46:34 -0700 (PDT)
Message-ID: <0e154ae3-e0ab-4a4e-aa39-999ea1c720ed@broadcom.com>
Date: Fri, 30 May 2025 16:46:31 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 0/13] Add support for RaspberryPi RP1 PCI device using
 a DT overlay
To: Arnd Bergmann <arnd@arndb.de>, Andrea della Porta
 <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linus Walleij
 <linus.walleij@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 "derek.kiernan@amd.com" <derek.kiernan@amd.com>,
 "dragan.cvetic@amd.com" <dragan.cvetic@amd.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Saravana Kannan <saravanak@google.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Stefan Wahren <wahrenst@gmx.net>,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Andrew Lunn
 <andrew@lunn.ch>, Phil Elwell <phil@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 kernel-list@raspberrypi.com, Matthias Brugger <mbrugger@suse.com>
References: <cover.1748526284.git.andrea.porta@suse.com>
 <0580b026-5139-4079-b1a7-464224a7d239@kernel.org>
 <aDholLnKwql-jHm1@apocalypse>
 <7934ae2a-3fc5-4ea2-b79a-ecbe668fd032@app.fastmail.com>
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
In-Reply-To: <7934ae2a-3fc5-4ea2-b79a-ecbe668fd032@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/29/25 23:03, Arnd Bergmann wrote:
> On Thu, May 29, 2025, at 16:00, Andrea della Porta wrote:
>> Hi Krzysztof,
>>
>> On 15:50 Thu 29 May     , Krzysztof Kozlowski wrote:
>>> On 29/05/2025 15:50, Andrea della Porta wrote:
>>>> *** RESENDING PATCHSET AS V12 SINCE LAST ONE HAS CLOBBERED EMAIL Message-Id ***
>>>>
>>> Can you slow down please? It's merge window and you keep sending the
>>> same big patchset third time today.
>>
>> Sorry for that, I was sending it so Florian can pick it up for this
>> merge window, and I had some trouble with formatting. Hopefully
>> this was the last one.
> 
> That's not how the merge window works, you missed 6.16 long ago:
> 
> Florian sent his pull requests for 6.16 in early may, see
> https://lore.kernel.org/linux-arm-kernel/20250505165810.1948927-1-florian.fainelli@broadcom.com/
> 
> and he needed time to test the contents before sending them to me.
> 
> If the driver is ready to be merged now, Florian can pick it up
> after -rc1 is out, and then include it in the 6.17 pull requests
> so I can include them in the next merge window.

I have applied all of the patches in the respective branch as we had 
discussed with Andrea and also merged all of the branches into my "next" 
branch so we can give this some proper soak testing. Once 6.16-rc1 is 
available, all those branches (devicetree/next, defconfig-arm64/next, 
drivers/next, etc.) will be rebased against that tag such that the 
patches that are already included will be dropped, and only this patch 
set plus what I have accumulated will be applied on top (if that makes 
sense).

As Arnd says though, this is too late for 6.16 so this would be included 
in 6.17. Andrea, thank you very much for your persistence working on 
this patch series, and sorry that the request to merge those patches 
came in during a time where I was away. The good news is that I am not 
doing that again anytime soon.

Thank you!
-- 
Florian

