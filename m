Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7C9776ABA5C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Mar 2023 10:50:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230180AbjCFJuv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Mar 2023 04:50:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230183AbjCFJuf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 04:50:35 -0500
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C99223D91
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 01:50:19 -0800 (PST)
Received: by mail-vs1-xe35.google.com with SMTP id x14so8507956vso.9
        for <linux-gpio@vger.kernel.org>; Mon, 06 Mar 2023 01:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112; t=1678096218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ttxx80DYXyQL1DMCChqsznb5rWuUuOITvpeRnBqSJVA=;
        b=YPeNpARCJOw/T7qkS7i1oSXZ5EYCXabmdK1OtF/V2t+KzEq9C/ZyPyjauRe0eAKlHD
         2RapB2Jxd/awtFFGjKnpOj3qqcWmU8sqCD6orjNj6DsftD8XllWP835g98KA8kmPIHDo
         8zyBvTl8f/JytjzHRKjxgiS/17NhaIstCLBbjY5M7TwdCAZX/PVO94YDVbIkzH71YAT3
         87KBuZSfzf2D7H8rNY+TRJQok03LXwI7skYdI7VNHDdlkaRNNga9KUQzAgNce73bQ25e
         e5TDXQwKl3SxI40dM/s+vn3JSNlX+tKzJmyViPAiu2oOtfp6+p/fqxr6bVAYl2gP/eMB
         DpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678096218;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ttxx80DYXyQL1DMCChqsznb5rWuUuOITvpeRnBqSJVA=;
        b=FnngzctgjSZ53m+8GiNp6FyX6ybf1VNC4ChTuwcijEMvw/Y+ObJgeK1aoCgDvPshjr
         P/teGpvMs5CmH4umTrlDDUoyL0tTkXwwaTma0B2/vHBwNNT1fV8r08YTIscJZ9ibtGG6
         y48nSqoG+lBTVNQxcT7pryY0l0QjvYiYtEyDLbIBuEAVTyMTiq8fPafd1R2vKy5wdJ/j
         ocW3rjPDEKJkMXtW91wPLMiElt7Y7nZCdDObJl9wRSpGux2w8l/3cJ6CFMApkOAjMZ/g
         63Lw7zNyrk0AQtjG6ypzS9giUSSMPEkezLATenPI+wBohFN78mKzAEB41uWYLECcUmjr
         2klQ==
X-Gm-Message-State: AO0yUKX1Eg13dz+WPn4O4K2AK0cHDZDsYM5Q0b1zg15jfke4xOJzqxnF
        NQJUKdohw4YY86tbna9DdGJr1deiIE/20UirVXnqBw==
X-Google-Smtp-Source: AK7set+s9eC23AOGA7bCfg3KXrF1cQmVB5qugbH8cXZpc2A3yYwTOBxg4L22lkIkrbQPTTT274nx9qrfY7/td4+fOc4=
X-Received: by 2002:a05:6102:209a:b0:402:9a0c:b682 with SMTP id
 h26-20020a056102209a00b004029a0cb682mr6897840vsr.5.1678096218430; Mon, 06 Mar
 2023 01:50:18 -0800 (PST)
MIME-Version: 1.0
References: <20230208105542.9459-1-william.gray@linaro.org>
In-Reply-To: <20230208105542.9459-1-william.gray@linaro.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 6 Mar 2023 10:50:07 +0100
Message-ID: <CAMRc=MequMGGHRNU7D5TsD=XowRgD7B=J12qA5hb-P6BQZUYvA@mail.gmail.com>
Subject: Re: [PATCH] gpio: 104-dio-48e: Utilize mask_buf_def in
 handle_mask_sync() callback
To:     William Breathitt Gray <william.gray@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linus.walleij@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 15, 2023 at 8:39=E2=80=AFPM William Breathitt Gray
<william.gray@linaro.org> wrote:
>
> The mask_buf_def argument provides a mask of all the maskable lines.
> Utilize mask_buf_def rather than hardcode an "all_masked" mask.
>
> Signed-off-by: William Breathitt Gray <william.gray@linaro.org>
> ---
>  drivers/gpio/gpio-104-dio-48e.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-=
48e.c
> index a3846faf3780..74e2721f2613 100644
> --- a/drivers/gpio/gpio-104-dio-48e.c
> +++ b/drivers/gpio/gpio-104-dio-48e.c
> @@ -106,7 +106,6 @@ static int dio48e_handle_mask_sync(struct regmap *con=
st map, const int index,
>  {
>         unsigned int *const irq_mask =3D irq_drv_data;
>         const unsigned int prev_mask =3D *irq_mask;
> -       const unsigned int all_masked =3D GENMASK(1, 0);
>         int err;
>         unsigned int val;
>
> @@ -118,7 +117,7 @@ static int dio48e_handle_mask_sync(struct regmap *con=
st map, const int index,
>         *irq_mask =3D mask_buf;
>
>         /* if all previously masked, enable interrupts when unmasking */
> -       if (prev_mask =3D=3D all_masked) {
> +       if (prev_mask =3D=3D mask_buf_def) {
>                 err =3D regmap_write(map, DIO48E_CLEAR_INTERRUPT, 0x00);
>                 if (err)
>                         return err;
> @@ -126,7 +125,7 @@ static int dio48e_handle_mask_sync(struct regmap *con=
st map, const int index,
>         }
>
>         /* if all are currently masked, disable interrupts */
> -       if (mask_buf =3D=3D all_masked)
> +       if (mask_buf =3D=3D mask_buf_def)
>                 return regmap_read(map, DIO48E_DISABLE_INTERRUPT, &val);
>
>         return 0;
>
> base-commit: 4827aae061337251bb91801b316157a78b845ec7
> --
> 2.39.1
>

Applied, thanks!

Bart
