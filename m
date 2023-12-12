Return-Path: <linux-gpio+bounces-1331-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F30E180F90B
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 22:19:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 698B8B20F85
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Dec 2023 21:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1009765A9D;
	Tue, 12 Dec 2023 21:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPCUChfG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0146EA7;
	Tue, 12 Dec 2023 13:19:02 -0800 (PST)
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-28ae217726fso13249a91.0;
        Tue, 12 Dec 2023 13:19:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702415942; x=1703020742; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kMoLJYgn7fDY9nUFDcOY8AQOiuzLi7LcMhALoQeUtF0=;
        b=bPCUChfG0FKDTVxgu/yKwtFdmX7Eq0U1gtY+AYM+pftBXHrWlC29JVsGY13V9PxqqZ
         jbmL+wkomWGpLEyikXOYsz+MkIThxoO/P09erhI0Tue3r0Nyu49V36KvDZpoB72+NVoM
         gDg/Wy7qniAJiIvd0XRt/yMNLdF2CkGluC3k834HqpiUMv0DHFeci4gHrygAfe0uFK2j
         xN/Pe4gP6YiZRFkP8/9oc+ETs8feg0FnF0mch+bnZeHxuKCcPG7+dg/34VFocDoTNrLc
         WMF4FEtlcyo4Cgfy/PnTrHdBq5HzrCIucv0E6CnjfB0XqUGPmNIInbaZJjo71b28xMJA
         17Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702415942; x=1703020742;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMoLJYgn7fDY9nUFDcOY8AQOiuzLi7LcMhALoQeUtF0=;
        b=lNSUPA/EVFH5bRxaikC0/9Lpy3afdaUWTFvEFA2o0vfO2GFma3RoJaheGCe1OtbH0T
         +WgwzpOgaleXoSUw5YKPW88yqgXSkK8FN08du4pYiUYqTs/+CK4ErM+o26YVGuN7vH1c
         ybx+cYAFiCKU0GHIQK/+9Xx+zhhKPwNwvmhQF6/3/9FTE/Wc7B82nGGOD0s+uST8PQ7G
         11dewikd6gOsoe/dr96m3wt4f+eedRyenCsnNHHJcd7JtPZVYRwj1JYKVdL/ilosY2gP
         ZM7DKadm3LzRp0BPyHFv7rl5hteH0S1tV1yvBkqaKfseYdb8rJ3yHiszAtpCv3LqZOnH
         XmPg==
X-Gm-Message-State: AOJu0YwrLtow1qkXqaf03JmwrIJENvmA9kFKYZvXlcPydICvV7MCitQY
	+Ml14I7H2qXczYLo+F5YvTc=
X-Google-Smtp-Source: AGHT+IHfMYA0e5583oScQWydg+DxCkFVtWOC6tsTqs18GNwFIduE95LRcs6hLxnlOHAFU/CgLbOilg==
X-Received: by 2002:a17:90a:2f43:b0:28a:c61a:5a20 with SMTP id s61-20020a17090a2f4300b0028ac61a5a20mr1162458pjd.1.1702415942317;
        Tue, 12 Dec 2023 13:19:02 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id px6-20020a17090b270600b002609cadc56esm9605497pjb.11.2023.12.12.13.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Dec 2023 13:19:01 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <cb84bee8-db33-41b3-b0f3-79b3df494496@roeck-us.net>
Date: Tue, 12 Dec 2023 13:18:59 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 12/16] watchdog: s3c2410_wdt: Add support for Google
 gs101 SoC
Content-Language: en-US
To: Peter Griffin <peter.griffin@linaro.org>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
 conor+dt@kernel.org, sboyd@kernel.org, tomasz.figa@gmail.com,
 s.nawrocki@samsung.com, linus.walleij@linaro.org, wim@linux-watchdog.org,
 catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de, olof@lixom.net,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, cw00.choi@samsung.com,
 alim.akhtar@samsung.com
Cc: tudor.ambarus@linaro.org, andre.draszik@linaro.org,
 semen.protsenko@linaro.org, saravanak@google.com, willmcvicker@google.com,
 soc@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-watchdog@vger.kernel.org, kernel-team@android.com,
 linux-serial@vger.kernel.org
