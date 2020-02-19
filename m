Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F5131642AE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 11:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727135AbgBSKyG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 05:54:06 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38144 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727132AbgBSKyF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 05:54:05 -0500
Received: by mail-qk1-f193.google.com with SMTP id z19so22546048qkj.5
        for <linux-gpio@vger.kernel.org>; Wed, 19 Feb 2020 02:54:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BC5JBxhf1L5HFeMhJ5aFhi6TWfttWOnbJEt9bKPTIJY=;
        b=JNvMBzc+vlyBrHXzEGZKInLBhZLIMe9ePS7Kl50HX5bTTg61NpbrkQ38au/HO6YalS
         4GUQv7RD4JbU/BGvQHaTm7AgZqFjoUkAcXKWgcOgbFmw3A72UKk+v5FURaJ+teqQvRxh
         qHCfnNj2MhUZE18oWRHKBWNQ5CC9Qtk5nsyzcVJ7Q7ohvx1lx2u58kpoq6SlE39hIfYf
         IlFMvgyDLu+oRLuwKdWFSsx0EkdAfwH8cuA00gdMVwmfg/5WricxnpOSX4kA2g3qzQxc
         KgS8KijqLWcfSw4kiBo5g9xt8p9m4mpzoFhA5uoqUb27Lec530Q83Vpepwws8qn984+h
         c4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BC5JBxhf1L5HFeMhJ5aFhi6TWfttWOnbJEt9bKPTIJY=;
        b=DIPqkiwnd72Vwt/9bAVqcSZbRN96jtyXy7zVEwCLHiDgOEaaA37epoOGhoXEbSOvu/
         5Sfd8yhY9el+St5fYus77RH4WXqg2+LcvbSPaCXJrjLt+K/cpFsKMhyrpb4ACq9fnsp1
         LkxwcafcU3FBZGfn3TNYGtjttENiCZ+DOq5mzgnez9VEya7sDshW42sQghDHDGfWVOV1
         TNmv0TuBll7+1yJ8PeX7JkLGo4ovKjk1ZnRntttD0K+kDy7gXeXAA/j+QvW4OVnEf44x
         np+v7/19ARg5VxTT+Ug4Km70xF+hH6i/mjM7Ms5mrEztQaQTAJLkkE8aNBfuuqIzxEYG
         Ko3g==
X-Gm-Message-State: APjAAAUu9ET8mJUoJX2mAMTbASM7Ynmw8F/CT6FdCU6fwlzB+fWAE80H
        XIIjfXlcNEtgEHaqr+iytuyVE1peB23CCAQsMcl99A==
X-Google-Smtp-Source: APXvYqyOSZag9U2LFBEH5aKt58+Qbd/MrwtebHG/3tGR08Au59dSCg0QbOk1ucU5UNH8HPg4WDJbs09WBgrz9UtxPmI=
X-Received: by 2002:a37:a488:: with SMTP id n130mr22380303qke.120.1582109644632;
 Wed, 19 Feb 2020 02:54:04 -0800 (PST)
MIME-Version: 1.0
References: <20200219092218.18143-1-brgl@bgdev.pl> <20200219092218.18143-2-brgl@bgdev.pl>
 <e1882a57-5a54-b94e-aa0d-3515c671bc3f@linaro.org>
In-Reply-To: <e1882a57-5a54-b94e-aa0d-3515c671bc3f@linaro.org>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 19 Feb 2020 11:53:53 +0100
Message-ID: <CAMpxmJVPAhw3j==etjwCYVj_YVH7=hfr0Lr2AnTmdYuJLeQpow@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] nvmem: fix memory leak in error path
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Khouloud Touil <ktouil@baylibre.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 19 lut 2020 o 11:52 Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> napisa=C5=82(a):
>
>
>
> On 19/02/2020 09:22, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski<bgolaszewski@baylibre.com>
> >
> > We need to free the ida mapping and nvmem struct if the write-protect
> > GPIO lookup fails.
> >
> > Fixes: 2a127da461a9 ("nvmem: add support for the write-protect pin")
> > Signed-off-by: Bartosz Golaszewski<bgolaszewski@baylibre.com>
> > ---
> >   drivers/nvmem/core.c | 7 +++++--
> >   1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
> > index ef326f243f36..89974e40d250 100644
> > --- a/drivers/nvmem/core.c
> > +++ b/drivers/nvmem/core.c
> > @@ -352,8 +352,11 @@ struct nvmem_device *nvmem_register(const struct n=
vmem_config *config)
> >       else
> >               nvmem->wp_gpio =3D gpiod_get_optional(config->dev, "wp",
> >                                                   GPIOD_OUT_HIGH);
> > -     if (IS_ERR(nvmem->wp_gpio))
> > -             return ERR_CAST(nvmem->wp_gpio);
> > +     if (IS_ERR(nvmem->wp_gpio)) {
> > +             ida_simple_remove(&nvmem_ida, nvmem->id);
> > +             kfree(nvmem);
> > +             return ERR_PTR(rval);
>
> Why are you returning rval here?
> This points return value of ida_simple_get and not the actual error code
> from wp_gpio.
>

Duh! Thanks for catching this.

Bart
