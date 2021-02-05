Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 78476310942
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Feb 2021 11:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhBEKhm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Feb 2021 05:37:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231367AbhBEKff (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Feb 2021 05:35:35 -0500
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12F8C06178A
        for <linux-gpio@vger.kernel.org>; Fri,  5 Feb 2021 02:34:54 -0800 (PST)
Received: by mail-ej1-x636.google.com with SMTP id sa23so11214993ejb.0
        for <linux-gpio@vger.kernel.org>; Fri, 05 Feb 2021 02:34:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aC0hEy91gIITr9mEqagVdgJnBixTe7YH/U4CspdXVEw=;
        b=qKmZ+vAKTB8wPIsqOlZFIv/6Klp0MZaTRXPjC71aN/OlcEB5ABgRDk4FGbVc7QFAyg
         nuiPZF6+zay939LiJoKXK5hYtsB7pS54cjSPCOrg8oR5W21pV+zzree8xkFfNmFZiChs
         pPhZ93vk4uu989w+SHUVsjOpAd9ASg6phhmOhAIdRH0wxdLTGahMrcBj8lGIfwxrxM1j
         ndiWepYLtwmfuZbGXCv/8wJLBgL3JMoJlyqZFLk0OMojPpDcWRiFt14kjsArZiCk5Qh2
         GCF5B5skCbPhGl1fIk+JUcG5KAJlDbOFUelVzldygUchktpl8pn+xroVERrG1lG85Imy
         uBog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aC0hEy91gIITr9mEqagVdgJnBixTe7YH/U4CspdXVEw=;
        b=Vw4D5MvwqK1UruhoEPtUMGVqhE+JVPHH0SgGjWre6MfyGhvOblNMt/3YdH7vw46+OB
         GHgFB5nerjm+JSqhV574RAageMW5TDPnAfSfclVGPJgV/fxy4YGhoztmE2ZnuJuPYpZH
         QAynXytuxS0b5wqTwKqocsmMI6+58Uaez5t8ljzaEr/yUAz99RMfYTeaQwgr3WkuROG8
         wnKgx0enG85nTXoiF0jatfrRaMAL6nGYCA2jdO+8b4KPV1GQyt+FwXWPfwNfV/NkRLSn
         9hAazb88jFAG1JU6UDj7jyAzWPs4wjJSLyRx2cAgVC5EkC9kXRbdAROQeltvmMU5ofnD
         Q6Fg==
X-Gm-Message-State: AOAM532UFBlxbfuzvIaFdVN+ooRUEhpnYLEoq7b2NoKa0qG5CiN4mcnv
        Yqjc+GhOQbcr46wdnrRl53vqXlOCKLWgxNVTzfY5vQ==
X-Google-Smtp-Source: ABdhPJwVhiRc6hnwu6JHUAx/obykx4YGVbuzemFS3gkjteNp4MFr5mXYDvfdw3Eb6808h3IxPGgohZQe335ydgkJ/K8=
X-Received: by 2002:a17:906:9401:: with SMTP id q1mr3508045ejx.516.1612521293560;
 Fri, 05 Feb 2021 02:34:53 -0800 (PST)
MIME-Version: 1.0
References: <20210205080507.16007-1-nikita.shubin@maquefel.me>
In-Reply-To: <20210205080507.16007-1-nikita.shubin@maquefel.me>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 5 Feb 2021 11:34:42 +0100
Message-ID: <CAMpxmJVNwB5Pwj_QduBmMY76OUdjsFBFP=0o731rCGHOLYWP2w@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] gpio: ep93xx: fixes series patch
To:     Nikita Shubin <nikita.shubin@maquefel.me>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Nikita,

please include the review tags from previous series in the future.
Linus has left his Reviewed-by: under v3.

Bart

On Fri, Feb 5, 2021 at 9:05 AM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> v2:
> https://lore.kernel.org/linux-gpio/20210127104617.1173-1-nikita.shubin@maquefel.me/
>
> v3:
> https://lore.kernel.org/linux-gpio/20210128122123.25341-1-nikita.shubin@maquefel.me/
>
> v3->v4 changes
>
> [PATCH v4 1/7] gpio: ep93xx: fix BUG_ON port F usage
> As suggested Alexander and Andy, drop confusing index conversion and embed
> all necessary IRQ data into struct ep93xx_gpio_irq_chip, this keeps indexes
> consistent and simplifies access.
