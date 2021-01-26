Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C62130417B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jan 2021 16:06:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406071AbhAZPGU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Jan 2021 10:06:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392776AbhAZPGD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Jan 2021 10:06:03 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 752DDC061A31
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 07:05:23 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id b26so23101870lff.9
        for <linux-gpio@vger.kernel.org>; Tue, 26 Jan 2021 07:05:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=G5f89S8Xb6DUcHmiTz0GSBkz1fMLcfLYVOcPj5pfZLY=;
        b=CjJAfYI1kFnKHVzLp69waVTF6o37FJ6bpMSPZ8nUzlpcPsgSBme+M0iKOtc7RiltzM
         hEmiV1JOBftRN49xvQuZvSS9SS1CkgxvgoSpQlnsdzd1DO4yTN9GwQfkvH1hZcrh4U0x
         FLx5r63aIAKyrS+TUxLqN+LvjzAeHA8sb9IBEp41lKebhCZBzAJ3MXPj9VydJ+rOaFZm
         I110UbiRN7qURJRU39YLxCIclrZVZ8FvIpdWiH5++nzS2UT82kXVJV6agIQKWHg5brgU
         1Ort3e/qjJBQXXy8XX9T6Ylk0Qp0CEPMB05FIPpetupO6ym0iCUcoxxCOZBC0pMpUzWR
         eZbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=G5f89S8Xb6DUcHmiTz0GSBkz1fMLcfLYVOcPj5pfZLY=;
        b=UG46bwIqirhLs2cguB7SnjHlVLG7PG5MTbDqihjUDjyFonkhs/x9+nWTxjgpv6a5Po
         DyDLKVg8muZ2guzVUnLO60QIWw6qUPBgXx/U3ymjnVZ49YCShtKL/uBPM4ZPHfodLQVD
         FLVsASJ3HByClmbhL+6iPekMjl6+uwM/2IiRhAhA3F8PBfXg9wFN3k20SsJzZzK5PO7R
         LR7e1Iqn4pkHrXFl0nq0AEObRcxZTPD2zJ2ksNc331AbUNPIxzgHzbEyu1Jf6gEryaMZ
         1nGdh0sfVDkXE9KyaxS5RLaRQViiGaOxaL89CDaPyvqggeL1z7EErAuLTBw9ac7c0izw
         MU3Q==
X-Gm-Message-State: AOAM532Q350wpbS/WfWiz1mvm5kiyB9cl5wYZ83fzlkZbNE/ICzlar3l
        Sm2tSQ6GiMIlw81oZx3nyK2/5HWVOSlo08qsQ0p0iw==
X-Google-Smtp-Source: ABdhPJwLaop1zweI4uEMv5zOrPWAzBs3HzSbFruGC9OvPrRUehqSpKpkw/R5UYBhnkeDKmElrjKWYY/6lDa5hVPPN1s=
X-Received: by 2002:a19:b8e:: with SMTP id 136mr2961494lfl.29.1611673521969;
 Tue, 26 Jan 2021 07:05:21 -0800 (PST)
MIME-Version: 1.0
References: <CGME20210125232704epcas2p4f362849a8f5e85f46d406d20b7983429@epcas2p4.samsung.com>
 <202101260734.haBuNSsB-lkp@intel.com> <000001d6f377$6c1b3af0$4451b0d0$@samsung.com>
In-Reply-To: <000001d6f377$6c1b3af0$4451b0d0$@samsung.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jan 2021 16:05:11 +0100
Message-ID: <CACRpkdbAfAsJEhvLosrZCHcdRRTUYgLSR0McykxCamqEE=d8mg@mail.gmail.com>
Subject: Re: [pinctrl:devel 32/33] drivers/pinctrl/samsung/pinctrl-s3c64xx.c:296:25:
 error: passing argument 1 of 'spin_unlock_irqrestore' from incompatible
 pointer type
To:     Chanho Park <chanho61.park@samsung.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 26, 2021 at 1:08 AM Chanho Park <chanho61.park@samsung.com> wrote:


> I was not aware PINCTRL_S3C64XX because it's not enabled in
> s3c6410_defconfig.
> Please pick the v2 patch. Sorry for the inconvenience.

I can't do that because I have merged other stuff on top and pulled in
other branches.

Please send a fix-up patch.

Yours,
Linus Walleij
