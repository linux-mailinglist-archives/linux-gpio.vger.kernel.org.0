Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 861B638AF5D
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 14:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243550AbhETNAI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 09:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243254AbhETM5c (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 08:57:32 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 748D2C0612AC;
        Thu, 20 May 2021 05:22:21 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 714FC2224A;
        Thu, 20 May 2021 14:22:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1621513339;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mIfVSkJEirj47E9KJ0wuZ5dlcFpXTDZau4I97gIiTbE=;
        b=s7yLCURY52qU1bLR4OljUp6wUU43vm13SVrHHidtRyEx2J/F8qWbmNVf1NEEPjtWtWIBWF
        DqWjpxm/JkDXUScEQBDpqCDUCBgdf94IQ0N+gdMLfl+rqmLVbwZwiZYHW7ZzNfNguA2sGy
        JEdIiB9jXXTTYwEthCKsVCjTUD5LJ8s=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 20 May 2021 14:22:19 +0200
From:   Michael Walle <michael@walle.cc>
To:     matti.vaittinen@fi.rohmeurope.com
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: Re: [PATCH 1/2] gpio: regmap: Support few IC specific operations
In-Reply-To: <c6acc28e87d43973561a66bdb4d78905882f2940.camel@fi.rohmeurope.com>
References: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
 <7d6f71e0a79e6ccd2a9f69be189993a9@walle.cc>
 <c6acc28e87d43973561a66bdb4d78905882f2940.camel@fi.rohmeurope.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <689539b24f9dc57ec0bfc92fdd9d3464@walle.cc>
X-Sender: michael@walle.cc
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Am 2021-05-20 14:00, schrieb Matti Vaittinen:
> On Thu, 2021-05-20 at 13:42 +0200, Michael Walle wrote:
>> Am 2021-05-20 13:28, schrieb Matti Vaittinen:
>> > The set_config and init_valid_mask GPIO operations are usually very
>> > IC
>> > specific. Allow IC drivers to provide these custom operations at
>> > gpio-regmap registration.
>> >
>> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
>> > ---
>> >  drivers/gpio/gpio-regmap.c  | 49
>> > +++++++++++++++++++++++++++++++++++++
>> >  include/linux/gpio/regmap.h | 13 ++++++++++
>> >  2 files changed, 62 insertions(+)
>> >
>> > diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-
>> > regmap.c
>> > index 134cedf151a7..315285cacd3f 100644
>> > --- a/drivers/gpio/gpio-regmap.c
>> > +++ b/drivers/gpio/gpio-regmap.c
>> > @@ -27,6 +27,10 @@ struct gpio_regmap {
>> >  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int
>> > base,
>> >  			      unsigned int offset, unsigned int *reg,
>> >  			      unsigned int *mask);
>> > +	int (*set_config)(struct regmap *regmap, void *drvdata,
>> > +			  unsigned int offset, unsigned long config);
>> > +	int (*init_valid_mask)(struct regmap *regmap, void *drvdata,
>> > +				unsigned long *valid_mask, unsigned int
>> > ngpios);
>> 
>> Maybe we should also make the first argument a "struct gpio_regmap"
>> and provide a new gpio_regmap_get_regmap(struct gpio_regmap). Thus
>> having a similar api as for the reg_mask_xlate(). Andy?
> 
> I don't really see the reason of making this any more complicated for
> IC drivers. If we don't open the struct gpio_regmap to IC drivers -
> then they never need the struct gpio_regmap pointer itself but each IC
> driver would need to do some unnecessary function call
> (gpio_regmap_get_regmap() in this case). I'd say that would be
> unnecessary bloat.

If there is ever the need of additional parameters, you'll have to
modify that parameter list. Otherwise you'll just have to add a new
function. Thus might be more future proof.

But I won't object to it.

>> >  	void *driver_data;
>> >  };
>> > @@ -39,6 +43,43 @@ static unsigned int gpio_regmap_addr(unsigned
>> > int
>> > addr)
>> >  	return addr;
>> >  }
>> >
>> > +static int regmap_gpio_init_valid_mask(struct gpio_chip *gc,
>> > +					unsigned long *valid_mask,
>> > +					unsigned int ngpios)
>> > +{
>> > +	struct gpio_regmap *gpio;
>> > +	void *drvdata;
>> > +
>> > +	gpio = gpiochip_get_data(gc);
>> > +
>> > +	if (!gpio->init_valid_mask) {
>> > +		WARN_ON(!gpio->init_valid_mask);
>> > +		return -EINVAL;
>> > +	}
>> 
>> Why not the following?
>> 
>> if (!gpio->init_valid_mask)
>>      return 0;
> 
> It just feels like an error if regmap_gpio_init_valid_mask() is ever
> called by core without having the gpio->init_valid_mask set. Probably
> this would mean that the someone has errorneously modified the gpio-
>> init_valid_mask set after gpio_regmap registration - whih smells like
> a problem. Thus the WARN() sounds like a correct course of action to
> me. (I may be wrong though - see below)
> 
>> Thus copying the behavior of gpiolib.
> 
> I must admit I didn't check how this is implemented in gpiolib. But the
> gpio_chip's init_valid_mask should not be set if regmap_gpio_config
> does not have valid init_valid_mask pointer at registration. Thus it
> smells like an error to me if the GPIO core calls the
> regmap_gpio_init_valid_mask() and regmap_gpio has not set the
> init_valid_mask pointer. But as I said, I haven't looked in gpiolib for
> this so I may be wrong.

Oh, I missed that you only set it when it is set in the
gpio_regmap_config. Thus, I'd say drop it entirely? It is only within
this module where things might go wrong.

>> > +
>> > +	drvdata = gpio_regmap_get_drvdata(gpio);
>> > +
>> > +	return gpio->init_valid_mask(gpio->regmap, drvdata,
>> > valid_mask,
>> > ngpios);
>> > +}
>> > +
>> > +static int gpio_regmap_set_config(struct gpio_chip *gc, unsigned
>> > int
>> > offset,
>> > +				  unsigned long config)
>> > +{
>> > +	struct gpio_regmap *gpio;
>> > +	void *drvdata;
>> > +
>> > +	gpio = gpiochip_get_data(gc);
>> > +
>> > +	if (!gpio->set_config) {
>> > +		WARN_ON(!gpio->set_config);
>> > +		return -EINVAL;
>> > +	}
>> 
>> same here, return -ENOTSUPP.
> 
> As above -
> if (!gpio->set_config) {
> 	the gpio-core should never call gpio_regmap_set_config() if the
> }
> 
> Maybe I should add a comment to clarify the WARN() ?
>> 
>> > +
>> > +	drvdata = gpio_regmap_get_drvdata(gpio);
>> > +
>> > +	return gpio->set_config(gpio->regmap, drvdata, offset, config);
>> > +}
>> > +
>> >  static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
>> >  				    unsigned int base, unsigned int
>> > offset,
>> >  				    unsigned int *reg, unsigned int
>> > *mask)
>> > @@ -235,6 +276,8 @@ struct gpio_regmap *gpio_regmap_register(const
>> > struct gpio_regmap_config *config
>> >  	gpio->reg_clr_base = config->reg_clr_base;
>> >  	gpio->reg_dir_in_base = config->reg_dir_in_base;
>> >  	gpio->reg_dir_out_base = config->reg_dir_out_base;
>> > +	gpio->set_config = config->set_config;
>> > +	gpio->init_valid_mask = config->init_valid_mask;
>> >
>> >  	/* if not set, assume there is only one register */
>> >  	if (!gpio->ngpio_per_reg)
>> > @@ -253,6 +296,10 @@ struct gpio_regmap *gpio_regmap_register(const
>> > struct gpio_regmap_config *config
>> >  	chip->ngpio = config->ngpio;
>> >  	chip->names = config->names;
>> >  	chip->label = config->label ?: dev_name(config->parent);
>> > +	if (gpio->set_config)
>> > +		chip->set_config = gpio_regmap_set_config;
>> > +	if (gpio->init_valid_mask)
>> > +		chip->init_valid_mask = regmap_gpio_init_valid_mask;
>> >
>> >  #if defined(CONFIG_OF_GPIO)
>> >  	/* gpiolib will use of_node of the parent if chip->of_node is
>> > NULL */
>> > @@ -280,6 +327,8 @@ struct gpio_regmap *gpio_regmap_register(const
>> > struct gpio_regmap_config *config
>> >  		chip->direction_output = gpio_regmap_direction_output;
>> >  	}
>> >
>> > +	gpio_regmap_set_drvdata(gpio, config->drvdata);
>> 
>> I'm wondering if we need the gpio_regmap_set_drvdata() anymore or if
>> we can just drop it entirely.
> 
> I wouldn't drop it. I think there _may_ be cases where the drvdata is
> set only after the registration. (Just my gut-feeling, I may be wrong
> though)

Ok, but as you already mentioned on IRC, it could be a bit of a trap
because it might already be used after gpiochip_add_data() and thus
be NULL if not provided by gpio_regmap_config().

-michael
