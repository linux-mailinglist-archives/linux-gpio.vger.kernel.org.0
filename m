Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E90446BF4A
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Dec 2021 16:29:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238706AbhLGPc7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Dec 2021 10:32:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238634AbhLGPc6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Dec 2021 10:32:58 -0500
Received: from mail-oi1-x234.google.com (mail-oi1-x234.google.com [IPv6:2607:f8b0:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA6DC061746
        for <linux-gpio@vger.kernel.org>; Tue,  7 Dec 2021 07:29:28 -0800 (PST)
Received: by mail-oi1-x234.google.com with SMTP id bf8so28367057oib.6
        for <linux-gpio@vger.kernel.org>; Tue, 07 Dec 2021 07:29:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3v1bWCAfgXuqzDilZqGGMpPIb4q0JIBN6jFwOUm5278=;
        b=HMHriM1Mu58q8gApV9rfw5KqGymBPX6gLuNgRoA5L8d7brqhr18J8BdvGw2cAdHB4N
         zXUclQwAE7fqtES5vJZk6BqcL/2nyr27UqmLk9gzwizyTetHKV18D59HIaYNC+OTXXwz
         Kltb5TcSSE3IhiMoFIZp3kmQjDnhTMKXpactPNHQD7+fQ9vQTspEEtcJcZ6QLMNWU9TB
         EuNTYFgPSD4n0FxhHrV7PhVweSVjLmNWRgl7TVQ/ItqzeuCFxkLLhIRUUGlKOdGv3o+6
         P9NW20aK1oW8wee2Ln/GUY7hW0zRUhTu1FN/Y/5NeiZ23u0kW07h3qTrVZXXwLn2EYze
         CkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3v1bWCAfgXuqzDilZqGGMpPIb4q0JIBN6jFwOUm5278=;
        b=Ry6qz5YAE3KcGgjNAiU2C2NcM1xDyY/IJ7lAFCrB1S2ho1uG5NNPFBJbHTymnZfT3h
         2uj2q7QdX0j765W2pV6FznvuXoGfH/iidvRFKBdeXG8l8LIFRS4NV2fRlOdinp1qrc50
         5PICvoobzJMfv1szv2zbHjfa4X3q1k0EBxDFa4LtYno2q6KcgqZNIeuCWozK4hWKPN2u
         hsgDrqtK2sEGMM8Am2CesJblZ9IZNEs207lzfBLdWFcWgr+zpoXFNlnzaTo4LHmUBW3X
         cfdBNqtpf05NOb4d30HBVCvjvFGXGbn166a5VAdOmdZeDHSbegbR/qbMoDnDJUi09P4F
         v0Ww==
X-Gm-Message-State: AOAM530MlgFjUvoeK//MN8zB7/AgxjC79sodlnBPMrbeCdvwr3yBS2I4
        BDn5hDYRA7d49zGdEOrAqd4ryYnn5VVr2NnGFjnCxg==
X-Google-Smtp-Source: ABdhPJxvof557q23el0Q5xSTZDI0BT2tg0o4/kEoX/tBZ01elYBOoldfCw4wCxNmQ5H0Fh6lko3OW2ykx4vYG2exTM8=
X-Received: by 2002:a54:4791:: with SMTP id o17mr5944391oic.114.1638890966412;
 Tue, 07 Dec 2021 07:29:26 -0800 (PST)
MIME-Version: 1.0
References: <20211206092237.4105895-1-phil@raspberrypi.com>
 <20211206092237.4105895-3-phil@raspberrypi.com> <CACRpkdYJAZcr_PPCGPYcitfcwd9GDFf+7hPJkOmjomqCrruNfw@mail.gmail.com>
 <04acf5f1-7d82-b12b-f70f-1712a4a2610c@gmail.com>
In-Reply-To: <04acf5f1-7d82-b12b-f70f-1712a4a2610c@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Dec 2021 16:29:14 +0100
Message-ID: <CACRpkdaK9swgQa3G1z2+e7Tazn+TGHpzfcFjdMbNytHJ8gxYnQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ARM: dts: gpio-ranges property is now required
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Phil Elwell <phil@raspberrypi.com>,
        Rob Herring <robh+dt@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>,
        bcm-kernel-feedback-list@broadcom.com,
        Thierry Reding <treding@nvidia.com>,
        devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Dec 6, 2021 at 6:25 PM Florian Fainelli <f.fainelli@gmail.com> wrote:
[Me]
> > Please funnel this patch through the SoC tree.
>
> This one was definitively going to go via ARM SoC in the absence of any
> explicit routing, did you mean that patch #1 should also be routed via
> ARM SoC?

No just over-clarifying.
I will merge patch #1 after some review slack.

Yours,
Linus Walleij
