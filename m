Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 74B7D7A642D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Sep 2023 15:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232263AbjISNAy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 19 Sep 2023 09:00:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjISNAx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 19 Sep 2023 09:00:53 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DC0EE3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Sep 2023 06:00:47 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="359325049"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="359325049"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:00:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="749471043"
X-IronPort-AV: E=Sophos;i="6.02,159,1688454000"; 
   d="scan'208";a="749471043"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 06:00:43 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.97-RC0)
        (envelope-from <andy@kernel.org>)
        id 1qiaLI-00000001Nr1-03SD;
        Tue, 19 Sep 2023 16:00:40 +0300
Date:   Tue, 19 Sep 2023 16:00:39 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc:     Gregory CLEMENT <gregory.clement@bootlin.com>,
        Arnd Bergmann <arnd@arndb.de>, soc@kernel.org, arm@kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 3/7] platform: cznic: turris-omnia-mcu: Add support
 for MCU connected GPIOs
Message-ID: <ZQmbd211FzPjA97r@smile.fi.intel.com>
References: <20230919103815.16818-1-kabel@kernel.org>
 <20230919103815.16818-4-kabel@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919103815.16818-4-kabel@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 19, 2023 at 12:38:11PM +0200, Marek Behún wrote:
> Add support for GPIOs connected to the MCU on the Turris Omnia board.
> 
> This include:

includes

> - front button pin
> - enable pins for USB regulators
> - MiniPCIe / mSATA card presence pins in MiniPCIe port 0
> - LED output pins from WAN ethernet PHY, LAN switch and MiniPCIe ports
> - on board revisions 32+ also various peripheral resets and another
>   voltage regulator enable pin

Can the main driver provide a regmap and all other use it?

...

> +Date:		August 2023
> +KernelVersion:	6.6

Same as per previous patch review.

...

> +	ret = omnia_mcu_register_gpiochip(mcu);
> +	if (ret)
> +		return ret;
> +
>  	return 0;

	return ..._gpiochip(...);

?

...

> +	switch (cmd) {
> +	case CMD_GENERAL_CONTROL:
> +		buf[1] = val;
> +		buf[2] = mask;
> +		len = 3;
> +		break;
> +
> +	case CMD_EXT_CONTROL:
> +		put_unaligned_le16(val, &buf[1]);
> +		put_unaligned_le16(mask, &buf[3]);
> +		len = 5;
> +		break;
> +
> +	default:
> +		unreachable();

You meant BUG_ON()?

> +	}

...

> +static int omnia_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct omnia_mcu *mcu = gpiochip_get_data(gc);
> +
> +	if (offset == OMNIA_GPIO_PHY_SFP_OFFSET) {
> +		int val;
> +
> +		mutex_lock(&mcu->lock);
> +		val = omnia_cmd_read_bit(mcu->client,
> +					 CMD_GET_EXT_CONTROL_STATUS,
> +					 EXT_CTL_PHY_SFP_AUTO);
> +		mutex_unlock(&mcu->lock);
> +
> +		if (val < 0)
> +			return val;
> +
> +		if (val)
> +			return GPIO_LINE_DIRECTION_IN;

> +		else

Redundant 'else'.

> +			return GPIO_LINE_DIRECTION_OUT;
> +	}
> +
> +	if (omnia_gpios[offset].ctl_cmd)
> +		return GPIO_LINE_DIRECTION_OUT;

> +	else

Ditto.

> +		return GPIO_LINE_DIRECTION_IN;
> +}

...

> +	if (offset == OMNIA_GPIO_PHY_SFP_OFFSET)
> +		return omnia_ctl_cmd(mcu, CMD_EXT_CONTROL, EXT_CTL_PHY_SFP_AUTO,
> +				     EXT_CTL_PHY_SFP_AUTO);
> +
> +	if (gpio->ctl_cmd)
> +		return -EOPNOTSUPP;

I believe internally we use ENOTSUPP.
Ditto for all cases like this.

...

> +	uint16_t val, mask;

So, why uintXX_t out of a sudden?

...

> +	if (gpio->ctl_cmd)
> +		return omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
> +	else

Redundant 'else'.

> +		return -EOPNOTSUPP;
> +}

...

