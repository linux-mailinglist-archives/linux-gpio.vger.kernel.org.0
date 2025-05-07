Return-Path: <linux-gpio+bounces-19752-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D4DAAE773
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 19:10:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4848E462F4C
	for <lists+linux-gpio@lfdr.de>; Wed,  7 May 2025 17:10:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1D828C2D9;
	Wed,  7 May 2025 17:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZDa1+ET9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA5B28C036
	for <linux-gpio@vger.kernel.org>; Wed,  7 May 2025 17:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746637836; cv=none; b=Uqr4Tqpe4uWVZy1jE81tIKy0nCTsVkHcdhvTIS4TDG9P08z9AIPiQhs0jCUu2o88YmQr/E9jjgo5lcD0Cms+6+t3VWEhQVw45IYbcHdqGjHB5ePlDLJeoECfUOe9yyjDiViBq4h5DJGJZ3xuUYn/TS9hp+QKw3w8tG5Iq3c2SIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746637836; c=relaxed/simple;
	bh=jrpjhvpfg+DcK9WZ3D7ziffxQ61gLSYtx+DsBsRPqUE=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=m01sKUz87PA3oFqjttoqL00yE+zL6X3RYHFj/7/hy6iMUWAXQ2kquNV8M3hmkV7a0u7K+UuSiNsgiOMlUVRa1RU9glyyQVTTlslMr0WCmz6fNCc+OkXQfmSOuVUnUB7vQr03Kp2vz2f/tg6zJaTr7fLmpQApLr3XIN+/HoMnthE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZDa1+ET9; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d04dc73b7so912555e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 07 May 2025 10:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1746637832; x=1747242632; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kcOLMbYlvwqOTROoo3srbEJTigUJIWnrqfB7khtMLAw=;
        b=ZDa1+ET9TZnEVnzinSHwP/jYY73/WT5S1Ya/gCxhkOiP1rNER16/P/datqlYENGJ2v
         9oqPbODSunU5d3QnG4kC84KebGMhh9ELrRaJP+BYUQUsS2QN76X5JFOyJkh3pAC/lXfH
         KH6yiCKsqLbelfTJ/tKf+qS2GXPmIBaidVo8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746637832; x=1747242632;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcOLMbYlvwqOTROoo3srbEJTigUJIWnrqfB7khtMLAw=;
        b=J0LpQnHjKVPKRDlvzsM9p2wu1C+0jpgfytRCwOkPsUQK58H6NKsSlbBXG1YLWrjhG4
         FJfqU+uRFxDJlCpfQz6LrL+fFxa3XN3JLnrFPmvZi1AC/iOcG/mF4w42o6UaSohnSSt+
         cPdQ64inA5/1S9DEowkA7WJeNr1So/6tg+BnPgi+bvfy+J+fo8cG5NwJM4EmKxHApHB9
         JMnp+qmWzS60x5FWDxqVhH2bhLRK+KIoc2AhjSv62ru4taRIEan5cGAl3OQD0AJcYWgH
         /T1k6takd9ivfq4gjr9uXY3JXhxKi9DgA+T3ng+rG3rY6FVueSlQ5TDALaU74m5K0Nvb
         nBtw==
X-Forwarded-Encrypted: i=1; AJvYcCWlvsw50hlI0HHM0rrhXf0stRveclROAMuS/Rb1DyLelDMKq5E4dZKheqqCMmM6g18NwnapEKiM4KUM@vger.kernel.org
X-Gm-Message-State: AOJu0YxZVQJDizRw0Ht82m3Xu/mwc78UMconv4/mvTO2jgGsc3sl5bOW
	SA9E9H7ljqt386zXE74K+8ZnnUzGEbMA+nkpLJjNbRJdpI/hmbd/RBb4KKfgUQ==
