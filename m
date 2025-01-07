Return-Path: <linux-gpio+bounces-14577-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E6A046FB
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 17:47:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D28D018825E9
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 16:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 653A22C181;
	Tue,  7 Jan 2025 16:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="y59JBkAI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8140D198E63
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jan 2025 16:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736268440; cv=none; b=Adrk9uXSNBKRbV/TZwAGbnOa5jGEmUmqdgfLDZ+DYugtciKcYvRPHu7jNyebZMgHvAVkIolqf1ONqHHmi9Rlx8Ut6SGkUeNkRA/CaJcuQ7F4I8MvNvAe7gKOK2kq3+oYP5g8oPryKpgTlf+9rXhkieP+FqmO9psZt5K0PJWDH+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736268440; c=relaxed/simple;
	bh=HRjlYMG1WJb0ZEsiF5gdJ18nn1mIHzcbe9qFsUe3MqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l94Tgn0MqAeogUxNRLzEQu1AKp4J8cmsrQjQrvPXRqAGyqpd7hDEmBsJW+QyEZi0XO4E3IJiOxFa4fg2MWv5/0ZH4+F0GANjhsQZGHkhrl8EJLomBCQ7CVSnSf3+4AiDbgTn2bNADEoZpnAcNTN+uxgAnHSYVlYP3Ginkl8werY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=y59JBkAI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso95420345e9.1
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2025 08:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736268434; x=1736873234; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LfIG31bng2HxoyJWuXm1aKqR+Q5i5Ik2oXWCciq8hzg=;
        b=y59JBkAIV5Ql9i3xDF0NyXT89PlWFs/XEN+aIhUpGpw0DqbU/cl101eeGo7HWvg0Yt
         5ufBTc0MWEBLvJKq90DN8rYBfPikxQnuuYc/Js7NVvPPgEHOQAXDLlqshWS/J3zWz+H9
         0awYUEcch2Px0+vJXNoJWdkP3AIhCPSZ0kWfhJe9I+0N1xhroqJXzLUUZIKNpqGwCa8l
         d/n1/L5NpxDx1ipcMo47iooz+UlhTz5kss5S8h5UnELccd1bvMMPCVsI7YGBB/w4SL0c
         VTbrzPsXytmBEcrcDvfz9wom1vXps/eM1IrxAjr4rxxpJIeLDjz4TT9/Lz7xNKhSqq2B
         KKBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736268434; x=1736873234;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LfIG31bng2HxoyJWuXm1aKqR+Q5i5Ik2oXWCciq8hzg=;
        b=FBpXB9xJZqgXHUhehqblxGvrSwpyp2qd8N379Y0BVwRDU7wpZoWCs2shj7rDNgC0w5
         jyEpnnv3vKm2ogF8utpM+nn74Sj8H+T6grjxw230h+uNXTiYua5Fw/Z4Wnp1NGNlIlKI
         RyeRY05eX9nq1B1HXklgUcnlGn8i+vSOsnkSa5gnOmtwrrrsZsqmHYEU1Obfz3LZbfgM
         ZmWkyRp2Z8klJzTbV15hlZbTuN0E1S3uDfu1+61C8qgAC6nYW6eY+9BHvlVdRmgG5QcF
         cEXDG7CHQ2GQXVCn2KUTGO9R6gxtKq0KBMzLcAHkXs2L7o9inclFofmhkTgIcGOPMRGS
         tW1g==
X-Forwarded-Encrypted: i=1; AJvYcCU/Y9m9Euh8RF2LM+3rTnCQWQqw9PEMFJfwM7NC2Eqe9+exFF57xEc25H4AggS2hDRZo7Fw0j8J5N7F@vger.kernel.org
X-Gm-Message-State: AOJu0YzJKrU9tuIAetcQFme6+3XfUBB9nTwFTj5FBS8u33ka5Me9gHAZ
	h9/hBM9xyXNTdiT9S7hHtLss9TpRIFJ5VD7FiesfwbPdsvPvXPFjh9W8EpaMSvCm3aEbx+QVauw
	a
X-Gm-Gg: ASbGncs3lyd3TRH5tdfXu89Sq08cM+YWcj+aYP7vYgunzAMpf5NVJJM/l/fZIvxEx7S
	O5+UUmhKrpkVdUx7yBF+SCaiGs/Z0cN3FQ+ug/3JkE7nA0T8Ns1vxFGLUQoWdmbUFxFUMzz1RSS
	UxbrTtg2ohd8lLr/eKCCcy+pILhJVAaNdiYt1wp0SC++nGPEzf7BP1WMJYcYVj5p8Lox8mMYgr2
	5MsXB+ENR5bk7BAyNdPPHM3/ftdA8PDmvwsJtiSuJ8hfLVobBZ6ynTx
