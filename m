Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 758B65A6654
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Aug 2022 16:31:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230118AbiH3Obu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 Aug 2022 10:31:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230141AbiH3Obs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 Aug 2022 10:31:48 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9313FB1BA3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 07:31:47 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id j9-20020a17090a3e0900b001fd9568b117so8375080pjc.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 Aug 2022 07:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=arpOYNJIoxySytwZ6hyihXadIJAE0NXfqL3BJ+pBXEs=;
        b=cqoUAXzsdNF+AFCBPmPhIvtannJrh6y4GneR7pvFtgulA8iuVsqo599FUvhDTXYsT8
         4DsCmRylqe4nIU76OyLcg4bwjwriHlSqjAvjedGXAEVSFK970c8hLqAQj1TF/i0cvx3R
         3eOW/5ziWSthwCPnh6Q0mrcltqi+jyDviW8vebbJZa9sdho8/IXQtkeW66hDYaCgy8Bs
         4ddAo48nqeuUtVFssFjhki9wJ/rJZ5cNczKt4IwzvUmWTr87XqIZwMvaXnKTeS+w60ij
         Yc0cuGlnA5avNisnHopDYqgtK7ilX0ZMpW+PUc18YL/sw6UXOPwC4BTpxQwxwwT6TDdN
         tu+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=arpOYNJIoxySytwZ6hyihXadIJAE0NXfqL3BJ+pBXEs=;
        b=5J5dUMviBah23GvAojakyk3UwMr/0KsnpsY7e6wFOQe4PiTiHUtGsmSaOGesiTvH6n
         fwPgVxWVHKWkK3YYvf567TA0SYh3kVjw0CgjJ8xAih6zQ+fBu0Xb59E2mfu4QL4ntky6
         Cu6HSFwQjADV3KWQQj6GyYQ9WQeWR3zor5JwUBEaH7BhpA8w1/bovcFJDiJFsU0Pk0Rf
         VKQ4uOtorYABXoz7OCBEaLn47aoxLB4OGm6zWaVffvic/LSOezkSvOtFXGF7HpsIWaXb
         7xXZjNIikHpJMDD2Z5CXbzRViBV+CrgvplAZVg2w0dGr4dxJiFeWFAPLcdh67Uu5hQrl
         pqXQ==
X-Gm-Message-State: ACgBeo0RrQMTIeS5Gl8tc0bNn9mn7wb8asBdtZw0x5A1GQphH3Mt6a5u
        Qz4Fz4BMuN+06br2VtaBp5afdUIIgTH9X7QiLLA=
X-Google-Smtp-Source: AA6agR7W8beGmmADn/mmq74E/zzqzu+J0RQtGKtolz9WG8devyBVemqn7uzp+kQlRshr/KCf+tgX2dls9eqS9gBar1s=
X-Received: by 2002:a17:902:f782:b0:173:1206:cee0 with SMTP id
 q2-20020a170902f78200b001731206cee0mr21378443pln.130.1661869907051; Tue, 30
 Aug 2022 07:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220830142727.313080-1-francesco.dolcini@toradex.com>
In-Reply-To: <20220830142727.313080-1-francesco.dolcini@toradex.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 30 Aug 2022 11:31:34 -0300
Message-ID: <CAOMZO5D44mLMy3+qPJoPMqaJpQe12==H6RWtbq=ri8RGQjybBQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: imx8m: kconfig: Depends on SOC_IMX8M
To:     Francesco Dolcini <francesco.dolcini@toradex.com>
Cc:     Peng Fan <peng.fan@nxp.com>, linux-gpio@vger.kernel.org,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Francesco,

On Tue, Aug 30, 2022 at 11:27 AM Francesco Dolcini
<francesco.dolcini@toradex.com> wrote:
>
> Change PINCTRL_IMX8M* dependency from just ARCH_MXC to SOC_IMX8M,
> likewise is done for other PINCTRL_IMX* kconfig. This avoid polluting

s/avoid/avoids

> the config when SOC_IMX8M is not enabled.
>
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>
