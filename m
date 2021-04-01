Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A4BD835108F
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 10:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230284AbhDAIE5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 04:04:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233445AbhDAIEl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Apr 2021 04:04:41 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE41EC061788
        for <linux-gpio@vger.kernel.org>; Thu,  1 Apr 2021 01:04:40 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so3429282wmq.1
        for <linux-gpio@vger.kernel.org>; Thu, 01 Apr 2021 01:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=QM7rCia0E0f24qsTX0VNJrlQHlXgwo18P09kK6//nHk=;
        b=yhSocdsAAbgIsDtLEU0fY/HIso3rH7inzjIXLFT2uUqVzWbWlqxWe4DTcnH5D5bIVc
         pbOX6dPSSUEH0L3M80PSVZ2QeODWtGPyWeG/XcxOG3pti3etGR6X7WK4/bHgQKZnZAqo
         r83ckH4EUrq7Sz2TFI/+tHy/5ZmpTKrqS5mwYwlDzhjRr0Y9+1nEUgTkHj6aeFPWGB3H
         Ki0ciNfnUmMeOcHicDFUuILl2Y4l+hIeh448kEqVE2yxnoTL6XlA2sFvmt1LgNXw4IdY
         nrOQXR2DSdT6OXeV47OHU3h5Wa9hKX6zzPfpGJJqqQyRAXeX+IH0zjwNUHL6zgXq8J/q
         Yagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=QM7rCia0E0f24qsTX0VNJrlQHlXgwo18P09kK6//nHk=;
        b=cQKRHohD6+682f5TXWkl1AcLUWQHh+0kqaju9Jf0bEcWixQmiileu4ib9ec2k9+JOP
         nKvZGvEz+Tyr01AGKSh0Pz9rNIvo2PbZwmO2Lm+eqPCJP+q41yd0D/fN1hlRYV1AaX0C
         YlvRDTappPzdBBfwmddtj6ezkzLx/BxpKA4mBRxQGh3pvXPDRLyJXbPk3iyYngNpKDR7
         KBBFxEIFY6gsoGib0VyhJg9s812kQ8uYSrxc5cq3ZajCvupw5Za2iuyZoF55+Ua9JwK5
         tdA6Ety4q/I2DC9DiSB8aKCvzjYkLcIqXoiUgtzQI9VY94fSOyFS32kx4yrZ0TybIWND
         YHeg==
X-Gm-Message-State: AOAM530ortDA0GY/7oG+BCLiAJRTeUuqt2trtGTbVTWjjONIKPnCT17Z
        d6lTw9MncFisLRbQjpqti8+GKg==
X-Google-Smtp-Source: ABdhPJx6dwsz9577eN4J57oOfqxH2Zwh01VL6NnAsjhSyoT7F4fPApt2JbXPDy0SkMUZQSINwXOEgw==
X-Received: by 2002:a05:600c:203:: with SMTP id 3mr6755143wmi.88.1617264279366;
        Thu, 01 Apr 2021 01:04:39 -0700 (PDT)
Received: from dell ([91.110.221.182])
        by smtp.gmail.com with ESMTPSA id r14sm8741396wrw.91.2021.04.01.01.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 01:04:38 -0700 (PDT)
Date:   Thu, 1 Apr 2021 09:04:37 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/3] mfd: tqmx86: add support for TQMxE40M
Message-ID: <20210401080437.GM2916463@dell>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <3c19d714645f788913956223097adc360ceb6203.1617189926.git.matthias.schiffer@ew.tq-group.com>
 <CAHp75Vdk4rxiD_nm8Cb53oTYNvMqkAOM4U5zEn5tchtptQZEBw@mail.gmail.com>
 <83d7ea27b27225727fec7b077efe1a67ba1184a9.camel@ew.tq-group.com>
 <CAHp75Vc5Nw+GJ4tFeciYZQhJ_NbRZMJjJNcWeFq7nOuAOe0=jQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75Vc5Nw+GJ4tFeciYZQhJ_NbRZMJjJNcWeFq7nOuAOe0=jQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 31 Mar 2021, Andy Shevchenko wrote:

> On Wed, Mar 31, 2021 at 4:33 PM Matthias Schiffer
> <matthias.schiffer@ew.tq-group.com> wrote:
> > On Wed, 2021-03-31 at 15:37 +0300, Andy Shevchenko wrote:
> > > On Wed, Mar 31, 2021 at 2:38 PM Matthias Schiffer
> > > <matthias.schiffer@ew.tq-group.com> wrote:
> 
> ...
> 
> > > > +               return 24000;
> > >
> > > AFAICS it will return 24 MHz for "Unknown" board. Is it okay to be so brave?
> >
> > As noted in the commit message, our hardware developers intend to use
> > 24 MHz for all future x86 SoMs.
> 
> What may go wrong in the future?.. (rhetorical question, obviously)

My preference would be to be explicit.

Rather than support boards implicitly i.e. by accident.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
