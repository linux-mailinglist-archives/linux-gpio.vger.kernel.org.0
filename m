Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F2F4B607195
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Oct 2022 10:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229535AbiJUICv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 21 Oct 2022 04:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbiJUICu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Oct 2022 04:02:50 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4DD2244C5A
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:02:48 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id y14so5172288ejd.9
        for <linux-gpio@vger.kernel.org>; Fri, 21 Oct 2022 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7TysXHZ2LM2GcnQOrVkW8a9gps5Wes5NwY8E8Vns/Zw=;
        b=qfVOSxZveK4oKb72YMgL0QigkFG0sZQ9sHgsYyADY0RhYpqX/vztF0otGSXo3l76tu
         tSN5s0ReWbceuZk2Yyk2l9taYNb6pG8bXS6UACxRyChf6aqVycKNsOLv+AgvnubYXOvE
         i58oLMlalHw6vjztxD1mtte+LcSbD6yPf0ioztwySRgjnKV2/G2Tj16VSBO+0M8NezUm
         vMUgTrDTh9ko10Dca0bJDewiN6iSbQ/yaefRffY2Lz5rNc8YVhOHIC7dl9vIFSUwT0tc
         ZP0mAH9vzGf0IsjLxM8QEGk23P8jvC1rQk69/gpl+LoCzM5ouNoQeKXALakVC6H0cOmy
         lJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7TysXHZ2LM2GcnQOrVkW8a9gps5Wes5NwY8E8Vns/Zw=;
        b=YQhIxznu4UnyLhDQap4BxNtmjUQsk21LEIY3o8yvHz9AkNXODURRrgnykmAi93tRWf
         osdwgFuQ4YR+/FOYZIWOLsXdWEk0tM5QcppVFzjHxZZ0L9CXrUISg7DwLQNwntUrr42f
         xePGDdvZerMzQBOP6W4cgoEqnMW40pN3XGwtgiwC1XUXRuyeoOm+3k1rbrv8X7Kh0TUq
         k94dM21BkvgsPc8dyeqgDej2Rd3wBlbtRl8PVEWleug29Yrk5ZKAIDHBCzJQ49vYu9Aa
         OAjFDG7KyrFiiYpvN6/F7FLdh2BbKt9b9jeViXF/bN+a92E84t1OVxx8xMcQ/deBXnwZ
         xh5A==
X-Gm-Message-State: ACrzQf2dr2CnkjFFGiSccnb2Qz817t2y+Q2+bv54LEqDwZG1AXG7mxP4
        5F1GXD5riES66Q5WVMSG4TyMqm2gy4K3HYwXpTZ8ndbqQuA=
X-Google-Smtp-Source: AMsMyM4YIhsRf2BsKWtTWE5I9fX/pcX8BNjxCLnWpl1QaBVKiJ3VTpsBZvLWTNwkFjW02CHW/2D0aAgYWvBMlSvty0Y=
X-Received: by 2002:a17:906:8a48:b0:78d:acdc:b7d9 with SMTP id
 gx8-20020a1709068a4800b0078dacdcb7d9mr14783736ejc.500.1666339367356; Fri, 21
 Oct 2022 01:02:47 -0700 (PDT)
MIME-Version: 1.0
References: <Y1FgAAHJu/cVNAIC@black.fi.intel.com> <CAMRc=Medt_M0h+1TdtRnu=7v1NmGePqfFBS02+zceXGLQ4OV3w@mail.gmail.com>
 <Y1GItraKIaDqFMjG@smile.fi.intel.com> <Y1GJFakunT78fXmE@smile.fi.intel.com>
In-Reply-To: <Y1GJFakunT78fXmE@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Oct 2022 10:02:35 +0200
Message-ID: <CACRpkdbSLbsxyCQUPaW2=W3A-0NxsGz9TFdhqExe=7RwcbNFLA@mail.gmail.com>
Subject: Re: [GIT PULL] intel-pinctrl for 6.1-1
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linux pin control <linux-gpio@vger.kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 20, 2022 at 7:44 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Oct 20, 2022 at 08:43:18PM +0300, Andy Shevchenko wrote:
> > On Thu, Oct 20, 2022 at 07:31:23PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Oct 20, 2022 at 4:58 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
>
> ...
>
> > > Can you send the GPIO changes separately? This way I don't need to
> > > pull all those pinctrl patches into the GPIO PR for the next merge
> > > window.
> >
> > Some of them, but not all, if that what you wish.
> > I.o.w. a couple of the GPIO changes must be part of pin control series.
>
> And I just realized that if any of new GPIO code will appear with the wrong
> headers, there will be an inconsistent state. That said, I prefer this PR is
> go as is.

Bart are you fine with pulling this as-is? (I am.)

Last merge window I pulled in a big I2C cleanup (remove to return void on
6 million drivers) and it was fine, my diffstat looked horrible but Torvalds
accepted it anyway I just mentioned it to him.

I think there is a way to shave off the irrelevant stuff from the diffstat,
and I think Andy even told me how to do this but can't find/remember the
git method used.

Yours,
Linus Walleij
