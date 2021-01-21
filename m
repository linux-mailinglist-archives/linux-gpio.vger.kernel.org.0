Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B143A2FE225
	for <lists+linux-gpio@lfdr.de>; Thu, 21 Jan 2021 06:58:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbhAUF5p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 21 Jan 2021 00:57:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727012AbhAUDUf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 20 Jan 2021 22:20:35 -0500
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FE2FC061757
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jan 2021 19:19:14 -0800 (PST)
Received: by mail-pj1-x1035.google.com with SMTP id b5so725098pjl.0
        for <linux-gpio@vger.kernel.org>; Wed, 20 Jan 2021 19:19:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=TfFXs9mHknQ0FYX15Kzdj3tfAorhNNw9oOMWrG9kjOg=;
        b=G6cX1b7FU4HY4wZI+2MjTESh6qWFl1UVhBIep94K4oZaALWIOSY6dnRj21zF4/BoXu
         HOY0R8JbcFjkGE4k+Zh9urkWuo+9FIWLh8d+OZvt1CUgoJGttfPhd3dVdtggdeaOK/+r
         Xo3Hus9G9ODpuWvdUGVpPK65/zpfP8epxZUohIm68dixOAdh1/MytY7fXYPEMotvojky
         vAZoPZS7CAKj6fUqdOFIa+yUGrwNf/7aHc4bATbv69u7mYLdp6MWf/MZYCX48dKRxNRA
         vhHoutAXbknZqpMjhsHP5PrEEGToTb+slTC6XSa73gn+HsGSyqA6fAiaQPYao6zAJ6zI
         7y5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=TfFXs9mHknQ0FYX15Kzdj3tfAorhNNw9oOMWrG9kjOg=;
        b=G99CGEoL2FkbU0iuA9nkYNbdc08okfhfjCuM/ZA09zNQpT5MqnDGkGFBoX3cIOaP/B
         Biw/xoRJ7CsLKFfJxtji639CuurzfeuuA5Kw+0xa6/cUBU7MFmX9Yr578l5Fq4/0ZXrt
         tD2+N2Exu38hJqv3VWMlAa6PtX2dlZLcyUDQx2J+yJ64LAKXO0Fo+s46fhQ0+GVM9o0w
         u7K2+cYFTxaEeq5saT7myJG2LLgqNepXsaTAKuJRDxcJTHyOMvN2A6iLjazkMDwkXnZD
         HoFPB27ag7MabMT4SUtlxdjiEnYEJyIIatXYKBMYUToigeLL0F6hIy7McaDWREuKe2xR
         dkcw==
X-Gm-Message-State: AOAM53243+gKLBR9m6OekIHNcWIZo0Jn6Ma/9+kt1mDSIQWGFC45V986
        d8s4q+YEctY54Z5X81b9KrNJIA==
X-Google-Smtp-Source: ABdhPJx2sHHMfN5ZADdBI6iJaxaoVTtR18nr1yhDctYo0c+exErrZ2AbajkyA2sgazoZuo8xJzmyJg==
X-Received: by 2002:a17:902:ed8e:b029:de:8c17:f7e8 with SMTP id e14-20020a170902ed8eb02900de8c17f7e8mr12957440plj.19.1611199153742;
        Wed, 20 Jan 2021 19:19:13 -0800 (PST)
Received: from x1 ([2601:1c0:4701:ae70:d139:25ba:c4c6:2929])
        by smtp.gmail.com with ESMTPSA id e5sm3603667pfc.76.2021.01.20.19.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jan 2021 19:19:12 -0800 (PST)
Date:   Wed, 20 Jan 2021 19:19:10 -0800
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Pantelis Antoniou <pantelis.antoniou@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@beagleboard.org>
Subject: Re: [RFC PATCH v2] pinctrl: add helper to expose pinctrl state in
 debugfs
Message-ID: <20210121031910.GA252950@x1>
References: <20201218045134.4158709-1-drew@beagleboard.org>
 <CAHp75Vfwb+f3k2+mAj+jB=XsKFX-hCxx61A_PCmwz6y-YKHMcg@mail.gmail.com>
 <20201224203603.GA59600@x1>
 <CACRpkdb9RnGJbct+D-88JPDSbaVp1XS8vjhhHYosy20EPkLjaw@mail.gmail.com>
 <20210109025527.GA2918377@x1>
 <CACRpkdaOfU=OLp5D-EXK2oU9bScLZ-QjLdCSrewiSBa0SRRNwg@mail.gmail.com>
 <X/wiZjioLqcTYVfj@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X/wiZjioLqcTYVfj@atomide.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 11, 2021 at 12:03:18PM +0200, Tony Lindgren wrote:
> Hi,
> 
> * Linus Walleij <linus.walleij@linaro.org> [210109 21:14]:
> > On Sat, Jan 9, 2021 at 3:55 AM Drew Fustini <drew@beagleboard.org> wrote:
> > 
> > > I discussed my use case and this patch on #armlinux earlier this week
> > > and Alexandre Belloni suggested looking at the pinmux-pins debugfs file.
> > 
> > This sounds reasonable.
> > 
> > > This made me think that a possible solution could be to define a store
> > > function for pinmux-pins to handle something like "<pin#> <function#>".
> > > I believe the ability to activate a pin function (or pin group) from
> > > userspace would satisfy our beagleboard.org use-case.
> > >
> > > Does that seem like a reasonable approach?
> > 
> > This sounds like a good approach.
> 
> Makes sense to me too.
> 
> We may want to make it into a proper sysfs interface eventually to not
> require debugfs be enabled in .config. But that's another set of patches,
> certainly makes sense to first enable it for debugfs.
> 
> Regards,
> 
> Tony

I have added a debugfs file "pinmux-set" to pinmux.c. This allows
"<function-number> <group-number>" to be written into that file. The
function pinmux_set_write() calls ops->set_mux() with fsel and gsel.

I'll post an RFC with the code, but I am wondering if it would better
to take the function as a name and then lookup the function number
(fsel)?

thanks,
drew



