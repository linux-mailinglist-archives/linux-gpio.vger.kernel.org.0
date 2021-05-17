Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5F5F386C8C
	for <lists+linux-gpio@lfdr.de>; Mon, 17 May 2021 23:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238139AbhEQVsN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 May 2021 17:48:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230508AbhEQVsM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 May 2021 17:48:12 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27D71C061573;
        Mon, 17 May 2021 14:46:55 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id j12so5557800pgh.7;
        Mon, 17 May 2021 14:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IOPqVh4ctVMNjnNehOsFwhQ1fcOGYIeU03yW9pJuSfA=;
        b=eo0dvdemtxA8CWklQcmccrobKYDEPMbmpgQQJ5P4RV79QGke+2rT3ahcNrscXaGiiF
         wIC+Z0SNXbDwnqmzA1wwqZWWTwhfeQV8gQJh5myROQSbQD0x4Rgr015sLk9T6gDJ0g78
         kIBAdpdtGAhzwvWhfXrUGo6I0CJKqJwyPMH3EMNBptvH6JTT/XPJth132dJpR1bdlXCH
         1dToYh2sQEsKydBNRGbnFFKFn/7GolQ0OZPBQg21/0i4hWgNF5VQ1+bLXoRn1oWz5Qg3
         OOdJ9iHsrDpT8B59OWjloAsAUVn82H3Ntvl6Z/k4tCTga47qB0+EoFkVOkd8qSALasoe
         7pGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IOPqVh4ctVMNjnNehOsFwhQ1fcOGYIeU03yW9pJuSfA=;
        b=Av9rsSIm/jZcNkz03D5ISjwvjZvgTH8GTlDFAje588h28yCP8Yy7vFm1ib+L9s8gKK
         HtcNJuflLv8AmSJlfkuX5JS33Wf3JbLbOVM8Q8VbAxizNBoP/u87k3zifTDW9y+F8Far
         7nH4rN4zSIa+E8/JaBzp/jDgJfmC1tl3hGBePHmCQaciaVV7h3u5lCYXBMGEvxynmrt2
         iPcTcqpB/O7OyMvitHfSfE2BGBGb3FNOU8m366SzjE5asM0IshiCWepcIq9t6Bq4O1Qx
         Zr8zVXA7DYliqV5iAVw2YIosVsEQ/ht1Cx7ylkwSJi5/A0/jdNQl1aoTlLR5tnmaGOiC
         QZ+A==
X-Gm-Message-State: AOAM531l+dRry5pQQ/Fr3GQoLoF1ZhrZrPrOZq4MnmeL0vdqd/aDjsrb
        AJw9uY38oF06clKGxbJAfxtJYactKk0jMuWS8xM=
X-Google-Smtp-Source: ABdhPJxuzVusCnFFhqkZlzIBVH0h5nlCqxxXZ3VisJydlCZOFV9HeP4C0vNeRg0iCKsJP5TyzKoS5KA1oNtrbg5gsIM=
X-Received: by 2002:a05:6a00:1591:b029:2d9:369a:b846 with SMTP id
 u17-20020a056a001591b02902d9369ab846mr1755450pfk.40.1621288014672; Mon, 17
 May 2021 14:46:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621279162.git.sander@svanheule.net> <041077d195f1cc81bf6363388cb4adfb06cff4ef.1621279162.git.sander@svanheule.net>
 <CAHp75Vf0Qo-hBUAOwhxGiH6azFg0OPV8OkUSfTxWet__MBF9yA@mail.gmail.com>
In-Reply-To: <CAHp75Vf0Qo-hBUAOwhxGiH6azFg0OPV8OkUSfTxWet__MBF9yA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 May 2021 00:46:38 +0300
Message-ID: <CAHp75Vcj3_ePO1=+p0FRGk018TYG-LeA2=xtzENJUuN5sBGGGA@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] pinctrl: Add RTL8231 pin control and GPIO support
To:     Sander Vanheule <sander@svanheule.net>
Cc:     Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Michael Walle <michael@walle.cc>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 12:42 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, May 17, 2021 at 10:28 PM Sander Vanheule <sander@svanheule.net> wrote:

The rest of the review is here (hit the send before finished).

...

> > +       int err = 0;
>
> Check entire series for unnecessary assignments.They

They even may hide a mistake.

...


> > +static int rtl8231_pinctrl_probe(struct platform_device *pdev)
> > +{

> > +       ctrl->map = dev_get_regmap(dev->parent, NULL);
> > +       if (IS_ERR_OR_NULL(ctrl->map)) {
> > +               dev_err(dev, "failed to retrieve regmap\n");
> > +               if (!ctrl->map)
> > +                       return -ENODEV;
> > +               else
> > +                       return PTR_ERR(ctrl->map);
> > +       }

Simply split the outer conditional to two.

-- 
With Best Regards,
Andy Shevchenko
