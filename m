Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 636F379C873
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Sep 2023 09:45:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231689AbjILHpS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Sep 2023 03:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59014 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjILHpR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Sep 2023 03:45:17 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A1C2E78
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:45:13 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-490cd6db592so1858307e0c.1
        for <linux-gpio@vger.kernel.org>; Tue, 12 Sep 2023 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1694504712; x=1695109512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0/xqKTGt9/2jwXBObaDDzQ25OZV7MH4LGyijIsI0iws=;
        b=JwEQOTcvn6CsobedRqjzF0+dldTcI+tAin+A2Y3keymR21hBcrvCoHzDqVn83gewVJ
         JltU0UTMy3bCwYC+CV1BAOQM+8kwPWrADCXQDaQaP4jP8uwQOVzB5ykWlPRxZD+/8UqG
         ZWfeuX+1o9LdcTCZ0ayad2nTJX+dCh4oH9TS40mvhJuHFsyE2uxq8YK3sD1agnEZ7w5o
         jTkIjglq5/qAUFjhAFDwrqTZ3s+se8i9PEHXb+Fc5oIfJXZY1K/Ua+kbLsNxCsrBtcmX
         9wFH4LoivNh4Y9jSSTVxCcf0faFuHpqxW2T4RP6pG8XMc/QRcDeCaXvIaqEG9T4/CExC
         7PSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694504712; x=1695109512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0/xqKTGt9/2jwXBObaDDzQ25OZV7MH4LGyijIsI0iws=;
        b=rsuJl+/60ZfYcOWi2b9rrzpS1lfqKlvOvOT+zc9zqXUoo5aNIipRHZjEMt7PCX9GEC
         SfS9dfUNLbrmhfxnd4c6xqkrJzFXMDQcUVQuWo6kxlB6tk15jrHP4GFqcj1JgrV4GGhV
         UrWRQLN8r64Prr2CywLx+kzopUA9eVeFpttUegwWS5gn/MWk1u3vGmG7m+SGPykWhwH/
         dPyg0wxwyBXNuaoVu8yIAfyhe8oWDK+ZXHQZYuJSjmS2eu1FdedTLIVe9lZKbhd6wPm0
         dpdhJ3uv6Pw/8lmEhcdIsv69wVQLgMk6DCggDD3G8CrIzlB8mGT63HSpbneT0VOQ/Mmw
         BW7g==
X-Gm-Message-State: AOJu0YxlCwmWNc5eyC746Epf5CtXBcXmkAPhAM5VAFBWV6RY7+OBGK98
        4jVp54D5Db+/aLGgWHReAeSSHHf8dATVCbryNqeZwg==
X-Google-Smtp-Source: AGHT+IF8m9/dolIjze2DM/19manJbtvxU46XYYD/FPUgWfcyv/9Au2xW7fvpQiGn/pTlQ8Qm/S/sTFpl1d3TjulLc0g=
X-Received: by 2002:a05:6122:40e:b0:495:bd33:d1f8 with SMTP id
 e14-20020a056122040e00b00495bd33d1f8mr8834996vkd.13.1694504712752; Tue, 12
 Sep 2023 00:45:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230901112926.13216-1-brgl@bgdev.pl> <20230901112926.13216-2-brgl@bgdev.pl>
 <CACRpkdY4nqNv6Xt0hO13ohghWtxyTgUw7PNorDgfnye-CSmZ7g@mail.gmail.com>
In-Reply-To: <CACRpkdY4nqNv6Xt0hO13ohghWtxyTgUw7PNorDgfnye-CSmZ7g@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 12 Sep 2023 09:45:02 +0200
Message-ID: <CAMRc=McYrkeUWgMJgMA+BEHUeTDDASmYGTiGWz6_A_Tf8+CK4A@mail.gmail.com>
Subject: Re: [PATCH 1/3] pinctrl: da9062: add missing include
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Support Opensource <support.opensource@diasemi.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 12, 2023 at 9:30=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Fri, Sep 1, 2023 at 1:29=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > gpiod_is_active_low() is defined in linux/gpio/consumer.h. It's only
> > because we're pulling in the gpiolib.h private header that we get this
> > declaration implicitly but let's fix it as that is going away soon.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> For allt three patches.
> Just apply them to the GPIO tree, that's easiest!
>
> Yours,
> Linus Walleij

Ok, queued, thanks!

Bart
