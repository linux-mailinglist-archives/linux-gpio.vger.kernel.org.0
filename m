Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0A56784F8B
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Aug 2023 06:13:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232435AbjHWENV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Aug 2023 00:13:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjHWENU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2023 00:13:20 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96CF9E46
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 21:13:17 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c0a4333e03so1248415ad.0
        for <linux-gpio@vger.kernel.org>; Tue, 22 Aug 2023 21:13:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692763997; x=1693368797;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1YyIv/88F1dFRoBJzoot2JKtje+MiuKLBaB2Qjxow10=;
        b=Fj4x/u0LdrW7C7YZhuC0/QrMzdR2hY6+OSsaKFMAlpnLTZOBshweU2fnjcyvoemNRz
         9lAZEh6DTsmt7ph4Qx4wKmYUQ6Bglo8/yjbR9vx+XuXGJq1IrYg1g1IuLYSWV79neZ4v
         ptiNAr9p/+id6cWE8C6t00xUE+eUn9bVR5OBPKvFDT3uti61+M1wH+YrSYYQGnSrMasR
         VmrWoe9/jNovxleKp6qLpm/O8oeiNazdoufnJUOom3tx072k/9975bXLi7RIa0jwlfBR
         vqDyObWPO/cexh4+ghtTH3yqfsO6LtetAO7pntCJWp5BCCfQ+cAkUJzmHoq4oKPPRnJw
         mEdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692763997; x=1693368797;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1YyIv/88F1dFRoBJzoot2JKtje+MiuKLBaB2Qjxow10=;
        b=TKbdb11V945Efc5DYegipcp0Fw3+8Z7T/HbQuQYabE/CoCNTKNp+puJZVF+6NJiYl/
         /DtpeuyciADHmC09zCkqvH/cAUgUyz1/6R5N7o8mSCX3uMwJ+Q+m2fiowN03hDjZIeSq
         2/hOcf2C/sA/D7xzxWb+hVvgvaeBwXDXvWFIDyClfDn6OCWC56O+1EaOaB/oKzEXtdvq
         0D8crjC8TzJFl1Q/aKGBWIgG+T+0jWZUblp+Yb181IV5TiaZkumFSZnMVIw36Y14Hjhw
         TzcphKDCbHUW5b+GNiNsqxM88E+qWCYH/DmISocmSM+k0hwCYDcbaM18KJOkjt7SMGD2
         mvQw==
X-Gm-Message-State: AOJu0YxZPF5+7sgnMzMvGtlwe8Jw0cCc6gp/P2QmmNLkc4xIWIYMfNgt
        ne5vi1+E2iwsiN6Agy+rma4mlw==
X-Google-Smtp-Source: AGHT+IFCgDMBeHwgoRskSfI6sJCG1RnTTdZDcJjBsNbYKh21xjiQUSbdFAsNgibx4Uj06yc5fqqjNg==
X-Received: by 2002:a17:90a:6bc1:b0:26d:1f75:7fa3 with SMTP id w59-20020a17090a6bc100b0026d1f757fa3mr10413049pjj.4.1692763996847;
        Tue, 22 Aug 2023 21:13:16 -0700 (PDT)
Received: from octopus ([2400:4050:c3e1:100:c42c:e1e7:4c2:47d8])
        by smtp.gmail.com with ESMTPSA id l20-20020a170903005400b001bdcafcf8d3sm9866159pla.69.2023.08.22.21.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 21:13:16 -0700 (PDT)
Date:   Wed, 23 Aug 2023 13:13:12 +0900
From:   AKASHI Takahiro <takahiro.akashi@linaro.org>
To:     Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc:     "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] pinctrl: Implementation of the generic
 scmi-pinctrl driver
Message-ID: <ZOWHWLVtKXwRug+Z@octopus>
Mail-Followup-To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
        Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
        "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
References: <cover.1691518313.git.oleksii_moisieiev@epam.com>
 <a6cefa60500cd46313ad6cda4f13f4985c0f5237.1691518314.git.oleksii_moisieiev@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a6cefa60500cd46313ad6cda4f13f4985c0f5237.1691518314.git.oleksii_moisieiev@epam.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Oleksii,

