Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B6D83ED8D2
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Aug 2021 16:19:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232237AbhHPOTy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Aug 2021 10:19:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231774AbhHPOTx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Aug 2021 10:19:53 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54335C061796
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 07:19:21 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id k29so23866111wrd.7
        for <linux-gpio@vger.kernel.org>; Mon, 16 Aug 2021 07:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=AKhG9J3ahU8JkCpxk+g+Q/1FWyyETrK/NptsIpsKfbc=;
        b=KGIkb0rXwfACZDeriTgTrMb+v/OdOVaOKQUwEBhF0Uuoi0Ps0ivcKP1OEZoD9CnRwc
         G003xTXm+nbqosZS3mibwmloTwRofCHtAO9ws5JR0Qvba4AMjOWNnlZryxVvzx+YSKia
         DiBh3PNQla7b2ixPyfiMBwHYHe/fyldqSPVvvj3OmsodZSQIQqlfI68H0Giprga1esxM
         koahSCMyr9HAXYvhoUlXNqQ72NVIib497ZsKb2bac/SCNJfEuvG7SW8rzT+gLadnYBSJ
         GBT4UsnLArNKPa1DbJGXXGo7KuPMgwE9AfOF/ZZyXM91oqaq0uDUUUyQqPogCnP+hFWD
         G3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=AKhG9J3ahU8JkCpxk+g+Q/1FWyyETrK/NptsIpsKfbc=;
        b=Zf41qhxDzgYOH9vOF+hCA7CMEqO/SypWT2di8speUSMD8N1mFO3Z8LQXsGOx+K1ON9
         QXxJQwxGqOeTN0ebh41rvuiWK6g+3YDtSqWlTqMtbB/38PcsuYIgJwpa4xVWmiEHCGqr
         QwFDA9gvA8+JbWQgn2Mqjo1/wV2brvnTcZPL/0LA/XmvuOdSuVYiwHojG1y2vqspZA+q
         kwvI1KEAfzJsxGAAZ7+YdfvhaiAhYlL+DiFZg8cjhwGFpIybqMTmBqH7i7IMPVz4G+oV
         uaKS5cfmGVw7SruL3iv9Fx6bZiOgOswQRw2kk88vgwzdBiysWbm3wkmpAyhaiougqYuq
         2qjQ==
X-Gm-Message-State: AOAM530Bhum8bvtaTE+rBCiyI4lHBXLkvnqzNPs45Q1F9BwPf0Q5h8DV
        SDsaq8PqXY3Yj56Lk9WpCaVS+A==
X-Google-Smtp-Source: ABdhPJxDgPdFw3+oQn2JzBNxZg02cW3DX14/kTpXSNEiZ16yphRkOLIwxCsbnypCdfYxlNGQwKchQg==
X-Received: by 2002:adf:e4ce:: with SMTP id v14mr18665245wrm.21.1629123559951;
        Mon, 16 Aug 2021 07:19:19 -0700 (PDT)
Received: from google.com ([2.31.167.59])
        by smtp.gmail.com with ESMTPSA id d7sm12260166wrs.39.2021.08.16.07.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 07:19:19 -0700 (PDT)
Date:   Mon, 16 Aug 2021 15:19:17 +0100
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
Message-ID: <YRpz5UEDQbpewq5o@google.com>
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-3-andriy.shevchenko@linux.intel.com>
 <YRpihHP3kDz5nYV9@google.com>
 <CAHp75VdcWsNFervoU7e4_m7qVKAnWXzF2z2mUgKg06-qmwn-2A@mail.gmail.com>
 <YRppKOxp4Jya5iEI@google.com>
 <YRpva4gS1LfncPUj@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YRpva4gS1LfncPUj@smile.fi.intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 16 Aug 2021, Andy Shevchenko wrote:

> On Mon, Aug 16, 2021 at 02:33:28PM +0100, Lee Jones wrote:
> > On Mon, 16 Aug 2021, Andy Shevchenko wrote:
> > 
> > > On Mon, Aug 16, 2021 at 4:11 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > > On Mon, 26 Jul 2021, Andy Shevchenko wrote:
> > > >
> > > > > The driver can provide a software node group instead of
> > > > > passing legacy platform data. This will allow to drop
> > > > > the legacy platform data structures along with unifying
> > > > > a child device driver to use same interface for all
> > > > > property providers, i.e. Device Tree, ACPI, and board files.
> > > > >
> > > > > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > > > > ---
> > > > >  drivers/mfd/intel_quark_i2c_gpio.c | 70 ++++++++++++++++--------------
> > > > >  1 file changed, 37 insertions(+), 33 deletions(-)
> > > >
> > > > Doesn't seem to want to apply.
> > > 
> > > Would it be okay for you to pull the immutable tag?
> > 
> > What immutable tag?
> 
> It's here:
> https://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git/tag/?h=intel-gpio-v5.15-1

My Ack can't be merged like that.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
