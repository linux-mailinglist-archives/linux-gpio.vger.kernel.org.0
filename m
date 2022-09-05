Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E44E95ADA80
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 23:04:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbiIEVDz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 17:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231726AbiIEVDy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 17:03:54 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8671658516
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 14:03:51 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id bj12so19117782ejb.13
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 14:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=hoFfvxrcWLiLIIghJLr7YqFR/bl7ppCzpkpzcFf25Ks=;
        b=RJtkdpcWwDCjdU//f+NiUTQJO5kz/J/LQ4Oeb8FsER0ooLc9TUWAVJHwh16h0rFR6k
         jDNxcAT6fUKAWlYXkDzi9PRVLGCFhao6TAvvqUzCLnc6J1JgrkOg//ZWPBTqZXz06MLe
         g/E79BtcrSCZXcou4vgp2IFBghrcFJpfeHS130JLJDTFGdRTjjJVv3m8lMFyySNYfbdn
         zyHSJi+z2sGr74Gs8Ferhg3qHw1Rm2Rd7LpNg2QiPU+rsqNYeELsa2ObuGU9YVxZktXI
         +EIJDXEMJp+8DP7PW/zCtw+WHI1pL0md9UYJvdO9U0CdYO9jo7gVaKjIjDEh/+/hHVoD
         fvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=hoFfvxrcWLiLIIghJLr7YqFR/bl7ppCzpkpzcFf25Ks=;
        b=z42wwXSn0q6uKHcT/pomCIdhp62IDH+ODYJMKwAdouNTDmkg18J6ioAjOryrIxMUYD
         dY6IcsAYiMZ6XsNSoVS1Udl43ZN+2u3gKGgmi8CG3Qn1mcpAx/S9THH5tI+sdICyYzre
         0T4PjEMJZ0V7mcBHrpyQdLS8AT38x4URVR6mRPP+loiBF7FkjKuySbA/B92Nyh8iupgK
         pu+KkkZO1x78CHT3zOaLpFGYnZzwx4JEswVKavWFRi5nPRHl/+jdNp6L8lCZT5ednRTx
         e0xQtq7R3cUsDNBavBX0g3dF06Cj8p3vthuxgEl9ZWErx6ajeYJqw0OTrOe72/1SxHzd
         vzJw==
X-Gm-Message-State: ACgBeo2g3eRPPSRBCSnCPXQNU2EgNJrYNEbnOULD9kZm/FjiA9Bv2eUU
        fjLbmrYmUU/bx7bQzTYjlkh9beFXDKfRd8oe9wylSg==
X-Google-Smtp-Source: AA6agR4GWSThcRe2jCNjPhluqCCYiE882sQv//p+YmHWCdk54XKDzjUOkiYoAS2W+owpznoWxs2VPch3w1ZAdKXk+5E=
X-Received: by 2002:a17:907:7242:b0:741:770b:dfc6 with SMTP id
 ds2-20020a170907724200b00741770bdfc6mr28207413ejc.203.1662411830025; Mon, 05
 Sep 2022 14:03:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220903-gpiod_get_from_of_node-remove-v1-0-b29adfb27a6c@gmail.com>
 <20220903-gpiod_get_from_of_node-remove-v1-2-b29adfb27a6c@gmail.com>
 <CAHp75Vc4yfh0JcY0B-vNawHTay5QNuhd7GAm86QZZZvUnQaMzQ@mail.gmail.com> <YxZP/exeVD7DQ5Hx@google.com>
In-Reply-To: <YxZP/exeVD7DQ5Hx@google.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 23:03:38 +0200
Message-ID: <CACRpkda0iUTV=71eQf5_FdKWLe3Bu=U+Zny9_uJJL=5xXtnrnQ@mail.gmail.com>
Subject: Re: [PATCH v1 02/11] drm/tegra: switch to using devm_fwnode_gpiod_get
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Claudiu Beznea <claudiu.beznea@microchip.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Felipe Balbi <balbi@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Marc Zyngier <maz@kernel.org>,
        Richard Weinberger <richard@nod.at>,
        David Airlie <airlied@linux.ie>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
        LINUXWATCHDOG <linux-watchdog@vger.kernel.org>,
        USB <linux-usb@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 9:37 PM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:
> On Mon, Sep 05, 2022 at 01:57:01PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 5, 2022 at 9:32 AM Dmitry Torokhov
> > <dmitry.torokhov@gmail.com> wrote:
> > >
> > > I would like to limit (or maybe even remove) use of
> > > [devm_]gpiod_get_from_of_node in drivers so that gpiolib can be cleaned
> > > a bit, so let's switch to the generic device property API.
> >
> > > It may even
> > > help with handling secondary fwnodes when gpiolib is taught to handle
> > > gpios described by swnodes.
> >
> > I would remove this sentence from all commit messages since it's a
> > debatable thing and might even not happen, so the above is a pure
> > speculation.
>
> I have the patches. Granted, I had them since '19 ;) but I'm rebasing
> them and going to push them. I need them to convert bunch of input
> drivers away from platform data.

That's good news!

Are you referring to this patch set mentioned in a discussion
from 2017 thru 2020?
https://lore.kernel.org/linux-input/20200826161222.GA1665100@dtor-ws/

I put aside GPIO descriptor conversion for input devices (keys, buttons)
in board files anticipating a swnode mechanism.

Yours,
Linus Walleij
