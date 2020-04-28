Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42B0E1BBA6B
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2020 11:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727030AbgD1J4j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Apr 2020 05:56:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726932AbgD1J4i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Apr 2020 05:56:38 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61D1BC03C1A9
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:56:38 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id u15so20804579ljd.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2020 02:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=dUYMvHNm1S+cpRAgh6CuSzaN8QMyIl6tpzVnoQoDNsE=;
        b=O6oemS2LnyyWHZ8OwOVA5KOWkg8pK08yWXcrww9azpSPIXoqcyZUqaeM+3xVi2ke0u
         +N6PeCK3fdOn6+nxTApK1Ve3c6+2SjX3uanr9QyJK0/7sHiR7ZSG3zOTztgcd/ym8fXa
         o1c6DSg/BSnqC0YDotD1dhY/RN0m/4GXyeUDpgX2b8XUHT9ZLKC5d0wy37aIV2JR2ANF
         edfFxnlJhe5pdtlMc2ZMCQZL0m2MykJTd5yLS1+DHzNuoUFcICYI/41mUidjkTSbpuoD
         9jH0Q7n7ugThfQG3sHPJfC7kpdAmjVEmtmUnEtLuu3ViKE03MeHAGm3FuPRkK6ZQeNTn
         QPQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=dUYMvHNm1S+cpRAgh6CuSzaN8QMyIl6tpzVnoQoDNsE=;
        b=tnA3WqNzelf5+Bf276LPZjegMq/+rJCIFFT4aG0bAWk3RCCOvXPqmxND7eZLjiP3/X
         J7sbyVbcoJwJDWRqZTl97tiSIturZlL821zi9dpppbeYSs6cAcFItYd0S93FMyNp9O4b
         4v554Rt4mMI+DzffwNkm5mNvMeWA7u3bNS2rJl+vToj5RPuAiJIPxAIRu7UVJfVVPciU
         8ImqTOP39l8fgIByUry+/9pRHluaMh8JZw/gVwjbKX3+KPc7Ol5vVcoYW3k5GHPzYa9q
         q+JEQRBn+KaAkbu3RY7n+wxcy7VbI9w9K0jMJZ7m2DB5r7LQxg8QjF4e8khIyB3DK+XA
         h89Q==
X-Gm-Message-State: AGi0PuaWsjkQeZwXiTrK4Y1IaD8qp+ijP7olK/cRViTnnadJcVkQn3gq
        rv3V5EVg8b9g9qpI42RoQZH4RQfZZiG7Sa9wi3lFqQ==
X-Google-Smtp-Source: APiQypJlwiuxB4ab5wQqVxYuJTJqT6PIowMT3AHLQ+WNf0e2mYCYXwqrwm6FFZORaGA6n3AkLGy307SzZEMgXnQ6Ro8=
X-Received: by 2002:a2e:b6cf:: with SMTP id m15mr16549672ljo.168.1588067796808;
 Tue, 28 Apr 2020 02:56:36 -0700 (PDT)
MIME-Version: 1.0
References: <20200417073512.42350-1-yanaijie@huawei.com>
In-Reply-To: <20200417073512.42350-1-yanaijie@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 28 Apr 2020 11:56:25 +0200
Message-ID: <CACRpkdaH1bet-iBxB7pM9-_swpXkuUiMeg6jwTyx2j8WiB2G_g@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: nomadik: db8500: remove some unused symbols
To:     Jason Yan <yanaijie@huawei.com>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 9:08 AM Jason Yan <yanaijie@huawei.com> wrote:

> Fix the following gcc warning:
>
> drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:899:20: warning:
> =E2=80=98sbag_groups=E2=80=99 defined but not used [-Wunused-const-variab=
le=3D]
>  DB8500_FUNC_GROUPS(sbag, "sbag_oc2_1", "sbag_oc4_1");
>                     ^
> drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:570:23: warning:
> =E2=80=98ipgpio6_c_2_pins=E2=80=99 defined but not used [-Wunused-const-v=
ariable=3D]
>  static const unsigned ipgpio6_c_2_pins[] =3D { DB8500_PIN_G3 };
>                        ^~~~~~~~~~~~~~~~
> drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:472:23: warning:
> =E2=80=98mc1dir_a_1_pins=E2=80=99 defined but not used [-Wunused-const-va=
riable=3D]
>  static const unsigned mc1dir_a_1_pins[] =3D { DB8500_PIN_AH13,
> DB8500_PIN_AG12,
>                        ^~~~~~~~~~~~~~~
> drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:453:23: warning:
> =E2=80=98modem_a_1_pins=E2=80=99 defined but not used [-Wunused-const-var=
iable=3D]
>  static const unsigned modem_a_1_pins[] =3D { DB8500_PIN_D22,
> DB8500_PIN_C23,
>                        ^~~~~~~~~~~~~~
> drivers/pinctrl/nomadik/pinctrl-nomadik-db8500.c:430:23: warning:
> =E2=80=98kpskaskb_a_1_pins=E2=80=99 defined but not used [-Wunused-const-=
variable=3D]
>  static const unsigned kpskaskb_a_1_pins[] =3D { DB8500_PIN_D17,
> DB8500_PIN_D16 };
>                        ^~~~~~~~~~~~~~~~~
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>

These should not be deleted but used properly. I've sent another
patch fixing the problem and adding you as Reported-by.

Yours,
Linus Walleij
