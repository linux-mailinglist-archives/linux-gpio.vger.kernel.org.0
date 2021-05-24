Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6603A38E581
	for <lists+linux-gpio@lfdr.de>; Mon, 24 May 2021 13:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232547AbhEXLe5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 May 2021 07:34:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232494AbhEXLep (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 May 2021 07:34:45 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BB8CC061574
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 04:33:16 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id v13so14469613ple.9
        for <linux-gpio@vger.kernel.org>; Mon, 24 May 2021 04:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=x46gnLIGsJq8N7jGrCH9lPhfRM+Zfds2ZLfr1wKusVE=;
        b=jC0voObdRyc6r9TnwWBCRQchvULo+zIFEuHpIywiy+UwGYvIFA7Vn/kqZ+MMqG5/ho
         h217vZg0BccSzdx3NCqhJh3jhn2avoWyLnOOysPU43hrWTXAF1obKrNQrdHKfJqsm7BK
         Ip3o20XhNt4Y7PZW9ie26Rgl9P2ILX4Gp5O5kuf/G/lbofeQySYVDtpEiXcylFZmlyk7
         LsgO7idyPudGWLRxJ7Ti9V+NKlefwgnpBJqAwuXZzFxKCZ+hzTn+vODAdVbdl3aRhflJ
         Ib7zVBQDh9q95kLJAoiQNKbCnzg+In9UHHdORsbHg0a5iZvLIlB/lLwMH3di/Ze3M45k
         La5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=x46gnLIGsJq8N7jGrCH9lPhfRM+Zfds2ZLfr1wKusVE=;
        b=o2r+vGuL8j08S244pfZCv1xSxZHWV5HJEIXKPtO5V2E+vm5/RuXyj6prV6I2ieN5UJ
         h9iP5kms4HyI0Qxa+lxF9+8bRKxP0fs8WTLN0ZTaqXG6skY6VEMGG2uyyq25apE7VVBb
         L03nsG0xuIgFgPQRDuYrIsogfWiiTnOCzFrqsVuHfXcS+HkNYhwVZT1evUEmbNoDI4Kt
         R/Au6/4+mcRATG2rsEppU0ILMebDOEhuAzM4/Yg+SysK97GYYzaAB6ZyxY3BCnGcQhll
         Vl+8YIiiSMAP3GxS99lQidgokelIv/PuzaniQ5HlU7a9rSLRO/wEAvSx5h+4cTpl8Vuk
         7+ag==
X-Gm-Message-State: AOAM531oS+OXb+qB5zADTM5dIjOsJuP1qz0Wuj7/LDEUqnUArdjK90qb
        wQnFS7ctIVcCdQJI4Z9vwyBbVq8s9QHQqy06tKvxLu2A72c=
X-Google-Smtp-Source: ABdhPJynzscYstFTvqH/U5z21Kxt25zlQkvNifrNTQCC9/nDBg3l9jMhHvWxCDExmJ4vAaFnomsHiMeDiuAhg5vJ/dw=
X-Received: by 2002:a17:90a:17ad:: with SMTP id q42mr24853372pja.181.1621855995917;
 Mon, 24 May 2021 04:33:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1621809029.git.sander@svanheule.net> <185e8c61893502575c542750c8f27b09029e3078.1621809029.git.sander@svanheule.net>
 <CAHp75VfCCFd9SQwqv-JhdHMudYWdaa1tcVp4ZNescioWTaoXFQ@mail.gmail.com>
In-Reply-To: <CAHp75VfCCFd9SQwqv-JhdHMudYWdaa1tcVp4ZNescioWTaoXFQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 24 May 2021 14:32:59 +0300
Message-ID: <CAHp75VceQ_Wiaf8zFN+f4uk6nv=ZmhE_rGgbEcB1hYh2Kz5VyA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] pinctrl: Add RTL8231 pin control and GPIO support
To:     Sander Vanheule <sander@svanheule.net>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Oops, I had sent this privately, Cc'ing to ML.

On Mon, May 24, 2021 at 12:08 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, May 24, 2021 at 1:34 AM Sander Vanheule <sander@svanheule.net> wrote:
> >
> > This driver implements the GPIO and pin muxing features provided by the
> > RTL8231. The device should be instantiated as an MFD child, where the
> > parent device has already configured the regmap used for register
> > access.
> >
> > Although described in the bindings, pin debouncing and drive strength
> > selection are currently not implemented. Debouncing is only available
> > for the six highest GPIOs, and must be emulated when other pins are used
> > for (button) inputs anyway.
>
> ...
>
> > +struct rtl8231_function {
> > +       const char *name;
> > +       unsigned int ngroups;
> > +       const char **groups;
>
> const char * const * groups?
> (Double check this, because I don't know if it's really const in your case)
>
> > +};
>
> ...
>
> > +       const struct rtl8231_pin_desc *desc =
> > +               (struct rtl8231_pin_desc *) &rtl8231_pins[group_selector].drv_data;
>
> Casting from/to void * is redundant in C.
>
> ...
>
> > +       struct rtl8231_pin_desc *desc =
> > +               (struct rtl8231_pin_desc *) &rtl8231_pins[offset].drv_data;
>
> Ditto.
>
> ...
>
> > +       ctrl->nfunctions = ARRAY_SIZE(rtl8231_pin_function_names);
> > +       ctrl->functions = devm_kcalloc(dev, ctrl->nfunctions, sizeof(*ctrl->functions), GFP_KERNEL);
> > +       if (!ctrl->functions) {
>
> > +               dev_err(dev, "failed to allocate pin function descriptors\n");
>
> Dtop this noisy message, user space will print the similar one.
>
> > +               return -ENOMEM;
> > +       }
>
> ...
>
> > +       ctrl->map = dev_get_regmap(dev->parent, NULL);
> > +       if (!ctrl->map)
> > +               return -ENODEV;
> > +
> > +       if (IS_ERR(ctrl->map))
> > +               return PTR_ERR(ctrl->map);
>
> Hmm... Is it really the case that you have to check for different values?
> What does NULL mean? Optional?
>
> ...
>
> > +       gr = devm_gpio_regmap_register(dev, &gpio_cfg);
> > +       if (IS_ERR(gr)) {
>
> > +               dev_err(dev, "failed to register gpio controller\n");
> > +               return PTR_ERR(gr);
>
> Is it possible to get a deferred probe here? If so, use dev_err_probe()
>
> > +       }
>
>
> --
> With Best Regards,
> Andy Shevchenko



-- 
With Best Regards,
Andy Shevchenko
