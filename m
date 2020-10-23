Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 16FAB296CC2
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 12:24:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462154AbgJWKYT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 06:24:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S462101AbgJWKYS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 06:24:18 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80276C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 03:24:17 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t22so599694plr.9
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 03:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=et7Mr3rQpNoSOhJjiDwpKU8z7Atz2+EiyD368vHE5SU=;
        b=GRcF8WLbIQ0R/sDalIwQX3mPIa7RGd2LppQQjP+YmqCNgT0tNDj4l8mF27bhxb//r2
         J3LJ88xIHhiDx415qc2nBZiL+g1sSbNB/TFHNChuv1622pRq8u8TqN9cq+wYRefFMLSA
         990Tjq8+EGw2D6E3CIcpikQF8INDOUnMMmXz3gY3y2GNM2pJFvxN2BWOv4wP6SmFhvXM
         TguKlhQFCv2UJfuME2JAyM3FPI9IuEahDxLW3blhH9a4pIH6vfkok8Ek5R6kxpAc5PXd
         MqP/GhAtuVIyiCzrnvChZm5ml7UV1nDyt7tC4wTAS8Aflcv772ozkdbonwXeg6Az4kk9
         dx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=et7Mr3rQpNoSOhJjiDwpKU8z7Atz2+EiyD368vHE5SU=;
        b=qky5zBh6qVlFE3aZ+unp2f/4vPspx1+srDh1B3dKb8IoqpWImelfBHrCgN9aJ8UJ6f
         s6azEYmCPIY4BectPj7+RcgGfiy29xZdr5TQTydFlQECBRhfqSiBM1kLeqXBiAoom9Ir
         igMAUHUUznalxhrV/6xWwg8OE2OcgZN0CCEn+HzZztcXULnlniwbCczfkMXjAH8WRaDY
         0i8nD3M6LsDrBc1kIP7Jzyv1TbzWj0hOQR9pfJt5YXhoo2618pYoANuLs2JAk0uv8X0U
         CNNypn9hf4xsmrz/ypWt6YcsIDXN+eGmXoQ1mh9AXyyH232yeaf72RVQHGggtCATCx2e
         B/Wg==
X-Gm-Message-State: AOAM530sSYCmRPRLLAkOOIO1dfKrYwRlTXRts+fR6AQgk6Fj2ojHacph
        HiO4N5trZwGP/nKvuVY3g+eomMfPciZCupSloy0=
X-Google-Smtp-Source: ABdhPJyvkgw8AYTOiBCZCetlsof9iqSMyPkv+RLUJTAeKGtXUPOHt5DetEmYzi7vKgaR1wCL0iX4dwZXKDeg29IuMD4=
X-Received: by 2002:a17:902:6bc8:b029:d6:d9d:f28c with SMTP id
 m8-20020a1709026bc8b02900d60d9df28cmr1561973plt.17.1603448656959; Fri, 23 Oct
 2020 03:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201023092831.5842-1-brgl@bgdev.pl>
In-Reply-To: <20201023092831.5842-1-brgl@bgdev.pl>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 23 Oct 2020 13:24:00 +0300
Message-ID: <CAHp75VeiGSJO5XnpQLMs=0nT=otVjC1tOsR7xp1gJ3tLHwUTaA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 12:31 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
>
> Current implementation of struct gpiod_line_bulk uses stack memory
> excessively. The structure is big: it's an array 64 pointers + 4 bytes
> size. That amounts to 260 bytes on 32-bit and 516 bytes on 64-bit
> architectures respectively. It's also used everywhere as all functions
> dealing with single lines eventually end up calling bulk counterparts.
>
> The rework addresses it by making the bulk structure opaque and
> providing appropriate interfaces for library users while retaining a way
> for internal users to allocate single line bulks on the stack.
>
> The macro-based loop has been removed. In its place we provide a function
> iterating over all lines held by a bulk and calling the provided callback
> function for each line as well as a new line bulk iterator which works
> similarily to chip and line iterators.

similarly

> Since bulk operations can now fail, a bunch of test-cases has been added
> to cover the relevant code.
>
> While at it: using the word offset both when referring to line's HW
> offset in a chip as well as the offset in a bulk leads to confusion.
> This patch renames the bulk offset to index.

...

> +struct gpiod_line_bulk {
> +       struct gpiod_chip *owner;
> +       unsigned int num_lines;
> +       unsigned int max_lines;
> +       struct gpiod_line *lines[1];

Why not '[]' as we do in the kernel?

> +};

> +#define BULK_SINGLE_LINE_INIT(line) \
> +               { gpiod_line_get_chip(line), 1, 1, { (line) } }

Hmm... Perhaps union can help here?

union {
  struct *lines[];
  struct *line;
}

num_lines == 1 exactly defines this.

-- 
With Best Regards,
Andy Shevchenko
