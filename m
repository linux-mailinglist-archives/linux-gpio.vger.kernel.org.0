Return-Path: <linux-gpio+bounces-25924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B31DEB52411
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Sep 2025 00:05:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A35511C864A2
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Sep 2025 22:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A142631159C;
	Wed, 10 Sep 2025 22:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="UxVeuMem"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f100.google.com (mail-io1-f100.google.com [209.85.166.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660430C350
	for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 22:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757541919; cv=none; b=nm+nlromwUgRzehRzEE/OFNZuu5Kma8d1tpTozrz5SK317Nmm5uGNEP5SlVS8S8s8dr6kp8MQnIhgMBWlJL3+XSTjOaz/bj6ZKuyV4ba/glznmz9yVIHwyZPfJlb4I3Z5G2VCQimRneEzZTeXucbKrQNA4Qw0v0R5ZDZiTq3FeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757541919; c=relaxed/simple;
	bh=WPmBkbbWU0R7UVuoQr9K4F2w4LPIWw8i2zUW2ipwqcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NvhUrwLqXyUtHLzLP+kGSY6xDhoKm0fMTA3Ml0ta9txXyFKk3dwoC6hROgVFh7U1au/fA53Xn8PHAkQOpW0kKYwYXMkJt36DM7LzbMvT5JCyfmQhW2dd7z5pXgqRC3E/FzhG5a/pkIEdd3ErhsQxYxBHeev7OMuQC3h6nvB1Mv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=UxVeuMem; arc=none smtp.client-ip=209.85.166.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-io1-f100.google.com with SMTP id ca18e2360f4ac-889b846c568so6452439f.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 15:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757541917; x=1758146717;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=;
        b=bffwSD4PpT1YqXduLV2md/T/8rK0CiBVLwPHvLyeAj00cKs7tAOy79rkVEM9+dEPnL
         yCCHBRkNj30/NwulADC0eK2KmjZh6MZXcfDNr4ViPHaqpOr+rOsfDBV258G7NcyV1BHN
         q9LXrjYrRLMChFZtllUPkoi4N60oM5H5a7OCPxIv/ymOaYfaPn7DHf21HQYGQnhYsEC8
         Ov6Lzw50Jb2kAnHSZQylgVonBnum0zN8pFUMVdSjDp1VjFvjbtd/jMirZZ7zoZJo4NBs
         Dy15sDCZrpQ7CRmiZKQrhX19DXPnwAQMW+EGExtQPNYAtfGFTmh2KFPH4sJ5C9ATSXgJ
         cx0Q==
X-Gm-Message-State: AOJu0YyjyEjv2TM33G1C6hgmk1BomZ+idXLYaaZkkfclBHbgMVKgKHeG
	stxoiFat1lREOAGr+lNxsZDgvsK+9OnfoMMRabcvAPFRqS/T4/hhcnyEzvL2NNk/ELKqqdYH65G
	Ff1ibYz5NS4ThOwo8CYbE+R8kkc7O2UnSnj9OnjvlfwXsHdAk3mOOWKo7qmljMTF0uFaQERrgoU
	nOlQg2j86flkEXEc86RwPHehkrKBNWWVT5AeEG72Vbu41e46kk6ejMQwdvcSsozyqISSnXmhd7r
	kVSWpNkFZj6y/oAj8orjA==
X-Gm-Gg: ASbGncuESnXcw/3WMZLgh9FherIE+5i/vaS9J1Xi3xNX1VSaUeNWEwLjc5kQAAI30bI
	FqFe6S/Xn15qXxIRTDlsILnOD1Jvy1Lfnnao1CP0XMhNVigkAitFxdMa/s4aIEnEsPG1T5wNIQn
	YPDCqFRILIuJL4JBuIuYAb+V97hqwVYWzKsdc4oOMxyfKGc2F+kWcbAevsEfoqT6V3Mn+EFuIHH
	myV3wF1g2Ag8Te16mqMapWht6nSFv1VRN+IeqZyKeplg5/n87xjnNvV9XG7yXGNghYCN2eg2PHn
	Jrje/P2hKfb9f9Rko8jmnKfNHg2AJgRbSW1LB5unllhjQEsN+lbjpAUEkWL4TBpVWQFrPDAZkJm
	6lCE+wggy2zPlR5LOazc1CrwU/rZ/RwK0u3BoogbQzA//8GRevTt6yBExWmqgSXBdHv1jDVIxh3
	LUV14hIGo=
X-Google-Smtp-Source: AGHT+IEkeVXRLr3rakgbUMioGLUB5kK0Yj81ypw+0KoC/WKC7YrKvcc+OCC8bNiNVjcuOWCU5fZHmFiXRym2
X-Received: by 2002:a05:6602:3c6:b0:88a:ffdf:f742 with SMTP id ca18e2360f4ac-88affdffc3fmr1731725239f.13.1757541917010;
        Wed, 10 Sep 2025 15:05:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-100.dlp.protect.broadcom.com. [144.49.247.100])
        by smtp-relay.gmail.com with ESMTPS id ca18e2360f4ac-88ee999d30csm3281439f.13.2025.09.10.15.05.16
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-258b7567e8cso343685ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 10 Sep 2025 15:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1757541915; x=1758146715; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=k+pRF4YDkBDpu0q0XohqilWJxU+Cw/6tcedpHDHdQxs=;
        b=UxVeuMempUw6TSDtHk9FKiyODulkS4zStQfCexgUbdwEAF12b6zY0PfaNtSIsjDEkz
         Y5KwqNqjsv3TX3x1TIJJhJYHaGRgNuq1i8ihu3TE8cUPNHWeY3Lq6XoYnnSU8yKCcurj
         bggSE/SGiyW1qdsVtyyrKtQ1Is7VgDs93AxBs=
X-Received: by 2002:a17:902:d58f:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-251718ddafdmr259726775ad.45.1757541915307;
        Wed, 10 Sep 2025 15:05:15 -0700 (PDT)
X-Received: by 2002:a17:902:d58f:b0:24b:11c8:2d05 with SMTP id d9443c01a7336-251718ddafdmr259726435ad.45.1757541914912;
        Wed, 10 Sep 2025 15:05:14 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25bf675b77fsm1714715ad.43.2025.09.10.15.05.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Sep 2025 15:05:14 -0700 (PDT)
Message-ID: <f72733cf-cf96-4960-b07f-ed0d9efbbb03@broadcom.com>
Date: Wed, 10 Sep 2025 15:05:11 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Doug Berger <opendmb@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
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
In-Reply-To: <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 9/10/25 00:12, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Convert the driver to using the new generic GPIO chip interfaces from
> linux/gpio/generic.h.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


