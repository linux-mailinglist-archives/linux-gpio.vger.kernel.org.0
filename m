Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3933D6FCAB7
	for <lists+linux-gpio@lfdr.de>; Tue,  9 May 2023 18:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234919AbjEIQGj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 May 2023 12:06:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjEIQGi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 May 2023 12:06:38 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78C7D46B5;
        Tue,  9 May 2023 09:06:36 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-52caed90d17so3337166a12.0;
        Tue, 09 May 2023 09:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683648396; x=1686240396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3D71as6LJWsYMDTb4BiasqKDmId0LkGzfVkMgY6tMoc=;
        b=i8dhhnQhpe5/KpsAyTAlVssvMR0ux0o5onT9Qxzie9BfoGIHQ6SOniG0AlO8B8ZxcL
         5ycfkMwgNjmSIibN/NNfkn5qZaljGAlKPr57vAGXYGktC0jXrY5E3SYQOEMfRwCeEQFL
         uKWsMhtcVzW3In+kDKdi2wn5Zt3T9g0umMlR3PVNGEAmEwpKDiQm8j3Nf2+fS8+b6wrQ
         slylNYxXZbljTUQPhSahBLwdE6akjNBDXMX3KSnJBc6J9/YegRPSLvDgCQi4f4sn080/
         TTwiccVSfo0zo/TKN8B3VIRGxBT4XF5YWG9gNZVgUmrGAPLNalb6F/h0pDd29iRKFfen
         IzNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683648396; x=1686240396;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3D71as6LJWsYMDTb4BiasqKDmId0LkGzfVkMgY6tMoc=;
        b=FL9KIVU6CPp+vYH4I42K4NbiR3GC85wqxdLwqyjbY3ibrN/m7fE1oUZccGIZfEMsUo
         8LLP4jwH7JscImeBcc+zCko5NAlonuhdLVg+7exS5rzr0D4EFCIf7A6zuVN2lEoOZG6Y
         iu8xqSbLsAsU3mPw5vFTsOVeQeY5vNgrVcDDXym6jZmRMo937o0e4mXL7C5/7e+faxgn
         bPwPIrY5NJUK0oUQJgPm2k83bfqGp1h2lJyzu98fRixKNInjJJYBi9FlZ8KHZdEa4AXA
         igZl8eC0beww4j+fzji17OsKCpY4pob8+bPS10B3zjLqloTMX0/kkWSjPsAyoWveke/h
         IVbw==
X-Gm-Message-State: AC+VfDwjOfKcYCdMy7TZQntMYl+nOwEP38FEibbkA5qMLQo84hQiUkb4
        sANt2I58TYdDP/Vfux2h7S0=
X-Google-Smtp-Source: ACHHUZ6vq6rgO7usSQ6hQ8Rf6iwdW69I+IF91CuCUFV2Mybvsjlx3XmHs9ctzTW8ientqNcQ3qg9iA==
X-Received: by 2002:a17:90a:ba8a:b0:240:f8a6:55c7 with SMTP id t10-20020a17090aba8a00b00240f8a655c7mr14101831pjr.20.1683648395618;
        Tue, 09 May 2023 09:06:35 -0700 (PDT)
Received: from [192.168.50.148] (net-2-32-39-33.cust.vodafonedsl.it. [2.32.39.33])
        by smtp.gmail.com with ESMTPSA id o6-20020a17090ac08600b00250ad795d72sm1599484pjs.44.2023.05.09.09.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 May 2023 09:06:34 -0700 (PDT)
