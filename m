Return-Path: <linux-gpio+bounces-5922-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A06E8B4BA6
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Apr 2024 14:11:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1AD1E1F21751
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Apr 2024 12:11:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476C869D3C;
	Sun, 28 Apr 2024 12:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zFCbrL9a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E3C6A342
	for <linux-gpio@vger.kernel.org>; Sun, 28 Apr 2024 12:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714306274; cv=none; b=VURTTXnuHA48XLorX/0kcA0VltdnHIaST7Qc82g4IKhq4ywvHhuCeMzimlnu0wOPCRgvDS5DKeffzkUZuAi0eUKnpvtCfWQ7c7R/JvRSJHRjVvQ4bFd+vH4byAphewHRU8rcog4hjo8Ibx+UG0uLkD4gZlDFwWC++hsHh1uISWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714306274; c=relaxed/simple;
	bh=+64wxOTIcf1mVvmQvla1H4FimIOHlzYvb+7dHdfg4pY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoQsd0cY5Jsjn7xF11u5XelfXqWF8+K8pdtTh7aJevwOtEB/QTjCvAy4W8EFatIMaNPVIJ49WUOkiJnB4B0yUmE/AP2p62RjASTizd+6hQTZaxe3y2LFA1CzI7fAR/kIdsQvMaLoNddyQXvSEKQStb/9Msi2MMleEx5sveWZ15Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zFCbrL9a; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-518a56cdc03so3934562e87.1
        for <linux-gpio@vger.kernel.org>; Sun, 28 Apr 2024 05:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714306271; x=1714911071; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KRBSeLk9qclalJBGYAUq3IA67Fsgi/ilD5BmZ2hGWvE=;
        b=zFCbrL9aAr/DBBU4CoUvIrq/Jw/3dPRyKGlst4fcSmjL43lzDR68fD1NQsKhAB4NFG
         Gb4+ubwaY0AsMBfzaKVSiNuV+G8P0Dn0fDg5Ya83+JjyLbm0GnE8A8XNhS3D+OjFWfwP
         J4kNVJ+m2MtFsBCoWHOH4hOiOZyXRC8Vpcby67gC3BhTEKXI8P7Po9k+5oV+2rXoDuEs
         skaxm/Gwxbxj75WhHpWmdx4tWJL9yAQDMC/9ZuJUJ85C6j8D22eNJNJUXFa2b/a8eulU
         2fT3OBLZO4B/U7rBzpZZQeU/G0Vyk+c+QhqkcjQTDYAnZ4z9HnkafI7RJ92M68iR/BGm
         tFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714306271; x=1714911071;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRBSeLk9qclalJBGYAUq3IA67Fsgi/ilD5BmZ2hGWvE=;
        b=Y9alZ3xfaLwwAS5van9fNvXN5RY0P7rOESQmN5vTynyjzpUAXIK6ZNg2daTOpxSqSz
         UwHG9HwSgbHxN9RrV+/4hL62f4IoNr7/x8RPjCZcWmQlTJlg3pWu8D9k11yF2P35G3O5
         FDC3NXYKGLuIhJQykSfR5WUBxY5VO8eGGxQmckpqsCqjpkoet1XybidppMQOCNbfDhT8
         Kbdbv7ouZnu5gZtQuaLVWnv5FwXqA/F4Xz1PCuEbrNjmiiGGtjxj1iP1p9ibork1zrrc
         AStXKpvQqBgp5rou2mId8SMMWnD4O0uhLaFYWLtA0Z4qqmp5huIBp45nJjuoM7QoCkms
         c/bA==
X-Forwarded-Encrypted: i=1; AJvYcCUS7QP/m9Yu8l1La8ckFifNnCGUiQPZZPkCCTAw3+zNp/2g+f9Y5LpXPyIyGekY9pzG/k9T13XXlmOJ5BmR25ozL2YXwWVssciwWw==
X-Gm-Message-State: AOJu0YxNECBOLDcuBYDk5bpDdjSz9YxiNhVLldUJVnHirpdJZ/f24kom
	e8/+VdDJr2xO4sbz1DLNNQu3TtJhTKDcLBQk2++DerX9+pDofEou5Xk5vDUM3xw=
X-Google-Smtp-Source: AGHT+IHzQY3PktXsr5yUNhS5fY9e0Tq26eU3VIAMuAboMo7+PruS6QE21aDbXSwXaBeHKjUFP5rU6w==
X-Received: by 2002:ac2:4ed9:0:b0:518:f697:fac with SMTP id p25-20020ac24ed9000000b00518f6970facmr4613819lfr.18.1714306270129;
        Sun, 28 Apr 2024 05:11:10 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r20-20020a170906705400b00a555ef55ab5sm12689755ejj.218.2024.04.28.05.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Apr 2024 05:11:09 -0700 (PDT)
Date: Sun, 28 Apr 2024 15:11:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-gpio@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 6/6] pinctrl: imx: support SCMI pinctrl protocol for
 i.MX95
Message-ID: <1bc4d494-f4c0-4bec-a2de-e9971ef4be49@moroto.mountain>
References: <20240428-pinctrl-scmi-oem-v3-v3-0-eda341eb47ed@nxp.com>
 <20240428-pinctrl-scmi-oem-v3-v3-6-eda341eb47ed@nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240428-pinctrl-scmi-oem-v3-v3-6-eda341eb47ed@nxp.com>

