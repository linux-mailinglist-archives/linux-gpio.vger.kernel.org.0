Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C2FF223DDE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 16:14:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgGQOOu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 10:14:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgGQOOt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 10:14:49 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58BE8C0619D2
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:14:49 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id i19so911585lfj.8
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 07:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vGd1t1QreFxRnPFXLOAZur94ZKOwnafzOlJY/eNNGd4=;
        b=g5f9FXQqNRFZ1O7UHe3/2MVHxdS/LKA46yykIEWVD2HMezPTWoWB+kWtc6quXMBI1J
         eg230C4qGwesk1w6z1vR9vNK2IzpedhC6ipybTCnRn8NZSNiAnKuRHFAI7acuJ0vb9KI
         keMTCTOVT/A3mOmAS0IIFOf4ttkuxyKh8K1AFbLWWr5kMP7zz2qHzj5rFPdPxuKfdMSo
         +f0BTG4zMZMrU4IQJsgtSUAgUcAQOT3T6sqq4Ymr6OVBS7GvXv1mQZuJ57nr0zM6bpNu
         wQU1uP/Nwk2sDINBtgfst7eJhtZs0/AKcuk0mnzd2+J2c0OcgR6rhHT5usIuwa2lu/Bb
         GPgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vGd1t1QreFxRnPFXLOAZur94ZKOwnafzOlJY/eNNGd4=;
        b=OH7LtBZPAfxWfpkO/usSbpsXzvLH01bbo4sA7EKH4/Qp/Dg1YHdHpgu+smTO6IJSNz
         oQDrJo39XfCeLW3sg9jG3Ytg9nWDCqe13TQIJ2rX47xkVUwDGYYVG3F6rS5QPiSTo4EG
         QSutIRDXsZg91JeEJvo4eM+nSFFUl9M9dMaEfwmLszp4cHiTbPd9WN2+MbbgBMiEEdzj
         hhqeIw37AeUHfbku3IfRpyB0Rki75J/GZUGmrKrfj1W7AXYi2NHxIzAZ58oITs7NcM3I
         9IhZqq/363TvVKKF1t0nxvsrj3QVOC4k1Yj8cFR9Y9N/r8o4EW6PEDMV1+pzLcbWOYbP
         WPhA==
X-Gm-Message-State: AOAM531LCGzs99N70MIzahLMEO5ZlxOyuO8Mlp67oUaP2VTcHTR1FZlx
        pu3mcZvyehy4yZC7HybN8pFH9Z51q0r7tE+lQ9ijaw==
X-Google-Smtp-Source: ABdhPJyxXeaa7xBz0oSWjZzcy28PSGVQ9B09iJsameEOskWCvOl+OAOeOwBR4Hdk+FDkI6C2AVrnSug4741YgtN03tA=
X-Received: by 2002:ac2:47ed:: with SMTP id b13mr4771331lfp.21.1594995287800;
 Fri, 17 Jul 2020 07:14:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200717112558.15960-1-linus.walleij@linaro.org>
 <d97d8c70-528e-f06b-3bf6-4faf51857a9c@redhat.com> <fb6bb42b-b657-5cd7-7a58-236e10bfb547@redhat.com>
In-Reply-To: <fb6bb42b-b657-5cd7-7a58-236e10bfb547@redhat.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 17 Jul 2020 16:14:36 +0200
Message-ID: <CACRpkdYJ=z=bE-twSXG=zARdq5zDNqpwwS8amBQs2tXVY7Osag@mail.gmail.com>
Subject: Re: [PATCH] gpio: crystalcove: Use irqchip template
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 4:02 PM Hans de Goede <hdegoede@redhat.com> wrote:

> Erm, it does not even compile:
>
> drivers/gpio/gpio-crystalcove.c: In function =E2=80=98crystalcove_gpio_pr=
obe=E2=80=99:
> drivers/gpio/gpio-crystalcove.c:357:10: error: =E2=80=98ch=E2=80=99 undec=
lared (first use in this function); did you mean =E2=80=98cg=E2=80=99?
>    357 |  girq =3D &ch->chip.irq;
>        |          ^~
>        |          cg
> drivers/gpio/gpio-crystalcove.c:357:10: note: each undeclared identifier =
is reported only once for each function it appears in
>
> I've fixed this up locally.

Thanks, the SOC_PMIC isn't in the Intel default build, and you know
me and Intel ...

Sorry for that.

Yours,
Linus Walleij
