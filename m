Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AF86296D97
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Oct 2020 13:24:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S462918AbgJWLYy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Oct 2020 07:24:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S462889AbgJWLYy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Oct 2020 07:24:54 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FDA0C0613CE
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 04:24:54 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id 10so951447pfp.5
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2020 04:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4CfbKXSpkf33ahFieeb7xFLHifvfyxKAo0F++ekf82Y=;
        b=t1GzgomlsVQxTrCd3jWaVnjhdm+8nQDRS2M7S0ziu02gVhf/FZgNwRBvxrnM/5oxEz
         yWl1vlhJVtfSH3ux2m8+ORSnGDprCcNrx59trEKLiUq9X9GoF2mvTaGr8qWDWGgE85bB
         dDIye2lmSuWAWkhpcXZUAn7OOFCMncYVth+Z/pNfKDvkBpNEL0UN4q7TwSR2tDOEBuCc
         doYrMTlO+lsF0cT7ym70n6tuj3b5vbZzoFTATgW2Sx64xGvpazEkuFTtkl+vb+WJ0bXR
         PqCBwz823zMZ8oLrdqzNCJF7lZljF0s62G2HzKwy3OrTLaKVn7A+YAqHwhkEwBx5i6dk
         2nwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4CfbKXSpkf33ahFieeb7xFLHifvfyxKAo0F++ekf82Y=;
        b=eLharupkvQ0PcpXpxXQ2s15h8Q8ZI8upz90Ci47Gkl1H9ncPu0y0XV3LiKnT5T3a8m
         t+a0oNOjljZdp78h09pQKSbmSAnMR5e2WXWW9FTxChoXFJXfDSqp9tdvspylgCkIf6O2
         zXy7TPWUfyX33mAmGxDRWml6uG1GrgavSgIWA2TfVLu84Q0fSnkylBfT+42KtmfkRbzW
         GPZNFr6A88iQ1rDqiRE+HHPLGkqo/F42B8QZIa5RjJC0ZL4Yz8SBfd0d1COl5LbrdOhp
         fpL7Pb0zusZJeAlWYCs823b/KPcJv/cRNXH+NnsT+wg/nLkAUOU8Vchi3UZKtMyFIla6
         DZvQ==
X-Gm-Message-State: AOAM533VD3KJD+F4/ZncqNAzWg2IiZkujZdrwj5Ok+aWTEM0A8fiOAjf
        RWYq183vO1t2OV0Oa8EOlgY=
X-Google-Smtp-Source: ABdhPJyYJP3El53a6TxEaxinISRlXv/L+eq5C2pDkzx8ruPSoRpeoZ2n/49GSb+rbd7Wo/yyalpPJA==
X-Received: by 2002:a17:90a:5141:: with SMTP id k1mr1961921pjm.187.1603452293819;
        Fri, 23 Oct 2020 04:24:53 -0700 (PDT)
Received: from sol (106-69-190-250.dyn.iinet.net.au. [106.69.190.250])
        by smtp.gmail.com with ESMTPSA id z10sm2070877pjz.49.2020.10.23.04.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 04:24:52 -0700 (PDT)
Date:   Fri, 23 Oct 2020 19:24:47 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
Message-ID: <20201023112447.GA24669@sol>
References: <20201023092831.5842-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201023092831.5842-1-brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 23, 2020 at 11:28:31AM +0200, Bartosz Golaszewski wrote:
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
> 
> Since bulk operations can now fail, a bunch of test-cases has been added
> to cover the relevant code.
> 
> While at it: using the word offset both when referring to line's HW
> offset in a chip as well as the offset in a bulk leads to confusion.
> This patch renames the bulk offset to index.
> 
> Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> ---
>  bindings/cxx/gpiod.hpp        |  18 ++-
>  bindings/cxx/line_bulk.cpp    | 112 +++++++++--------
>  bindings/python/gpiodmodule.c | 182 +++++++++++++++++++--------
>  include/gpiod.h               | 169 +++++++++++++------------
>  lib/core.c                    | 178 +++++++++++++++++++--------
>  lib/ctxless.c                 |  53 +++++---
>  lib/helpers.c                 |  61 +++++----
>  lib/iter.c                    |  33 +++++
>  tests/Makefile.am             |   1 +
>  tests/gpiod-test.h            |   5 +
>  tests/tests-bulk.c            | 158 ++++++++++++++++++++++++
>  tests/tests-chip.c            |  59 +++++----
>  tests/tests-event.c           |  73 +++++++----
>  tests/tests-iter.c            |  26 ++++
>  tests/tests-line.c            | 225 +++++++++++++---------------------
>  15 files changed, 888 insertions(+), 465 deletions(-)
>  create mode 100644 tests/tests-bulk.c
> 
> diff --git a/bindings/cxx/gpiod.hpp b/bindings/cxx/gpiod.hpp
> index 8dfc172..83f543f 100644
> --- a/bindings/cxx/gpiod.hpp
> +++ b/bindings/cxx/gpiod.hpp
> @@ -626,18 +626,18 @@ public:
>  
>  	/**
>  	 * @brief Get the line at given offset.
> -	 * @param offset Offset of the line to get.
> +	 * @param index Offset of the line to get.
>  	 * @return Reference to the line object.
>  	 */

The comment still says "Offset" and so is still confusing.
Change it to something like: "Index of the line within the bulk"?

And document what happens if index >= size()?

Similarly elsewhere.

That is just the one thing that got my attention - I'll try to
find time to go over the whole patch in the next few days.

Cheers,
Kent.

