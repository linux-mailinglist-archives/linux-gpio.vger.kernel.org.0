Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA073438E7
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 06:57:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229696AbhCVF5C (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 01:57:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229614AbhCVF4e (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 01:56:34 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 728D6C061762
        for <linux-gpio@vger.kernel.org>; Sun, 21 Mar 2021 22:56:34 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id e33so7915136pgm.13
        for <linux-gpio@vger.kernel.org>; Sun, 21 Mar 2021 22:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6R/wNYFYL96Z+W2s9fNrnXnmsOpLl/kcJR1fGSVoiEE=;
        b=kM9YBllT/tpxQ5AJXgkZE9dXlxkqQ8pj1Bypm9bDNdAj4gMOA2VjzOKIbP9gb67NWT
         Rv8mh0S7FL0PD6EyQBhZGtAptOBRPwWgB0SE3VMrxV08EXACUWyDmpgIEPnd+Ou79uk4
         P8fFmtn2SWBeDxPj+8yaRQDra6q5l49j6pHZ0L2TRFXCEO0xcdMXsxKW6GBLRvAU1RAa
         9bdVT4MDKxNDkljMnFO3XPjmEOqVhQ8il4eKMneqbdIsPVpu0mn04pASD4Yp/Gd4X/wK
         bYLRAO+DwCW4YZNpr7+1tRSytQlmc4X1zlQQXrBwWPlynA3jo0SoY4z7WJPvr9dcpETR
         Z6Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6R/wNYFYL96Z+W2s9fNrnXnmsOpLl/kcJR1fGSVoiEE=;
        b=MhGxPxbnzlVA1Af7sTdV2tM2TojH0/4corrzLufy3H503eyY3RVTxKrJgCImg3gsx6
         GfgDtJngRWG5K2paMXhSBXSKq5RgsA+J3Iho1aD2ntgNnZP8m9qEaN0+y05n7M4YlGCr
         vsIND56WNlk2oaQ4o4NANhVGrBua+S6MhhVhGRrVB/A442SE8G7/uIFhkDaTeAGgoCur
         jmUS/AJ2OAGR6SecGv6DqZVzjG/WR6gdLXGU8tU6lS2e8/j2CRAQlyxYy2OwSn8/w/K5
         R5Zy+vYmGl/cXWr2hWd3//vSCYsC7EwK9f7td7g06eZrOcmEsL9tY7EEYsoaNDTxYpS3
         QLZg==
X-Gm-Message-State: AOAM531eyQ4K1gGcP+fswY+bqqrE1gi5DZSqlAkQdsd/m4KkKW3GsD4n
        TD1IUQHrcNf3Uvo7O3fM4TSmA4W5RKAKOXp6
X-Google-Smtp-Source: ABdhPJxKPdwcHLkk2BXaAkgeR/I9gBqO0bAm+q641P1HXjHdb70nXU62Q5IG3INGo0Ws0CuSdraeQg==
X-Received: by 2002:a65:4288:: with SMTP id j8mr21082631pgp.231.1616392593821;
        Sun, 21 Mar 2021 22:56:33 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:f583:1360:2cc8:3c30])
        by smtp.gmail.com with ESMTPSA id l22sm13200080pfd.145.2021.03.21.22.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Mar 2021 22:56:33 -0700 (PDT)
Date:   Sun, 21 Mar 2021 22:56:31 -0700
From:   Drew Fustini <drew@beagleboard.org>
To:     Hanna Hawa <hhhawa@amazon.com>
Cc:     andy.shevchenko@gmail.com, tony@atomide.com,
        haojian.zhuang@linaro.org, linus.walleij@linaro.org,
        dwmw@amazon.co.uk, benh@amazon.com, ronenk@amazon.com,
        talel@amazon.com, jonnyc@amazon.com, hanochu@amazon.com,
        tgershi@amazon.com, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Fix pinctrl-single pcs_pin_dbg_show()
Message-ID: <20210322055631.GB392062@x1>
References: <20210319152133.28705-1-hhhawa@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319152133.28705-1-hhhawa@amazon.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 19, 2021 at 05:21:30PM +0200, Hanna Hawa wrote:
> These patches fix the pcs_pin_dbg_show() function for the scenario where
> a single register controls multiple pins (i.e. bits_per_mux is not zero)
> Additionally, the common formula is moved to a separate function to
> allow reuse.
> 
> Changes since v3:
> -----------------
> - define and set variable 'mux_bytes' in one line
> - update commit message
> 
> Changes since v2:
> -----------------
> - move read() register to be outside of if condition (as it common
>   read()).
> - Remove extra parentheses
> - replace offset variable by direct return statements
> 
> Changes since v1:
> -----------------
> - remove unused variable in In function 'pcs_allocate_pin_table'
>   (Reported-by: kernel test robot <lkp@intel.com>)
> 
> Hanna Hawa (3):
>   pinctrl: pinctrl-single: remove unused variable
>   pinctrl: pinctrl-single: remove unused parameter
>   pinctrl: pinctrl-single: fix pcs_pin_dbg_show() when bits_per_mux is
>     not zero
> 
>  drivers/pinctrl/pinctrl-single.c | 65 ++++++++++++++++++--------------
>  1 file changed, 37 insertions(+), 28 deletions(-)
> 
> -- 
> 2.17.1
> 

I'm curious what SoC are you using?

It's good to know who has hardware to test bits_per_mux in the future.

I pay attention to pinctrl-single as that is the driver used for the TI
AM3358 SoC used in a variety of BeagleBone boards.  It does not use 
bits_per_mux, but I can verify that this does not cause any regression
for the AM3358 SoC:

  /sys/kernel/debug/pinctrl/44e10800.pinmux-pinctrl-single# cat pins
  registered pins: 142
  pin 0 (PIN0) 0:? 44e10800 00000027 pinctrl-single
  pin 1 (PIN1) 0:? 44e10804 00000027 pinctrl-single
  pin 2 (PIN2) 0:? 44e10808 00000027 pinctrl-single
  pin 3 (PIN3) 0:? 44e1080c 00000027 pinctrl-single
  pin 4 (PIN4) 0:? 44e10810 00000027 pinctrl-single
  pin 5 (PIN5) 0:? 44e10814 00000027 pinctrl-single
  pin 6 (PIN6) 0:? 44e10818 00000027 pinctrl-single
  pin 7 (PIN7) 0:? 44e1081c 00000027 pinctrl-single
  pin 8 (PIN8) 22:gpio-96-127 44e10820 00000027 pinctrl-single
  pin 9 (PIN9) 23:gpio-96-127 44e10824 00000037 pinctrl-single
  pin 10 (PIN10) 26:gpio-96-127 44e10828 00000037 pinctrl-single
  pin 11 (PIN11) 27:gpio-96-127 44e1082c 00000037 pinctrl-single
  pin 12 (PIN12) 0:? 44e10830 00000037 pinctrl-single
  <snip>
  pin 140 (PIN140) 0:? 44e10a30 00000028 pinctrl-single
  pin 141 (PIN141) 13:gpio-64-95 44e10a34 00000020 pinctrl-single

Reviewed-by: Drew Fustini <drew@beagleboard.org>

Thanks,
Drew
