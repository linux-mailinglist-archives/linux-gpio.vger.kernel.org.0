Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0A7D396ED0
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jun 2021 10:22:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233423AbhFAIYP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 1 Jun 2021 04:24:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233504AbhFAIYM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 1 Jun 2021 04:24:12 -0400
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD71DC061574
        for <linux-gpio@vger.kernel.org>; Tue,  1 Jun 2021 01:22:29 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso950102wmh.4
        for <linux-gpio@vger.kernel.org>; Tue, 01 Jun 2021 01:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=xn1L6fDVgKOqaKxXDbNnwMwyXVO3IZf/L5m590U3DtA=;
        b=P4zFL9GjWh1yzkidZEfo5c6HMaVNYnZ6cGP56ifvlomWIqK9CyXOR93ixHqcTLAUhQ
         /wp+5j57R8EDBOVJdIQU60i3lEFN8mBZfjHkfhGFKyas/e//PAXUc7mGjPcVLcVvY1AA
         T56FqXT75od2O0cDhUzjDxDxWSk76dPm/kxjo87ksdRqc4M3ec30jMQolM2n3sFgSBpG
         gMPyBys49OEugQO/ghhIArt827BUY6y8+M9Kq1fasdVre7h474reGjttOBnXInggzBS9
         UOt8bj9n7pdW8ji0YmIXognVtFTRMxe2kPs9qHjBHFFuw7OZ+KOFyAMAIrez4sMsu8zX
         mg+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=xn1L6fDVgKOqaKxXDbNnwMwyXVO3IZf/L5m590U3DtA=;
        b=fBFNDOUBpEgg0VyAklaasImFEV8QDVL3TSKe6Qw4JER9wR0n4wqRxS/GW/X/P2zv3Y
         JGLcxOktlo6mk+cGvYpalHZ+ZtPD8Dk2ZB7PL3q/Uufqch18X1gazrsyhPj9fwNJxnNN
         10dncUAbl4R+jW+dqs1QACl+7oLy4xcQ40PiKCr/ByYb/XhPufxWopDitebPU0PnuehV
         O7fpQtY6yA++BY9a753BKkeNB/nKCw74gUOiVhK5TDpOq/nuVVsGTSbkDlzgKrDV8Nbk
         93YS0uAIdAm7YzcTYXcKdTka2SBT6uLrvyz8L1h+s7oNnnRA9t0gA/N+dj1qmt2TAN3F
         zbxw==
X-Gm-Message-State: AOAM532x+1fDhyqM73MAfz7SAwMihc/0F48+q4ZD5E5zwhDrlAdWCE5N
        gU47xHximmdJcCMCk746w6V9oA==
X-Google-Smtp-Source: ABdhPJxgMmw3U4gYvvxN0M46LLI5LG9BtSt+xyFMDSjhngHe93AriPW6B3ttYCrNsM2t13PEm0MhXg==
X-Received: by 2002:a1c:f60f:: with SMTP id w15mr3362619wmc.5.1622535748454;
        Tue, 01 Jun 2021 01:22:28 -0700 (PDT)
Received: from dell ([91.110.221.249])
        by smtp.gmail.com with ESMTPSA id m132sm912619wmf.10.2021.06.01.01.22.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 01:22:28 -0700 (PDT)
Date:   Tue, 1 Jun 2021 09:22:26 +0100
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
Message-ID: <20210601082226.GV543307@dell>
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr>
 <20210524230940.GA1350504@robh.at.kernel.org>
 <20210525074649.GC4005783@dell>
 <CA+HBbNFxCKbitVctbUisuZXJWxaZp0cswNNNTgD0UxQZ1smJbg@mail.gmail.com>
 <20210526075255.GG4005783@dell>
 <CA+HBbNGSH9AvRo0Hwa5pWea94u0LwJt=Kj7gWjSAV9fS5VFr0A@mail.gmail.com>
 <20210601081933.GU543307@dell>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210601081933.GU543307@dell>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 01 Jun 2021, Lee Jones wrote:

> On Mon, 31 May 2021, Robert Marko wrote:
> 
> > On Wed, May 26, 2021 at 9:52 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Tue, 25 May 2021, Robert Marko wrote:
> > >
> > > > On Tue, May 25, 2021 at 9:46 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > > >
> > > > > On Mon, 24 May 2021, Rob Herring wrote:
> > > > >
> > > > > > On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> > > > > > > Add binding documents for the Delta TN48M CPLD drivers.
> > > > > > >
> > > > > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > > > > ---
> > > > > > > Changes in v2:
> > > > > > > * Implement MFD as a simple I2C MFD
> > > > > > > * Add GPIO bindings as separate
> > > > > >
> > > > > > I don't understand why this changed. This doesn't look like an MFD to
> > > > > > me. Make your binding complete if there are missing functions.
> > > > > > Otherwise, stick with what I already ok'ed.
> > > > >
> > > > > Right.  What else, besides GPIO, does this do?
> > > >
> > > > It currently does not do anything else as hwmon driver was essentially
> > > > NACK-ed for not exposing standard attributes.
> > >
> > > Once this provides more than GPIO capabilities i.e. becomes a proper
> > > Multi-Function Device, then it can use the MFD framework.  Until then,
> > > it's a GPIO device I'm afraid.
> > >
> > > Are you going to re-author the HWMON driver to conform?
> > hwmon cannot be reathored as it has no standard hwmon attributes.
> > 
> > >
> > > > The CPLD itself has PSU status-related information, bootstrap related
> > > > information,
> > > > various resets for the CPU-s, OOB ethernet PHY, information on the exact board
> > > > model it's running etc.
> > > >
> > > > PSU and model-related info stuff is gonna be exposed via a misc driver
> > > > in debugfs as
> > > > we have user-space SW depending on that.
> > > > I thought we agreed on that as v1 MFD driver was exposing those directly and
> > > > not doing anything else.
> > >
> > > Yes, we agreed that creating an MFD driver just to expose chip
> > > attributes was not an acceptable solution.
> > >
> > > > So I moved to use the simple I2C MFD driver, this is all modeled on the sl28cpld
> > > > which currently uses the same driver and then GPIO regmap as I do.
> > > >
> > > > Other stuff like the resets is probably gonna get exposed later when
> > > > it's required
> > > > to control it directly.
> > >
> > > In order for this driver to tick the MFD box, it's going to need more
> > > than one function.
> > 
> > Understood, would a debug driver count or I can expose the resets via
> > a reset driver
> > as we have a future use for them?
> 
> CPLDs and FPGAs are funny ones and are often difficult to support in
> Linux.  Especially if they can change their behaviour.
> 
> It's hard to make a solid suggestion as to how your device is handled
> without knowing the intricacies of the device.
> 
> Why do you require one single Regmap anyway?  Are they register banks
> not neatly separated on a per-function basis?

Also, if this is really just a GPIO expander, can't the GPIO driver
output something to /sysfs that identifies it to userspace instead?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
