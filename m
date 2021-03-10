Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DE89333A29
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 11:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231828AbhCJKiD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 05:38:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232448AbhCJKhj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 05:37:39 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27200C06174A
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 02:37:39 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id t18so1376322pjs.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Mar 2021 02:37:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1TSZ+Pfb5muktxlri+LMdTE5skRo+Y6UZrwEZmWtOtk=;
        b=nPefv51UGJqDAtlPRvgllN0iDsOE0lFRg+SflPfvFDBzO5YIbwfUEmeNevvIo5Jrv8
         QBtv1DRtTTzGr+LO7a08ENiLLb2awR6qpW06PHpe0uSrF7hjIV6/j8l/LLOCzFDzHL+a
         xhnzpuOt9ZKlAQLggjRlk1p0oiadGFmMgtGhfWsaTXg+QMLSoTGJ0y4d9SWCW2gWivbZ
         /bzqV+QFKKExFBDFTvmnLdnzR3AYLYQrmmI5FcIGSSCeLsHMO2UVi/L4OnNPWTXc2sBg
         KEzQp91QEIJDSLffPLuZyEKfQSe0BPI9jAuIhpEjBhDjpk9K/6QJN1+QwlvUguXuDil7
         vJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1TSZ+Pfb5muktxlri+LMdTE5skRo+Y6UZrwEZmWtOtk=;
        b=cmCD0xYYStPrZ+fE8ofDJPpxNMZHxtl3RvnSijwrSkk00fQ8MsLgFFxRhVdNtK55og
         dWyOPHuJesBHqmr49O5MNp0gcLQ1TEbhg/NuQpVoWo3E3Y2WXY8DzGDECJXhYvG641U4
         4wSLhOcYBnx/JbSAmKKkIjT+FhD6q6jHG9r/jwSVoqKDlLFlGCPOkKxbfe9RnLc2iktQ
         NvB32JMR+IwUpH+zyzv9cDGyrCw1MMQc4oE3/IVTmUMUc9jEThY+fXg/vq92IcWElgAH
         qU96miUPT6fOPjNVCv/64kX0k4K7713+kFLXM0CR/qRkIHWsQM2O7HbHApYc/yiU7I8r
         yvAQ==
X-Gm-Message-State: AOAM5324GT/pynSCJQ7Si7DUs16R0DZqz3GvSrsutkZHsPU+j7yKDa1/
        yXSjEWCKtRZZyMjpDZ1GeLWZ+Q==
X-Google-Smtp-Source: ABdhPJzaep1tNa+HCqdTnw6Wy90CFXm2jMcB+1puOOlR0JyCbTg9UWvushXMnn4P1ZmVb6srwSnPNQ==
X-Received: by 2002:a17:90a:dd45:: with SMTP id u5mr2913404pjv.142.1615372658746;
        Wed, 10 Mar 2021 02:37:38 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id g3sm17464825pfo.120.2021.03.10.02.37.36
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 02:37:38 -0800 (PST)
Date:   Wed, 10 Mar 2021 18:37:33 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/2] pinctrl: qcom: sc8180x: drop the use of tiles
Message-ID: <20210310103728.GS17424@dragon>
References: <20210304060520.24975-1-shawn.guo@linaro.org>
 <20210304060520.24975-2-shawn.guo@linaro.org>
 <YEbKcOwr/c1fPFLQ@builder.lan>
 <20210309025604.GQ17424@dragon>
 <YEbus+4iOde4A0/X@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YEbus+4iOde4A0/X@builder.lan>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 08, 2021 at 09:42:43PM -0600, Bjorn Andersson wrote:
> On Mon 08 Mar 20:56 CST 2021, Shawn Guo wrote:
> 
> > On Mon, Mar 08, 2021 at 07:08:00PM -0600, Bjorn Andersson wrote:
> > > On Thu 04 Mar 00:05 CST 2021, Shawn Guo wrote:
> > > 
> > > > To support both ACPI and DT, it makes more sense to not use tiles for
> > > > pinctrl-sc8180x driver, as ACPI table describes TLMM block with one
> > > > single memory resource.  Since DTS of SC8180X hasn't landed, there is
> > > > still chance to align DT description with ACPI.
> > > > 
> > > 
> > > I don't like the idea that we make up addresses to put in the DT to fit
> > > what was put in the DSDT. It is 3 different memory regions, with things
> > > in-between that Linux shouldn't touch.
> > 
> > This is not a new idea but something pinctrl-sdm845 has been doing for
> > years.  And IMHO, it's not a bad idea but a reasonable compromise.
> > 
> 
> SDM845 was the first platform where the previous contiguous TLMM block
> was split up in tiles, at the time we didn't see a need to split it up.
> 
> But then we hit QCS404 (iirc) where one of the tiles was way off and
> concluded that we needed the DT binding to actually represent the
> hardware - so the tiles concept was introduced.
> 
> Unfortunately introducing the tiles back into sdm845 would cause issues
> with existing DT, so that has not happened.
> 
> > > Isn't it possible to during ACPI probe take reg 0 and register the 3
> > > named regions instead?
> > 
> > It is possible.  But let's see what it takes.  We will need to have some
> > quirk handling in the ACPI core to detect TLMM device on Flex 5G
> > machine, and then override the memory resource registration for that
> > device.  Myself is not even convinced this is a good solution, not
> > mentioning whether ACPI maintainers will accept it.
> > 
> 
> I don't think this quirk should belong in the core. Can't you massage
> the resources once you're in the probe function in pinctrl-sc8180x.c? Or
> the platform resources can't be modified when we reach that point?

Okay, I misread your comment.  Yes, we can massage the resources, but
it's a bit tricky.  It took me hours get it right.  Anyway, I will send
it out for review.  Hopefully we can agree on one solution out of three
I have worked out.

Shawn
