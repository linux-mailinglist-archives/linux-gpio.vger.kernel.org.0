Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E4E47C6E70
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Oct 2023 14:47:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235709AbjJLMrQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 12 Oct 2023 08:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233496AbjJLMrQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 12 Oct 2023 08:47:16 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C94C91
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 05:47:14 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id ada2fe7eead31-4542d7e9bcfso403273137.3
        for <linux-gpio@vger.kernel.org>; Thu, 12 Oct 2023 05:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1697114833; x=1697719633; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UXsflwbktAJUPvl3ObvbuxYifd3OzbpSixTpiG50klI=;
        b=GwFV/SlAszbLK4uakA828GFmyATJWMjUwHP6qYuKNxjxlSFg/RFcsmA6XPLsymemkj
         RRy7n8/2/dABWV2/zZegTthAUuukO6yt24LkZt917RV1NdaiqxEMj0a4TLxFrwRvkS3H
         fVPcNEo3m8nF5CRMIj3Pxq7xej5Z49FI0EJ2T2owYHuRCyT/9O35ZiEfoYrDzku/oJlq
         1rqI6Fj3++vLrivWYNkJAqkrpsgBCll+pmHNBWjGl3Ei2K3iFAVJWq48RPm/HnbhWjzo
         dJTKWfv/KRLQLvCN1lP2nPZFCnOG2yk5/pBS/7/AuRvOIB37yeNnAQ9/g4ucruZ1t4z3
         rmTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697114833; x=1697719633;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UXsflwbktAJUPvl3ObvbuxYifd3OzbpSixTpiG50klI=;
        b=LaL+nj4/HazsX0ucHSxyV53/RMIuDWVDX9LG7iY+/1XgqVbA7laL7PL+xFmy+sP4RG
         40AFCIWdSCZyjwh+yGVcwoo0ydWa6RbzX3cw8KXp6l/m7gWZskQFCrEScuSHcHssWmIc
         J1S6DN5FRxQUIpH0URhrjfdzD/JBAgAB3ddeB+0QxdB40j4/XBJf39ZwY3YS9zFA/AEI
         8pcJ0qUPqdFyNljUqkKCnf++x/zvzZFJBgdZkY630AO9JSjyeeT836UpcNpyUs48uww0
         eyQNALi5CpuV+IHl55fqXD+ym07rFverNzQpUlD55DrkeHFvKDKxCGmoqdtIW1F6AszB
         xQ4w==
X-Gm-Message-State: AOJu0YzFVqNM3rm/TngNcAcz4UvhQEt8TX1OdpAH5wGUvQEDm1dkRFx7
        H3IWHCT8vSPBcwI4Hjr6JuwnpO7LmWplReAoug44Og==
X-Google-Smtp-Source: AGHT+IGGjaNubOn3RrcFI4FcPspR7riwdRtuwFwZ8FKY8/0DKLR5BG60OSEfwDQgY+Pe0dspffRbEpNgMMEgPHgZQts=
X-Received: by 2002:a05:6102:3a65:b0:452:856c:471f with SMTP id
 bf5-20020a0561023a6500b00452856c471fmr16278776vsb.35.1697114831470; Thu, 12
 Oct 2023 05:47:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231012105411.2843043-1-liudingyuan@huawei.com>
In-Reply-To: <20231012105411.2843043-1-liudingyuan@huawei.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 12 Oct 2023 14:47:00 +0200
Message-ID: <CAMRc=Md-1HQEvp76cGPmHJsFhqE1tKKz_5SDJ=UeY+AqeRt0Ew@mail.gmail.com>
Subject: Re: [PATCH] gpio: hisi: Fix format specifier
To:     Devyn Liu <liudingyuan@huawei.com>
Cc:     linus.walleij@linaro.org, andy@kernel.org,
        linux-gpio@vger.kernel.org, f.fangjian@huawei.com,
        prime.zeng@huawei.com, kangfenglong@huawei.com
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

On Thu, Oct 12, 2023 at 12:57=E2=80=AFPM Devyn Liu <liudingyuan@huawei.com>=
 wrote:
>
> The hisi_gpio->line is unsigned int so the format specifier
> should have been %u not %d.
>
> Signed-off-by: Devyn Liu <liudingyuan@huawei.com>
> ---
>  drivers/gpio/gpio-hisi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
> index 29a03de37fd8..ef5cc654a24e 100644
> --- a/drivers/gpio/gpio-hisi.c
> +++ b/drivers/gpio/gpio-hisi.c
> @@ -255,7 +255,7 @@ static void hisi_gpio_get_pdata(struct device *dev,
>                 hisi_gpio->irq =3D platform_get_irq(pdev, idx);
>
>                 dev_info(dev,
> -                        "get hisi_gpio[%d] with %d lines\n", idx,
> +                        "get hisi_gpio[%d] with %u lines\n", idx,
>                          hisi_gpio->line_num);
>
>                 idx++;
> --
> 2.30.0
>

Applied, thanks!

Bart
