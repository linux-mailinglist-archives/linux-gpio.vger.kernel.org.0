Return-Path: <linux-gpio+bounces-12875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A614E9C592E
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 14:35:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2EFFC1F23A8C
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 13:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE6B2158DDC;
	Tue, 12 Nov 2024 13:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExlVOz/z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC6314387B
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 13:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731418453; cv=none; b=Piz32wZ0O9nHKPKOApFAO9F+PX+uOeIxFCpjU9yNZkxmEmouxqJ9+QEYhEibgklcCUToXfwOhisOvCAD2lMd70SiBBx1wwJjxPZOknqWkLYfRvYukNiAdbaQUaAbBUdSKKTlRm9FQCjMx2ie1PuWypgz42CZ+6JRYbAsEUs2psE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731418453; c=relaxed/simple;
	bh=ccZAmJUZ84i4bnR7UC/egNqccA0sRyz2WPlTAVWeXeM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dTmZPYjiFlth0AijGkmeCsV5egzlJSjv+ykFa4+Gi8spCuhcCJTkY9DvaY3Sj3PNEcfcC/cRyYiv6Q2Z8P7eRpZ2tmp3olHZaA4Gs7oQIs1JxlHkTYQJKrpR29V2pWk+LkpL/TD4Rt+f1a8Pp/jtfUWMPCAfkAwHiFITrnZiNSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExlVOz/z; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4314b316495so47294395e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 05:34:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731418450; x=1732023250; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+omseve6sEWaNT3PbUtmXKwUOZhyNZ+lRjB/niytBE=;
        b=ExlVOz/zMJ8fiHHq1+K1ESYZWeUbM7CARwNaeQ2le3N2LosCbNBVAP9C9lAhEIEtZq
         D1PnxxOEcshnmWt55styhcmR3+8vIBPJDuC5NUCp6NKJcnIfyZzfF6n6E74N9JCGeH0m
         oC/9BHBnY86SgSzJWgleKYgJqZeBP+QRKFp1KBW/2BbYjxJPwEzjVkbHr4wa/ontHsGo
         5ArJD0Mxsg/3VyWaQCZWJZRZG4jATnr8zsMb9mbUM/vMo2QQL6vdcaKPOxXjtDadPOwf
         GGjEtjiwHH+m9pdbQMIKLfWfzCbuzt+pVFBPELjQjxAkmpEUXAQppHvLbOcJllTj5/7Y
         R+BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731418450; x=1732023250;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p+omseve6sEWaNT3PbUtmXKwUOZhyNZ+lRjB/niytBE=;
        b=FJ76YDj3zTsGC8cvZ4bTvhdBilV+UvpCWjTZlK9GZqaV4N1aSIO9TWVoMKuTKJAgsE
         RQwg4q7Phqp+9L+prdrje3wL0+DNnxCnL+O2mMHKZhCU7HASAr2mEdUA746pmR88G7u9
         dIwzvuZNnCQek0YXMW5RfoqBH293io7OiXJTQ+GHaik0md5fegnu62Qa+lQsjghwS3RB
         qEZqkSvMtCRdV2u9rB43ME4IIZ0oxBGZ+o4c4cgt4aor/BsQlqkPCAw/Ym5tmOQ06Pwn
         0G9TbJbI3OMUwOI3QDQqTkRnvdltk3SA+g6eBhV6wxfyHnA8I2InhtTJaB0jMQMfCHtE
         dtBw==
X-Gm-Message-State: AOJu0Yx0pd18K0NqaR5gdLh8GKTTfY0gYLoAjruFbV6+tIgFKGYOrBgw
	VLTPeMSQMnn+zvg2y/T3rRrBUFVbU2hPtCL0FJ8u+h5Qh7/88+bvPyNb73F4ms0=
X-Google-Smtp-Source: AGHT+IE3ISTkzyh/KPRmrTOaebvxmXujGnc7RmLYTWKcmrFKgulLlHkQDLI+4AM/xhjc2ZCd/a/i1w==
X-Received: by 2002:a05:600c:510a:b0:431:4e3f:9dee with SMTP id 5b1f17b1804b1-432b74fd7edmr145104225e9.4.1731418450344;
        Tue, 12 Nov 2024 05:34:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b05c1a13sm210146095e9.29.2024.11.12.05.34.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 05:34:09 -0800 (PST)
Message-ID: <950f4d06-e064-46f3-b8e7-8bfd48b2b16f@linaro.org>
Date: Tue, 12 Nov 2024 14:34:08 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v5 5/5] arm64: dts: amlogic: a4: add pinctrl node
To: xianwei.zhao@amlogic.com, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241112-a4_pinctrl-v5-0-3460ce10c480@amlogic.com>
 <20241112-a4_pinctrl-v5-5-3460ce10c480@amlogic.com>
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
In-Reply-To: <20241112-a4_pinctrl-v5-5-3460ce10c480@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2024 11:26, Xianwei Zhao via B4 Relay wrote:
> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
> 
> Add pinctrl device to support Amlogic A4.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi | 36 +++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> index de10e7aebf21..a176faf7f1ef 100644
> --- a/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> +++ b/arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi
> @@ -5,6 +5,7 @@
>   
>   #include "amlogic-a4-common.dtsi"
>   #include <dt-bindings/power/amlogic,a4-pwrc.h>
> +#include <dt-bindings/gpio/amlogic-gpio.h>
>   / {
>   	cpus {
>   		#address-cells = <2>;
> @@ -48,3 +49,38 @@ pwrc: power-controller {
>   		};
>   	};
>   };
> +
> +&apb {
> +	periphs_pinctrl: pinctrl@4000 {
> +		compatible = "amlogic,a4-periphs-pinctrl";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x4000 0x0 0x02e0>;
> +
> +		gpio: bank@0 {
> +			reg = <0x0 0x0 0x0 0x0050>,
> +			      <0x0 0xc0 0x0 0x0220>;
> +			reg-names = "mux", "gpio";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			gpio-ranges = <&periphs_pinctrl 0 0 73>;
> +		};
> +	};
> +
> +	aobus_pinctrl: pinctrl@8e700 {
> +		compatible = "amlogic,a4-aobus-pinctrl";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x8e700 0x0 0x0064>;
> +
> +		ao_gpio: bank@0 {
> +			reg = <0x0 0x00 0x0 0x04>,
> +			      <0x0 0x04 0x0 0x60>;
> +			reg-names = "mux", "gpio";
> +			gpio-controller;
> +			#gpio-cells = <3>;
> +			gpio-ranges = <&aobus_pinctrl 0 0 8>;
> +		};
> +	};
> +
> +};
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

