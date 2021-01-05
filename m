Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 425412EAE1A
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jan 2021 16:20:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726718AbhAEPQg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jan 2021 10:16:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727815AbhAEPQc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jan 2021 10:16:32 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD11AC061798
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jan 2021 07:15:51 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id o13so73413319lfr.3
        for <linux-gpio@vger.kernel.org>; Tue, 05 Jan 2021 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nipFXfidN4RGtXoyeMnYQAg6eHYZV+kT94xqPBVgEN0=;
        b=xnp2n1s9/EDnCP8h2gyp1OrnOFCclXF0pAG1maHJOGB6nzlHfeTpHZsXK089hu3l4M
         EZol3yzmQHMVReOEgUTIhZ+3JyLlb76itZdYkk91nDSApI4NJ7Nn6eRzuLtPH7TKWW/p
         hOC4h4/wnNMqX2tLlvwXi4yG4NOToANEP5DsWsUH7hX4gqIAUjnD2hFCzpCsO3Mz22Wl
         Uj10V2bqKTc+oIxz5dchsA0RDbl4oKzQ21Kj5sfIFMKwsN+xGGAZEWD0ugwOy8JEHd0y
         onNCNeDSluZ21Lr2U/7SdMZM0iHjllTDV72nnzTf5+ecUyUAb2mogxULSY3219ATL8uu
         N6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nipFXfidN4RGtXoyeMnYQAg6eHYZV+kT94xqPBVgEN0=;
        b=lUgR2hfe65mbRuahxjIUK6ofme2qO+zfxQ+86VkqEH7Rn6rqEJH9GM1g2ETWVZWAuZ
         Zpao2Aw/NNd8qiS6WhvjOU9FYiSUanvpJd0K2MxWp61ZpomPGlfmpaJV6zLhTL1K5Bhs
         qcYRcMOqNkM5fH4n1yIXIrf5AelTnFNL3gkATkDOsD0BMz/efa4j3zLxMPCrq57IVxLU
         3ffwFhtmV5jdumEV7DuWFe+sLKNfEJdvdoNjnmzuH/Lv3KWl2RGEs9TRu5NiSkDTvSUy
         yxtl9HLApnWcUPR8UBKj7vx0WzpNZ0iYqkAwRwQBheLGc/DmQKirkb8ooBv1gHJJjtIM
         7J4A==
X-Gm-Message-State: AOAM530G9zN2N/asfJcLg/KrKZPCRVla3q3KLDvgtpTbeG9185b6DQmh
        HC3/rrwpcSaFY0L9yM35oOCgKABKqnGt8YdIgXLdtA==
X-Google-Smtp-Source: ABdhPJy2ZGq9W2iVSjZbDZLyFO5NfyYMbkL3r9nIDYZhr3gaACstIDbNeGqw3SNzTuSJ6iuv37ViXqi/KfvpLZq23Uw=
X-Received: by 2002:a2e:3503:: with SMTP id z3mr63883ljz.74.1609859750250;
 Tue, 05 Jan 2021 07:15:50 -0800 (PST)
MIME-Version: 1.0
References: <20201229204710.1129033-1-natechancellor@gmail.com>
In-Reply-To: <20201229204710.1129033-1-natechancellor@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 5 Jan 2021 16:15:39 +0100
Message-ID: <CACRpkdbYC5Q7NfVLVBjW79AJPaWx0iQ2_XeU2A7ur73qqpZXsw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: Remove unused variable in nmk_gpio_dbg_show_one
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Dec 29, 2020 at 9:47 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> drivers/pinctrl/nomadik/pinctrl-nomadik.c:952:8: warning: unused
> variable 'wake' [-Wunused-variable]
>                 bool wake;
>                      ^
> 1 warning generated.
>
> There were two wake declarations added to nmk_gpio_dbg_show_one when
> converting it to use irq_has_action but only one is used within its
> scope. Remove the unused one so there is no more warning.
>
> Fixes: f3925032d7fd ("pinctrl: nomadik: Use irq_has_action()")
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Patch applied.

Yours,
Linus Walleij