Message-ID: <e25723bf-be85-b458-a84c-1a45392683bb@gmail.com>
Date:   Tue, 9 May 2023 18:06:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 09/18] soc: qcom: Add qcom's pstore minidump driver
 support
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <1683133352-10046-10-git-send-email-quic_mojha@quicinc.com>
From:   Luca Stefani <luca.stefani.ge1@gmail.com>
In-Reply-To: <1683133352-10046-10-git-send-email-quic_mojha@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On 03/05/23 19:02, Mukesh Ojha wrote:
> This driver was inspired from the fact pstore ram region should be
> fixed and boot firmware need to have awarness about this region,
> so that it will be persistent across boot. But, there are many
> QCOM SoC which does not support warm boot from hardware but they
> have minidump support from the software, and for them, there is
> no need of this pstore ram region to be fixed, but at the same
> time have interest in the pstore frontends. So, this driver
> get the dynamic reserved region from the ram and register the
> ramoops platform device.
>
>   +---------+     +---------+   +--------+     +---------+
>   | console |     | pmsg    |   | ftrace |     | dmesg   |
>   +---------+     +---------+   +--------+     +---------+
>         |             |             |              |
>         |             |             |              |
>         +------------------------------------------+
>                            |
>                           \ /
>                    +----------------+
>              (1)   |pstore frontends|
>                    +----------------+
>                            |
>                           \ /
>                   +------------------- +
>              (2)  | pstore backend(ram)|
>                   +--------------------+
>                            |
>                           \ /
>                   +--------------------+
>              (3)  |qcom_pstore_minidump|
>                   +--------------------+
>                            |
>                           \ /
>                     +---------------+
>              (4)    | qcom_minidump |
>                     +---------------+
>
> This driver will route all the pstore front data to the stored
> in qcom pstore reserved region and the reason of showing an
> arrow from (3) to (4) as qcom_pstore_minidump driver will register
> all the available frontends region with qcom minidump driver
> in upcoming patch.
>
> Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> ---
>   drivers/soc/qcom/Kconfig                |  11 +++
>   drivers/soc/qcom/Makefile               |   1 +
>   drivers/soc/qcom/qcom_pstore_minidump.c | 116 ++++++++++++++++++++++++++++++++
>   3 files changed, 128 insertions(+)
>   create mode 100644 drivers/soc/qcom/qcom_pstore_minidump.c
>
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index 15c931e..afdc634 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -293,4 +293,15 @@ config QCOM_MINIDUMP
>   	  these selective regions will be dumped instead of the entire DDR.
>   	  This saves significant amount of time and/or storage space.
>   
> +config QCOM_PSTORE_MINIDUMP
> +	tristate "Pstore support for QCOM Minidump"
> +	depends on ARCH_QCOM
> +	depends on PSTORE_RAM
> +	depends on QCOM_MINIDUMP
> +	help
> +	  Enablement of this driver ensures that ramoops region can be anywhere
> +	  reserved in ram instead of being fixed address which needs boot firmware
> +	  awareness. So, this driver creates plaform device and registers available
> +	  frontend region with the Qualcomm's minidump driver.
> +
>   endmenu
> diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
> index 1ebe081..02d30d7 100644
> --- a/drivers/soc/qcom/Makefile
> +++ b/drivers/soc/qcom/Makefile
> @@ -34,3 +34,4 @@ obj-$(CONFIG_QCOM_KRYO_L2_ACCESSORS) +=	kryo-l2-accessors.o
>   obj-$(CONFIG_QCOM_ICC_BWMON)	+= icc-bwmon.o
>   obj-$(CONFIG_QCOM_INLINE_CRYPTO_ENGINE)	+= ice.o
>   obj-$(CONFIG_QCOM_MINIDUMP) += qcom_minidump.o
> +obj-$(CONFIG_QCOM_PSTORE_MINIDUMP) += qcom_pstore_minidump.o
> diff --git a/drivers/soc/qcom/qcom_pstore_minidump.c b/drivers/soc/qcom/qcom_pstore_minidump.c
> new file mode 100644
> index 0000000..8d58500
> --- /dev/null
> +++ b/drivers/soc/qcom/qcom_pstore_minidump.c
> @@ -0,0 +1,116 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/module.h>
> +#include <linux/of_device.h>
> +#include <linux/of_reserved_mem.h>
> +#include <linux/platform_device.h>
> +#include <linux/pstore_ram.h>
> +#include <soc/qcom/qcom_minidump.h>
> +
> +struct qcom_ramoops_config {
> +	unsigned long	record_size;
> +	unsigned long	console_size;
> +	unsigned long	ftrace_size;
> +	unsigned long	pmsg_size;
> +	unsigned int	mem_type;
> +	unsigned int	flags;
> +	int		max_reason;
> +};
> +
> +struct qcom_ramoops_dd {
> +	struct ramoops_platform_data qcom_ramoops_pdata;
> +	struct platform_device *ramoops_pdev;
> +};
> +
> +static struct qcom_ramoops_config default_ramoops_config = {
> +	.mem_type = 2,
> +	.record_size = 0x0,
> +	.console_size = 0x200000,
> +	.ftrace_size = 0x0,
> +	.pmsg_size = 0x0,
> +};

