Return-Path: <linux-gpio+bounces-7343-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60181903411
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 09:44:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65C4B1C2322E
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 07:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A964173340;
	Tue, 11 Jun 2024 07:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjwQwfZF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51781172BB9
	for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 07:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718091827; cv=none; b=FwdEh2O7gFATfYiF3x9rn0OWre0o5tM0plkTAuNmXo8eY1KVhDpO20vrbGBBEfcRD6C2Wme9ufAi1SDum/dxeOQRM9e2/ca4tpfWhJsL+YhBedtHPdShxWcB60531xTvJtjO9Al3K24suHOv5EhYgk+Rqm17Q6EqEmQV/TmruBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718091827; c=relaxed/simple;
	bh=1hbRhtaD+Nk7+eePQv366/9QRI7tL/YdAz5mWXFDwtc=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gDGY3rHtUTZmOsqgaCBZQDw+QAA2sNTQ2Kob2stvCF5dHYPof8mYd69OOQjVH4ftMO/lwumM5BEVHiNJDb4MC/Qusv5wRy+H1PR/IcRDxND7LBfpiy5OvhrxfQEKbVTkAeINw4QuV5Qg8J6igmje87DEMVnMFYI7CNB4WCqLAmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjwQwfZF; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4217f2e3450so23819825e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 11 Jun 2024 00:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718091822; x=1718696622; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AaYHDTrL+lhdgiiWUWfPAobBHMAP2JH61ZX0cvqY+lM=;
        b=HjwQwfZFsBODBhvfJ66rR74HXI+5wUSbgrmDSu9fjll8vlMuHRk/rnDddZrFlN1sOK
         7S48+k8lcMi5zaDcCnp4pqYtNaJkUDoIozAcqJvFNvqKOD0NjcWHJJPTGu8TiIGP9tLx
         YLE3NR4HPHRjmQNV2ZKpGaUXcrTwaWpq5TRj0X4PFvjh0yidTpNxoFOh82+23a3t4ZwR
         i906P6aTZa4BE0+IMlC3+zlNvCahzzA72kxUN2QO3KmYAAxGgUhPFCgF5Ob2isWZ5H2j
         v1lp1FwwnQ77oS+ELR1mD1+z7vjc+YlwnzZCtygyponihcCL+rgy6MNfx10Ox0zAC6Jd
         fDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718091822; x=1718696622;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AaYHDTrL+lhdgiiWUWfPAobBHMAP2JH61ZX0cvqY+lM=;
        b=feHAIeaGgeSnbXDT76l/wI2ezS36MG23bTYNbjFQ5T35iBWeyG8eTSgcY9kKygW3Dl
         NVd3yLx92nl8wnygOsU5TbwdZCs1ZxM0CPZJF0zCIHoFEBUlMBi1LBFvG4ASJbwXFHef
         BDQ/QyvhCOE24O+3tsRNH6yvtHGwraHMInLcVnsDvKfyTrwz/+3x6kq/c0gR3PvNoxZe
         tWozBz1sJsj8ty8rwyjwT3fwbmLPBjRAyc2KZquSKP1d0J42k6REez5XtL4Z2UgoR1Jo
         GUNFKHX9tjhhd2tZOi7qP7WR54zKZRhRubtGCebon+JcyrCD87VmAvC+8dfAOX7Ga9tr
         VB2A==
X-Gm-Message-State: AOJu0YzOcEswh6HD7Uetz9ns+CAz5br3RcQyccJLcTRt+3nbOTl5kTRh
	B3RHqWUi1wkAL10/g5vH/FMMN4ep4orSbfjJg64k/akQ5FLUdqBmOpGBsLTXibQ=
