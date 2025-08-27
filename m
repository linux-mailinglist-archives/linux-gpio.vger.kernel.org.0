Return-Path: <linux-gpio+bounces-25032-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9053BB387C7
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 18:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 886FE1BA175F
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Aug 2025 16:32:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D78B286881;
	Wed, 27 Aug 2025 16:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="eLPfFlmk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f100.google.com (mail-oa1-f100.google.com [209.85.160.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B446B269AE9
	for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 16:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756312342; cv=none; b=kyZpCg+dr0txv3F3jUDVetfqD1l1h5fkHLYYGWRURBDZBSvHjdtmDW75amC6Rq2u4i5q5lATkWmeeJPJvHgB8r+lwhqlEOsON5H7XC2DRsJmT+B3Rcg5/NFDAL34twm8zdSASNhXFV61ZbaB8XhSIQHs0h3BdtYBY6MtKIoVino=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756312342; c=relaxed/simple;
	bh=mLpKPATLAipscdT0O9B+4JaAX0nCwFq/LatPYj6QMy0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HuoFCPi4bs5Moiy/DXWRe3Fu1R/LaWNPr9I25r3nZIZsG+COqB8PNEkbqkxtvfhZYIJSzUclGRdqhv78RkuHx6eSMDudMFZkyGCCrdE8sCesIVo3SrsM6LfuDq7VNn6o4DaReXqVgBPZEHh0G7hVwOiGy9dYbGIzOXJLAHSEw3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=eLPfFlmk; arc=none smtp.client-ip=209.85.160.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oa1-f100.google.com with SMTP id 586e51a60fabf-30ccebab736so43664fac.3
        for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 09:32:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756312340; x=1756917140;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p8dktpCBHOsNkqxhCr4VDQbXXVvhYTbllt04Kcihkl8=;
        b=qmEj8btsr+rNr5abmWfJgBkDugFPOix1xWqHtdBv7C1s3llS0S3P3MOPagS8MVMO1K
         KuZNPUj1/0K5y32YEQBanlM7TBH3hjajvYlqsK7pbBzjoGX1/o+6VpCdcuHb1FuxDCtK
         PY7nTUJ02af8KMiA8zG6N3G+n9iZ2q1FtCODKyLIQGhLTV0naK2e47uTLVgQXu7yoESz
         DL0uolrUJ5BpIRuc+fzgOmzPi06jmu5C3uK6EYRFTtRnrZApfjsJYckrFWu44gqWjTLu
         Lhh1ruUeusBHxDNzDPgd6oUk1H7NCFvp9MM0iw9TNM1W64Yt6B+Bildi1p1x1LKsk5F+
         i2mA==
X-Forwarded-Encrypted: i=1; AJvYcCVWGgpotmzB7/eqNwe3fQ64/WqDUJQOXpzdoedCFDRAFrA8b9Wc6n360BEBWGV8YyaEp+EhPAgEeeSb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1VvvqHwwnwUzSkwHk3GQ266UdTcLoNokTgooDHIpA8WGAePtP
	n0O6ePnKpqErQ2c2oXfQSot6uLteV4XOqCF0MooOonoJlj8LfxK0F1EsaTDtnm/4d15bFQGf7VP
	FutJSUkvfF4UAYXWNSeSbcziooG9edOZZo9mASzn5WPEEXMypDlluulqzDzN/mErNuhb7nkf0WZ
	P6FPxB9PKobTQhTsXKvHULlq9E+RSRCR39AEPW4nQLVFYeYspRxjQXI4Ex+G76/HyJtl42gbP7U
	tCkEhlR8S9eOD60Av3oAw==
X-Gm-Gg: ASbGnctth7LPqOw0U6bhdv1djGMlM+n17S0VQ+yU4vi2hw+5LeXEalJMYxyvjGnImHw
	YC/d2U3EEK+Q0sb4f34Yci+AZqf9Ed9gMGEzsLC1YJjAgd/RFmvRFER4rO2Yk0BbKZ4N+4zrNgJ
	tpOT1JIGZszHfPdMLvTr0atI+FGcOugCvD+TVHAHnCCBW25lbGmVOQK5rY6fKednOgv3vMB6J1+
	Q/1NQn50FEulBKX0XRijmCfP2DAFq5o4/ID8DRkdsu1NbB0LAZhODgHBY3hief6wkYMUvyxSsjj
	vkp4b3nLnQgo1yppC3JpfF+tfuWOSAXUMC0X/UFnl+0nVyxPiSbIkmm1M4Wc1jWef1hyzEL7att
	2Rp9wBKBQd3/mTwB//HRK2wAR7kS+c8fpCxxH7sSw7Gpy20SsQRs7ckgygJqvf/IDTtbj4Xj+Ml
	o2TPZ3
