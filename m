Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8ED17658873
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Dec 2022 02:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232678AbiL2BoT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Dec 2022 20:44:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232636AbiL2BoS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Dec 2022 20:44:18 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2D7913E32
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:44:17 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id r130so16183127oih.2
        for <linux-gpio@vger.kernel.org>; Wed, 28 Dec 2022 17:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zvdOLhpklxGCmWEN9Iaf07R7XE10xtjvHpit1Qusal0=;
        b=mE5xqhhcOPU4N2vFU8nNavqToI162YB0dt48dLnGlaOPeGoEyGB/EbCARDvlzu0+Dx
         sPfK3ybkaQqvCO4wqzoQ/Wdk6sfC8/Pg6ESGqd80YGqe+mXvrMx7CFmhA8cxlT9F5GD0
         PQKZEXSTTXyd+IcNbHxvhFH7TvDBuRrsV7mJ7bO9yIxQlltS1m4a2MT/ftceR+JLgmHO
         y8uXgnSpuq5czS93dSnYfSCX7Xlo0NyXcQXR7Hclm44dwhjLCLv6uJXFQu2Blh//Vz5B
         m61QljdLacTab1BGAZnxxuvgSUyJp7BDdPiz+CQgilZEAgC/qHTtEXkLfXhMIa/vXRca
         saaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zvdOLhpklxGCmWEN9Iaf07R7XE10xtjvHpit1Qusal0=;
        b=CKXXx16BUXWfUXt9KeB2Ean14G9t/h8WKcMHW3ix0THAnalth9loh/o/AgZNXtwrK1
         idbhRZbo4rhMWuctQhCzIXpulzjv+7Mw9SLTcoxSDBbFEAfmM5POaqgy+4mFgby0a2PK
         sB/I0KA3/dY2ESz5soUt8v1gwqFGuSS3/9rfEAFfo/aebZC3HGEWgbP4Tj0pOJ7BBwWW
         C0htL9rqyAnEPuf3AQD2bnblKSOBBd0xKLPC5VVvXwKW9WW38Lg5W5CS2oyqRXC9MLU/
         1bTiA645n9dlQqwiVGViQ61xDqSo24lzVDzcr/QMMIVqO/7aw6uBrUkv18dAFMv4ClME
         W2Mg==
X-Gm-Message-State: AFqh2kppomXe/vZ9kP6cYW1G53ANPSda9Lg8L2Lw4olUJG1MOx2dOJ1w
        1iWBR1/DrkMakD9ggn+Ok1R1MoJTMlB5sQl2y8+OGg==
X-Google-Smtp-Source: AMrXdXsMq5fa8H3sJx0sGFLHNUhzXE+kHXhnSuKTKJ3iHPQSwoYzkQHu8BRrKD5yF23pDFoKMOnVXhXMuOoWVA54ZuQ=
X-Received: by 2002:a05:6808:152b:b0:359:c6de:916a with SMTP id
 u43-20020a056808152b00b00359c6de916amr1846176oiw.42.1672278257186; Wed, 28
 Dec 2022 17:44:17 -0800 (PST)
MIME-Version: 1.0
References: <20221220090248.1134214-1-haibo.chen@nxp.com> <20221220090248.1134214-2-haibo.chen@nxp.com>
In-Reply-To: <20221220090248.1134214-2-haibo.chen@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 29 Dec 2022 02:46:10 +0100
Message-ID: <CACRpkdaPQODoiG+ARAiT-6X2u6n7_aCO7Ywj4z=76A65iUhTpA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: vf610: Support building gpio-vf610 driver as module
To:     haibo.chen@nxp.com
Cc:     brgl@bgdev.pl, stefan@agner.ch, linux-gpio@vger.kernel.org,
        linux-imx@nxp.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 20, 2022 at 10:02 AM <haibo.chen@nxp.com> wrote:

> From: Haibo Chen <haibo.chen@nxp.com>
>
> To support Android GKI, need to build this driver as module.
> So change the config as tristate type, and add module license.
>
> Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>

OK...

>  builtin_platform_driver(vf610_gpio_driver);

Then you want something like module_platform_driver() here.

Yours,
Linus Walleij
