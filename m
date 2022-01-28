Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 913DC49FBE6
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Jan 2022 15:40:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349359AbiA1Oke (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 28 Jan 2022 09:40:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349356AbiA1Oke (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Jan 2022 09:40:34 -0500
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAFCAC061714
        for <linux-gpio@vger.kernel.org>; Fri, 28 Jan 2022 06:40:33 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:3999:e79d:cb59:f2ec])
        by xavier.telenet-ops.be with bizsmtp
        id oEgX2600904fKGS01EgXd6; Fri, 28 Jan 2022 15:40:31 +0100
Received: from geert (helo=localhost)
        by ramsan.of.borg with local-esmtp (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1nDSQR-00BmRj-CD; Fri, 28 Jan 2022 15:40:31 +0100
Date:   Fri, 28 Jan 2022 15:40:31 +0100 (CET)
From:   Geert Uytterhoeven <geert@linux-m68k.org>
X-X-Sender: geert@ramsan.of.borg
To:     =?ISO-8859-15?Q?Mikko_Salom=E4ki?= <ms@datarespons.se>
cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: gpio: aggregator: Using chips with can_sleep
In-Reply-To: <CAHp75VdOY8a85us-DEAbySRAMNz9F50JHjov0nJRsQva0huzOQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2201281537170.2807703@ramsan.of.borg>
References: <AM9PR03MB76077A7FB926CAE37E1D8565AA209@AM9PR03MB7607.eurprd03.prod.outlook.com> <CAHp75VdOY8a85us-DEAbySRAMNz9F50JHjov0nJRsQva0huzOQ@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-190950414-1643380831=:2807703"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-190950414-1643380831=:2807703
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

 	Hi Mikko,

On Fri, 28 Jan 2022, Andy Shevchenko wrote:
> +Cc: author, maintainers

Thank you, Andy

> On Wed, Jan 26, 2022 at 10:38 PM Mikko Salomäki <ms@datarespons.se> wrote:
>
>> Trying to map gpio from i2c connected chips triggered kernel warnings from libgpiod when setting or getting values. By my understanding the get and set calls need to change to their _cansleep counterparts for chips with chip->can_sleep.
>>
>> For example:
>> gpiod_get_value() -> gpiod_get_value_cansleep()
>>
>> Is this an actual bug or my misunderstanding?

Thanks for your report!
I think this is an oversight, i.e. an actual bug.

Does the below (compile-tested only) help?

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 869dc952cf45218b..70ccad102cb1df96 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -278,7 +278,8 @@ static int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
  {
  	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);

-	return gpiod_get_value(fwd->descs[offset]);
+	return chip->can_sleep ? gpiod_get_value_cansleep(fwd->descs[offset])
+			       : gpiod_get_value(fwd->descs[offset]);
  }

  static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
@@ -293,7 +294,10 @@ static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
  	for_each_set_bit(i, mask, fwd->chip.ngpio)
  		descs[j++] = fwd->descs[i];

-	error = gpiod_get_array_value(j, descs, NULL, values);
+	if (fwd->chip.can_sleep)
+		error = gpiod_get_array_value_cansleep(j, descs, NULL, values);
+	else
+		error = gpiod_get_array_value(j, descs, NULL, values);
  	if (error)
  		return error;

@@ -328,7 +332,10 @@ static void gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
  {
  	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);

-	gpiod_set_value(fwd->descs[offset], value);
+	if (chip->can_sleep)
+		gpiod_set_value_cansleep(fwd->descs[offset], value);
+	else
+		gpiod_set_value(fwd->descs[offset], value);
  }

  static void gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
@@ -343,7 +350,10 @@ static void gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
  		descs[j++] = fwd->descs[i];
  	}

-	gpiod_set_array_value(j, descs, NULL, values);
+	if (fwd->chip.can_sleep)
+		gpiod_set_array_value_cansleep(j, descs, NULL, values);
+	else
+		gpiod_set_array_value(j, descs, NULL, values);
  }

  static void gpio_fwd_set_multiple_locked(struct gpio_chip *chip,

Gr{oetje,eeting}s,

 						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
 							    -- Linus Torvalds
--8323329-190950414-1643380831=:2807703--
