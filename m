Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C60494C1621
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Feb 2022 16:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231524AbiBWPGR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Feb 2022 10:06:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234267AbiBWPGQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Feb 2022 10:06:16 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E18F1B82D2;
        Wed, 23 Feb 2022 07:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645628748; x=1677164748;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fLDTLuoWv6Lag5J7OIw8bqVQoUVsVRsFIo3yaj8AlzI=;
  b=J7V11GWqri+bCCQCAmSvzdEytniyJBG3902xj3DrutivlWET4mL08Goq
   A1+V3Z2JymW9pWPoZy/Bfb/vhWl/VdiDwpioYyu65FesI4ji9dTLkgWeQ
   xd9NKvR2SknBqE8fyRPcSDSAv22v2ExmV0hbxipYTgphE9g71LDWolPj5
   ejPVDszbKIEibUwrAWxIfzCecmynInkexGzmV/W2dMJTw09YSglIxoIPB
   qEA5uP1tc7OvQPDd8ITRn16GdY5jf5fkJsORiuLJBKifnYmBYy0zcyokm
   PpTr4PhiuGIT1/yL0d/P94NJHj4Pt7Vv9pgk4CGJm6UyPOGGcUT5wBDMM
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="252175447"
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="252175447"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:05:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,391,1635231600"; 
   d="scan'208";a="532717219"
Received: from smile.fi.intel.com ([10.237.72.59])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2022 07:05:46 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1nMtCJ-007T66-Fl;
        Wed, 23 Feb 2022 17:04:55 +0200
Date:   Wed, 23 Feb 2022 17:04:55 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 3/5] platform/x86: x86-android-tablets: Add Lenovo Yoga
 Tablet 2 830 / 1050 data
Message-ID: <YhZNFzwMrWAhEFPK@smile.fi.intel.com>
References: <20220223133153.730337-1-hdegoede@redhat.com>
 <20220223133153.730337-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220223133153.730337-4-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 23, 2022 at 02:31:51PM +0100, Hans de Goede wrote:
