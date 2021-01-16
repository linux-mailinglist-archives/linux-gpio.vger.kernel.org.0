Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AADA62F8F41
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Jan 2021 21:38:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbhAPUie (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Jan 2021 15:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbhAPUia (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Jan 2021 15:38:30 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2371C061573;
        Sat, 16 Jan 2021 12:37:49 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id md11so7000825pjb.0;
        Sat, 16 Jan 2021 12:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=W4LZHeYhMSwXOoFtnoqyYzOTzcNb7/z3BzpfRHAYl4U=;
        b=AbVQZeaGTQZPOm6/Tkyv2qAiuVCtaKS3OjKaee8txBtHazejtQvqEg07Sre2J90Y++
         38sE8BzEQBGAOgPn15atmpm5v+Wa3Cdg7P6Dd4ED6EL7OTV9jgnGuvEaN2PFMYcwtal9
         OWleqneQhsVBjjI0SGjxGtwVPnD5ArbumxaGRMFWiKHyl6NKB1zwloiPET3/8meLQ3Wq
         ZOBQTY/twv/3DPC+oBFF23wmk78pTb0CceFlFGA/9InWUJnSwsHw6XrX+4dHLExGdLc9
         oGoz9A8bbTMtvVPjaLYJ4W4R7YxB9iD1pDEJVTWa+k/xJ+7Lmyu4SRXjCmHsY8YHVY9T
         1rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=W4LZHeYhMSwXOoFtnoqyYzOTzcNb7/z3BzpfRHAYl4U=;
        b=IKKpZCwk/jD5UYTABi+QtuHDiT0Wxtj3CTwhkepwvaQ+P5HO52mKrWICYGt10J/m/g
         Q3OVLKmmK3WbYFIR1Ffmvh5VBtEXkisP2VaWZto990kWTCkUZT7gP4hpBFE4Ts/YcGFA
         j/xCnNlkjIa2PAaXud4nzbs2QoKz2S4QjIZRaBj6B/UJ4wpyNEVwobsWG/NOM6LHngRI
         YclhWVpeKTauA42qp7h3h5NoqyITZ/KnaJ6MjgjexDZhVhSYlgZjZhZLJHGH84bbcA7V
         MRmxq3jLRsODR29ovv9w/ArV2Ojz01ogAvRIH+CcEAt2ptYPGbzCOOLcA7EuZbOFr81E
         248Q==
X-Gm-Message-State: AOAM533KflK1IpODB9L4GdVfdHB4PxLDOSo6sqFIIMzPZtmcNZjFbog6
        aDuxoXzEzP75UxTlhGHfgwgOu10QvPeYFD2lCVU=
X-Google-Smtp-Source: ABdhPJw1VWvqWMXY73Do1StrgoqHlDIeQAC+szJA1f9C5Ez1tHYHDs7vhlfb75VodwT7ZdxyqLfgjxtZbXkUPLFHksA=
X-Received: by 2002:a17:902:7b96:b029:de:7ae6:b8db with SMTP id
 w22-20020a1709027b96b02900de7ae6b8dbmr7534407pll.0.1610829469554; Sat, 16 Jan
 2021 12:37:49 -0800 (PST)
MIME-Version: 1.0
References: <20210116011412.3211292-1-saravanak@google.com>
In-Reply-To: <20210116011412.3211292-1-saravanak@google.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 16 Jan 2021 22:37:33 +0200
Message-ID: <CAHp75Vdrio-sdvHuqV4GrUQe3=6HaAV_ZTh3_Od974DpDty_cw@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: Bind gpio_device to a driver to enable
 fw_devlink=on by default
To:     Saravana Kannan <saravanak@google.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Marc Zyngier <maz@kernel.org>,
        Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
        Kever Yang <kever.yang@rock-chips.com>,
        Android Kernel Team <kernel-team@android.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jan 16, 2021 at 3:15 AM Saravana Kannan <saravanak@google.com> wrote:

> v1 -> v2:
> - Fixed up compilation errors that were introduced accidentally
> - Fixed a missing put_device()

See my comments as per v1 and address.

-- 
With Best Regards,
Andy Shevchenko
