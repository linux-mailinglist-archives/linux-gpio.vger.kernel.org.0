Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93543DB8C7
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Jul 2021 14:41:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238779AbhG3Mlz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 30 Jul 2021 08:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230127AbhG3Mly (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 30 Jul 2021 08:41:54 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0D74C06175F
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 05:41:49 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id u3so17633217lff.9
        for <linux-gpio@vger.kernel.org>; Fri, 30 Jul 2021 05:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/kRBaSoBVL6nxcj2peq5Os69JE28/PQ01R2kk52zEtQ=;
        b=B1kunCRaY6no1HNTHwInM799kDhf+SgjE7ndjdQ84sewMwawNelivcKSO+rton5MPJ
         y4VYcB/Cg8peeDLhGK/2EDol6AoEzxmHYcf4vDsVIvQScv0t+nkECI19WiJCCVlgzSgP
         vFD0ICa74wfojGbkMPz1WlXVD+sTiS7IDtsPAuUIm0e/cPN8eoJve3FJYuc9eqFBSPIz
         i0frmYAuX8hlfM2KV0J7JYvmnPggSsWJhhRXEsSRslLQTn4l1vL4o4mvfZn8qW/NJ5ln
         y4D4C5Fbi3GRWp9Q6Xd1R+v1fTQHcQrQmEoBarlD93n03ymt092utj2uYKtbbo30Hpy3
         5xZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/kRBaSoBVL6nxcj2peq5Os69JE28/PQ01R2kk52zEtQ=;
        b=c9VAogSidvepvcJnmgaV5n3nEahlMJJ+UmyqE1t9FoVoZFnR87piYjC2Qq/5j8mSyC
         cs8GoCP7aEx2MA+OOKw/P7yD5Ip8az7P969Hti5bYBnw9VDNdAeUqCcUI8MiQnQHOHs9
         jcVOHoiBuJ3U0d5g6EAcNMNn5SjOlTsgYNlfc6OwfOJD77lJAyZcvXAXoE1ZgDq7/Jhr
         ccY+Cg41ZuRGnmtHagCQvoPYMnmHe5S/2XOwIbw91PlVJUVBMV84R0WkpENN/b4+1TIM
         nbdSqEe/uiaptQDWkowlnk+Oex+5m/dOOa/B3g3dKGRC8cU/mYYKT9z0M4eUVJJK2jqr
         mTIw==
X-Gm-Message-State: AOAM530WV1WdBOSVgKkGRXJqxuSAHBK/yFK9Zs4TdTfSgt63Xg62sh46
        scYFi+x3hvHLoLeinj8ComB5C31aBSR8AD9N4AptSQ==
X-Google-Smtp-Source: ABdhPJweLT/YBIhfBwINTJU7OPApJzz6dnBvoUzGLj8wntDPaxCPjbi2z1j7Y4AtTc+9QppJM2z/97sOVnrc/zLurXo=
X-Received: by 2002:ac2:4c4c:: with SMTP id o12mr1712680lfk.157.1627648908126;
 Fri, 30 Jul 2021 05:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
In-Reply-To: <1626868353-96475-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 30 Jul 2021 14:41:37 +0200
Message-ID: <CACRpkdZ=sJTz04NUbKzMkGa1_hW6VrzKCG5xkSYDdNiZfgvhqA@mail.gmail.com>
Subject: Re: [PATCH 0/4] pinctrl: pinctrl-zynq: yaml conversion and minor
 driver updates
To:     Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Michal Simek <michal.simek@xilinx.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        git <git@xilinx.com>, saikrishna12468@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 21, 2021 at 1:54 PM Sai Krishna Potthuri
<lakshmi.sai.krishna.potthuri@xilinx.com> wrote:

> This patch series does the following
> - Covert Zynq pinctrl driver binding file to yaml.
> - Update the binding for Zynq pinctrl to replace the 'io-standard' with
> 'power-source' parameter as recommended by Linus during ZynqMP pinctrl
> driver review(https://lkml.org/lkml/2021/3/25/278).
> - Update the Zynq pinctrl the driver to remove custom pin
> parameter(io-standard) and instead use generic parameter(power-source).
> - Update Zynq dts files to replace 'io-standard' with 'power-source'.
>
> Reason for adding the generic parameter 'power-source' in Zynq pinctrl driver
> is to maintain common pin parameter across Xilinx Zynq and ZynqMP platforms
> for power supply configuration.

I applied patches 1-3 to the pinctrl tree, patch 4 should be applied
to the SoC tree.

Yours,
Linus Walleij
