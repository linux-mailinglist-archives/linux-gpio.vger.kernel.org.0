Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 278DA214B3D
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Jul 2020 11:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbgGEJBP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Jul 2020 05:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726605AbgGEJBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jul 2020 05:01:14 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5388FC08C5E0
        for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2020 02:01:14 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id 17so38421220wmo.1
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2020 02:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=przTgcny48jd36+oUDZM5VqCUdMOADezAA8z959EYFc=;
        b=fF9zYQi0OpwzjVvrADGQzgm2O41ekp6ploUjNNPvEqx5jng5xwHlHbfYptRi64sPpg
         y9iYB7gdR12OKlD4m+vpzQ5HWVD/r2X/aXXkxecU8KXbkdyhQXG566LN+gYJJNhSfyS/
         0kCQ3Zc84FPQ3TKpJDQDW4mVezKPtKnTDxmNkz5FM55PWSYtAqq+DqYEmgLh2V4jfrz2
         JdqbhWl/ZYq2OW8Rw/xe0vw0KzeTxr7oWAN7tLvKB0oXTNY2y+LPpugCEZoIKz7Kqeug
         BLRT93sRc2OPX/gEwNf1uRSW/pD/rDyhI4EEsmUjNRqk1kJ/8FPgzO0k1kNaBgIWS6kd
         2VCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=przTgcny48jd36+oUDZM5VqCUdMOADezAA8z959EYFc=;
        b=Y14tB3VxVniK+1PtxjOhM15TNbPwKiYr2eEYf5+RIVySAQlJmp9ZO/JtyFi2jLWRfP
         gZWbVvvH5spUGXrn1vE/U21DfB13TuCUoKu4g679kU9fAtk2XMX9JP/7RZL5pT5Pk+xk
         XRVYT5mYj7H21M2I6pbTDcQAB+lSwBEWCPkAjv+d1jU4l22JPgIVkrq/oOHCnDUuTQtU
         jQFvWV4b+xcdp39Np2392vBoxT83eoq/7QkeGVlADebiIm7QzwxUUAd8gWeYnu9Oarpd
         z+saqnPNOdoOhrtGDKh/80IHsuMc6BmPNLG7TQ21akd1xVZ0GHE/DEzZt6iojn/fOAO4
         TWwg==
X-Gm-Message-State: AOAM533S0qAEazI+eLBs5p+fsHb8KCwDoYmyco6wBdxGwoHbReqTavbt
        IX2rNoqGcW400MP7+fQ+hSqrLinBKO2eMzz0w+CHCw==
X-Google-Smtp-Source: ABdhPJynH7yvwhYRqBjAT6B2crW294fuviv7qzPIHYptEd/zWVZKZnYRZ8CfSV3sTGh2SAjw5YIHx6qxn3RjWJpV3bo=
X-Received: by 2002:a7b:cf18:: with SMTP id l24mr17960976wmg.116.1593939672936;
 Sun, 05 Jul 2020 02:01:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200701013320.130441-1-drew@beagleboard.org>
In-Reply-To: <20200701013320.130441-1-drew@beagleboard.org>
From:   Haojian Zhuang <haojian.zhuang@linaro.org>
Date:   Sun, 5 Jul 2020 17:01:02 +0800
Message-ID: <CAD6h2NQWQj1frtfVNorc_wt7CqsOZS7PLaPHZxABFhvEPxkKzw@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] pinctrl: single: support #pinctrl-cells = 2
To:     Drew Fustini <drew@beagleboard.org>
Cc:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 1 Jul 2020 at 09:33, Drew Fustini <drew@beagleboard.org> wrote:
>
> Currently, pinctrl-single only allows #pinctrl-cells = 1.
>
> This series will allow pinctrl-single to also support #pinctrl-cells = 2
>
> If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
> pcs_parse_one_pinctrl_entry() does an OR operation on conf and mux to
> get the value to store in the register.
>
> To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
> omap.h is modified to keep pin conf and pin mux values separate.
>
> change log:
> - v4: squash patches 2 and 3 together so that git biesct will not result
>   in a boot failure
>
> - v3: change order of patches to make sure the pinctrl-single.c patch
>   does not break anything without the dts patches
>
> - v2: remove outer parentheses from AM33XX_PADCONF macro as it causes a
>   compile error in dtc.  I had added it per suggestion from checkpatch
>   about having parentheses around complex values.
>
> Drew Fustini (2):
>   pinctrl: single: parse #pinctrl-cells = 2
>   ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
>
>  arch/arm/boot/dts/am33xx-l4.dtsi   |  2 +-
>  drivers/pinctrl/pinctrl-single.c   | 11 +++++++++--
>  include/dt-bindings/pinctrl/omap.h |  2 +-
>  3 files changed, 11 insertions(+), 4 deletions(-)
>
> --
> 2.25.1
>

Acked-by: Haojian Zhuang <haojian.zhuang@linaro.org>
