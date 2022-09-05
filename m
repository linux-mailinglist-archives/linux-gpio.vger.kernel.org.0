Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB6E5ADAD8
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 23:20:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbiIEVUt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 17:20:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41444 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiIEVUs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 17:20:48 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C69E352460
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 14:20:47 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id bj12so19177771ejb.13
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 14:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=LrFK3sv1yLWXXRop9N9W2BNtE+QQcBNo40/879n1p7g=;
        b=gVYUCaCZZZ8vc932Ks3Yj2eV4y60SOf5pUjwI29d7txH4bOCZeoKxYMlfpIrfuaAY2
         kpmxPba01Tf/B1neU76n1/vD+9GzeyVUDxVxl54VnzZFEF4kZKSNoJNIJ4FBXthxPSY6
         TyM6kROi9CPMiFdOTw/ZJnO1J4s9HQj7jEcUPBFr30IXnZ4sVvZEAt7ddGIxMBbJ5S41
         ILVXUjNEly4vSAs3PJ0DIJvMGVV2LZe6FRWJUEkMVZNNN8vr1aI+1wnMGc26LVOZ40/B
         6DeWjNmRiZr5vJi5Qwvp98VDnyMyxpZ82Vi1doQS4wvbxaNjTao43402KjtpBflc+E01
         bZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=LrFK3sv1yLWXXRop9N9W2BNtE+QQcBNo40/879n1p7g=;
        b=N6G/qVy1KjKXxrvk3HZKTi+meNC47XePjPgVhr7mOoyA/WReIFli76FYIuEMhVX4js
         Ouv/GlK6+qPm4xPqmcAwfWU3bN1I9ges+G+0rlIbIscbuMRa6f0SKJ3mO/kkvggVRY56
         4GtnNFwU4qOUi1X2ey1h5BMhv4rkzQtvhlpKiOIF1kVkaVgQVudi8T7IH4ctJskkbd1e
         GZ2y5wsn0tahbWC3+tDUtl4+t7uRhzHvgPtKIlVqulpOb9XZNruSJL300n0zsRq/PHFG
         iDklLbbWuWiFjB9c9q7KmkY74Mv7FcxmTUrph8E+fV7n9RCl4TfxekREccPtLdP3eakr
         nmow==
X-Gm-Message-State: ACgBeo2OsdBO+bmygeQ/T7jmWTaAoBuDl9nLMKsk89w5yCIjnzW2YOmO
        kMLchQd9Bmjvr9ImpE8qnot011hjG7SFHcPYtgURsZrXCG8b7g==
X-Google-Smtp-Source: AA6agR5JKr56AZfrz3ucB42qH+KkybOStT4MADJpu40ui59bLa2C5SluhHQ3ad8/pSUnRhcHmbrXoiuIlIJSeW15xvM=
X-Received: by 2002:a17:907:2707:b0:741:7c18:4e76 with SMTP id
 w7-20020a170907270700b007417c184e76mr25646345ejk.690.1662412846354; Mon, 05
 Sep 2022 14:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <202209050605.fezJUgFH-lkp@intel.com> <CACRpkdbfHG3r1wtN3Gne-XX0Zg2qyFSgH4yR3ctauABY4u-XJw@mail.gmail.com>
 <20220905133040.GB6496@francesco-nb.int.toradex.com> <CACRpkdYKQt8fJ5FaTQgoNgGH73xnC877pQhek5Df1zdSE_c3=w@mail.gmail.com>
 <9be88d9b-8531-46f4-8cca-c276b4a741e1@www.fastmail.com>
In-Reply-To: <9be88d9b-8531-46f4-8cca-c276b4a741e1@www.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 23:20:35 +0200
Message-ID: <CACRpkdYGHMMD5ti0m9nyk6VV_sNsyptgpULPDzQcV3A9aRd5Jg@mail.gmail.com>
Subject: Re: [linusw-pinctrl:devel 26/32] drivers/pinctrl/freescale/pinctrl-imx.c:260:9:
 error: call to undeclared function 'pinmux_generic_get_function'; ISO C99 and
 later do not support implicit function declarations
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Francesco Dolcini <francesco.dolcini@toradex.com>,
        kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 3:53 PM Arnd Bergmann <arnd@arndb.de> wrote:

> so s390 should work both with and without IOMEM here, as long
> as drivers do the usual 'depends on ARCH_MXC || COMPILE_TEST'
> dance.

Hm OK

> The only problem I see is a missing 'select GENERIC_PINMUX_FUNCTIONS'.
> There may be other drivers that have the same issue. Would it
> make sense to just always build these into the pinctrl
> subsystem?

That's the thing:
drivers/pinctrl/freescale/Kconfig:

config PINCTRL_IMX
        tristate
        depends on OF
        select GENERIC_PINCTRL_GROUPS
        select GENERIC_PINMUX_FUNCTIONS
        select GENERIC_PINCONF
        select REGMAP

So that is selected, and what we changed was e.g.:

 config PINCTRL_IMX8MM
        tristate "IMX8MM pinctrl driver"
-       depends on ARCH_MXC
+       depends on SOC_IMX8M
        select PINCTRL_IMX
        help
          Say Y here to enable the imx8mm pinctrl driver

so it selects PINCTRL_IMX and that selects GENERIC_PINMUX_FUNCTIONS.

I have a kismet warning that sometimes this selecting PINCTRL_IMX
is inconsistens since it depends on OF and apparently there are
now non-OF configs compiling it. So could the real problem be
that everything selecting PINCTRL_IMX should depend on OF
too?

Yours,
Linus Walleij
