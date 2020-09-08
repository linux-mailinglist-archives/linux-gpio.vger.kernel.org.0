Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7DF26261506
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Sep 2020 18:42:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732006AbgIHQmY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Sep 2020 12:42:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33166 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732032AbgIHQmS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Sep 2020 12:42:18 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1673FC0619F2
        for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2020 07:02:16 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id x2so15485312ilm.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2020 07:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/2SewoQNKfdvZ9130x2jsaU2/okRx8tFDqHXaAJPM5A=;
        b=JGVOHbBqWPpU0Q8L9woL1d2GbtrYzS0DIxJiG4Qc526y6YGijYry+9DuHLrGk4AkPh
         HglsW33sBrVqBLvI9Ldp2kiLotwU1516D9ublRTSbn0LX163oAsZQmRc6bBYvnr8MK4w
         b5lQLeL6I9nDr91a0Rn7qLmZLCyLCwF421imiVyR7bzfJ0uEwHIDk776XryoZ9LdO2l0
         9lWCcj0feoWEV4gREwpnhXS9Cwa9rCO3LLtNCxlelLRT9AInUx2swiSZBuGA/b4bPucX
         ttG4115TcL1RGy9WHQ7VfRs5NRWPB5K2DQTRmBAVvfrAVGKtV9f9Tv46q8DKYLBD6foj
         ilKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/2SewoQNKfdvZ9130x2jsaU2/okRx8tFDqHXaAJPM5A=;
        b=S2TMa4NB/CEq1fqXZaRnOJMwFrKTMdPoCvY948xEMiHbBJD/ijUXbLce0NTeodtQpn
         wG8bzR9XayEWGjSTgfzasmEIWLpPR8KvNEGLcOuUhnEXLA4GTJIdI1P4VQnGi4mJe3F4
         0jqUyD36jtudOlqO2OgH9RwkkZN07fGCSkO+1AiRtzsBjm0rfVOPlEUbavwchZSRAbKl
         4UM44YMPDxXfW9xMFzr455AE6O1iX3FADqGwN2qSKnWIkXWdBCFoTxP8K/czKcDDOxPk
         Dmnp6IkE4nAY+tGV4M/wI2eVpuf4I4rORixymC+WJSnDxQmp1LonRCuMQtbqmBNjNAkC
         VISg==
X-Gm-Message-State: AOAM533blpT5wJhrDUu5PzkJDnnOL8wJ6+XS/CGpNCcUeSbOxZvpImPu
        ExlfvvGLu+I5tfDCmbpMYzdfwIMCh/br6BF+cCG7JQ==
X-Google-Smtp-Source: ABdhPJzwsSeBQ9p0c9q0Y8FRcx34We+BdEwhPsmnqyBN9DlgrfGhwepub6Xs5dnl/CskrDY7ZWHiqagdY7hXazz18Nw=
X-Received: by 2002:a92:189:: with SMTP id 131mr24167998ilb.40.1599573733037;
 Tue, 08 Sep 2020 07:02:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200908125813.8809-1-brgl@bgdev.pl> <20200908125813.8809-4-brgl@bgdev.pl>
 <20200908134957.GB1891694@smile.fi.intel.com>
In-Reply-To: <20200908134957.GB1891694@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Sep 2020 16:01:59 +0200
Message-ID: <CAMRc=MdECnhqbRCFAy7hMQrWvF+Vz-rAU1GSD+d85eRSM6L9Lg@mail.gmail.com>
Subject: Re: [PATCH 3/3] gpiolib: unexport devprop_gpiochip_set_names()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Kent Gibson <warthog618@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 8, 2020 at 3:52 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Tue, Sep 08, 2020 at 02:58:13PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > Now that devprop_gpiochip_set_names() is only used in a single place
> > inside drivers/gpio/gpiolib.c, there's no need anymore for it to be
> > exported or to even live in its own source file. Pull this function into
> > the core source file for gpiolib.
>
> Did you miss to remove old file?
>
> >  drivers/gpio/Makefile       |  1 -
> >  drivers/gpio/gpiolib.c      | 47 +++++++++++++++++++++++++++++++++++++
> >  include/linux/gpio/driver.h |  2 --
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Arr yes, rebase failed me. :(

Bart
