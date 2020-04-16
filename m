Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A62511AC0C5
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 14:09:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2635058AbgDPMIy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 08:08:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43466 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634932AbgDPMIu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Apr 2020 08:08:50 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32932C061A0F
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 05:08:50 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id m19so5347871lfq.13
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 05:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CLvpaW+uUne5it3kIWzMOUIojoXmf6oiO8ThkN3cpkY=;
        b=Ys8YKsXM6fXzEeMjXeuG+QrbM/PhTPcxJ/fam+5PAoc1qC2WvmrsY0zCOurzWs1M5I
         3sVoZJJLm1ofXVvre/Sc6/ghosEAS1wVxrAOvEzOCdRTBb/WK+AgqD8Nmy+CnyFizLUZ
         L/EvT45dNlnZ6otQAvt2GzByEZbLdahUAYxuljFzlLSWJcku7egzOHNJrCWuYclSWmEv
         WYf4EuwTF3S84+A9OCLMOsvtxAmXAPegR3uJp/VlbGXa3otOO/iaw4fwur65G2SuCAGG
         zdyjLkTZYkbaQb+RCwu0LL/FfPrD3chTjG9bSUI1CHcHY2lqFBF5mRbAd+PmDEB8x7DV
         PaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CLvpaW+uUne5it3kIWzMOUIojoXmf6oiO8ThkN3cpkY=;
        b=atdi1FioRnLlGid11f5AIjsmJtneuTNA4sm82zJikDKdGUmxEf3oS158Xs3OFcDFpa
         +B6CNOTJ1E9kFt7OxwWW8Y9PLgBOO8mxH00bXFPYgU9YBLhsLU/Jdw586CRyWwnOS6dm
         BDbY/z6izfgOeZWR4fNLIda+321cO3cjynvCAVJYT0P8nagqlUHn4KoxqNwOkfZ3WhFJ
         q/zL5f7X55Q1L+jpEYClzvQWX9dvzWQB03EuPdcPPExbbQgc0zhKGyG/j4j8F2bpCmJ7
         qrSR7J9tx6PmwGg3eBUEQI6B+L+7A/7t8uN35HvLuzqvCr8uh55qgzg1Y+kPGMWfjv7B
         ENvQ==
X-Gm-Message-State: AGi0Pubss0p84nCsx8nUT5+KoBBWoN8HelT+867KrIBd0PjtnBWPg8qC
        CEECSxURsxtc0epbY/6527mlUDourvxAq1xMVKOPxg==
X-Google-Smtp-Source: APiQypJzhCYUXv7QXcnsa/vkCVwefo5n3281I83Ws1Af1XZup/G2mwOYqWP5CDfj73shqpvSNrbcQ8jDk5V1Fzze4mQ=
X-Received: by 2002:a19:700b:: with SMTP id h11mr6005687lfc.89.1587038928602;
 Thu, 16 Apr 2020 05:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200329104549.GX25745@shell.armlinux.org.uk> <CACRpkdaL4-Z36aKOVW4o2MtCG9fbqm4gxZN3QjejVRPBZrzxxA@mail.gmail.com>
 <20200416081412.GG25745@shell.armlinux.org.uk>
In-Reply-To: <20200416081412.GG25745@shell.armlinux.org.uk>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 14:08:36 +0200
Message-ID: <CACRpkdYFBGvQX3i4P1+cF5ExXOSKieT6cJNPTNuKFxEhtJVEjQ@mail.gmail.com>
Subject: Re: [PATCH RFC 0/6] PWM fan support on Clearfog gt8k
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Mark Rutland <mark.rutland@arm.com>, Andrew Lunn <andrew@lunn.ch>,
        Jason Cooper <jason@lakedaemon.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Gregory Clement <gregory.clement@bootlin.com>,
        linux-pwm@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Uwe Kleine-Konig <u.kleine-koenig@pengutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Apr 16, 2020 at 10:14 AM Russell King - ARM Linux admin
<linux@armlinux.org.uk> wrote:
> On Thu, Apr 16, 2020 at 09:51:37AM +0200, Linus Walleij wrote:

> > The gpio changes all look fine to me +/- fixes for review comments.
>
> I think Uwe is incorrect for his GPIO comments; the clock is only
> optional on A8040.  We know this because A8040 has worked fine
> without PWM support without the clock, whereas for Armada 370,
> the driver has hard-failed if the clock is not present.

It's fine. You are running the hardware and it should work for you.
I usually go by the IETF motto "rough consensus and running code".

> About the only change I would make is to move the check introduced
> in patch 2 into patch 3 instead, inside the MVEBU_PWM_SOC_VARIANT_A8K
> case, so that deferring for the clock works (which is necessary for
> the PWM driver to be useful.)

OK let's go with this.

Yours,
Linus Walleij
