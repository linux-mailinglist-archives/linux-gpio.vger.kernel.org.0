Return-Path: <linux-gpio+bounces-26067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 691EDB55119
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 16:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FA565A0A6E
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 14:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A995C3191DA;
	Fri, 12 Sep 2025 14:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JfFWlPdb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760213176E4
	for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 14:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757686882; cv=none; b=nicSuEwnEjvjVGU4lxvHhA/M8sVZlHDGxCVpUpZwLUK09tKImvmlZPtXUZbfWRTOh7wJHAdJZJm61lPQTPk2cqxk0wIPQlugWGkhtz9KZDdz2LXrfRsSpNUL8IQR7stgagpHIgorshjd7gAtQad2XoloeloqYa8uXSSrqn9Ac9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757686882; c=relaxed/simple;
	bh=Q4rw3hqD7xfYTz2PjfHUSCWYx6GmHlLphHFHrEZQ64A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QfQL9RX41BV61YoR8uv4og9b6ZosxB+MUeTpR6nNgQe6ch1qYatdjlOtIFFwv0PTSBQhKl5uJM9SS5YSrGc3UthUK59sGGiNCzaq0kx6a2cLs7UscI1o5KyWn1hgFF1XFRVg/9pqwIuUKVLYtqPxXWDLkhrsJaUgqSF1t8XFXjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JfFWlPdb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-45f2313dd86so6608235e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 12 Sep 2025 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757686879; x=1758291679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=vw9oEMKP6t2zJ5WrxPI767ve9Ezi/7LUntIyA8io5Hw=;
        b=JfFWlPdbK/WwrPHrAjJ3XiuBxAouAnn4dsbCo65qQEqBynoU6Ove3ahe9pRLtSdKlY
         EIsyBSc9uq5E4njdOiVmJQi37aQlOS+ZUbeVcscqVZpnjA3Rx6e1oT8loxZDJwBjVnas
         0o+n0Sv+7fDQDuhpmFxWghT2glDVmnXSCscwCmWDaYti3lIXlDLzP32aPqLTZ0WSA3Lo
         +U5MVarVO45uCBwRXNBxOR0DthYROowqXAoy6MmQOBv18jWqLiRbxYzWM3ha+mz+zNs/
         iv6eyWFO8Y3GYxDXahQC6gwGxpqC+AthZsTNozLDV8/XUykMqFDbYdtpLKiEk+0Po0He
         og2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757686879; x=1758291679;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vw9oEMKP6t2zJ5WrxPI767ve9Ezi/7LUntIyA8io5Hw=;
        b=V8GRRuwkmOhm75MQrdkBjmKgZuzeqlS+Q9dz5t8hLGYbxSGNi94UwOllUo/9jwGjOS
         zeoLf/RDLYMnKCbj/xC1nOnDH1e+1fVTr3mJDWu6jL2Ohy0fXQnIaA2DVLNOdOqjTOhm
         qdIW7AcJeiVL0KRshCqgXZnCb7rQLrTlZd684UVTuPG9uXfMqDHB1/05HQ+2Dz1CcOSx
         zhuHCyxtjbIlZylQNFiNeoZBs5YscyZSqQlnUdRt31sYpPrx/Xc+AUPRZ+qqREGYU6Qd
         3/aAi1IQmuWqwI3EF7+3I+Gk3EPmQnnraofJDlfugh1zGwwEl8KE6OKUNbgA5JRDTtx0
         bSzw==
X-Forwarded-Encrypted: i=1; AJvYcCX/s7uiq7xNoeXiTVbg6IdbFdDsw+pYsQ1RNRYvg2dP2eIhnEz5g+WVXFaf+zJCw8T2OSrkvjZA6c6E@vger.kernel.org
X-Gm-Message-State: AOJu0YxtBsjAOBPWFnwoJyHv9eJRDhyLiesQYb+cSt9bO0OkBIkoRfq7
	rdloblvMhg1jwJenazMKHaJv6efN7iIEO0awAVmt4S/zqNiDal1WLipG
X-Gm-Gg: ASbGncuJARsz9axLd+qj5EiyPE8v13P5peCPmwiF2efIYXZxG50B12JHu33sIHtOayX
	BQKKtp8i/fIq+gsd85EljkoRYoSxzfBgqO+fyQ4wwR0j+q6w0myPUcABFAovBQCuAiPRFOvqkNL
	qtGeC2OjKC2Oxuw1b/0j/9jizt4fkJKzkErgRcLbZKmnU9jRKZkm23otdmKpegCj1GM31kxeVMP
	lr32KcZr7UM7N7b9IptcK1WE7FAPVUNyzaURtUGkV6sAiMJbyrIRL9iZYJnPRMwNrujl64cqjI/
	mzWp13a4Pdm2eRzYc6hr2O51kDUbiejSCGHa02I7UK5n8W3jmJcU2EpKp0cfxO6Ka1Q7PTEU2ez
	alp/wxdI6dQ1IYN4sFhFsdrQW6zJw5BWLy5+EB8udUQ==
