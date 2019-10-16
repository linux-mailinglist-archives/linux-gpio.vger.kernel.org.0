Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9B2BD8FCE
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 13:44:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729186AbfJPLoT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 07:44:19 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41094 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbfJPLoT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Oct 2019 07:44:19 -0400
Received: by mail-lj1-f194.google.com with SMTP id f5so23666249ljg.8
        for <linux-gpio@vger.kernel.org>; Wed, 16 Oct 2019 04:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O7ynzB3CWA40/rW0oocow5qJKo+UWyVMGynzk11MH2o=;
        b=tqcBEQiwAZuHbNTvZTYeJu3+9qGSGTafGNKw18zAz6r0TQUjtiVV4t5O/34QRyVQuZ
         pV2bEYsovFOE3BLkhA3Lnxfc0MbhmvGcszsZE8bt4WQFOl9WoJn9XPOaRIBi+r0NBjNj
         sviQZvtOWM134O6iuxF8rBIjJ8zTpkFrLll55f/UT3A8OQfEUCrjJNfwBWACaA77Cm9j
         CxcN2GV3PIqidmBxlSCUxfzMqT6ssJCV9LDvF1JQ1iqxAFt4exI1VD8AHxSIaLrayXOk
         lkyA5FsZsCHKXQdSvO9fSoWSgVtPTwj/BJDxXh0ZN3uz6uBvkBE5CCdXRN5pAAUnY0tM
         ci/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O7ynzB3CWA40/rW0oocow5qJKo+UWyVMGynzk11MH2o=;
        b=JuYIuXxKHgCl4/qplUgCT84/DhEdtUX1IsDxJilyB4bLwBv90fYV2Hy42H9Bh9ZrDu
         +pewjNhDRdvaN/PgUdOwTjmCULAGp2J9Z5SzpQYH2iwJsEYiT/y9+MfjyV8Om0P7FNmc
         jMDviZOgZr150QQWfgtNrLCdDbZKvgeIR088MGzPB5wPCLJDD2WCElVJ8mJ4vfYj+xya
         6bojfXs+wm913Jwibd5wuLEMy+pip4pq2S61r4Sa+POLBEe8RE6/Hif8uyujDsf+u6XV
         hH+BhlNlKz/OTumtINXXgFYDEg5T81Schz8+O3G9FSE42sREvYzolPj+nV2M7fR7BQqb
         VQqw==
X-Gm-Message-State: APjAAAXiRMthI4kmSpQgrHFTil7UyQWfnXCHYtplCaULX2pSHyB3q0x4
        8t23ZxdbbTQv60UKA4U21CugliZyrFJG2MqCMhpfjQ==
X-Google-Smtp-Source: APXvYqyFOs2Fg7UebeukbqPsBDyEK4Ja4kQKpeIBZd06yULdBvUgHCWhLnH7WEACArx5keMV4Owbn+d4jJVPujVGSJQ=
X-Received: by 2002:a2e:80d1:: with SMTP id r17mr25580740ljg.118.1571226256777;
 Wed, 16 Oct 2019 04:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190917105902.445-1-m.felsch@pengutronix.de> <20190917105902.445-4-m.felsch@pengutronix.de>
 <CACRpkdbbmVo3hem1xFqtmq9-htg9+QUXQpZoSyffdTZQ5kUo5Q@mail.gmail.com>
 <20191007085159.uo366hmos6zk2ops@pengutronix.de> <20191009095612.einxiswkmhvipjht@pengutronix.de>
 <20191009101737.dpsdyyla7nmn6xdi@pengutronix.de>
In-Reply-To: <20191009101737.dpsdyyla7nmn6xdi@pengutronix.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 16 Oct 2019 13:44:04 +0200
Message-ID: <CACRpkdZj+3PubdM9sXxtRn0HKtBbtaU9-5C6Sk5pNbnw5uNKhQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpio: da9062: add driver support
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Adam Thomson <Adam.Thomson.Opensource@diasemi.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 9, 2019 at 12:17 PM Marco Felsch <m.felsch@pengutronix.de> wrote:

> > > > > +static int da9062_gpio_direction_input(struct gpio_chip *gc,
> > > > > +                                      unsigned int offset)
> > > > > +{
> > > > > +       struct da9062_gpio *gpio = gpiochip_get_data(gc);
> > > > > +       struct regmap *regmap = gpio->da9062->regmap;
> > > > > +       struct gpio_desc *desc = gpiochip_get_desc(gc, offset);
> >
> > This won't work anymore since I moved the driver to pinctrl and can't
> > include the drivers/gpio/gpiolib.h anymore. What is the right way to
> > get the same result within the pinctrl space? There are three possible
> > ways:
> > 1) Revert commit 1bd6b601fe196b6fbce2c93536ce0f3f53577cec which isn't
> >    the best due to safeness.
> > 2) Set the gpio as active low hard as the other da90*-gpio drivers did
> > 3) Introduce a dt-binding (seems wrong because the information is
> >    already there).
> > 4) "Re-implement" the gpiochip_get_desc() functionality driver
> >    internally.
>
> 4) won't work didn't recognize that 'struct gpio_device' is an internal
> struct.

This is after all a gpiochip so it can use the internal structures.
Go with

#include <../gpio/gpiolib.h>

Even if it is a bit ugly.

One day I want to join the subsystems into one, and then this would
go away, but until then we have to do this messy thing.

Yours,
Linus Walleij
