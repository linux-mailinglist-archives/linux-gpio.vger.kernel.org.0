Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 91DDE3370C7
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 12:05:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbhCKLEe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 06:04:34 -0500
Received: from mga03.intel.com ([134.134.136.65]:53526 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232377AbhCKLE1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Mar 2021 06:04:27 -0500
IronPort-SDR: QkvgTlMuZxIF8Q8ItqLcPEHU7MVEijeNNgls+ratzC2fmShpovA6+iKAJkkqT37sENFeKekmBF
 2fazNWlzRLaQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9919"; a="188688054"
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="188688054"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 03:01:05 -0800
IronPort-SDR: z73757MFrM7ckPjQiK1SVJ/pPkvUwA+fZmebp3EzczpWx29sQJMVBqR64D/nNQavLiP+/clYZf
 D17L0kTR38iA==
X-IronPort-AV: E=Sophos;i="5.81,240,1610438400"; 
   d="scan'208";a="438167678"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2021 03:01:03 -0800
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@intel.com>)
        id 1lKJ3t-00BYnw-C1; Thu, 11 Mar 2021 13:01:01 +0200
Date:   Thu, 11 Mar 2021 13:01:01 +0200
From:   Andy Shevchenko <andriy.shevchenko@intel.com>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v5] pinctrl: qcom: sc8180x: add ACPI probe support
Message-ID: <YEn4bZDoOOYTzJ+O@smile.fi.intel.com>
References: <20210311024102.15450-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210311024102.15450-1-shawn.guo@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 11, 2021 at 10:41:02AM +0800, Shawn Guo wrote:
> It adds ACPI probe support for pinctrl-sc8180x driver.  We have one
> problem with ACPI table, i.e. GIO0 (TLMM) block has one single memory
> resource to cover 3 tiles defined by SC8180X.  To follow the hardware
> layout of 3 tiles which is already supported DT probe, it adds one
> function to replace the original single memory resource with 3 named
> ones for tiles.  With that, We can map memory for ACPI in the same way
> as DT.

FWIW,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

(See some minor comments below)

> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
> Changes for v5:
> - Keep .ngpios number as 190 to match SoC spec.
> - Add comments for sc8180x_pinctrl_add_tile_resources().
> - Drop redundant error message.
> 
> Changes for v4:
> - Add sc8180x_pinctrl_add_tile_resources() to massage memory resource
>   for ACPI probe.
> 
> Changes for v3:
> - Remove the use of tiles completely.
> - Drop unneed include of acpi.h.
> 
> Changes for v2:
> - Pass soc_data pointer via .driver_data.
> - Drop use of CONFIG_ACPI and ACPI_PTR().
> - Add comment for sc8180x_acpi_reserved_gpios[] terminator.
> 
>  drivers/pinctrl/qcom/Kconfig           |   2 +-
>  drivers/pinctrl/qcom/pinctrl-sc8180x.c | 123 ++++++++++++++++++++++++-
>  2 files changed, 122 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index 6853a896c476..9f0218c4f9b3 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -222,7 +222,7 @@ config PINCTRL_SC7280
>  
>  config PINCTRL_SC8180X
>  	tristate "Qualcomm Technologies Inc SC8180x pin controller driver"
> -	depends on GPIOLIB && OF
> +	depends on GPIOLIB && (OF || ACPI)
>  	select PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> diff --git a/drivers/pinctrl/qcom/pinctrl-sc8180x.c b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
> index b765bf667574..0d9654b4ab60 100644
> --- a/drivers/pinctrl/qcom/pinctrl-sc8180x.c
> +++ b/drivers/pinctrl/qcom/pinctrl-sc8180x.c
> @@ -23,6 +23,21 @@ enum {
>  	WEST
>  };
>  
> +/*
> + * ACPI DSDT has one single memory resource for TLMM.  The offsets below are

One space is enough.

> + * used to locate different tiles for ACPI probe.
> + */
> +struct tile_info {
> +	u32 offset;
> +	u32 size;
> +};
> +
> +static const struct tile_info sc8180x_tile_info[] = {
> +	{ 0x00d00000, 0x00300000, },
> +	{ 0x00500000, 0x00700000, },
> +	{ 0x00100000, 0x00300000, },
> +};
> +
>  #define FUNCTION(fname)					\
>  	[msm_mux_##fname] = {				\
>  		.name = #fname,				\
> @@ -1557,6 +1572,13 @@ static const struct msm_pingroup sc8180x_groups[] = {
>  	[193] = SDC_QDSD_PINGROUP(sdc2_data, 0x4b2000, 9, 0),
>  };
>  
> +static const int sc8180x_acpi_reserved_gpios[] = {
> +	0, 1, 2, 3,
> +	47, 48, 49, 50,
> +	126, 127, 128, 129,
> +	-1 /* terminator */
> +};
> +
>  static const struct msm_gpio_wakeirq_map sc8180x_pdc_map[] = {
>  	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 }, { 12, 104 },
>  	{ 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 }, { 30, 39 }, { 36, 43 },
> @@ -1588,13 +1610,109 @@ static struct msm_pinctrl_soc_data sc8180x_pinctrl = {
>  	.nwakeirq_map = ARRAY_SIZE(sc8180x_pdc_map),
>  };
>  
> +static const struct msm_pinctrl_soc_data sc8180x_acpi_pinctrl = {
> +	.tiles = sc8180x_tiles,
> +	.ntiles = ARRAY_SIZE(sc8180x_tiles),
> +	.pins = sc8180x_pins,
> +	.npins = ARRAY_SIZE(sc8180x_pins),
> +	.groups = sc8180x_groups,
> +	.ngroups = ARRAY_SIZE(sc8180x_groups),
> +	.reserved_gpios = sc8180x_acpi_reserved_gpios,
> +	.ngpios = 190,
> +};
> +
> +/*
> + * ACPI DSDT has one single memory resource for TLMM, which voilates the
> + * hardware layout of 3 sepearte tiles.  Let's split the memory resource into
> + * 3 named ones, so that msm_pinctrl_probe() can map memory for ACPI in the
> + * same way as for DT probe.
> + */
> +static int sc8180x_pinctrl_add_tile_resources(struct platform_device *pdev)
> +{
> +	int nres_num = pdev->num_resources + ARRAY_SIZE(sc8180x_tiles) - 1;
> +	struct resource *mres, *nres, *res;
> +	int i, ret;
> +
> +	/*
> +	 * DT already has tiles defined properly, so nothing needs to be done
> +	 * for DT probe.
> +	 */
> +	if (pdev->dev.of_node)
> +		return 0;
> +
> +	/* Allocate for new resources */
> +	nres = devm_kzalloc(&pdev->dev, sizeof(*nres) * nres_num, GFP_KERNEL);

devm_kcalloc()

> +	if (!nres)
> +		return -ENOMEM;
> +
> +	res = nres;
> +
> +	for (i = 0; i < pdev->num_resources; i++) {
> +		struct resource *r = &pdev->resource[i];
> +
> +		/* Save memory resource and copy others */
> +		if (resource_type(r) == IORESOURCE_MEM)
> +			mres = r;
> +		else
> +			*res++ = *r;
> +	}
> +
> +	/* Append tile memory resources */
> +	for (i = 0; i < ARRAY_SIZE(sc8180x_tiles); i++, res++) {
> +		const struct tile_info *info = &sc8180x_tile_info[i];

> +		res->start = mres->start + info->offset;
> +		res->end = mres->start + info->offset + info->size - 1;
> +		res->flags = mres->flags;
> +		res->name = sc8180x_tiles[i];
> +		/* Add new MEM to resource tree */
> +		insert_resource(mres->parent, res);
> +	}
> +
> +	/* Remove old MEM from resource tree */
> +	remove_resource(mres);
> +
> +	/* Free old resources and install new ones */
> +	ret = platform_device_add_resources(pdev, nres, nres_num);

> +	if (ret) {
> +		dev_err(&pdev->dev, "failed to add new resources: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;

if (ret)
	dev_err(...);
return ret;

?

> +}
> +
>  static int sc8180x_pinctrl_probe(struct platform_device *pdev)
>  {
> -	return msm_pinctrl_probe(pdev, &sc8180x_pinctrl);
> +	const struct msm_pinctrl_soc_data *soc_data;
> +	int ret;
> +
> +	soc_data = device_get_match_data(&pdev->dev);
> +	if (!soc_data)
> +		return -EINVAL;
> +
> +	ret = sc8180x_pinctrl_add_tile_resources(pdev);
> +	if (ret)
> +		return ret;
> +
> +	return msm_pinctrl_probe(pdev, soc_data);
>  }
>  
> +static const struct acpi_device_id sc8180x_pinctrl_acpi_match[] = {
> +	{
> +		.id = "QCOM040D",
> +		.driver_data = (kernel_ulong_t) &sc8180x_acpi_pinctrl,
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, sc8180x_pinctrl_acpi_match);
> +
>  static const struct of_device_id sc8180x_pinctrl_of_match[] = {
> -	{ .compatible = "qcom,sc8180x-tlmm", },
> +	{
> +		.compatible = "qcom,sc8180x-tlmm",
> +		.data = &sc8180x_pinctrl,
> +	},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, sc8180x_pinctrl_of_match);
> @@ -1603,6 +1721,7 @@ static struct platform_driver sc8180x_pinctrl_driver = {
>  	.driver = {
>  		.name = "sc8180x-pinctrl",
>  		.of_match_table = sc8180x_pinctrl_of_match,
> +		.acpi_match_table = sc8180x_pinctrl_acpi_match,
>  	},
>  	.probe = sc8180x_pinctrl_probe,
>  	.remove = msm_pinctrl_remove,
> -- 
> 2.17.1
> 

-- 
With Best Regards,
Andy Shevchenko


