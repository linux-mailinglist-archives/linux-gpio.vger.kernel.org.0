Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3473343BD0C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 00:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234474AbhJZWNk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 18:13:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240226AbhJZWNb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 18:13:31 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 775BCC061235
        for <linux-gpio@vger.kernel.org>; Tue, 26 Oct 2021 15:10:49 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id o26so1331416ljj.2
        for <linux-gpio@vger.kernel.org>; Tue, 26 Oct 2021 15:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FeJxrETo5kkHC6yy5/z3/zb2XGiSNYC+KlW60qSUBa4=;
        b=IGRo583RkjYHRXrdCbB2VtjMRMnIkzIotxUIb344Yg0+X2k+LZZ44x9PLWUupfLfXM
         aa3MfmufNZMIOtCn8Sdx5GErCS334lOiLPg1xe2O/saDViWnOiPfN9te4fJnYGSdlobZ
         bc8VUKmmke2U/XMI2xp3OP4iKKpxdAsC50gE5o2J7Q405Y0U6u11DbxbRDn33b4wZw1V
         pVpwzAtXUR8FSIeKPCX1b5dCdSQUt8eV6aAze1TLGfHbpRYWMImBTG0zXCQcY2d2Mj4h
         N8M1/sJrEiQ9QqRdk574feqFG1xLRk+DgKLBN9B/BmTVnNMA78leWGosbuID7PkPx07T
         JZFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FeJxrETo5kkHC6yy5/z3/zb2XGiSNYC+KlW60qSUBa4=;
        b=NXQPKGpbj4rc3g57DUxHtScfxeIX8gAXA+HQk5hW79rrRjawYeriWKNiJxb2q03V4b
         guwsPHaB/VdSRoKl34XqIHT5q4FsB0TuC5d9nqTKbFJh68xpchZzvdbWP/LMcO31VB1I
         ZHyq5CZQ+CVnsZ5aloMmFgGB3eAV5EvbbhVM3H0VG5ZB8bCMdoYIfQwugaiu4LHqIGVI
         NtY+5JbvFxpq7L+QkrvBauZotoHLhdFwqPqlIAAMKVAmUdNsoTaSYt70RXkjoRlCLg2h
         zo4K+I3v4f35BQFJdCdEcD69U/+v0CwTaD022nrS3iHaO5Zt8OhWPeMqSo4JV4/vd/YF
         HYvw==
X-Gm-Message-State: AOAM531JsovF9fgP/hZ4z3bZ2tzLIeERKU7mihWaPYKl4kenTazg/1hM
        sg9ujDf0tOCGCQcD1HY417V9PAwVoomBSDtIIM6oHg==
X-Google-Smtp-Source: ABdhPJzMiEfUftf3AQCYeJTd8EgA3PuLtgAofwFO1J7XgnTbj+hNXjSb/i3L0yrGwvrWcwZe6l9j1qocEPmvn5WPDNY=
X-Received: by 2002:a05:651c:111:: with SMTP id a17mr28176160ljb.145.1635286247771;
 Tue, 26 Oct 2021 15:10:47 -0700 (PDT)
MIME-Version: 1.0
References: <20211026171313.50-1-mario.limonciello@amd.com>
In-Reply-To: <20211026171313.50-1-mario.limonciello@amd.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Oct 2021 00:10:36 +0200
Message-ID: <CACRpkdYAv5w5AfKPQgCqXgKSYnS7wvCkE3qTj_Q9hyvOS=xsvQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] ACPI: Add stubs for wakeup handler functions
To:     Mario Limonciello <mario.limonciello@amd.com>
Cc:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Nehal Shah <Nehal-bakulchandra.Shah@amd.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 26, 2021 at 7:13 PM Mario Limonciello
<mario.limonciello@amd.com> wrote:

> The commit ddfd9dcf270c ("ACPI: PM: Add acpi_[un]register_wakeup_handler()")
> added new functions for drivers to use during the s2idle wakeup path, but
> didn't add stubs for when CONFIG_ACPI wasn't set.
>
> Add those stubs in for other drivers to be able to use.
>
> Fixes: ddfd9dcf270c ("ACPI: PM: Add acpi_[un]register_wakeup_handler()")
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I need an ACK from an ACPI maintainer to take this with the
other fix into the pinctrl tree.

Alternatively both can be merged into the ACPI tree.

Should these two patches be tagged for stable?

Yours,
Linus Walleij
