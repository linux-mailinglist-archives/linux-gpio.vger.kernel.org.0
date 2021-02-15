Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7505C31BA9C
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Feb 2021 14:54:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbhBONyJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Feb 2021 08:54:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230162AbhBONyD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2021 08:54:03 -0500
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com [IPv6:2607:f8b0:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8136CC061574
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 05:53:22 -0800 (PST)
Received: by mail-il1-x12d.google.com with SMTP id y15so5486592ilj.11
        for <linux-gpio@vger.kernel.org>; Mon, 15 Feb 2021 05:53:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oiwOKOJOtlKOkF96Nh2tnr1j3jp46qOvhg59c1F3pU4=;
        b=JKiq/L14XJTaLSzucW8gar2aYADLEMVCryoFu8nABSyWfChhgW7nicTYAmYiJiP5nY
         kAv/AiELsI+RM3fAPxrHxFWd/aAbyYwFTVYfrKVHloM7yzJsmz08cLjvs3HHbtrlxt7e
         gFE3BB2oyaL8P8yjyx+36eMVYxFj0nvnQrUa7C1Znrb48a68A15K4cscair1uuZ4SHjf
         G0fjCI1vxITEvwTM4dGng1JhIlz0UHQnNbVv2IPhddl0bU2AmmoHX3RxBg6rehs8djUx
         zhu56l/W7LMG68n8EwOI+xKKtQ6c/L1L+4+rUT1bzzXFTS5yWh/DlquxszyoLjP5VwQQ
         MhQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oiwOKOJOtlKOkF96Nh2tnr1j3jp46qOvhg59c1F3pU4=;
        b=X1vwkMKBvwzHLx/wuQuUY8uLgtmuR9YQF/8dx3DnpZ24mXILhz/AJBoPsCvndBknjh
         J2PwDQOkjJjBFmU7I4aANFHAdM0eyRyrEzyMk+Qkl3cTOPVMRsvNzjL4E/IGeSxGSoYD
         w4JSojjGB+4H5J0OMeotiH8krxFhQ/RFhOfYyjMUZGjs4QVomH7UjQThpluB5OxIGegF
         CHKBrsSS3WzpboQrijn7NBLfWC4LDKD0omez3fg6cGzTH+bnkqnFi+IwRc4azYMeXomY
         vRgHJb1WkFueq3bqL4sXUH33KlnEXtVvM+lnw6Wx2+8WkstclL+RzJ5P24AlXskd5anm
         0LJA==
X-Gm-Message-State: AOAM531N5FvNIqSzQDAeYfA9Yr/hCPNhERktEOVVaS1rilh5C3XXjqpS
        JqUyh4rTDhxqh5Ort4dW1qp7+UGM5OsOe+4eJMk=
X-Google-Smtp-Source: ABdhPJx2Kgep2Zv8jd5D9tIwLdO2MyjLdfWlj/4xvqIQaIDlphZRMWNEMKfO46SeEtLCbHUJ7bDMCzqEzrhnXN/Q5t4=
X-Received: by 2002:a05:6e02:218f:: with SMTP id j15mr12570397ila.40.1613397202004;
 Mon, 15 Feb 2021 05:53:22 -0800 (PST)
MIME-Version: 1.0
References: <1b1f706b60e4c571c4f17d53ac640e8bd8384856.1613134924.git.syednwaris@gmail.com>
 <202102141226.pmNlFRSx-lkp@intel.com> <CACG_h5q5emgfbf4L-Czfh1GRiTUrx7a+LXCfsxUmQ8YSs1aoKw@mail.gmail.com>
 <YCp7QYTe4nVxS3AK@smile.fi.intel.com>
In-Reply-To: <YCp7QYTe4nVxS3AK@smile.fi.intel.com>
From:   Syed Nayyar Waris <syednwaris@gmail.com>
Date:   Mon, 15 Feb 2021 19:23:10 +0530
Message-ID: <CACG_h5qbeSty16A6zmxAV=Pi=BQ=Su7U7Sb=j1t5_2qZ3ExO_Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] gpio: xilinx: Utilize generic bitmap_get_value and _set_value
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Feb 15, 2021 at 7:16 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Feb 15, 2021 at 06:56:10PM +0530, Syed Nayyar Waris wrote:
> > On Sun, Feb 14, 2021 at 10:11 AM kernel test robot <lkp@intel.com> wrote:
> > >
> > > Hi Syed,
> > >
> > > I love your patch! Yet something to improve:
> > >
> > > [auto build test ERROR on e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62]
> > >
> > > url:    https://github.com/0day-ci/linux/commits/Syed-Nayyar-Waris/Introduce-the-for_each_set_clump-macro/20210212-213005
> > > base:   e71ba9452f0b5b2e8dc8aa5445198cd9214a6a62
> > > config: i386-randconfig-d002-20200329 (attached as .config)
> > > compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> > > reproduce (this is a W=1 build):
> > >         # https://github.com/0day-ci/linux/commit/d83196ca7a23f614773c049b69ce3896679cec61
> > >         git remote add linux-review https://github.com/0day-ci/linux
> > >         git fetch --no-tags linux-review Syed-Nayyar-Waris/Introduce-the-for_each_set_clump-macro/20210212-213005
> > >         git checkout d83196ca7a23f614773c049b69ce3896679cec61
> > >         # save the attached .config to linux build tree
> > >         make W=1 ARCH=i386
> > >
> > > If you fix the issue, kindly add following tag as appropriate
> > > Reported-by: kernel test robot <lkp@intel.com>
> > >
> > > All errors (new ones prefixed by >>, old ones prefixed by <<):
> > >
> > > >> ERROR: modpost: "bitmap_get_value" [drivers/gpio/gpio-xilinx.ko] undefined!
> > > >> ERROR: modpost: "bitmap_set_value" [drivers/gpio/gpio-xilinx.ko] undefined!
> > >
> >
> > Dear All,
> >
> > I was able to reproduce the above 2 build errors with the config file
> > provided and the build command mentioned in the above mail. But I need
> > help to fix the build errors.
> >
> > Scenario:
> > Function 'bitmap_get_value()' is declared in 'gpiolib.h'. It is
> > defined in 'gpiolib.c'. Function 'bitmap_get_value()'  is then being
> > used in gpio-xilinx.c and the build error is thrown. Similar situation
> > holds for the other function 'bitmap_set_value'.
> >
> > How do I resolve the above build error?. Kindly illuminate. The full
> > patchset can be found at:
> > https://lore.kernel.org/patchwork/cover/1380056/
>
> Missed EXPORT_SYMBOL_GPL() or so?

It has EXPORT_SYMBOL_GPL(). But the build errors still persist.

Thanks
Syed

>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
