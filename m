Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F26E93E91D7
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 14:47:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbhHKMsV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 08:48:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229473AbhHKMsU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 08:48:20 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35A2FC061765;
        Wed, 11 Aug 2021 05:47:57 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id w20so5441111lfu.7;
        Wed, 11 Aug 2021 05:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=maVdPAhzuun15W4v+98yU9YOHED/7XUgEFEe/1oMvOA=;
        b=RX8mgA2mqjOOK93KuFiX2pdWvtkcpIUs7LVTZU8lS+InmsSd89MWKauhshqzNUlNn1
         mhTYVz1fPUMgotTWyhMNoxY6kHN3sqODLgyXMWgZmIvAHgQ/oi9ZqWCgdkX1fo0d9oKR
         vFVkFDsMNvKLmecuMB522cb9DZGYHA9cDImZH7iG6Cn5p/Y2sYtMJOdXq7x/Lyh+au/N
         tp4ccvczuNjxSM4lC4pUEFuzWTJIdFKL8Wh94SRdatnVNjme591FjaeKt3e4i/WMeV78
         v/nC9y57SXwPAMinpBlFcpRQ3AxaI9jRModDiBLWmQ52N6HZlleJBoIfomLxl6FRfMde
         64rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=maVdPAhzuun15W4v+98yU9YOHED/7XUgEFEe/1oMvOA=;
        b=Drp2qkkj44ZsOt9Lh0v/OIef2wL0omJ7GGTTKENzLBTF2Cayhs9cEOZQwZL9QF3vVf
         MS47g8EfF/HHPQ5W5TMUt067lzJVNNulhY0N6NYjoBJnTaie7/ReMZioBfXn83D1I9Hz
         suaoUNv05wg/8MT5W2XY6ywR73GxzzjqyDwdeh9c6W3Mji10vMg4xv+2LrqEQNnSDctp
         pa0FobsXkTMXRLQ2m/jhYOR8sDfH34tMn+RDDJ12zF5xHhkTjrsT4gdIHqOqE2l+5jOG
         Xh8vxb6scLxh3YilyioiJtcqyaDFxgw7LZdsYVT2tEoqscuExID/o1S2ZiE9E1IyV8PE
         f5iA==
X-Gm-Message-State: AOAM530EdYNKz7t+0avHS0QTpWVa8zbTvyisWubtNQfP1rpHEvF79ScD
        rX9aVaHTn115lVDFgO7EwMs=
X-Google-Smtp-Source: ABdhPJzjb8jZ/Njn/4tPomE/Wan7HmUOf3JwJT/erg1ebJJW/nBfaFufA3lJ0IKfgS++eJQHesec+A==
X-Received: by 2002:ac2:4106:: with SMTP id b6mr24945834lfi.89.1628686075610;
        Wed, 11 Aug 2021 05:47:55 -0700 (PDT)
Received: from mobilestation ([95.79.127.110])
        by smtp.gmail.com with ESMTPSA id v27sm2348551lfp.155.2021.08.11.05.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 05:47:55 -0700 (PDT)
Date:   Wed, 11 Aug 2021 15:47:53 +0300
From:   Serge Semin <fancer.lancer@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>
Subject: Re: [PATCH v1 2/4] gpio: dwapb: Read GPIO base from gpio-base
 property
Message-ID: <20210811124753.nckmggmil47yytxz@mobilestation>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-2-andriy.shevchenko@linux.intel.com>
 <20210802135839.4clqd34npppwasyh@mobilestation>
 <CAHp75Vcz=vkaGObUcOOTZA51pHPoMc50RpPBLg4fgZgHdUStRA@mail.gmail.com>
 <20210804124433.crh7w6jzfjcswubo@mobilestation>
 <YQqnrHAuSneeEFgO@smile.fi.intel.com>
 <CACRpkdYJyVUix6MSLQvF1Ok21gHdk6d8ToGpP_rh5v6Rpwyn5g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYJyVUix6MSLQvF1Ok21gHdk6d8ToGpP_rh5v6Rpwyn5g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Linus

On Wed, Aug 11, 2021 at 02:40:49PM +0200, Linus Walleij wrote:
> On Wed, Aug 4, 2021 at 4:44 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Wed, Aug 04, 2021 at 03:44:33PM +0300, Serge Semin wrote:
> > > Thus, yes, I think we need to make sure here that the property
> > > is only used in framework of the kernel and isn't passed via
> > > inappropriate paths like DT/ACPI fw so not to get into the
> > > maintainability troubles in future.
> >
> > Got it. I'll add the additional check in next version.
> 

> This seems reasonable for me, if you can get this done with
> some kind of elegance.
> 

There is v2 of this series has already been posted:
https://lore.kernel.org/linux-gpio/20210804160019.77105-1-andriy.shevchenko@linux.intel.com/
with the denoted concern taken into account. 

-Sergey

> Maybe use the "linux,gpio-base" property as mentioned so it is
> clear that this is a Linux-internal thing only.
> 
> Yours,
> Linus Walleij
