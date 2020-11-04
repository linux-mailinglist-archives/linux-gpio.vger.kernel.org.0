Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24C9D2A67FF
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Nov 2020 16:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730391AbgKDPqN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 4 Nov 2020 10:46:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730274AbgKDPqM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 4 Nov 2020 10:46:12 -0500
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7743C0613D3
        for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2020 07:46:10 -0800 (PST)
Received: by mail-ej1-x642.google.com with SMTP id w13so16930916eju.13
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2020 07:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kzlhjy9+1/W2BKXD9t1yEFeJPYmFHN+P4Yhf8isZx80=;
        b=lZ5sbCk2GpazAMHXPquExXG1DKOw4TAipwANB3eeD+w3nClBe6RvISDpU8AtzFeUv0
         xtjmPs0h1PO9sR+bHae8GLArDNtH3r3+iiIAunMbYEIPjk4fbQoMrNAObizL+0F5tB1+
         VWoliD0hYuQFya1XWzsfE3eNypMtrEy/23Mj6GU5trsbp4c0IhlsV0Z903FPqt831yNS
         x5TwJ58O9baA/mC12BDWizQn4LqphWpim8n32ia6f+pUXybis1JvlCEO8gO6sJ0EBPnT
         id9onFzVLbzdnS3NLxMz4Dtdd5A+Qh9ZERffUytkpAtjgkVI4tsK+FIJZAeJfyVhDpR6
         iEfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kzlhjy9+1/W2BKXD9t1yEFeJPYmFHN+P4Yhf8isZx80=;
        b=UMQuJuz1M2qIa3JrEC+qWIkCUdiil0GqeiwMVFqyoWgPvmSe9nTiymS7MVcdjTZPvs
         nEG/ld6n8A6SlGX/8zukjUJdhugaJEa8eLSkLDSuShdcEC1xIBR4RsEFcN6KWejR0rdF
         R5ijbXZG3HaT+H/hkz5PvSyXkquewK8j4XCASeMHoJ4j5WkJQud8PJtpZ9yrmCakFMOr
         UUcDoehddKN/k+rfGHYSdZU7KVauR82HLMIOXorHObFuZPdlQuPYKA9qD6PPVU0jl5rd
         S35bxgda5/kXXxSkxr+VVsylSzGawzfS8c5by0aRUxLvO9rul9LaPnl2dCkLLpW2XWl2
         6BVw==
X-Gm-Message-State: AOAM532VUpfja9LJFBATc3aYFClSr+3+R4A6naE5Oe6sB/D/YZFcu4c6
        6rM8Kn3jeAf0fMV047iUnLPG13Gs5VMhZ7FEeqd9Ww==
X-Google-Smtp-Source: ABdhPJz41Qb0aJmzK3EfOYAmJRv7W8o9Hfup/0NsgKX8yVnRA4CcfNtGCvBEXznhyrXyfAaWumWuVHZDTvwRd0vGIRA=
X-Received: by 2002:a17:906:1c84:: with SMTP id g4mr12387389ejh.155.1604504769493;
 Wed, 04 Nov 2020 07:46:09 -0800 (PST)
MIME-Version: 1.0
References: <20201030142312.26754-1-brgl@bgdev.pl>
In-Reply-To: <20201030142312.26754-1-brgl@bgdev.pl>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 4 Nov 2020 16:45:58 +0100
Message-ID: <CAMpxmJUQ5=wwJS=jZ+p1CkptZoiQKPA8hCFVU9QNZWZTZMjhsA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v3] treewide: rework struct gpiod_line_bulk
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 30, 2020 at 3:23 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
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
> function for each line.
>
> Since bulk operations can now fail, a bunch of test-cases has been added
> to cover the relevant code.
>
> While at it: using the word offset both when referring to line's HW
> offset in a chip as well as the offset in a bulk leads to confusion.
> This patch renames the bulk offset to index.
>
> Some additional improvements to the patch by:
>   Kent Gibson <warthog618@gmail.com>
>
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
> v1 -> v2:
> - make offset -> index in all bulk-related interfaces and docs
> - drop the owner chip reference from struct gpiod_line_bulk and reuse the
>   owner of the first line
> - drop bulk_same_chip helper
>
> v2 -> v3:
> - drop bulk iterators in favor of looping over bulk indices
>

Applied this patch. We can add some tweaks later.

Bartosz
