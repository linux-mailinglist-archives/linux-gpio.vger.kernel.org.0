Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D92710AB2B
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 08:29:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfK0H3Y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 02:29:24 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43350 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbfK0H3X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 02:29:23 -0500
Received: by mail-ot1-f68.google.com with SMTP id l14so18256304oti.10
        for <linux-gpio@vger.kernel.org>; Tue, 26 Nov 2019 23:29:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u8oUQFRZy3gf3+1yf0zkKS6+wd9DrvcbQ832mANUPWo=;
        b=S/SdAfsNtNo4n8om7tQ8ej8pWPma3kUq5jV16c0NRtI0d+7+cBogG4aHNIEOFRIssG
         DqNvD128D3m2Dw4hHw/EN5U0fY7Y+9+GVaZ2wbUCqpTFItYtg4m1gXzE3FX9kTacD0KE
         EzIgZ6gTcM/+yjIjDFAg0X7QxSA48QIcYpxEor2LIp5K7ip6lECTtMlDnVT8s6nRoVp+
         VxhuDmKkPxn3I7TnYd6R+VAn8Byx2sKZrpIKL570sT3n5WZFSaQVFQHvgbcQq0cs1w9V
         +idjzBgwlDMcXNa06M1IXARDreMzmjRFdZ6blxE8OrCksjV71MpuuONorciuI3YLPWrM
         CG6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u8oUQFRZy3gf3+1yf0zkKS6+wd9DrvcbQ832mANUPWo=;
        b=OMT508USpDu8k4P1uU1FcDCESBKCaunnx65zP0xmAKgJnixGkAfcpDkp4erYslRf25
         G85E6ax9qNoe6ADgQrhtRUX4eZezqkV8WH5O3aZi+RyOEzFMFUwDUXxpTlPs7IH6TvU3
         jusBIvQJBLu7ZnRuzX3dGSX0VK+eK0gTcR4IWXP3UsfWxDwX/JavA98tRsI3ZwbwDYx3
         3xwmWA9Qz07FXauuippR1O/2hbn6xfHu+8jSRPHZ80OA0wp8XA5933GizQJnx/pe85f6
         rjRE0V0+JL92qekoXKCMHx7X+zdPRm3E6XWMx8EnhGMRyMP1X+SvpPEx5xJ2h9G+nuDh
         7rUg==
X-Gm-Message-State: APjAAAV09SixYB0lmiDBO8gRgzfn7IRAQ49JhegpAT/rYCtkeooXHF42
        JeIxTtWebb/F6yd3FrFdM1cb6ULIcp4d3YVIm0Gdqw==
X-Google-Smtp-Source: APXvYqwUJpU+ywaP4+HdQDqIrP53KyP5oXj3UgopnsUkAWzWQFz8KbbiHHCui0ide4gn0Mof0rjjgxah85RHCbxbzM8=
X-Received: by 2002:a9d:65cd:: with SMTP id z13mr2544801oth.85.1574839762873;
 Tue, 26 Nov 2019 23:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20191126193027.11970-1-jcmvbkbc@gmail.com>
In-Reply-To: <20191126193027.11970-1-jcmvbkbc@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 27 Nov 2019 08:29:12 +0100
Message-ID: <CAMpxmJV6qCGWKadeDyJLqCDtZ3zFBQAZ0yZuWkYiy3ZqWUFGiA@mail.gmail.com>
Subject: Re: [PATCH] drivers/gpio/gpio-xtensa: fix driver build
To:     Max Filippov <jcmvbkbc@gmail.com>
Cc:     linux-xtensa@linux-xtensa.org, Chris Zankel <chris@zankel.net>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Baruch Siach <baruch@tkos.co.il>,
        "Stable # 4 . 20+" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 26 lis 2019 o 20:30 Max Filippov <jcmvbkbc@gmail.com> napisa=C5=82(a):
>
> Commit cad6fade6e78 ("xtensa: clean up WSR*/RSR*/get_sr/set_sr") removed
> {RSR,WSR}_CPENABLE from xtensa code, but did not fix up all users,
> breaking gpio-xtensa driver build.
> Update gpio-xtensa to use new xtensa_{get,set}_sr API.
>
> Cc: stable@vger.kernel.org # v5.0+
> Fixes: cad6fade6e78 ("xtensa: clean up WSR*/RSR*/get_sr/set_sr")
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  drivers/gpio/gpio-xtensa.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpio/gpio-xtensa.c b/drivers/gpio/gpio-xtensa.c
> index 43d3fa5f511a..0fb2211f9573 100644
> --- a/drivers/gpio/gpio-xtensa.c
> +++ b/drivers/gpio/gpio-xtensa.c
> @@ -44,15 +44,14 @@ static inline unsigned long enable_cp(unsigned long *=
cpenable)
>         unsigned long flags;
>
>         local_irq_save(flags);
> -       RSR_CPENABLE(*cpenable);
> -       WSR_CPENABLE(*cpenable | BIT(XCHAL_CP_ID_XTIOP));
> -
> +       *cpenable =3D xtensa_get_sr(cpenable);
> +       xtensa_set_sr(*cpenable | BIT(XCHAL_CP_ID_XTIOP), cpenable);
>         return flags;
>  }
>
>  static inline void disable_cp(unsigned long flags, unsigned long cpenabl=
e)
>  {
> -       WSR_CPENABLE(cpenable);
> +       xtensa_set_sr(cpenable, cpenable);
>         local_irq_restore(flags);
>  }
>
> --
> 2.20.1
>

Patch applied, thanks!

Bart
