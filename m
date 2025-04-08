Return-Path: <linux-gpio+bounces-18505-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97025A80E34
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 16:35:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94E1F887E26
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 14:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE8281EB5C3;
	Tue,  8 Apr 2025 14:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YusIxalj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50921DF728
	for <linux-gpio@vger.kernel.org>; Tue,  8 Apr 2025 14:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744122472; cv=none; b=lSSyJ4TrGRHvJx2XRPDS1FjU+l0rXEIPg3CIkswAlsasTEtMnmdK/wmdtUC1zC6UqbL8ARJFcJp8wB7zAfnF6MDTPtxbhNx+Q1ohhZsztGwNINChPB7590n24GTSD3O1OhAf88hzTpddY/Q4kYIxWJIj7MTVkr6+4fw3HZAADMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744122472; c=relaxed/simple;
	bh=CDtFymud+fAGNxgNr7trOsagr9iisZY/ePnxZw8eSTY=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jMBAGhGiphsaBvaIThKg3wywWUe/6fmNXB6FzBY9dn+R3Afn8KFhaNaDgpSlsbe6983++x5yr6PuE8rw/XoggNA7AmTCulbTq2L0jRy7ifEOuXUC1MBvFVfQpb5KHIj2QXRBFimTTDku429hjSx1/+mhD4A0KqgT9L5H4/NTKn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YusIxalj; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39c1efc4577so3107248f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Apr 2025 07:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744122468; x=1744727268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=maYeBHyukcD41Ok36kPrsdL9APyex77i93BMZAgSjDY=;
        b=YusIxaljRzCQJ5/fkKKLEm/nxmBlFYFRIe0Q3wTpMl9oIi1lr0jTf5vRq0q61TM3w6
         +aa7vdpVmEHI/8R1CnfHoIgk3vAQFUXzt4IyEdEJbWZBqXaTJVSdamFXYoqKh0EyyNZG
         e8YYBmCu6w2ODn9adP3aNpqPdtL2GatphnrbGFPO97Ib2gPgpVLwAZtotuUMGY11KRaj
         Sc5p6gSP5AmC8H5RCsZmpXU8IGI+CtXTGD30hOmPr6OyhKH527CfQOJHi7opauYlbisS
         PtlFZ9lHmdarZkCBVD+4mjV73MAGYCs0JnW9XV6ntRmOL33B+h8DcIeMYnfad/QkjPkV
         yPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744122468; x=1744727268;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=maYeBHyukcD41Ok36kPrsdL9APyex77i93BMZAgSjDY=;
        b=hwDDg3E6u7QokWJkQyMbiEXhfat2qxKC+NSlXYleBngP7Oq1uHQM94Ft+pl6aYctnA
         WPK+4+QkqoajSqQd+U0VTsb9G9a/nkklGsAjVq2MJw6+dWFZrJ65BperY3cbdedoOR7N
         mMwgsMya8CfoLbyrVdNuF9bhH6DZ7cXKzv5vFGmDioG4M6JrxW6IHvrspQegHQJuNSkU
         QH94ocr1YODKS4Wy94MJTbHUgeeS1Oh28q8MnvHAwi1hDjBGFVQz+yEhRJaoDIz5R4cr
         VNB+OwUDeOz7P+fD4ysZg6aiVrWFHM0h1zMwk66yGwuBA1yY+jNvRQZr5JPr722+PSua
         tK+Q==
X-Forwarded-Encrypted: i=1; AJvYcCW/VfCqoL8Q4VJ2B7dAWB7aoObkfYaf+MPqLXASxhSFwwl5mtN2aVDekaVnQ9HhLUIBY1KHTGJy0Ef6@vger.kernel.org
X-Gm-Message-State: AOJu0YyedaHkfj2AC/3OiI6GwY4kQYthOGzt60TS6rQBc9bfLw/MzBvL
	hief4qiC6IR4wnC0DS20kyqST1RnTN0UYisQ8NFWL0D25XwKQ2ztT57tuhiw2ds=
X-Gm-Gg: ASbGncsnD4z+HjkQyswTksRDxW3P8oRY6ZrDzoKw2jQ7LGRiNk5MaSJ5FhZNLw+/vQG
	6To0KMH3WBB94yyL+Bdy8Ahn41Ir4WSNEZlvH/cuXYM+jeonvH/9453mX38U9brxD3zPFOUJqB1
	aQLXMFjVSBrb07sUIzKH3k1P4WNVj6ZqyZb9GOobUuEhrzWNHUz8h5PkdYEOI0ed8OVCYlP0Gk+
	eFi1CRWVUCY4Dcl+y3XMjpLwdnUtRrKmSFQXJTCmVUzgVjtGEpgSG2uehyLCczfhQdtph9ArSw3
	XIpswWSbGWtsPtB74ysQvyLiXR4LtljxMuBh2cdBUwfVvNVIx62OCyopy+2fWQukGA9nu6I+db/
	B9r/7XbDt+smAyBvMqVWCrg==
X-Google-Smtp-Source: AGHT+IHOQl3NOqzgesmZMaye/+jS53HYFNcdFr4mTBR4HNItRvuMdvVuoVoOZXlrImVcJ2UxCZ7isA==
X-Received: by 2002:a05:6000:4011:b0:391:31f2:b99a with SMTP id ffacd0b85a97d-39cb35b2527mr16291235f8f.5.1744122467955;
        Tue, 08 Apr 2025 07:27:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71? ([2a01:e0a:3d9:2080:3daa:5b6d:6ccb:4c71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2f4sm161009595e9.19.2025.04.08.07.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 07:27:47 -0700 (PDT)
Message-ID: <81d462fb-b118-4354-82b5-92c33d870b44@linaro.org>
Date: Tue, 8 Apr 2025 16:27:47 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH 07/10] pinctrl: sx150x: enable building modules with
 COMPILE_TEST=y
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
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
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2025 09:17, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> Increase the build coverage by enabling the sx150x modules with
> COMPILE_TEST=y.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>   drivers/pinctrl/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 464cc9aca157..94eb41bb9cf2 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -541,7 +541,7 @@ config PINCTRL_STMFX
>   
>   config PINCTRL_SX150X
>   	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
> -	depends on I2C=y
> +	depends on I2C=y || COMPILE_TEST
>   	select PINMUX
>   	select PINCONF
>   	select GENERIC_PINCONF
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

