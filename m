Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADC476EB17
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Aug 2023 15:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236470AbjHCNrW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Aug 2023 09:47:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236420AbjHCNq5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2023 09:46:57 -0400
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECE274690
        for <linux-gpio@vger.kernel.org>; Thu,  3 Aug 2023 06:45:39 -0700 (PDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4865e927e1cso343633e0c.2
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2023 06:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1691070339; x=1691675139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S8yq/8OapVjxc5XCu1U+PVMeO11fLTTTaSlA23O5bzc=;
        b=XD2xjHe61eShArEumVMZhVW5KiiA6WV9mfhVi2uD2pGyZqQHlGjnWJJZx1zEJU/142
         Stjbpms6cYnJkK0zJUDcd6qU5ikDH2GWZiG764xgbzJrAcngFqLwVRoYV5aXcPk/0QON
         XQOQjLCgLm5nL/4yPw0urri9s5Uo1UZ3X5Q4BiwHzEfrtd9x4N+xFpLDjKTksXjmoWpd
         zJOT6HLVLm68wyCOKLVDRvqU2z8N+A5q7pQMcN7XGXev32Fxsc6ZIY1Gm8jMPwgFpcZQ
         D4L+aljX8FrbwL9QV8X62aU2ylpdei48oq1l4ZldmvUdpFsW+KwsbSFjoUDQbqX5FTkm
         f0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691070339; x=1691675139;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S8yq/8OapVjxc5XCu1U+PVMeO11fLTTTaSlA23O5bzc=;
        b=LzYtkr3gapDSEQLhUq+1Kk0UCHfCOYMKlt+KlC0+pJoGebaQnQLUQW8P7Ke4x6Uv4T
         Y+PMdcyIvArrMO6ejbh0gMT5pO+rrNaVvyPDx0aTkklp3fiVtZxVQswX5+Xq1rBXhZDw
         JpPuud1xn2OcvB7067Q5l7VbLg7IQSz43AOAGfDmFfccPE+rvmp36X7jSFrBLu/rsxQ3
         ZubS0KzuO3hbwAAdtF+RVUnO0+B0swMAOYaBe7EeV1CCfYx5T91Y0KxAW+B+xLilGzTc
         q21d5VrNS9YgP2BKOKAe1hvQ1xmWfIQmWQDygw4gPK0yygVog3FvGa8g7jbWfpP1yoyx
         Xc7Q==
X-Gm-Message-State: ABy/qLa9O/VAhur1KioWkXz7vr7MVmfbH+7Gw/YuDC0ZzIQpcrmweqFh
        UHRlCHZ7rfhXp5ceFDt1v0tjLdZu0VLOE6/qxEmhzA==
X-Google-Smtp-Source: APBJJlHYKE2PuWcweY8zHv4tuYANDjYnD9piGa9N5YBHre/4imgeWQiA3Lt9GqZ6JWjf0/dHYACSLZly1QtKq3ensZ8=
X-Received: by 2002:a1f:5f90:0:b0:46e:85b8:c019 with SMTP id
 t138-20020a1f5f90000000b0046e85b8c019mr6773687vkb.1.1691070338959; Thu, 03
 Aug 2023 06:45:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230801073211.4274-1-aboutphysycs@gmail.com>
In-Reply-To: <20230801073211.4274-1-aboutphysycs@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 3 Aug 2023 15:45:23 +0200
Message-ID: <CAMRc=MdNovdNeExP9MSyun+bwfaE-xyEO8SPuHVOPLNQ5opWUg@mail.gmail.com>
Subject: Re: [PATCH] gpio: timberdale: remove unneeded call to platform_set_drvdata()
To:     Andrei Coardos <aboutphysycs@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        andy@kernel.org, linus.walleij@linaro.org,
        Alexandru Ardelean <alex@shruggie.ro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 1, 2023 at 9:32=E2=80=AFAM Andrei Coardos <aboutphysycs@gmail.c=
om> wrote:
>
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Als=
o,
> the private data is defined in this driver, so there is no risk of it bei=
ng
> accessed outside of this driver file.
>
> Reviewed-by: Alexandru Ardelean <alex@shruggie.ro>
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---
>  drivers/gpio/gpio-timberdale.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-timberdale.c b/drivers/gpio/gpio-timberdal=
e.c
> index de14949a3fe5..bbd9e9191199 100644
> --- a/drivers/gpio/gpio-timberdale.c
> +++ b/drivers/gpio/gpio-timberdale.c
> @@ -256,8 +256,6 @@ static int timbgpio_probe(struct platform_device *pde=
v)
>         if (err)
>                 return err;
>
> -       platform_set_drvdata(pdev, tgpio);
> -
>         /* make sure to disable interrupts */
>         iowrite32(0x0, tgpio->membase + TGPIO_IER);
>
> --
> 2.34.1
>

Applied, thanks!

Bart
