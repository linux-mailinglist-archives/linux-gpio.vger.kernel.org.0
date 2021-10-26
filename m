Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4C4343BD1E
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 00:21:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237266AbhJZWX3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 18:23:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232718AbhJZWX3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 18:23:29 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3644C061570
        for <linux-gpio@vger.kernel.org>; Tue, 26 Oct 2021 15:21:04 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id j2so1939057lfg.3
        for <linux-gpio@vger.kernel.org>; Tue, 26 Oct 2021 15:21:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZlgtQAxkjTvj8T+NiFuX+YdjQJNoRYDUWGidTE7NktE=;
        b=lP53rE17CXHjyhEcAMjZOKQP2wp23J8OD0vD2MI+vVS5gmf5BOG40rCPxDf/Df4yrG
         WYMorX2dS00+xbiNG0sJAk/KkcOE+JGs2L5jfIpHD/YBcMx5fAUMd7tFu8mYizOm37H8
         iBLShaiht6g6hi6YXbsSpGiyTHgR5DQnI8c4J3cwr/PpwXurJ620Yln3LhiyfRzNDgjM
         Z3hB9aAppPQMG2pEm2yORVZtTuUSUAZGA5DUPA5n6B5VV0FoAtM+zwSJ3fMSRPwPvXep
         kni7KbjAF9g3dfowbMQm5f16qX3aXTlXEp6foIx4vmuS1NIy23Uxf1Qkam96i+sMkZey
         9zJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZlgtQAxkjTvj8T+NiFuX+YdjQJNoRYDUWGidTE7NktE=;
        b=s2gwKUnnsLxet3vdUEIk80xCqhhulAxMBJG9nWpzPRECC281a4Ce/66KxehjJGks4u
         OUCYpkyfpLYOD1xpdHuyw0ixqS6GIGPmP6w8VpftII+cTLeR1tSYw7xGfSgyn01yAHqn
         B9PVrT8+f/5zyEU69CBWPfXkhEW4WhGjkytNiBE5v1rpHnAbxh99RwDp4/ntMoY8shhD
         K8sF/LjX2yLvFZwz2Hlp3D4YLjK7vysML/guK5xx5lcGukqgQTRB+zLwBzKzkzGgr2m+
         puLGmvEKK3ca3yfXGt9Bkl6B45hD6Ww32QrrLEqEYN8m2k+cbQiJ+hUflXvRr67x4VSP
         ojUw==
X-Gm-Message-State: AOAM531NSEVkV9kk7tDCc5SnWOjB4WQhk80ooALxyNuBOv522sR5AzSY
        ogYZgy/vJGdX3TJXpLHi3DCR2ipKbe2xG8/gCMZAkg==
X-Google-Smtp-Source: ABdhPJwiTxeE+wx0gpSVxCZCymLsJYilUf1TwSM2k5kPWFpxVcr09yIRFQMN28eEDKweQL95lAg/hxK7sdqwzIUejR0=
X-Received: by 2002:ac2:5d4a:: with SMTP id w10mr25529349lfd.584.1635286863063;
 Tue, 26 Oct 2021 15:21:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211026175815.52703-1-joey.gouly@arm.com>
In-Reply-To: <20211026175815.52703-1-joey.gouly@arm.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Oct 2021 00:20:51 +0200
Message-ID: <CACRpkdbJM0-epk0D=-VDs9mdVVxarR=K6BA+rowiO2173ScE-Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] pinctrl/GPIO driver for Apple SoCs
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hector Martin <marcan@marcan.st>,
        Marc Zyngier <maz@kernel.org>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Kettenis <kettenis@openbsd.org>, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 26, 2021 at 7:58 PM Joey Gouly <joey.gouly@arm.com> wrote:

> Here is the v5 patchset for the Apple pinctrl/GPIO driver.

Excellent. As agreed I have applied patch 1 to an immutable branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=ib-gpio-ppid
If Bartosz needs this patch he can pull it into the GPIO subsystem.

Then I have applied patches 2-4 on top of this branch for v5.16.

I leave patch 5 for Marcan so he can minimize MAINTAINERS
collisions.

Thanks for your hard work on this!

If any issues remains to be addressed they can be done with incremental
patches for sure.

Yours,
Linus Walleij
