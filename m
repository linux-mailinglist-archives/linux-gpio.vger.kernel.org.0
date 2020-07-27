Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AEE922E5A3
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 07:57:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726140AbgG0F5h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 01:57:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726124AbgG0F5g (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Jul 2020 01:57:36 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 739A9C0619D2;
        Sun, 26 Jul 2020 22:57:36 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id s189so8737327pgc.13;
        Sun, 26 Jul 2020 22:57:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ojCM4rcZA96P0+wYCYATBc6LgEm75+hAFgIqDFOegjg=;
        b=JvJ1i2zjXJsDib23ea7V6rVZT/kKvgUOybX3UDQMqhzqDcryWgLk9Aj8IUMQR3fYMz
         W/plEXMdny8Yr9Otjc3GO1Je5BASmH+EA/lzkF+Wv4rQPwsaO3cGK6MZD+DnmWYFnBzX
         WRxDNbftR8UjMHfQanTc+XNBL1UlI9X5ntNI9raYrdEvv6rxe/7d8TEzNU8kiqZ5ziMz
         ijxy4s+U90KbwFcRf1NcK5uFqbdWkK7jC8Z6esQQHeaTQS0FxCGhaCEcI1ma93Gf8SDz
         DhnPneqzENOChiAjvVIFbfE2EO6QrsnQCQB1jobuI3xgP0dHEGCvNWdDhETFdJR+kQ1P
         o0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ojCM4rcZA96P0+wYCYATBc6LgEm75+hAFgIqDFOegjg=;
        b=khtu48akzucTiu4ULsM4RUgMqmgH99c9vSy/s5JLbvasT5uBh8dJVcNhriGi0S1/Fm
         PoOtp6Yr26/mTNwIL59986Wzl23JtZ7Jq/3gFA84xbT1Hz1tNir0kZePqBLoXBS13GSS
         ycZbiw8K81JoLPyD4RW8EKxob8g+UgbMdNJQzu7VsuEJ/9S+OXcNrq35PdcQplyUft82
         0qyB/VolsiIAVsHfmF6DScpyk8Y6eMUnmp1MtD/eg1Y09zxbQQ5xQiKOfVEm1bE8dyuj
         OYw4PSTNsO1UYvZ+w5Cf99P3FY+zDSHTSuisMC8AMe0MK8sNCD/yelXOHgdg2vuZtIB3
         hBVw==
X-Gm-Message-State: AOAM531B283Y+gyQYyhNeS1vI3xtsbCKO1yVDYafX+BHSNxcYrzKM9AA
        dvp0elPu0QZy+U72RqxbzQXxpM5A
X-Google-Smtp-Source: ABdhPJzR4NxrvRgSWdob2lxd/ae6gaoqG9QQ/ksnMfW4dvN/ybo9JIF4mVDcWBGJWczatUjsDVyldA==
X-Received: by 2002:a63:fc09:: with SMTP id j9mr19120254pgi.308.1595829455924;
        Sun, 26 Jul 2020 22:57:35 -0700 (PDT)
Received: from sol (106-69-185-93.dyn.iinet.net.au. [106.69.185.93])
        by smtp.gmail.com with ESMTPSA id f6sm780009pfa.23.2020.07.26.22.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2020 22:57:35 -0700 (PDT)
Date:   Mon, 27 Jul 2020 13:57:30 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2 03/18] gpiolib: make cdev a build option
Message-ID: <20200727055730.GA29606@sol>
References: <20200725041955.9985-1-warthog618@gmail.com>
 <20200725041955.9985-4-warthog618@gmail.com>
 <CACRpkdZymmO9ku5OmCO74eiX3Y3jq_1g5De9Tx4hg3Lyrdt6bQ@mail.gmail.com>
 <20200727014601.GA10761@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200727014601.GA10761@sol>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 27, 2020 at 09:46:01AM +0800, Kent Gibson wrote:
> On Mon, Jul 27, 2020 at 12:25:53AM +0200, Linus Walleij wrote:
> > On Sat, Jul 25, 2020 at 6:21 AM Kent Gibson <warthog618@gmail.com> wrote:
> > 
> > > +config GPIO_CDEV
> > > +       bool "/dev/gpiochipN (character device interface)"
> > > +       default y
> > 
> > I don't want to make it too easy to do this, as I see it as a standard
> > kernel feature.
> > 
> > Can we add:
> > 
> > depends on EXPERT
> > 
> > as with other standard kernel features?
> > 
> 
> Fair enough.
> 
> But what of the GPIO_CDEV_V1 option to disable uAPI V1 added in patch 04,
> and that depends on GPIO_CDEV?
> That is equivalent to GPIO_SYSFS, which is not dependent on EXPERT,
> so I'll need to restructure the dependencies so it doesn't
> inherit the EXPERT dependency.
> Unless you also want it to be dependent on EXPERT.
> 

I've gone with this:

+config GPIO_CDEV
+       bool
+       prompt "Character device (/dev/gpiochipN) support" if EXPERT
+       default y

so the entry is always present in menuconfig, and GPIO_CDEV_V1 can still
depend on it, but GPIO_CDEV can only be disabled if EXPERT is set.

> Hmmm, and maybe patch 04 should be later in the series - after V2 is
> fully implemented and V1 is deprecated - around patch 11.
> 

Just ignore me - the earlier code patches need the define else the V1
will be compiled out.

Cheers,
Kent.
