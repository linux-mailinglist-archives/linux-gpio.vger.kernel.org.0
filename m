Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 88CC730B17D
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Feb 2021 21:17:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbhBAURO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Feb 2021 15:17:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbhBAURL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Feb 2021 15:17:11 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03233C061756
        for <linux-gpio@vger.kernel.org>; Mon,  1 Feb 2021 12:16:30 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id c3so7740484ybi.3
        for <linux-gpio@vger.kernel.org>; Mon, 01 Feb 2021 12:16:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E+gC1OaRQRqeefQEyvd9p61rlhxwa+1DLrnlVWGxC1E=;
        b=PTYrZ8kxoO7i26AracmNzsAH5I6E6tvAmWdSQMbfNF/Ld7uJTBuOksA0vfPOQOoS58
         EY5WX+zc4VbYj0E62+h6oPLF7i//ooMlsWjKEjEW5k54xuhBmJ91AQJuVC29JC/8JqPB
         S8QB3k4aSK3eRh0tmuS8lDS4pUfL0e2hAW3TkDTPEmP8SzrHbxq0z9spKtWx9qq65F6i
         eIU5jeMPfbeVCN235HV7IgDB46kQaWf+YqocCzZWbbZbjDTAPf+Y5O+fpcsgil2lMtr7
         IPbw/FQHi+9g4TKOLQcyu3MftiyOoZ4FJtF2TBntA8taznalLic738b/TzSLt53Ej5Pp
         71gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E+gC1OaRQRqeefQEyvd9p61rlhxwa+1DLrnlVWGxC1E=;
        b=liZHrC5lEZWws2/tJUKUzT2+kzdJxSrZnvBa6Fbp8qSjmoO+1YxDGwd1hRj1/OId2q
         ehlqvGUXDCd4qg6/0pHtu/DGBl/Sm84ZIopZHEK6u3rOfaSSihC7simrkrzQw6LEKHXL
         rksHQ4CcqrD/6X7SzgEO8/8AiIGuCSO8Z3i/3oIXPA+V0UHmZ0UT/P2W3WsXR+zWxuoW
         PAxf35u0E+DT12owJTKC3w+awVnvg79PXeK7o27iwF5YyZgPKDHBrMlRfh+r2y7VnjVf
         WOblkt75bxLVQ5/YkNtw5zm0QBLrPCj/cfYYiHCVVIlv0hW8d1jQswACDwdYCpHs7bV9
         pdTQ==
X-Gm-Message-State: AOAM531TQtS3H8QsQvyJPLN5aMX9VsfFvBFT0cOHYwHmwyiNK4TzLVQH
        JtR+KxN9REiMMxStZ0wfbcCfx/+AzuoPmVTKMmvfvg==
X-Google-Smtp-Source: ABdhPJzG/w6bMSWvYqFGmODcmTtZxosmmpm1AXG/FdeExuGHcVQZsFa7C7FhEoCS5CvHSPflDK0xbXrOUR9YwG4aHcg=
X-Received: by 2002:a25:b74c:: with SMTP id e12mr18291544ybm.20.1612210590103;
 Mon, 01 Feb 2021 12:16:30 -0800 (PST)
MIME-Version: 1.0
References: <20210122193600.1415639-1-saravanak@google.com>
 <544ad0e4-0954-274c-8e77-866aaa5661a8@gmail.com> <CAGETcx_CYKczo+geD7yDo+T2+_-tgGYwtjR-2sMPQYHuz-wAgw@mail.gmail.com>
 <09502076-02e9-39ee-e432-24260696a927@gmail.com>
In-Reply-To: <09502076-02e9-39ee-e432-24260696a927@gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Mon, 1 Feb 2021 12:15:53 -0800
Message-ID: <CAGETcx9fqnCZTC=afDUHnS6gES8WW4SwFNmH5sWaGVRYiysOMQ@mail.gmail.com>
Subject: Re: [PATCH v5] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 1, 2021 at 8:49 AM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> 01.02.2021 00:28, Saravana Kannan =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >> This patch causes these new errors on NVIDIA Tegra30 Nexus 7 using rec=
ent linux-next:
> >>
> >>  gpio-1022 (cpu-pwr-req-hog): hogged as input
> >>  max77620-pinctrl max77620-pinctrl: pin gpio4 already requested by max=
77620-pinctrl; cannot claim for gpiochip1
> >>  max77620-pinctrl max77620-pinctrl: pin-4 (gpiochip1) status -22
> >>  max77620-pinctrl max77620-pinctrl: could not request pin 4 (gpio4) fr=
om group gpio4  on device max77620-pinctrl
> >>  gpio_stub_drv gpiochip1: Error applying setting, reverse things back
> >>  gpio_stub_drv: probe of gpiochip1 failed with error -22
> >>
> >> Please fix, thanks in advance.
> > I have a partial guess on why this is happening. So can you try this pa=
tch?
> >
> > Thanks,
> > Saravana
> >
> > --- a/drivers/gpio/gpiolib.c
> > +++ b/drivers/gpio/gpiolib.c
> > @@ -4213,6 +4213,8 @@ static int gpio_stub_drv_probe(struct device *dev=
)
> >          * gpio_device of the GPIO chip with the firmware node and then=
 simply
> >          * bind it to this stub driver.
> >          */
> > +       if (dev->fwnode && dev->fwnode->dev !=3D dev)
> > +               return -EBUSY;
> >         return 0;
> >  }
>
> This change doesn't help, exactly the same errors are still there.

Sorry, I see what's happening. Try this instead. If it works, I'll
send out a proper patch.

Thanks,
Saravana

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8e0564c50840..f3d0ffe8a930 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -56,8 +56,10 @@
 static DEFINE_IDA(gpio_ida);
 static dev_t gpio_devt;
 #define GPIO_DEV_MAX 256 /* 256 GPIO chip devices supported */
+static int gpio_bus_match(struct device *dev, struct device_driver *drv);
 static struct bus_type gpio_bus_type =3D {
        .name =3D "gpio",
+       .match =3D gpio_bus_match,
 };

 /*
@@ -4199,6 +4201,14 @@ void gpiod_put_array(struct gpio_descs *descs)
 }
 EXPORT_SYMBOL_GPL(gpiod_put_array);

+
+static int gpio_bus_match(struct device *dev, struct device_driver *drv)
+{
+       if (dev->fwnode && dev->fwnode->dev !=3D dev)
+               return 0;
+       return 1;
+}
+
 static int gpio_stub_drv_probe(struct device *dev)
 {
        /*
