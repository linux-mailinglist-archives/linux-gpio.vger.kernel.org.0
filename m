Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DFED526F1
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 10:42:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730782AbfFYIl7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 04:41:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42314 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730668AbfFYIlh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 04:41:37 -0400
Received: by mail-lj1-f193.google.com with SMTP id t28so15358889lje.9
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 01:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yY87oqTTD0Lxu/Nod5+FQjpzkb9Bg3pO2iG7HQ35E9E=;
        b=jy18i/ewXTLgSvPyNLRaupblj/y1T6RuSuzYOmPX9Rgd5ez/9RF4JcwCLM01Ki7+VD
         Mw5HQ7AHG8KHsR5lDtc5F0J+vvOHsVnN8x7Z0VxqkiQBcWFPRj0tKwvNTVFWT7+kwa1o
         CEz4MKcqB2akH4600BMlytNemC6KpfZ33ALUx0+guDJ1Mi3r13EBkSR1eYCAzLR4vLW6
         5k1HUIjZywUQ5iTZwCWcARRV4pNq1caXQH1Z1u88Dg/rbv/Zbka2U5D1RwqR3Io1AUGC
         CfJiRiBAVFDvL+akBMKt/EM4x1oAIOFHEABhAVVZBiPpfsZMNL+2AM65JSiPMyuwqe8R
         45ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yY87oqTTD0Lxu/Nod5+FQjpzkb9Bg3pO2iG7HQ35E9E=;
        b=ZwQ3wktjJx9e3jlFthV1vMDGIn2eY/AitJOz/Ng2ybmUg51VNNrdz7xwbuUHlrEjf+
         SNa5kHPatOKxdH8EYjKu5yQ2uVLAR+vxzoA7+44Wj2yz9QhsAyOx9TZNo/INwCmnEvP5
         pVuT5w+APMiTgQ9sDJn2fjW4a89ZYyWIhciZpsyl9+fIJLXmATJNQAbx/d7fByZ7/y83
         7MpJOnDqq0iqvGqBgk7qa0Pi6rGQnD15WJhX+V3unwAwflexPoe3AoFWoO1rmVVK0Z03
         5aasl/otqKY40ALgCr6HWbsO28pgudbIAh4MjSRhNeHPNtQvNJTIwJxWBeSZ1dNBpDLA
         6Gmg==
X-Gm-Message-State: APjAAAW26UDVWL0fHXR3izaiGEF5OT8ziuf7JiW5aL3Js1Ecgi2VY/7A
        RxRqJQSIv6SIBJj+iMGnQhVcPYQDi0iziScVLtYmpQ==
X-Google-Smtp-Source: APXvYqy6jIwHwap88t5Oaa18Ta0HSwKvS14nJn1eTrjidyPzk7gb5fytFaXhj7sVmPkrE39Kdr2drRh47kPrl+2xWxs=
X-Received: by 2002:a2e:a0cf:: with SMTP id f15mr8401315ljm.180.1561452095250;
 Tue, 25 Jun 2019 01:41:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190611122535.23583-1-Anson.Huang@nxp.com> <20190611122535.23583-3-Anson.Huang@nxp.com>
In-Reply-To: <20190611122535.23583-3-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 10:41:24 +0200
Message-ID: <CACRpkdZoySkQHc7sbHchR6O0UqxAjp8FS+ubdbXqESGnotDDpA@mail.gmail.com>
Subject: Re: [PATCH V2 3/3] arm64: defconfig: Select CONFIG_PINCTRL_IMX8MN by default
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Olof Johansson <olof@lixom.net>,
        Simon Horman <horms+renesas@verge.net.au>,
        Jagan Teki <jagan@amarulasolutions.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 11, 2019 at 2:24 PM <Anson.Huang@nxp.com> wrote:

> From: Anson Huang <Anson.Huang@nxp.com>
>
> Enable CONFIG_PINCTRL_IMX8MN by default to support i.MX8MN
> pinctrl driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> Changes since V1:
>         - sort the change in alphabet order.

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please merge this through the ARM SoC tree.

Yours,
Linus Walleij
