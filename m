Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA8462B5D5D
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 11:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbgKQKzZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 05:55:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727377AbgKQKzY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 05:55:24 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5467EC0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 02:55:24 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id e139so10004975lfd.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 02:55:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n7eA6LMP7/541NTHvoBgpb+fZf4rhklT5TRFiusleoU=;
        b=a1ul3C84Gt9mxT7cBgVDpIPWhq0szgo6dZY1obuiiaoiqaIAA9Ub5il97cgynwfDhl
         aW4Y09OxqArWqvykzxbagEEaNP59hek9lLQ45JKct5GaDWfTc9P+RTjqshi0EN6IO95h
         Nu9uAYYoA7dKBwmi4wY0H6BgefmUHbBaIPDweea5BZ0Q0Z6zrM5nZ19OOgDP1HddN++o
         8768HcHgRAWBHs3g+kVEi2qbiFV3mksAug5akYXry7frjvRWW9twyxhFSrFyxIEPNDGk
         Un1s6A2Yuo48WK2ZWjnR7p9Z8Uw4MbrWhi4vgl3QWFe/Ay1DJfbRRb8ljQ8rqgg5Z3Os
         aN3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n7eA6LMP7/541NTHvoBgpb+fZf4rhklT5TRFiusleoU=;
        b=dPBYsBx8AjVvpXLI3ZMBa0eQY9fhKNf3Qu/9O+5/yHfSPXJhdHluida3+fWTmVpdpG
         sTli4zi8Tiu5IN1my/C+xqd+gdmGGaumvi8/SipqicDaw1ez1XQn6dov6YEvUmYApYIw
         jayegdrR5dvx9XTwXhTwGk7GAtmfKZViSDRVxQBL1ZuEEfXxfn3S0cTDXuT8YiJv3+MR
         gzNShmKlvIRB5PsUUe6pveEdS6JF1YxklFi8Z4Maeusw9NqXeGXfwLTN688ZibolunVx
         MVBZWzeEjJ5JNbO1jfE+3Q0+3hHzGjWihWN0zeS0qJdaWoEo4bin3sX3fESrL9jg4A0O
         Z7/g==
X-Gm-Message-State: AOAM5306DaULiCIuXR2Dl09akX0t38Ni5up7iVtC3fIg2A9F2aulIlA3
        9yuWC43HfG9ERP5AdNBdEmoTvfTUHBNiGKviO2k=
X-Google-Smtp-Source: ABdhPJxJlKBc9ZnIEM1T9fqU8DgRZ8PzSmd9+rddcQitNMWv4SjkMILsuI1gJVWumeniuzjFYsXrw6yHHQdbaPgsr84=
X-Received: by 2002:a05:6512:4c5:: with SMTP id w5mr1495026lfq.215.1605610522715;
 Tue, 17 Nov 2020 02:55:22 -0800 (PST)
MIME-Version: 1.0
References: <20201116191311.12477-1-festevam@gmail.com> <CAHp75VcdOUm2vEgUUgUPUcrMwkXOdZ3Q3RWCvagerfQskznC_w@mail.gmail.com>
In-Reply-To: <CAHp75VcdOUm2vEgUUgUPUcrMwkXOdZ3Q3RWCvagerfQskznC_w@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 17 Nov 2020 07:55:12 -0300
Message-ID: <CAOMZO5C-Xoix9NSQLA0rh6eRahTfZdhVq6tZyYVqL3dqUXUeDw@mail.gmail.com>
Subject: Re: [PATCH v3] mxc: gpio: Convert the driver to DT-only
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Tue, Nov 17, 2020 at 7:38 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:

> I like the result!
> FWIW,
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

Thanks for the suggestions and review.

I noticed that I will have to change one line:

> > -       if (mxc_gpio_hwtype == IMX21_GPIO) {
> > +       if (port->hwdata == &imx1_imx21_gpio_hwdata) {

as the original condition was only true for the "mx21" type of GPIO
and now evaluates true for both imx1 and imx21.

I will change this to:

-       if (mxc_gpio_hwtype == IMX21_GPIO) {
+       if (of_device_is_compatible(np, "fsl,imx21-gpio")) {

to keep the original logic and send a v4.

Thanks
