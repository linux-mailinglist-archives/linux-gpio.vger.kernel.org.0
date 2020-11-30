Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F542C8AA0
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Nov 2020 18:17:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387393AbgK3RQv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Nov 2020 12:16:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgK3RQv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Nov 2020 12:16:51 -0500
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F519C0613CF;
        Mon, 30 Nov 2020 09:16:11 -0800 (PST)
Received: by mail-pf1-x441.google.com with SMTP id x24so10818000pfn.6;
        Mon, 30 Nov 2020 09:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xyuaUQNlZ+Wr7lRf3nZ/9q8iV++QMK7ihsb3scweM/4=;
        b=LJo645cu6Dc21q6H5tXRhmsxSmDTrudgcosig/TUZDRaag8cGD9K422OZUx3VsCxyv
         4F7IJt+uc3vU7/vMMSaBd1+XYk0zsuc12yQ0l42z/m2fjw1q9ynqj9mmu6+kpy2f6F5g
         h1Q2AJfLsmbue83/DIxV9TrVf+Lu1v8i7ovW4iHKnGU3I/ibmIyFQe4jn8Ip296IkuwF
         C8f+PAlfM+zWccJJ1FNB4hCf3vKibwulko4llqzM+ESRqQwxnt9zNVRo/eWtnejuFXw3
         fpadnP5Y/znsCDxRR326J2afDg4yLeCIgyGTsSvCbID374EGQyOCOdvnvRdXyo7dHMKJ
         ub3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xyuaUQNlZ+Wr7lRf3nZ/9q8iV++QMK7ihsb3scweM/4=;
        b=GWcMS5y0RnyaWC1ZyHsP2zX4eqrlw0XnC0RXw3Ef3KYl/MG9C1v9rSEValinvj27Z/
         1rRmU3LI1zXoLDVYVdI3Sm3kNKOhOrgz/Dra2tPpg0eQbwG3mwoy4TPpD+Hk1CyVpNGZ
         7NTYjilwl9t9F6A4w5pmDrlAZ5taKm/T08rKqpn4I/s1FaG0JnnB5N6ne0HRhtmwFlef
         ust8HHnTwo7+GeTbFnprpLN8I7JsxtWKRKz9DC6lixiFWJ0OtgftMYtBnM9fwjCUymkC
         P3ptgPXZtRrkWnrNuhTLt5gP2srPxSsGlTUv43iBCrYFuwzEpPdq0swgKuPenm+CcVeL
         bV5Q==
X-Gm-Message-State: AOAM533GGAf1YsR0uBwWTFgkptR1caW5cfKo2I6enhJu/ltkKUYVGted
        BtQ8GvkjS/8+TkyMN3VWwaSBK0wQSLJL42pP+vE=
X-Google-Smtp-Source: ABdhPJwbYAjaHu4+YFGhnmxvHBwRcaj9DcadlyfYub6DkQF9J3079948EtG5DH1IdaDWYfjUs60QN1FtmQGU8XGwiH8=
X-Received: by 2002:a63:1514:: with SMTP id v20mr18729291pgl.203.1606756570899;
 Mon, 30 Nov 2020 09:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20201119142104.85566-1-alexandru.ardelean@analog.com>
 <CAHp75VdkomLMPYZbB7-KerGmyxXxB8hQuAjLtJ0bhB5f5vfuNA@mail.gmail.com> <CAMpxmJXbpiiKzxsrBk5mdLf1Kk5_-5pwJYOeCsTTqKmS2QUMTQ@mail.gmail.com>
In-Reply-To: <CAMpxmJXbpiiKzxsrBk5mdLf1Kk5_-5pwJYOeCsTTqKmS2QUMTQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 30 Nov 2020 19:16:59 +0200
Message-ID: <CAHp75Vd=S26VgrkcQoMN=xFburOn8207MUYbGzMBLHgn0iuErA@mail.gmail.com>
Subject: Re: [PATCH] gpio: xra1403: remove unneeded spi_set_drvdata()
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Alexandru Ardelean <alexandru.ardelean@analog.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nandor Han <nandor.han@ge.com>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Nov 30, 2020 at 6:37 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Thu, Nov 19, 2020 at 4:04 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Thu, Nov 19, 2020 at 4:17 PM Alexandru Ardelean
> > <alexandru.ardelean@analog.com> wrote:
> > >
> > > There is no matching spi_get_drvdata() call in the driver, so there is no
> > > need to do spi_set_drvdata(). This looks like it probably was copied from a
> > > driver that used both spi_set_drvdata() & spi_get_drvdata().
> >
> > While above luckily (*) okay it may not always be the case.
> >
> > *) it can be paired with dev_get_drvdata() which is usual for PM callbacks.
> >
> > With amended commit message
> > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> >
>
> I applied this patch. I wasn't sure exactly how you want the commit
> message to be changed - it sounds pretty clear to me so I took it.

For example, by adding " or dev_get_drvdata()" to the end.

-- 
With Best Regards,
Andy Shevchenko