X-Google-Smtp-Source: AGHT+IHAGnn3PumGPiW+zfGmFwHVtoAkSBpWiw6zfwdn5P+Gwjvrn+33Q2XhHQuAJoioeT2sbUu7mb9BkPKh
X-Received: by 2002:a05:6870:c087:b0:314:b6a6:685c with SMTP id 586e51a60fabf-314dce21966mr8906073fac.42.1756312339651;
        Wed, 27 Aug 2025 09:32:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-11.dlp.protect.broadcom.com. [144.49.247.11])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-314f7c31314sm1329231fac.22.2025.08.27.09.32.19
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 Aug 2025 09:32:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70d9a65c170so1990566d6.2
        for <linux-gpio@vger.kernel.org>; Wed, 27 Aug 2025 09:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1756312338; x=1756917138; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=p8dktpCBHOsNkqxhCr4VDQbXXVvhYTbllt04Kcihkl8=;
        b=eLPfFlmkuxDYmvBSvM8GA95l8BTZdmF/azbCV25KbY5wKziLlm1T6r5yNxegwqK5pb
         MfPhh2qFAmianlf2NmvrFi7GZNfv2FJfNLuZUyMWMpgQEjmD1rA4RncPtNqIdNs7nMMd
         sWkbpl/FF/DZj99BUU+AgYKmvkZZW1zWbpJyo=
X-Forwarded-Encrypted: i=1; AJvYcCVVgS2JuQvdvgxtcpS+OXZv9jKiCpP6Jt3I8FrCUFldOekYPv4yzwVwFywNScuPpmIJOsy+m79y2VT7@vger.kernel.org
X-Received: by 2002:a05:6214:5344:b0:70d:9819:879a with SMTP id 6a1803df08f44-70d98198d82mr255971496d6.58.1756312338171;
        Wed, 27 Aug 2025 09:32:18 -0700 (PDT)
X-Received: by 2002:a05:6214:5344:b0:70d:9819:879a with SMTP id 6a1803df08f44-70d98198d82mr255971066d6.58.1756312337610;
        Wed, 27 Aug 2025 09:32:17 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70dc969f011sm44700806d6.22.2025.08.27.09.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Aug 2025 09:32:16 -0700 (PDT)
Message-ID: <2ff3ec4e-4824-4d03-bab2-a69229764692@broadcom.com>
Date: Wed, 27 Aug 2025 09:32:11 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] pinctrl: bcm: Add STB family pin controller driver
To: Andrea della Porta <andrea.porta@suse.com>,
 Stefan Wahren <wahrenst@gmx.net>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 iivanov@suse.de, svarbanov@suse.de, mbrugger@suse.com,
 Jonathan Bell <jonathan@raspberrypi.com>, Phil Elwell <phil@raspberrypi.com>
References: <cover.1754922935.git.andrea.porta@suse.com>
 <bb746d2fd50ecbb9963438fae8601c2e4901a126.1754922935.git.andrea.porta@suse.com>
 <6d812c08-341f-4f7f-a9ed-4545217cb8a8@gmx.net> <aKc9G9owEfYD-_qM@apocalypse>
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
In-Reply-To: <aKc9G9owEfYD-_qM@apocalypse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 8/21/25 08:36, Andrea della Porta wrote:
> Hi Stefan,
> 
> On 11:18 Tue 19 Aug     , Stefan Wahren wrote:
>> Hi Andrea,
>>
>> Am 11.08.25 um 16:46 schrieb Andrea della Porta:
>>> From: "Ivan T. Ivanov" <iivanov@suse.de>
>>>
>>> This driver provide pin muxing and configuration functionality
>>> for BCM2712 SoC used by RPi5. According to [1] this chip is an
>>> instance of the one used in Broadcom STB  product line.
>> i'm not sure about the whole driver naming. The cover letter describe it as
>> "pin control driver for BCM2712 SoC", but this patch is described as "STB
>> family pin controller driver". So as a reviewer, I'm a little bit confused
>> of the domain of this driver. Is it for a single SoC or really for a whole
>> family of many SoCs?
> 
> It seems that this is indeed a whole family of which BCM2712 is the (first?)
> incarnation. I'm not really aware whether there exist other physical
> implementations but I'll amend the comment accordingly.
> Please also see:
> https://lore.kernel.org/lkml/d6ab66cf-09ac-4f53-9102-11f207d16db5@broadcom.com/

It's not the first, far from it, that pinctrl/pinmux design dates back 
to the first Broadcom STB SoC (BCM7038).
-- 
Florian

