Return-Path: <linux-gpio+bounces-25334-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C241CB3EB8B
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 17:54:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2C63B16AFCE
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Sep 2025 15:52:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A94E1FBEB9;
	Mon,  1 Sep 2025 15:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="YClLNFv9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f228.google.com (mail-pf1-f228.google.com [209.85.210.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9BA32F760
	for <linux-gpio@vger.kernel.org>; Mon,  1 Sep 2025 15:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756741924; cv=none; b=GNEQUOoRfvHjDyXFojD8jEyT8R+n/CiIGiOLj5JNkrAte15rCtdfFXdb9DUlGHt0Rq7l3SG3IqanyfpAk915Y2aINz+desMWFj0AyxWbroRe/+IHK0CSfv476sfEpBJQBpk/IqR3R5y2nAPIrd0vZbcgSUy9+nSKoYS3zlabmss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756741924; c=relaxed/simple;
	bh=JbPzfdXHDZJ9gYlfx7MN3qVylAPGdrG1em8Ho8grvok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nwNdnjTeXVOGkNrWxsWnQXyEo684hIvkmNBLhKlHTMhKp1GV/2UMZ3KFHzP6J8XZ2ggCphk1B+gUHwBwjUOoPs4/lTQYrSv32LzXBvrZDTudkwl3jNyY+Y2bN3YQYvkkO3WUsBmGS0RQKfd6G3f+jV9E9Wu5Y9218I8oP8+cJ1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=YClLNFv9; arc=none smtp.client-ip=209.85.210.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pf1-f228.google.com with SMTP id d2e1a72fcca58-76e6cbb991aso3987537b3a.1
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 08:52:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756741922; x=1757346722;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6HemR4kSrfP/7khlBRkJG8otPNKX3FGzo4p9L0pbKqM=;
        b=aSNQKKwClcMEQ03cN9PZsWdRGPSTnEEjmyKxrAt+8x4pd2FWB7tVqbCQxBT7zvVC8d
         zdGi2OR1+MBqqwSKkXRrOJBB3ag6M5uwl09b7wggUmjp0zMHofXPRVXQ38fcoIRkjEMn
         U1gzH5QTO0sIAX/7tKlmquD9z62uMONLrMEi5MIVquFUkm81p0z9dt6X37cFsnXmCIsn
         qTQDTJh07eG7SLKoAEMWr+M/a7skZcvYxTP0/dHv7H9ruOd8SmZpDmgk1XTRBzfrxLg+
         qlABazNKZ1aJo53kitriVRuaXEiUCWMDtBeCltqeC+EOScAYwVD1VmwUG+Bp9TeLltGO
         i6VA==
X-Forwarded-Encrypted: i=1; AJvYcCVum/f6pcR6x/sH34Sru1Z3+2NqVmThR4kGGN+XvpsQkTAObtXer7WRAglJsLGSD50zDfCFUoPjURct@vger.kernel.org
X-Gm-Message-State: AOJu0YwHZWa0Bys9msClmm3k5oRbvXv3Bta2E3lMj+g+FG3GCTrvXP+T
	2J7FLksem73OJakmURbcYKS7tVfdng96qwhODuIg+N6gep2vohtwwzkfv6TEk3wDMoRvUsyRzID
	noqQNlq/vic/On7gxSzKTxQwpOmIkLd7FW+J7YdclHOv5qZ+3W7O+nDgSw7SWwvmZUb9Av4+f0M
	ac0cdEuV32/3yF5w7R4PLMaXT4F0ejCs/whNOZgLtByoode6ZSiG9k57vRJlQZ1wsr2nHXb/uf0
	B+ac2LLB6hbPt0/e3n6qA==
X-Gm-Gg: ASbGncs7aSroXiUwDP6Qg0GZxLlvw75wNlrR0NsZR797RpD/IjMN3s+kyPXdbltn3Uf
	7Wn1BeeT3CpOYbZcfgplQw2vzbwqXQ7/AZwCpBBeogxEQ7l+TM74ERMOPDKoeR2/c7JtqJBjC8Q
	jt0Pcw3rlCZ95q35YWDKBvQuCNrIhZ/Ceof78jqAC98I3hjxQobsAmzoI5mPlnKTIIyuqHQ/XBK
	pAqMR5HhFEJHTv44mI2CXE10rcmmypvpdJ23TFtm/vpHPxrxLgPsy2utbueV9JNlTgWZh3LpXFk
	RCT91PrhKe02LwcZEnjXusst3yU9ViHgZPAHFqvWgF08LbxbVYCO35XHtPt81KWQblKtqmr/J0G
	lpZPf/AeG/tSKMFNe41vHsWI9pudw6uao/AkvbjNvX+swMXMgWGSk9IsxcPofrpu8pwRhtju6zc
	FLIIhbXgQ=
