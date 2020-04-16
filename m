Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA9831ABD1B
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 11:42:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2503845AbgDPJmU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 05:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2504037AbgDPJmL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 05:42:11 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC0AC061A10
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 02:42:10 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id z26so7030441ljz.11
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 02:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S+O7/evWJtIotBVQwpT2KqWk5rAQTrvcTqRSVKK6/9k=;
        b=GBO7Wy481+gwjzwWz6sPoxZqqVNth7p+TZXxXv9ZXZIuibsA7jpbfZ1R3Cltai4VE/
         T+Q6VWM8Q2rrpO4h9z7LSUUwDtPWLvpo/tgRtXFb00mvUDeFrnFf3yC1N4qAdzPUpqFm
         TdzpB+TgGyDntlMspEHwiEwmi7RkyzWoWHzpYbd4IXYRJiHIeQBBKmZLQ1gv3hnKR3O3
         ++3rNzyQ1L2/scInVP4zfxYgBan9tmTDcBBBpC/4+rNQU9yfyEWL/aRb4X2ZbPezw6N2
         vuVncMTVvXO7PsbL+fsmN08ROgpRe4jFNxIaEcMzDulqNGg4CKbv36dRq7yPUXGY+LDk
         i9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S+O7/evWJtIotBVQwpT2KqWk5rAQTrvcTqRSVKK6/9k=;
        b=sKc2ej3M7fQV4tyCilPPIhB+iu03lgT7xnzpOFXxe8OFe/XiusyrxNP8PMRvZZncfJ
         7kEJ9pjcvQu7E84p3ANMQuXB0LNpfDyrj8WIiC4NCVCU04+d82SEgcD5VymgG91AuAPD
         9U5fps6+x1O7GLk47Nz7JzbiO+6aHBInxfSQ7ZxKcyw441t7WVNdCUgA/d+jHfNhilJX
         lTNsxw3yTGQaMw5vpp7FGAwjSec7hgvztTKmpXR+CP+7s2oQrEfWCUZTyY720S+9Uuci
         0PjM1Jfx8J7J2fT+yr94ZanZM/nEbkQFYGR91VQdVGFv2n3ri27N8IccNjW13oLR0tPu
         Id+Q==
X-Gm-Message-State: AGi0PuZH1GAVQGkrJukHmLtyu2PXhaSYwDpvUfttWlvv6493T98H60lo
        9ZGl54Yg9PcBkcEGeuWbGEzIu5OIbac9zLNCMfaaGg==
X-Google-Smtp-Source: APiQypLpGxFP3d0tO0AVQPx+QFHPQbTiqjrHkFQRQ+jm2jkrid0OXVlkJQdGNnguZKq4zibPaNOzMTt/O2P/KsUiIa0=
X-Received: by 2002:a2e:9605:: with SMTP id v5mr5725065ljh.258.1587030129422;
 Thu, 16 Apr 2020 02:42:09 -0700 (PDT)
MIME-Version: 1.0
References: <1585306559-13973-1-git-send-email-Anson.Huang@nxp.com> <1585306559-13973-3-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1585306559-13973-3-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 11:41:58 +0200
Message-ID: <CACRpkda4Bng5HqUdFCL4a+GMzyK-SqcfuDLjOaebS4ghtL4FsQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: defconfig: Enable CONFIG_PINCTRL_IMX8DXL by default
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Guenter Roeck <linux@roeck-us.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Peng Fan <peng.fan@nxp.com>, Andy Duan <fugang.duan@nxp.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Leo Li <leoyang.li@nxp.com>, Olof Johansson <olof@lixom.net>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Mar 27, 2020 at 12:03 PM Anson Huang <Anson.Huang@nxp.com> wrote:

> Enable CONFIG_PINCTRL_IMX8DXL by default to support i.MX8DXL
> pinctrl driver.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Please merge this through the SoC tree.

Yours,
Linus Walleij