> +static void omnia_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
> +{
> +	const struct omnia_gpio *gpio = &omnia_gpios[offset];
> +	struct omnia_mcu *mcu = gpiochip_get_data(gc);
> +	u16 val, mask;

> +	int err = 0;

Redundant assignment.

> +	if (!gpio->ctl_cmd)
> +		return;
> +
> +	mask = gpio->ctl_bit;
> +	val = value ? mask : 0;
> +
> +	err = omnia_ctl_cmd(mcu, gpio->ctl_cmd, val, mask);
> +	if (err)
> +		dev_err(&mcu->client->dev, "Cannot set GPIO %u: %d\n",
> +			offset, err);
> +}

...

> +	mutex_lock(&mcu->lock);
> +
> +	if (ctl_mask)
> +		err = omnia_ctl_cmd_unlocked(mcu, CMD_GENERAL_CONTROL, ctl,
> +					     ctl_mask);

> +	if (!err && ext_ctl_mask)
> +		err = omnia_ctl_cmd_unlocked(mcu, CMD_EXT_CONTROL, ext_ctl,
> +					     ext_ctl_mask);

Can it be

	if (err)
		goto out_unlock;

	if (_mask)
		...

?

> +	mutex_unlock(&mcu->lock);

> +	if (err)
> +		dev_err(&mcu->client->dev, "Cannot set GPIOs: %d\n", err);

How is useful this one?

...

> +static bool omnia_gpio_available(struct omnia_mcu *mcu,
> +				 const struct omnia_gpio *gpio)
> +{
> +	if (gpio->feat_mask)
> +		return (mcu->features & gpio->feat_mask) == gpio->feat;
> +	else if (gpio->feat)
> +		return mcu->features & gpio->feat;
> +	else

Redundant 'else':s.

> +		return true;
> +}

...

> +static int omnia_gpio_init_valid_mask(struct gpio_chip *gc,
> +				      unsigned long *valid_mask,
> +				      unsigned int ngpios)
> +{
> +	struct omnia_mcu *mcu = gpiochip_get_data(gc);

> +	bitmap_zero(valid_mask, ngpios);

No need.

Also do you have bitops.h included?

> +	for (int i = 0; i < ngpios; ++i) {
> +		const struct omnia_gpio *gpio = &omnia_gpios[i];
> +
> +		if (!gpio->cmd && !gpio->int_bit)
> +			continue;

Use clear_bit() here...

> +		if (omnia_gpio_available(mcu, gpio))
> +			set_bit(i, valid_mask);

...and assign_bit() here.

> +	}
> +
> +	return 0;
> +}

...

> +	dev_dbg(&mcu->client->dev,
> +		"set int mask %02x %02x %02x %02x %02x %02x %02x %02x\n",
> +		cmd[1], cmd[2], cmd[3], cmd[4], cmd[5], cmd[6], cmd[7], cmd[8]);

%8ph

...

> +	/*
> +	 * Remember which GPIOs have both rising and falling interrupts enabled.
> +	 * For those we will cache their value so that .get() method is faster.
> +	 * We also need to forget cached values of GPIOs that aren't cached
> +	 * anymore.
> +	 */
> +	if (!err) {

	if (err)
		goto out_unlock;

> +		mcu->both = rising & falling;
> +		mcu->is_cached &= mcu->both;
> +	}
> +
> +	mutex_unlock(&mcu->lock);

...

> +static void omnia_irq_init_valid_mask(struct gpio_chip *gc,
> +				      unsigned long *valid_mask,
> +				      unsigned int ngpios)
> +{
> +	struct omnia_mcu *mcu = gpiochip_get_data(gc);

> +	bitmap_zero(valid_mask, ngpios);

No need (see above how).

> +	for (int i = 0; i < ngpios; ++i) {
> +		const struct omnia_gpio *gpio = &omnia_gpios[i];
> +
> +		if (!gpio->int_bit)
> +			continue;
> +
> +		if (omnia_gpio_available(mcu, gpio))
> +			set_bit(i, valid_mask);
> +	}
> +}

...

> +	u8 cmd[9] = {};

Magic number in a few places. Please, use self-explanatory pre-defined constant
instead.

...


> +		dev_err(&mcu->client->dev, "Cannot read pending IRQs: %d\n",
> +			err);

In all functions with help of

	struct device *dev = &mcu->client->dev;

you can make code shorter.

...

> +	rising = reply[0] | (reply[2] << 8) | (reply[4] << 16) |
> +		 (reply[6] << 24);
> +	falling = reply[1] | (reply[3] << 8) | (reply[5] << 16) |
> +		  (reply[7] << 24);

With a help of two masks, you can access to the both edges as to 64-bit value
and simplify the code.

...

> +	int ret = omnia_cmd_read_u16(mcu->client, CMD_GET_STATUS_WORD);

