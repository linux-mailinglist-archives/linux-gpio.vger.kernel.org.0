Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58BC63001E5
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 12:48:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727650AbhAVLrH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 06:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727350AbhAVLNX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 06:13:23 -0500
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 688E2C061786
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 03:12:34 -0800 (PST)
Received: by mail-ej1-x631.google.com with SMTP id w1so7061394ejf.11
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 03:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vi82Xt92CPywL10bNx8lzo073t4RpH7QS/XGZ05x98k=;
        b=fFQ+QGkkaZgToxQM2SQtC4aZIl1EkvHLJjmjwJXSfJX3Zo88ys61F8ATT71QjjwFfc
         zBMYRxduSOb9n6GgJqnYbMD3v0MBQQ1LIMBS+7uIp5ubd0rSU++BfGhctCdOmwkDIUAq
         9yAxqfeaaHE0KjAinXGyZM2PWb852e7w3i7KLxLHHwJaDcHfmCIBDvqYDF3rlSV7Uezl
         qsgiP/HP+spia9k6W90xTp9aiazseTozicWTu3crpcUL1bAqtiPrVyKmiHA98Xmgxjgv
         c5jqMpUSHugZe/sKusyNCP9T8Z0PHEjHvkkxW998Fc1JiHLnjba2KHr+qytN7z5soGXm
         GCDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vi82Xt92CPywL10bNx8lzo073t4RpH7QS/XGZ05x98k=;
        b=Ec/NVxN8PmEsuXrIAiO8oZzoohIojB7QwFYmd1Z7qdr/uerc18l8zVW29EDa3pfuht
         MDI0GZ909WF7Uo63LvGfE2uHjrQCVIQ3nt66aaa7nc+WW8MTxLMyt2/hIUxHT5qq8aCC
         rq/q0Xf68fO9L8cZiPDX+1gbRf34BhBshTOYnHC79Iy/NAVqY7E8ZAXj0B5lXzWOopcl
         7twm97rW0+IYsitOhdx0RZRYljoKjD/cZwtBnt2QlZSqcUXFDwEvt1i37UxtYUVjt77Q
         oXqFZGFUU8LcsxCHQRZgMp6o3tH9iVeQZ++dBL+7gaOdUTHNNUJIP23vQqqQlYvch7Pc
         y6fw==
X-Gm-Message-State: AOAM5326wuvolahfeVSyWW9feEscE/t9+SGffn2Uas+RHXLAd7iDG5I0
        b6CdRPr9COzAOqIq1VUTcUVP6fRt+jjQDpMaAQEXFg==
X-Google-Smtp-Source: ABdhPJyh0MlCGeVibqJRg1ncZGSkWqdQH2Wvw9qeo5oNc0oP4ovx3GH2GzjtHQO6T2WMkVU8sFebih9/UOlOxlZQjoM=
X-Received: by 2002:a17:906:6846:: with SMTP id a6mr2604101ejs.470.1611313952996;
 Fri, 22 Jan 2021 03:12:32 -0800 (PST)
MIME-Version: 1.0
References: <20210120214547.89770-1-andriy.shevchenko@linux.intel.com> <20210120214547.89770-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210120214547.89770-2-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 22 Jan 2021 12:12:22 +0100
Message-ID: <CAMpxmJXCjkP6aPPVpfrRUShigyEC25w0_RFcUX_Z9cOkrdN8fQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] lib/cmdline: Update documentation to reflect behaviour
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 20, 2021 at 10:45 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> get_options() API has some tricks to optimize that may be not so obvious
> to the caller. Update documentation to reflect current behaviour.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  lib/cmdline.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/lib/cmdline.c b/lib/cmdline.c
> index b390dd03363b..2a9ae2143e42 100644
> --- a/lib/cmdline.c
> +++ b/lib/cmdline.c
> @@ -83,7 +83,7 @@ EXPORT_SYMBOL(get_option);
>   *     get_options - Parse a string into a list of integers
>   *     @str: String to be parsed
>   *     @nints: size of integer array
> - *     @ints: integer array
> + *     @ints: integer array (must have a room for at least one element)
>   *
>   *     This function parses a string containing a comma-separated
>   *     list of integers, a hyphen-separated range of _positive_ integers,
> @@ -91,6 +91,11 @@ EXPORT_SYMBOL(get_option);
>   *     full, or when no more numbers can be retrieved from the
>   *     string.
>   *
> + *     Returns:
> + *
> + *     The first element is filled by the amount of the collected numbers
> + *     in the range. The rest is what was parsed from the @str.
> + *
>   *     Return value is the character in the string which caused
>   *     the parse to end (typically a null terminator, if @str is
>   *     completely parseable).
> --
> 2.29.2
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
