Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01252B6609
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Nov 2020 15:01:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731245AbgKQOA2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Nov 2020 09:00:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730114AbgKQOA1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 09:00:27 -0500
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0EF3C0613CF
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 06:00:27 -0800 (PST)
Received: by mail-il1-x144.google.com with SMTP id l12so18656871ilo.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 06:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3nFNDLVLoHTas1KT6t0+LqZeSm003JAtDw/BnaCURTs=;
        b=zbR5V+Gr20CJq+1APgHjmwmiPbddXdn+0ynTFVpXKzECoKBdcGSRAXXlQZzQCWivF3
         6eCXvz6D4KjY8alMQn66F9udDo7aK5hgblvZN63hNeDrwFxeVB337f7K3xpaAHYAzefx
         mtMW5iG/6+DJ8QfnofCsk4gkK6VN0dYmRnHUW58xtbHqMxy11yLrsq0rZxjrDp6V0ISW
         IaQm8OSV5tD5sn3VWmySnw2M/Z2AYkVglt12ZNqQh7omCK7oWAw2cUNq0CbOZuig5A8t
         85sWTMOiIJdK/grC17Bzd4RA4KT9o8QfFWIV47DOze46eB/ODz/Sw+X9sRzqKW/BWhRN
         V1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3nFNDLVLoHTas1KT6t0+LqZeSm003JAtDw/BnaCURTs=;
        b=dSpCyfs4GgoReO+7JYKdCUs012EVrsIRrBhm6lTfDObMCaFLV9OCMtQS/14jGkKKSZ
         QsI82WrjC4BZ6REY3xFpKNU1CTLdlK/GThphAM8bcEXKvhlUSpZ3OEapjIw7wH9V2Z2+
         PCnA7HADPNyBfsop13Uk850COpzrdxxxH8g0obGtWpw7nWbaScnG4PdmiVLnVLaPxCkv
         3ipDwz+zhxZIffVDUsfj3EarvkAlXujSB63pLbrhajkUcG/odg6ilaH96jQUBns2fFGc
         IhPqBgqdBMch1XCSUKDEKMNVq5jZsCNmgb1bO2cQduSeehTgfycLR3acTYASLC+IBX27
         tFUA==
X-Gm-Message-State: AOAM532sDRvh6841KeE5cEOo9EL8eX6eXjtqcMMtZ8oTNTS+vA2aZnNl
        HiKk7a8h33aPcUymoZaW8O6+geNlfbgL9oeXXFtZMOU0BCw=
X-Google-Smtp-Source: ABdhPJzvUHO+DMI+2qX8l8HB7KM4G1WEDgSycrjpItG/WOnxDyUZKJsC3kRDa1fVmfIX+/A+ZWoDd1LqSsMw1s/Laos=
X-Received: by 2002:a92:c112:: with SMTP id p18mr5114263ile.220.1605621626998;
 Tue, 17 Nov 2020 06:00:26 -0800 (PST)
MIME-Version: 1.0
References: <20201112110642.14903-1-brgl@bgdev.pl>
In-Reply-To: <20201112110642.14903-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 17 Nov 2020 15:00:16 +0100
Message-ID: <CAMRc=McTPODnPEBezSJcHhS9ErWbnuHNnBR1NwyBD83td9q3pA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 0/2] treewide: remove ctxless API
To:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 12, 2020 at 12:06 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> As I mentioned in another thread: the context-less API seems to be unused
> outside the gpio-tools. There's no reason to keep it in v2 then. Let's
> remove it and convert gpio-tools to regular API.
>
> The tools are converted in a rather quick and dirty way because I don't want
> to spend a lot of time on something that'll be modified soon once we convert
> the library to using uAPI v2.
>
> All tests still pass.
>
> Bartosz Golaszewski (2):
>   core: provide gpiod_line_bulk_clear()
>   ctxless: drop all context-less interfaces
>
>  include/gpiod.h            | 412 +--------------------------------
>  lib/Makefile.am            |   2 +-
>  lib/core.c                 |   8 +-
>  lib/ctxless.c              | 456 -------------------------------------
>  tests/Makefile.am          |   1 -
>  tests/tests-ctxless.c      | 375 ------------------------------
>  tools/gpio-tools-test.bats |  12 +-
>  tools/gpiofind.c           |  25 +-
>  tools/gpioget.c            |  36 ++-
>  tools/gpiomon.c            | 177 +++++++-------
>  tools/gpioset.c            |  42 +++-
>  tools/tools-common.c       |   6 +-
>  12 files changed, 182 insertions(+), 1370 deletions(-)
>  delete mode 100644 lib/ctxless.c
>  delete mode 100644 tests/tests-ctxless.c
>
> --
> 2.29.1
>

If there are no objections, I intend to apply this tomorrow.

Bartosz
