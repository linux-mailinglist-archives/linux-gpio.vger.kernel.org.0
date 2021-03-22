Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0569B3440AA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Mar 2021 13:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbhCVMSE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Mar 2021 08:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbhCVMRj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 Mar 2021 08:17:39 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9459AC061574
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:17:38 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id f16so20800632ljm.1
        for <linux-gpio@vger.kernel.org>; Mon, 22 Mar 2021 05:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LHJdSqMJsAMLhWC6ZVJQV8NXmp+oAmJkXXQd26aDoiE=;
        b=h3NcVGiCg2wo98bvXiJ0lMcVh5njwSc1Xi8m6u7tmaEYPqdmxi83dAutZkV+QyZvIB
         zpReLX3GyZwoPcKHpRps1q1qzqtIIhn+9K5nxnXIAS+y/TfsyWQ0yODdHWfdmMT/pdsV
         HjT6CVtsIMzgGTNqqg6ijCeO+I121yQAUPz4mIOrZiX72X6PJmoo+5loGjFZoGkHU5k0
         QEUr+fGnrtvGn/uGpjzTecvbRMrN3O1FW7SJWYbTcD5HqZjIlI07aHxbSsrFoWsIXc3W
         V5f7iJj4PMwXpqhXNCbJG86p0PTEpo/NLRUHPY62gdLWWx2mTJY/ibZMpreOKU62HFMo
         3QuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LHJdSqMJsAMLhWC6ZVJQV8NXmp+oAmJkXXQd26aDoiE=;
        b=Yaf9rxBztfikjrNdyPKCrwYmzBoFftG9jNP4pcgtMKEGsbP5z74HOJgYRAqteucxYc
         /rYYdsF8Kxu51r8PtX/jV3umxHC5K2C51YBmb3ZwxcCzY/36sk5xwOa+P48P4BEC1EYL
         5SxUay+vukL9/z1GMooLEpm+e0S2CArCZ4Dh6w9NmtaWFYC5YEIb0gFrpetybs7HCI53
         Sisz1lOnLnQUgexVO1W/obvzCSpk5xcWzlokGjYljUMJWtnrMdITJl6a+KvwLZ6nk07y
         oiFberSX7jpDBDhMSWJTK99KM5M/RcZuTfqLma2zrRVNMpyVe8OP5/EKjfY8FPz3FmGe
         Y9Bw==
X-Gm-Message-State: AOAM531kdyPPV1P57DyxYCcz/aFPYe2ULYRGALxgcr3pxxlTdGE/6yFe
        rjkycovpyhsXgesWwy4b0CmHTp5VGUXkr2ojsTL22A==
X-Google-Smtp-Source: ABdhPJwL/fBiStggm4HK4L8KFT8+MpOV109yIULqWwKA14grJh36M71RZErLfkRWe7YsbLo5Isti53ifQckF8sBwPQc=
X-Received: by 2002:a2e:9004:: with SMTP id h4mr9618443ljg.326.1616415457130;
 Mon, 22 Mar 2021 05:17:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210317155919.41450-1-alexander.sverdlin@nokia.com>
 <20210317155919.41450-2-alexander.sverdlin@nokia.com> <CACRpkdbnc2UHM8w85DjsoMKoim-pSX7-7c2YOUnUDdthNc9Vpw@mail.gmail.com>
 <5a163661-ec37-c8d0-24ce-440336e32c33@nokia.com> <CACRpkdYoK03nYRYCHS-0Fj=i3pTuN1-EyrVW2jaG92AyVogYJw@mail.gmail.com>
 <ee619663-80e7-f6c0-9f73-d3ff7438773f@nokia.com> <CACRpkdYnxfb1wQDxpLOs7H9-3cTm+dtQRpNxmQBGLce_TYwOCg@mail.gmail.com>
In-Reply-To: <CACRpkdYnxfb1wQDxpLOs7H9-3cTm+dtQRpNxmQBGLce_TYwOCg@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 22 Mar 2021 13:17:26 +0100
Message-ID: <CACRpkdZn9EHTH+MJtph3MUF1WxuTZzbTqRmtec=XgVUoy5VZsg@mail.gmail.com>
Subject: Re: [PATCH] gpio: pl061: Support implementations without GPIOINTR line
To:     Alexander Sverdlin <alexander.sverdlin@nokia.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Cc:     Marc Zyngier <maz@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 22, 2021 at 1:04 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> The thing is that hierarchical interrupts are supposed to
> connect the lines by absolute offsets that are *not* coming
> from the device tree. This is the pattern taken by other
> in-tree hierarchical GPIO controllers. We have repeatedly
> NACKed patches adding all the IRQs to hierarchical
> GPIO interrupt controllers, in favor of using hardcoded
> offsets in the driver.
>
> Do you have some good idea of how we can achieve that?

One way would be to stack more compatible strings:

compatible = "lsi,axm5516-primary-gpio", "arm,pl061", "arm,primecell";

Going from more to less specific. We see that this is a
PL061 and that it is a primecell, but we also see that
it is a version specifically integrated into the axm5516.

I do see that today it looks like this
arch/arm/boot/dts/axm55xx.dtsi:

gpio0: gpio@2010092000 {
    #gpio-cells = <2>;
    compatible = "arm,pl061", "arm,primecell";
    gpio-controller;
    reg = <0x20 0x10092000 0x00 0x1000>;
    interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
        <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>,
        <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>,
        <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>,
        <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>,
        <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>,
        <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>,
        <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
    clocks = <&clks AXXIA_CLK_PER>;
    clock-names = "apb_pclk";
    status = "disabled";
};

(Indeed this doesn't currently work with Linux, thus this
patch.)

It is indeed specified in the schema right now as:

  interrupts:
    oneOf:
      - maxItems: 1
      - maxItems: 8

So from a devicetree PoV all is good. But it is not the
way hierarchical IRQs are supposed to be done IIUC.
The preferred solution is to use a specific compatible
string and hardcoded offsets.

It'd be nice if the interrupt or DT binding people would say
something about how they expect these hierarchical IRQs
to be specified from the device tree. I'm just representing
earlier review comments here, maybe they've changed
their mind.

Yours,
Linus Walleij