X-Google-Smtp-Source: AGHT+IH4x5wACQat0OoKqIIRdpUr63Bf30Idh3s3QU7PBT65WI6cUEOYaAjORG1pUa2nasKiNItojA==
X-Received: by 2002:a05:600c:45c4:b0:421:29cd:5c95 with SMTP id 5b1f17b1804b1-421649fba60mr129136245e9.10.1718091822434;
        Tue, 11 Jun 2024 00:43:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c? ([2a01:e0a:982:cbb0:5a4:3b2:c750:ef5c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35f0f996ee3sm8916690f8f.71.2024.06.11.00.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jun 2024 00:43:42 -0700 (PDT)
Message-ID: <6c9bb16f-a1c1-474c-a753-9905d88c9022@linaro.org>
Date: Tue, 11 Jun 2024 09:43:41 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] pinctrl: add missing MODULE_DESCRIPTION() macros
To: Jeff Johnson <quic_jjohnson@quicinc.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Linus Walleij <linus.walleij@linaro.org>, Kevin Hilman
 <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 kernel-janitors@vger.kernel.org
References: <20240610-md-drivers-pinctrl-v1-1-68462e3d960c@quicinc.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20240610-md-drivers-pinctrl-v1-1-68462e3d960c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/06/2024 06:21, Jeff Johnson wrote:
> When ARCH=x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/bcm/pinctrl-bcm4908.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_i2c.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08_spi.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/pinctrl-mcp23s08.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/pinctrl/meson/pinctrl-meson.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
> files which have a MODULE_LICENSE().
> 
> This includes many meson drivers which, although they did not produce
> a warning with the x86 allmodconfig configuration, may cause this
> warning with ARM or ARM64 configurations.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
> Corrections to these descriptions are welcomed. I'm not an expert in
> this code so in most cases I've taken these descriptions directly from
> code comments, Kconfig descriptions, or git logs.  History has shown
> that in some cases these are originally wrong due to cut-n-paste
> errors, and in other cases the drivers have evolved such that the
> original information is no longer accurate.
> 
> Also let me know if any changes need to be split into a separate patch
> to go through a separate maintainer tree.
> ---
>   drivers/pinctrl/bcm/pinctrl-bcm4908.c         | 1 +
>   drivers/pinctrl/meson/pinctrl-meson-a1.c      | 1 +
>   drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c | 1 +
>   drivers/pinctrl/meson/pinctrl-meson-axg.c     | 1 +
>   drivers/pinctrl/meson/pinctrl-meson-g12a.c    | 1 +
>   drivers/pinctrl/meson/pinctrl-meson-gxbb.c    | 1 +
>   drivers/pinctrl/meson/pinctrl-meson-gxl.c     | 1 +
>   drivers/pinctrl/meson/pinctrl-meson-s4.c      | 1 +
>   drivers/pinctrl/meson/pinctrl-meson.c         | 1 +
>   drivers/pinctrl/meson/pinctrl-meson8-pmx.c    | 1 +

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org> # for Amlogic Pinctrl drivers

>   drivers/pinctrl/pinctrl-mcp23s08.c            | 1 +
>   drivers/pinctrl/pinctrl-mcp23s08_i2c.c        | 1 +
>   drivers/pinctrl/pinctrl-mcp23s08_spi.c        | 1 +
>   drivers/pinctrl/pinctrl-tb10x.c               | 1 +
>   14 files changed, 14 insertions(+)
> 
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm4908.c b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
> index cdfa165fc033..f190e0997f1f 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm4908.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm4908.c
> @@ -559,5 +559,6 @@ static struct platform_driver bcm4908_pinctrl_driver = {
>   module_platform_driver(bcm4908_pinctrl_driver);
>   
>   MODULE_AUTHOR("Rafał Miłecki");
> +MODULE_DESCRIPTION("Broadcom BCM4908 pinmux driver");
>   MODULE_LICENSE("GPL v2");
>   MODULE_DEVICE_TABLE(of, bcm4908_pinctrl_of_match_table);
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-a1.c b/drivers/pinctrl/meson/pinctrl-meson-a1.c
> index 50a87d9618a8..d2ac9ca72a3e 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-a1.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-a1.c
> @@ -936,4 +936,5 @@ static struct platform_driver meson_a1_pinctrl_driver = {
>   };
>   
>   module_platform_driver(meson_a1_pinctrl_driver);
> +MODULE_DESCRIPTION("Amlogic Meson A1 SoC pinctrl driver");
>   MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> index ae3f8d0da05f..cad411d90727 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg-pmx.c
> @@ -117,4 +117,5 @@ const struct pinmux_ops meson_axg_pmx_ops = {
>   };
>   EXPORT_SYMBOL_GPL(meson_axg_pmx_ops);
>   
> +MODULE_DESCRIPTION("Amlogic Meson AXG second generation pinmux driver");
>   MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-axg.c b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> index 6667c9d0238f..8f4e7154b73f 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-axg.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-axg.c
> @@ -1091,4 +1091,5 @@ static struct platform_driver meson_axg_pinctrl_driver = {
>   };
>   
>   module_platform_driver(meson_axg_pinctrl_driver);
> +MODULE_DESCRIPTION("Amlogic Meson AXG pinctrl driver");
>   MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-g12a.c b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> index 2c17891ba6a9..32830269a5b4 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-g12a.c
> @@ -1426,4 +1426,5 @@ static struct platform_driver meson_g12a_pinctrl_driver = {
>   };
>   
>   module_platform_driver(meson_g12a_pinctrl_driver);
> +MODULE_DESCRIPTION("Amlogic Meson G12A SoC pinctrl driver");
>   MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> index f51fc3939252..2867f397fec6 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxbb.c
> @@ -910,4 +910,5 @@ static struct platform_driver meson_gxbb_pinctrl_driver = {
>   	},
>   };
>   module_platform_driver(meson_gxbb_pinctrl_driver);
> +MODULE_DESCRIPTION("Amlogic Meson GXBB pinctrl driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-gxl.c b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> index 51408996255b..a2f25fa02852 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-gxl.c
> @@ -871,4 +871,5 @@ static struct platform_driver meson_gxl_pinctrl_driver = {
>   	},
>   };
>   module_platform_driver(meson_gxl_pinctrl_driver);
> +MODULE_DESCRIPTION("Amlogic Meson GXL pinctrl driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> index cea77864b880..60c7d5003e8a 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
> @@ -1230,4 +1230,5 @@ static struct platform_driver meson_s4_pinctrl_driver = {
>   };
>   module_platform_driver(meson_s4_pinctrl_driver);
>   
> +MODULE_DESCRIPTION("Amlogic Meson S4 SoC pinctrl driver");
>   MODULE_LICENSE("Dual BSD/GPL");
> diff --git a/drivers/pinctrl/meson/pinctrl-meson.c b/drivers/pinctrl/meson/pinctrl-meson.c
> index 524424ee6c4e..ef002b9dd464 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson.c
> @@ -767,4 +767,5 @@ int meson_pinctrl_probe(struct platform_device *pdev)
>   }
>   EXPORT_SYMBOL_GPL(meson_pinctrl_probe);
>   
> +MODULE_DESCRIPTION("Amlogic Meson SoCs core pinctrl driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
> index f767b6923f9f..7f22aa0f8e36 100644
> --- a/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
> +++ b/drivers/pinctrl/meson/pinctrl-meson8-pmx.c
> @@ -101,4 +101,5 @@ const struct pinmux_ops meson8_pmx_ops = {
>   	.gpio_request_enable = meson8_pmx_request_gpio,
>   };
>   EXPORT_SYMBOL_GPL(meson8_pmx_ops);
> +MODULE_DESCRIPTION("Amlogic Meson SoCs first generation pinmux driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
> index 38c3a14c8b58..737d0ae3d0b6 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08.c
> @@ -696,4 +696,5 @@ int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
>   }
>   EXPORT_SYMBOL_GPL(mcp23s08_probe_one);
>   
> +MODULE_DESCRIPTION("MCP23S08 SPI/I2C GPIO driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
> index 04e8e7d079f0..94e1add6ddd7 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
> @@ -111,4 +111,5 @@ static void mcp23s08_i2c_exit(void)
>   }
>   module_exit(mcp23s08_i2c_exit);
>   
> +MODULE_DESCRIPTION("MCP23S08 I2C GPIO driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> index 4a872fff5fe8..54f61c8cb1c0 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> @@ -263,4 +263,5 @@ static void mcp23s08_spi_exit(void)
>   }
>   module_exit(mcp23s08_spi_exit);
>   
> +MODULE_DESCRIPTION("MCP23S08 SPI GPIO driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/pinctrl/pinctrl-tb10x.c b/drivers/pinctrl/pinctrl-tb10x.c
> index c3b76e6511ac..4f98f72565f4 100644
> --- a/drivers/pinctrl/pinctrl-tb10x.c
> +++ b/drivers/pinctrl/pinctrl-tb10x.c
> @@ -830,4 +830,5 @@ static struct platform_driver tb10x_pinctrl_pdrv = {
>   module_platform_driver(tb10x_pinctrl_pdrv);
>   
>   MODULE_AUTHOR("Christian Ruppert <christian.ruppert@abilis.com>");
> +MODULE_DESCRIPTION("Abilis Systems TB10x pinctrl driver");
>   MODULE_LICENSE("GPL");
> 
> ---
> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
> change-id: 20240610-md-drivers-pinctrl-7c07354ac076
> 