This is effectively hard-cording the configuration of ramoops.

Since the memory range is dynamic and by itself doesn't impose any 
limitation this should be configurable in the device-tree, like a 
standard ramoops entry backed by a memory range.

I think this should provide the same interface/knobs as pstore-ram does, 
unless there's some known limitations to minidump, in which case those 
should be expressed.

> +
> +static struct qcom_ramoops_dd *qcom_rdd;
> +static int qcom_ramoops_probe(struct platform_device *pdev)
> +{
> +	struct device_node *of_node = pdev->dev.of_node;
> +	struct device_node *node;
> +	const struct qcom_ramoops_config *cfg;
> +	struct ramoops_platform_data *pdata;
> +	struct reserved_mem *rmem;
> +	long ret;
> +
> +	node = of_parse_phandle(of_node, "memory-region", 0);
> +	if (!node)
> +		return -ENODEV;
> +
> +	rmem = of_reserved_mem_lookup(node);
> +	of_node_put(node);
> +	if (!rmem) {
> +		dev_err(&pdev->dev, "failed to locate DT /reserved-memory resource\n");
> +		return -EINVAL;
> +	}
> +
> +	qcom_rdd = devm_kzalloc(&pdev->dev, sizeof(*qcom_rdd), GFP_KERNEL);
> +	if (!qcom_rdd)
> +		return -ENOMEM;
> +
> +	cfg = of_device_get_match_data(&pdev->dev);
> +	if (!cfg) {
> +		dev_err(&pdev->dev, "failed to get supported matched data\n");
> +		return -ENOENT;
> +	}
> +
> +	pdata = &qcom_rdd->qcom_ramoops_pdata;
> +	pdata->mem_size = rmem->size;
> +	pdata->mem_address = rmem->base;
> +	pdata->mem_type = cfg->mem_type;
> +	pdata->record_size = cfg->record_size;
> +	pdata->console_size = cfg->console_size;
> +	pdata->ftrace_size = cfg->ftrace_size;
> +	pdata->pmsg_size = cfg->pmsg_size;
> +	pdata->max_reason = KMSG_DUMP_PANIC;
> +
> +	qcom_rdd->ramoops_pdev = platform_device_register_data(NULL, "ramoops", -1,
> +							       pdata, sizeof(*pdata));
> +	if (IS_ERR(qcom_rdd->ramoops_pdev)) {
> +		ret = PTR_ERR(qcom_rdd->ramoops_pdev);
> +		dev_err(&pdev->dev, "could not create platform device: %ld\n", ret);
> +		qcom_rdd->ramoops_pdev = NULL;
> +	}
> +
> +	return ret;
> +}
> +
> +static int qcom_ramoops_remove(struct platform_device *pdev)
> +{
> +	platform_device_unregister(qcom_rdd->ramoops_pdev);
> +	qcom_rdd->ramoops_pdev = NULL;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id qcom_ramoops_of_match[] = {
> +	{ .compatible = "qcom,sm8450-ramoops-minidump", .data = &default_ramoops_config },
> +	{ .compatible = "qcom,ramoops-minidump", .data = &default_ramoops_config },
> +	{}
> +};
> +
> +MODULE_DEVICE_TABLE(of, qcom_ramoops_of_match);
> +static struct platform_driver qcom_ramoops_drv = {
> +	.driver		= {
> +		.name	= "qcom,ramoops-minidump",
> +		.of_match_table = qcom_ramoops_of_match,
> +	},
> +	.probe = qcom_ramoops_probe,
> +	.remove = qcom_ramoops_remove,
> +};
> +
> +module_platform_driver(qcom_ramoops_drv);
> +
> +MODULE_DESCRIPTION("Qualcomm minidump pstore driver");
> +MODULE_LICENSE("GPL");
