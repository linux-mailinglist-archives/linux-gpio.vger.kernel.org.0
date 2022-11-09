Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B9D36225C0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 09:48:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229861AbiKIIsG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 03:48:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiKIIsF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 03:48:05 -0500
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B414F10E
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 00:48:04 -0800 (PST)
Received: by mail-ed1-x52f.google.com with SMTP id x2so26176292edd.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Nov 2022 00:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jgKw+Gh28HJpy0lOLg2VuN1GbSzQApQ/IwdWYvuR8jc=;
        b=sQTRYJ/yi+sjBa5mWm8+48njabEHftow78Vc2hvDFKSRNfgxhj4XHmCZu9G/DTuOuQ
         DQ8TVkL3J+i2xGZhkZOT8jFGS7uRl5d3ojLBScdxVOPXBjNG25XY+N1sU0ctSK3qq+z0
         sDPr4j4+CctAxiwDtsIvv5bz/6dii0MPmkODbiF997PIUDoYCeK4zpGT07TU1toufbL1
         jn2DcS2fw4v70fGnjol0kcmXjOPLnN3KwwOIDQUHus+BHWr1EZuz+pePsoaleUcE8B14
         Ik6RPnZcbKVXmy+XPbAEMZQ9wxLKflPKUpNfBGyzEkKnPjIKS665N1M+/xvuiTUGUH/u
         A2ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgKw+Gh28HJpy0lOLg2VuN1GbSzQApQ/IwdWYvuR8jc=;
        b=WnRe9+QEd89T1eYk+bSPJ4nUJGVdTc2mqhX1x+nurD9OEUE7xAs9dJqa4vJFC5tt30
         ds24jlb5hGVen8xvIbP6cIJzebzoIUfkCtAhOI6/6J5c2oC9TbykMLI6T/w9rb6FANZP
         fUjBuQK7ykEVYn/jJ6fcqh7eocarkrgXNUvuPf/4FB3EzAtvHib6Tq52B2as5FUTVpKS
         txIOqMGjs8dgIA6E2nBiQdBdt+d9/ikWA0MA3dF1ilPvsB9v4kLj51RToR9EAAP/CHPV
         V6eCeH3/fD4E8KfkqoDg0pZkJJ/EUMfT1JtW93nxGwcVuQInhLa01yppznVwkNfjxYTo
         GiPA==
X-Gm-Message-State: ACrzQf10yuc/Od681fUkEc3kVp62rdgv8ddsbvzk2mBjO8fcPVTlTvtq
        Pa0OgIlaP1YaTqQRyqzcjCF2zh7VUv5XZyApyw2uRw==
X-Google-Smtp-Source: AMsMyM66HMeRmiFNje6X1hfW+hyz2r0uhBi6Gv73jHX8UHIxvtNoaoS0yeuG7bndaaSvkLkoHDD5JCKCirUHEp1hUe0=
X-Received: by 2002:a05:6402:d0b:b0:458:a244:4e99 with SMTP id
 eb11-20020a0564020d0b00b00458a2444e99mr59337467edb.46.1667983683311; Wed, 09
 Nov 2022 00:48:03 -0800 (PST)
MIME-Version: 1.0
References: <20221106080114.7426-1-linux@fw-web.de>
In-Reply-To: <20221106080114.7426-1-linux@fw-web.de>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 9 Nov 2022 09:47:51 +0100
Message-ID: <CACRpkdY87GBYCK0RCD89aZT8Pg5ihTpUK=GXvSf5eD0Xj2psmA@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] update mediatek MT7986 pinctrl driver
To:     Frank Wunderlich <linux@fw-web.de>
Cc:     linux-mediatek@lists.infradead.org,
        Frank Wunderlich <frank-w@public-files.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Sam Shih <sam.shih@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Nov 6, 2022 at 9:01 AM Frank Wunderlich <linux@fw-web.de> wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> This patch series introduces common bias-pull* pinconf support to MediaTek
> MT7986 pinctrl driver and fix some register offsets in the driver.
>
> v2:
> - added patches previously postes separately which are needed to have
>   dt binding checks clean
> - fixed odd numbers in comments for mt7986_pull_type

Oh OK thanks for collecting the stuff I need, I applied this series,
I had to use some fuzz on patch 5/6 due to other patches I have
applied so please check the result once I push it out.

Yours,
Linus Walleij
