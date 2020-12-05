Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 461D02CFF7E
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 23:23:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726623AbgLEWWC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 17:22:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbgLEWWC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 17:22:02 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82E4CC061A4F
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 14:21:21 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id x23so3770657lji.7
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 14:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EArE/0H5GB599At/I2y+OISo8aIlowmqUDGHgQbpJKo=;
        b=ApEs3ZLBrSXVNicVq34OassOuaa2E4KZC5pKI5v5gDT0lIias1qZ3fGczxfkBzGo9Z
         8lYJme/WoHxkH/FtCMp/J39hTdR2gz+FUiln0zNuo1Hh+0IvYju5LnuYjqG6nrAcbhAm
         ZXR6tHnWXphYKpBTZBRFiC1PqYZTHgez9ztgpmeCE9eowJjVnOu8OrN8+7ZMSgGok+Bm
         TZl+zmdcNtJBy9FF2Y57ShZCsmW6xKXa6u/Uvo6WGmPNEFrUzpG+gjWQDCmmd6468mAW
         ZUo3iQkOB/AZRx5Ae4DATLbeO/rk/NP612YsTo04pT6c6/9fszrisIgqUfHKcj+6XWT5
         nLJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EArE/0H5GB599At/I2y+OISo8aIlowmqUDGHgQbpJKo=;
        b=hG0hI4uIXo2dQyHX5hd3X2ccBmN5lGviU892Vx+Qt61gacO0N5C7ABUui06B2YTjWg
         VUvMo/an2zod9feT5Us/cGL1SVa7Nw0BAi2Wq3rWqGtV8H/c8S1Qonh50AWLVgwokcSP
         4sysiNz0HiY4ulawprMwch46u5GT+4jr32Y0PFcdFW45pC5dl3Kft5ZVqMOKUD3ZNibV
         DDHpzf+P4l29QIf1GZEizxBuiw6YfLTwzVy8+Y+4AfD1gF+et2IF8gPAGqR26hVVkFIf
         Y8B33dSO9AxYJRvhUZFpeYCxLVbQjyb4Yzw8RnqSni/J3TYMyH7XEMxs2vFRRP+6odup
         hSZA==
X-Gm-Message-State: AOAM532P46a8oc/4J6xRQIhr3BtI2TRjfJgvLjLwTnerEXdnAfcfaxQx
        HoX72cc/HGtN2Vt6TD7iLksCzUE5Vyr/IZpa66RSyQ==
X-Google-Smtp-Source: ABdhPJyBRpGB+KeQcm/MkPGNWjtK090OkR5jq6m2vfRmrjuLHDrcKmBm6Z3RKtMBT+brJ2E1CFyhds800yX9yoinq6E=
X-Received: by 2002:a2e:780d:: with SMTP id t13mr2111175ljc.144.1607206879938;
 Sat, 05 Dec 2020 14:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20201122170822.21715-1-mani@kernel.org> <20201122170822.21715-3-mani@kernel.org>
 <CACRpkdbY-aZB1BAD=JkZAHA+OQvpH12AD3tLAp6Nf1hwr74s9A@mail.gmail.com> <X8ZmfbQp7/BGgxec@localhost>
In-Reply-To: <X8ZmfbQp7/BGgxec@localhost>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Dec 2020 23:21:09 +0100
Message-ID: <CACRpkdZJdxqxUEQaKUHctHRSQAUpYZJtuxonwVd_ZFAsLBbKrA@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] usb: serial: xr_serial: Add gpiochip support
To:     Johan Hovold <johan@kernel.org>
Cc:     Manivannan Sadhasivam <mani@kernel.org>,
        Greg KH <gregkh@linuxfoundation.org>,
        linux-usb <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        patong.mxl@gmail.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Angelo Dureghello <angelo.dureghello@timesys.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 1, 2020 at 4:50 PM Johan Hovold <johan@kernel.org> wrote:
> On Tue, Dec 01, 2020 at 03:37:38PM +0100, Linus Walleij wrote:
> > On Sun, Nov 22, 2020 at 6:08 PM Manivannan Sadhasivam <mani@kernel.org> wrote:

> > You know the names of the pins...
> >
> > > +       port_priv->gc.ngpio = 6;
> > > +       port_priv->gc.label = "xr_gpios";
> > > +       port_priv->gc.request = xr_gpio_request;
> > > +       port_priv->gc.free = xr_gpio_free;
> > > +       port_priv->gc.get_direction = xr_gpio_direction_get;
> > > +       port_priv->gc.direction_input = xr_gpio_direction_input;
> > > +       port_priv->gc.direction_output = xr_gpio_direction_output;
> > > +       port_priv->gc.get = xr_gpio_get;
> > > +       port_priv->gc.set = xr_gpio_set;
> > > +       port_priv->gc.owner = THIS_MODULE;
> > > +       port_priv->gc.parent = &port->dev;
> > > +       port_priv->gc.base = -1;
> > > +       port_priv->gc.can_sleep = true;
> >
> > So assign port_priv->gc.names here as well with an array
> > of strings with the names ("RI", "CD", ... etc).
> > This makes it look really nice in userspace if you do
> > e.g. "lsgpio".
>
> Last time we tried that gpiolib still used a flat namespace so that you
> can't have have more than one device using the same names. Unless that
> has changed this is a no-go. See
>
>         https://lore.kernel.org/r/20180930122703.7115-1-johan@kernel.org
>
> for our previous discussion about this.

Hm hm yeah we actually put in a nasty warning there since:

                gpio = gpio_name_to_desc(gc->names[i]);
                if (gpio)
                        dev_warn(&gdev->dev,
                                 "Detected name collision for GPIO name '%s'\n",
                                 gc->names[i]);


A better approach might be to create an array of names
prepended with something device-unique like the USB
bus topology? Or do we need a helper to help naming the
GPIOs? What would be helpful here?

name = kasprintf(GFP_KERNEL, "%s-NAME", topology_str);

Yours,
Linus Walleij
