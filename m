Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62ECB1BD49A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Apr 2020 08:27:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgD2G1c (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 02:27:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbgD2G1b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2020 02:27:31 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC0ECC035495
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 23:27:29 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j1so1058811wrt.1
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 23:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=wv05h1X7qRrPjYPf9y0VD7+PHwezUYitVP0Fh0igQuY=;
        b=I4vZV4PACb5f7K2uxifM99GPqkcfyrpLc74PzSrCUF61KrqkAGgKNBFNHr+XiC1Zzr
         XqIjNrgmZ91TIAda8FEWPq1gg3Xaa84/0qQWu5Ae3sW4csU35iEp2O/nwCWdMpbr7El6
         eoZD/tvPP5RteAWgnhbWIY/PMqJ+ssDOZvekrrEimOB3ENhCiVutsoNIJ5zLGgynqmXb
         8Rc5rpcdAkqbshwzs7C11AcGOjJ9hcJFu+NIFlqEadlAtAupqh+9vJ50K1QkhtgQmjWR
         R9djt4X9WtAHl95Nhhfz3sSbWTT0MATduTJ2F9hJdP0sNOI+tsziWlYROFDtUt7Fy1Op
         uYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=wv05h1X7qRrPjYPf9y0VD7+PHwezUYitVP0Fh0igQuY=;
        b=JBIILmB8QlIen8SFmyvhM7+ijTR6gEdDR4/N+nLm+ZTDb/HvBPMCgtVbJU9gRRnnQu
         9T3XN1qPdhQvDSnZEw2zeNXEHps2xIJwV/vXBJaY+ODJD93t6RgeupopJEjQQOSzdM/Q
         RUlUFWHIeBHv4tAv64EWG2o4Xo6ihJ45KpBijW1CXAaF45uzjjAuIA5pF0FiShnTl5xl
         153LNrgji7z0dfoMpMzfvFVBV5mWQiralbfzQH/88a6dFAY/GHUNXXwaHcV1dN0/tB/A
         BKn7NJNMUsXLePUV0Z8biUnYjB3u0OKrm4uQubls41tr6cbJQpSzVtJmczMUYNKgh/rb
         fm2Q==
X-Gm-Message-State: AGi0PuaiP2enK8kFeC00vzuyVJ51VcEvrVUQteFXWdDjKBAoPlUZhhXk
        ZSJiJliAp49Nsom+wNfDta3YAw==
X-Google-Smtp-Source: APiQypKTqIt46QQB2nB/SSJZXWRFVeB9A294fdRkNMgBYLOeiiFcpBnVXBSKVh/jOHoB1iCbHHyjSA==
X-Received: by 2002:adf:f187:: with SMTP id h7mr37818290wro.331.1588141648280;
        Tue, 28 Apr 2020 23:27:28 -0700 (PDT)
Received: from dell ([2.31.163.63])
        by smtp.gmail.com with ESMTPSA id t17sm27729510wro.2.2020.04.28.23.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2020 23:27:27 -0700 (PDT)
Date:   Wed, 29 Apr 2020 07:27:25 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Michael Walle <michael@walle.cc>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Thierry Reding <thierry.reding@gmail.com>,
        Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>, Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v3 05/16] mfd: Add support for Kontron sl28cpld
 management controller
Message-ID: <20200429062725.GU3559@dell>
References: <20200423174543.17161-1-michael@walle.cc>
 <20200423174543.17161-6-michael@walle.cc>
 <20200428125049.GU185537@smile.fi.intel.com>
 <5e2d486077f9e2ce8bd9b171cf806fd9@walle.cc>
 <20200428144958.GZ185537@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200428144958.GZ185537@smile.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 28 Apr 2020, Andy Shevchenko wrote:

> On Tue, Apr 28, 2020 at 04:43:24PM +0200, Michael Walle wrote:
> > Am 2020-04-28 14:50, schrieb Andy Shevchenko:
> > > On Thu, Apr 23, 2020 at 07:45:32PM +0200, Michael Walle wrote:
> > > > This patch adds core support for the board management controller found
> > > > on the SMARC-sAL28 board. It consists of the following functions:
> > > >  - watchdog
> > > >  - GPIO controller
> > > >  - PWM controller
> > > >  - fan sensor
> > > >  - interrupt controller
> > > 
> > > ...
> > > 
> > > >  obj-$(CONFIG_MFD_STMFX) 	+= stmfx.o
> > > > 
> > > >  obj-$(CONFIG_SGI_MFD_IOC3)	+= ioc3.o
> > > > +
> > > > +obj-$(CONFIG_MFD_SL28CPLD)	+= sl28cpld.o
> > > 
> > > Perhaps keep an order?
> > 
> > I don't see any order in that makefile. Looked to me like every new
> > file was added at the end.
> 
> Okay, just didn't note from above context.

Yes, this is historical.  I've been meaning to visit this for ~7 years!

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