X-Google-Smtp-Source: AGHT+IGd8iCo94eGh+1gKyFx3Or07eSnpnucDhCq3OV8J3ouYJrBy/lgMZ0WiGI/7KZmZ64otj2n7OSIPfMB
X-Received: by 2002:a05:6a00:3a16:b0:770:54e6:6c36 with SMTP id d2e1a72fcca58-7723e1f4f41mr9069291b3a.7.1756741921445;
        Mon, 01 Sep 2025 08:52:01 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id d2e1a72fcca58-77249053ee7sm334241b3a.1.2025.09.01.08.52.01
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Sep 2025 08:52:01 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-32769224506so4465645a91.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Sep 2025 08:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756741919; x=1757346719; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=6HemR4kSrfP/7khlBRkJG8otPNKX3FGzo4p9L0pbKqM=;
        b=YClLNFv9ZxUrTQNzI2+xcHwdK5e7tj6Dvo97wDA/H0d/I3y7d7aH9StdLxvATk6LRs
         ubvtmLbv9f0y6KCs0xfrXKCZemnrnbTu94BpyPS3UKkOTXR34BygfiH/wVfUxfBSkpJN
         BGeib79NW6Wpz0uY8FUAJ3oQS42jpq8L13evI=
X-Forwarded-Encrypted: i=1; AJvYcCUtNc7FLs2LfYNysZNl3R09ov2Vsphs1+yTcyc+LMcdOt7/EdSoFZAENpbVSIoJcaWppoIVGKtkZgcj@vger.kernel.org
X-Received: by 2002:a17:90b:1848:b0:327:96dd:6293 with SMTP id 98e67ed59e1d1-328156cb806mr12019351a91.26.1756741919609;
        Mon, 01 Sep 2025 08:51:59 -0700 (PDT)
X-Received: by 2002:a17:90b:1848:b0:327:96dd:6293 with SMTP id 98e67ed59e1d1-328156cb806mr12019311a91.26.1756741919133;
        Mon, 01 Sep 2025 08:51:59 -0700 (PDT)
Received: from [192.168.1.3] (ip68-4-215-93.oc.oc.cox.net. [68.4.215.93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276f57b232sm17144343a91.2.2025.09.01.08.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Sep 2025 08:51:58 -0700 (PDT)
Message-ID: <f6938ed6-30cd-4bf3-9753-ae107b4b28d4@broadcom.com>
Date: Mon, 1 Sep 2025 08:51:53 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Linus Walleij <linus.walleij@linaro.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wahrenst@gmx.net, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdac9K7mc5DAUnb82bR-eyzdsurRX_qFu8qoCFARDmTe4Q@mail.gmail.com>
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
In-Reply-To: <CACRpkdac9K7mc5DAUnb82bR-eyzdsurRX_qFu8qoCFARDmTe4Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e



On 9/1/2025 1:21 AM, Linus Walleij wrote:
> On Thu, Aug 28, 2025 at 2:45 PM Andrea della Porta
> <andrea.porta@suse.com> wrote:
> 
>> From: "Ivan T. Ivanov" <iivanov@suse.de>
>>
>> This driver provide pin muxing and configuration functionality
>> for BCM2712 SoC used by RPi5. According to [1] this chip is an
>> instance of the one used in Broadcom STB  product line.
>>
>> [1] https://lore.kernel.org/lkml/f6601f73-cb22-4ba3-88c5-241be8421fc3@broadcom.com/
>>
>> Cc: Jonathan Bell <jonathan@raspberrypi.com>
>> Cc: Phil Elwell <phil@raspberrypi.com>
>> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
>> Reviewed-by: Phil Elwell <phil@raspberrypi.com>
>> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> 
> Overall this feels merge class, I am looking over the requirement
> series from Bartosz to see if we can merge it all today.
> 
> I also looked in a vendor tree for the (by now 6 years old...)
> BCMBCA driver, but it appears to be a completely different
> beast, requiring some magic 0x21 to be written into a register
> to "commit" a pin control change.

Yeah, the BCA chips have a different controller for pin mux/control.
This driver submitted by Andrea is common to STB and CM product lines, 
although the CM chips also used the BCA block at some point in their 
history.
-- 
Florian


