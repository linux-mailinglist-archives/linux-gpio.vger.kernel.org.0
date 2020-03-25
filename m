Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76A4C192C4A
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 16:24:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727319AbgCYPYp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 11:24:45 -0400
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38773 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727439AbgCYPYp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 11:24:45 -0400
Received: by mail-qt1-f194.google.com with SMTP id z12so2463869qtq.5
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2020 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l9GE4tNP0a/RYcvkghfD+VaPwEMEeyfTaeCdLtq9WBs=;
        b=wVWeTezxWgvXAcgFch+CuNyCQLEX993+7lv4rY5iG3XINR5qc+jH54rGliBKEhLPq1
         YpamQGAWuZudQBpIt8ifBbvloLD+k63TGJpGWDrlA/tfpvaTSdVmc5Cq7+z/Cn23n6b5
         t/jZIwouA/Vb7mT/grgDUZCFq90A3GhQl/H2XcbkMFCyPR8etoBWYsQxTle1zkBC/0aj
         1RTlSNlZG9mnMRgsa6J6ZgdwakrOpd1pLjk++s2eysIcxJtuZhJ1EfLnrVcutBwIHHTF
         6GtfvvZFOIWDsCCqSGKLgYVFEdSKb/LphKT4Nd4ZewTJbFpE1VGJLA1SbrK54uHULvlO
         krPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l9GE4tNP0a/RYcvkghfD+VaPwEMEeyfTaeCdLtq9WBs=;
        b=MB6c3ImcQezyhcQnIpuuFgCojduYbje4dbbF9ohAVBRBPx/WRUAR7S5Y1XHiM/gHae
         9diJYKwXmwKUkDhZAivpZw7cfLri5n2430PupkXvs2zu9C/28fKtPEi4wzJOgR00teZg
         LrHMunfAmaGKGXak3KwLVjWoteznVrjtG9bnEY7CCm+zoa+omEGqSBSTjTGBycwTt2wD
         ir6QMB+1mNiqzEXMCxGBKYg23kOYBIM8lQGQF6mwC+I86K5MFEebtkBWtzoa3GjERbMd
         sFn/I8L27O2vV1WdwmDvLqorvDAiz0TWMOc4mzk3EBOA57K2xoGzSjS4hh9PuqOPnZNf
         vlRw==
X-Gm-Message-State: ANhLgQ0TI65J1u3Q+wZgBl5452N+GD6Y/J/Ue8CJS7nXbQc4PR+vBHcI
        uznEXCjGE4oa/lTdye6QIyRm34St0FBt4wtmGZhobvaR
X-Google-Smtp-Source: ADFU+vsglUWcb8kSJWCWPe59RcqYFtxxJwWRhABAzMOq4UtV6psgXADMLDWsXL3t+InU3gTy9oWruRzOYaUvQgQRKg4=
X-Received: by 2002:ac8:23fa:: with SMTP id r55mr3521929qtr.131.1585149883270;
 Wed, 25 Mar 2020 08:24:43 -0700 (PDT)
MIME-Version: 1.0
References: <20200325103154.32235-1-anssi.hannula@bitwise.fi>
In-Reply-To: <20200325103154.32235-1-anssi.hannula@bitwise.fi>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 25 Mar 2020 16:24:32 +0100
Message-ID: <CAMpxmJVrTJN_YgfvKfxbNHRKscM8rGetbc=ic6hsbqMwCJapPQ@mail.gmail.com>
Subject: Re: [PATCH] tools: gpio: Fix out-of-tree build regression
To:     Anssi Hannula <anssi.hannula@bitwise.fi>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        "Stable # 4 . 20+" <stable@vger.kernel.org>,
        Laura Abbott <labbott@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 25 mar 2020 o 11:33 Anssi Hannula <anssi.hannula@bitwise.fi> napi=
sa=C5=82(a):
>
> Commit 0161a94e2d1c7 ("tools: gpio: Correctly add make dependencies for
> gpio_utils") added a make rule for gpio-utils-in.o but used $(output)
> instead of the correct $(OUTPUT) for the output directory, breaking
> out-of-tree build (O=3Dxx) with the following error:
>
>   No rule to make target 'out/tools/gpio/gpio-utils-in.o', needed by 'out=
/tools/gpio/lsgpio-in.o'.  Stop.
>
> Fix that.
>
> Fixes: 0161a94e2d1c ("tools: gpio: Correctly add make dependencies for gp=
io_utils")
> Cc: <stable@vger.kernel.org>
> Cc: Laura Abbott <labbott@redhat.com>
> Signed-off-by: Anssi Hannula <anssi.hannula@bitwise.fi>
> ---
>
> The 0161a94e2d1c was also applied to stable releases, which is where I
> got hit by the issue.
>
>  tools/gpio/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/gpio/Makefile b/tools/gpio/Makefile
> index 842287e42c83..440434027557 100644
> --- a/tools/gpio/Makefile
> +++ b/tools/gpio/Makefile
> @@ -35,7 +35,7 @@ $(OUTPUT)include/linux/gpio.h: ../../include/uapi/linux=
/gpio.h
>
>  prepare: $(OUTPUT)include/linux/gpio.h
>
> -GPIO_UTILS_IN :=3D $(output)gpio-utils-in.o
> +GPIO_UTILS_IN :=3D $(OUTPUT)gpio-utils-in.o
>  $(GPIO_UTILS_IN): prepare FORCE
>         $(Q)$(MAKE) $(build)=3Dgpio-utils
>
> --
> 2.21.1
>

Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
