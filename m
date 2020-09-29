Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83BC027C759
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Sep 2020 13:53:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730476AbgI2LxS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Sep 2020 07:53:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730837AbgI2LxM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 07:53:12 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F319C061755
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 04:53:12 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id b19so3750514lji.11
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 04:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Kx4a5n3dqvCrWEJOLHbORqwKT2evqfk9ebyuySfjOtg=;
        b=OU7vwQdKxZ0/LaLBIdqXX1+fIXXyIvw8rgTl5QRSBJhESRYdc+j2h3iupiQg5463Ye
         KpfwCQcP+xtHykzaTmJ9hEtNQrN6jBPCtgtWGSznjpNY43P11jxRguU/ZwMmO4/5LU+s
         /B86olt2GnMoT4tgsoiZvB6K8+GUIe0XKu14UZ9uoHpd2BwqL6fbPHzvNYWgCjD2j5fJ
         T1ao/LSG4lXpoeuTLGxjwwNnBCuc4B/3d/ATesyG1VUkEFnyfPT1JHT5MyxU9X9KqTMc
         AkIr2rqMMJV8WtiZXs5bgM2acO0IM+QnbjKL5+AIJ0eDAnqnQGqIpSPgfScOloVYzq4b
         ebSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Kx4a5n3dqvCrWEJOLHbORqwKT2evqfk9ebyuySfjOtg=;
        b=L7khpaLCgY6rcKT9LyYxa81MtC15YfLt9mDDzWCTxvZwpkA9mnjWO8NqWHCV9dM4lu
         IkiS+jMln0RsW56QXSnvdXQ+rJtmlP+ogUdhi9M2dzFT97CUSbXbgwugEl03mv8caTLz
         rX+RPU5zaSKqNYIuamSV3ejANDMngia/MuTIWNqSjHv6T6JZ5BEMhyEqM9aHU3L4e+Pr
         +E+BfqvSAKptEgnPP5y1xKYoB793FU6GBObDE6+verDIcfKjqK2zkdM3PYqv0lrjQ0ly
         0pkXbcYn0sTNeWEz2gx5yqWhq9sLJiUlVgabQjdiPeeHwSAKCt88PaHR5lw70K9k3y/u
         trig==
X-Gm-Message-State: AOAM5301NZRfqHg0TcFtk+bHEwBfC7hNXxxJWMey/rPSko7BrN5oJR9F
        RKGxnZ7Qz1I893puavmlvKlskfgtUHoVYhA7q/aHWA==
X-Google-Smtp-Source: ABdhPJyxfzQT2BAD2WMXJzi6V2K0dviJaIo85pSr+uDq2VHCHbTzqO83RgDyn4bkGg9eSg6Wd70UX8hhNgt6tNi9V6E=
X-Received: by 2002:a2e:4e01:: with SMTP id c1mr1004508ljb.144.1601380390453;
 Tue, 29 Sep 2020 04:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200920195848.27075-1-krzk@kernel.org> <20200920195848.27075-2-krzk@kernel.org>
In-Reply-To: <20200920195848.27075-2-krzk@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 13:52:59 +0200
Message-ID: <CACRpkda=R+=GBGGXrvjA9PUtq_t5772=Qd-9X9unhx=QTusnSw@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] dt-bindings: gpio: fsl-imx-gpio: add i.MX ARMv6
 and ARMv7 compatibles
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Sep 20, 2020 at 9:59 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:

> Several DTSes with ARMv6 and ARMv7 i.MX SoCs introduce their own
> compatibles so add them to fix dtbs_check warnings like:
>
>   arch/arm/boot/dts/imx35-pdk.dt.yaml: gpio@53fa4000:
>     compatible: ['fsl,imx35-gpio', 'fsl,imx31-gpio'] is not valid under any of the given schemas
>
>   arch/arm/boot/dts/imx51-babbage.dt.yaml: gpio@73f90000:
>     compatible: ['fsl,imx51-gpio', 'fsl,imx35-gpio'] is not valid under any of the given schemas
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Patch applied.

Yours,
Linus Walleij
