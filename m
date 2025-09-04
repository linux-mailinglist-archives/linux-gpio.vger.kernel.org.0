Return-Path: <linux-gpio+bounces-25614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E549B44637
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 21:15:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C55501765E9
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 19:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11FB426B2A5;
	Thu,  4 Sep 2025 19:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="MSBL8iES"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f226.google.com (mail-pl1-f226.google.com [209.85.214.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ADEF248F40
	for <linux-gpio@vger.kernel.org>; Thu,  4 Sep 2025 19:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757013315; cv=none; b=QtcIqyHTbNvewm8PJhKbazlc/EdarAaPN1+pcy0RvXMSPzGnbqal2itw8uC+luufJFrVDlDiyjOwwsmCDksziW5BL2LvXt7D16lUthb0RHp/wpCP4smad2cEAehjC1ZrIlwoaUn+A8rsCDqFjX6Ahzo/bmhCZauMJQBXLobq3ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757013315; c=relaxed/simple;
	bh=6V792/1g2eWbu3RbgHBg2ukBn3hGT4RGTI4ETdhPQAg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qg16KCIoKRirdz91jzPvnFTKqzEXbG1+3JL2yPQoYZkrOec6uVYeJ7vrMuIVBX3H7uJq6bp9hi7aI8OoBS6VaS5OendG5bWOJdX60lDP7/He2P9/+V2Zc+wflhaFIZlO+QZAF7Ky6PKvo65TCAy5MBoZQBfd+vTPeFp22RsNmGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=MSBL8iES; arc=none smtp.client-ip=209.85.214.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f226.google.com with SMTP id d9443c01a7336-24b1622788dso10942975ad.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757013314; x=1757618114;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eZiieBGzgeTWDXPUpLFCSn69qavVvYJKylSI1VGv3c8=;
        b=BN19lDRb6TBZtNI/DVGz+GLLgfnmNtbCpu3ze9wdiKdYgSExszKMYtDnOskHYyGDen
         lLXAcoWXme8kze8VXQ3tM4NwVxkvvmQM74ftnyDlXq+pfxGL8/6KhqiF2WO+lTxLvp7h
         jLwb66UVGACVkpj43uhzfOr6V0sN2Fo1h/5LFaNIZb0J6AdtWzLe1yOavHjeJqUj5oTk
         vmScOHDqxzFhx9W99j04DZBVYQ1DOpPw8SpUgkcKTjSy6Jjut50b8t0zhZ0zOVb4Ugyq
         wQw5JBrxA6/mWoSvhS3xQx2N2bN1HNB0FOpR7St1pD/XFdBvrImO9mmYmcuUuuabA6+0
         Pfdg==
X-Forwarded-Encrypted: i=1; AJvYcCXh/owZSOg459KQkc5D8baElSng/9ilyLjLzxBWpw2THamJv3B0ttFDANwbzwDkeF5mzbcrrMv4n3VW@vger.kernel.org
X-Gm-Message-State: AOJu0YwdwyInU+3a6m2qKzDWfHI1YuabAT8zeBJ9HQxhgvF7Zz5yX94k
	wh/u/7DXXlvlonffXOG4sLlSO1zpsMjymXfnVvq3nZ3ZAuBgsdOiLSCy77DVnpPyRPrloEy2TrI
	kGkvHyO0sBlhWK8cI3wYdskemVzncdiVJrKSWyQBnIRMMSeivSxSWb9rE826GdI1EGdudrR1a+3
	9Fknfh7P8enqYPF5+pddB+6scGvPu+fvosfX1k7sZHmlwpWOuu0g1mtLNuUmIG0joCYCFJiYKUd
	dkoEU6i7e6iye0j93mDUQ==
X-Gm-Gg: ASbGncvNlpUUAOV3cl+puiHg7RztGuazd3NU3W+0VbzKtI1pbrMObBR6bmoRX1C99qQ
	rW/4s/U9JFTpljwfGmA/m6FW/l7xamLxm6RERq6IuYkmKIQ3wVsGCsn5kouWNKlljkrfO+9xKNW
	o6SurFSEpv95oP0J4/66A6/HZYI1Jb9XLej+bfyw2l4phzBR+VDt1c/TqYmhTMl5RLkWOoPRz8m
	OYyf9toFY4Shf5MTXup9Qr5G6T7EnjaPn+whB9s0kpxoXRdQTrHfrse4uekDKKmsIdKxTyLebjz
	iPxCIsRT4P+pTmIrGTnpMt5puiiQzSGdHIw4zX3Dq/GoqyafxXyjcWc6FxAzrJx0xdWymp9sXh5
	fQIAc+8EZLS+EKz63bBtsmHCSxzmO
X-Google-Smtp-Source: AGHT+IGIDF1LFF/bDPFY2EGvSOzCJRPw3gqc2LRVqy2Y5n3Lxyo9/izZ+eewjfh9A92LbiTmNmlAQmRwiqeF
X-Received: by 2002:a17:902:ce07:b0:24c:7b94:2f87 with SMTP id d9443c01a7336-24c7b943278mr117198525ad.14.1757013313623;
        Thu, 04 Sep 2025 12:15:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-24b2ac85e1bsm6313395ad.46.2025.09.04.12.15.13
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 04 Sep 2025 12:15:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8078f1bc588so300589785a.2
        for <linux-gpio@vger.kernel.org>; Thu, 04 Sep 2025 12:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757013312; x=1757618112; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=eZiieBGzgeTWDXPUpLFCSn69qavVvYJKylSI1VGv3c8=;
        b=MSBL8iESk0rbhzgSQtZKBVRzA76Zr54y54aM8NIojVdcOudM0e1CmsGdXqyaVKb6ap
         RHM8Hiia6NL8YXAPHq6y6eZt4VRs6E5VD+574JYK4Oit1bSWJdACpFFVgToO57lnO5um
         hTaFXg/QjEx/+xrZQQrPU69Jn4DUpoxZBHJsw=
X-Forwarded-Encrypted: i=1; AJvYcCWcjqTXLS77D2HlQeLEy+GvwZO5Zp0yFja3E0Rk+kx8ONLsoHUjG5p6CRWnuKR2etVL2O6QBk72FiP1@vger.kernel.org
X-Received: by 2002:a05:620a:45a3:b0:7e9:e67e:d068 with SMTP id af79cd13be357-7ff27b1f7e5mr2273630285a.25.1757013312167;
        Thu, 04 Sep 2025 12:15:12 -0700 (PDT)
X-Received: by 2002:a05:620a:45a3:b0:7e9:e67e:d068 with SMTP id af79cd13be357-7ff27b1f7e5mr2273620085a.25.1757013311273;
        Thu, 04 Sep 2025 12:15:11 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-80b105e1ce6sm307324985a.67.2025.09.04.12.15.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 12:15:10 -0700 (PDT)
Message-ID: <c973d935-579b-42cd-bf92-618d9f9d4eaf@broadcom.com>
Date: Thu, 4 Sep 2025 12:15:06 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v4 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Linus Walleij <linus.walleij@linaro.org>,
 Andrea della Porta <andrea.porta@suse.com>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 wahrenst@gmx.net, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <bee7c98a96c7000db32495b94ebae2ea06fe0e77.1756372805.git.andrea.porta@suse.com>
 <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
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
In-Reply-To: <CACRpkdY82ohgX_7YP16DJrzDvxMHcSu3rW+UtEmrP0AQiD_Exg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/4/25 12:06, Linus Walleij wrote:
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
> Patch applied!
> 
>> +config PINCTRL_BRCMSTB
>> +        tristate "Broadcom STB product line pin controller driver"
>> +        depends on OF && (ARCH_BRCMSTB || COMPILE_TEST)
> 
> I changed this to (ARCH_BCM2835 || ARCH_BRCMSTB || COMPILE_TEST)
> because Peter Robinson told me the Pi5 needs this driver too.
> See commit 1d99f92f71b6b4b2eee776562c991428490f71ef for details.

Good call, thanks!
-- 
Florian