X-Gm-Gg: ASbGncvO43szA+tm1eeNpfej8w0rPIL6fHpDUWpJC7VfGjwkeAeY5JkuEJqSEoEQcOQ
	in3UJQJ7KdlGn+Qt7nhxPjr8ObQnX5WA21bfzC7FZ2aEAmDld444W2ZkBKHFhlgNm9ITEFRPDmA
	330zTMPhv8PyKFlGUCmMf9ZeqxWkuPz3npgcnKQKvhwK6C1C9Ds0Rn263it+JIWzM+jsyjuET76
	qkp3M9L4iGk/UN54dr4Ao+JkuB33T2EtN+oFC4z1OaVvsvoXXq0u7FANXsmgn6qRysVwpi7hz2H
	B/l94u4ybioa4ylxACSPD3SY2q6w2XiZM8uEYwztsWqf5NiNTOXchSD5rZ1Qmr60YVUwBvtqNdC
	/uQW4590cFS/uDpVjLix+2zNBQveXrB/egcLei10=
X-Google-Smtp-Source: AGHT+IFfi8UuFAYQjEy7l3BA3dJvfF0+JO48+2QUY30u6pN9hylsIH72wrE3T3OJ8QBiBWVpD2GDFQ==
X-Received: by 2002:a05:600c:8714:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-442d033a3d9mr3016065e9.23.1746637831970;
        Wed, 07 May 2025 10:10:31 -0700 (PDT)
Received: from [192.168.1.24] (90-47-60-187.ftth.fr.orangecustomers.net. [90.47.60.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd33103dsm7143265e9.10.2025.05.07.10.10.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 10:10:30 -0700 (PDT)
Message-ID: <779ae10a-3174-4dbb-9130-008393b59745@broadcom.com>
Date: Wed, 7 May 2025 19:10:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 -next 08/12] arm64: dts: bcm2712: Add external clock
 for RP1 chipset on Rpi5
To: Andrea della Porta <andrea.porta@suse.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, kernel-list@raspberrypi.com
References: <cover.1745347417.git.andrea.porta@suse.com>
 <38514415df9c174be49e72b88410d56c8de586c5.1745347417.git.andrea.porta@suse.com>
 <aBp1wye0L7swfe1H@apocalypse>
 <96272e42-855c-4acc-ac18-1ae9c5d4617f@broadcom.com>
 <aBtqhCc-huQ8GzyK@apocalypse>
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
In-Reply-To: <aBtqhCc-huQ8GzyK@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 5/7/2025 4:13 PM, 'Andrea della Porta' via 
BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Hi Florian
> 
> On 09:32 Wed 07 May     , Florian Fainelli wrote:
>>
>>
>> On 5/6/2025 10:49 PM, Andrea della Porta wrote:
>>> Hi Florian,
>>>
>>> On 20:53 Tue 22 Apr     , Andrea della Porta wrote:
>>>> The RP1 found on Raspberry Pi 5 board needs an external crystal at 50MHz.
>>>> Add clk_rp1_xosc node to provide that.
>>>>
>>>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
>>>> Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
>>>
>>> A gentle reminder for patches 8 through 12 of this series, which I guess
>>> would ideally be taken by you. Since the merge window is approaching, do
>>> you think it's feasible to iterate a second pull request to Arnd with my
>>> patches too?
>>>
>>> With respect to your devicetree/next branch, my patches have the following
>>> conflicts:
>>>
>>> PATCH 9:
>>> - arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts: &pcie1 and &pcie2
>>>     reference at the end, my patch was rebased on linux-next which has them
>>>     while your devicetree branch has not. This is trivial to fix too.
>>>
>>> PATCH 9 and 10:
>>> - arch/arm64/boot/dts/broadcom/Makefile on your branch has a line recently
>>>     added by Stefan's latest patch for RPi2. The fix is trivial.
>>>
>>> PATCH 11 and 12:
>>> - arch/arm64/configs/defconfig: just a couple of fuzz lines.
>>>
>>> Please let me know if I should resend those patches adjusted for your tree.
>>
>> Yes please resend them today or tomorrow so I can send them the following
>> day. Thanks
> 
> Sorry, what's the best wasy to provide the updated patch 8 to 12 to you?
> 
> 1) Resend the entire patchset (V10) with relevant patches updated
> 2) Send only updated patches 8 through 12 (maybe as an entirely new patchset with
>     only those specific patches)

Either of those two options would work. Maybe let's do option 2) in the 
interest of keeping the traffic low for people.
-- 
Florian


