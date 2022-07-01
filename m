Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7D49356334B
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 14:13:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231437AbiGAMNd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 08:13:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGAMNc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 08:13:32 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44487248CA
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 05:13:31 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id d145so500132ybh.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 05:13:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=raIh12eX+zBsgeOrg6KaTPPoiUG+5/pHjCbiX0SCjhQ=;
        b=vTDYKp5g/Z1DozMoTk0/+GCMZ3I/9S4XjITAWpPzhuNc2CuRju3N/ko0Ct8HyfByuY
         S8gvWkg+oOV6SFeVLCPqz8XwpxCz+0eDs6bKTBs2U6B2tj8oQ8FDlirqN8fTYT6qqf6N
         O21Yi/oF3mlJRb4V460e8sk1sriYOHK752uUsNUoCfT6r/ocrqovvkU+qxv/x9T9LDUk
         MWtRNW+1okNEY5oKQwgzqYTranw8oNW4qTldHzMgoQ7aInWoDziVPS/wQiinO32RmN92
         xV8TL4JEAzJU/x9mpOvpZEu7Org82uF4fmSwS54CadW5LENL3eCw+k+FWKul/GnSBc1x
         kZIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=raIh12eX+zBsgeOrg6KaTPPoiUG+5/pHjCbiX0SCjhQ=;
        b=XbgH4YzZOux2Pfpzg3H/7DBiG+QQKxvfXrMvnZKoGZJwlmKq7vJRiTOzGqaOrpKrBi
         EjD3gCiEQJB+te+WHzsKooT4/6Q2jKGWgUraT0lKgPU0HawiRO3daG/KXvsP7OnHFlQg
         PJJpwqPiqcUZDy7xA0wwQO0mT127TflT8oUrEFzNZRIO4mm1DNMPwEeEAwHC3K7WQ9IS
         IZKzS93lPKxODvp1kQru2GGK+p/hBBUrH86BB/IjotbywdQKHMx9bwnmh/JzoPGIz6de
         +SLVJrXwLUxkQYhxttrHTYcjN5dTeRyPSIKFkrq3zm7aLA95/3iM0qQ9/rrYZ8YjiqSs
         vLQA==
X-Gm-Message-State: AJIora+0U5Ojqf9fNONNn3SP10yMinmi2XBzSkgD/yJ7SEHsbLQiL9Gt
        Hm2tDmIhUb4Qi/7m/N58ixeaXPX7R/HuvPrF6RaNhw==
X-Google-Smtp-Source: AGRyM1v4vIk10yNEC7mjc8X/muwtw++AdY4V8s2PjW3gHrXZeYeHljjnEJIPMcTuaThXjX4SatQg23AKGMVikNch+cY=
X-Received: by 2002:a25:1f57:0:b0:669:b6fa:167e with SMTP id
 f84-20020a251f57000000b00669b6fa167emr15927296ybf.295.1656677610498; Fri, 01
 Jul 2022 05:13:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220613054310.21186-1-a-govindraju@ti.com> <CACRpkdZB1T1cKQcNDiriCdeQuHGMH-9BvV=a9mP21YENThA-bQ@mail.gmail.com>
 <CAMRc=MfB2hNB+vbs4BXbV-StDyA++yoQP9HDBbMTx2JWJ9KRyA@mail.gmail.com>
In-Reply-To: <CAMRc=MfB2hNB+vbs4BXbV-StDyA++yoQP9HDBbMTx2JWJ9KRyA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 1 Jul 2022 14:13:19 +0200
Message-ID: <CACRpkdaOtXJ09pY5rS-AaEXXfLjKkiZ-h1n5+gNMO99kxo5wiw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: davinci: Add support for system suspend/resume PM
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Sekhar Nori <nsekhar@ti.com>,
        Aswath Govindraju <a-govindraju@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Devarsh Thakkar <devarsht@ti.com>, Keerthy <j-keerthy@ti.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Fri, Jul 1, 2022 at 12:28 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> On Tue, Jun 28, 2022 at 3:52 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > On Mon, Jun 13, 2022 at 7:43 AM Aswath Govindraju <a-govindraju@ti.com> wrote:
> >
> > > From: Devarsh Thakkar <devarsht@ti.com>
> > >
> > > Add support for system suspend/resume PM hooks, save the
> > > register context of all the required gpio registers on suspend
> > > and restore context on the resume.
> > >
> > > Signed-off-by: Devarsh Thakkar <devarsht@ti.com>
> > > Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> >
> > Hijacking thread!
> >
> > Aswath, if you are testing DaVinci boards can you look at these two
> > patches:
> > https://lore.kernel.org/linux-gpio/20220507124536.171930-1-linus.walleij@linaro.org/
> > https://lore.kernel.org/linux-gpio/20220507124536.171930-2-linus.walleij@linaro.org/
> >
> > I resend them every new kernel release but they never get merged :D
> >
> > If you can test them, maybe I can queue them directly for the SoC
> > tree.
>
> Sekhar: do you still maintain DaVinci platforms? If so - could you
> take these patches through yourtree?

We concluded in parallell discussions that DM644x and DM646x are
unused as far as we can tell so I just sent patches to delete these
board files, that should do it.

Yours,
Linus Walleij
