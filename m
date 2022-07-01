Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5A8DB563158
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 12:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236264AbiGAK2y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 06:28:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235872AbiGAK2x (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 06:28:53 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 382175C9FF
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 03:28:52 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id h23so3195902ejj.12
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JbEvq3lXLebJqO8/+4VfDqxPieXVlWjP+QS6CxjXyFY=;
        b=LWPDFxo9G5nGj4IfZ4y6W9RgI8eIbnTRlU/5otz0LZxfqiKrZduwYs0mJtCCN2vxKY
         AEMnSWTUdncQWyksFui9pTy6y4b44as/wVkvIY6i5so4eRRVb08u2++2t3LDrxDfl98i
         c9SE31Yn0m41zfcE7mCpToRn+mMx2oy0J+FZk7WZRa4WmUb3iKkSrH/FzJXvu93aezTw
         9kL8y2lxnE1dTQsm4AOtiUp7+zIet9pzyfc8TiGfK0VIgKWzm4Rg5c+ifwEk/bhmJcaB
         kVu7bjwOfqdU+/uzQ5H8KKJe52cAnp9V1ijZjhhuqspg7AioZWkWPDU250FGera/4JYS
         QRcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JbEvq3lXLebJqO8/+4VfDqxPieXVlWjP+QS6CxjXyFY=;
        b=7PRLDjitLC7eWBmVMvFsfeEzZI6fbCqhRcGHYNp7yvQXkJj0T0vY4qjBGO0UTguhJU
         0hLCAaWvpCPRNBtk0rS9xcjcS2nLjV3BRjJfEklLK39NfcqSjEYBM6Bhi6cP8ykjxMlm
         RpGpkxKltCsYdAbNRlrd5wij7b029OpLtsIXAPLWTwjXEDI/tl5ZIaMmxRoV4feLTFmX
         xkk8Px6VSFJECrAAI8080WISeBIfyrXMWMGlIAOfpE7lFT70ers+3IyFi9Gti3yjiKGP
         AfmL74HLsmPK+85eMQij0edGAj0QZL8v9ys+OsDBY+Z4MqeWIFeD1Ig84AHh2TCHWI2b
         /Lvw==
X-Gm-Message-State: AJIora8o5EfXgbg/+6oyLiKZuzXW3CdpLjeEf0bOHbiYVOtgM1RknVfG
        MCw/OfZWL4PMxlnO64nKCUxD5DECuyfzK2k/y6eh+g==
X-Google-Smtp-Source: AGRyM1u8qiRNsfSPNK2s1d5dSBDl9kXWhMasPBPly+FlsGSN/ERl1mF8Qp/KILtAcqZAa+7BcZPcsQ/FXQI5dfgkOEE=
X-Received: by 2002:a17:907:2815:b0:72a:4eda:a35f with SMTP id
 eb21-20020a170907281500b0072a4edaa35fmr10038647ejc.636.1656671330810; Fri, 01
 Jul 2022 03:28:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220613054310.21186-1-a-govindraju@ti.com> <CACRpkdZB1T1cKQcNDiriCdeQuHGMH-9BvV=a9mP21YENThA-bQ@mail.gmail.com>
In-Reply-To: <CACRpkdZB1T1cKQcNDiriCdeQuHGMH-9BvV=a9mP21YENThA-bQ@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 1 Jul 2022 12:28:40 +0200
Message-ID: <CAMRc=MfB2hNB+vbs4BXbV-StDyA++yoQP9HDBbMTx2JWJ9KRyA@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: davinci: Add support for system suspend/resume PM
To:     Linus Walleij <linus.walleij@linaro.org>,
        Sekhar Nori <nsekhar@ti.com>
Cc:     Aswath Govindraju <a-govindraju@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jun 28, 2022 at 3:52 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Jun 13, 2022 at 7:43 AM Aswath Govindraju <a-govindraju@ti.com> wrote:
>
> > From: Devarsh Thakkar <devarsht@ti.com>
> >
> > Add support for system suspend/resume PM hooks, save the
> > register context of all the required gpio registers on suspend
> > and restore context on the resume.
> >
> > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> > Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
>
> Hijacking thread!
>
> Aswath, if you are testing DaVinci boards can you look at these two
> patches:
> https://lore.kernel.org/linux-gpio/20220507124536.171930-1-linus.walleij@linaro.org/
> https://lore.kernel.org/linux-gpio/20220507124536.171930-2-linus.walleij@linaro.org/
>
> I resend them every new kernel release but they never get merged :D
>
> If you can test them, maybe I can queue them directly for the SoC
> tree.

Sekhar: do you still maintain DaVinci platforms? If so - could you
take these patches through yourtree?

Bart
