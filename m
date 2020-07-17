Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6CB223B90
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 14:47:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726090AbgGQMqG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 08:46:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726316AbgGQMqF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Jul 2020 08:46:05 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8445C08C5C0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 05:46:04 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j4so10897718wrp.10
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2020 05:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xar4CKwA2Rwnu+ciWE61B48Q/3ub/PHWow40xzzzpjo=;
        b=nvO4V7M0iiy73AUDzO6fNZ/ndWFaaL50qq0vLzM68p7EiTYQGcmayq6a6qoK2+vV7/
         sQqFsSUjwBoMt4XweTMKZ/1DeyYeU676nlIzulPGMZzY73yp9D50sa7Tj4e7KHIaajd6
         pBLAwin/J26jR3tpMeeGgUixpMAfcKtUHHZQrcREwIxf+zM/LeATCbuY46rrCbhEyDG5
         0aVgKsEHklhyREpNHBtseM2yajbyyjXk6g4Hxz780luSt3ZJ9PZMKyaqBlnnvX4HM6Zd
         EZap+9kHHo6bHMgUEd6kNkKD+S+O2cuMvCzgPFyiBduJbeOVTwU+GHEbFcqTYZuG4+uk
         uDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xar4CKwA2Rwnu+ciWE61B48Q/3ub/PHWow40xzzzpjo=;
        b=pLunriOmBPFb+G47D0c78spy/yAR/zwX8CJdKaXdPn/0B9JvRdqqg6Nm6qLspXGr6S
         Jl8LTpnIWVRxJWoRECzJAPvc6EpR5dZlbHBqebLuEpvXwXVqDVpWJbILG1x96cC/fFyK
         w5/PRzKMpg6ruoOobyXcUy63z2CXkCml+mPdxK7+9oiGZ6vXV+F7XHgxqKZmJ91eSeIQ
         nIJgnsVNp+ZrlkOSilPS2NeVdINhNQOPZ4kjTseXdMGchRBhFaCtkDjUN1dwFWsGKW/L
         QyKVIwXvh3HOomm3djihMUpzmFHcTSqBwU5u2y+9wk9xshmL1RMw2dTMS8jJC65Kof4U
         qmEA==
X-Gm-Message-State: AOAM5318tkrD9pjyYhVHhQOrsgHPoX1OrYdHzA9jaZeXqobwk/G3wGIw
        SOw0zlrNpgge3ggLBwzV+jFS7w==
X-Google-Smtp-Source: ABdhPJzB/mmFoX0OVmyFa3FGXmaDcYscGx0QglgVJO4mgGBAkVpi/PKUbjhcYcgugTLFjJXiA9yXHw==
X-Received: by 2002:adf:de8d:: with SMTP id w13mr9909255wrl.129.1594989963283;
        Fri, 17 Jul 2020 05:46:03 -0700 (PDT)
Received: from x1 (220.red-95-125-197.staticip.rima-tde.net. [95.125.197.220])
        by smtp.gmail.com with ESMTPSA id k18sm14473782wrx.34.2020.07.17.05.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2020 05:46:02 -0700 (PDT)
Date:   Fri, 17 Jul 2020 14:45:59 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v2] gpio: omap: handle pin config bias flags
Message-ID: <20200717124559.GA1765997@x1>
References: <20200715213738.1640030-1-drew@beagleboard.org>
 <CACRpkdZ+Bm4MsyaJJ89q7_KfgmyQWyJ57SC3F38gxTbsOfwNTA@mail.gmail.com>
 <20200717124048.GA1765226@x1>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717124048.GA1765226@x1>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 17, 2020 at 02:40:48PM +0200, Drew Fustini wrote:
> On Thu, Jul 16, 2020 at 10:29:30AM +0200, Linus Walleij wrote:
> > On Wed, Jul 15, 2020 at 11:37 PM Drew Fustini <drew@beagleboard.org> wrote:
> > 
> > > Modify omap_gpio_set_config() to handle pin config bias flags by calling
> > > gpiochip_generic_config().
> > >
> > > The pin group for the gpio line must have the corresponding pinconf
> > > properties:
> > >
> > > PIN_CONFIG_BIAS_PULL_UP requires "pinctrl-single,bias-pullup"
> > > PIN_CONFIG_BIAS_PULL_DOWN requires "pinctrl-single,bias-pulldown"
> > >
> > > This is necessary for pcs_pinconf_set() to find the requested bias
> > > parameter in the PIN_MAP_TYPE_CONFIGS_GROUP pinctrl map.
> > >
> > > Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>
> > > Acked-by: Tony Lindgren <tony@atomide.com>
> > > Signed-off-by: Drew Fustini <drew@beagleboard.org>
> > 
> > This v2 version applied!
> > 
> > Yours,
> > Linus Walleij
> 
> Thanks! 
> 
> I'm curious which branch should I look in to find it?
> 
> I didn't see it in any of the branches in:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/refs/
> 
> -Drew

Oh, nevermind.  I found it in linux-pinctrl:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/commit/?h=for-next&id=40e30d26d909af89de2dcd0b4abdd27c47ac2235

Thanks,
Drew
