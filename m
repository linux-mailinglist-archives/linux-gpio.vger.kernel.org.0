Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 500764BBFA1
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Feb 2022 19:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234606AbiBRSiF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 18 Feb 2022 13:38:05 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:38850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239306AbiBRSiE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Feb 2022 13:38:04 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0227F29C121
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 10:37:47 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id a23so17002128eju.3
        for <linux-gpio@vger.kernel.org>; Fri, 18 Feb 2022 10:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VS3DLwIltaVI6yY15QngxJkNPKgHA21C8sykmpSu8Yg=;
        b=sVwGZrT8+tF35ApzSKlY9lQmt5F++fBi7Hn7A5Iqxt7dCLArSivOmuRH5sqjj7wY+8
         54HxHKvicnMhyH26HnJRFz9b9Dx6UN98e6CE//HfUchAfg76p0ys+BI0PMOL4u/Ro+Yf
         SRKRatcA+r2YEaeeUNDXtONKznZgc6S9FfOlW2zMMvEHTm9WQhlCPxEFKq7WSivESCnm
         89BLGsaKDLPMvxiHo316SCA+8smmQI/U2T3R/5JL/+JE3X+MBHZ0EuNjGVEhSuBoaPTk
         6HJjIvH6oFx2Zi1cgjGHBzq4rZoegY48ys/NdtttmzEC4aGUcnGwUUUyhVeBK6xfYIE5
         PyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VS3DLwIltaVI6yY15QngxJkNPKgHA21C8sykmpSu8Yg=;
        b=OKLkKRZpFmGEfD0PMUSkCUfE9SOjfHXcWTuV4y5nf0UeYV08CYgncuwMEsvtiMeTjF
         ro1k6ef6uwYXgfcstFvILncOMyRnmI3AK7Iw/mHxPdAdZ2Yy6upiVHzoqWEPSNxM4s9Y
         0qEn9kX60VKgyXZXQWcsyCvlNtpZN6ZHLpXWPdzaClalGWl/BJfVjtrfU0Cz30S3x78T
         +UnTmsR2pFUbxaCV54NiX4akDiVKGjUpCnyRBK0+kYTxTHUJx7aAmQLf7TFdH5So7qxH
         FI0ClqeeB5boUkpkSE5TyyUR3qSj19phi6MxQtIoaeO+xVEiRCsD5iI1NHGYGs8FdZTa
         BIpA==
X-Gm-Message-State: AOAM532ZVZ7fkOCXJCFXsqU3dvCDb1gzozIwyXpN4sxOj3eliH0VjPL5
        ogZntnjG9WXhdsEeEpaReVhzgwu9YqwWHCbl4rHp6qmTzno=
X-Google-Smtp-Source: ABdhPJzxcvvPlucl/Fu8qKmERSj5JeCnTWVpbUfUQ4JSicWYGNXhnq+0VYEMMpU3Z6uOtfEvniH9J2MYhlidVnNAPuI=
X-Received: by 2002:a17:907:7618:b0:6cf:5756:26c4 with SMTP id
 jx24-20020a170907761800b006cf575626c4mr7426725ejc.492.1645209465527; Fri, 18
 Feb 2022 10:37:45 -0800 (PST)
MIME-Version: 1.0
References: <20220202120123.33727-1-joel@jms.id.au>
In-Reply-To: <20220202120123.33727-1-joel@jms.id.au>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Fri, 18 Feb 2022 19:37:34 +0100
Message-ID: <CAMRc=Mev4oS3CDWhCrUdW3=fGwMuWPVJGo8TAwgDmFSeyBu-Bw@mail.gmail.com>
Subject: Re: [libgpiod PATCH] gpioinfo: Clean up scandir allocations
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

On Wed, Feb 2, 2022 at 1:01 PM Joel Stanley <joel@jms.id.au> wrote:
>
> ==3017== 176 (80 direct, 96 indirect) bytes in 1 blocks are definitely lost in loss record 2 of 2
> ==3017==    at 0x483F6C7: malloc (in /usr/libexec/valgrind/vgpreload_memcheck-amd64-linux.so)
> ==3017==    by 0x491CE92: ??? (in /lib/libc.so.6)
> ==3017==    by 0x10AAAC: main (gpioinfo.c:215)
>
> The entires must be freed, and then the array itself.
>
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  tools/gpioinfo.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
> index 3d8911176281..d50af45dbf35 100644
> --- a/tools/gpioinfo.c
> +++ b/tools/gpioinfo.c
> @@ -231,7 +231,9 @@ int main(int argc, char **argv)
>                         list_lines(chip);
>
>                         gpiod_chip_unref(chip);
> +                       free(entries[i]);
>                 }
> +               free(entries);
>         } else {
>                 for (i = 0; i < argc; i++) {
>                         chip = chip_open_lookup(argv[i]);
> --
> 2.34.1
>

Applied, thanks!

Bart
