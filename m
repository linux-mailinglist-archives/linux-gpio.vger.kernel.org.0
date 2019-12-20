Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A9121279AE
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Dec 2019 11:55:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727205AbfLTKzH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Dec 2019 05:55:07 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42746 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727191AbfLTKzH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Dec 2019 05:55:07 -0500
Received: by mail-wr1-f67.google.com with SMTP id q6so8946878wro.9
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2019 02:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=a9C14P9lsGAuh8F6Rdx7vHrUThQ9aonGy2O3DOUo7Ds=;
        b=lnsxrNECjkBnFDoUoh4Zk3vI7gih7BdHS5VDD/ljXCsq9ilLRKOZ8GzzX7sx/6q8XK
         zXuAKwefaAx9xOCMJiNWqqF/21CHWenY5X0UiZceAAACBFFJpSOR2/UekgYy3Alhn+7K
         ieZJlFRB2hooAr36DkhTxOLH/VBGWvH3v/mySwaI6BcLANoApcE8RhKRUozqUqqmupM9
         pRRKHrcSYVWSErKLI8B7XsVpW7oGvA9qLZMI7MVHFPZ7zG0gSaC9VyAIgYXmv8TF26Ih
         fDVRzS4kElTzBv5ztckoj5PvaMpdOldZIi3GMchS7cYL/6H8DBkQYaUkNyrvhqkZXB72
         YaSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=a9C14P9lsGAuh8F6Rdx7vHrUThQ9aonGy2O3DOUo7Ds=;
        b=CpmFGgZO34qhJWU+6GOLPdEA6n61xcsuhxkC5yA0w2Qs2pNR8chUd+F4CU1WB48dc7
         57Rf4kDuA60zdE0Yvdrn9FUQ2cUJjgMtFjBLZQweWWE76a1IQmKfxttg6E37A4shb7IA
         oDWYfbFB7YXmOCX8iA8AOnBLnaa7cOMa8lrku5VwWgIivKchYhoQ/FQJVytY+rY2FeLK
         iDDKjDYZtYHM10z55ND553lmGq10bG9FGKWTVlJXLluOHaaw7yfAVgMEq1FUab2V4w2a
         qQtM09E4q6P1JSE7mJxPQm5mvtp4JQmGFbputvzXkokxI8yDtnqpA6q7ytQj6eEWycKu
         LQ+g==
X-Gm-Message-State: APjAAAWEflnIsHHNPOcfsjqhDCQK+GCX/Hgcooky99v4bCiV4IB/X8jo
        yUls4/b+aYyHgYmlRqeqG78fMA==
X-Google-Smtp-Source: APXvYqyicvSFzhHzxpljiw/uidTI78NGorAjjg+bi/J4O8iYxkHUB7TVkQ+2LhBMrPCHOQeS/2zn7Q==
X-Received: by 2002:adf:f052:: with SMTP id t18mr14250816wro.192.1576839304724;
        Fri, 20 Dec 2019 02:55:04 -0800 (PST)
Received: from dell ([2.27.35.132])
        by smtp.gmail.com with ESMTPSA id f17sm9339549wmc.8.2019.12.20.02.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2019 02:55:04 -0800 (PST)
Date:   Fri, 20 Dec 2019 10:55:05 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
Cc:     "dmurphy@ti.com" <dmurphy@ti.com>,
        "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
        "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jacek.anaszewski@gmail.com" <jacek.anaszewski@gmail.com>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "a.zummo@towertech.it" <a.zummo@towertech.it>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "pavel@ucw.cz" <pavel@ucw.cz>,
        "broonie@kernel.org" <broonie@kernel.org>
Subject: Re: [PATCH v7 02/12] dt-bindings: mfd: Document ROHM BD71828 bindings
Message-ID: <20191220105505.GS18955@dell>
References: <cover.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
 <702daeb9d8604e2feddd5f6f92b067a2d60d81ad.1576745635.git.matti.vaittinen@fi.rohmeurope.com>
 <f9b0fbb7b898691d09ed8954e8df67cf3706aa96.camel@fi.rohmeurope.com>
 <20191219143647.GQ18955@dell>
 <e734a11ed158814119256a3fac253a8574c90837.camel@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e734a11ed158814119256a3fac253a8574c90837.camel@fi.rohmeurope.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 20 Dec 2019, Vaittinen, Matti wrote:

> 
> On Thu, 2019-12-19 at 14:36 +0000, Lee Jones wrote:
> > On Thu, 19 Dec 2019, Vaittinen, Matti wrote:
> > 
> > > Hello Mark, Lee, Rob
> > > 
> > > I just noticed we have a dependency here. This binding is referring
> > > to
> > > regulator binding - which was applied by Mark and is thus missing
> > > from
> > > the series. What's the best way forward?
> > > 
> > > On Thu, 2019-12-19 at 11:46 +0200, Matti Vaittinen wrote:
> > > > ROHM BD71828 Power management IC integrates 7 buck converters, 7
> > > > LDOs,
> > > > a real-time clock (RTC), 3 GPO/regulator control pins, HALL input
> > > > and a 32.768 kHz clock gate.
> > > > 
> > > > Document the dt bindings drivers are using.
> > > > 
> > > > Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com
> > > > >
> > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > ---
> > > > 
> > > > No changes since v6
> > > 
> > > //snip
> > > 
> > > > +  regulators:
> > > > +    $ref: ../regulator/rohm,bd71828-regulator.yaml
> > > 
> > > This file is missing from the series and is applied to Mark's tree.
> > 
> > Shouldn't matter.  I guess they're all heading for he same release.
> > 
> Ok. Thanks for clarification. I was asking this because Rob asked me to
> reorder the patches a few versions ago so that the dt_binding_check
> Make target would not be broken between commits. He asked me to submit
> the regulator and LED bindings first and MFD (which refers to those)
> only after them. Thus I was wondering if the final merge order of MFD
> and regulator trees is such that it can result the breakage Rob hoped
> to avoid. But I am more than glad if the series can go in like this :)

It's not something that concerns me personally.  I only care about
*build* breakages.  Rob might be more upset about it however.

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
