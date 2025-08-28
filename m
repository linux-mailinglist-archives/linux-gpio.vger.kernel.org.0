Return-Path: <linux-gpio+bounces-25133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF77B3A7AE
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 19:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0431316D691
	for <lists+linux-gpio@lfdr.de>; Thu, 28 Aug 2025 17:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93F0A3375B9;
	Thu, 28 Aug 2025 17:19:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Kd6Rnehs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f225.google.com (mail-il1-f225.google.com [209.85.166.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0954F3375A9
	for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 17:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756401590; cv=none; b=ZTfFy9SPqGoud4+mmCFVnJFjvitSKXMN2DaOk/iOGVijHFMIT36kV+598HfWH/Wd6F6Lt98QlSDwtPVlpL6XqF1+AS9gONcdyWsSsHlC/LdRgAvcM2T89MMSGRQ0tH4EJILH1IX8PHKQKZ6T2Duci4MU/by4bQyHke4a+h4LGGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756401590; c=relaxed/simple;
	bh=oKaJNr68geV1364Fit6zujhxOTPYYNaTUj1N+dfS+Fg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=U4pCLBBS+j0fYW3gTXsDHmyUEgIUvK3GJpFwhb7prJt6yeG0FqA0VO/Eab+sRbI26A47mQfJ3gIc643hJuIR4AV+BM2OXGnG7qaAIMMY+flhHnnatCjh7i8ypZJf+6YsgEM4bB8CQngYJ/q3RGiSc2cA1f52t7/WsvKYwaQIGk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Kd6Rnehs; arc=none smtp.client-ip=209.85.166.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-il1-f225.google.com with SMTP id e9e14a558f8ab-3ea8b3a64bbso10286945ab.0
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:19:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756401588; x=1757006388;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=spNd66xUF/MHH3XfU8KuIautX8tRrHIWRjBPGEFbZH0=;
        b=t8mhIIr55SAAcVICfoZTt+ydaqjecYovluN2EM0deDA89+7NvCANDHrX02JAXp0pwE
         67I7UYYfVoZfN+kjiXyn5R0a3pPf3ELwv5+MfpH0kXKt7WPVgKEcIQoGRJjjgggBZh6e
         NffgTAMaaciK+D3l4GSHfNO7GYiDJ/Iz7rvKiHrt1KjYPLgEOMoJb6UBJUuE0+kUz2ZY
         pMPYm8mp7SSaoKFBi3pIGcNvquSHmOz3qrxBRPGBDMQkng4QUqDNH0WxsgMzEEPENA6k
         Wgdp7ttgPAkKT9ZDJSGncLodb77Y9qTsX8b63WRtjJvrAUryJ1nZxO/qlnzBKaHaSaUe
         XF1w==
X-Forwarded-Encrypted: i=1; AJvYcCV/ufPLGELey51plbFd3+m+m+rM7tQqhfWNdX6ilFmxRvWS03xr9LaXQHF+0fhJjrt1kjkPX6fF6STl@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3VqlKJ037Ksm3dq7L1Oztb8UX+rAQHuT5iQ+sHvaIQ0xlASLh
	glKidFGwCLL+oOnsEp4iqn0Zm9ZGR+uQ9fbSuSOn2+qkDa8UBBeP2NAHOrdWZVSYjc8RSjQuLoW
	g11xOdyCuEDOVvWwskmSkc92G9uYvt9j8iyl5aZb/8niRG49GwDGqvg8sw8FcTZ4G8Qnx8pTghS
	bFACZskLBc3+YVj2HsjotsNQxC8WJoBuQ5PlzOk0xMYH2B4lZvOE230ILxrtNDxAYTqqxsG3Aut
	5pZ3qO6FZsZRNlF5OwAFw==
X-Gm-Gg: ASbGncsYp4E/jw6F0LKXS0zp4cJ/cTfnjDuHDntTOyYWPidoWmatIhO020VpMhPWl0+
	fSvXmiTNbGA0aeT3UteHlXRz2vNhXjDh/DY5tjiFcbue0hjeZA2kiznj3c7aYEtANaYl6LU7k2J
	Z4YfoXG0F1PaqaCl2Iefv+afVYXZI+3OBLhvwL0nebkf0CKQJ2b/ZLMPl+qN0Rb6N1UZX9bi6bW
	hvU3fBV81yy8DZMl5FRK7Bul1pVBzrClOJ842+JtzSFjkTbM69Ec/NNU435hg4S9W5PURoJnMQB
	DssmEd/KJ+1/z/03OCM31xXp8YzrhPjRXMx2h4b68qyMR6TAJHlwAAyE7ZwWecf4XIEyBa//7WH
	AMfMKgbGGhrGsP3GJELLY3iofJG3ZnI3OzyqNqpJylBJ7+oyIf2BYrs8f6Z153n9iqFQ3T6aYYY
	s+cT1PtUA=
X-Google-Smtp-Source: AGHT+IGDKiWWgYQAPfLe7b6ZLoczDG9k7UTvXofHIHGcx0y95ZNCkbhwyn0xXQYp4KMD8ezgUKBvsJ47z5Kr
X-Received: by 2002:a05:6e02:1909:b0:3f1:4d69:f847 with SMTP id e9e14a558f8ab-3f14d69fb9bmr46991605ab.26.1756401587860;
        Thu, 28 Aug 2025 10:19:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-122.dlp.protect.broadcom.com. [144.49.247.122])
        by smtp-relay.gmail.com with ESMTPS id e9e14a558f8ab-3f26f4e1f55sm97915ab.0.2025.08.28.10.19.47
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Aug 2025 10:19:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109bd3fa0so16353291cf.2
        for <linux-gpio@vger.kernel.org>; Thu, 28 Aug 2025 10:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756401585; x=1757006385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=spNd66xUF/MHH3XfU8KuIautX8tRrHIWRjBPGEFbZH0=;
        b=Kd6Rnehsjs3COVD7ahpfMh2852wY6hw93ZvBg+CcW25bKijPbTON1wc2LEp5QaNjr/
         w81b53sdy1X1+BE+5F8xcjrEV/B5FmJ0epRJxd9wEgYJkl4sPLrrjzorPD9BV5JqVi82
         fsN9olp0CGFFtLY0uRdiJunYAuWw65Sp3ZtX8=
X-Forwarded-Encrypted: i=1; AJvYcCXqp70pjAKnh/5+EZ63dVIeyqJumL/gEBIkCsoD6Lk8wpC7C8eTDG2o9N+pXoBMvKCIGd5HGgjBZK6I@vger.kernel.org
X-Received: by 2002:a05:622a:40c4:b0:4b2:f469:28b0 with SMTP id d75a77b69052e-4b2f4692bc2mr69991521cf.48.1756401585200;
        Thu, 28 Aug 2025 10:19:45 -0700 (PDT)
X-Received: by 2002:a05:622a:40c4:b0:4b2:f469:28b0 with SMTP id d75a77b69052e-4b2f4692bc2mr69991061cf.48.1756401584649;
        Thu, 28 Aug 2025 10:19:44 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7fc14754ee8sm16100285a.32.2025.08.28.10.19.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 10:19:43 -0700 (PDT)
Message-ID: <fac53dd3-9774-4a14-9557-19c2a2532a0d@broadcom.com>
Date: Thu, 28 Aug 2025 10:19:39 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: defconfig: Enable BCM2712 on-chip pin
 controller driver
To: Andrea della Porta <andrea.porta@suse.com>, linus.walleij@linaro.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, wahrenst@gmx.net,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1756372805.git.andrea.porta@suse.com>
 <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
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
In-Reply-To: <38704a5ab6913845bbf9178170e83004ab3e8fcf.1756372805.git.andrea.porta@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/28/25 05:47, Andrea della Porta wrote:
> Select the on-chip pin controller driver for BCM2712 SoC.
> 
> On RapsberryPi 5 devices it is primarily needed to operate the
> bluetooth and WiFi devices, to configure the uSD interface
> and the power button.
> 
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
>   arch/arm64/configs/defconfig | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 58f87d09366c..d4c3853d885d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -592,6 +592,8 @@ CONFIG_SPI_TEGRA114=m
>   CONFIG_SPI_SPIDEV=m
>   CONFIG_SPMI=y
>   CONFIG_SPMI_MTK_PMIF=m
> +CONFIG_PINCTRL_BRCMSTB=y
> +CONFIG_PINCTRL_BCM2712=y

Do those need to be built-in or does it work good enough if you have 
them as loadable modules?
-- 
Florian

