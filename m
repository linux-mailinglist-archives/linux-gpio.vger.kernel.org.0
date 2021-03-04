Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB2E032CD3F
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Mar 2021 08:01:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235861AbhCDHAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Mar 2021 02:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235837AbhCDG7t (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Mar 2021 01:59:49 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E7A7C061756
        for <linux-gpio@vger.kernel.org>; Wed,  3 Mar 2021 22:59:09 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id a23so8475218pga.8
        for <linux-gpio@vger.kernel.org>; Wed, 03 Mar 2021 22:59:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ac277n3ZrkHIRZxuyFl78biK5VyfUxsH6zY1xmEkn98=;
        b=xnK/SkiVQJ8Ao+QegudNcTAOfdoMCzMIVIezonR6l0Lc1xts4eVHkpV1LU8YX6puby
         KbU43CtpXKBm2Fl/YX24B0YElYGpT6La+GLlpFFUhvvclRtefpZIrnaI+MoVMpO7/e0T
         RGxhCA+YD+Lyof0CFC5WOHqyI5WPBFVNl52hMFJy8u+nDlHm3+R1yUKYezIFaiMcVVCW
         u3JwR2ZTWoSGQoHQOvITq+n7/DwxYiLXb4zzBUWZi0qnI7T2onfGRV+rOgJ83whIGkpu
         7hd9RuaenBQUC9GVTUzPbRYHaGMisWZWUxj86wQEvzpjOD+xM8wQe4FuopWOkpKbWXc8
         LlPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ac277n3ZrkHIRZxuyFl78biK5VyfUxsH6zY1xmEkn98=;
        b=qVwIzymdQb5gB06lCetb92REdV1nZlzDXpQuc9TSx6RfmuHJIqrQ7v1HmV+lR2fTVC
         DGZ3Lo15RI0RYWdnsP+99a6WA7iuzcOHvpxNmm2s5UQrm6J85HYhS0lNi57qYULo/QM4
         rB9elWT8CHO18znw269SX5MQcWDUvgjQVcGgOs/J02i29vT3MmRnDkn0tK9C7gMaLCph
         /JdVce92m0ho3EfZH1N/gmkTuYIThagN4DS26OKl6MPPaWiMVD370+2vlrTFzSe5xQqe
         hGgeoo9PN+0V9Tdf7AWr+cH7+qcElm1b0CBYPkJuVDQG1yTdcVHvQ4iDb/Fwn+EAh5Ku
         1S1g==
X-Gm-Message-State: AOAM531EM69jHjxIc7nPZnVdTC15fSD0A8yndgn4JPJVeG80iyyoF5qD
        T1YbJc24EYyswB/LbUsVN5pn8w==
X-Google-Smtp-Source: ABdhPJzLgn7hvNrVRNMHuJ9lO5Yi/W/8jx2zl8kl40TqAfNsnxhLQgBNFoVpTesqvdF8J+dFymghhQ==
X-Received: by 2002:aa7:91cf:0:b029:1cb:1c6f:b77d with SMTP id z15-20020aa791cf0000b02901cb1c6fb77dmr2799377pfa.74.1614841148716;
        Wed, 03 Mar 2021 22:59:08 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id d24sm6339121pjw.37.2021.03.03.22.59.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Mar 2021 22:59:08 -0800 (PST)
Date:   Thu, 4 Mar 2021 14:59:03 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] gpiolib: acpi: support override broken GPIO number in
 ACPI table
Message-ID: <20210304065902.GG17424@dragon>
References: <YDjZOU+VMWasjzUb@smile.fi.intel.com>
 <20210227031944.GB24428@dragon>
 <YDzbQqHspfvpYS7Z@smile.fi.intel.com>
 <20210302002725.GE24428@dragon>
 <YD4twyAGvDDOCv+n@smile.fi.intel.com>
 <abbfcdfa-c287-3828-ed6f-bc1e1f13c6b2@codeaurora.org>
 <20210303094300.GB17424@dragon>
 <41593c7e-368b-cfb8-b24a-2e4dca48b465@codeaurora.org>
 <YD+yBmPrKm1n8Tjm@builder.lan>
 <20210304063711.GF17424@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210304063711.GF17424@dragon>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 04, 2021 at 02:37:12PM +0800, Shawn Guo wrote:
> > > > May I ask a bit more about how the virtual number N+1+32*n maps back to
> > > > the real number (R)?  For example of touchpad GPIO on Flex 5G, I think
> > > > we have:
> > > > 
> > > >    N+1+32*n = 0x0280
> > > >    N = 191
...
> > > >    R = 24
> > > > 
> > > > If my math not bad, n = 14.  How does 14 map to 24?
...
> > > In your example, 14 would be the 14th GPIO that is routed to the PDC. You
> > > would need SoC hardware documentation to know the mapping from PDC line 14
> > > to GPIO line X.  This is going to be SoC specific, so 845 documentation is
> > > not going to help you for SC8XXX.
> > > 
> > > Chances are, you are going to need to get this documentation from Qualcomm
> > > (I don't know if its in IPCatalog or not), and put SoC specific lookup
> > > tables in the TLMM driver.
> > > 
> > 
> > I added the table in the driver, see sc8180x_pdc_map[], and it has gpio
> > 14 at position 7, with the 14th entry being gpio 38 - which seems like
> > an unlikely change from the reference schematics.
> 
> As it's clear that the real GPIO number is 24, and the only possible map
> in sc8180x_pdc_map[] is:
> 
> 	{ .gpio = 24, wakeirq = 37 }
> 
> So we need to understand how 14 turns to 37.

Oh, if I should look at the index in sc8180x_pdc_map[], { .gpio = 24, .wakeirq = 37 }
sits on 6 or 7 depending on indexing starts from 0 or 1.  Then question
becomes how 14 turns to 6 or 7.

Shawn
