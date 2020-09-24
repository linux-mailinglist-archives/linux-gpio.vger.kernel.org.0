Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789AB276AD7
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Sep 2020 09:32:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727167AbgIXHc6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Sep 2020 03:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727116AbgIXHcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Sep 2020 03:32:55 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02DEAC0613CE;
        Thu, 24 Sep 2020 00:32:55 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id bw23so1221209pjb.2;
        Thu, 24 Sep 2020 00:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=wCf+QhexYFIQT3w8LxppMWRLoN4H9bkTSLyN5aaQq1g=;
        b=lWfUjiptkJvwyIx8YLHVoN69kKhB/G1SmddMeak87IxKgCfBLvopztUNBgxIU5RRt/
         u6GhMuSz+C/cCe21/G6VCs1nw0rdVq5FMi00oYFLg89P8ULxyjCzNe/7xXyWvkbtSWMm
         fijKgsjO88uWiM83/kfpE/JWNWvjcwxF2nMdls4qj/lq/V9GAKddE7k18qkTq+dROsoJ
         c8rlw2bmg+gNxU4crEErb4IjuTfk+YyKQLkt1RuMKEJlcNR5KjeGpFmqa/wJlQgLRgXz
         aKNXUIHNern5yA8bRqkA0m5tNxKQz+tT5G+btB25ZXHy8I94/wY+lkTJGNZqYeivuC7z
         5SiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wCf+QhexYFIQT3w8LxppMWRLoN4H9bkTSLyN5aaQq1g=;
        b=a3utZOUJuVaet40yLolp6FuCg0FQj1mB1ts2vYKfLSQ8pN+P4ya1CmedESKdIGIiLv
         9chhK4w8uS16neiIdkUfMs4I7D4gGbid8xg2+wGkmnnGagdHBBe9Du8Q+GQPGwUoirQH
         6OibhkeUlNwbOET3s/SG79lhEHek0bu0K8/PPutsvh2ekG3kLGtTIr01h+wpsISK9NS9
         FuUO+ak6HttcVcF6hQvGUuX2qjDq6U17ECrX3VvTq9wt7o3o+V5t3+tClYERleDzRuKw
         z/Nmkl6bLWCtNqQslPogRPxySLYlFSMqcRbYOnzqp0FO39DGKXKKeShY+N5V/TpF/94U
         HKoA==
X-Gm-Message-State: AOAM531F5cR6yMfCnsKmyW5eIF8yPpvGUusRc+/2PkkxIEBZZAsGsAZP
        UffVIwM/BN0qInbhgaj/MwolJl2KwT07ug==
X-Google-Smtp-Source: ABdhPJzeHM0ROws69Yr8XCYD2/iShfs9CcsHkwYdfCh/yf5PhkB5+LfcPlAXy8q2hnQQUUJPYwcPFQ==
X-Received: by 2002:a17:902:7889:b029:d2:26da:7c13 with SMTP id q9-20020a1709027889b02900d226da7c13mr3244783pll.38.1600932774386;
        Thu, 24 Sep 2020 00:32:54 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id o20sm2043348pgh.63.2020.09.24.00.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2020 00:32:53 -0700 (PDT)
Date:   Thu, 24 Sep 2020 15:32:48 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 11/20] gpiolib: cdev: support
 GPIO_V2_LINE_SET_VALUES_IOCTL
Message-ID: <20200924073248.GA17562@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-12-warthog618@gmail.com>
 <CAHp75Vd6tb09n+okJmoPse992DeoPkJQHReNBo20FQNz1V2c5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd6tb09n+okJmoPse992DeoPkJQHReNBo20FQNz1V2c5w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 07:18:08PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 5:36 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > Add support for the GPIO_V2_LINE_SET_VALUES_IOCTL.
> 
> > +static long linereq_set_values_unlocked(struct linereq *lr,
> > +                                       struct gpio_v2_line_values *lv)
> > +{
> > +       DECLARE_BITMAP(vals, GPIO_V2_LINES_MAX);
> > +       struct gpio_desc **descs;
> > +       unsigned int i, didx, num_set;
> > +       int ret;
> > +
> > +       bitmap_zero(vals, GPIO_V2_LINES_MAX);
> > +       for (num_set = 0, i = 0; i < lr->num_lines; i++) {
> > +               if (lv->mask & BIT_ULL(i)) {
> 
> Similar idea
> 
> DECLARE_BITMAP(mask, 64) = BITMAP_FROM_U64(lv->mask);
> 
> num_set = bitmap_weight();
> 

I had played with this option, but bitmap_weight() counts all
the bits set in the mask - which considers bits >= lr->num_lines.
So you would need to mask lv->mask before converting it to a bitmap.
(I'm ok with ignoring those bits in case userspace wants to be lazy and
use an all 1s mask.)

But since we're looping over the bitmap anyway we may as well just
count as we go.

> for_each_set_bit(i, mask, lr->num_lines)
> 

Yeah, that should work.  I vaguely recall trying this and finding it
generated larger object code, but I'll give it another try and if it
works out then include it in v10.

Cheers,
Kent.

