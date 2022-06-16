Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E6AD54DB73
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Jun 2022 09:25:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiFPHZM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Jun 2022 03:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiFPHZL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 16 Jun 2022 03:25:11 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 360AC3630F
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jun 2022 00:25:10 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id d14so917800eda.12
        for <linux-gpio@vger.kernel.org>; Thu, 16 Jun 2022 00:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j0RkBn38eIUcpCJRSb06o1L8Job+acwSCWg1EOotW4g=;
        b=1oUsrp8BlieLOYSDspR0FJcrS0d/QOFio2VO3rAkh6qJAmk6dNf4lGodkqqt+2X7Xi
         2qF4CVYzNMmdxBUvYHRZyenNWf1qbTp1eVqW1oswzU2ssdHxzsRn9QIfE6+wtKApB3fh
         hrhBZ0APF2BxliKu4t2nyl701SgFBsSmFz20ajLUHiNRaOdUAJlXumRM8yaUvgijmGCQ
         gcdLxfnLyYlx5MsmORRyQCrCRNDnKinHIm+oWJ/2yb5aoHzCu3dz8UKA+VRKUXNhzJXR
         jsHu9JmCIwKw0zoN63TZ8AVFuV3j1caCSTnu1OLY5yF09XIp8I5e2r6Pxsbpt5BYy/lT
         j1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j0RkBn38eIUcpCJRSb06o1L8Job+acwSCWg1EOotW4g=;
        b=ulrH67sbj0WKDq0UdEj5yIr7+tn/MiPB0Ly9/aaY+fXPMcuU5puHjaupbNMtXGUtfp
         Spou73KHDNnerLp5fAkMGvyJAwDnc7R50JYAL8m50rNcn4uG7Ltmz1HXDd+FPrY5qXNa
         E5PsiLB7WW/BveE+/spWoXx068UkCuKk3pcgYtJbaIEmpkXZmUseVAoIOFRNpjlL8ano
         3PNV8hfNqjFgmvKEg14A2mi1SzAHgKse+x5Q18ZG0llfZ2uuE4diLsyfdwnay/iKSGmn
         Q5d2X6E/Z1Dg9JVghO7c7GKLlrkBgGAZgjBRJpGZi1ZnpBy/bII6u8DwQVDbzB5WwAYN
         +gjA==
X-Gm-Message-State: AJIora+xDvpnCcJ0lraZXXCtmTn4zDieAsmxqirlGAOXl6s9r6lTKgED
        QARbMeMtkrtpTJKLE15MUg9T422FqjKr6k0axY+k/gr85hM=
X-Google-Smtp-Source: AGRyM1uzniWqMK5f8IutsNhZ0AVb4CzYVrEABsBuoXak8Ul8TADr/lfkPXNr7hmkLk1r2uG3J8lpwXkS2xN8OQ2InlI=
X-Received: by 2002:a05:6402:1449:b0:42d:d250:e504 with SMTP id
 d9-20020a056402144900b0042dd250e504mr4608747edx.213.1655364308821; Thu, 16
 Jun 2022 00:25:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220615100505.3972-1-yegorslists@googlemail.com>
In-Reply-To: <20220615100505.3972-1-yegorslists@googlemail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 16 Jun 2022 09:24:58 +0200
Message-ID: <CAMRc=McZ96KAJzEZQ4sa89CCKgw8Uk2r+egAYXybUZj=8S3hWQ@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] gitignore: ignore ctags generated tags file
To:     yegorslists@googlemail.com
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

On Wed, Jun 15, 2022 at 12:05 PM <yegorslists@googlemail.com> wrote:
>
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> This index file will be used by editors like, for example, vim.
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
>  .gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.gitignore b/.gitignore
> index 2d7cc7f..24136ce 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -9,6 +9,7 @@ doc
>  *.tar.gz
>  *.patch
>  *.swp
> +tags
>
>  # autotools stuff
>  .deps/
> --
> 2.17.0
>

Applied, thanks!

Bart
