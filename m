Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13F347D409A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Oct 2023 22:04:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229447AbjJWUEQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Oct 2023 16:04:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjJWUEP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Oct 2023 16:04:15 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD1EF9
        for <linux-gpio@vger.kernel.org>; Mon, 23 Oct 2023 13:04:13 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="366263271"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="366263271"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="848879893"
X-IronPort-AV: E=Sophos;i="6.03,246,1694761200"; 
   d="scan'208";a="848879893"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2023 13:04:10 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC2)
        (envelope-from <andy@kernel.org>)
        id 1qv19k-000000081jQ-0Sy7;
        Mon, 23 Oct 2023 23:04:08 +0300
Date:   Mon, 23 Oct 2023 23:04:07 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <ZTbRtwTsmAjp3QG0@smile.fi.intel.com>
References: <20231023143130.11602-1-kabel@kernel.org>
 <20231023143130.11602-4-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231023143130.11602-4-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 23, 2023 at 04:31:26PM +0200, Marek Behún wrote:
> Add support for GPIOs connected to the MCU on the Turris Omnia board.
> 
> This includes:
> - front button pin
> - enable pins for USB regulators
> - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> - on board revisions 32+ also various peripheral resets and another
>   voltage regulator enable pin

...

> +static bool omnia_gpio_available(struct omnia_mcu *mcu,
> +				 const struct omnia_gpio *gpio)
> +{
> +	if (gpio->feat_mask)
> +		return (mcu->features & gpio->feat_mask) == gpio->feat;
> +	else if (gpio->feat)

Redundant 'else'.

> +		return mcu->features & gpio->feat;
> +
> +	return true;
> +}

...

> +static int omnia_gpio_init_valid_mask(struct gpio_chip *gc,
> +				      unsigned long *valid_mask,
> +				      unsigned int ngpios)
> +{
> +	struct omnia_mcu *mcu = gpiochip_get_data(gc);
> +
> +	for (unsigned int i = 0; i < ngpios; i++) {
> +		const struct omnia_gpio *gpio = &omnia_gpios[i];

> +		if (!gpio->cmd && !gpio->int_bit) {
> +			__clear_bit(i, valid_mask);
> +			continue;
> +		}
> +
> +		__assign_bit(i, valid_mask, omnia_gpio_available(mcu, gpio));

Hmm... Why not simply

		if (...)
			__clear_bit();
		else
			__assign_bit(...);

?

> +	}
> +
> +	return 0;
> +}

...

> +static void omnia_irq_bus_lock(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct omnia_mcu *mcu = gpiochip_get_data(gc);
> +
> +	/* nothing to do if MCU firmware does not support new interrupt API */
> +	if (!(mcu->features & FEAT_NEW_INT_API))
> +		return;
> +
> +	mutex_lock(&mcu->lock);

I'm wondering if sparse complains on unbalanced locking. If so,
the function needs an annotation.

> +}

...

> +static void omnia_irq_bus_sync_unlock(struct irq_data *d)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
> +	struct omnia_mcu *mcu = gpiochip_get_data(gc);
> +	struct device *dev = &mcu->client->dev;
> +	u8 cmd[1 + CMD_INT_ARG_LEN];
> +	u32 rising, falling;
> +	int err;
> +
> +	/* nothing to do if MCU firmware does not support new interrupt API */
> +	if (!(mcu->features & FEAT_NEW_INT_API))
> +		return;
> +
> +	cmd[0] = CMD_SET_INT_MASK;
> +
> +	rising = mcu->rising & mcu->mask;
> +	falling = mcu->falling & mcu->mask;
> +
> +	/* interleave the rising and falling bytes into the command arguments */
> +	omnia_mask_interleave(&cmd[1], rising, falling);
> +
> +	dev_dbg(dev, "set int mask %8ph\n", &cmd[1]);
> +
> +	err = omnia_cmd_write(mcu->client, cmd, sizeof(cmd));
> +	if (err) {
> +		dev_err(dev, "Cannot set mask: %d\n", err);
> +		goto unlock;
> +	}
> +
> +	/*
> +	 * Remember which GPIOs have both rising and falling interrupts enabled.
> +	 * For those we will cache their value so that .get() method is faster.
> +	 * We also need to forget cached values of GPIOs that aren't cached
> +	 * anymore.
> +	 */
> +	mcu->both = rising & falling;
> +	mcu->is_cached &= mcu->both;
> +
> +unlock:
> +	mutex_unlock(&mcu->lock);
> +}

Same question as above.

...

> +static void omnia_irq_init_valid_mask(struct gpio_chip *gc,
> +				      unsigned long *valid_mask,
> +				      unsigned int ngpios)
> +{
> +	struct omnia_mcu *mcu = gpiochip_get_data(gc);
> +
> +	for (unsigned int i = 0; i < ngpios; i++) {
> +		const struct omnia_gpio *gpio = &omnia_gpios[i];
> +
> +		if (!gpio->int_bit) {
> +			__clear_bit(i, valid_mask);
> +			continue;
> +		}
> +
> +		__assign_bit(i, valid_mask, omnia_gpio_available(mcu, gpio));

if-else ?

> +	}
> +}

...

> +static void omnia_mcu_mutex_destroy(void *data)
> +{
> +	struct mutex *lock = data;
> +
> +	mutex_destroy(lock);
> +}

Can be shrunk to oneliner:

static void omnia_mcu_mutex_destroy(void *lock)
{
	mutex_destroy(lock);
}

...

> +		/*
> +		 * The button_release_emul_work has to be initialized before the
> +		 * thread is requested, and on driver remove it needs to be
> +		 * canceled before the thread is freed. Therefore we can't use
> +		 * devm_delayed_work_autocancel() directly, because the order
> +		 *   devm_delayed_work_autocancel();
> +		 *   devm_request_threaded_irq();
> +		 * would cause improper release order:
> +		 *   free_irq();
> +		 *   cancel_delayed_work_sync();
> +		 * Instead we first initialize the work above, and only now
> +		 * after IRQ is requested we add the work devm action.
> +		 */

...

> +/* Returns 0 on success */
> +static inline int omnia_cmd_read_bits(const struct i2c_client *client, u8 cmd,
> +				      u32 bits, u32 *dst)
> +{
> +	__le32 reply;
> +	int err;
> +
> +	if (!bits) {
> +		*dst = 0;
> +		return 0;
> +	}

> +	err = omnia_cmd_read(client, cmd, &reply, (__fls(bits) >> 3) + 1);
> +	if (!err)
> +		*dst = le32_to_cpu(reply) & bits;
> +
> +	return err;

Why not be in align with the below, i.e.

	if (err)
		return err;
	...
	return 0;

?

> +}
> +
> +static inline int omnia_cmd_read_bit(const struct i2c_client *client, u8 cmd,
> +				     u32 bit)
> +{
> +	u32 reply;
> +	int err;
> +
> +	err = omnia_cmd_read_bits(client, cmd, bit, &reply);
> +	if (err)
> +		return err;
> +
> +	return !!reply;
> +}

...

>  static inline int omnia_cmd_read_u16(const struct i2c_client *client, u8 cmd)
>  {
> -	u16 reply;
> +	__le16 reply;
>  	int err;

Shouldn't this be a part of another patch?

>  }

-- 
With Best Regards,
Andy Shevchenko


