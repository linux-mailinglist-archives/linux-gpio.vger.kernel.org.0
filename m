Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA93C3A4B79
	for <lists+linux-gpio@lfdr.de>; Sat, 12 Jun 2021 01:57:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbhFKX71 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Jun 2021 19:59:27 -0400
Received: from mail-lf1-f48.google.com ([209.85.167.48]:38847 "EHLO
        mail-lf1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229548AbhFKX71 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Jun 2021 19:59:27 -0400
Received: by mail-lf1-f48.google.com with SMTP id r5so10991262lfr.5
        for <linux-gpio@vger.kernel.org>; Fri, 11 Jun 2021 16:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8LYdLrXUsPHtUrAexLnjIyiWMIxp9P6puixkz4YwLNQ=;
        b=Mc7V6Z0SCiZSZ33LHbluTp2nfmH59FhCAKlWPz+ZEVq/CpR8GJWkhrkJyP6ZLJkPwJ
         fBFLnMw6ZA7JjSW1+ssgb0QmK1fLRnwUkksVWpcmH1T2qJxoXRfVQIuFBvdTlZ8wuX8L
         oGiNR4Vo1euQjpT051n6CFxt6NLSqZGanX/baDNPpPtxbpSeeh1DFBZOOklXYJAOO/7X
         EobZLrw79hWnJSybJjst+BIHSFM0rUjAsGWt+UvdJMRM0FTIbxEM0CLUaJkVm318RfaY
         sVv/o3Mm1WSDz4PfvUDdaDBtPm0MFlqWMjLZR6FH1icW+vW+7seju3r35kyq+EH6Ro2O
         H23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8LYdLrXUsPHtUrAexLnjIyiWMIxp9P6puixkz4YwLNQ=;
        b=lF4MvGc3iw0COdyj4gqa2ZCmXXdNWP5OPA79PPUNKo1zFqwocaiaPX1SmZ0yBXa5DT
         x71HZ5Nn134zSM1mkEAv5Ltm6OcMypEuqhpDof1eax2++ogtKP5RtfRTWGRKACFKDqF/
         EBWPVsH4J1GlgPbYjvhdc+/Tfzj+eh6Scb8vf2geJHnbpN7Hn+TaKe59rF2M5Yq5NdQQ
         6uquTz3fKO/8PY1K1oNnhRrajsOmLOi8qW5zQMmFipkNOkVNXoXtTuE+S4dJinpynJ63
         6eoJvqg5k1/iz4NENBVM3e+cdF17TpmOYtnMSOyN8T/2MOslXPSRQ3r8CTyMBgJliWV9
         J1Eg==
X-Gm-Message-State: AOAM530p4qg7ZajpPehToiIwIESnooFD/Co9bO9zFEyeQXVUwGelLmgM
        a06hWtooPJI+ACcwtZCqcALux2D3OxCKac5yQgJStw==
X-Google-Smtp-Source: ABdhPJxL8izxhEjGJNohMCBmzZw1SvYwftJh3uEeAj2N8KF56Kn7ZOOvLKiwKV2qQ0NkWP1NZkeK0o5DZTXZQzA35tY=
X-Received: by 2002:a05:6512:2105:: with SMTP id q5mr3965064lfr.649.1623455787716;
 Fri, 11 Jun 2021 16:56:27 -0700 (PDT)
MIME-Version: 1.0
References: <YMHjoagGxEfVBW1t@mwanda>
In-Reply-To: <YMHjoagGxEfVBW1t@mwanda>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sat, 12 Jun 2021 01:56:16 +0200
Message-ID: <CACRpkdb=1TmDVvds2WmG+ZyqEL+3cHd9whg=GeQ6cJstgKug+A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: missing unlock in mcp23s08_irq()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Radim Pavlik <radim.pavlik@tbs-biometrics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 10, 2021 at 12:04 PM Dan Carpenter <dan.carpenter@oracle.com> wrote:

> This code needs to drop the lock before returning.
>
> Fixes: 897120d41e7a ("pinctrl: mcp23s08: fix race condition in irq handler")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Zhou Wei already sent an identical patch but thanks anyway!

Yours,
Linus Walleij
