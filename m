Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 815AD2FA21E
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jan 2021 14:52:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392308AbhARNe0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jan 2021 08:34:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733181AbhARNeC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jan 2021 08:34:02 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 581D5C061574
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 05:33:18 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id 6so23711850ejz.5
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jan 2021 05:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gpeJt4sFwqBjOrypvHBXhkahW36fR0StjLmTVgCtx60=;
        b=hDXxDkcaKc7QNbc330eLBN3cb3dfHrC+IXPmlM/8Py/JhfIlPFAZxIQKSIbwuW2O4w
         a4FAgystYnEPU62jeHwsnOV77tlhvsesS4V6/gTk1UUGjoefRmk6YImjixp6Gm8ukN/q
         h/Fko+ulgHMj6nqJAQLttZlsIMRG5wHnR4IK1l8CiPiIJjzV9b+bYyVDaMnXnXYKv8nI
         dAWjRidp+RY11T16qTQT/YCT5lPfKQZxSA3Emlc+gfCEzm4YQ7xRPsHHm5AXVRzLEnv+
         jIOZL6EnGbxbglqq00WoMynZCsR3iGkc7vqsgiklk+8hOTbvVQ6P2wxYQBJ0rAa4UDTt
         uoAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gpeJt4sFwqBjOrypvHBXhkahW36fR0StjLmTVgCtx60=;
        b=Te6tPwT7RUQtu1Fb3BVIQWFeJ8VXzXLiSx22CoLaXsx4HPgf2ebKWdcdqWIk83+SjH
         Ze4Yxow2iQxcvS693kuE1o4rAI2bF8rro6mVo+kv3kcKLCrJTlvykjhY+XBrraSKitIg
         Qf7ohirToeWGvlV7UdbLoRE67E3aRZA5cv+soE1ko0rRsuDZGT0RvH+AlMHQ2r3HH8Yx
         svrAUqwBAzuJMj5LzM2e//20C9O8L5EmmUtWzoF0MfAEp1+EilYYnF8/rSBIvbCTjZvC
         6cGzHNT2TnczmBEHcirZ//z717CCRni/Lh8jvod/81pqQLKavojzv0GSUzOwnAKi8hWq
         mC/A==
X-Gm-Message-State: AOAM531Sl1G/eDdzChrQmKUkw2jsQIFvQFVh5GRvSDyfSordR5yuXpki
        K5jhvH1UzmbKMdnySYa4R5uxjNn37BTSpMCrLftXomIfARY=
X-Google-Smtp-Source: ABdhPJwVX59jV33b/2juxlTLiEw7kRhKO1iEukLetuvO57JbX+1ydMf4Oy10iEUEc7vjhQI74tXtTpB5iSL87be58eE=
X-Received: by 2002:a17:906:388b:: with SMTP id q11mr4290515ejd.421.1610976797058;
 Mon, 18 Jan 2021 05:33:17 -0800 (PST)
MIME-Version: 1.0
References: <20210112010307.200310-1-damien.lemoal@wdc.com>
In-Reply-To: <20210112010307.200310-1-damien.lemoal@wdc.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 18 Jan 2021 14:33:05 +0100
Message-ID: <CACRpkdbTazK7yLPVe79SoneD+tdiXv9GPvN29dSMgCZkf8Pjbg@mail.gmail.com>
Subject: Re: [PATCH v11 02/10] pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Damien,

this looks all right to me.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Shall I apply just this one patch to the pinctrl tree?

I think the line that touches arch/*/Kconfig should be dropped
then, that better go to the SoC tree.

Yours,
Linus Walleij
