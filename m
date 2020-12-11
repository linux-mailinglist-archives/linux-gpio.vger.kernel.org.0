Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746F42D8297
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Dec 2020 00:07:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437024AbgLKXHD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 18:07:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437056AbgLKXGk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Dec 2020 18:06:40 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 922CEC0613D6
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:05:59 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id m19so15569796lfb.1
        for <linux-gpio@vger.kernel.org>; Fri, 11 Dec 2020 15:05:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VPtMdGDRGuPEDGFmGnMvWlPbwtTye9nLOQ6zo2Mm3+s=;
        b=Tkxo8ubznZ/ihmwdGKwM0mnEC/9Inp+35eFt9HZ4SSZ8hVM2LajmncJVbJ8vVT9g7Y
         Bzevfd9OPqrtR7vCmS+Qyq9Q66deWC7tSue0PfNWMwfZw+4NMc6PVS3sMyL2AEgdJLVQ
         bs5Q8FBifb8fdc0t8MaeXkMsujAtyFcoVR93gBdo3ts2xXxu84uSsSc7nvDA31bMjA0T
         zyDFK0CL+q56OwKRrpoRUSRwndyj0xZxR5Awy2lgC48HQMSVM7YiZzG6POcphjwjahwN
         rIia2uSFw7gU6bSo0F+0LAg6gQCxPIftjemfQbohCg3tLqSw2jxFdpQ51oypEL8ksD+W
         HPYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VPtMdGDRGuPEDGFmGnMvWlPbwtTye9nLOQ6zo2Mm3+s=;
        b=kw8e0uZ7F4bKYt5IEbdWEVKs2Q5JMOMJb43JpmXlmKVfd8GmF/laWurIw7ZTCwnO0a
         AU49T8OkCK6A22WC1u7UGzEZ5XQ1Cs5KQmCYN7cAFXx+HuDFCqCCi5eMBckeJee74r9G
         IH+gtoEV8e6UbrmFi+a8xSTMTh66FrxhgD2D52pGKd3CVchDxXzpDSmOLwmPJz4FedlO
         waT5dHPLmC2rVHjqV50mqh74VtkSx6ad+jwEmHArVmQN1vUdOjSyzj1dQe/D96NePev1
         oscVNv705ZElaTcHF3MMeoj/HZbVL/yb4c0H932PD3/9PPk0NO82l1XbNZldDm2kJfXF
         DcuA==
X-Gm-Message-State: AOAM532QR0GHTnI60Cm5bZeJ95ojxfL0wNWWQimdYZ2mQW3QNMNvvkpy
        kh42SYUl7NRuFZnvF0gMjpYVXEMFoZYKvwiRV03uDQ==
X-Google-Smtp-Source: ABdhPJyG4JiWO5sICrhd+prNYw2YnrYATbC3tLV3EewLAZiuaES/S08tUz/dKCFSdAJ+lv7Ji7zysfJtwScFy5P1idI=
X-Received: by 2002:a19:7d84:: with SMTP id y126mr5515292lfc.586.1607727957931;
 Fri, 11 Dec 2020 15:05:57 -0800 (PST)
MIME-Version: 1.0
References: <20201211094138.2863677-1-nobuhiro1.iwamatsu@toshiba.co.jp> <20201211094138.2863677-2-nobuhiro1.iwamatsu@toshiba.co.jp>
In-Reply-To: <20201211094138.2863677-2-nobuhiro1.iwamatsu@toshiba.co.jp>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Dec 2020 00:05:47 +0100
Message-ID: <CACRpkdbsELwWeXe1jM1PpBtgo5oiKOx7MwVA06uS1-ZvaLKnRQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: gpio: Add bindings for Toshiba
 Visconti GPIO Controller
To:     Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
        Marc Zyngier <maz@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Punit Agrawal <punit1.agrawal@toshiba.co.jp>,
        yuji2.ishikawa@toshiba.co.jp,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Looping in Marc here:

On Fri, Dec 11, 2020 at 1:43 AM Nobuhiro Iwamatsu
<nobuhiro1.iwamatsu@toshiba.co.jp> wrote:

> Add bindings for the Toshiba Visconti GPIO Controller.
>
> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Punit Agrawal <punit1.agrawal@toshiba.co.jp>
(...)
> +          interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 31 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 32 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 33 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 35 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;

This is an hierarchical IRQ controller. (These IRQs are mapped 1-to-1
to IRQ lines.)
I was under the impression that we don't encode interrupts into the GPIO
controller like this when we have that.

Instead, hardcode these into the driver. The compatible string gives
away how the
local offsets map to the GIC IRQs.

Add no interrupts to the node but make sure that the GIC is the parent.
(Should be default.)

Compare e.g.
Documentation/devicetree/bindings/gpio/intel,ixp4xx-gpio.txt

Which has a similar "some hierarchical IRQs" setup.

Yours,
Linus Walleij
