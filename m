Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B54C70D864
	for <lists+linux-gpio@lfdr.de>; Tue, 23 May 2023 11:06:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232887AbjEWJGH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 23 May 2023 05:06:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236306AbjEWJFx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2023 05:05:53 -0400
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26761186
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 02:05:38 -0700 (PDT)
Received: by mail-vk1-xa35.google.com with SMTP id 71dfb90a1353d-456d9652c24so3135501e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 23 May 2023 02:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684832738; x=1687424738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FAmc6Od1z4FYb2Y1E1PZTnwP2lmq1vJ4+K6noBNUSsk=;
        b=MOKMeBlGTtwubtX6e8wFiX9tuSf/4WTSTS8X0ztj+s8JoBH446qQ/pPowVVxVgPfod
         +xjYkaZLV58Nlw01Xa9vfBYPbDJvR9GBMsjxY/TAnik/akrcJJ1OAc4sDv+E26FLl2cP
         KWl3muRjN+fKsXOVQh5SMG1s4A+7fpAwzUAe+all4EdwrJMexr4L344KoV/jsWKh2BlX
         /vhl+5heaMSOqLXLjbx1gSAgemAlbalu8b/rdxE24UThkXFoUQFUDTGrYKKkbP/tI7z8
         YZxCeJ4Bmf6S761/izr1f+JIl+bMAVLPXlJy79ajm2juV2+8U08iurWegnlHO65zxB04
         Y79Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684832738; x=1687424738;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAmc6Od1z4FYb2Y1E1PZTnwP2lmq1vJ4+K6noBNUSsk=;
        b=GuOlOlB1K0XenO8vJERrllRZtfjF0J/FZ8VmldPf3BY6oNA4Why/IlswiGRurD2GKl
         u+t1T3sff+lr0UDLGRA3mMMPBpt4a+k8w4wN5vOT+bsSIR7hAvlJ9OL/Mx5d+QWyBWlb
         o32dgN3JUzzTtZb3FK65zwMdeszfDnMPkLB6kB7dUlsBSRPJt8hmYw8vX2ZCzEBEe4/j
         lMWZS0Z+e281DJYF8ZUxxXFCze4Mz5LZBcg917suGFUFn46Pzpqwm//d5oPrBO1xXnTw
         lW2XSfboyIQdkpzLn85Got4F7RjDvuKaI5Yrbu+4Jyx05oHzZlMbjNaNm7nqAMMtfBOi
         lpHw==
X-Gm-Message-State: AC+VfDwP2wIB/hKSGRAnFdGeJNFZvrN/R00ElO7mhBMHkCC6VxnZn9bZ
        09+XjUJ7nJYlDUa19TjZbX0y73Xr8LvRIMydYsXqeD4H5Ki+QrJA
X-Google-Smtp-Source: ACHHUZ4SdiZwNxOw8AJk8H/5juqGQDSjQIr5AVgthUshO6mxTSwO2RbOL29i7/vz/XpWDB7giSZ0rDhhJrDaiNfZq80=
X-Received: by 2002:a1f:6006:0:b0:440:4946:fac with SMTP id
 u6-20020a1f6006000000b0044049460facmr4538419vkb.4.1684832737838; Tue, 23 May
 2023 02:05:37 -0700 (PDT)
MIME-Version: 1.0
References: <20230523080334.38971-1-warthog618@gmail.com>
In-Reply-To: <20230523080334.38971-1-warthog618@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 23 May 2023 11:05:26 +0200
Message-ID: <CAMRc=MdLTxePpR2QHM1HZme-pUq2=-tqAKahhk2e0mUzE0DG4Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2] README: provide more info in Contributing
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

On Tue, May 23, 2023 at 10:03=E2=80=AFAM Kent Gibson <warthog618@gmail.com>=
 wrote:
>
> Add more detail to Contributing to make it easier for new users to
> contribute.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
> ---
> Changes v1 -> v2:
>  - add more info on the mailing list and archive.
>
>  README | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/README b/README
> index b71739e..85b6300 100644
> --- a/README
> +++ b/README
> @@ -275,8 +275,26 @@ were selected and help2man is available in the syste=
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
> +to the linux-gpio mailing list[2] by e-mailing to linux-gpio@vger.kernel=
.org
> +(add the [libgpiod] prefix to the e-mail subject line).
> +Note that the mailing list quietly drops HTML formatted e-mail, so be su=
re
> +to send plain text[3].
> +
> +Code submissions should stick to the linux kernel coding style[4] and
> +follow the kernel patch submission process[5] as applied to the libgpiod
> +source tree.
> +
> +The mailing list archive[6] contains all the historical mails to the lis=
t,
> +and is the place to check to ensure your e-mail has been received.
> +Search for "libgpiod" to filter the list down to relevant messages.
> +Those also provide examples of the expected formatting.
> +Allow some time for your e-mail to propagate to the list before retrying=
,
> +particularly if there are no e-mails in the list more recent than yours.
>
>  [1] https://github.com/bats-core/bats-core
> +[2] http://vger.kernel.org/vger-lists.html#linux-gpio
> +[3] https://docs.kernel.org/process/email-clients.html
> +[4] https://docs.kernel.org/process/coding-style.html
> +[5] https://docs.kernel.org/process/submitting-patches.html
> +[6] https://lore.kernel.org/linux-gpio/
> --
> 2.40.1
>

Applied, thanks!

Bart
