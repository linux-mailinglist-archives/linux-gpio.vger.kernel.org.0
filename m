Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 266AE26A1A7
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Sep 2020 11:07:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbgIOJH1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 15 Sep 2020 05:07:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726470AbgIOJHB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Sep 2020 05:07:01 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C35C06178C
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 02:07:00 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id j2so2440213wrx.7
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2020 02:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=iopdDFEV2kcDalmETaYONWkweONCMxEbTqjAdtlggGQ=;
        b=Ex9+iyZF0nSnE98P6XxFSFn2Qr6RKGJT9NJVVFLYJISLvYD24STWt1cwuyIrEv7AGy
         sP0WuC46a03FvkRZLXVx5xE6pcQFtFgoC3LiwIcVRycJy8bbR5X+rHYiSdyxwtHYpl7s
         eyT/zR0w0k1wv8sgIiLzta/7OwIjVAAZslhmceTEKnBoiZ7/YIAXK+vuOIIW8EffumyS
         jOttUI28vi4VZtxK6ul2JlMEDBKk7/iGBCui1RTxCYJKIyCAuI2iL/asT66Fv1iX5Smc
         pU4PfNElcNEVScpeZTP4Jih92ddhoBRA9DOtk50geGMJi31Te0vCFCiEX9aizLxR1EWE
         6WfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=iopdDFEV2kcDalmETaYONWkweONCMxEbTqjAdtlggGQ=;
        b=X0awMHiIaVyfydiyIFejqV3l00OTKWSSzL9oHIE6bEW/f+j9r/PAt7ekCN78WS0i/Z
         1+xhCdKeX8x7kMhMbjMt4ZI5xRIKmYUfLnyw0UQRZr5CtfSXCW0NJ+ZjSE3NzPPtFvnR
         DAXIFy5DskJO2x24VReLAbWqPCDG0MM+OcmLk6jEaMkfrC32kcfDB//v1h7bwmqvOEug
         WOdUvy8jn9Y7lNR46Dc1OhJnDL9Vd7HMevhQQw6Qsaq0udDzTT3CjnyExkklxv6htAf8
         SIErRFW3kpaB5XrH9biN2e20Ool3MEkiI+Il0PS1AQiJWluq+VUNE53Ox2P2jfFOaKom
         nb3w==
X-Gm-Message-State: AOAM533Cbr6L9lAKeUIot2XIg4VP3r7T0HtxchfptPnVLUJ5W6KkKZuW
        mlTdHUNKCjhFFRX9INZaxDvIvQ==
X-Google-Smtp-Source: ABdhPJx2bfrpPqM9pdtBgNL8nxLLX0feu+7+qjnCb6gt9yRhwnwDkDEVna9PRLFtFA/C5I0AO+N9Uw==
X-Received: by 2002:adf:dd44:: with SMTP id u4mr19467349wrm.22.1600160818971;
        Tue, 15 Sep 2020 02:06:58 -0700 (PDT)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id y6sm25430501wrt.80.2020.09.15.02.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2020 02:06:58 -0700 (PDT)
Date:   Tue, 15 Sep 2020 10:06:55 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Michael Walle <michael@walle.cc>
Cc:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-pwm@vger.kernel.org, linux-watchdog@vger.kernel.org,
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Pavel Machek <pavel@ucw.cz>
Subject: Re: [PATCH v10 06/13] pwm: add support for sl28cpld PWM controller
Message-ID: <20200915090655.GA4678@dell>
References: <20200914214341.14268-1-michael@walle.cc>
 <20200914214341.14268-7-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200914214341.14268-7-michael@walle.cc>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 14 Sep 2020, Michael Walle wrote:

> Add support for the PWM controller of the sl28cpld board management
> controller. This is part of a multi-function device driver.
> 
> The controller has one PWM channel and can just generate four distinct
> frequencies.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> Acked-by: Thierry Reding <thierry.reding@gmail.com>
> ---
> Changes since v9:
>  - fixed double whitespace in Kconfig
>  - improved comment about division

Uwe, are you happy with this now?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
