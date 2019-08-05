Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E2FA5815A3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 11:39:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727357AbfHEJjF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 05:39:05 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:34452 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726454AbfHEJjF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 05:39:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id p17so78741680ljg.1
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 02:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4OPoeAcP1A5mqwy6qFd8vLmNAKWAe1p53hw6o+WqWT4=;
        b=OV1qyXMiWvVc/Vac6X0UmU3u8pprzj0rSq71hMjBU8xtb05Rtzxm4DWYynedYvPo7J
         4miDsvZc2iXNvnNzPkj979CaCqoNBgjybVRpWaUjnqcf4rDpH4j6h8XJqPODq4v4KEke
         hLL0elo/qlCz4TbNLtrZS26VAruHlPS0uAXMg2pG3DniVVjKfdkdVDSR0X417dJOaPnD
         PVr1+tSoCjAJzs5CIkykoN8PnZ+CryZEfTdAQc9KAifXH29eXDMH/nyF/jOxqUFqN35c
         FPVopu9gZhPADM5b67fqzwrcvD5u/kCplB6hNQ04kCnyzsguwvJ/q5J7h6+coMWLrqed
         2d4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4OPoeAcP1A5mqwy6qFd8vLmNAKWAe1p53hw6o+WqWT4=;
        b=hHu7n/aoajNkqRhuX6PH/PuaknNLfHx5igG2R47VrKiSfD5nDWiyoZwnT7JionuCmU
         YiaQ+sIEI98R3JaBDYsWGFDaC798N57tfcVPH5yifV9b4++5PdBFLK48/5+e3PkSkxzY
         jGdKAoreycK7FuOsqOfULIyu6I52iLVgPwQ9PBPMEBHQdxhhYYZzFJA0yXtAFN64y0o2
         mA2pLtYiizdcBlYWOMEI/FgsRoKDtGj1plmnpmQxnjCY0i7Tt2AQch1e5aStZcDLicYm
         Z7ZXpkECShQ6ePOao4z/H4otzGxSF8JI6zMPzMfhNUgjg35HYWGXHagqtqzs9HcHXeYl
         SSwg==
X-Gm-Message-State: APjAAAUXnZhxeODSglpi/NLxLqu4I7DmXaaWcBiwsgF7IgdU11zojOKm
        MsORJCuE90Qh6WOG8foFyuUHiUqxxa9kADvVa61TxA==
X-Google-Smtp-Source: APXvYqxLKF9i6t/614MmaviWtNy0DDQNZAvHLaTkOyZ635eFHTQY+3LCGLOTkAmzB9cPvRTg/nqwrQ2WBwcpMBU06F0=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16346425ljs.54.1564997942805;
 Mon, 05 Aug 2019 02:39:02 -0700 (PDT)
MIME-Version: 1.0
References: <1563776607-8368-1-git-send-email-wahrenst@gmx.net> <1563776607-8368-3-git-send-email-wahrenst@gmx.net>
In-Reply-To: <1563776607-8368-3-git-send-email-wahrenst@gmx.net>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 11:38:51 +0200
Message-ID: <CACRpkdabfiDbGmAQciAUSThY-KfTsVq3tHz0bBszs2j_ej18Nw@mail.gmail.com>
Subject: Re: [PATCH 12/18] pinctrl: bcm2835: Add support for BCM2711 pull-up functionality
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Matthias Brugger <mbrugger@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-mmc <linux-mmc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jul 22, 2019 at 8:24 AM Stefan Wahren <wahrenst@gmx.net> wrote:

> The BCM2711 has a new way of selecting the pull-up/pull-down setting
> for a GPIO pin. The registers used for the BCM2835, GP_PUD and
> GP_PUDCLKn0, are no longer connected. A new set of registers,
> GP_GPIO_PUP_PDN_CNTRL_REGx must be used. This commit will add
> a new compatible string "brcm,bcm2711-gpio" and the kernel
> driver will use it to select which method is used to select
> pull-up/pull-down.
>
> This patch based on a patch by Al Cooper which was intended for the
> BCM7211. This is a bugfixed and improved version.
>
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Patch applied.

I think I complained about some other version of this patch, this one
looks entirely acceptable.

Can we get rid of custom pull settings etc from the upstream device
trees so we don't set bad examples? I have a strong urge to
throw in a pr_warn() about any use of it.

Yours,
Linus Walleij