References: <20231211162331.435900-1-peter.griffin@linaro.org>
 <20231211162331.435900-13-peter.griffin@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 xsFNBE6H1WcBEACu6jIcw5kZ5dGeJ7E7B2uweQR/4FGxH10/H1O1+ApmcQ9i87XdZQiB9cpN
 RYHA7RCEK2dh6dDccykQk3bC90xXMPg+O3R+C/SkwcnUak1UZaeK/SwQbq/t0tkMzYDRxfJ7
 nyFiKxUehbNF3r9qlJgPqONwX5vJy4/GvDHdddSCxV41P/ejsZ8PykxyJs98UWhF54tGRWFl
 7i1xvaDB9lN5WTLRKSO7wICuLiSz5WZHXMkyF4d+/O5ll7yz/o/JxK5vO/sduYDIlFTvBZDh
 gzaEtNf5tQjsjG4io8E0Yq0ViobLkS2RTNZT8ICq/Jmvl0SpbHRvYwa2DhNsK0YjHFQBB0FX
 IdhdUEzNefcNcYvqigJpdICoP2e4yJSyflHFO4dr0OrdnGLe1Zi/8Xo/2+M1dSSEt196rXaC
 kwu2KgIgmkRBb3cp2vIBBIIowU8W3qC1+w+RdMUrZxKGWJ3juwcgveJlzMpMZNyM1jobSXZ0
 VHGMNJ3MwXlrEFPXaYJgibcg6brM6wGfX/LBvc/haWw4yO24lT5eitm4UBdIy9pKkKmHHh7s
 jfZJkB5fWKVdoCv/omy6UyH6ykLOPFugl+hVL2Prf8xrXuZe1CMS7ID9Lc8FaL1ROIN/W8Vk
 BIsJMaWOhks//7d92Uf3EArDlDShwR2+D+AMon8NULuLBHiEUQARAQABzTJHdWVudGVyIFJv
 ZWNrIChMaW51eCBhY2NvdW50KSA8bGludXhAcm9lY2stdXMubmV0PsLBgQQTAQIAKwIbAwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4ACGQEFAlVcphcFCRmg06EACgkQyx8mb86fmYFg0RAA
 nzXJzuPkLJaOmSIzPAqqnutACchT/meCOgMEpS5oLf6xn5ySZkl23OxuhpMZTVX+49c9pvBx
 hpvl5bCWFu5qC1jC2eWRYU+aZZE4sxMaAGeWenQJsiG9lP8wkfCJP3ockNu0ZXXAXwIbY1O1
 c+l11zQkZw89zNgWgKobKzrDMBFOYtAh0pAInZ9TSn7oA4Ctejouo5wUugmk8MrDtUVXmEA9
 7f9fgKYSwl/H7dfKKsS1bDOpyJlqhEAH94BHJdK/b1tzwJCFAXFhMlmlbYEk8kWjcxQgDWMu
 GAthQzSuAyhqyZwFcOlMCNbAcTSQawSo3B9yM9mHJne5RrAbVz4TWLnEaX8gA5xK3uCNCeyI
 sqYuzA4OzcMwnnTASvzsGZoYHTFP3DQwf2nzxD6yBGCfwNGIYfS0i8YN8XcBgEcDFMWpOQhT
 Pu3HeztMnF3HXrc0t7e5rDW9zCh3k2PA6D2NV4fews9KDFhLlTfCVzf0PS1dRVVWM+4jVl6l
 HRIAgWp+2/f8dx5vPc4Ycp4IsZN0l1h9uT7qm1KTwz+sSl1zOqKD/BpfGNZfLRRxrXthvvY8
 BltcuZ4+PGFTcRkMytUbMDFMF9Cjd2W9dXD35PEtvj8wnEyzIos8bbgtLrGTv/SYhmPpahJA
 l8hPhYvmAvpOmusUUyB30StsHIU2LLccUPPOwU0ETofVZwEQALlLbQeBDTDbwQYrj0gbx3bq
 7kpKABxN2MqeuqGr02DpS9883d/t7ontxasXoEz2GTioevvRmllJlPQERVxM8gQoNg22twF7
 pB/zsrIjxkE9heE4wYfN1AyzT+AxgYN6f8hVQ7Nrc9XgZZe+8IkuW/Nf64KzNJXnSH4u6nJM
 J2+Dt274YoFcXR1nG76Q259mKwzbCukKbd6piL+VsT/qBrLhZe9Ivbjq5WMdkQKnP7gYKCAi
 pNVJC4enWfivZsYupMd9qn7Uv/oCZDYoBTdMSBUblaLMwlcjnPpOYK5rfHvC4opxl+P/Vzyz
 6WC2TLkPtKvYvXmdsI6rnEI4Uucg0Au/Ulg7aqqKhzGPIbVaL+U0Wk82nz6hz+WP2ggTrY1w
 ZlPlRt8WM9w6WfLf2j+PuGklj37m+KvaOEfLsF1v464dSpy1tQVHhhp8LFTxh/6RWkRIR2uF
 I4v3Xu/k5D0LhaZHpQ4C+xKsQxpTGuYh2tnRaRL14YMW1dlI3HfeB2gj7Yc8XdHh9vkpPyuT
 nY/ZsFbnvBtiw7GchKKri2gDhRb2QNNDyBnQn5mRFw7CyuFclAksOdV/sdpQnYlYcRQWOUGY
 HhQ5eqTRZjm9z+qQe/T0HQpmiPTqQcIaG/edgKVTUjITfA7AJMKLQHgp04Vylb+G6jocnQQX
 JqvvP09whbqrABEBAAHCwWUEGAECAA8CGwwFAlVcpi8FCRmg08MACgkQyx8mb86fmYHNRQ/+
 J0OZsBYP4leJvQF8lx9zif+v4ZY/6C9tTcUv/KNAE5leyrD4IKbnV4PnbrVhjq861it/zRQW
 cFpWQszZyWRwNPWUUz7ejmm9lAwPbr8xWT4qMSA43VKQ7ZCeTQJ4TC8kjqtcbw41SjkjrcTG
 wF52zFO4bOWyovVAPncvV9eGA/vtnd3xEZXQiSt91kBSqK28yjxAqK/c3G6i7IX2rg6pzgqh
 hiH3/1qM2M/LSuqAv0Rwrt/k+pZXE+B4Ud42hwmMr0TfhNxG+X7YKvjKC+SjPjqp0CaztQ0H
 nsDLSLElVROxCd9m8CAUuHplgmR3seYCOrT4jriMFBtKNPtj2EE4DNV4s7k0Zy+6iRQ8G8ng
 QjsSqYJx8iAR8JRB7Gm2rQOMv8lSRdjva++GT0VLXtHULdlzg8VjDnFZ3lfz5PWEOeIMk7Rj
 trjv82EZtrhLuLjHRCaG50OOm0hwPSk1J64R8O3HjSLdertmw7eyAYOo4RuWJguYMg5DRnBk
 WkRwrSuCn7UG+qVWZeKEsFKFOkynOs3pVbcbq1pxbhk3TRWCGRU5JolI4ohy/7JV1TVbjiDI
 HP/aVnm6NC8of26P40Pg8EdAhajZnHHjA7FrJXsy3cyIGqvg9os4rNkUWmrCfLLsZDHD8FnU
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20231211162331.435900-13-peter.griffin@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/23 08:23, Peter Griffin wrote:
> This patch adds the compatibles and drvdata for the Google
> gs101 SoC found in Pixel 6, Pixel 6a & Pixel 6 pro phones.
> 
> Similar to Exynos850 it has two watchdog instances, one for
> each cluster and has some control bits in PMU registers.
> 
> gs101 also has the dbgack_mask bit in wtcon register, so
> we also enable QUIRK_HAS_DBGACK_BIT.
> 
> Tested-by: Will McVicker <willmcvicker@google.com>
> Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>   drivers/watchdog/s3c2410_wdt.c | 49 ++++++++++++++++++++++++++++++----
>   1 file changed, 44 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/watchdog/s3c2410_wdt.c b/drivers/watchdog/s3c2410_wdt.c
> index b7a03668f743..c3046610ab5d 100644
> --- a/drivers/watchdog/s3c2410_wdt.c
> +++ b/drivers/watchdog/s3c2410_wdt.c
> @@ -69,6 +69,13 @@
>   #define EXYNOSAUTOV9_CLUSTER0_WDTRESET_BIT	25
>   #define EXYNOSAUTOV9_CLUSTER1_WDTRESET_BIT	24
>   
> +#define GS_CLUSTER0_NONCPU_OUT			0x1220
> +#define GS_CLUSTER1_NONCPU_OUT			0x1420
> +#define GS_CLUSTER0_NONCPU_INT_EN		0x1244
> +#define GS_CLUSTER1_NONCPU_INT_EN		0x1444
> +#define GS_CLUSTER2_NONCPU_INT_EN		0x1644
> +#define GS_RST_STAT_REG_OFFSET			0x3B44
> +
>   /**
>    * DOC: Quirk flags for different Samsung watchdog IP-cores
>    *
> @@ -270,7 +277,35 @@ static const struct s3c2410_wdt_variant drv_data_exynosautov9_cl1 = {
>   		  QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_CNT_EN,
>   };
>   
> +static const struct s3c2410_wdt_variant drv_data_gs101_cl0 = {
> +	.mask_reset_reg = GS_CLUSTER0_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 0,
> +	.cnt_en_reg = GS_CLUSTER0_NONCPU_OUT,
> +	.cnt_en_bit = 8,
> +	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |
> +		  QUIRK_HAS_PMU_CNT_EN | QUIRK_HAS_WTCLRINT_REG |
> +		  QUIRK_HAS_DBGACK_BIT,
> +};
> +
> +static const struct s3c2410_wdt_variant drv_data_gs101_cl1 = {
> +	.mask_reset_reg = GS_CLUSTER1_NONCPU_INT_EN,
> +	.mask_bit = 2,
> +	.mask_reset_inv = true,
> +	.rst_stat_reg = GS_RST_STAT_REG_OFFSET,
> +	.rst_stat_bit = 1,
> +	.cnt_en_reg = GS_CLUSTER1_NONCPU_OUT,
> +	.cnt_en_bit = 7,
> +	.quirks = QUIRK_HAS_PMU_RST_STAT | QUIRK_HAS_PMU_MASK_RESET |
> +		  QUIRK_HAS_PMU_CNT_EN | QUIRK_HAS_WTCLRINT_REG |
> +		  QUIRK_HAS_DBGACK_BIT,
> +};
> +
>   static const struct of_device_id s3c2410_wdt_match[] = {
> +	{ .compatible = "google,gs101-wdt",
> +	  .data = &drv_data_gs101_cl0 },
>   	{ .compatible = "samsung,s3c2410-wdt",
>   	  .data = &drv_data_s3c2410 },
>   	{ .compatible = "samsung,s3c6410-wdt",
> @@ -605,9 +640,10 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>   	}
>   
>   #ifdef CONFIG_OF
> -	/* Choose Exynos850/ExynosAutov9 driver data w.r.t. cluster index */
> +	/* Choose Exynos9 SoC family driver data w.r.t. cluster index */
>   	if (variant == &drv_data_exynos850_cl0 ||
> -	    variant == &drv_data_exynosautov9_cl0) {
> +	    variant == &drv_data_exynosautov9_cl0 ||
> +	    variant == &drv_data_gs101_cl0) {
>   		u32 index;
>   		int err;
>   
> @@ -620,9 +656,12 @@ s3c2410_get_wdt_drv_data(struct platform_device *pdev, struct s3c2410_wdt *wdt)
>   		case 0:
>   			break;
>   		case 1:
> -			variant = (variant == &drv_data_exynos850_cl0) ?
> -				&drv_data_exynos850_cl1 :
> -				&drv_data_exynosautov9_cl1;
> +			if (variant == &drv_data_exynos850_cl0)
> +				variant = &drv_data_exynos850_cl1;
> +			else if (variant == &drv_data_exynosautov9_cl0)
> +				variant = &drv_data_exynosautov9_cl1;
> +			else if (variant == &drv_data_gs101_cl0)
> +				variant = &drv_data_gs101_cl1;
>   			break;
>   		default:
>   			return dev_err_probe(dev, -EINVAL, "wrong cluster index: %u\n", index);


