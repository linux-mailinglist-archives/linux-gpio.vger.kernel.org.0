Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE32F3EE72E
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 09:26:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238455AbhHQH1Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 03:27:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238436AbhHQH1Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 03:27:24 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A2FC0613C1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Aug 2021 00:26:51 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id u16so9995352wrn.5
        for <linux-gpio@vger.kernel.org>; Tue, 17 Aug 2021 00:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9N5SbO53qVnZhxEemNdpRfF5fB3eDj8lmov3sQsZyQA=;
        b=MmiagQYwg/xcTeY6l+izyKL0dyCyQ/nEHgiGtT8zhrQEVQLqwPVY36uPXnU8gBzo5p
         0Ue4iZsEDEuHttNRfkhpH6YbESomF3juTKRn3aKgxgv6HbXNuQRFKAMYZWILo9IbSq+x
         gTu7zJ2MjAEQsvIXacBA0FeCOEeZ0vq7wuARhhgBdELB9wD4cDJcylwmEaVi2/oyN6jf
         lNSrY51fRAx+F0zztDAPVL0oC4bVmZ7O5DDV40iNTO+NWO4GQDwnsNuEA+JqezALbdWb
         P3mZHItHYUsvxZahdyoD8FDlMXeVUUz8Q3KzaF76kocxX7N6GNPalc9xAB7Lh6HebROt
         Sr4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9N5SbO53qVnZhxEemNdpRfF5fB3eDj8lmov3sQsZyQA=;
        b=i4y1G5KyOBkLRNx/iEO7gZg0J53C2u+y2GR2kNXpC8Z/GmPPe8TTUJwoBT8Psphxey
         xtdQ+UZsgmEdm5mFNN5yK1KJig7Q9NY/cyP6qA26HZ+hNMW1VeEy+uJTm39BMeeTx7Cm
         DMOC3fKLch5XNDWrVyietFbcU1fdaYDPXiLzLBEYEqsq//V9p2b0fj0jBQZto/95U9GB
         x/ImvDac/w/VDkZ7QyrlA6kzF1uJi8ybpdwJBb96n4lzY8RD4bNVh64wlMSc4IFjHXsM
         O/PK0jX/pyYWYUh7UqhWIdIAY39gJU+Ruv1fqq5YhsyC1vzZQLNt/A2azJGwQqsoDSur
         T6lA==
X-Gm-Message-State: AOAM531rDe3umxGVBK2mzfBmohFOhTExKZpQBpqDuGUmxAJg1QDTBMNN
        +B0R+OeQibR1NlpTTJ6ip+7qSA==
X-Google-Smtp-Source: ABdhPJx9kbyxFEYPOmnSjIRigqP6QevkCsk60jRhuo8RicHZ6PCLHSkWqJLzVHmtUEro6W0r2eKS0w==
X-Received: by 2002:adf:dd11:: with SMTP id a17mr2219820wrm.132.1629185210030;
        Tue, 17 Aug 2021 00:26:50 -0700 (PDT)
Received: from google.com ([2.31.167.59])
        by smtp.gmail.com with ESMTPSA id g6sm1321166wrm.73.2021.08.17.00.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Aug 2021 00:26:49 -0700 (PDT)
Date:   Tue, 17 Aug 2021 08:26:47 +0100
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
Message-ID: <YRtkt8e25ZSeOICx@google.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
 <YRpihHP3kDz5nYV9@google.com>
 <CAHp75VdcWsNFervoU7e4_m7qVKAnWXzF2z2mUgKg06-qmwn-2A@mail.gmail.com>
 <YRppKOxp4Jya5iEI@google.com>
 <YRpva4gS1LfncPUj@smile.fi.intel.com>
 <YRpz5UEDQbpewq5o@google.com>
 <CAHp75VczCKwNQE8k6_e9Trk0qkD2EumFVxxG5w2BTYhiOTDUzA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VczCKwNQE8k6_e9Trk0qkD2EumFVxxG5w2BTYhiOTDUzA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 16 Aug 2021, Andy Shevchenko wrote:

> On Mon, Aug 16, 2021 at 5:19 PM Lee Jones <lee.jones@linaro.org> wrote:
> > On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> > > On Mon, Aug 16, 2021 at 02:33:28PM +0100, Lee Jones wrote:
> > > > On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> > > > > On Mon, Aug 16, 2021 at 4:11 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > > > > On Mon, 26 Jul 2021, Andy Shevchenko wrote:
> > > > > >
> > > > > > > The driver can provide a software node group instead of
> > > > > > > passing legacy platform data. This will allow to drop
> > > > > > > the legacy platform data structures along with unifying
> > > > > > > a child device driver to use same interface for all
> > > > > > > property providers, i.e. Device Tree, ACPI, and board files.
> > > > > > >
> > > > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > > > ---
> > > > > > >  drivers/mfd/intel_quark_i2c_gpio.c | 70 ++++++++++++++++--------------
> > > > > > >  1 file changed, 37 insertions(+), 33 deletions(-)
> > > > > >
> > > > > > Doesn't seem to want to apply.
> > > > >
> > > > > Would it be okay for you to pull the immutable tag?
> > > >
> > > > What immutable tag?
> > >
> > > It's here:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/tag/?h=intel-gpio-v5.15-1
> >
> > My Ack can't be merged like that.
> 
> Which one? There are two on different patches.

The one that I specifically said was "for my own reference".

> Do you have any documentation on the rules you imply by MFD?

No, the documentation is provided with the tag.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
