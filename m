Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B511AB451
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 01:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389758AbgDOXgm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Apr 2020 19:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389729AbgDOXgh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Apr 2020 19:36:37 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F3B8C061A0C;
        Wed, 15 Apr 2020 16:36:37 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id y19so959251qvv.4;
        Wed, 15 Apr 2020 16:36:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DyBvSxNHQKFHMG52K9IQ+iNQABq8LvJ/u2aTFLf/PHk=;
        b=fCTFlPBal7uBT7rD47l2MXcnBrnR5aTAvKPUgGY70CQyna1LA3GxWtwVA7KIwJf05T
         aA7z6hpE3RIhcdQLUbhOAnK3XnGnksh94uHC9QEmF4KTrjZR17U3JTxzjDkXxt7ylXZX
         c5hy3rV8EjHJf4MbTrcb9pTgth7/9fg+KUYH7ta8COPjQkO1hKbPSBRLPoeMVcmdPRKm
         oTKBV+B3+Az0HVtGaZH7nzfjuW2gP555XqALec52O2jn3DxDAGTgLPpHx0LyKoyHGXnY
         6maUkCu45vRHaHli2rzFEYAZr3UYHHwfZfuxITVdIXT6IlDHuCy1mUiHNKfZf3/bqzmm
         iO8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=DyBvSxNHQKFHMG52K9IQ+iNQABq8LvJ/u2aTFLf/PHk=;
        b=YCNICu17ShwgIJt3vpsYXi2y6gc3V6dJVtmHL2zKvXJwZuCFBZrPR2WsehqWVGdn6Y
         wLSWQhvtCn6x16KaGrwo/I0gg2N+9YsXgqqUNOR63iZzmH7i1LN5LXiUMWlw6cf1IVjn
         Jn03mT0S2LmX0Da+RumTceQfPCaq8bToC8a37kL/pHa/7XSJV10PJy95u9qfYWJXQP9q
         oRGplNHSy187jyxKdNft54sygRKfaM6EcvS09AnecW48834LIXC8wuOT02YvbYjgkXJH
         GSmQEB3hYC4YHfbh3S5wQiR4AE6Icy3uJF1OXeaZWRthVkBvDKgqx8/4joF6JQbCJsaS
         KHDw==
X-Gm-Message-State: AGi0Pub+h7mCscAmsyjp/II34zbvehaSdemArQhbpXtgKF31CHVkkibV
        MDjIQ8H855jW1Dg25GbdPqM=
X-Google-Smtp-Source: APiQypI75fzbe52YOA0k1zREwVBpLT6xxF1mrjM1k6cDMdIy8VRfhkmgWQ2fQld5LEfG9fZosWtq/g==
X-Received: by 2002:ad4:4e73:: with SMTP id ec19mr7506716qvb.243.1586993796128;
        Wed, 15 Apr 2020 16:36:36 -0700 (PDT)
Received: from x1 (ip-25-2-52-196.nyc.us.northamericancoax.com. [196.52.2.25])
        by smtp.gmail.com with ESMTPSA id d189sm13854806qkf.118.2020.04.15.16.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2020 16:36:34 -0700 (PDT)
Date:   Thu, 16 Apr 2020 01:37:12 +0200
From:   Drew Fustini <drew@pdp7.com>
To:     Robert Nelson <robertcnelson@gmail.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Tony Lindgren <tony@atomide.com>,
        linux-omap <linux-omap@vger.kernel.org>,
        Kent Gibson <warthog618@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: gpio-omap: add support gpiolib bias (pull-up/down) flags?
Message-ID: <20200415233712.GA16167@x1>
References: <CAEf4M_Du6Egn-3nZHtSnMMwohc+-DyEdtWU5DqSJi71+nDthFw@mail.gmail.com>
 <CACRpkdaPoMGZ7jGh6j4dYexx+qCcoMQ37vS7kbpf=3TtcA9zQQ@mail.gmail.com>
 <CAEf4M_B_sxOiKFnEVUrx00RE2MaMA98LpijNhp0EVY11eRAXHg@mail.gmail.com>
 <CAD6h2NT840zMfwaJatfKzai8QjZEQmF5v0xgE+9ngSJJ+Qy+6g@mail.gmail.com>
 <20200413123921.GA32586@x1>
 <578a51c3-9cb4-91f9-4735-c512bf75553c@ti.com>
 <CAOCHtYg=rM_zP6Wr3bWKfvGpeK7sXLj6GLN3DXSh8JgfqDTcCA@mail.gmail.com>
 <db5e49dc-41b4-2ba5-87b3-f345749d7984@ti.com>
 <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCHtYgNH-OUWdKgKLr7U8Zy2OZb=P9Rpsv4mFii+VwU7h-vGA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 08:59:09AM -0500, Robert Nelson wrote:
> On Wed, Apr 15, 2020 at 8:47 AM Grygorii Strashko
> <grygorii.strashko@ti.com> wrote:
> > On 15/04/2020 16:20, Robert Nelson wrote:
> > > Hi Grygorii,
> > >
> > > On Wed, Apr 15, 2020 at 8:15 AM Grygorii Strashko
> > > <grygorii.strashko@ti.com> wrote:
> > >>
> > >> For this platforms the dynamic GPIO muxing/configuration is not supported, and GPIO block by itself
> > >> does not provide such functions as pullup/pulldown.
> > >
> > > Correct, that's the state today, while Drew is investing time into
> > > trying to figure out how to properly extend this feature into our
> > > platform.
> >
> > Sry, but it's not clear what's the final target (at least from public part of this thread).
> 
> We are mainly targeting am335x based devices.  Today (well last few
> years) we've utilized a "hack-ish" kernel module (bone-pinmux-helper)
> to allow users to overide/change the pinmux-ing directly from
> user-space...  (This evil module allows us to specify a list of
> options for each pin, thus users can easily configure specifies of the
> pin, aka gpio_pd/gpio_pu/etc from user-space...).  Since that time,
> mainline has now grown a generic gpio pull-up/pull-down functionality,
> with the ability to re-control these values directly from a generic
> gpio library (libgpiod).

Hello Grygorii -

As Robert described, I wanted to make us of the new support for bias
flags in the gpiolib uapi which allows userspace libraries like libgpiod
set pull-up or pull-down on lines [0].

Is there no way for gpio-omap to call into the pinctrl-single backend to
set the bias bits (PULLUDEN and PULLTYPESEL) in pad control registers?

Thank you,
Drew

[0] https://lore.kernel.org/linux-gpio/20191105020429.18942-1-warthog618@gmail.com/
