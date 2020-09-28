Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14A027A9D7
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 10:44:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726547AbgI1Iov (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 04:44:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726526AbgI1Iov (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 28 Sep 2020 04:44:51 -0400
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 314A8C0613CF
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 01:44:50 -0700 (PDT)
Received: by mail-io1-xd42.google.com with SMTP id r25so325312ioj.0
        for <linux-gpio@vger.kernel.org>; Mon, 28 Sep 2020 01:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9fayrMke/iMmL3S1m48cDdbLjSvfbjD1pPfIEkjq4r8=;
        b=fOnaGR3EiaURi1YbQBb1q+WGvG+oxcSl2yIiXnZXMLCOY7oS09bbAPxAN2EAfJEfLr
         xbZDIb5WUd5rAqBcTr8bCpkyOeJtRcY/NcZZEUP31NaA3vmlggQRBoSw0Q82khu7nq/I
         dsZuTwne4Oj4sXF105YDIiDOhYUFwmAALQ6la35k/BVkngr+OYaFtfz/8V2mL5swMzT+
         TJKhRUBMHLjvD3mtUqZLjbnH5iu/qC6JV9UClNEriSU9rAhgyLQeXfYbqoxrrVVU2Yr7
         rW1vaJHMQtZcW9T7NcTayiYvPNBzC7xBNLJ6O+vI+g6Nr/I0M6mZ2VWYjLc6sWwqMJ+j
         3e1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9fayrMke/iMmL3S1m48cDdbLjSvfbjD1pPfIEkjq4r8=;
        b=QJ0YuWmtteZIifg/QH1typu/SSn/6x4ULA/Af9zC4+tWLrc4wbTBmeGsvGhB3q0x+D
         f1skUu+iedVQ60MIrnAFrd87dK24ye/OISxLmRPMwe2Gfc84Utl950/9bfXOoTaQZHw1
         xhK4+Rdoc05D2yMtw2EEoGQxCNF3mysPBSgDIUwJcipkNHlqKc77bhF+YIwX0ekhdIIY
         JC2/M7GGTDzf5bt1XwEniaquK1KSvWNe5EGZ7i0w5u2h5qiTfsPJCG+oytzd5/iibmIl
         5OAr6+HB4bEskuB09TQfJK5d/nc6JNBJK74LOpl6NOPhgpSOiAQPeCYg6MAO8VgSlQk/
         uA2g==
X-Gm-Message-State: AOAM532wAOr5Z3mJko6jdAoZQOm4owj3VknY9pMIoIkCVAMn/o2/bOxn
        V0OoUyJT3O34avX7CzVXdIROq9TK7JH0px6BCHdj3w==
X-Google-Smtp-Source: ABdhPJyrLZMUXptlIkp7DAvbxVDjU2XfeRgHkmsku/FQbNMxC9CMqd1e1XHuvzm2Hk9b81beBAOnDyl/9H44WrcTtRc=
X-Received: by 2002:a5e:8c07:: with SMTP id n7mr6506942ioj.130.1601282689564;
 Mon, 28 Sep 2020 01:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200924113842.11670-1-brgl@bgdev.pl> <20200924113842.11670-9-brgl@bgdev.pl>
 <20200925090329.GZ3956970@smile.fi.intel.com> <CAMpxmJWBSwofFy94mHZWB2mdvHGStYp5oLDZp2M+wO57t40HSQ@mail.gmail.com>
 <20200925123000.GD3956970@smile.fi.intel.com>
In-Reply-To: <20200925123000.GD3956970@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 28 Sep 2020 10:44:38 +0200
Message-ID: <CAMRc=McfBLaE=N12z29JjTDJ0ABzC8OW4rPWeeSU82kag+9pgQ@mail.gmail.com>
Subject: Re: [PATCH 8/9] gpio: mockup: use the generic 'gpio-line-names' property
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Kent Gibson <warthog618@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 25, 2020 at 6:41 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 25, 2020 at 01:40:10PM +0200, Bartosz Golaszewski wrote:
> > On Fri, Sep 25, 2020 at 11:03 AM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Sep 24, 2020 at 01:38:41PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > >
> > > > GPIO line names are currently created by the driver from the chip label.
> > > > We'll want to support custom formats for line names (for instance: to
> > > > name all lines the same) for user-space tests so create them in the
> > > > module init function and pass them to the driver using the standard
> > > > 'gpio-line-names' property.
> > >
> > > ...
> > >
> > > > +             if (gpio_mockup_named_lines) {
> > > > +                     line_names = gpio_mockup_make_line_names(chip_label,
> > > > +                                                              ngpio);
> > > > +                     if (!line_names) {
> > > > +                             platform_driver_unregister(&gpio_mockup_driver);
> > > > +                             gpio_mockup_unregister_pdevs();
> > > > +                             return -ENOMEM;
> > > > +                     }
> > >
> > > > +                     properties[prop++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
> > > > +                                             "gpio-line-names",
> > > > +                                             line_names, ngpio);
> > >
> > > Forgot to update GPIO_MOCKUP_MAX_PROP?
> > >
> >
> > No, there are still three properties: chip-label, nr-gpios and
> > gpio-line-names. Same answer to patch 8/9.
> >
> > > > +             }
> > >
> > > ...
> > >
> > > > +             kfree_strarray(line_names, line_names ? ngpio : 0);
> > >
> > > Perhaps you may check for NULL pointer in the kfree_strarray() and drop ternary
> > > here?
> > >
> >
> > I did in the previous series and you told me to not to. :)
>
> Hmm... What was my argument? What was wrong with me? free() should be NULL-aware.
>

Well, it is - your just need to make sure ngpio is 0 too. :)

I'll revert back to having the NULL check.

Bartosz
