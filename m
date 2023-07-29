Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BDF58767FF0
	for <lists+linux-gpio@lfdr.de>; Sat, 29 Jul 2023 16:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229746AbjG2OHn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 29 Jul 2023 10:07:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229865AbjG2OHm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 29 Jul 2023 10:07:42 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF97A198C
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 07:07:37 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6b9f46dc2e3so1996788a34.0
        for <linux-gpio@vger.kernel.org>; Sat, 29 Jul 2023 07:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1690639657; x=1691244457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GD77DHRFkpskZxkdfsA8u8IlVV6prD4X4xlSeo6EhIM=;
        b=QAWOHdXh9uKRNIu3bAYkqMYN5WCkfy92yLbRF1PONUCv7nGIAHugRghDHR44yjePX8
         AD35OEjB7QqtWu4Kn8M5kg2q9JGFsqjufkudqHIXbtP0VsnwllTRcJxRuXSawuIzTK3k
         xhvlkSyETzyUK5YswUThGlyIMKz35Prp7ymDWkA1B/SHKLJuobrf1kcQWBFg8kbfKvOh
         V1jNUKogFAoT/3630VMbqnLbHCx8JZ0k4br3UJ5Tm2+tetozHH2G9ZusNO6jxLO8/4pT
         KsddTtk+TrtivBFIw9QhHPY3WoKr7u0KoA/BOV1BU4O5M6Ro3Kj1CI5jhznUyx5PL849
         +YXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690639657; x=1691244457;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GD77DHRFkpskZxkdfsA8u8IlVV6prD4X4xlSeo6EhIM=;
        b=RzpFzTnmQcNg5ppIuYk4Wh82odk6YG6IdQZblqXXglhA0DsDiBsDRLBsXXpseclKPZ
         U+T67a7ij9DjDlbxYaOj9zGjXb+zCxWf/LU+Ggr0wW9D7LKOBMWt3/s/l0QHkf69mRfY
         Rx3lLj6dK+4v05vJYub/rT96XaQNGmJNOCn+2BSYfPDI9w/ArnUI83+D2m0YO6Wu7Xx2
         cMnIjrAVNXaDkaUKM+Dkism7qAUc4QfBQawFs0sBQiT6EWw7H78w58/6eSjF41yiNBZe
         Qv+gO9F4rxKvpHKbLCIcV/s3fd5MJk1C1e3wlqdI7OQFR4TR2ZFFVgcr8EY4sX5reYXa
         Wvag==
X-Gm-Message-State: ABy/qLZ1hDxN/O8UF1/bVaKMr0vKnJwt4TfgOupVO2HhjMhD1BVvvGSx
        yibHVs/M7sfq8lpn+8c98/NZm0QlZaCwXTazozKIOw==
X-Google-Smtp-Source: APBJJlGSWNTYG5qyQU6o8eskcO9zip6VB+0lsdetAM9RCOpO4OF1E2jUr7BMlj9Oyok2ltJioyP1e4VtlEaFd9FL8Ew=
X-Received: by 2002:a05:6358:5e0e:b0:139:55de:329 with SMTP id
 q14-20020a0563585e0e00b0013955de0329mr1766611rwn.27.1690639656981; Sat, 29
 Jul 2023 07:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20230717121004.5205-1-aboutphysycs@gmail.com>
In-Reply-To: <20230717121004.5205-1-aboutphysycs@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Sat, 29 Jul 2023 16:07:26 +0200
Message-ID: <CAMRc=MdBni3dRHjTvVeZ2idCFcd=xf6pNiF-DNurfdtSCPzX2g@mail.gmail.com>
Subject: Re: [PATCH] gpio: eic-sprd: remove unneeded platform_set_drvdata() call
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        zhang.lyra@gmail.com, baolin.wang@linux.alibaba.com,
        orsonzhai@gmail.com, andy@kernel.org, linus.walleij@linaro.org,
        Alexandru Ardelean <alex@shruggie.ro>
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

On Mon, Jul 17, 2023 at 2:10=E2=80=AFPM Andrei Coardos <aboutphysycs@gmail.=
com> wrote:
>
> The platform_set_drvdata() call was never used, ever since the driver was
> originally added.
> It looks like this copy+paste left-over. Possibly the author copied from =
a
> driver that had this line, but also had a remove hook.
>
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/gpio/gpio-eic-sprd.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-eic-sprd.c b/drivers/gpio/gpio-eic-sprd.c
> index 84352a6f4973..53db88ae2a20 100644
> --- a/drivers/gpio/gpio-eic-sprd.c
> +++ b/drivers/gpio/gpio-eic-sprd.c
> @@ -653,7 +653,6 @@ static int sprd_eic_probe(struct platform_device *pde=
v)
>                 return ret;
>         }
>
> -       platform_set_drvdata(pdev, sprd_eic);
>         return 0;
>  }
>
> --
> 2.34.1
>

Applied, thanks!

Bart
