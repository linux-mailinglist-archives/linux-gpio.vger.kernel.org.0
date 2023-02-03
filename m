Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84B526898C3
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Feb 2023 13:31:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232983AbjBCMbK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Feb 2023 07:31:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbjBCMbK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Feb 2023 07:31:10 -0500
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 289976A328
        for <linux-gpio@vger.kernel.org>; Fri,  3 Feb 2023 04:31:02 -0800 (PST)
Received: by mail-yb1-xb2b.google.com with SMTP id m199so6049209ybm.4
        for <linux-gpio@vger.kernel.org>; Fri, 03 Feb 2023 04:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=14d/B1Rqzz2oLuHqM4koPw8ZC2CkNJOdcNbKoOP7hLE=;
        b=ymMk9LvTIcAN8pt6Pf8DMHjr6p2CrjoqrhFS8f+eLjM/xFFSy9iMy+nz2crRzxtREd
         vLmBX16ByUD4JnXTuavEr9eNb0YVvlrxWGrimBsLtWWmZeEGXpdMcq2+J98SnqTrNEsM
         Qmb0EaCvci1Mn5GDn7M3G9XfPQ/UXk/DpHF1dRGC19erYQAt+v/i3bpo8D4v2jisa9cg
         UjSA3gfNHcN6TSO6Y+nPUL4TYz7ADa7jt3CWNIzH4IqqUnjyxSNnOnes9QH3HHsZRoHQ
         Fsakj9Fick/iIt8zxrUSZj2x7K+w9QMabXc1nqSSW16t7yNvs+ys5M7u9fluRoOULyoI
         B4og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14d/B1Rqzz2oLuHqM4koPw8ZC2CkNJOdcNbKoOP7hLE=;
        b=WvhvnakCgFCLNhohWecxZo4bdgHW33qVQHF6p+u+yyk95ZVrz/aE4Nk7PAMxr72CRX
         064X2I9fF182/i/2eJ4gYvfXmfLrKH6utlnG9QEhQeOo4SQ0giEYRV6bsCPhS951WP8R
         RGhJB32naSt1LnrLnJAbTBCJG5lh8336dR9fZEes4wjxi6/eFftBW/sblSakGnvhwTyU
         v9SAtSCFz/hZEgVb80cPtEuTZUyoZibhV4r1rFv4uwg1A7+Rl1q9wXe1cU4dcbk7G20o
         uDV2YPw9F9032ncqYbozetZiyY2OWwHBtxzXXKHkPRypax5rhvkEjqzN50UbXCjNYeaG
         unRw==
X-Gm-Message-State: AO0yUKUqxLX1Hs9YaEV7pWer/oXxNSD8lYZq4PcuI6g9oeHjRM0kBrh7
        nhG7x6mBrBAtj2agnEt2Rnc8A0vo62bEOnY7rOUIpA==
X-Google-Smtp-Source: AK7set/hhsME76JH8m6YOp95fwVU74bnNv54KioapekZBSWPNb2Cd02fauvTWkDjiKVBaSwimLob5q0HaGDGvftpjhk=
X-Received: by 2002:a25:fe0a:0:b0:7ca:9b40:72a7 with SMTP id
 k10-20020a25fe0a000000b007ca9b4072a7mr834188ybe.130.1675427461386; Fri, 03
 Feb 2023 04:31:01 -0800 (PST)
MIME-Version: 1.0
References: <7b736829-414a-ba4f-59f5-bc78c27621e5@eilabs.com> <Y9vS1dsuMm5XxkdD@smile.fi.intel.com>
In-Reply-To: <Y9vS1dsuMm5XxkdD@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 3 Feb 2023 13:30:49 +0100
Message-ID: <CACRpkda6kuDvgv8we-BQJFmd0hGekuYC6MSmaB2Z1q=PuoLJvw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/3] gpio: pca953x: Redesign handling of chip types
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     =?UTF-8?B?TGV2ZW50ZSBSw6l2w6lzeg==?= <levente.revesz@eilabs.com>,
        Martyn Welch <martyn.welch@collabora.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Haibo Chen <haibo.chen@nxp.com>, Puyou Lu <puyou.lu@gmail.com>,
        Justin Chen <justinpopo6@gmail.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Nate Drude <nate.d@variscite.com>, linux-gpio@vger.kernel.org,
        Peter Robinson <pbrobinson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 2, 2023 at 4:12 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Now as I'm thinking more of your nice job, it may be less effort to everybody
> if you start from moving the driver to be a real pin control driver united with
> GPIO handling.

Agreed, the more complex these expanders get the closer they move to becoming
pin controllers with GPIO.

drivers/pinctrl/pinctrl-sx150x.c
drivers/pinctrl/pinctrl-mcp23s08.c
drivers/pinctrl/pinctrl-stmfx.c

Come to mind especially.

So if it makes more sense - go for it!

Yours,
Linus Walleij
