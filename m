Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4A5E021C4B7
	for <lists+linux-gpio@lfdr.de>; Sat, 11 Jul 2020 16:53:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbgGKOxQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 11 Jul 2020 10:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728309AbgGKOxP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 11 Jul 2020 10:53:15 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C49C8C08C5DD;
        Sat, 11 Jul 2020 07:53:15 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id gc9so3835533pjb.2;
        Sat, 11 Jul 2020 07:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dfgCDF5aF9HyZfNeGtiuOGSATcEFAgqH2c1Xe5nNzN4=;
        b=n28FxMxwPJjSzsSAitHsf3w/D5jZmmnPsFuwel9jieH2Et1ym1KeiDpd6uSuJS33Ea
         q/yppANDCrBcgbr+0Y+HL2BIC5yisjjCt8hEa/UWi6xF7b8Js1365LlVD43FFDhemSOR
         Q1iw1GYLFuU8V8vUE+wQcdi5ecHQ9LWpTKPqP1v8QErNFBRNKmzfvGJvUOhAeNxTJqWe
         UguqITmo1lLk1gmfIi9idKswM/wh+TGZIW/wXxm9JEUwIR67/U+XOSC8HBQhrgqZ04KN
         AI8Jfxo3NO+CInGCqlFhtw3aleBLUPW7fEAqMkRw1mdv6j0I9DTxNtqybiERVoWLwsNf
         DSWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dfgCDF5aF9HyZfNeGtiuOGSATcEFAgqH2c1Xe5nNzN4=;
        b=Sc2itT2QX6PFh7/EV8Rcw5TeaxB31Xt5UVJUmN38XBo4JON8VAAll1FMMP9Zd84Udn
         9DvhKQl38R2dIE4zoKeEdvp5io4s2gEbN799rcdw7wDidTirogzWmJ8yDClau+IRfClY
         eqX3H/D2K+MsC4DF2mS2EZWfr54/u44aYMXPwe60gj+bjX9Ixd8hq1hq2V2ShttV0OyI
         LkTZE50dxUFEDVINH3lGSp7EP9Ww3GRIY7a4VHY1YZeEOtQKHtyrwhMkW2F63/z3G6wl
         KpIVIcePkJmsaihRyDGofnGzEOSYV8c8YqocUn7IGfhSPkBHIlirv28n1RCInDLixLPk
         gwEg==
X-Gm-Message-State: AOAM533cupQmnvhKCGIBDS2Uybx/Yct8Usudj5ceAcUaVKFSnrVBZRGR
        ILqmPxaazTAZ8PG7mJxR3hfp0SkMTt4HB+69pUOIU8Kz
X-Google-Smtp-Source: ABdhPJxQIDN/ON0wB7E4KFITK5udBsQqanVCMGtDW1Vh3QBXbFQlMhdtKbrkFBBihFj8sUhOKU/Cj339A2D3hMXyxw4=
X-Received: by 2002:a17:902:7611:: with SMTP id k17mr63836364pll.255.1594479194050;
 Sat, 11 Jul 2020 07:53:14 -0700 (PDT)
MIME-Version: 1.0
References: <CACRpkdbccHbhYcCyPiSoA7+zGXBtbL_LwLkPB3vQDyOqkTA7EQ@mail.gmail.com>
 <20200711045441.19464-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20200711045441.19464-1-u.kleine-koenig@pengutronix.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 11 Jul 2020 17:52:58 +0300
Message-ID: <CAHp75VeJh5drwYo+3Q7gUvhBnhsVR-x5czmuFW2N2eWppsg-2A@mail.gmail.com>
Subject: Re: [PATCH v2] [RFC] dt-bindings: gpio: introduce hog properties with
 less ambiguity
To:     =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        devicetree <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jul 11, 2020 at 7:57 AM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> For active low lines the semantic of output-low and output-high is hard
> to grasp because there is a double negation involved and so output-low
> is actually a request to drive the line high (aka inactive).
>
> So introduce output-inactive and output-active with the same semantic as
> output-low and output-high respectively have today, but with a more
> sensible name.

I guess someone needs to proofread the GPIO in-kernel documentation
and update it accordingly. We have a lot of references to logical vs.
physical state AFAIR.


--=20
With Best Regards,
Andy Shevchenko
