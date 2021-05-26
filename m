Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52369391190
	for <lists+linux-gpio@lfdr.de>; Wed, 26 May 2021 09:53:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231189AbhEZHyc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 26 May 2021 03:54:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55064 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233066AbhEZHyb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 26 May 2021 03:54:31 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F7A5C06175F
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 00:52:59 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id m18so48899wrv.2
        for <linux-gpio@vger.kernel.org>; Wed, 26 May 2021 00:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=goipG/skXtpzJOrucOfBrY3VZM0NMypmFPU8raSes5o=;
        b=Avl4DWCrbzHPqkpuGI48j9AeJ8J0hHIoaq3PLQ0VHQrly6aBfca3S3QmyHD5kg75Mb
         So+0y+pgVT3ZuLYxaAu8cXh/KP6F/+acEkUjb5iLHKKyvB0f/X/jRcZw8Cj4IQvg7ul3
         KJdEsJJQNdGvGGwm6vBb7VlHeaowJxVUScfO0Bdb7gtA5WCJch7RHSCGesCWO6/fsSgv
         XFFD0pBrlBnMWi8mV6TILI6RsR90zVmsA5sxbqQc+BLSJsnCJ0BZOOfaF9aNf2he6Biw
         AezSph0mdR6MC9CMAwAxPiy6F7SJjSYy3kNL02OJPzSw/kkYkjvuVP+ZqQ04I7FB7HUC
         g1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=goipG/skXtpzJOrucOfBrY3VZM0NMypmFPU8raSes5o=;
        b=Z2BVRRMrpZ4cc0oNcwgaqtyUq7lfleCA0+Fz7agv7lE+nH24SLaEOI9asuCcYexek1
         zhaNV1mzapiTt5l3azeA6xixG1zWEGjX1sFXjcAAUyxch/Omo+9radHWfRC9/6cVfG6+
         j9eKCSN7VA6fMcVOtClChnIohAgPbA0oPZkU0hJJc6NGgJMXsP77x0zpuVo8yR1nEUpR
         4m6OxFWhCkobimbm9yKHPnAdQBA32m61vwFPti6wDcFDlYEVm+CVZsu8hNaRT/IAAqEj
         sbdEUvKOi6SzuxXLFiFjjyATrPa8SYK57kWXldQAeLCEAhjqUAMc/BIyU1RFKCLLt4tc
         u+HQ==
X-Gm-Message-State: AOAM531IsrR2i/MddbQbBeEiq6gZZ38yH8V0J1wnrbW2ZDUzezWhhJjC
        nwpj5KC20oqrGj9fJ7osbYEiUw==
X-Google-Smtp-Source: ABdhPJz3p185K4KumVptR+JJxcC6XNNmzO6oRz2HQAxzODacIKdvbXNyGxksePhNqgeMCxhEbVE8BA==
X-Received: by 2002:adf:8b4a:: with SMTP id v10mr31016770wra.274.1622015578162;
        Wed, 26 May 2021 00:52:58 -0700 (PDT)
Received: from dell ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id g11sm19052357wri.59.2021.05.26.00.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 00:52:57 -0700 (PDT)
Date:   Wed, 26 May 2021 08:52:55 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <20210526075255.GG4005783@dell>
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr>
 <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell>
 <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 25 May 2021, Robert Marko wrote:

> On Tue, May 25, 2021 at 9:46 AM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > On Mon, 24 May 2021, Rob Herring wrote:
> >
> > > On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> > > > Add binding documents for the Delta TN48M CPLD drivers.
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > > Changes in v2:
> > > > * Implement MFD as a simple I2C MFD
> > > > * Add GPIO bindings as separate
> > >
> > > I don't understand why this changed. This doesn't look like an MFD to
> > > me. Make your binding complete if there are missing functions.
> > > Otherwise, stick with what I already ok'ed.
> >
> > Right.  What else, besides GPIO, does this do?
> 
> It currently does not do anything else as hwmon driver was essentially
> NACK-ed for not exposing standard attributes.

Once this provides more than GPIO capabilities i.e. becomes a proper
Multi-Function Device, then it can use the MFD framework.  Until then,
it's a GPIO device I'm afraid.

Are you going to re-author the HWMON driver to conform?

> The CPLD itself has PSU status-related information, bootstrap related
> information,
> various resets for the CPU-s, OOB ethernet PHY, information on the exact board
> model it's running etc.
> 
> PSU and model-related info stuff is gonna be exposed via a misc driver
> in debugfs as
> we have user-space SW depending on that.
> I thought we agreed on that as v1 MFD driver was exposing those directly and
> not doing anything else.

Yes, we agreed that creating an MFD driver just to expose chip
attributes was not an acceptable solution.

> So I moved to use the simple I2C MFD driver, this is all modeled on the sl28cpld
> which currently uses the same driver and then GPIO regmap as I do.
> 
> Other stuff like the resets is probably gonna get exposed later when
> it's required
> to control it directly.

In order for this driver to tick the MFD box, it's going to need more
than one function.

> > > >  .../bindings/gpio/delta,tn48m-gpio.yaml       | 42 ++++++++++
> > > >  .../bindings/mfd/delta,tn48m-cpld.yaml        | 81 +++++++++++++++++++
> > > >  2 files changed, 123 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> >
> 
> 
> 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
