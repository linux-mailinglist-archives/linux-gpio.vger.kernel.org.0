Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FA115B1651
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 10:08:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbiIHIIG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 04:08:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230526AbiIHIIF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 04:08:05 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A39CD5722
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 01:08:04 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id e18so23131177edj.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 01:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Nq9RAyCd6+UtoScLi4edEFTTQvVwwjyxgLR4cQ7UbNc=;
        b=mIIfVBA/JQuwCJELj4JzJRsG1Nw36IQFzlxGR4+ZLnLTRhTTbu2emubIjb06Hq8INC
         9mGZCeW2hN4ds1t+hQThqVmjf43Y1c7Tm24LgR+rF8PnWcIV1yKAnzseGNwjnyhQiqZz
         ndIv+tginQ5jLxsGod+2wOPy9bo0iEUJlrq1GQh/w71ldGT5b7t0NogpGPAFq8EtLp0A
         0+8FsoxMBadiTRC5jWNiWZlhdyddr0QiyuDU43CXwfL2tQwBDjo5jK3bcKOIYOvNdurF
         TY5U4WPtlnhiq8gnj8i3eDSmJTUGhO7+pjjFloiZlOx0FI7ztBQyx7ZdPQFcZmHGu41a
         Gcuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Nq9RAyCd6+UtoScLi4edEFTTQvVwwjyxgLR4cQ7UbNc=;
        b=SATxkIhPkQUsSlPR0INiWrYeKe5mZxF+Fu+zG3oZ77YVcw4v7Snl0yHhaVpDG+GYXB
         exdhQOLjDLzDPppYV001+06EWgZOqgmrdmnEpIkKTEXxgVvs/WxhMRhvzPs7MrSSuLBs
         LLj2pfK/aLFY/yjo6m9giVuqhzZi6ATCMZkl3lGYnnS1w78oviUHT355/J7lP9A6obSZ
         f8hLsuzBKNyb0pPriMWHldH9xpjz2cHjkNX9pbVm4Rr57KgzH8+fviXOE/LPfRjG+SmA
         ZAbUu5s76PbrHakVpK/zsOrdw6QD02W5R3QHl9JsvYRMc8AYlYS0YaSXhgakX4qiwiYt
         4TWg==
X-Gm-Message-State: ACgBeo0cQblmwLj4kJ/pRxCJu6hPDdXP1tmTbygxGLVN7dXQ3365E/PG
        3pTN6hG2PYwam3MpDJbOpF9HA1CVZqX5EfI8k4W3oA==
X-Google-Smtp-Source: AA6agR7WTvRCDBW0IkNbfuJTlUWJzlM8WNW+y0nsrxsuPLVIdRZKU8mefAPyOa+Yl+h+JXoBRJZaScOatogm9UaU46Q=
X-Received: by 2002:a05:6402:51d1:b0:448:bed1:269c with SMTP id
 r17-20020a05640251d100b00448bed1269cmr6151724edd.205.1662624483003; Thu, 08
 Sep 2022 01:08:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220905224408.346425-1-francesco.dolcini@toradex.com>
In-Reply-To: <20220905224408.346425-1-francesco.dolcini@toradex.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 10:07:52 +0200
Message-ID: <CACRpkdbOz+ZWbE_CbH5dXYEosSxK+gFLG2y2tj2CL6LTUZHfcw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx8m: kconfig: Fix build error on test compile
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     linux-gpio@vger.kernel.org, Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>, linux-kernel@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>,
        kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 6, 2022 at 12:44 AM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:

> PINCTRL_IMX depends on OF, however the dependency is missed when selected
> by PINCTRL_IMX8M* (it does not follow the indirect 'select' statements),
> select it explicitly.
>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/all/202209050605.fezJUgFH-lkp@intel.com/
> Fixes: 87c2a29a6bf1 ("pinctrl: imx8m: kconfig: Depends on SOC_IMX8M")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> Linus: I did test on s390 and it's fine, but the topic is tricky for me ...

This is tricky for everyone, has to do with the Kconfig "language".
Thanks! Patch applied.

Yours,
LInus Walleij
