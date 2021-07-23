Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70AF63D3D22
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 18:07:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230421AbhGWP05 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 11:26:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230243AbhGWP04 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 11:26:56 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4AC6C061575;
        Fri, 23 Jul 2021 09:07:28 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z2so2952686lft.1;
        Fri, 23 Jul 2021 09:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lTvO61y1SGuCg3UXl9dim6u9NJ6zEuQSX5WNIWVfWus=;
        b=ldcP1SEKPeuCr6b4yMJb81raEbH6Kze1KunmaBZeR0vWWLm5GXNp6UW/hXWcyp665S
         dBHnXY4/RERInUAyiTc9S3botHn+ZHRyA8YIhuLEvqEbBmn1oxHFJuI8I2W9iJS/du2S
         624LB6QOC3gi+EwjaV/ohHOE/9W5MHdVkBjKvqz6E8YmM0x1HV6iK2Z0FMxCVgvf/kWw
         PNkT3E+Xxxys9TJzCcbv1xFEtxl4ti8tNw0FYk6HRMg485ouQalJXcIfEGiXpOxAJCgK
         YHV9T18N/rGgZQW9gAsGlNRKlpDzuMK9+oGKedyly6RGp0oDxq5zXgLoa4Q+x7JV68mF
         5IEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lTvO61y1SGuCg3UXl9dim6u9NJ6zEuQSX5WNIWVfWus=;
        b=gX8JU6bSq7E1zBRvtZuCELdHnaLqx0gtlbKotppvYVfTR5xRWSiFTp8bZ1GEr0Iwj9
         NoitgrPfS2tDkrb+fTwYigWH5lLLbVAUSHD6Ewbh4q/XOvnhTJBg8owLVeG2hAd1Z5qb
         b+VFhiypk5DST/PW9zlFKEoMilafw5rZmrpttWXV8ug3C3K36ByjpDkfKjrJizNtyLYn
         DmI6+ToW1/wFQXoxWBAX+Z/17RLQ5y8MK65XVtet4eYmVRhmjnhc3aCmUaMuP6U+hvy7
         bKdM7vGKY/m0QO1sN56GAhFHLoEqvIOIZPLvQa2944lg1uLeMSJhWB5ZRdPX2rzbn0Ic
         zHbg==
X-Gm-Message-State: AOAM531UdOKTzAHieaUDswnAlhgANHBvOwBoZR4hDUQ2adD91cbowAhR
        /ptKzq3KkEU/zSuuE9afBq8P/F+5Z8VbduiXyTA=
X-Google-Smtp-Source: ABdhPJw35BEdaVTjN2YWB6qzLuNpgQfvBKyCXQH/vuJxImlFGQnCxAmyYZuyEzlGt/WNLS2fGf5asjZGMb+J9j7whMU=
X-Received: by 2002:ac2:494c:: with SMTP id o12mr3548385lfi.229.1627056447210;
 Fri, 23 Jul 2021 09:07:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210607061041.2654568-1-ping.bai@nxp.com> <20210607061041.2654568-2-ping.bai@nxp.com>
 <CACRpkdb=B644KMoL1R=JVkn-9bYQF+4miie5SAROLhQ9HKkHWA@mail.gmail.com>
In-Reply-To: <CACRpkdb=B644KMoL1R=JVkn-9bYQF+4miie5SAROLhQ9HKkHWA@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 23 Jul 2021 13:07:16 -0300
Message-ID: <CAOMZO5AW7185p+e1ECbfLaQvVH2Qq_w=88RDPkwGkGwSFqKTUA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: imx8ulp: Add pinctrl driver support
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Jacky Bai <ping.bai@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

On Fri, Jul 23, 2021 at 1:05 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> Patch applied!
>
> BTW does "ULP" in the name mean "ultra low power" as usual?

Yes, this is correct:
https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-8-processors/i-mx-8ulp-applications-processor-family:i.MX8ULP

Thanks
