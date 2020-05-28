Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAF31E523E
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 02:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgE1Abz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 May 2020 20:31:55 -0400
Received: from mga06.intel.com ([134.134.136.31]:16111 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725267AbgE1Aby (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 27 May 2020 20:31:54 -0400
IronPort-SDR: CGy527Wuk5WeOcrnlswysdsYJm0YtFVEtbmLPdfWqEybi2YoMndvI0zTXXJlkog7ATXLKYJeg6
 ubGJnj05BAlg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2020 17:31:54 -0700
IronPort-SDR: tLEA/8+WuVhsDH+0shAy53CoIe07pXIm0cqqZvLhsVhXkoklT8nWc8rN7lK0svuK6+pcIlbXEc
 EYOO29erypBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,443,1583222400"; 
   d="scan'208";a="345723262"
Received: from robithx-mobl.amr.corp.intel.com (HELO [10.254.66.2]) ([10.254.66.2])
  by orsmga001.jf.intel.com with ESMTP; 27 May 2020 17:31:53 -0700
Subject: Re: [PATCH v4 2/2] gpio: add a reusable generic gpio_chip using
 regmap
To:     Michael Walle <michael@walle.cc>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20200525160741.21729-1-michael@walle.cc>
 <20200525160741.21729-3-michael@walle.cc>
 <d245b4f5-065f-4c82-ef8e-d906b363fdcf@linux.intel.com>
 <6d08ebbfbc9f656cb5650ede988cf36d@walle.cc>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <fe44039a-4fa9-dab3-cd14-04967b729158@linux.intel.com>
Date:   Wed, 27 May 2020 19:31:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <6d08ebbfbc9f656cb5650ede988cf36d@walle.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Michael,

>>> +struct gpio_regmap_config {
>>> +    struct device *parent;
>>> +    struct regmap *regmap;
>>> +
>>> +    const char *label;
>>> +    int ngpio;
>>
>> could we add a .names field for the gpio_chip, I found this useful for
>> PCM512x GPIO support, e.g.
> 
> Sure, I have the names in the device tree.
> 
> But I'd prefer that you'd do a patch on top of this (assuming it is
> applied soon), because you can actually test it and there might be
> missing more.

I am happy to report that this gpio-regmap worked like a charm for me, 
after I applied the minor diff below (complete code at 
https://github.com/plbossart/sound/tree/fix/regmap-gpios).

I worked around my previous comments by forcing the GPIO internal 
routing directly in regmap, and that allowed me to only play with the 
_set and _dir bases. I see the LEDs and clock selected as before, quite 
nice indeed.

The chip->label test is probably wrong, since the gpio_chip structure is 
zeroed out if(!chip->label) is always true so the label is always set to 
the device name. I don't know what the intent was so just removed that 
test - maybe the correct test should be if (!config->label) ?

I added the names support as well, and btw I don't understand how one 
would get them through device tree?

I still have a series of odd warnings I didn't have before:

[  101.400263] WARNING: CPU: 3 PID: 1129 at drivers/gpio/gpiolib.c:4084 
gpiod_set_value+0x3f/0x50

This seems to come from
	/* Should be using gpiod_set_value_cansleep() */
	WARN_ON(desc->gdev->chip->can_sleep);

so maybe we need an option here as well? Or use a different function?

Anyways, that gpio-regmap does simplify my code a great deal so thanks 
for this work, much appreciated.
-Pierre

diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
index 3cb0e8493835..678d644a0a4b 100644
--- a/drivers/gpio/gpio-regmap.c
+++ b/drivers/gpio/gpio-regmap.c
@@ -251,10 +251,8 @@ struct gpio_regmap *gpio_regmap_register(const 
struct gpio_regmap_config *config
         chip->ngpio = config->ngpio;
         chip->can_sleep = true;

-       if (!chip->label)
-               chip->label = dev_name(config->parent);
-       else
-               chip->label = config->label;
+       chip->label = config->label;
+       chip->names = config->names;

         chip->get = gpio_regmap_get;
         if (gpio->reg_set_base && gpio->reg_clr_base)
diff --git a/include/linux/gpio-regmap.h b/include/linux/gpio-regmap.h
index bbdb2d79ef8f..c1f3e36ebf33 100644
--- a/include/linux/gpio-regmap.h
+++ b/include/linux/gpio-regmap.h
@@ -16,6 +16,7 @@ struct gpio_regmap;
   *                     given, the name of the device is used
   * @label:             (Optional) Descriptive name for GPIO controller.
   *                     If not given, the name of the device is used.
+ * @names:             (Optional) Array of names for gpios
   * @ngpio:             Number of GPIOs
   * @reg_dat_base:      (Optional) (in) register base address
   * @reg_set_base:      (Optional) set register base address
@@ -43,6 +44,7 @@ struct gpio_regmap_config {
         struct regmap *regmap;

         const char *label;
+       const char *const *names;
         int ngpio;

         unsigned int reg_dat_base;