X-Google-Smtp-Source: AGHT+IGmQTKGo+jGOC4/fXhjIYb21MrLqy9TVlZ6yFYHitFQZAEUoZmuJBC1Ro0j7d1OAph9GOuU3g==
X-Received: by 2002:a05:600c:3494:b0:434:e69c:d338 with SMTP id 5b1f17b1804b1-436dc1dd4b0mr30072175e9.5.1736268433736;
        Tue, 07 Jan 2025 08:47:13 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:834b:735a:a2e8:9e7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b013e1sm630609295e9.12.2025.01.07.08.47.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 08:47:13 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,  Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor
 Dooley <conor+dt@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>,
  Kevin Hilman <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  Bartosz Golaszewski
 <brgl@bgdev.pl>,  xianwei.zhao@amlogic.com,  linux-gpio@vger.kernel.org,
  devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2 2/5] pinctrl: pinconf-generic: Add API for pinmux
 propertity in DTS file
In-Reply-To: <20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com> (Xianwei
	Zhao via's message of "Thu, 26 Dec 2024 15:57:42 +0800")
References: <20241226-amlogic-pinctrl-v2-0-cdae42a67b76@amlogic.com>
	<20241226-amlogic-pinctrl-v2-2-cdae42a67b76@amlogic.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 07 Jan 2025 17:47:12 +0100
Message-ID: <1jed1ea7vz.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 26 Dec 2024 at 15:57, Xianwei Zhao via B4 Relay <devnull+xianwei.zhao.amlogic.com@kernel.org> wrote:

> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>
> When describing pin mux func through pinmux propertity,
> a standard API is added for support. The pinmux contains pin
> identification and mux values, which can include multiple
> pins. And groups configuration use other word. DTS such as:
>
> func-name {
> 	group_alias: group-name{
> 		pinmux= <pin_id << 8 | mux_value)>,
> 			<pin_id << 8 | mux_value)>;

This representation does not seem very generic but more tailored to
your use-case.

> 		bias-pull-up;
> 		drive-strength-microamp = <4000>;

If you want to add pinmux (aka alternate function) selection as a
pinconf prop then I think there should be a single pinmux setting per
group, and as many groups as you need per function defined.

something like

func-foo {
	group-a {
        	groups = "pin_a", "pin_b";
                bias-pull-up;
                alternate-function = <2>;
        };

	group-b {
        	groups = "pin_c"";
                bias-disable;
                alternate-function = <5>;
        };
};

Something similar is already done to handle different pin bias requirement
on single function on amlogic platforms:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-axg.dtsi?h=v6.13-rc6#n421


> 	};
> };
>
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  drivers/pinctrl/pinconf-generic.c       | 130 ++++++++++++++++++++++++++++++++
>  drivers/pinctrl/pinconf.h               |   4 +
>  include/linux/pinctrl/pinconf-generic.h |   4 +
>  3 files changed, 138 insertions(+)
>
> diff --git a/drivers/pinctrl/pinconf-generic.c b/drivers/pinctrl/pinconf-generic.c
> index 0b13d7f17b32..a4d3c12a80c4 100644
> --- a/drivers/pinctrl/pinconf-generic.c
> +++ b/drivers/pinctrl/pinconf-generic.c
> @@ -233,6 +233,67 @@ static void parse_dt_cfg(struct device_node *np,
>  	}
>  }
>  
> +/**
> + * pinconf_generic_parse_dt_pinmux()
> + * parse the pinmux properties into generic pin mux values.
> + * @np: node containing the pinmux properties
> + * @pctldev: pincontrol device
> + * @pid: array with pin identity entries
> + * @pmux: array with pin mux value entries
> + * @npins: number of pins
> + *
> + * pinmux propertity: mux value [0,7]bits and pin identity [8,31]bits.
> + */
> +int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
> +				    unsigned int **pid, unsigned int **pmux,
> +				    unsigned int *npins)
> +{
> +	unsigned int *pid_t;
> +	unsigned int *pmux_t;
> +	struct property *prop;
> +	unsigned int npins_t, i;
> +	u32 value;
> +	int ret;
> +
> +	prop = of_find_property(np, "pinmux", NULL);
> +	if (!prop) {
> +		dev_info(dev, "Missing pinmux property\n");
> +		return -ENOENT;
> +	}
> +
> +	if (!pid || !pmux || !npins) {
> +		dev_err(dev, "paramers error\n");
> +		return -EINVAL;
> +	}
> +
> +	npins_t = prop->length / sizeof(u32);
> +	pid_t = devm_kcalloc(dev, npins_t, sizeof(*pid_t), GFP_KERNEL);
> +	pmux_t = devm_kcalloc(dev, npins_t, sizeof(*pmux_t), GFP_KERNEL);
> +	if (!pid_t || !pmux_t) {
> +		dev_err(dev, "kalloc memory fail\n");
> +		return -ENOMEM;
> +	}
> +	for (i = 0; i < npins_t; i++) {
> +		ret = of_property_read_u32_index(np, "pinmux", i, &value);
> +		if (ret) {
> +			dev_err(dev, "get pinmux value fail\n");
> +			goto exit;
> +		}
> +		pmux_t[i] = value & 0xff;
> +		pid_t[i] = (value >> 8) & 0xffffff;
> +	}
> +	*pid = pid_t;
> +	*pmux = pmux_t;
> +	*npins = npins_t;
> +
> +	return 0;
> +exit:
> +	devm_kfree(dev, pid_t);
> +	devm_kfree(dev, pmux_t);
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_pinmux);
> +
>  /**
>   * pinconf_generic_parse_dt_config()
>   * parse the config properties into generic pinconfig values.
> @@ -295,6 +356,75 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(pinconf_generic_parse_dt_config);
>  
> +int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
> +					  struct device_node *np,
> +					  struct pinctrl_map **map,
> +					  unsigned int *num_maps)
> +{
> +	struct device *dev = pctldev->dev;
> +	struct device_node *pnode;
> +	unsigned long *configs = NULL;
> +	unsigned int num_configs = 0;
> +	struct property *prop;
> +	unsigned int reserved_maps;
> +	int reserve;
> +	int ret;
> +
> +	prop = of_find_property(np, "pinmux", NULL);
> +	if (!prop) {
> +		dev_info(dev, "Missing pinmux property\n");
> +		return -ENOENT;
> +	}
> +
> +	pnode = of_get_parent(np);
> +	if (!pnode) {
> +		dev_info(dev, "Missing function node\n");
> +		return -EINVAL;
> +	}
> +
> +	reserved_maps = 0;
> +	*map = NULL;
> +	*num_maps = 0;
> +
> +	ret = pinconf_generic_parse_dt_config(np, pctldev, &configs,
> +					      &num_configs);
> +	if (ret < 0) {
> +		dev_err(dev, "%pOF: could not parse node property\n", np);
> +		return ret;
> +	}
> +
> +	reserve = 1;
> +	if (num_configs)
> +		reserve++;
> +
> +	ret = pinctrl_utils_reserve_map(pctldev, map, &reserved_maps,
> +					num_maps, reserve);
> +	if (ret < 0)
> +		goto exit;
> +
> +	ret = pinctrl_utils_add_map_mux(pctldev, map,
> +					&reserved_maps, num_maps, np->name,
> +					pnode->name);
> +	if (ret < 0)
> +		goto exit;
> +
> +	if (num_configs) {
> +		ret = pinctrl_utils_add_map_configs(pctldev, map, &reserved_maps,
> +						    num_maps, np->name, configs,
> +						    num_configs, PIN_MAP_TYPE_CONFIGS_GROUP);
> +		if (ret < 0)
> +			goto exit;
> +	}
> +
> +exit:
> +	kfree(configs);
> +	if (ret)
> +		pinctrl_utils_free_map(pctldev, *map, *num_maps);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(pinconf_generic_dt_node_to_map_pinmux);
> +
>  int pinconf_generic_dt_subnode_to_map(struct pinctrl_dev *pctldev,
>  		struct device_node *np, struct pinctrl_map **map,
>  		unsigned int *reserved_maps, unsigned int *num_maps,
> diff --git a/drivers/pinctrl/pinconf.h b/drivers/pinctrl/pinconf.h
> index a14c950bc700..a171195b3615 100644
> --- a/drivers/pinctrl/pinconf.h
> +++ b/drivers/pinctrl/pinconf.h
> @@ -138,4 +138,8 @@ int pinconf_generic_parse_dt_config(struct device_node *np,
>  				    struct pinctrl_dev *pctldev,
>  				    unsigned long **configs,
>  				    unsigned int *nconfigs);
> +
> +int pinconf_generic_parse_dt_pinmux(struct device_node *np, struct device *dev,
> +				    unsigned int **pid, unsigned int **pmux,
> +				    unsigned int *npins);
>  #endif
> diff --git a/include/linux/pinctrl/pinconf-generic.h b/include/linux/pinctrl/pinconf-generic.h
> index 53cfde98433d..1bcf071b860e 100644
> --- a/include/linux/pinctrl/pinconf-generic.h
> +++ b/include/linux/pinctrl/pinconf-generic.h
> @@ -232,4 +232,8 @@ static inline int pinconf_generic_dt_node_to_map_all(struct pinctrl_dev *pctldev
>  			PIN_MAP_TYPE_INVALID);
>  }
>  
> +int pinconf_generic_dt_node_to_map_pinmux(struct pinctrl_dev *pctldev,
> +					  struct device_node *np,
> +					  struct pinctrl_map **map,
> +					  unsigned int *num_maps);
>  #endif /* __LINUX_PINCTRL_PINCONF_GENERIC_H */

-- 
Jerome

