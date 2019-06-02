Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 050A4322BC
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Jun 2019 10:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfFBIj0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 2 Jun 2019 04:39:26 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:34630 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbfFBIjZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 2 Jun 2019 04:39:25 -0400
Received: by mail-lj1-f196.google.com with SMTP id j24so13434007ljg.1
        for <linux-gpio@vger.kernel.org>; Sun, 02 Jun 2019 01:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=yE2J5a6MB0Gc48eIqCKYzxTEPvXkEUZm6g5N6vUrQy0=;
        b=ISwdVjqGJ/u5HKAq5gTbqhDyiyczVmMmlYTgwPHKcPUmp0SwhHzU7n9NBcQLBkvePA
         AWZD4Y/Gd3Yl5vikkmWg5f0Ggh2Bx5BvM4zyG0wVU7KLmxO33iIVHM7rgYXNl1Ccs1Xy
         GEnHP6yig7grGK7di8iJCX6nFOvvZ1avP631pXQHKH+bw1LgP2uBOkr+ExzwXGbxTYgr
         xBp9nEvrC7335Ckbb2gq8dp5yWLCsj1QgPWMcODMuUhBThSETgSzzM7wrbzsLl7yxDBl
         10ZyzxfsW7kA1z0zpt5fsaNVuQ+47nBrhlHLOro5mWUJ+Fcv0rdwL1eFPX/OFm+ns+pE
         H4zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=yE2J5a6MB0Gc48eIqCKYzxTEPvXkEUZm6g5N6vUrQy0=;
        b=bBmUawg3jB+rBXl4iAD+pujplZtAeSbDrMi292K+RJiDcxT7eMBJVSs76C5elmZmxM
         QEkVMjXxzp8C2LdnJmDkPEkxCobuFubzx9HV3TTszgTMMosjH4U8zKY7VWkbgJrSFwfU
         JMnKB44TczGkzYGCzc/e/45YftT9s7/8/A3mQoInSm8V/Inqhnbv2z1q6kEgILiJMIJn
         pnJisuUjtJln6bofYwv7gfn2wnczP0yAYQyG7MTRKikqM5satPO5uOtIfXyLB2L56EVA
         1dNSbMZY5JiMs4KBsuzM7FTxsydZS/jQTkvCV55WqEJlxg2Y9TuulH9m6/r29TJzhggQ
         B63g==
X-Gm-Message-State: APjAAAX+tIYV5/64lMFWaq6kRMwkV5IcPFSqXf1/W5LnMUVAO37jpLZy
        yCXYcVOXCGuRC8zsxSYTazoaII4Wa4iBxvwCM6jmGw==
X-Google-Smtp-Source: APXvYqyh6hWIl5W5nMmF/9/ej0DWHVcr46h1HQVRnLm8WUwbiyWxXnadUkdktX1kP9ytr2yZqkgU50r5CZ++QGbwClo=
X-Received: by 2002:a2e:8902:: with SMTP id d2mr10897010lji.94.1559464764019;
 Sun, 02 Jun 2019 01:39:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190528091304.9932-1-yuehaibing@huawei.com>
In-Reply-To: <20190528091304.9932-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 2 Jun 2019 10:39:12 +0200
Message-ID: <CACRpkdb0dti=x2UxaOoP=VRrzxQTuAaeQ2==UM4U6KNyHC2QwQ@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: bcm2835: Fix build error without CONFIG_OF
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Greg KH <gregkh@linuxfoundation.org>,
        Doug Berger <opendmb@gmail.com>, Eric Anholt <eric@anholt.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Matheus Castello <matheus@castello.eng.br>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 28, 2019 at 11:18 AM YueHaibing <yuehaibing@huawei.com> wrote:

> drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function bcm2835_pctl_dt_node_to_map:
> drivers/pinctrl/bcm/pinctrl-bcm2835.c:720:8: error: implicit declaration of function pinconf_generic_dt_node_to_map_all;
> drivers/pinctrl/bcm/pinctrl-bcm2835.c: In function bcm2835_pinctrl_probe:
> drivers/pinctrl/bcm/pinctrl-bcm2835.c:1022:15: error: struct gpio_chip has no member named of_node
>   pc->gpio_chip.of_node = np;
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Fixes: 0de704955ee4 ("pinctrl: bcm2835: Add support for generic pinctrl binding")
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied.

Yours,
Linus Walleij