Please, split this for better maintenance.

> +	if (ret < 0)
> +		return ret;

...

> +static irqreturn_t omnia_irq_thread_handler(int irq, void *dev_id)
> +{
> +	struct omnia_mcu *mcu = dev_id;
> +	irqreturn_t res = IRQ_NONE;
> +	unsigned long pending;
> +	int i;
> +
> +	if (!omnia_irq_read_pending(mcu, &pending))
> +		return IRQ_NONE;
> +
> +	for_each_set_bit(i, &pending, 32) {
> +		unsigned int nested_irq =
> +			irq_find_mapping(mcu->gc.irq.domain,
> +					 omnia_int_to_gpio_idx[i]);

It's much better to read in a form

		unsigned int nested_irq;
		domain = ...

		nested_irq = irq_find_mapping(domain, omnia_int_to_gpio_idx[i]);

(exactly 80 characters, btw).

> +		handle_nested_irq(nested_irq);

> +		res = IRQ_HANDLED;

No need.

> +	}

> +	return res;

	return IRQ_RETVAL(pending);

> +}

...

> +static ssize_t front_button_mode_show(struct device *dev,
> +				      struct device_attribute *a, char *buf)
> +{
> +	struct omnia_mcu *mcu = i2c_get_clientdata(to_i2c_client(dev));
> +	int val;
> +
> +	if (mcu->features & FEAT_NEW_INT_API)
> +		val = omnia_cmd_read_bit(mcu->client, CMD_GET_STATUS_WORD,
> +					 STS_BUTTON_MODE);
> +	else
> +		val = !!(mcu->last_status & STS_BUTTON_MODE);

> +	if (val < 0)

Can be true only in one case, why to check for the second oner?/

> +		return val;

> +	return sysfs_emit(buf, "%s\n", val ? "cpu" : "mcu");

With a static const array of string literals...

> +}

...

> +	if (sysfs_streq(buf, "mcu"))
> +		val = 0;
> +	else if (sysfs_streq(buf, "cpu"))
> +		val = mask;
> +	else
> +		return -EINVAL;

...and help of sysfs_match_string() you can simplify the code.

...

> +static struct attribute *omnia_mcu_gpio_attrs[] = {
> +	&dev_attr_front_button_mode.attr,
> +	NULL,
> +};
> +
> +static const struct attribute_group omnia_mcu_gpio_group = {
> +	.attrs = omnia_mcu_gpio_attrs,
> +};

ATTRIBUTE_GROUPS() ?

...

> +	err = devm_gpiochip_add_data(dev, &mcu->gc, mcu);
> +	if (err) {
> +		dev_err(dev, "Cannot add GPIO chip: %d\n", err);
> +		return err;

		return dev_err_probe(...);

Ditto for other places like this in the probe stage.

> +	}

...

> +	err = devm_device_add_group(dev, &omnia_mcu_gpio_group);

No way, no-one should use the API scheduled for removal.
What's wrong with .dev_groups ?

...

> +void omnia_mcu_unregister_gpiochip(struct omnia_mcu *mcu)
> +{
> +	if (!(mcu->features & FEAT_NEW_INT_API))
> +		cancel_delayed_work_sync(&mcu->button_release_emul_work);
> +
> +	mutex_destroy(&mcu->lock);

Wrong order?

> +}

...

>  struct omnia_mcu {
>  	struct i2c_client *client;
>  	const char *type;
>  	u16 features;
> +
> +	/* GPIO chip */
> +	struct gpio_chip gc;

Making this a first member may lead to the better code. Check with bloat-o-meter.

> +	struct mutex lock;
> +	u32 mask, rising, falling, both, cached, is_cached;

> +	/* Old MCU firmware handling needs the following */
> +	u16 last_status;
> +	struct delayed_work button_release_emul_work;

Swapping these two may free a few bytes. Check with pahole tool.

> +	bool button_pressed_emul;
>  };

...

> +	if (!bits) {
> +		*reply = 0;
> +		return 0;
> +	}
> +
> +	ret = omnia_cmd_read(client, cmd, reply, (ilog2(bits) >> 3) + 1);

> +

Redundant blank line.

> +	if (ret >= 0)

> +		*reply = le32_to_cpu(*reply) & bits;

Huh?! Please, check your code with sparse like

	make W=1 C=1 CF=-D__CHECK_ENDIAN__ ...

> +	return ret < 0 ? ret : 0;

-- 
With Best Regards,
Andy Shevchenko


