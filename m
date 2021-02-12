Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58392319B95
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 10:02:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbhBLJBc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 04:01:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhBLJBa (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 12 Feb 2021 04:01:30 -0500
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2E21C061574
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 01:00:49 -0800 (PST)
Received: by mail-lj1-x22c.google.com with SMTP id x1so4045581ljj.11
        for <linux-gpio@vger.kernel.org>; Fri, 12 Feb 2021 01:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/pP8IfofSQOMTyTQK3QurwdHzvMKt17mfyF6G06VuY4=;
        b=BE2sVqkpY8iV5KlzoqSFgIqejZnRPNqnhM6tgGP/yYdQ5eOPscSlPOQMmId00RYG30
         ffQLABcNE9F/fSol9dy+3knyrjhm+jHJZna5fQGWPplxbdiCVw/O6qoNlngMsDpM6lhO
         8kM32MuSPmnt5z793i75BDy+Tn9TMlZ1XXOekIVckGv6jF4BVCEQpkJdWnMuIkNJSgPK
         c80L0q2OYeM03ahUi24Ot0UkVLhzoDfXFQ1Atrr84vOjSYKIA3t4+FebplC6XijIDqwq
         2CiZiybl0OOCSYfnQGO0QUcGfHMtoh83kEbKj8Rs9BLd6F3iK+pVI58GVOc++DgSs5PM
         gmvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/pP8IfofSQOMTyTQK3QurwdHzvMKt17mfyF6G06VuY4=;
        b=EnVuFDPeIypKv1SpQDIte0pgxo2/LT1FRk52pSYjgb96bUGLbcrjrD38CEboy0mVXZ
         jPgT/kqlXLZbaCzAriK7+KKr1H93EUsMtljXvxAyueeLMEtPzT7ztMY4txJhhKUFBeq4
         jHX5isth8d+27a3/fAKVAO0vFv3DAKXrTEwpZh5LbWu+HR1Bc2tkwigPKwN9fpRhG24O
         2LZpO6hAVOouhPnDzqlqG7+bEr6tazGXPATtUzMD48oEqdO96L2SrtjH7T3lQdD7/7ko
         pdK7gzD0+HFeWNSUR1M+HFqCO6m5XK0/tW5+StKviCJHpSfv5mKOD31ivbXfNar4SQoO
         rjXg==
X-Gm-Message-State: AOAM533yi6fSyt+ZjIEpvP/kfLWD6HHOaxU1vVTJUrw6rDsYWsPOQhgm
        +cmLtABhZ8BXEAnySmvSU51t4vQUflp3i0X7hwJeYHxg1CXz6g==
X-Google-Smtp-Source: ABdhPJxp220Yhyu3KHp6tFzIhAqaKO6NgKCwcJhjjshCAICA/X6GwVjbfUpJnmZIwex3hBvnP48RP/kcS+Py2GYQhOc=
X-Received: by 2002:a2e:8998:: with SMTP id c24mr1221309lji.74.1613120448271;
 Fri, 12 Feb 2021 01:00:48 -0800 (PST)
MIME-Version: 1.0
References: <1612688430-54282-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1612688430-54282-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 12 Feb 2021 10:00:37 +0100
Message-ID: <CACRpkdZho-zSTjVFNSrcQ_VWdgKpW_jpc-bX+EcA_dzdGgOKrA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: cdev: convert stream-like files from
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Feb 7, 2021 at 10:00 AM Yang Li <yang.lee@linux.alibaba.com> wrote:

> Eliminate the following coccicheck warning:
> ./drivers/gpio/gpiolib-cdev.c:2307:7-23: WARNING: gpio_fileops: .read()
> has stream semantic; safe to change nonseekable_open -> stream_open.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

This doesn't make any sense to me.

It is pretty clear from context that this file should *not* be
seeked and it seems just dangerous to randomly allow that.
Better safe than sorry.

I don't know if the function nonseekable_open() has an unintuitive
name if it means anything else than that. I burnt myself on the FS
before.

Yours,
Linus Walleij
