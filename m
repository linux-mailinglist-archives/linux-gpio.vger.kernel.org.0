Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA816146BC3
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jan 2020 15:50:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728792AbgAWOum (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jan 2020 09:50:42 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:34488 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728901AbgAWOum (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 09:50:42 -0500
Received: by mail-lf1-f66.google.com with SMTP id l18so2518135lfc.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 06:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fNTKUOvPaK7NGZPdn9RrwLDwm3nxspv1+FNYwv3C3hM=;
        b=qNzbAggNf44Rjyi3xYv12GbLVPoWqZaEGnVV865MBvv6jFfDzRtp4lOna6Rgm4rgvc
         pXliObXDmabJwqfsEkby+uUceYrj9wJFfeWWmo7UIi7yjws0apqOXVdy6sq+tifkxkyJ
         WJ1w2CzfVPxAiHupGieQE0pSn3n43ScymKcvFNCn7HGnmo9TVWnuAL8CSvRgn37iGczT
         +QToDC6Zr4hjR2FvfO97FxNd9RacVRcMy+5gfNp8sdObik/cuPXSxrq5pSLv/lQBQcos
         Emm0PCLfAkk60QWURSKRv/BYfrvv/11/Cfrb785duxuKS4o1Nx6SQwiIUcp2P08VKKXW
         7ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fNTKUOvPaK7NGZPdn9RrwLDwm3nxspv1+FNYwv3C3hM=;
        b=C63DxXTc09OaHvRvIqOHV1z0zUJiP9gm4vgm2jt18kp/iRxbEieC+6Lyb0TWZYrVi1
         XDT8v0VjM8KVDnH0ek13ahux9kBLNqPJfZ+3KFoHjuJe0BkJUz/RvHKwKrGwkwBGiLrM
         b4FjCbzYVh87IOmRoVyHBmFWtwmO0cmLxH30AxeyXOukoWtdwP6g52gQbTf3L7RrTeYg
         zGLl/VtiRHeFX2hHG0sNtp5vvYInP2ldAXjsLF0PrxyxYKKIwdnd140DRxa4/XeR+NHv
         kWG1i4FLP0xbbKz+U4cRqaijTU/WduJ2x/l9ueNJybgFuPVHPZ8egaqnUmnF2hpCfan3
         BzGg==
X-Gm-Message-State: APjAAAWIFPv5b6brI5z5r2IseiAVSvbz5YC3pvcS++iCozUiTjR28fdX
        VXLxAQlRvDu8YjUlkEmnclPCqWHPOnzQxJc8rLsX0Q==
X-Google-Smtp-Source: APXvYqxGwUR1H9HYGs2wE0Gbmgjwgzwz74XfSo69PdeiRrNPsM7q47aeOmg84PC9sjlXyry/YWLldmwkbBajFIoCZ68=
X-Received: by 2002:ac2:4d04:: with SMTP id r4mr4985943lfi.77.1579791040844;
 Thu, 23 Jan 2020 06:50:40 -0800 (PST)
MIME-Version: 1.0
References: <1579052348-32167-1-git-send-email-Anson.Huang@nxp.com> <1579052348-32167-2-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1579052348-32167-2-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 15:50:30 +0100
Message-ID: <CACRpkdZ_v93Laaz-=1-CyOWPr86VAaeeArGRc5a18NgHNiuf=g@mail.gmail.com>
Subject: Re: [PATCH V9 2/3] pinctrl: freescale: Add i.MX8MP pinctrl driver support
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
        Will Deacon <will@kernel.org>, Abel Vesa <abel.vesa@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Olof Johansson <olof@lixom.net>, maxime@cerno.tech,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
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

On Wed, Jan 15, 2020 at 2:43 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> Add the pinctrl driver support for i.MX8MP.
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

Patch applied with Fabio's review tag.

Yours,
Linus Walleij
