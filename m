Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5AB592CFF8D
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Dec 2020 23:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgLEWg7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 5 Dec 2020 17:36:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbgLEWg6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 5 Dec 2020 17:36:58 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7BA0C0613D1
        for <linux-gpio@vger.kernel.org>; Sat,  5 Dec 2020 14:36:12 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id d20so12686174lfe.11
        for <linux-gpio@vger.kernel.org>; Sat, 05 Dec 2020 14:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=98/MstnJqZxw65t8jmHQ0ippOkTKpuxcEvb3zk0y3Z4=;
        b=jy6szEVCLds/Yg9OxwGE13hDrjf22xHnP5ig2343dm0XsQwN0nUxcRCpCs0r9DNIbS
         W3lY9qkUBv7tInfZyAkkZO5VKRys4CWgAqZvWOhG8gAn0d9KEY6qfDTcuAWiF7gTYaeC
         /ltv7ueALdD2HWoLQ8Q+KgaCyjXrp+z4BoGH2Yp8JBYfv9P0HayeYWoZB95LhaFfqFFQ
         lKrplAt55pfQ+b5Dl4p0fSzAVyWQEt0m1kvLDZj79LsNyLxKBlWYiomP57suz/myH/P7
         MWcPURUlumDheFJhSDnQG7N0WKPt2G4TKFbUWhhNiLN3Ryqn+k4M1Nsq6KrR1ZKGAOUQ
         xN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=98/MstnJqZxw65t8jmHQ0ippOkTKpuxcEvb3zk0y3Z4=;
        b=NYorMmdvoc6KDWq+aCThHb+dErNA3dT15Acyw3+WohQ7OdRdr5914M51ynrQpKtIw4
         Svqo4L8+4ZDJx2+REg4ViMmNo3RLGFr327c7k2rjAE5nSzzRm32kE9bs+Yyi6P75lOlG
         zBLwjp2YG1vuklk21CADzWvJpDwwL1JRzGmIfZvtrIdUmHW0W3qwuGEszJbZgfAb7A1n
         FdNfoMxB3QgMPIzCUhglFREoqSGq+JTyAQQY3mLfDzRsff6dFb6LpOU0gwerqwKCoTnU
         ypuU3VCEoRxsBkp2wqe9dii1IXLeRBXIwVnORiItynmEWIoRfG7iCH3jqY8aAyyVjW+T
         9eHQ==
X-Gm-Message-State: AOAM530ziVVOAJFqI6N7uKHTKymGzeEkf/I3xB+vJJBALxNZQRbFr95j
        3mQgY9WMzGXuInP1CUj751uyKxgLLvQnYDadCSA4Lw==
X-Google-Smtp-Source: ABdhPJzzsCc4rL9lN6ah8nXKuIds8BCeYVyLpkhHW9HL1ismhbC9zdOlB0A/w+xFWb4xfQqxpguiH2gfF+LS+frM7s0=
X-Received: by 2002:a19:5f11:: with SMTP id t17mr5388052lfb.572.1607207771145;
 Sat, 05 Dec 2020 14:36:11 -0800 (PST)
MIME-Version: 1.0
References: <20201202163443.26499-1-srinivas.kandagatla@linaro.org> <20201202163443.26499-3-srinivas.kandagatla@linaro.org>
In-Reply-To: <20201202163443.26499-3-srinivas.kandagatla@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 5 Dec 2020 23:36:00 +0100
Message-ID: <CACRpkdabPygUmZXT6FMT4fEU6D638Y3XRwvODy8ucUAbuQ4kvg@mail.gmail.com>
Subject: Re: [RESEND PATCH v6 2/2] pinctrl: qcom: Add sm8250 lpass lpi pinctrl driver
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Dec 2, 2020 at 5:35 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:

> Add initial pinctrl driver to support pin configuration for
> LPASS (Low Power Audio SubSystem) LPI (Low Power Island) pinctrl
> on SM8250.

Patch applied!

> +config PINCTRL_LPASS_LPI
> +       tristate "Qualcomm Technologies Inc LPASS LPI pin controller driver"
> +       depends on GPIOLIB

I added:

    select PINMUX
    select PINCONF
    select GENERIC_PINCONF

When applying. You need these I think, your code is working because
other drivers are selecting these for you, right? The build robot would
hack this to pieces though.

Yours,
Linus Walleij
