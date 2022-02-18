Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D9AD84BBFA7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Feb 2022 19:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236866AbiBRSjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 13:39:20 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:44752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235292AbiBRSjU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 13:39:20 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3680829C12B
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 10:39:03 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id qx21so16924851ejb.13
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 10:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7o3Mk1wn+TT4+Tfkf5wNwa+FtV6PLhzQeTETRTJzTSs=;
        b=gXzKXcNbt0YGNoZNw7AcidYbOPmG30VksQoD4Ux5Gvx8LrQZ8cx04xgGbh+N9tFScB
         NSWRywHpbvErl7xqzznHqsvGaV3/e9Wuih1NbKnlpXHGAA/iySLOCrHGTA5+eesRwvF0
         dTbKUA9UXEqgaIpKAAy++QoseSwQVlH0mUrO648GwuLT0fdPHOWheH644GlEvLLHjiWo
         2SjhryVBdHR3JyjkJAVYtZDz8EG9/nwm6OTPbkLATZqXxc1DAXbVAyNnnRA5igS30idJ
         6Z23Y4iFfgMVcRVw1rmyENbtjXpfmTNedroDyKMBR4AkMsjCkb3e3Tn88P8ttCTWhLls
         CgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7o3Mk1wn+TT4+Tfkf5wNwa+FtV6PLhzQeTETRTJzTSs=;
        b=rbA9Rtilmltyx0QthMo1htJvFrCzOFn7c/nUPiMIqrq1OwI9JpsTNFcn1ePjJNrdrD
         U++9QUJlJ8zIcLHKKAgpSvAlNBHQi8uQIrSUQHBv32Nk74vvmrVaeAiVeT+q/Tm+pugD
         R0dNvg0kidK2M2bAMCNr4d5MeNyXapu1y9hrSCm2RYnn7wb6Nn6KZckwTgO/uC4T/BKW
         7DHCwCZL8vRRsOjYD9R6X2zpVqHyqaN6nCSZPkHHdmKRivdTbCXEiuvt4lIZxo+GRCPa
         hL4LSgG63dWAKa+Pojl1hXchY+TXrtZcx9UdX6XxS1EyDuGS/koDlk1xv24fn+jelNsW
         HeIA==
X-Gm-Message-State: AOAM533lftCd16VfJb6pWDOJFu1bYtKzkASYQy37d/eeBRPpMy2Czbba
        viT7ksZgZKl/j4UfXrsRXCvBMZfzGLIZq1Iy8ryU0A==
X-Google-Smtp-Source: ABdhPJwww4SKuR7nNwTGuAL6+Vf5GEl4ZGRG0O1aJ01KAOAF5f4yNg2Vm91ZokGluvdM8Ftl4XulM85CdI4DNX7BTgs=
X-Received: by 2002:a17:907:72c3:b0:6ce:5256:1125 with SMTP id
 du3-20020a17090772c300b006ce52561125mr7374728ejc.697.1645209541755; Fri, 18
 Feb 2022 10:39:01 -0800 (PST)
MIME-Version: 1.0
References: <20220202114204.31918-1-joel@jms.id.au>
In-Reply-To: <20220202114204.31918-1-joel@jms.id.au>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Feb 2022 19:38:51 +0100
Message-ID: <CAMRc=MdJX0H1i=UjvHS15+yi+LYgYEyw3puavCwL878gsQWivA@mail.gmail.com>
Subject: Re: [libgpiod PATCH] core: Fix line_bulk_foreach_line invalid memory access
To:     Joel Stanley <joel@jms.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 2, 2022 at 12:42 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Running libgpiod applications under valgrind results in the following
> warning:
>
> ==3006== Invalid read of size 8
> ==3006==    at 0x10C867: line_request_values (core.c:711)
> ==3006==    by 0x10CDA6: gpiod_line_request_bulk (core.c:849)
> ==3006==    by 0x10AE27: main (gpioset.c:323)
> ==3006==  Address 0x4a4d370 is 0 bytes after a block of size 16 alloc'd
> ==3006==    at 0x483F790: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==3006==    by 0x10B884: gpiod_line_bulk_new (core.c:109)
> ==3006==    by 0x10DBB0: gpiod_chip_get_lines (helpers.c:24)
> ==3006==    by 0x10ADC3: main (gpioset.c:313)
>
> This is because the foreach loop reads the next value before checking
> that index is still in bounds.
>
> Add a test to avoid reading past the end of the allocation.
>
> This bug is not present a released version of libgpiod.
>
> Fixes: 2b02d7ae1aa6 ("treewide: rework struct gpiod_line_bulk")
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  lib/core.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/lib/core.c b/lib/core.c
> index 6ef09baec0f5..4463a7014776 100644
> --- a/lib/core.c
> +++ b/lib/core.c
> @@ -178,7 +178,8 @@ GPIOD_API void gpiod_line_bulk_foreach_line(struct gpiod_line_bulk *bulk,
>  #define line_bulk_foreach_line(bulk, line, index)                      \
>         for ((index) = 0, (line) = (bulk)->lines[0];                    \
>              (index) < (bulk)->num_lines;                               \
> -            (index)++, (line) = (bulk)->lines[(index)])
> +            (index)++,                                                 \
> +            (line) = (index) < (bulk)->num_lines ? (bulk)->lines[(index)] : NULL)
>
>  GPIOD_API bool gpiod_is_gpiochip_device(const char *path)
>  {
> --
> 2.34.1
>

I'll skip this because this entire struct is going away in v2 and the
bug is not present in v1.6.x.

Bart
