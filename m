Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 434241207B2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Dec 2019 14:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727894AbfLPN4d (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Dec 2019 08:56:33 -0500
Received: from mga17.intel.com ([192.55.52.151]:19359 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727609AbfLPN4d (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Dec 2019 08:56:33 -0500
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Dec 2019 05:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,321,1571727600"; 
   d="scan'208";a="227118511"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
  by orsmga002.jf.intel.com with SMTP; 16 Dec 2019 05:56:28 -0800
Received: by stinkbox (sSMTP sendmail emulation); Mon, 16 Dec 2019 15:56:27 +0200
Date:   Mon, 16 Dec 2019 15:56:27 +0200
From:   Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 4/5] drm/i915/dsi: Move Crystal Cove PMIC panel GPIO
 lookup from mfd to the i915 driver
Message-ID: <20191216135627.GS1208@intel.com>
References: <20191215163810.52356-1-hdegoede@redhat.com>
 <20191215163810.52356-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191215163810.52356-5-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Dec 15, 2019 at 05:38:09PM +0100, Hans de Goede wrote:
> Move the Crystal Cove PMIC panel GPIO lookup-table from
> drivers/mfd/intel_soc_pmic_core.c to the i915 driver.
> 
> The moved looked-up table is adding a GPIO lookup to the i915 PCI
> device and the GPIO subsys allows only one lookup table per device,
> 
> The intel_soc_pmic_core.c code only adds lookup-table entries for the
> PMIC panel GPIO (as it deals only with the PMIC), but we also need to be
> able to access some GPIOs on the SoC itself, which requires entries for
> these GPIOs in the lookup-table.
> 
> Since the lookup-table is attached to the i915 PCI device it really
> should be part of the i915 driver, this will also allow us to extend
> it with GPIOs from other sources when necessary.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 23 +++++++++++++++++++-
>  drivers/mfd/intel_soc_pmic_core.c            | 19 ----------------
>  2 files changed, 22 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> index 027970348b22..847f04eec2a1 100644
> --- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> +++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
> @@ -25,6 +25,7 @@
>   */
>  
>  #include <linux/gpio/consumer.h>
> +#include <linux/gpio/machine.h>
>  #include <linux/mfd/intel_soc_pmic.h>
>  #include <linux/slab.h>
>  
> @@ -686,8 +687,18 @@ bool intel_dsi_vbt_init(struct intel_dsi *intel_dsi, u16 panel_id)
>  
>  /*
>   * On some BYT/CHT devs some sequences are incomplete and we need to manually
> - * control some GPIOs.
> + * control some GPIOs. We need to add a GPIO lookup table before we get these.
>   */
> +static struct gpiod_lookup_table pmic_panel_gpio_table = {
> +	/* Intel GFX is consumer */
> +	.dev_id = "0000:00:02.0",
> +	.table = {
> +		/* Panel EN/DISABLE */
> +		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
> +		{ },
> +	},
> +};

Feels like a failure in abstraction to have these irrelevant details
exposed on the consumer side. Also slightly concerned that someone
refactoring things in the pmic driver could now break this without
realizing it. But if people want it done this way I can live with it.

> +
>  void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>  {
>  	struct drm_device *dev = intel_dsi->base.base.dev;
> @@ -697,6 +708,8 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>  
>  	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
>  	    (mipi_config->pwm_blc == PPS_BLC_PMIC)) {
> +		gpiod_add_lookup_table(&pmic_panel_gpio_table);
> +
>  		intel_dsi->gpio_panel = gpiod_get(dev->dev, "panel", flags);
>  		if (IS_ERR(intel_dsi->gpio_panel)) {
>  			DRM_ERROR("Failed to own gpio for panel control\n");
> @@ -707,8 +720,16 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
>  
>  void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
>  {
> +	struct drm_device *dev = intel_dsi->base.base.dev;
> +	struct drm_i915_private *dev_priv = to_i915(dev);
> +	struct mipi_config *mipi_config = dev_priv->vbt.dsi.config;
> +
>  	if (intel_dsi->gpio_panel) {
>  		gpiod_put(intel_dsi->gpio_panel);
>  		intel_dsi->gpio_panel = NULL;
>  	}
> +
> +	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
> +	    (mipi_config->pwm_blc == PPS_BLC_PMIC))

Needless parens here as well.

Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

> +		gpiod_remove_lookup_table(&pmic_panel_gpio_table);
>  }
> diff --git a/drivers/mfd/intel_soc_pmic_core.c b/drivers/mfd/intel_soc_pmic_core.c
> index 47188df3080d..ddd64f9e3341 100644
> --- a/drivers/mfd/intel_soc_pmic_core.c
> +++ b/drivers/mfd/intel_soc_pmic_core.c
> @@ -9,8 +9,6 @@
>   */
>  
>  #include <linux/acpi.h>
> -#include <linux/gpio/consumer.h>
> -#include <linux/gpio/machine.h>
>  #include <linux/i2c.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> @@ -25,17 +23,6 @@
>  #define BYT_CRC_HRV		2
>  #define CHT_CRC_HRV		3
>  
> -/* Lookup table for the Panel Enable/Disable line as GPIO signals */
> -static struct gpiod_lookup_table panel_gpio_table = {
> -	/* Intel GFX is consumer */
> -	.dev_id = "0000:00:02.0",
> -	.table = {
> -		/* Panel EN/DISABLE */
> -		GPIO_LOOKUP("gpio_crystalcove", 94, "panel", GPIO_ACTIVE_HIGH),
> -		{ },
> -	},
> -};
> -
>  /* PWM consumed by the Intel GFX */
>  static struct pwm_lookup crc_pwm_lookup[] = {
>  	PWM_LOOKUP("crystal_cove_pwm", 0, "0000:00:02.0", "pwm_pmic_backlight", 0, PWM_POLARITY_NORMAL),
> @@ -96,9 +83,6 @@ static int intel_soc_pmic_i2c_probe(struct i2c_client *i2c,
>  	if (ret)
>  		dev_warn(dev, "Can't enable IRQ as wake source: %d\n", ret);
>  
> -	/* Add lookup table binding for Panel Control to the GPIO Chip */
> -	gpiod_add_lookup_table(&panel_gpio_table);
> -
>  	/* Add lookup table for crc-pwm */
>  	pwm_add_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>  
> @@ -121,9 +105,6 @@ static int intel_soc_pmic_i2c_remove(struct i2c_client *i2c)
>  
>  	regmap_del_irq_chip(pmic->irq, pmic->irq_chip_data);
>  
> -	/* Remove lookup table for Panel Control from the GPIO Chip */
> -	gpiod_remove_lookup_table(&panel_gpio_table);
> -
>  	/* remove crc-pwm lookup table */
>  	pwm_remove_table(crc_pwm_lookup, ARRAY_SIZE(crc_pwm_lookup));
>  
> -- 
> 2.23.0

-- 
Ville Syrjälä
Intel