On Tue, Aug 08, 2023 at 06:25:35PM +0000, Oleksii Moisieiev wrote:
> scmi-pinctrl driver implements pinctrl driver interface and using
> SCMI protocol to redirect messages from pinctrl subsystem SDK to
> SCMI platform firmware, which does the changes in HW.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
> Changes v3 -> v4
>   - ordered config option alphabetically
>   - ordered object file alphabetically
>   - rephrased PINCTRL_SCMI config description
>   - formatting fixes, removed blank lines after get_drvdata call
>   - code style adjustments
>   - add set_drvdata call
>   - removed goto label
>   - refactoring of the devm resource management
>   - removed pctldev != NULL check
>   - fix parameter name in pinconf-group-get
>   - probe function refactoring
>   - removed unneeded pmx checks
> ---
>  MAINTAINERS                    |   1 +
>  drivers/pinctrl/Kconfig        |  11 +
>  drivers/pinctrl/Makefile       |   1 +
>  drivers/pinctrl/pinctrl-scmi.c | 442 +++++++++++++++++++++++++++++++++
>  4 files changed, 455 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-scmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 2d81d00e5f4f..c4e36f955e53 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -20527,6 +20527,7 @@ M:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
>  L:	linux-arm-kernel@lists.infradead.org
>  S:	Maintained
>  F:	drivers/firmware/arm_scmi/pinctrl.c
> +F:	drivers/pinctrl/pinctrl-scmi.c
>  
>  SYSTEM RESET/SHUTDOWN DRIVERS
>  M:	Sebastian Reichel <sre@kernel.org>
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 5787c579dcf6..956cfe76fbc6 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -428,6 +428,17 @@ config PINCTRL_ROCKCHIP
>  	help
>            This support pinctrl and GPIO driver for Rockchip SoCs.
>  
> +config PINCTRL_SCMI
> +	tristate "Pinctrl driver using SCMI protocol interface"
> +	depends on ARM_SCMI_PROTOCOL || COMPILE_TEST
> +	select PINMUX
> +	select GENERIC_PINCONF
> +	help
> +	  This driver provides support for pinctrl which is controlled
> +	  by firmware that implements the SCMI interface.
> +	  It uses SCMI Message Protocol to interact with the
> +	  firmware providing all the pinctrl controls.
> +
>  config PINCTRL_SINGLE
>  	tristate "One-register-per-pin type device tree based pinctrl driver"
>  	depends on OF
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index e196c6e324ad..25d67bac9ee0 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_PINCTRL_PIC32)	+= pinctrl-pic32.o
>  obj-$(CONFIG_PINCTRL_PISTACHIO)	+= pinctrl-pistachio.o
>  obj-$(CONFIG_PINCTRL_RK805)	+= pinctrl-rk805.o
>  obj-$(CONFIG_PINCTRL_ROCKCHIP)	+= pinctrl-rockchip.o
> +obj-$(CONFIG_PINCTRL_SCMI)	+= pinctrl-scmi.o
>  obj-$(CONFIG_PINCTRL_SINGLE)	+= pinctrl-single.o
>  obj-$(CONFIG_PINCTRL_ST) 	+= pinctrl-st.o
>  obj-$(CONFIG_PINCTRL_STMFX) 	+= pinctrl-stmfx.o
> diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
> new file mode 100644
> index 000000000000..a9304402ddf1
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-scmi.c
> @@ -0,0 +1,442 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * System Control and Power Interface (SCMI) Protocol based pinctrl driver
> + *
> + * Copyright (C) 2023 EPAM
> + */
> +
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/module.h>
> +#include <linux/seq_file.h>
> +#include <linux/scmi_protocol.h>
> +#include <linux/slab.h>
> +
> +#include <linux/pinctrl/machine.h>
> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinconf-generic.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#include "pinctrl-utils.h"
> +#include "core.h"
> +#include "pinconf.h"
> +
> +#define DRV_NAME "scmi-pinctrl"
> +
> +static const struct scmi_pinctrl_proto_ops *pinctrl_ops;
> +
> +struct scmi_pinctrl_funcs {
> +	unsigned int num_groups;
> +	const char **groups;
> +};
> +
> +struct scmi_pinctrl {
> +	struct device *dev;
> +	struct scmi_protocol_handle *ph;
> +	struct pinctrl_dev *pctldev;
> +	struct pinctrl_desc pctl_desc;
> +	struct scmi_pinctrl_funcs *functions;
> +	unsigned int nr_functions;
> +	char **groups;
> +	unsigned int nr_groups;
> +	struct pinctrl_pin_desc *pins;
> +	unsigned int nr_pins;
> +};
> +
> +static int pinctrl_scmi_get_groups_count(struct pinctrl_dev *pctldev)
> +{
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pinctrl_ops->count_get(pmx->ph, GROUP_TYPE);
> +}
> +
> +static const char *pinctrl_scmi_get_group_name(struct pinctrl_dev *pctldev, unsigned int selector)
> +{
> +	int ret;
> +	const char *name;
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	ret = pinctrl_ops->name_get(pmx->ph, selector, GROUP_TYPE, &name);
> +	if (ret) {
> +		dev_err(pmx->dev, "get name failed with err %d", ret);
> +		return NULL;
> +	}
> +
> +	return name;
> +}
> +
> +static int pinctrl_scmi_get_group_pins(struct pinctrl_dev *pctldev,
> +				       unsigned int selector,
> +				       const unsigned int **pins,
> +				       unsigned int *num_pins)
> +{
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pinctrl_ops->group_pins_get(pmx->ph, selector, pins, num_pins);
> +}
> +
> +#ifdef CONFIG_OF
> +static int pinctrl_scmi_dt_node_to_map(struct pinctrl_dev *pctldev,
> +				       struct device_node *np_config,
> +				       struct pinctrl_map **map,
> +				       u32 *num_maps)
> +{
> +	return pinconf_generic_dt_node_to_map(pctldev, np_config, map, num_maps,
> +					      PIN_MAP_TYPE_INVALID);
> +}
> +
> +static void pinctrl_scmi_dt_free_map(struct pinctrl_dev *pctldev, struct pinctrl_map *map,
> +				     u32 num_maps)
> +{
> +	kfree(map);
> +}
> +
> +#endif /* CONFIG_OF */
> +
> +static const struct pinctrl_ops pinctrl_scmi_pinctrl_ops = {
> +	.get_groups_count = pinctrl_scmi_get_groups_count,
> +	.get_group_name = pinctrl_scmi_get_group_name,
> +	.get_group_pins = pinctrl_scmi_get_group_pins,
> +#ifdef CONFIG_OF
> +	.dt_node_to_map = pinctrl_scmi_dt_node_to_map,
> +	.dt_free_map = pinctrl_scmi_dt_free_map,
> +#endif
> +};
> +
> +static int pinctrl_scmi_get_functions_count(struct pinctrl_dev *pctldev)
> +{
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pinctrl_ops->count_get(pmx->ph, FUNCTION_TYPE);
> +}
> +
> +static const char *pinctrl_scmi_get_function_name(struct pinctrl_dev *pctldev,
> +						  unsigned int selector)
> +{
> +	int ret;
> +	const char *name;
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	ret = pinctrl_ops->name_get(pmx->ph, selector, FUNCTION_TYPE, &name);
> +	if (ret) {
> +		dev_err(pmx->dev, "get name failed with err %d", ret);
> +		return NULL;
> +	}
> +
> +	return name;
> +}
> +
> +static int pinctrl_scmi_get_function_groups(struct pinctrl_dev *pctldev,
> +					    unsigned int selector,
> +					    const char * const **groups,
> +					    unsigned int * const num_groups)
> +{
> +	const unsigned int *group_ids;
> +	int ret, i;
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	if (!groups || !num_groups)
> +		return -EINVAL;
> +
> +	if (selector < pmx->nr_functions &&
> +	    pmx->functions[selector].num_groups) {
> +		*groups = (const char * const *)pmx->functions[selector].groups;
> +		*num_groups = pmx->functions[selector].num_groups;
> +		return 0;
> +	}
> +
> +	ret = pinctrl_ops->function_groups_get(pmx->ph, selector,
> +					       &pmx->functions[selector].num_groups,
> +					       &group_ids);
> +	if (ret) {
> +		dev_err(pmx->dev, "Unable to get function groups, err %d", ret);
> +		return ret;
> +	}
> +
> +	*num_groups = pmx->functions[selector].num_groups;
> +	if (!*num_groups)
> +		return -EINVAL;
> +
> +	pmx->functions[selector].groups =
> +		devm_kcalloc(pmx->dev, *num_groups, sizeof(*pmx->functions[selector].groups),
> +			GFP_KERNEL);
> +	if (!pmx->functions[selector].groups)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < *num_groups; i++) {
> +		pmx->functions[selector].groups[i] =
> +			pinctrl_scmi_get_group_name(pmx->pctldev,
> +						    group_ids[i]);
> +		if (!pmx->functions[selector].groups[i]) {
> +			ret = -ENOMEM;
> +			goto err_free;
> +		}
> +	}
> +
> +	*groups = (const char * const *)pmx->functions[selector].groups;
> +
> +	return 0;
> +
> +err_free:
> +	devm_kfree(pmx->dev, pmx->functions[selector].groups);
> +
> +	return ret;
> +}
> +
> +static int pinctrl_scmi_func_set_mux(struct pinctrl_dev *pctldev, unsigned int selector,
> +				     unsigned int group)
> +{
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pinctrl_ops->mux_set(pmx->ph, selector, group);
> +}
> +
> +static int pinctrl_scmi_request(struct pinctrl_dev *pctldev, unsigned int offset)
> +{
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pinctrl_ops->pin_request(pmx->ph, offset);
> +}
> +
> +static int pinctrl_scmi_free(struct pinctrl_dev *pctldev, unsigned int offset)
> +{
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +
> +	return pinctrl_ops->pin_free(pmx->ph, offset);
> +}
> +
> +static const struct pinmux_ops pinctrl_scmi_pinmux_ops = {
> +	.request = pinctrl_scmi_request,
> +	.free = pinctrl_scmi_free,
> +	.get_functions_count = pinctrl_scmi_get_functions_count,
> +	.get_function_name = pinctrl_scmi_get_function_name,
> +	.get_function_groups = pinctrl_scmi_get_function_groups,
> +	.set_mux = pinctrl_scmi_func_set_mux,
> +};
> +
> +static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev, unsigned int _pin,
> +				    unsigned long *config)
> +{
> +	int ret;
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param config_type;
> +	unsigned long config_value;
> +
> +	if (!config)
> +		return -EINVAL;
> +
> +	config_type = pinconf_to_config_param(*config);
> +
> +	ret = pinctrl_ops->config_get(pmx->ph, _pin, PIN_TYPE, config_type, &config_value);
> +	if (ret)
> +		return ret;
> +
> +	*config = pinconf_to_config_packed(config_type, config_value);
> +
> +	return 0;
> +}
> +
> +static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
> +				    unsigned int _pin,
> +				    unsigned long *configs,
> +				    unsigned int num_configs)
> +{
> +	int i, ret;
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param config_type;
> +	unsigned long config_value;
> +
> +	if (!configs || num_configs == 0)
> +		return -EINVAL;
> +
> +	for (i = 0; i < num_configs; i++) {
> +		config_type = pinconf_to_config_param(configs[i]);
> +		config_value = pinconf_to_config_argument(configs[i]);

The generic pinconf parameters defined as "enum pin_config_param"
do not exactly match with a set of SCMI's configuration types defined
in Table 23 in the section 4.11.2.6 "PINCTRL_CONFIG_GET".
pinconf_to_config_param() simply masks the lowest 8 bits of the input
value, but doesn't convert anything.

How does this function work as expected?
Do I miss anything?

Regards,
-Takahiro Akashi

> +
> +		ret = pinctrl_ops->config_set(pmx->ph, _pin, PIN_TYPE, config_type, config_value);
> +		if (ret) {
> +			dev_err(pmx->dev, "Error parsing config %ld\n",
> +				configs[i]);
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +}
> +
> +static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
> +					  unsigned int group,
> +					  unsigned long *configs,
> +					  unsigned int num_configs)
> +{
> +	int i, ret;
> +	struct scmi_pinctrl *pmx =  pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param config_type;
> +	unsigned long config_value;
> +
> +	if (!configs || num_configs == 0)
> +		return -EINVAL;
> +
> +	for (i = 0; i < num_configs; i++) {
> +		config_type = pinconf_to_config_param(configs[i]);
> +		config_value = pinconf_to_config_argument(configs[i]);
> +
> +		ret = pinctrl_ops->config_set(pmx->ph, group, GROUP_TYPE, config_type,
> +					      config_value);
> +		if (ret) {
> +			dev_err(pmx->dev, "Error parsing config = %ld",
> +				configs[i]);
> +			break;
> +		}
> +	}
> +
> +	return ret;
> +};
> +
> +static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
> +					  unsigned int group,
> +					  unsigned long *config)
> +{
> +	int ret;
> +	struct scmi_pinctrl *pmx = pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param config_type;
> +	unsigned long config_value;
> +
> +	if (!config)
> +		return -EINVAL;
> +
> +	config_type = pinconf_to_config_param(*config);
> +
> +	ret = pinctrl_ops->config_get(pmx->ph, group, GROUP_TYPE, config_type, &config_value);
> +	if (ret)
> +		return ret;
> +
> +	*config = pinconf_to_config_packed(config_type, config_value);
> +
> +	return 0;
> +}
> +
> +static const struct pinconf_ops pinctrl_scmi_pinconf_ops = {
> +	.is_generic = true,
> +	.pin_config_get = pinctrl_scmi_pinconf_get,
> +	.pin_config_set = pinctrl_scmi_pinconf_set,
> +	.pin_config_group_set = pinctrl_scmi_pinconf_group_set,
> +	.pin_config_group_get = pinctrl_scmi_pinconf_group_get,
> +	.pin_config_config_dbg_show = pinconf_generic_dump_config,
> +};
> +
> +static int pinctrl_scmi_get_pins(struct scmi_pinctrl *pmx,
> +				 unsigned int *nr_pins,
> +				 const struct pinctrl_pin_desc **pins)
> +{
> +	int ret, i;
> +
> +	if (!pins || !nr_pins)
> +		return -EINVAL;
> +
> +	if (pmx->nr_pins) {
> +		*pins = pmx->pins;
> +		*nr_pins = pmx->nr_pins;
> +		return 0;
> +	}
> +
> +	*nr_pins = pinctrl_ops->count_get(pmx->ph, PIN_TYPE);
> +
> +	pmx->nr_pins = *nr_pins;
> +	pmx->pins = devm_kmalloc_array(pmx->dev, *nr_pins, sizeof(*pmx->pins), GFP_KERNEL);
> +	if (!pmx->pins)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < *nr_pins; i++) {
> +		pmx->pins[i].number = i;
> +		ret = pinctrl_ops->name_get(pmx->ph, i, PIN_TYPE, &pmx->pins[i].name);
> +		if (ret) {
> +			dev_err(pmx->dev, "Can't get name for pin %d: rc %d", i, ret);
> +			pmx->nr_pins = 0;
> +			return ret;
> +		}
> +	}
> +
> +	*pins = pmx->pins;
> +	dev_dbg(pmx->dev, "got pins %d", *nr_pins);
> +
> +	return 0;
> +}
> +
> +static const struct scmi_device_id scmi_id_table[] = {
> +	{ SCMI_PROTOCOL_PINCTRL, "pinctrl" },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(scmi, scmi_id_table);
> +
> +static int scmi_pinctrl_probe(struct scmi_device *sdev)
> +{
> +	int ret;
> +	struct device *dev = &sdev->dev;
> +	struct scmi_pinctrl *pmx;
> +	const struct scmi_handle *handle;
> +	struct scmi_protocol_handle *ph;
> +
> +	if (!sdev || !sdev->handle)
> +		return -EINVAL;
> +
> +	handle = sdev->handle;
> +
> +	pinctrl_ops = handle->devm_protocol_get(sdev, SCMI_PROTOCOL_PINCTRL, &ph);
> +	if (IS_ERR(pinctrl_ops))
> +		return PTR_ERR(pinctrl_ops);
> +
> +	pmx = devm_kzalloc(dev, sizeof(*pmx), GFP_KERNEL);
> +	if (!pmx)
> +		return -ENOMEM;
> +
> +	pmx->ph = ph;
> +
> +	pmx->dev = dev;
> +	pmx->pctl_desc.name = DRV_NAME;
> +	pmx->pctl_desc.owner = THIS_MODULE;
> +	pmx->pctl_desc.pctlops = &pinctrl_scmi_pinctrl_ops;
> +	pmx->pctl_desc.pmxops = &pinctrl_scmi_pinmux_ops;
> +	pmx->pctl_desc.confops = &pinctrl_scmi_pinconf_ops;
> +
> +	ret = pinctrl_scmi_get_pins(pmx, &pmx->pctl_desc.npins,
> +				    &pmx->pctl_desc.pins);
> +	if (ret)
> +		return ret;
> +
> +	ret = devm_pinctrl_register_and_init(dev, &pmx->pctl_desc, pmx, &pmx->pctldev);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register pinctrl\n");
> +
> +	pmx->nr_functions = pinctrl_scmi_get_functions_count(pmx->pctldev);
> +	pmx->nr_groups = pinctrl_scmi_get_groups_count(pmx->pctldev);
> +
> +	if (pmx->nr_functions) {
> +		pmx->functions =
> +			devm_kcalloc(dev, pmx->nr_functions, sizeof(*pmx->functions),
> +				     GFP_KERNEL);
> +		if (!pmx->functions)
> +			return -ENOMEM;
> +	}
> +
> +	if (pmx->nr_groups) {
> +		pmx->groups =
> +			devm_kcalloc(dev, pmx->nr_groups, sizeof(*pmx->groups), GFP_KERNEL);
> +		if (!pmx->groups)
> +			return -ENOMEM;
> +	}
> +
> +	return pinctrl_enable(pmx->pctldev);
> +}
> +
> +static struct scmi_driver scmi_pinctrl_driver = {
> +	.name = DRV_NAME,
> +	.probe = scmi_pinctrl_probe,
> +	.id_table = scmi_id_table,
> +};
> +module_scmi_driver(scmi_pinctrl_driver);
> +
> +MODULE_AUTHOR("Oleksii Moisieiev <oleksii_moisieiev@epam.com>");
> +MODULE_DESCRIPTION("ARM SCMI pin controller driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.25.1