X-Google-Smtp-Source: AGHT+IFntwFrj6hvDClo8DDECOvHNBx/ZYTf0W4VlRfdOBkNBdr/e49WdTOHoS9sCIAf2OgrZ1iqXQ==
X-Received: by 2002:a05:6000:2012:b0:3d9:dbe6:e613 with SMTP id ffacd0b85a97d-3e765792841mr3488249f8f.15.1757686878585;
        Fri, 12 Sep 2025 07:21:18 -0700 (PDT)
Received: from [192.168.2.177] ([91.116.220.47])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e760787080sm6943265f8f.20.2025.09.12.07.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 07:21:17 -0700 (PDT)
Message-ID: <52a54697-4b42-4c39-ae42-ae03b4231acc@gmail.com>
Date: Fri, 12 Sep 2025 16:18:36 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 30/38] arm64: dts: mediatek: pumpkin-common: Fix pinctrl
 node names
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
Cc: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, sean.wang@kernel.org, linus.walleij@linaro.org,
 lgirdwood@gmail.com, broonie@kernel.org, andersson@kernel.org,
 mathieu.poirier@linaro.org, daniel.lezcano@linaro.org, tglx@linutronix.de,
 atenart@kernel.org, jitao.shi@mediatek.com, ck.hu@mediatek.com,
 houlong.wei@mediatek.com, kyrie.wu@mediatek.corp-partner.google.com,
 andy.teng@mediatek.com, tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com,
 shane.chien@mediatek.com, olivia.wen@mediatek.com, granquet@baylibre.com,
 eugen.hristev@linaro.org, arnd@arndb.de, sam.shih@mediatek.com,
 jieyy.yang@mediatek.com, frank-w@public-files.de, mwalle@kernel.org,
 fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <matthias.bgg@gmail.com>
Autocrypt: addr=matthias.bgg@gmail.com; keydata=
 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
In-Reply-To: <20250724083914.61351-31-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/07/2025 10:39, AngeloGioacchino Del Regno wrote:
> Fix the pinctrl node names to adhere to the bindings, as the main
> pin node is supposed to be named like "uart0-pins" and the pinmux
> node named like "pins-bus".
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Applied, thanks

> ---
>   .../boot/dts/mediatek/pumpkin-common.dtsi      | 18 +++++++++---------
>   1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> index a356db5fcc5f..805fb82138a8 100644
> --- a/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi
> @@ -198,8 +198,8 @@ &usb_phy {
>   };
>   
>   &pio {
> -	gpio_keys_default: gpiodefault {
> -		pins_cmd_dat {
> +	gpio_keys_default: gpio-keys-pins {
> +		pins-cmd-dat {
>   			pinmux = <MT8516_PIN_42_KPCOL0__FUNC_GPIO42>,
>   				 <MT8516_PIN_43_KPCOL1__FUNC_GPIO43>;
>   			bias-pull-up;
> @@ -207,7 +207,7 @@ pins_cmd_dat {
>   		};
>   	};
>   
> -	i2c0_pins_a: i2c0 {
> +	i2c0_pins_a: i2c0-pins {
>   		pins1 {
>   			pinmux = <MT8516_PIN_58_SDA0__FUNC_SDA0_0>,
>   				 <MT8516_PIN_59_SCL0__FUNC_SCL0_0>;
> @@ -215,7 +215,7 @@ pins1 {
>   		};
>   	};
>   
> -	i2c2_pins_a: i2c2 {
> +	i2c2_pins_a: i2c2-pins {
>   		pins1 {
>   			pinmux = <MT8516_PIN_60_SDA2__FUNC_SDA2_0>,
>   				 <MT8516_PIN_61_SCL2__FUNC_SCL2_0>;
> @@ -223,21 +223,21 @@ pins1 {
>   		};
>   	};
>   
> -	tca6416_pins: pinmux_tca6416_pins {
> -		gpio_mux_rst_n_pin {
> +	tca6416_pins: tca6416-pins {
> +		pins-mux-rstn {
>   			pinmux = <MT8516_PIN_65_UTXD1__FUNC_GPIO65>;
>   			output-high;
>   		};
>   
> -		gpio_mux_int_n_pin {
> +		pins-mux-intn {
>   			pinmux = <MT8516_PIN_64_URXD1__FUNC_GPIO64>;
>   			input-enable;
>   			bias-pull-up;
>   		};
>   	};
>   
> -	ethernet_pins_default: ethernet {
> -		pins_ethernet {
> +	ethernet_pins_default: ethernet-pins {
> +		pins-eth {
>   			pinmux = <MT8516_PIN_0_EINT0__FUNC_EXT_TXD0>,
>   				 <MT8516_PIN_1_EINT1__FUNC_EXT_TXD1>,
>   				 <MT8516_PIN_5_EINT5__FUNC_EXT_RXER>,


