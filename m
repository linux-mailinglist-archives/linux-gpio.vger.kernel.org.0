Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05D882FAE07
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Jan 2021 01:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732002AbhASA2f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 19:28:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726514AbhASA2f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 19:28:35 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 140D9C061573
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 16:27:54 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id y8so9521435plp.8
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 16:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7ttrxZQaWJhJ31CSkjG6Uzhqkcv7xh259WI9iSrEfZU=;
        b=LH/Q8ZX5MyLlfCOuJd6BgfVUcPEyVRB0nymHcatbhPPIgVUndAAEGbdnvyDc5XwRge
         3m4s9XyrbFrHwwnSDxpMINCJw7mc0FyRSEi+agVowMI+26omse56EcW8rF43ISiwYXtC
         uAuDjxq6da1dZlzJb2OKqFwYatZLBPVuHrrMVW7WkshdBPvZmPB4qsJ75QusiABLiHnK
         XB1pNOrlEM9CYOz3qlVovsJSM++UkB1YGEBlTUC/U1/EOLZi0esuE4MP2wTiH/0oC4nj
         0pDDUsm7B+sr1T0yvsveoRN89mHpSxlRwiOodW7PX9UctzlABJXm3u+ttjycRCFaD+Mz
         P2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7ttrxZQaWJhJ31CSkjG6Uzhqkcv7xh259WI9iSrEfZU=;
        b=oJReQCKhuu6VEOHju26D0IiIs8P9FuPlhSjvKiLw3AnjxNdW0Ln3r6N5VhKE8BeqPo
         PiJcRpRZ6m8OW5GEeYlC3ye8A3eb/Ry1Y5CxXKaTw/Ir5JKWSXd0noArQJEQzTlnZ/w4
         vHPansi2mKyJ5habptAPJplH6DtpyibQhPctTHsMx0b165zeN9CNlK9bwRKjP8ldBBi5
         M/7tEhIeknSWCQML4y+pOnwZf7NC/4L0Yxdj9V3b3/QFHV5NhbXUfkFWugJNREB+Zze4
         345Y3g0C5pAyV9HKxzGCRIa/fu6P/fItuAukGCeNn/fFvsFtu1NiUBUm15EKyb0MnL9M
         EVug==
X-Gm-Message-State: AOAM530OU17Sif5xiOL8jGob/BF3A4Xr6QJYPT+GeEI9TQtGzJTkymyE
        ENDzea/rqusaO5yORM5N4tILJuVPBxI=
X-Google-Smtp-Source: ABdhPJxqqzLJ+TTJO8qdt7NbjduCV9xdpzcLi2sv/5DZDhDxp/wlHhIqblKw5FlRXKtKMjhIVDLgkQ==
X-Received: by 2002:a17:902:b717:b029:dc:3e69:80e8 with SMTP id d23-20020a170902b717b02900dc3e6980e8mr1854920pls.40.1611016073579;
        Mon, 18 Jan 2021 16:27:53 -0800 (PST)
Received: from sol (106-69-181-154.dyn.iinet.net.au. [106.69.181.154])
        by smtp.gmail.com with ESMTPSA id m16sm534608pjv.25.2021.01.18.16.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jan 2021 16:27:52 -0800 (PST)
Date:   Tue, 19 Jan 2021 08:27:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH v2 3/7] treewide: rename BIAS_AS_IS to
 BIAS_UNKNOWN
Message-ID: <20210119002747.GA5169@sol>
References: <20210115103018.27704-1-brgl@bgdev.pl>
 <20210115103018.27704-4-brgl@bgdev.pl>
 <20210118000738.GB6841@sol>
 <CAMRc=MeD3r0Z50kn8_ZW9PXi+=yf-fHYAHL_KYXoY-DXDUYHMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MeD3r0Z50kn8_ZW9PXi+=yf-fHYAHL_KYXoY-DXDUYHMQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 18, 2021 at 12:40:11PM +0100, Bartosz Golaszewski wrote:
> On Mon, Jan 18, 2021 at 1:07 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Jan 15, 2021 at 11:30:14AM +0100, Bartosz Golaszewski wrote:
> > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > >
> > > When inspecting the current bias setting of a GPIO line, the AS_IS name
> > > of one of the possible values really means that the kernel uAPI can't
> > > determine the bias setting because it didn't set it itself. In this case
> > > it's better to change the name to BIAS_UNKNOWN to reflect that.
> > >
> >
> > Your checkin comment incorporates some of my review comments, which were
> > actually a bit sloppy.  While I didn't bother to correct myself for that
> > email, I'd rather the checkin comment be more precise.
> >
> > Specifically, I was conflating gpiolib and the cdev uAPI.  If the bias
> > is set via gpiolib then the uAPI will report it correctly.  If it is set
> > otherwise then the setting is unknown to gpiolib and therefore the uAPI.
> >
> > And I'm not sure if the DT example that I used in that email was a good
> > one. But say the hardware initialises with pull-up enabled.  If it hasn't
> > also been set via gpiolib then it will be reported as unknown.
> >
> 
> Which makes me wonder whether we shouldn't add a get_config() callback
> to drivers in gpiolib for that because some controllers allow you to
> query their current settings.
> 

I've thought the same, but until all the pinctrl drivers support it you
are still going to be returning unknown.  So you still can't provide any
guarantee that the information is available.  And as such is it any more
use than just requiring the user set it explicitly? And if they really
care about the bias they will probably set it anyway.

> ---
> When inspecting the current bias setting of a GPIO line, the AS_IS name
> of one of the possible values really means that the kernel GPIO subsystem
> can't determine the bias setting because it didn't set it itself (e.g. the
> hardware may have internally initialized pull-up or pull-down resistors).
> In this case it's better to change the name to BIAS_UNKNOWN to reflect that.
> ---
> 
> Does this sound good?
> 

That works for me.

Cheers,
Kent.
