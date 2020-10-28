Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3102929D6E3
	for <lists+linux-gpio@lfdr.de>; Wed, 28 Oct 2020 23:19:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729991AbgJ1WTF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 18:19:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732279AbgJ1WSp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 18:18:45 -0400
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C36ACC0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:18:44 -0700 (PDT)
Received: by mail-wr1-x443.google.com with SMTP id n6so665199wrm.13
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 15:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RrRlnhg/szGXJ+CqTv+QgypRguxwePuNcvzko2eNF90=;
        b=iuAxgqHLkaJPSxfJIECz48Mk4HqjEvaKw6exSc/dPtOPplsvx9/zMz5kQQfnj90PYs
         A7tDdsksEYUq3ePEFesJ3QZL/DTEc+nPxm1fPiCsHEU4vDoxsi/t3sBLRfMsyVUSu3xJ
         EzP9TIhV/2YVRocIgkrKZ/DjHL9zjRbdOQ6+Pz29qR54ppwN0FQMIxMEZ9xnKG3kCuro
         pfH7JV7vsODpk3n2DQ9sJmXM9maBdl3w/Y8jAxhryqcXu1jXVJeNG166qF3B3TIEC5v/
         knuiF9mHiMCNLapbLVyW1D9NlLGFu4sle8tXHZQ1BidCPjtm6c/OZ32fq/BQZ2S5u/wb
         SAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RrRlnhg/szGXJ+CqTv+QgypRguxwePuNcvzko2eNF90=;
        b=pJbwHRv7SVQO/sKF1rnxVzgswoLRYoRHf6TkublXZdpEFJoQBQz/Ved2x0RI6z4Ieo
         99cW3gJ99nA1oVJXeqMzC0iBtV/DS5fxBjHIbtqV5VtNoBlc/x3eq8oFWkp8zzeMFvgm
         JTmhonqFxsSzQ3ZyK3NtkN+JdDxTtyKFqarw6wKLmG0jkIT9Sq+zBsOFMjp2fLwVK16x
         A72RduB8bB+CqiFWsmITX0pxbtTRcvcavNmb+PgX5O+hiY/qfaILGGpWSFegL/z5tMJv
         lu4aiyCbFJx9/F/EXmG7eCPZ3/7AODTwUDVNbTllwscXraIWC6GkZ8eIvMu2MaRNwGVz
         HyGQ==
X-Gm-Message-State: AOAM531E+mP7QbXFZyJ0NnEmh3Fi46k/RecbxdnHKlma2AgumKpGQlx4
        RxDUhOX0YonUlfVnlsZ7g+5Xs5Nduk41KnRtNEEGEOf8f+tEyA==
X-Google-Smtp-Source: ABdhPJwKVwR1CvYavirDMXZ0fgbvKeG/If31B/j9xpUc5tE4BcwJl2E9iG+PvZDYBYOtcz7m1HOT6sMXVSAn0X3/d8w=
X-Received: by 2002:a05:6512:322d:: with SMTP id f13mr2793562lfe.571.1603900485127;
 Wed, 28 Oct 2020 08:54:45 -0700 (PDT)
MIME-Version: 1.0
References: <20201013063731.3618-1-jay.xu@rock-chips.com>
In-Reply-To: <20201013063731.3618-1-jay.xu@rock-chips.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 28 Oct 2020 16:54:34 +0100
Message-ID: <CACRpkdbrGBJjOPBicQKAde-Y3NNARRcpvcK52Uu1Buu7sC8AvA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] rockchip-pinctrl fixes
To:     Jianqun Xu <jay.xu@rock-chips.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 13, 2020 at 8:37 AM Jianqun Xu <jay.xu@rock-chips.com> wrote:

> These patches are required by GKI.
>
> Jianqun Xu (3):
>   pinctrl: rockchip: make driver be tristate module
>   pinctrl: rockchip: enable gpio pclk for rockchip_gpio_to_irq
>   pinctrl: rockchip: create irq mapping in gpio_to_irq

Patches applied for fixes.

Yours,
Linus Walleij
