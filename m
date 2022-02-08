Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79A304AD650
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Feb 2022 12:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbiBHLXw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 8 Feb 2022 06:23:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244961AbiBHLV4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Feb 2022 06:21:56 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E81C03FEC0
        for <linux-gpio@vger.kernel.org>; Tue,  8 Feb 2022 03:21:55 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id a8so51231296ejc.8
        for <linux-gpio@vger.kernel.org>; Tue, 08 Feb 2022 03:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h0bqkP/6kD2dEkTgCubdbv5SGEcZhSAS2Kpi6oik4hU=;
        b=5i2mLyCkBUfIRWek2qWcm/zBcM11Y03MOtIhtz12kWjcGuMWlRSu8EfTFzGlcPaytg
         NNaP8hu1d5WvRHwkqHi7zAOt444rdPN5JI7ZGDgygYNXcgv+mST7i/BgBYsEzk1eUbQN
         0Ze2FF+aCITVaZKXfG0XGhZY8K4GF9L1sswh/Xux5GmLXI0xgji8M+rCJkW/NlPGN4SL
         wHd308PhxidAO8oeEOZWkq+OCYjIOeIHp+f5eazLoAu55A+lBfCzYlG+Py8C2wSjw0/k
         Lbuz6O93L3AqwHg2hRlx//zVK4FiKU0mRVyOKNXjBwZaWCcL501sCik1deDVh9weKU83
         7AcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h0bqkP/6kD2dEkTgCubdbv5SGEcZhSAS2Kpi6oik4hU=;
        b=UkrzMfjk+8/ux1PuqSI4dzJlRAM5RQeIYbFSdEMHV4sQ6e28farrx1cCcbfF6vB+ER
         62L+Z3qO/5B9tAyZ0MNEStIwoiAc9bPUjlJeILEA36IZeUL7tB4/qghGxANld6gTn60Q
         i6GZFrfra8lHCPIhb1vVAdr9LhtQkVAn/FnVbB0vTgjiSpMIZsOYDBg00L5tYTygVSrX
         BvsCSDZFpGBvz4qZo2fISiNCYEGiP5iemHWlwig9U+khV5dys1/niP4XlpEqhJsvZ2gT
         f9EoneCiZLT9pNvhvtCXXYzs5W5oNqRm0XfMpn/z8aLMQ1YaWvr0vfRfMSYbjQ+NiwIV
         YFNg==
X-Gm-Message-State: AOAM531ujk0XKFH+bd9qAfK8MarGP+wV131GGrnUmFaNVpyG0tSA6CKA
        zxifUcK1Z55UD/Ruskxg8fvpiCAVnlzV1RbpiQJUkA==
X-Google-Smtp-Source: ABdhPJy72mKz942t5mnsstnJzgdSQgFirWBs0odiUef50w6iscT45TayiO/M7HTYnn3ITd3xgxGBzHLtIU2lxZzJUQk=
X-Received: by 2002:a17:906:ad8e:: with SMTP id la14mr3290346ejb.492.1644319313799;
 Tue, 08 Feb 2022 03:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20220203042134.68425-1-joel@jms.id.au> <20220203042134.68425-2-joel@jms.id.au>
In-Reply-To: <20220203042134.68425-2-joel@jms.id.au>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 8 Feb 2022 12:21:43 +0100
Message-ID: <CAMRc=MfYH=YuFaV-pX0weM5o+i7u7gkQ7d7qg2j-XK2EoN1BkA@mail.gmail.com>
Subject: Re: [libgpiod PATCH 1/7] tools: Clean up scandir memory allocations
To:     Joel Stanley <joel@jms.id.au>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Zev Weiss <zweiss@equinix.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Feb 3, 2022 at 5:22 AM Joel Stanley <joel@jms.id.au> wrote:
>
> The code copied from gpiofind didn't free the memory from scandir.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tools/tools-common.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/tools/tools-common.c b/tools/tools-common.c
> index 0dc3d52668d7..c83e68a2c1e4 100644
> --- a/tools/tools-common.c
> +++ b/tools/tools-common.c
> @@ -190,12 +190,17 @@ struct gpiod_chip *chip_by_line_name(const char *name)
>
>                         die_perror("unable to open %s", entries[i]->d_name);
>                 }
> +               free(entries[i]);
>
>                 offset = gpiod_chip_find_line(chip, name);
> -               if (offset >= 0)
> +               if (offset >= 0) {
> +                       free(entries);
>                         return chip;
> +               }
> +               gpiod_chip_unref(chip);
>         }
>
> +       free(entries);
>         return NULL;
>  }
>
> --
> 2.34.1
>

Good catch! It doesn't come up with gpiodetect which is what I tested
with valgrind but does show up for gpiofind and gpioinfo. This patch
however doesn't apply on the current master. Also: I don't really want
new features for the v1.6.x series and we're heavily reworking the
interface. Current version is in the next/libgpiod-2.0 branch but I
should be posting a new version with reworked test suite later this
week. How about working on this feature for the new API right away and
make it part of libgpiod starting with v2.0?

Bart
