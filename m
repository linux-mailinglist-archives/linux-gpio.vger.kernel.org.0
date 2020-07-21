Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01746228083
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Jul 2020 15:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727805AbgGUND4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Jul 2020 09:03:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgGUNDz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Jul 2020 09:03:55 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3804AC061794
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:03:55 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id d17so23987149ljl.3
        for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2020 06:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wKkM1VGKKIbnmCvk5KckH99yZiVJcwCKKQ/vhbDuoHQ=;
        b=dYQwTicaG8ejcCuzoYtSYx6+UqPhSlf9Te+Ho5wXkgsPQi9m57UOh4SYVN0P4ln51a
         gQw1QWh1JldSpBNTNE7vg8pyINOEDMwLub7FWm9dlp/CuL/NUOx+MQMo2P4+Kzkf4omQ
         lw+qvjNsCMw7Gtnc6Te7k8S2/PEi80G5QWWH/t1behuGbVhjek5Qc5EZwC9dNCsNto61
         lT8ngoj45wbB2nn6RvoJCy/lb6jKMMkUzRHxz3Du0xcn7Sg+C4YQCCByJ+7RP+HN/A04
         z7ZscU6WG+Ii4vhcIc7PDiEtf/zX7TYopHX9jLjFJ09gIVe320SxiFaC+62Qpo5YC1GJ
         zFRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wKkM1VGKKIbnmCvk5KckH99yZiVJcwCKKQ/vhbDuoHQ=;
        b=HsH3NHulGSc/PmCBKCQ0j5AP9jiHUVKaaUNROtcFXYX04Z7wvvIvwyM+alHJa+aoUE
         xE4gi17JuH2Zz6HAFoyY2MpJsO9B8gIK3G3AisPCHAw1Sx2o/M4vaWf/Wk5p1UEhB/zl
         phIO59uqwmZ6A89ruBQBBh7E8ZFLsI1UywtIzbCfaA56Js42V/0tPe7cZbtnzJT0HN33
         IFuy1yOtlJq/WEZnozS+xgPypi+D80AlG5IIohjcJZti+ZOAwQpfeaJix+xpucVPCl/s
         jOkQL04fcmOg/xngUSYcDlqj6pOdJZP66oYyz43DNtM3BwYElhKPcU1W40O9QemNgPlq
         XAbA==
X-Gm-Message-State: AOAM5306N9agX1cCehNOibP5e7RKqVwEjj9Q43myj1sfHw+cuL7FH0G6
        EpLGzo6SYolmi4iEAakLzwgkd07l3isEdaxx2T/JZDGrbT7C6g==
X-Google-Smtp-Source: ABdhPJxQCjghR90yXcH99+Tcp0YiMNXZMOeGjmUuSFHDdFNPWcjE4bzfZxd5AHNdZIoBUFRGjyOaZtWHZtRJzFxSpkQ=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr12478242ljg.144.1595336633464;
 Tue, 21 Jul 2020 06:03:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200719210926.152305-1-colton.w.lewis@protonmail.com>
In-Reply-To: <20200719210926.152305-1-colton.w.lewis@protonmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 21 Jul 2020 15:03:42 +0200
Message-ID: <CACRpkdbGzKbnj3ocEO5wTO1edB9ov_1BRh=hh6wC8EYyZd1arw@mail.gmail.com>
Subject: Re: [PATCH] gpio: Correct kernel-doc inconsistency
To:     Colton Lewis <colton.w.lewis@protonmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Colton,

thanks for your patch!

On Sun, Jul 19, 2020 at 11:09 PM Colton Lewis
<colton.w.lewis@protonmail.com> wrote:

> Silence documentation build warnings by correcting kernel-doc comment
> for gpiochip_add_data function.
>
> ./include/linux/gpio/driver.h:512: warning: Function parameter or member 'gc' not described in 'gpiochip_add_data'
> ./include/linux/gpio/driver.h:512: warning: Excess function parameter 'chip' description in 'gpiochip_add_data'
>
> Signed-off-by: Colton Lewis <colton.w.lewis@protonmail.com>

This does not apply to my current "devel" branch:
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/log/?h=devel

Could you rebase and respin?

Yours,
Linus Walleij
