Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A2A27179F
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Sep 2020 21:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgITTjW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Sep 2020 15:39:22 -0400
Received: from mail-ed1-f66.google.com ([209.85.208.66]:45048 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgITTjW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 20 Sep 2020 15:39:22 -0400
Received: by mail-ed1-f66.google.com with SMTP id b12so10762518edz.11;
        Sun, 20 Sep 2020 12:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EjOn6uRQVdPuymFl16y3sShxeseL+O0M4hlLdZpwFpM=;
        b=fzV3N2JP7Qn2Un3gsyBkgM9KrmD3SLAd7ErjwLLrv7C0svmYJIw/Su3cN5jzL1n75r
         zrVBbRp0adJmTob9fvSDvQTeINq0Fe9rGHzxfRP0yd1oHGM5CSes4h1H9lsNN2Af6+NR
         d0ulDLOpr/hTyADZvhy/M2cTvFeR3SoGBczBJ92jLgWJWYP4aoeh/bgd5MS1ieIJoYVg
         6ksqwh1EH+VLlfV5bSMH+63fjGtU1MA8xMNeQOL1kPDGpsLiE949brMg2FIGNi48s+UJ
         hRtgtzzp0Oyof5RPfv/PXU0EB+6wtwI2PdzADE7pvJ1dNlnFiXqjYGjwyU5Dq6cYL3ef
         fBbw==
X-Gm-Message-State: AOAM531mhHln8/YoTRQVgbf2mjMhbyiq8/5NMP0j+70D/dQvnqboSPB4
        aA6R66kZyihQ8588LXmKHUA=
X-Google-Smtp-Source: ABdhPJxm64DrxO2BCAhB/Z2FKAFGkrjja3e7GI7Mop9Y1YiJS/Mzx02Jc3rgIeVCd0fm8AibxTyTyA==
X-Received: by 2002:a05:6402:326:: with SMTP id q6mr48977643edw.216.1600630759279;
        Sun, 20 Sep 2020 12:39:19 -0700 (PDT)
Received: from kozik-lap ([194.230.155.191])
        by smtp.googlemail.com with ESMTPSA id bf25sm6956900edb.95.2020.09.20.12.39.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Sep 2020 12:39:18 -0700 (PDT)
Date:   Sun, 20 Sep 2020 21:39:15 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-unisoc@lists.infradead.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux-ALSA <alsa-devel@alsa-project.org>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        "open list:MEDIA DRIVERS FOR RENESAS - FCP" 
        <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH v2 01/13] dt-bindings: gpio: add common schema for GPIO
 controllers
Message-ID: <20200920193915.GA31074@kozik-lap>
References: <20200917165301.23100-1-krzk@kernel.org>
 <20200917165301.23100-2-krzk@kernel.org>
 <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAL_JsqJCLgf6syqV=jNPHPyu02ygwWCDDV+U9VCm0qRpLkirSQ@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 18, 2020 at 08:30:02AM -0600, Rob Herring wrote:
> On Thu, Sep 17, 2020 at 10:53 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > Convert parts of gpio.txt bindings into common dtschema file for GPIO
> > controllers.  The schema enforces proper naming of GPIO controller nodes
> > and GPIO hogs.
> 
> Did you not see my previous reply about a common schema? We already
> have a common GPIO and hog schema in dtschema. Please add to it
> whatever is missing.

Indeed, I'll enhance the dt-schema.

The trouble is that each in-kernel YAML file still has to mention
possible gpio-hogs nodes. Is the proper solution to put them in common
YAML inside kernel sources?

> 
> My goal is all common schema end up in dtschema, but I haven't pushed
> folks to do that yet. Ones I've done are there though. One issue is
> what's in dtschema should be GPL/BSD and the existing text bindings
> are default GPL, so there's a relicensing exercise. In some cases, the
> schema is there but I haven't copied over the descriptions.

Right, I'll skip the descriptions when posting to dt-schema.

Best regards,
Krzysztof

