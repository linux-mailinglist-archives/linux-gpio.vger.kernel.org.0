Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6E442A8D4
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 17:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237560AbhJLPyK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 11:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237532AbhJLPyJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 11:54:09 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB201C061570
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 08:52:07 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id e3so34670464wrc.11
        for <linux-gpio@vger.kernel.org>; Tue, 12 Oct 2021 08:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=9hjlZVhXoXo3FL11esprff5bCUJHk8umIxjYSUWWgeI=;
        b=kV0X6h2dQAv2MkM2vrW6GjCGiJI0xIG0PHHSVveSz2hyjC8lk8aMORT44wf492yBY1
         KBPSvLUoNxR8Em6FU6PL5kNNE5AWJ+K4PqUcdQhTiDLmJB6i1afD/q/xuDojGWMjGy6p
         TteAbpw7kviXf+aoTS45z0NBdEm9eS4jTmflE4qXJdhSuMoQr0zOQGciG1rm7MvDL7Z5
         FoAmvN/17V1px+kALM8NPM0nrOiNO8Ru15yur/HY4FXwkxFoDY9+a6u/mdLwqu53L9+3
         l08Rp8EAsF9ryAW7fCBLH8KlIhnVPBOZBVxhzU/VPtTn6nzxPw5uCh1b/vmMn5dvRI73
         YJzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9hjlZVhXoXo3FL11esprff5bCUJHk8umIxjYSUWWgeI=;
        b=avsqnkirUwzkfeS6Q6p4in2pnK9SMEHVJjSfJBC/X57PZOagcPVW1h5LuUUXy+cz2J
         DHqOWEGifID9YVKLItm0MPJFE7WtiHwzd4C9KwaAaWdHVhe13cNwJ22xg0P2H1IhsArA
         CrwXPQi+QJ3B7+Zu+cWi0oSxShtkk9JR0vza4g5lVBfIH8yriqsrOin3HFl7nBsgH/Vz
         5Syd1NB3Cw69cTpvZxZbVsIxm+IdcN6MMcHgDGUmBDj6CU+H8sIkcwFIm1OJRJGjxers
         SewVUJbQRQJvBMBJd8A8kkKTU8smcBhFDDmmHanvF8EX1AvmheDILYdDSQropGVTFAd2
         g9Dw==
X-Gm-Message-State: AOAM530Kk7zoVUU4oJXN+8uNE0wxT2YZZAbbV2UwPM/V10vG4X1LSnT3
        s49i93mbZfvvY5yJ66d3OrHauw==
X-Google-Smtp-Source: ABdhPJymeTTqFwbQopH1XYOQsNuPgTZb78WfIdf0kD+JmZX8+BYbhfIbLHpTNtRFuzH7N1t7JtCmgA==
X-Received: by 2002:a7b:c3d4:: with SMTP id t20mr6390465wmj.10.1634053926395;
        Tue, 12 Oct 2021 08:52:06 -0700 (PDT)
Received: from google.com ([95.148.6.175])
        by smtp.gmail.com with ESMTPSA id s3sm10875737wrm.40.2021.10.12.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Oct 2021 08:52:06 -0700 (PDT)
Date:   Tue, 12 Oct 2021 16:52:04 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>, Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [RESEND v2 1/3] dt-bindings: gpio: Convert X-Powers AXP209 GPIO
 binding to a schema
Message-ID: <YWWvJKs8K9Z8WIGV@google.com>
References: <20210924071614.868307-1-maxime@cerno.tech>
 <CAL_JsqL3BUX8jO4X12Au_VAytboisQAoxDYz03rQfDMJjL4EDA@mail.gmail.com>
 <YWWg0PjnuBCKO3Tq@google.com>
 <CAL_JsqKK_ZC95QfDYsKWdFM3bF+DD7wD=R=--6d74DwqHkgexA@mail.gmail.com>
 <YWWu+t487giK/FB2@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YWWu+t487giK/FB2@google.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 12 Oct 2021, Lee Jones wrote:

> On Tue, 12 Oct 2021, Rob Herring wrote:
> 
> > On Tue, Oct 12, 2021 at 9:51 AM Lee Jones <lee.jones@linaro.org> wrote:
> > >
> > > On Tue, 12 Oct 2021, Rob Herring wrote:
> > >
> > > > On Fri, Sep 24, 2021 at 2:16 AM Maxime Ripard <maxime@cerno.tech> wrote:
> > > > >
> > > > > The X-Powers AXP PMICs feature a GPIO Controller supported by Linux
> > > > > thanks to its device tree binding.
> > > > >
> > > > > Now that we have the DT validation in place, let's convert the device
> > > > > tree bindings for that driver over to a YAML schema.
> > > > >
> > > > > Cc: Chen-Yu Tsai <wens@csie.org>
> > > > > Cc: Linus Walleij <linus.walleij@linaro.org>
> > > > > Cc: linux-gpio@vger.kernel.org
> > > > > Acked-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > >
> > > > > ---
> > > > >
> > > > > Changes from v1:
> > > > >   - Removed the example and moved it in the mfd schema
> > > > > ---
> > > > >  .../devicetree/bindings/gpio/gpio-axp209.txt  | 75 -------------------
> > > > >  .../bindings/gpio/x-powers,axp209-gpio.yaml   | 55 ++++++++++++++
> > > > >  2 files changed, 55 insertions(+), 75 deletions(-)
> > > > >  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-axp209.txt
> > > > >  create mode 100644 Documentation/devicetree/bindings/gpio/x-powers,axp209-gpio.yaml
> > > >
> > > > This one not being applied with the rest of the series is also
> > > > breaking linux-next.
> > > >
> > > > b4 am -P_ -sl -o - 20210924071614.868307-1-maxime@cerno.tech | git am
> > >
> > > Thanks for the link.
> > >
> > > Seeing as there are no *real* dependencies, it would be better for
> > > Linus to take the patch (if he's okay with it of course).
> > 
> > Only that 'make dt_binding_check' is broken for anyone using your
> > branch (and linux-next ATM). It's as real as a broken build due to a
> > missing header. If you don't think this is a problem, then don't apply
> > MFD binding patches.
> 
> Ah, I missed Bartosz Ack up there.
> 
> Happy to apply it.

Linus, Bartosz, do you require a PR?

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
