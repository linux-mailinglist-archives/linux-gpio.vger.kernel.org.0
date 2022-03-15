Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCBF4D91B9
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Mar 2022 01:48:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244320AbiCOAuF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Mar 2022 20:50:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbiCOAuE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Mar 2022 20:50:04 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15D6112608
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:48:53 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id u61so34239499ybi.11
        for <linux-gpio@vger.kernel.org>; Mon, 14 Mar 2022 17:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FVLJuCa/vp2/DJqHek7Wv7F+ft4Ew2KgpprAOQN5JmQ=;
        b=PXezCGelOGd31sAe1J7P8ZIdIeRWnYpMXNpPr8ltrev46AV7ztTu+cplqNPRY7uWPU
         4jMt6aWDaxbppZQA0in622thB+PL1flW2RW/54wgK9SZ9d9TT4LBbrm89FiOkCx1G/r3
         4ecLIQ2KvHS65YzBEW02uieAZgnAjvXgWzoAIgtYn02ITjifK6ycpcqtmD73SuAd5hff
         PGurP6PuhSXrjO73OsrSFPnsSLNX6AxGTesFSn59SWPz1JYaG4WuEOtZjW4Ax4bpGBZ2
         BP1jnp7nIvtb4ekCgSQcdQYm6R08M8upPJSrcSXGvZdZi0V3oKkhp3bb7hd50B9PETJr
         nlSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FVLJuCa/vp2/DJqHek7Wv7F+ft4Ew2KgpprAOQN5JmQ=;
        b=Jh0C98khpZn5NN1XU0nPq5fIBe9OAX7F9XowchAGG6p0RBphoemJ57HEnrQMFnBHU3
         zJLWufDxWFgk5pWuXILl5t559nmT7xxiD8p6hkuQzw2Ax1SRK5XBAtUL6+xhf7blFAUF
         1ZUJ2mTIFEKQZVPVS/ae8NxTQHXC+sdCp8R0FdLOlfuICNFJ/XyoYZpxffPsk9IcVlWU
         gq16bXFFNcIsv7Sj6Sa+nZF5ceWgrkn14MHEAViWbDxL3ZcJosbcjMXTLfvplp62BAyK
         Z4tsU/KvgqLWMMFoin6d7/RiUrNj9oRqAmYO1SZmpswW98RApjz4tSEu+AoOEpr/fOud
         br6A==
X-Gm-Message-State: AOAM533ERdyit0wrk4QGkqrLd+gb8LHuhNYvSqG6neeG2IAaMH58yoaa
        qY68IEExOLvHggFAelDZ+r0j1FYl2vJ3VE/57Uj9UpPqTSI=
X-Google-Smtp-Source: ABdhPJzJWSPtzxAyurBgdBM/HeiC7sEvhK/oJwCNWUFNBttj3RgwkdVD7Bg9SVKSrKq14nQJbFYoRzSUABxJ094116g=
X-Received: by 2002:a25:e710:0:b0:633:67d3:7264 with SMTP id
 e16-20020a25e710000000b0063367d37264mr3521432ybh.291.1647305331973; Mon, 14
 Mar 2022 17:48:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220224094243.1376965-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220224094243.1376965-1-alexander.stein@ew.tq-group.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 15 Mar 2022 01:48:40 +0100
Message-ID: <CACRpkda0ad9Y6g7qQ+JRYWXrpPTZs1-nBxq5LcbBXMea+j_aMw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] pinctrl: imx: Reduce printk message level for
 empty nodes
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
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

On Thu, Feb 24, 2022 at 10:42 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:

> iomuxc_snvs from imx6ull supports 2 boot mode and 10 tamper pins.
> Probably most users won't use them, causing this error message during boot:
>   no groups defined in /soc/bus@2200000/iomuxc-snvs@2290000
> This is actually not an error in this case, so reduce the level
> accordingly.
>
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> This issue was raised during release test: Why is there an error if
> nothing is wrong?
> Memory only devices are enabled by default, which I agree, but this
> causes the mentioned error message unconditionally, unless some muxing is
> configured. I would argue that even a warning is not correct either,
> nothing is wrong here.

Patch applied.

Yours,
Linus Walleij
