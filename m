Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2280A5688AF
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 14:51:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230233AbiGFMvT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 08:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233048AbiGFMvS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 08:51:18 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E18B1836D
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 05:51:18 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-31c8a1e9e33so86521037b3.5
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 05:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hIhZgzY+R7Szf1VHUaAXx2kwOo3r5qSKv01pfqvbTrM=;
        b=Wn9p1QCJY8wiVyZIQTTF6MpnoYsw2c/7oCLi54SPOkaDoPBFz5Bowau6HJsE681Sgm
         5GKtvX2bPAHLDRR+Va8GF8srUAfP02J1oClcvIVRf5Mo6iGoIKifbGZNuSHu0x8DgHD+
         85k2GZ8VQlU1UEKBsds/9jWU1NElikJFIHs3/BqntvwpipLn5tB2YFfd8sCWm/2b+qcf
         6/j4k92BUWgun7/fPUEsHqM7YQa/6UBDZctRRYp+b90JtQdSRz8PN14ORl+Hlk0S27Qr
         F7zuFSoqD+k/ywrXcvXmvNx1wQgv3hanEdvNrQ+0gfrUxdBGN/e0rK2nBAnd5txUHgxP
         IsVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hIhZgzY+R7Szf1VHUaAXx2kwOo3r5qSKv01pfqvbTrM=;
        b=eeI1dK7ptVZmqIaPvWJQjAqXLSpPGDYX/739RxbVFNAZa+GJG9h1mjpn4qVYgU8yuo
         ANRzPYOrLYN0BVG6LP+zpNnVMV7HtK0gvPOX8Bpz+EBKFEzGKWaKdDS082d4IrCqBnxf
         o4V64a+emJ9Zj0Oy1lw9AU7r8rdPUZJZ9ZnBQ14M4qqjED4ysqf2bPP7NMgqai1oHvMN
         rZcWZOzJvpWndLOc/Rin2FxNyh4g+r0Ya1nQDQIFWZ5B0DBLjs/JRBNN36SWPjWl5oh7
         gB8U/MENi8X0mxPB110/o/MQCnHwlDWz5Ht+DNsHb2cdVfvRPtogeUukNYuQl2J5QEpo
         vPVg==
X-Gm-Message-State: AJIora9cuyc+W4bGR1KZvHVREAJXcd6h5FQbvrmVHcnLU6vGYKOSB2Wz
        qAQiGMHok+nl6MJ02H8rMBQejs2+QvxG7H/N7j4lVg==
X-Google-Smtp-Source: AGRyM1tEZbfGk56rVU2h9fMy0NUrOYpcQOprH6kTMOB9yU5r+JXBjKglcUudZ/ZVq5fu1s8ldo5O0Bgxnmifrt5gf9I=
X-Received: by 2002:a0d:cbd8:0:b0:31c:7dc5:120c with SMTP id
 n207-20020a0dcbd8000000b0031c7dc5120cmr26625968ywd.448.1657111877315; Wed, 06
 Jul 2022 05:51:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220613031854.1571357-1-ping.bai@nxp.com> <CACRpkdZSUYpMeod7kmF1QgQ9YjzzbVnoU_fZ6RcwKDe_1n61tg@mail.gmail.com>
 <DB9PR04MB8412F8BCEA28371979965D3987BE9@DB9PR04MB8412.eurprd04.prod.outlook.com>
In-Reply-To: <DB9PR04MB8412F8BCEA28371979965D3987BE9@DB9PR04MB8412.eurprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 6 Jul 2022 14:51:05 +0200
Message-ID: <CACRpkdYt1XpWseeSmqprNyQHup3CL1iYQ0beeFAdB2YNUHTy_g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: imx: Add the zero base flag for imx93
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     Sascha Hauer <kernel@pengutronix.de>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
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

On Mon, Jul 4, 2022 at 8:04 AM Jacky Bai <ping.bai@nxp.com> wrote:
> > Subject: Re: [PATCH] pinctrl: imx: Add the zero base flag for imx93
> > On Mon, Jun 13, 2022 at 5:17 AM Jacky Bai <ping.bai@nxp.com> wrote:
> >
> > > On i.MX93, the pin mux reg offset is from 0x0, so need to add the
> > > 'ZERO_OFFSET_VALID' flag to make sure the pin at mux offset 0 can be
> > > found.
> > >
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> >
> > No reply from maintainers for an urgent fix for two weeks -> patch applied.
> >
> > Jacky, maybe you should be listed as comaintainer for the freescale pin
> > controller if you are doing active maintenance on it?
>
> Yes, I can help on this.

Please send a patch to MAINATINERS adding yourself as maintainer
and CC the other maintainers listed there.

Maybe you have some internal NXP mail list and procedure to follow
too, no idea :D discuss amongs yourselves if necessary, but I really
like active maintainers.

Thanks!
Linus Walleij
