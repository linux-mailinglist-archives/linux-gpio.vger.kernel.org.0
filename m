Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA70766E012
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Jan 2023 15:13:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbjAQONQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Jan 2023 09:13:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231544AbjAQONJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Jan 2023 09:13:09 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DC263B671
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 06:13:08 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id p188so34159053yba.5
        for <linux-gpio@vger.kernel.org>; Tue, 17 Jan 2023 06:13:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EIN8tgDPTuXgplHzHvlrggHwhq0QHb2mTt6h3kM+GJ8=;
        b=ckVXYOF5+y2LAnZKG+FTJJYY6MVMTU4nj7Xielh2IfruV3XhGYoEs+ss/nUIhAlSXl
         4tnRxblyfAvsAZ4NN65CUuCAJ88+QCHQapovfszuvK1v4i+t3BodC0x7BOR2VqDWxDrR
         LpUoi77Ho7bNDHLzUjT862ck5qVx9DCTMxmk2va4ngGJL8BH95nf9GzBfNOfiS9G95Lz
         C8BsiEE45b3wZi7xe1b6NwfbMqW/fxvcduqKvde6vksV9Ik75RcfXMi5cLD252cG58H4
         D6GqsyG+4Qrx2VXnb4UZOkpjaBVp55PmYbqRTyBb45VXCkX3vw9eT0DEBZHID4lSzONd
         D95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EIN8tgDPTuXgplHzHvlrggHwhq0QHb2mTt6h3kM+GJ8=;
        b=ii74yGcqJUEw98ve9abFFxpWqsFtDD5q8gHla178PLL4reRBCUcIbQ4U53osARlB06
         gOvmwHKxWeCd8T1mdiExGPg33XRGR58x4c6yJvS5cPRfucZnK9/6vbpf83zspWVQOXYG
         tIn8GusPt5b2z2AEiprDojgZs/shGvoR3BSrxKZg8dh7g+AWdszM9YmSkG0dRWXuLaa6
         n3Yb8aZKhPRfd+pNCzkXAOGVxA9JG6peMDYvG88KARkglQI4+zhtrYm+R9s+eK+bppzr
         JzkwS54iwQdbzhlcygskTtgN+UkG3+faTkGT6wYP/cHKhF7WObquAU2DuNvShcayehnx
         wwUA==
X-Gm-Message-State: AFqh2kqX1SLMOx4jK3c+1AeIPIfGTP18tYpcxK0wTnTAqkmrhxtdVM3N
        Lzq3CU2NnY3cSHDSYM2Buu+3p2WRQt1zJGiLhnLpTg==
X-Google-Smtp-Source: AMrXdXvEG9lA5xC2cfz0gOQJa68fQQXRW7/4DkxVjfCF/AcTt8P0Gl682cWF0A9zoDjmONk201UhjPu7s16jN7BQD9c=
X-Received: by 2002:a5b:38b:0:b0:7ca:9b40:72a7 with SMTP id
 k11-20020a5b038b000000b007ca9b4072a7mr488673ybp.130.1673964787603; Tue, 17
 Jan 2023 06:13:07 -0800 (PST)
MIME-Version: 1.0
References: <20221220090248.1134214-1-haibo.chen@nxp.com> <20221220090248.1134214-2-haibo.chen@nxp.com>
 <CACRpkdaPQODoiG+ARAiT-6X2u6n7_aCO7Ywj4z=76A65iUhTpA@mail.gmail.com> <DB7PR04MB4010B71F54175CD7C73C3FC490C69@DB7PR04MB4010.eurprd04.prod.outlook.com>
In-Reply-To: <DB7PR04MB4010B71F54175CD7C73C3FC490C69@DB7PR04MB4010.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 17 Jan 2023 15:12:56 +0100
Message-ID: <CACRpkdZDbsNsaQ+9sM2BEiKXJhJuGU7jk2M07L5TRZ6H1u2VFg@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: vf610: Support building gpio-vf610 driver as module
To:     Bough Chen <haibo.chen@nxp.com>
Cc:     "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 17, 2023 at 3:01 PM Bough Chen <haibo.chen@nxp.com> wrote:
> > On Tue, Dec 20, 2022 at 10:02 AM <haibo.chen@nxp.com> wrote:
> >
> > > From: Haibo Chen <haibo.chen@nxp.com>
> > >
> > > To support Android GKI, need to build this driver as module.
> > > So change the config as tristate type, and add module license.
> > >
> > > Signed-off-by: Jindong Yue <jindong.yue@nxp.com>
> > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> >
> > OK...
> >
> > >  builtin_platform_driver(vf610_gpio_driver);
> >
> > Then you want something like module_platform_driver() here.
>
> Hi Linus,
>
> Here, though need to build this gpio driver as module due to the Android GKI, but we do not really need to
> rmmod/unbind this driver, so do not need to implement the _exit or remove callback.
> In this case, still need to change to module_platform_driver()?
> If so, after use the module_platform_driver(), is it okay to not implement the __exit /remove callback?

Yes, our project is about maintaining and improving the Linux kernel, GKI
is not a project we are running. If they need stuff from Linux, it happens on
our terms, and that is that modularization should be self-motivated.

Check this article:
https://lwn.net/Articles/872209/

Yours,
Linus Walleij
