Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D01573D921
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 10:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229871AbjFZIHu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 04:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbjFZIHp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 04:07:45 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8E1E10C1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 01:07:42 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-471658cc106so1105662e0c.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Jun 2023 01:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1687766861; x=1690358861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oHjAPG0XEBs1xAfzALW8oOgrWDDiagbNW8HOn9NkJ4A=;
        b=rLOjwSumm4YjdOUd7bfhOJeRhDcfxzC+jOoBi0RA3gb+jgh3f2lGHUWBXMKST7qhkY
         TbURVy1FhoZVQhW4LB+U0IeJqR+JzLwWGWEQmZWy/FIhzgFWeeM0hs6t7UOoGqk8mFAR
         5WfW8p2e33c1VTSJHL/F8pP/xlOszcIBw7LrF76H3pjJtkYzTiryI5SnqZ8luHdfJd7+
         /OgvUSaT4pGrYG4kLL0TCosTgbU4apJbodWzy3TWc/7P/W03Rwo7ByVp9ezK7ftfgVo4
         5S+UQm1M2vRjse7mg8sVhCt2EzmPbqVRXWpiXG79EVWKeSf0D1izCbBfdLSYgTMq2tfh
         cWxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687766861; x=1690358861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oHjAPG0XEBs1xAfzALW8oOgrWDDiagbNW8HOn9NkJ4A=;
        b=AdmWJekW5WFy5pYFdzhYDE9qYAH9j+nw1Kl50fg9Ygg39jbmQgUlOu0UNT3Mte8tEQ
         JTUOTCg0QzjsWAi8ShFrAdERIWRCpIt58zHqiDeQGSRy9R+7BMwdCwujpjgAYbjh8Wnu
         5swEY3u6kz8j/Ln1OUjxZsKDGL+a6pQlS2NK59XWKgtp8AXOC3Ls5nzJvMbBrwPxFm1E
         DseD8JP/kshA31tCUDybcZgWWxDcIxjID9DEL2UFPv6+l0Dvj8jb7ZBLVc4tECjyPSkA
         x0QVEcdHmv+nH1WCcidde5OVMr1lGE+SyetIF1qUjidAA+zooGLA1zqLfU2ecrcrStGJ
         RxcQ==
X-Gm-Message-State: AC+VfDyAMUNggr1233SaFWkZ2lo/QlV59AjTn+vQgO367kKpHKczxwjV
        8JJ5WFN4uT2TOj01fn4kAS2HzPjbx6S1opaHb7XjbpXkTqCgx+J9
X-Google-Smtp-Source: ACHHUZ5Y3a5KSD3vmEj7AJ4yWe3Yv8KZviriIsEpbtLLNzjl6iSpHO27PKc110v74qmRcULVhGcE8vUxtJJEUUxFDvs=
X-Received: by 2002:a1f:5e51:0:b0:471:b3f3:9bf9 with SMTP id
 s78-20020a1f5e51000000b00471b3f39bf9mr11726102vkb.6.1687766861605; Mon, 26
 Jun 2023 01:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230624052054.13206-1-warthog618@gmail.com> <20230624052054.13206-3-warthog618@gmail.com>
In-Reply-To: <20230624052054.13206-3-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 26 Jun 2023 10:07:30 +0200
Message-ID: <CAMRc=Md_teQvr-+HOWJb1Y9z1SnCDsheUX=q5Oy-z+5-s40KLA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/4] core: examples: fix file comments
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

On Sat, Jun 24, 2023 at 7:21=E2=80=AFAM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> Some of the file comments are cut-and-paste errors, so replace them
> with the correct comment.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
>  examples/async_watch_line_value.c      | 2 +-
>  examples/get_multiple_line_values.c    | 2 +-
>  examples/reconfigure_input_to_output.c | 5 ++++-
>  examples/watch_multiple_line_values.c  | 2 +-
>  4 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/examples/async_watch_line_value.c b/examples/async_watch_lin=
e_value.c
> index f35fb1a..8b1d643 100644
> --- a/examples/async_watch_line_value.c
> +++ b/examples/async_watch_line_value.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  // SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
>
> -/* Minimal example of asynchronously watching for edges on a single line=
 */
> +/* Minimal example of asynchronously watching for edges on a single line=
. */
>
>  #include <errno.h>
>  #include <gpiod.h>
> diff --git a/examples/get_multiple_line_values.c b/examples/get_multiple_=
line_values.c
> index b16c570..c6df3f6 100644
> --- a/examples/get_multiple_line_values.c
> +++ b/examples/get_multiple_line_values.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  // SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
>
> -/* Minimal example of reading a single line. */
> +/* Minimal example of reading multiple lines. */
>
>  #include <errno.h>
>  #include <gpiod.h>
> diff --git a/examples/reconfigure_input_to_output.c b/examples/reconfigur=
e_input_to_output.c
> index e8fbb1c..abfaf79 100644
> --- a/examples/reconfigure_input_to_output.c
> +++ b/examples/reconfigure_input_to_output.c
> @@ -1,7 +1,10 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  // SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
>
> -/* Minimal example of reading a single line. */
> +/*
> + * Example of a bi-directional line requested as input and then switched
> + * to output.
> + */
>
>  #include <errno.h>
>  #include <gpiod.h>
> diff --git a/examples/watch_multiple_line_values.c b/examples/watch_multi=
ple_line_values.c
> index 8015270..e955b2c 100644
> --- a/examples/watch_multiple_line_values.c
> +++ b/examples/watch_multiple_line_values.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  // SPDX-FileCopyrightText: 2023 Kent Gibson <warthog618@gmail.com>
>
> -/* Minimal example of watching for edges on a single line. */
> +/* Minimal example of watching for edges on multiple lines. */
>
>  #include <errno.h>
>  #include <gpiod.h>
> --
> 2.41.0
>

I applied this and patches 3 and 4 as well. I fixed the whitespace
error reported by git in this one.

Bart
