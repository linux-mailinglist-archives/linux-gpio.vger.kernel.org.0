Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2412E70C353
	for <lists+linux-gpio@lfdr.de>; Mon, 22 May 2023 18:29:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231609AbjEVQ3m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 May 2023 12:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231705AbjEVQ3l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 22 May 2023 12:29:41 -0400
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com [IPv6:2607:f8b0:4864:20::a2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B728BF
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 09:29:39 -0700 (PDT)
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-456de5aa485so1386482e0c.3
        for <linux-gpio@vger.kernel.org>; Mon, 22 May 2023 09:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684772978; x=1687364978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2FQLDkHzNkuEy6CFmsWNbKZevKxWozpO4BG9kUic8M=;
        b=gsYfPQERmtZnm5E1DRmMRa//fQWLvknazOl1+O3mrW7LzgbzCGyjuWDKIJe7bNGf+b
         cSo8544Mwqq2bdvZuR9jQAFKdZAJAQgX+eUkMJoD1nNJZiOCd4WmVVXmp7QY6xS9v4+g
         sQuNfI7tnhvfoC2o8JTwPLDZAwuDf38jiKXtEG7OLfzx8a6P3ZYZxOXr1oFvKqmWRsYd
         4x/ZIDudPYrKfmphLhARJ64aBbktpdDVpgaq7t5ubMPKdA4ndxJoQqhdSPntjWVLJ/3E
         WVvTy8ERFQVsnk5ZR2a60J75Lby0kVZMASJsCJN8cs4V0Fb1GmACFhAqKce8b6ghYqHt
         6S4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684772978; x=1687364978;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2FQLDkHzNkuEy6CFmsWNbKZevKxWozpO4BG9kUic8M=;
        b=ig4YQLDEESbeZ6RE8HJKmF6pAQb8mi7t18K3GP7sIuBJIREpJ8wE0bvYKh7/BKpPVQ
         Zf8MkPMqgI/opPBYwxLnxFdQ9wya/o3Onwf2/ijJI4cDgkzq4F//7xyKCpgCGzSdTvSj
         QZlPiXF6CrFVRp8zp/w6j6AhWhxfRNYS4it01UCl8/dOQWi+ETwXI40sP0N6tYhMz16X
         rCpK25LEKPLVkrNklUj7ICmCBICziYWPAxQr0ptGMRSjiI9SJyqIdk7Tw3A5XV6u4136
         t9IxDeCUFjRL5switPU8kWj8k+YwyAb+/kDNInHUYr6SMPT0Y/Ivpqv7bcHhQhYanWuj
         8v7w==
X-Gm-Message-State: AC+VfDzsOuP3z2J9kjJIYX9D8kWMUDy+kMGULOOkba7LVXNuNV+itmwn
        MolHV9WFUpCW1vQDnBwT41u0vOROKYQwx4KhwaPu+gded65t0jv8
X-Google-Smtp-Source: ACHHUZ6AAa+/74wMDudeSqe2WU1ZPfuzJX2gLHaXKWLqSX56XegABmjFs1CrcdbBRevnN+wW6cXJcNSxsovUaj5l2pA=
X-Received: by 2002:a1f:43d5:0:b0:440:4058:936e with SMTP id
 q204-20020a1f43d5000000b004404058936emr3462818vka.12.1684772978338; Mon, 22
 May 2023 09:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230520031150.20062-1-warthog618@gmail.com>
In-Reply-To: <20230520031150.20062-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 22 May 2023 18:29:27 +0200
Message-ID: <CAMRc=Mf3uKRwXkkaZdOQS2-a_iph--M3FrVd3dfqqt5wK8aDTA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH] README: provide more info in Contributing
To:     Kent Gibson <warthog618@gmail.com>
Cc:     linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 20, 2023 at 5:12=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> Add more detail to Contributing to make it easier for new users to
> contribute.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
> I was tempted to add something on formatting with clang-format, but I'm
> not 100% clear on the formatting policy myself.
> Would be nice for that to be clarified.
>
>  README | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/README b/README
> index b71739e..8e726fe 100644
> --- a/README
> +++ b/README
> @@ -275,8 +275,16 @@ were selected and help2man is available in the syste=
m.
>  CONTRIBUTING
>  ------------
>
> -Contributions are welcome - please send patches and bug reports to
> -linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mail subj=
ect
> -line) and stick to the linux kernel coding style when submitting new cod=
e.
> +Contributions are welcome - please send questions, patches and bug repor=
ts
> +to linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the e-mail
> +subject line).  Note that the mailing list quietly drops HTML formatted
> +e-mail, so be sure to send plain text[2].
> +
> +Code submissions should stick to the linux kernel coding style[3] and
> +follow the kernel patch submission process[4] as applied to the libgpiod
> +source tree.
>
>  [1] https://github.com/bats-core/bats-core
> +[2] https://docs.kernel.org/process/email-clients.html
> +[3] https://docs.kernel.org/process/coding-style.html
> +[4] https://docs.kernel.org/process/submitting-patches.html
> --
> 2.40.1
>

Thanks for doing this. Maybe even add a link to the linux-gpio mailing
list main page and archives? I sometimes get mail from people confused
as to what the linux-gpio mailing list actually is.

Bart
