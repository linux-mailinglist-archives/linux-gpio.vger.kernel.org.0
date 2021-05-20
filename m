Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 917F138AD4B
	for <lists+linux-gpio@lfdr.de>; Thu, 20 May 2021 14:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242202AbhETMCe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 20 May 2021 08:02:34 -0400
Received: from mail-lj1-f178.google.com ([209.85.208.178]:35539 "EHLO
        mail-lj1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242212AbhETMCF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 20 May 2021 08:02:05 -0400
Received: by mail-lj1-f178.google.com with SMTP id f12so19387693ljp.2;
        Thu, 20 May 2021 05:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:reply-to:to:cc
         :in-reply-to:references:mime-version:date:user-agent
         :content-transfer-encoding;
        bh=Od73fO/YVSXLydPlT1ud/ElrNvX8bt89vcA0n78Oo9I=;
        b=eRgP5A9V1YLvehVr7Wzsx1Xpf9mK2ICVdLVeUrOe8RTCPTr0s3Bq/2oyy/Gqnm1tHp
         RVnR0UsnGD9yC+oqvW/ouyI/QHBbnCB60B/EWJnkzX8IR+Wr8LxLuRxDXL0+O4hnXapn
         NT5kkyGqAtQn5DHZXWeVQXx7pcnViGcGq7sRHDU42NoKDdOpsTyoK4HBRMCrfYx/+fYM
         VCvZ3EbV8MbcOW9tcUia9tIPbtVxisSTGOdl1wtiC9iYBjy024mx/1Lg5t3/a6kdiOUX
         CGb6KPPDIj1NTUpq6Hly7EEkaFFjswmBmo0lWThpsLNBuHPYbJ2P7oj8g5nfcESp9/PF
         JUDw==
X-Gm-Message-State: AOAM530pk99KNRIPqwzE9NG0aVoj6oZENH8UorOeYsr82ExYhSPtoHvy
        GyxW81ru5d5DW06V7tdo6DA=
X-Google-Smtp-Source: ABdhPJz/6VHA3K8N7sNFn9brO+GRXFQJMCmRs8KAMZtvm+caK/We7l/Z2cJzfmRQdc3HAu+2TTnjaA==
X-Received: by 2002:a2e:b4b1:: with SMTP id q17mr2753648ljm.40.1621512041799;
        Thu, 20 May 2021 05:00:41 -0700 (PDT)
Received: from dc7vkhyyyyyyyyyyyyybt-3.rev.dnainternet.fi (dc7vkhyyyyyyyyyyyyybt-3.rev.dnainternet.fi. [2001:14ba:16e2:8300::3])
        by smtp.gmail.com with ESMTPSA id t15sm269409ljk.99.2021.05.20.05.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 05:00:41 -0700 (PDT)
Message-ID: <c6acc28e87d43973561a66bdb4d78905882f2940.camel@fi.rohmeurope.com>
Subject: Re: [PATCH 1/2] gpio: regmap: Support few IC specific operations
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reply-To: matti.vaittinen@fi.rohmeurope.com
To:     Michael Walle <michael@walle.cc>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com
In-Reply-To: <7d6f71e0a79e6ccd2a9f69be189993a9@walle.cc>
References: <09091e75157ea28dcad1605008532016304356a4.1621509932.git.matti.vaittinen@fi.rohmeurope.com>
         <7d6f71e0a79e6ccd2a9f69be189993a9@walle.cc>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Date:   Thu, 20 May 2021 15:00:35 +0300
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


On Thu, 2021-05-20 at 13:42 +0200, Michael Walle wrote:
> Hi Matti,
> 
> Am 2021-05-20 13:28, schrieb Matti Vaittinen:
> > The set_config and init_valid_mask GPIO operations are usually very
> > IC
> > specific. Allow IC drivers to provide these custom operations at
> > gpio-regmap registration.
> > 
> > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> > ---
> >  drivers/gpio/gpio-regmap.c  | 49
> > +++++++++++++++++++++++++++++++++++++
> >  include/linux/gpio/regmap.h | 13 ++++++++++
> >  2 files changed, 62 insertions(+)
> > 
> > diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-
> > regmap.c
> > index 134cedf151a7..315285cacd3f 100644
> > --- a/drivers/gpio/gpio-regmap.c
> > +++ b/drivers/gpio/gpio-regmap.c
> > @@ -27,6 +27,10 @@ struct gpio_regmap {
> >  	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int
> > base,
> >  			      unsigned int offset, unsigned int *reg,
> >  			      unsigned int *mask);
> > +	int (*set_config)(struct regmap *regmap, void *drvdata,
> > +			  unsigned int offset, unsigned long config);
> > +	int (*init_valid_mask)(struct regmap *regmap, void *drvdata,
> > +				unsigned long *valid_mask, unsigned int
> > ngpios);
> 
> Maybe we should also make the first argument a "struct gpio_regmap"
> and provide a new gpio_regmap_get_regmap(struct gpio_regmap). Thus
> having a similar api as for the reg_mask_xlate(). Andy?

I don't really see the reason of making this any more complicated for
IC drivers. If we don't open the struct gpio_regmap to IC drivers -
then they never need the struct gpio_regmap pointer itself but each IC
driver would need to do some unnecessary function call
(gpio_regmap_get_regmap() in this case). I'd say that would be
unnecessary bloat.

> 
> >  	void *driver_data;
> >  };
> > @@ -39,6 +43,43 @@ static unsigned int gpio_regmap_addr(unsigned
> > int 
> > addr)
> >  	return addr;
> >  }
> > 
> > +static int regmap_gpio_init_valid_mask(struct gpio_chip *gc,
> > +					unsigned long *valid_mask,
> > +					unsigned int ngpios)
> > +{
> > +	struct gpio_regmap *gpio;
> > +	void *drvdata;
> > +
> > +	gpio = gpiochip_get_data(gc);
> > +
> > +	if (!gpio->init_valid_mask) {
> > +		WARN_ON(!gpio->init_valid_mask);
> > +		return -EINVAL;
> > +	}
> 
> Why not the following?
> 
> if (!gpio->init_valid_mask)
>      return 0;

It just feels like an error if regmap_gpio_init_valid_mask() is ever
called by core without having the gpio->init_valid_mask set. Probably
this would mean that the someone has errorneously modified the gpio-
>init_valid_mask set after gpio_regmap registration - whih smells like
a problem. Thus the WARN() sounds like a correct course of action to
me. (I may be wrong though - see below)

> Thus copying the behavior of gpiolib.

I must admit I didn't check how this is implemented in gpiolib. But the
gpio_chip's init_valid_mask should not be set if regmap_gpio_config
does not have valid init_valid_mask pointer at registration. Thus it
smells like an error to me if the GPIO core calls the
regmap_gpio_init_valid_mask() and regmap_gpio has not set the
init_valid_mask pointer. But as I said, I haven't looked in gpiolib for
this so I may be wrong.

> 
> > +
> > +	drvdata = gpio_regmap_get_drvdata(gpio);
> > +
> > +	return gpio->init_valid_mask(gpio->regmap, drvdata,
> > valid_mask, 
> > ngpios);
> > +}
> > +
> > +static int gpio_regmap_set_config(struct gpio_chip *gc, unsigned
> > int 
> > offset,
> > +				  unsigned long config)
> > +{
> > +	struct gpio_regmap *gpio;
> > +	void *drvdata;
> > +
> > +	gpio = gpiochip_get_data(gc);
> > +
> > +	if (!gpio->set_config) {
> > +		WARN_ON(!gpio->set_config);
> > +		return -EINVAL;
> > +	}
> 
> same here, return -ENOTSUPP.

As above - 
if (!gpio->set_config) {
	the gpio-core should never call gpio_regmap_set_config() if the
}

Maybe I should add a comment to clarify the WARN() ?
> 
> > +
> > +	drvdata = gpio_regmap_get_drvdata(gpio);
> > +
> > +	return gpio->set_config(gpio->regmap, drvdata, offset, config);
> > +}
> > +
> >  static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
> >  				    unsigned int base, unsigned int
> > offset,
> >  				    unsigned int *reg, unsigned int
> > *mask)
> > @@ -235,6 +276,8 @@ struct gpio_regmap *gpio_regmap_register(const
> > struct gpio_regmap_config *config
> >  	gpio->reg_clr_base = config->reg_clr_base;
> >  	gpio->reg_dir_in_base = config->reg_dir_in_base;
> >  	gpio->reg_dir_out_base = config->reg_dir_out_base;
> > +	gpio->set_config = config->set_config;
> > +	gpio->init_valid_mask = config->init_valid_mask;
> > 
> >  	/* if not set, assume there is only one register */
> >  	if (!gpio->ngpio_per_reg)
> > @@ -253,6 +296,10 @@ struct gpio_regmap *gpio_regmap_register(const
> > struct gpio_regmap_config *config
> >  	chip->ngpio = config->ngpio;
> >  	chip->names = config->names;
> >  	chip->label = config->label ?: dev_name(config->parent);
> > +	if (gpio->set_config)
> > +		chip->set_config = gpio_regmap_set_config;
> > +	if (gpio->init_valid_mask)
> > +		chip->init_valid_mask = regmap_gpio_init_valid_mask;
> > 
> >  #if defined(CONFIG_OF_GPIO)
> >  	/* gpiolib will use of_node of the parent if chip->of_node is
> > NULL */
> > @@ -280,6 +327,8 @@ struct gpio_regmap *gpio_regmap_register(const
> > struct gpio_regmap_config *config
> >  		chip->direction_output = gpio_regmap_direction_output;
> >  	}
> > 
> > +	gpio_regmap_set_drvdata(gpio, config->drvdata);
> 
> I'm wondering if we need the gpio_regmap_set_drvdata() anymore or if
> we can just drop it entirely.

I wouldn't drop it. I think there _may_ be cases where the drvdata is
set only after the registration. (Just my gut-feeling, I may be wrong
though)


Best Regards
	Matti Vaittinen

-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland
SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~

Simon says - in Latin please.
"non cogito me" dixit Rene Descarte, deinde evanescavit

(Thanks for the translation Simon)


