Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04AF2305E87
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Jan 2021 15:44:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234324AbhA0OnK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Jan 2021 09:43:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234327AbhA0Ome (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Jan 2021 09:42:34 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1981EC061574
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 06:41:54 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id g12so2974662ejf.8
        for <linux-gpio@vger.kernel.org>; Wed, 27 Jan 2021 06:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DuOa7ZEsTI7Y364o/TcoZAKGbJr0jvsbyAw2/nr+qg4=;
        b=duXCWPaG3ZkgSVUzlFwMgG4NoT8oj+HYdl5VGOgUwN1C6zfjviGhPDVYvZ81cNFxmF
         6mERpEdHo36ackTZgSKHdTw01wWAPdgWmOh/Q/lP3bMdEGaiK5j5G+lOuJpBVb0/F/h2
         7EgR1Mqr1ZvGRvP1Kk2i1nxvj1qoiWuLEYmacafZ2yxmzDzdhdoJOPCIjTGkpFKHB+M0
         sjmiXHzlFZ+kiLSlchlSl9lIYVKEIXzbg9/FTXouutMU3Yn/nnZGYY9eFEUdl22IJzQO
         nxR6b+E1GUxgEM75eUSihWB71ahNsj2MoBWXaGpSuBwd3pKzoYlBjfw2wDLbiv1od1sx
         EH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DuOa7ZEsTI7Y364o/TcoZAKGbJr0jvsbyAw2/nr+qg4=;
        b=jQ6OMpN/ft3Y1EqxuR1OrsydsmlRx822aYp5afQiYNgaw9T+kFeQ+4jpkvB2X7adc+
         gSf4/zwLdxL0lero9uxgFLdU1ypfu6V4CnzXqOjcDfiQtAnueDQgmtlXwLXgyoR7/3WP
         iLUrwj2cQNb8Pe5s5dB1+uZV/l5RbWNLyHQahmZa0wM0IYJXpjUQJUL3DlPhHKK/KWLx
         45CCsqXsqJSC/bZcXZvx48C5DSMUd2aNk/NJr55vNI3ZGgBxsVqKWw/Q+NvFxD/QCVEr
         fJrRsE5+RWOKnTE0lrgJ8pQgRiy4+Ivj/LX6XrY5pacL40pCpHaPAHmKZ/xGNHVb0fVa
         vvCQ==
X-Gm-Message-State: AOAM530iaVKdOVjPW5mi3EafPvaFPl1mSWiu00DI8PoBlR+mcLD1TEAi
        +1jJjBSgyHiu/KO0L76MfDYnvjD/ejCo7+KVeuwiBA==
X-Google-Smtp-Source: ABdhPJysPwilf2kikwvGM0DJZGRBUU1uB0ZoL1FxDo8lL9H8tTMY2kUdkuafIucUFMixu3h8XhKrySdwI7H+CziTb0w=
X-Received: by 2002:a17:906:3146:: with SMTP id e6mr6787392eje.363.1611758512900;
 Wed, 27 Jan 2021 06:41:52 -0800 (PST)
MIME-Version: 1.0
References: <20210122185543.16554-1-digetx@gmail.com>
In-Reply-To: <20210122185543.16554-1-digetx@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 Jan 2021 15:41:42 +0100
Message-ID: <CAMpxmJW1V84a6JJ_nOcNOrPQD6q1BgYr=znZoWtzdoBvTyH3cA@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] Support building gpio-tegra driver as loadable module
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 22, 2021 at 7:59 PM Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Hi,
>
> This small series adds modularization support to the gpio-tegra driver,
> i.e. driver now could be built as a loadable kernel module.
>
> Dmitry Osipenko (3):
>   gpio: tegra: Use debugfs_create_devm_seqfile()
>   gpio: tegra: Clean up whitespaces in tegra_gpio_driver
>   gpio: tegra: Support building driver as a loadable module
>
>  drivers/gpio/Kconfig      |  2 +-
>  drivers/gpio/gpio-tegra.c | 31 ++++++++++++++++---------------
>  2 files changed, 17 insertions(+), 16 deletions(-)
>
> --
> 2.29.2
>

Series applied, thanks!

Bartosz
