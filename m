Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 526373AB614
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 16:36:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232909AbhFQOif (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 10:38:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230028AbhFQOif (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Jun 2021 10:38:35 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7207C061574
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 07:36:27 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t3so4329542edc.7
        for <linux-gpio@vger.kernel.org>; Thu, 17 Jun 2021 07:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x3Omp+uAzmiY19Ehy5DELKA4o//eS6NE3U4qZdYmIBo=;
        b=hODCj/T3P1W8V/HsxTIdk71dPSQ65X21QybM9xkmjD9c4r2mq6aGCYRMOMSqE4U3PX
         4OmA/+a5edYgr/v0FAZewF3bkdqzAU4u7M68rARHY+cdLAxM0Z4AIKU+ekiKnJARvQ7i
         LXkoUcLX7FV7WQ3wxWYy581pw8QIUGoRyUn45pntJYv2Qkr6+tqrXwLgM/G3mt/6gvYz
         qt5j1WOdYo5U9A7ymGFto9fPNyvJtZk9JYU56miO4PkVkG3/UF9a+C4mmehmv26vdBP4
         U5aeKvtYI/ggniaoy80fGhIXRgNQEU8r/q38oh1fx4i24hkxZOHGv86TVDULQYeNF/9S
         g0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x3Omp+uAzmiY19Ehy5DELKA4o//eS6NE3U4qZdYmIBo=;
        b=MhG9HHMs0tHLiJ91xyWE06yz5UfPe5/fCTHpV6iRFIsJiBu2KP/3Cr7n4AsZAyJdnf
         xHoYLPWaC7RDiD1Qng1j6dC82arm6a3CyZV0QPWEb1imVDPdfP3M0vFXNPFAu/hboWzT
         s6CoMtSa5gKlL0hr+7sYAC9BQgxZ5v9KB0TWnliXFpHMywh7J3SEZMXZ04mjzpjtWrhd
         7Knjsw5cXm9Ukcr2I/UyQ++GjLMGWxIzWnOP1CzTbiI0NMcBCakqxfP8ymarVuAyusRR
         2juCX9wVeTUzLBG+RS+Qm/h7VKo5AqSenI54D+PBDVJ1oWSdGehWWhz0w/zR9aghH1GG
         XQLw==
X-Gm-Message-State: AOAM531Rbpn94MVMso0QIm1ml0I3ctys1w7//OyAYaGApXi+kpLUvJJ0
        OmFcpGppICk2bCCK35q1kyI76j6M/XY3zVPmDDZRNA==
X-Google-Smtp-Source: ABdhPJyZnFMiQIZ9fwFzpEk1mE8MftS/MaQdnl4xTCoY519E1pBV/j1OP3/x87B8xx30SZgQ9cUzZzDw/1yVBUX0b9k=
X-Received: by 2002:a05:6402:cb1:: with SMTP id cn17mr7018107edb.42.1623940586437;
 Thu, 17 Jun 2021 07:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <1623938053-790-1-git-send-email-loic.poulain@linaro.org>
In-Reply-To: <1623938053-790-1-git-send-email-loic.poulain@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 17 Jun 2021 16:36:15 +0200
Message-ID: <CACRpkda=6-VkRtrBzxkzWYzcRWEYEcYUy15ALuRv6GFb=oCyZg@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxc: Fix disabled interrupt wake-up support
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        michal.koziel@emlogic.no
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 17, 2021 at 3:44 PM Loic Poulain <loic.poulain@linaro.org> wrote:

> A disabled/masked interrupt marked as wakeup source must be re-enable
> and unmasked in order to be able to wake-up the host. That can be done
> by flaging the irqchip with IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND.
>
> Note: It 'sometimes' works without that change, but only thanks to the
> lazy generic interrupt disabling (keeping interrupt unmasked).
>
> Reported-by: Michal Koziel <michal.koziel@emlogic.no>
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

Looks correct:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
