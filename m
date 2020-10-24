Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B876297B5A
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Oct 2020 10:01:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1756277AbgJXIBs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 24 Oct 2020 04:01:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756270AbgJXIBr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 24 Oct 2020 04:01:47 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95DA1C0613CE
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2020 01:01:46 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id v22so2205195ply.12
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2020 01:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=umwnurGhsMRM3ojOuhU+rBAXwbs377HKySMRFHpzvPg=;
        b=T8wT/t6Qcv6mXwqDvMi0WhZ1qsiRokRVSpCyEaB8/3IcLmOcHd2Ajsrsr59FOcj0LR
         ENXel99Ps+H8S9fSOTCwj60s+xkvPvctFzliUXSqyl5pXYG60H08NgWzwJTrgONU3qTW
         E+7IkGvjGTFRoVmsE2Oi1Jy1u7Gqbyjb+XD+lEeqbCpoCacReGl0tb9jHeS1ylK8JdQG
         xgvuC+cd/4F5J8O89aUsQiue9Fx30l+o2XhX8Sq64Paz+8Qs25ZTc3GNEfdWW1COk+3p
         2L64+StyTANSKegimonBp3EnE0I4D+seBC1dQ229Z6xhRbr5ndG+TzLId5675Q5Ap4D4
         pxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=umwnurGhsMRM3ojOuhU+rBAXwbs377HKySMRFHpzvPg=;
        b=obC/5t//hgbdia8nAWG3/W0nsEB01PGqRodCV7B6LcL6EPE6xAYrvuva0vyIL/JsPj
         5GY+CY5uy4TkYQWhfAqtEbAV8LTizdwnl9TI+0XAm75vNxoUy5cokfNJO15AgUqlaOME
         LtnwJtn/eOvaqyflptkGAos/aZrkRfOSSktVcgbcECaYHW/rURp8utI74aJBU5/ggRWl
         5STkaad8LLig2YwL2XUsIMT4JzAsjXDz8W2vIRnEMSwRwHWLtMcPE61uiIN3Iz/ps5fV
         wbOR8UIzzryU/UVNmY9W75PcuKX8NM/cpXjLD4yTZC+cXqlSG7xOyNDrEOnjJeuBnvko
         Mc9Q==
X-Gm-Message-State: AOAM53090/h82/j5GNq9kTppMAwo8a4iupOaNSv7h8d/NhP+nhxmroNa
        jjrr4la+KtchdY7CLmrJAwM=
X-Google-Smtp-Source: ABdhPJxkZfPYQmfmxgIOT9ucD1+wFxMLUPx7zNUtMvx0OJfwR88K/30aaVgh6l2D4qo+9yx6pdmSUQ==
X-Received: by 2002:a17:90a:f994:: with SMTP id cq20mr7764720pjb.173.1603526506018;
        Sat, 24 Oct 2020 01:01:46 -0700 (PDT)
Received: from sol (106-69-179-84.dyn.iinet.net.au. [106.69.179.84])
        by smtp.gmail.com with ESMTPSA id w66sm4478594pgb.63.2020.10.24.01.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 01:01:45 -0700 (PDT)
Date:   Sat, 24 Oct 2020 16:01:39 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [libgpiod][PATCH] treewide: rework struct gpiod_line_bulk
Message-ID: <20201024080139.GA133149@sol>
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

[snip]

> @@ -74,6 +74,106 @@ struct gpiod_chip {
>  	char label[32];
>  };
>  
> +/*
> + * The structure is defined in a way that allows internal users to allocate
> + * bulk objects that hold a single line on the stack - that way we can reuse
> + * a lot of code between functions that take single lines and those that take
> + * bulks as arguments while not unnecessarily allocating memory dynamically.
> + */
> +struct gpiod_line_bulk {
> +	struct gpiod_chip *owner;
> +	unsigned int num_lines;
> +	unsigned int max_lines;
> +	struct gpiod_line *lines[1];
> +};
> +

owner is only used to check that added lines are on same chip.
Just compare with lines[0]->chip in gpiod_line_bulk_add_line()
instead?

Also, line_bulk_same_chip() is now redundant as lines can only be added
to the bulk via gpiod_line_bulk_add_line() which performs the check,
so remove it and all uses of it throughout.

[snip]
>  
> +struct gpiod_line_bulk_iter {
> +	struct gpiod_line_bulk *bulk;
> +	unsigned int num_lines;
> +	unsigned int index;
> +};
> +
>  static int dir_filter(const struct dirent *dir)
>  {
>  	return !strncmp(dir->d_name, "gpiochip", 8);
> @@ -169,3 +175,30 @@ struct gpiod_line *gpiod_line_iter_next(struct gpiod_line_iter *iter)
>  	return iter->offset < (iter->num_lines)
>  					? iter->lines[iter->offset++] : NULL;
>  }
> +
> +struct gpiod_line_bulk_iter *
> +gpiod_line_bulk_iter_new(struct gpiod_line_bulk *bulk)
> +{
> +	struct gpiod_line_bulk_iter *iter;
> +
> +	iter = malloc(sizeof(*iter));
> +	if (!iter)
> +		return NULL;
> +
> +	iter->bulk = bulk;
> +	iter->index = 0;
> +	iter->num_lines = gpiod_line_bulk_num_lines(bulk);
> +
> +	return iter;
> +}
> +
> +void gpiod_line_bulk_iter_free(struct gpiod_line_bulk_iter *iter)
> +{
> +	free(iter);
> +}
> +
> +struct gpiod_line *gpiod_line_bulk_iter_next(struct gpiod_line_bulk_iter *iter)
> +{
> +	return iter->index < iter->num_lines ?
> +		gpiod_line_bulk_get_line(iter->bulk, iter->index++) : NULL;
> +}

I question the value of the struct gpiod_line_bulk_iter, and also
struct gpiod_line_iter.
They seem worse than the user performing a for-loop over the
bulk indicies or chip offsets and getting each line themselves. They
add a malloc overhead, in the case of gpiod_line_iter both a malloc and
a calloc, as well as the corresponding frees.

What benefit do they provide?

Similarly gpiod_line_bulk_foreach_line().

And I'm not sure about the utility of the struct gpiod_chip_iter either
as it bails if opening any of the chips fails.  There a several reasons
that could occur, e.g. permissions or unplugging, so you might want to
leave it to the user to decide what to do.

So I would prefer an iter that provides prospective chip names, or just
a scandir() wrapper that returns an array of names.

Wrt rethinking the libgpiod API for v2, I'd like to either reduce the
API to a minimal function set, for example stripping out the iters, or
at least identify the minimal set that everything else is built on, and
then look at how to rework those to expose the uAPI v2 features.
e.g. given lines in a bulk now have to all be on the same chip, and given
uAPI v2 supports per-line configs even within a bulk, the whole line and
bulk lifecycle, as well as their relationship the chip and the line
request, can be rethought.

I'd also like to see ALL libgpiod types become opaque.

But that is getting way outside the scope of this patch...

Cheers,
Kent.