> The Lenovo Yoga Tablet 2 series comes in 4 versions: 830F, 830L, 1050F and
> 1050L. The F postfix indicates a wifi only version and the L postfix
> indicates a LTE version. The 830 models are 8" and the 1050 models are 10".
> 
> Despite there being 8" and 10" versions all models use the same mainboard,
> with an identical BIOS and thus identical DMI strings, so support for all
> 4 models is added through a single DMI table entry.
> 
> As all devices dealt with in the x86-android-tablets modules, these are
> x86 ACPI tablets which ships with Android x86 as factory OS.
> The mainboard's DSDT contain a bunch of I2C devices which are not actually
> there, causing various resource conflicts. Enumeration of these is skipped
> through the acpi_quirk_skip_i2c_client_enumeration().
> 
> Add support for manually instantiating the I2C devices which are
> actually present on this tablet by adding the necessary device info to
> the x86-android-tablets module.
> 
> This has been tested on a 830F and a 1050L tablet.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/x86-android-tablets.c | 184 +++++++++++++++++++++
>  1 file changed, 184 insertions(+)
> 
> diff --git a/drivers/platform/x86/x86-android-tablets.c b/drivers/platform/x86/x86-android-tablets.c
> index 61e526e048c3..89972723f546 100644
> --- a/drivers/platform/x86/x86-android-tablets.c
> +++ b/drivers/platform/x86/x86-android-tablets.c
> @@ -22,8 +22,10 @@
>  #include <linux/irqdomain.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
> +#include <linux/platform_data/lp855x.h>
>  #include <linux/platform_device.h>
>  #include <linux/power/bq24190_charger.h>
> +#include <linux/rmi.h>
>  #include <linux/serdev.h>
>  #include <linux/string.h>
>  /* For gpio_get_desc() which is EXPORT_SYMBOL_GPL() */
> @@ -182,6 +184,15 @@ static const char * const tusb1211_chg_det_psy[] = { "tusb1211-charger-detect" }
>  static const char * const bq24190_psy[] = { "bq24190-charger" };
>  static const char * const bq25890_psy[] = { "bq25890-charger" };
>  
> +static const struct property_entry fg_bq24190_supply_props[] = {
> +	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq24190_psy),
> +	{ }
> +};
> +
> +static const struct software_node fg_bq24190_supply_node = {
> +	.properties = fg_bq24190_supply_props,
> +};
> +
>  static const struct property_entry fg_bq25890_supply_props[] = {
>  	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", bq25890_psy),
>  	{ }
> @@ -704,6 +715,165 @@ static const struct x86_dev_info lenovo_yogabook_x9x_info __initconst = {
>  	.i2c_client_count = ARRAY_SIZE(lenovo_yogabook_x9x_i2c_clients),
>  };
>  
> +/* Lenovo Yoga Tablet 2 1050F/L's Android factory img has everything hardcoded */
> +static const struct property_entry lenovo_yoga_tab2_830_1050_bq24190_props[] = {
> +	PROPERTY_ENTRY_STRING_ARRAY("supplied-from", tusb1211_chg_det_psy),
> +	PROPERTY_ENTRY_REF("monitored-battery", &generic_lipo_hv_4v35_battery_node),
> +	PROPERTY_ENTRY_BOOL("omit-battery-class"),
> +	PROPERTY_ENTRY_BOOL("disable-reset"),
> +	{ }
> +};
> +
> +static const struct software_node lenovo_yoga_tab2_830_1050_bq24190_node = {
> +	.properties = lenovo_yoga_tab2_830_1050_bq24190_props,
> +};
> +
> +/* This gets filled by lenovo_yoga_tab2_830_1050_init() */
> +static struct rmi_device_platform_data lenovo_yoga_tab2_830_1050_rmi_pdata = { };
> +
> +static struct lp855x_platform_data lenovo_yoga_tab2_830_1050_lp8557_pdata = {
> +	.device_control = 0x86,
> +	.initial_brightness = 128,
> +};
> +
> +static const struct x86_i2c_client_info lenovo_yoga_tab2_830_1050_i2c_clients[] __initconst = {
> +	{
> +		/* bq24292i battery charger */
> +		.board_info = {
> +			.type = "bq24190",
> +			.addr = 0x6b,
> +			.dev_name = "bq24292i",
> +			.swnode = &lenovo_yoga_tab2_830_1050_bq24190_node,
> +			.platform_data = &bq24190_pdata,
> +		},
> +		.adapter_path = "\\_SB_.I2C1",
> +		.irq_data = {
> +			.type = X86_ACPI_IRQ_TYPE_GPIOINT,
> +			.chip = "INT33FC:02",
> +			.index = 2,
> +			.trigger = ACPI_EDGE_SENSITIVE,
> +			.polarity = ACPI_ACTIVE_HIGH,
> +		},
> +	}, {
> +		/* BQ27541 fuel-gauge */
> +		.board_info = {
> +			.type = "bq27541",
> +			.addr = 0x55,
> +			.dev_name = "bq27541",
> +			.swnode = &fg_bq24190_supply_node,
> +		},
> +		.adapter_path = "\\_SB_.I2C1",
> +	}, {
> +		/* Synaptics RMI touchscreen */
> +		.board_info = {
> +			.type = "rmi4_i2c",
> +			.addr = 0x38,
> +			.dev_name = "rmi4_i2c",
> +			.platform_data = &lenovo_yoga_tab2_830_1050_rmi_pdata,
> +		},
> +		.adapter_path = "\\_SB_.I2C6",
> +		.irq_data = {
> +			.type = X86_ACPI_IRQ_TYPE_APIC,
> +			.index = 0x45,
> +			.trigger = ACPI_EDGE_SENSITIVE,
> +			.polarity = ACPI_ACTIVE_HIGH,
> +		},
> +	}, {
> +		/* LP8557 Backlight controller */
> +		.board_info = {
> +			.type = "lp8557",
> +			.addr = 0x2c,
> +			.dev_name = "lp8557",
> +			.platform_data = &lenovo_yoga_tab2_830_1050_lp8557_pdata,
> +		},
> +		.adapter_path = "\\_SB_.I2C3",
> +	},
> +};
> +
> +static struct gpiod_lookup_table lenovo_yoga_tab2_830_1050_int3496_gpios = {
> +	.dev_id = "intel-int3496",
> +	.table = {
> +		GPIO_LOOKUP("INT33FC:02", 1, "mux", GPIO_ACTIVE_LOW),
> +		GPIO_LOOKUP("INT33FC:02", 24, "id", GPIO_ACTIVE_HIGH),
> +		{ }
> +	},
> +};
> +
> +static struct gpiod_lookup_table * const lenovo_yoga_tab2_830_1050_gpios[] = {
> +	&lenovo_yoga_tab2_830_1050_int3496_gpios,
> +	NULL
> +};
> +
> +static int __init lenovo_yoga_tab2_830_1050_init(void);
> +static void lenovo_yoga_tab2_830_1050_exit(void);
> +
> +static struct x86_dev_info lenovo_yoga_tab2_830_1050_info __initdata = {
> +	.i2c_client_info = lenovo_yoga_tab2_830_1050_i2c_clients,
> +	/* i2c_client_count gets set by lenovo_yoga_tab2_830_1050_init() */
> +	.pdev_info = int3496_pdevs,
> +	.pdev_count = ARRAY_SIZE(int3496_pdevs),
> +	.gpiod_lookup_tables = lenovo_yoga_tab2_830_1050_gpios,
> +	.bat_swnode = &generic_lipo_hv_4v35_battery_node,
> +	.modules = bq24190_modules,
> +	.invalid_aei_gpiochip = "INT33FC:02",
> +	.init = lenovo_yoga_tab2_830_1050_init,
> +};
> +
> +/*
> + * The Lenovo Yoga Tablet 2 830 and 1050 (8" vs 10") versions use the same
> + * mainboard, but they need some different treatment related to the display:
> + * 1. The 830 uses a portrait LCD panel with a landscape touchscreen, requiring
> + *    the touchscreen driver to adjust the touch-coords to match the LCD.
> + * 2. Both use an TI LP8557 LED backlight controller. On the 1050 the LP8557's
> + *    PWM input is connected to the PMIC's PWM output and everything works fine
> + *    with the defaults programmed into the LP8557 by the BIOS.
> + *    But on the 830 the LP8557's PWM input is connected to a PWM output coming
> + *    from the LCD panel's controller. The Android code has a hack in the i915
> + *    driver to write the non-standard DSI reg 0x9f with the desired backlight
> + *    level to set the duty-cycle of the LCD's PWM output.
> + *
> + *    To avoid having to have a similar hack in the mainline kernel the LP8557
> + *    entry in lenovo_yoga_tab2_830_1050_i2c_clients instead just programs the
> + *    LP8557 to directly set the level, ignoring the PWM input. This means that
> + *    the LP8557 i2c_client should only be instantiated on the 830.
> + */
> +static int __init lenovo_yoga_tab2_830_1050_init_display(void)
> +{
> +	struct gpio_desc *gpiod;
> +	int ret;
> +
> +	/* Use PMIC GPIO 10 bootstrap pin to differentiate 830 vs 1050 */
> +	ret = x86_android_tablet_get_gpiod("gpio_crystalcove", 10, &gpiod);
> +	if (ret)
> +		return ret;
> +
> +	ret = gpiod_get_value_cansleep(gpiod);
> +	if (ret) {
> +		pr_info("detected Lenovo Yoga Tablet 2 1050F/L\n");
> +		lenovo_yoga_tab2_830_1050_info.i2c_client_count =
> +			ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients) - 1;
> +	} else {
> +		pr_info("detected Lenovo Yoga Tablet 2 830F/L\n");
> +		lenovo_yoga_tab2_830_1050_rmi_pdata.sensor_pdata.axis_align.swap_axes = true;
> +		lenovo_yoga_tab2_830_1050_rmi_pdata.sensor_pdata.axis_align.flip_y = true;
> +		lenovo_yoga_tab2_830_1050_info.i2c_client_count =
> +			ARRAY_SIZE(lenovo_yoga_tab2_830_1050_i2c_clients);
> +	}
> +
> +	return 0;
> +}
> +
> +static int __init lenovo_yoga_tab2_830_1050_init(void)
> +{
> +	int ret;
> +
> +	ret = lenovo_yoga_tab2_830_1050_init_display();
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
>  /* Nextbook Ares 8 tablets have an Android factory img with everything hardcoded */
>  static const char * const nextbook_ares8_accel_mount_matrix[] = {
>  	"0", "-1", "0",
> @@ -948,6 +1118,20 @@ static const struct dmi_system_id x86_android_tablet_ids[] __initconst = {
>  		},
>  		.driver_data = (void *)&lenovo_yogabook_x9x_info,
>  	},
> +	{
> +		/*
> +		 * Lenovo Yoga Tablet 2 830F/L or 1050F/L (The 8" and 10"
> +		 * Lenovo Yoga Tablet 2 use the same mainboard)
> +		 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Intel Corp."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "VALLEYVIEW C0 PLATFORM"),
> +			DMI_MATCH(DMI_BOARD_NAME, "BYT-T FFD8"),
> +			/* Partial match on beginning of BIOS version */
> +			DMI_MATCH(DMI_BIOS_VERSION, "BLADE_21"),
> +		},
> +		.driver_data = (void *)&lenovo_yoga_tab2_830_1050_info,
> +	},
>  	{
>  		/* Nextbook Ares 8 */
>  		.matches = {
> -- 
> 2.35.1
> 

-- 
With Best Regards,
Andy Shevchenko


