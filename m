Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D434F29906D
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Oct 2020 16:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782956AbgJZPE1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Oct 2020 11:04:27 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:33191 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782732AbgJZPE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Oct 2020 11:04:26 -0400
Received: by mail-pl1-f194.google.com with SMTP id b19so4878141pld.0;
        Mon, 26 Oct 2020 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AbLsbm02Lh+z37x0H0yu85jzJjOQgE7KPLtNhac1AZI=;
        b=vCDZr4GXaSEFbiAljxRmLSiQ7mJykVLaWEDYtAN0yM1vCPRaRJRMF2pGjsZaYpKp7E
         5feHiepcYZXlArUd/yht+hY3RWhBd+wFNRdeyRwmaucd+DFJxQo+HrCPu9eAm0vfZD9u
         5eU9zM3Kn3ypuU3wfQtywq0S2IwC8IX/ja0IQ1/LbFEu57b1UjlyRvpDG0reWzPNQclE
         YIlWVu7Jmogbt/11so6O+41F0jVwzNNqndNHrxk6yrbivUrCarPpJrC/IAzggJKVBQkh
         VdEP6MJ1oevGVgTXqyn6IvPw1K4MoCwCh4aZv6IRCMDQ+59hMu3h3a7gvdDMLvPAA9JS
         FKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AbLsbm02Lh+z37x0H0yu85jzJjOQgE7KPLtNhac1AZI=;
        b=VJ4OJWB/ZPcIHG+zOzLR24IxKDgb5JWO1WRqchJdTINVkbLtqOjyDygJ+mzh674nr5
         WIuTtVuYWyS/eur3J3RsAXh9HFUQrle/ob7puW4q22nHmyXR7t9ZZSnojmel0utKRwx/
         z33kSuVF8zHpMyDTda3QgYBzdXXzxV3f7Fkp2I8CgHVP5Vf8FRMTFk6ycUZ6kIS7+llt
         KQczpfMIzPXSif83zZ8M1kHoOwPsga9MesFJ4XrqC5iId1GGqz2A3HUg65RVQkE7+OPa
         pwJru97krjrS9fit0nQt8jAU4KMv6fVZegTiFGqj+Si/l4rlC5VWsV0y5lv8i3n0XnZ2
         eZow==
X-Gm-Message-State: AOAM532kEaQ9iW4aYrOloA8TWcXKWMBPH4XQdch10CZcs1c35n+PVqDT
        PwAEPqS0gEByeYdEdFV7hh+F4IlGM4c7eIqG7A8=
X-Google-Smtp-Source: ABdhPJyGLpj0bfD54rlt29Jq2CAHLKMzKIQgDfG4efVD540s+GK+/sAolciF/zSSICRvNxKkpeQEpF29/XiFr64cV3k=
X-Received: by 2002:a17:90a:fb92:: with SMTP id cp18mr21134657pjb.228.1603724665896;
 Mon, 26 Oct 2020 08:04:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201026141839.28536-1-brgl@bgdev.pl> <CAHp75Vf07dsUXZ8Dr-KY-NFQv+C2QQVEOH_se7vYMT6hdm-U3Q@mail.gmail.com>
In-Reply-To: <CAHp75Vf07dsUXZ8Dr-KY-NFQv+C2QQVEOH_se7vYMT6hdm-U3Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 26 Oct 2020 17:05:14 +0200
Message-ID: <CAHp75Ve5d3acvsLoVckrAEh7+PeQWjeA29UqwjOyiXMG+HDF1Q@mail.gmail.com>
Subject: Re: [PATCH 0/7] gpio: exar: refactor the driver
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jan Kiszka <jan.kiszka@siemens.com>
Cc:     Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 26, 2020 at 4:46 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Oct 26, 2020 at 4:22 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> >
> > I just wanted to convert the driver to using simpler IDA API but ended up
> > quickly converting it to using regmap. Unfortunately I don't have the HW
> > to test it so marking the patches that introduce functional change as RFT
> > and Cc'ing the original author.
>
> +Cc: Jan, AFAIR their devices are using Exar UART.

From code perspective looks good to me, FWIW,
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

(One nit to one patch, but I think it should be fine)

> > Bartosz Golaszewski (7):
> >   gpio: exar: add a newline after the copyright notice
> >   gpio: exar: include idr.h
> >   gpio: exar: switch to a simpler IDA interface
> >   gpio: exar: use a helper variable for &pdev->dev
> >   gpio: exar: unduplicate address and offset computation
> >   gpio: exar: switch to using regmap
> >   gpio: exar: use devm action for freeing the IDA and drop remove()


-- 
With Best Regards,
Andy Shevchenko