On Sun, Apr 28, 2024 at 01:07:52PM +0800, Peng Fan (OSS) wrote:
> +static int pinctrl_scmi_imx_dt_group_node_to_map(struct pinctrl_dev *pctldev,
> +						 struct device_node *np,
> +						 struct pinctrl_map **map,
> +						 unsigned int *reserved_maps,
> +						 unsigned int *num_maps,
> +						 const char *func_name)
> +{
> +	struct device *dev = pctldev->dev;
> +	unsigned long *cfgs = NULL;
> +	unsigned int n_cfgs, reserve = 1;
> +	int i, n_pins, ret;
> +	u32 ncfg, val, mask, shift, pin_conf, pinmux_group;
> +	unsigned long cfg[IMX_SCMI_NUM_CFG];
> +	enum pin_config_param param;
> +	struct property *prop;
> +	const __be32 *p;
> +
> +	n_pins = of_property_count_u32_elems(np, "pinmux");
> +	if (n_pins < 0) {
> +		dev_warn(dev, "Can't find 'pinmux' property in node %pOFn\n", np);
> +		return -EINVAL;

	return n_pins;

> +	} else if (!n_pins) {
> +		return -EINVAL;
> +	}
> +
> +	ret = pinconf_generic_parse_dt_config(np, pctldev, &cfgs, &n_cfgs);
> +	if (ret) {
> +		dev_err(dev, "%pOF: could not parse node property\n", np);
> +		return ret;
> +	}
> +
> +	pin_conf = 0;
> +	for (i = 0; i < n_cfgs; i++) {
> +		param = pinconf_to_config_param(cfgs[i]);
> +		ret = pinctrl_scmi_imx_map_pinconf_type(param, &mask, &shift);
> +		if (ret) {
> +			dev_err(dev, "Error map pinconf_type %d\n", ret);
> +			return ret;

This should be goto free_cfgs.

> +		}
> +
> +		val = pinconf_to_config_argument(cfgs[i]);
> +
> +		pin_conf |= (val << shift) & mask;
> +
> +	}
> +
> +	reserve = n_pins * (1 + n_cfgs);
> +
> +	ret = pinctrl_utils_reserve_map(pctldev, map, reserved_maps, num_maps,
> +					reserve);
> +	if (ret < 0)
> +		goto free_cfgs;
> +
> +	of_property_for_each_u32(np, "pinmux", prop, p, pinmux_group) {
> +		u32 pin_id, pin_func, daisy_id, daisy_val, daisy_valid;
> +		const char *pin_name;
> +
> +		i = 0;
> +		ncfg = IMX_SCMI_NUM_CFG;
> +		pin_id = get_pin_no(pinmux_group);
> +		pin_func = get_pin_func(pinmux_group);
> +		daisy_id = get_pin_daisy_no(pinmux_group);
> +		daisy_val = get_pin_daisy_val(pinmux_group);
> +		cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_MUX, pin_func);
> +		cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_CONFIG, pin_conf);
> +
> +		daisy_valid = get_pin_daisy_valid(pinmux_group);
> +		if (daisy_valid) {
> +			cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_ID,
> +							    daisy_id);
> +			cfg[i++] = pinconf_to_config_packed(IMX_SCMI_PIN_DAISY_CFG,
> +							    daisy_val);
> +		} else {
> +			ncfg -= 2;
> +		}
> +
> +		pin_name = pin_get_name(pctldev, pin_id);
> +
> +		dev_dbg(dev, "pin: %s, pin_conf: 0x%x, daisy_id: %u, daisy_val: 0x%x\n",
> +			pin_name, pin_conf, daisy_id, daisy_val);
> +
> +		ret = pinctrl_utils_add_map_configs(pctldev, map, reserved_maps,
> +						    num_maps, pin_name,
> +						    cfg, ncfg,
> +						    PIN_MAP_TYPE_CONFIGS_PIN);
> +		if (ret < 0)
> +			goto free_cfgs;
> +	};
> +
> +
> +free_cfgs:
> +	kfree(cfgs);
> +	return ret;
> +}
> +
> +static int pinctrl_scmi_imx_dt_node_to_map(struct pinctrl_dev *pctldev,
> +					   struct device_node *np_config,
> +					   struct pinctrl_map **map,
> +					   unsigned int *num_maps)
> +
> +{
> +	unsigned int reserved_maps;
> +	struct device_node *np;
> +	int ret = 0;
> +
> +	reserved_maps = 0;
> +	*map = NULL;
> +	*num_maps = 0;
> +
> +	for_each_available_child_of_node(np_config, np) {

Btw, if you used the scoped version of these loops such as
for_each_available_child_of_node_scoped(), then

> +		ret = pinctrl_scmi_imx_dt_group_node_to_map(pctldev, np, map,
> +							    &reserved_maps,
> +							    num_maps,
> +							    np_config->name);
> +		if (ret < 0) {
> +			of_node_put(np);

You could get rid of the calls to of_node_put().  I would move the
call to pinctrl_utils_free_map() here.

		if (ret) {
			pinctrl_utils_free_map(pctldev, *map, *num_maps);
			return ret;
		}

> +			break;
> +		}
> +	}
> +
> +	if (ret)
> +		pinctrl_utils_free_map(pctldev, *map, *num_maps);
> +
> +	return ret;

	return 0;

> +}

regards,
dan carpenter


