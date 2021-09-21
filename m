Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 655C9413621
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 17:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234013AbhIUP1Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 11:27:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233857AbhIUP1Q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 11:27:16 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7425C061575
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 08:25:47 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id t18so40347287wrb.0
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 08:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=dDzxxa5Lvo+gSE3fdEoxI3ZuoRWBLEBLy8XJ81TyYDY=;
        b=ZjfSk25cctACsOQ1pNXcEn8R/vERSKAX2EStYiFxTKO4SwFRhuhsBfmdkdPdBHTICI
         NuYIkES8OvoKCS+2Qiba9QQ38pmUPuZoCLNLjQEoGHFTqBXLeDhkvDTXnNtADmonzUQR
         MiVDMPZD/DbYvWiCe66lotjzSfyBpleeYLZURbAUc37ovouVt9PsQUXsJsdPF/bsUOhj
         sbbStA4MoZIA9GGNZ6c0qHvqtpjrziosKw6S9i5wGp/9Lfh/1p7WT+53slB1MTaw5VrI
         fBnlbgMgblD+RlM0GMsnoXMLfZK0qKrDtnEJT3SCncPICmlg8uCEBj3qE2uWVjBL7aZF
         HGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=dDzxxa5Lvo+gSE3fdEoxI3ZuoRWBLEBLy8XJ81TyYDY=;
        b=ErqIlT0F0vJNB3VwmfWR9sOqpUNFVoc+PER8GQd8CtBoBPo1fOrKLdkH9ztAcMLTXQ
         CoZ/ZC5CnMErNmO8bUX/V/8XLFw0BTPQufdnHbp6y0ocISjK+/XhweR5tcuMB1/Xpehg
         W6WO/FA1Qd1pxBsWPZyxyG1/zVRL6j53R8XIAmwX9YU/Q/jkCt8Dp0qEDtN3wCL7l0wL
         Hz1HTzqDNoLW5wmwBbSHKPTXi9HmD0Lv9KcWTLQYIINb6x7sjMuQW4rwOXpU2Gt04FZ5
         1YV09Fevu52CEy5sspx6/RigVKom2UyNGbSfHbL1a2f+m3cXBMWu27Of7XK23EF6aML8
         eMjA==
X-Gm-Message-State: AOAM531nX5G17IpEHOGB+XlfNnEWm4/JZx+yW67kWYrphOd1+LSkaUQR
        L5TLUdUpEtyRzkadNzpkoGqrnQ==
X-Google-Smtp-Source: ABdhPJyoLJdvyxpRfhWBg1ob+t87CcgTMBV5MNdCG8EfJsU+Hj/gKLDqQtpSNcrNpBCGddHrnYdcTg==
X-Received: by 2002:adf:f4ca:: with SMTP id h10mr35948315wrp.159.1632237945765;
        Tue, 21 Sep 2021 08:25:45 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id i18sm19614209wrn.64.2021.09.21.08.25.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 08:25:45 -0700 (PDT)
Date:   Tue, 21 Sep 2021 16:25:43 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Serge Semin <fancer.lancer@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v1 3/4] mfd: intel_quark_i2c_gpio: Convert GPIO to use
 software nodes
Message-ID: <YUn5d6157uUHpDRz@google.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
 <YRpihHP3kDz5nYV9@google.com>
 <CAHp75VdcWsNFervoU7e4_m7qVKAnWXzF2z2mUgKg06-qmwn-2A@mail.gmail.com>
 <YRppKOxp4Jya5iEI@google.com>
 <YRpva4gS1LfncPUj@smile.fi.intel.com>
 <YRpz5UEDQbpewq5o@google.com>
 <CAHp75VczCKwNQE8k6_e9Trk0qkD2EumFVxxG5w2BTYhiOTDUzA@mail.gmail.com>
 <YRtkt8e25ZSeOICx@google.com>
 <CAHp75Ve-24wno-z8rQSCtgBdf6_a70TFf3aCJPP7JSFPG8sfhg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Ve-24wno-z8rQSCtgBdf6_a70TFf3aCJPP7JSFPG8sfhg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 17 Aug 2021, Andy Shevchenko wrote:

> On Tue, Aug 17, 2021 at 10:26 AM Lee Jones <lee.jones@linaro.org> wrote:
> > On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> > > On Mon, Aug 16, 2021 at 5:19 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > > On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> 
> ...
> 
> > > > > > > Would it be okay for you to pull the immutable tag?
> > > > > >
> > > > > > What immutable tag?
> > > > >
> > > > > It's here:
> > > > > https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/tag/?h=intel-gpio-v5.15-1
> > > >
> > > > My Ack can't be merged like that.
> > >
> > > Which one? There are two on different patches.
> >
> > The one that I specifically said was "for my own reference".
> >
> > > Do you have any documentation on the rules you imply by MFD?
> >
> > No, the documentation is provided with the tag.
> 
> I see.

And now the patch is merged with an invalid tag! *facepalm*

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
