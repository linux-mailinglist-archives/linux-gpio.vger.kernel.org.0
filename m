Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED32B8171A
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2019 12:33:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727739AbfHEKdF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Aug 2019 06:33:05 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:44957 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727230AbfHEKdE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 06:33:04 -0400
Received: by mail-lj1-f196.google.com with SMTP id k18so78825449ljc.11
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 03:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=u41rCFVRT5TIJ3WzFOFyBFX+clVgfPodEdyZutaTu+E=;
        b=JAnOjSDww3k0wMC7tRMvLH1EJVHUGgbYraz6NUV4+qPVM6BpUbpsYlBAmLsT42AeNX
         dV+a61ouLe8Ue7j6PfJlmxR8BQcaB/OBny1VFbDkMNFRFYOMzDixYPDzGYCO1k0lkBLL
         4F8HEiLeRhlbwEi7L9XIjsyo/8C7+7eocgK2fMrjL+6y/XzFWrWaniMST8AKs152qsU9
         1sKr6OHrw7D1MRnRp2ni7LQ5O4QgczpxV2l2gumIc3QbjcJ+aWpy67paHz30fXP+72c3
         /cHHlsDRR+2VfQ3WxMtouQ/i5uxoWIXXOtF5exGYJTQiWE0Wu+p7yiWXfK5YpUbptdZC
         zSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=u41rCFVRT5TIJ3WzFOFyBFX+clVgfPodEdyZutaTu+E=;
        b=bdylQ5F32f+8KF1D4ZeJUWgY0qEIyCV+vua1uskPvwdTM15zJ0U5K3BmI62NKXebqL
         EB0vsKVogrbhb0+LT5U12TSlOv8cTAwyxSHh/4HRRsguAQ207ihw2NECxl8b2XRkxiRV
         PhHaF2Hp6TBjuAUS1tNVpPAL9nPlaf/VoLyCzsAncGHMXscJftUUSmmK+DNLAwKU3jm5
         jFyPNuFCgj6QUUU1rsGeP8g/FHkL+pk3TGufsgLAzCW53kIGd02yT/2fImPD5jhe1USV
         gYmuUguBiF/YaAsjXRd2imM6kJUsfsdNpKtSHBi+81lVobh/duzYUfV4iKQtLvqbu7Xb
         fCAg==
X-Gm-Message-State: APjAAAWYlYe+NpirM/QTMZU/BSVwCkvJlxtO5rPes4Ar85fUywvnKvvg
        ElNzozjaW2+No/QtKrCbyMK1CsOMkwpDu1HRPyXVNQ==
X-Google-Smtp-Source: APXvYqwR1dwZfr1HLWJ7cN516WoABshKlyElWdQnlwPXEJQvNocN+VgY7JTuaxnQRyP1XdPQXdRHl6+Y8x0RSi+a6Aw=
X-Received: by 2002:a2e:2c14:: with SMTP id s20mr16465187ljs.54.1565001183227;
 Mon, 05 Aug 2019 03:33:03 -0700 (PDT)
MIME-Version: 1.0
References: <20190726112812.19665-1-anders.roxell@linaro.org>
In-Reply-To: <20190726112812.19665-1-anders.roxell@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 12:32:52 +0200
Message-ID: <CACRpkdaOe4FvvrVMwLk5_KiMdKVVNm5Z7fSyjPDWKcm5MzxvyQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: rockchip: Mark expected switch fall-through
To:     Anders Roxell <anders.roxell@linaro.org>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 26, 2019 at 1:28 PM Anders Roxell <anders.roxell@linaro.org> wr=
ote:

> When fall-through warnings was enabled by default the following warning
> was starting to show up:
>
> ../drivers/pinctrl/pinctrl-rockchip.c: In function =E2=80=98rockchip_gpio=
_set_config=E2=80=99:
> ../drivers/pinctrl/pinctrl-rockchip.c:2783:3: warning: this statement may=
 fall
>  through [-Wimplicit-fallthrough=3D]
>    rockchip_gpio_set_debounce(gc, offset, true);
>    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/pinctrl/pinctrl-rockchip.c:2795:2: note: here
>   default:
>   ^~~~~~~
>
> Rework so that the compiler doesn't warn about fall-through. Add
> 'return -ENOTSUPP;' to match the comment.
>
> Fixes: d93512ef0f0e ("Makefile: Globally enable fall-through warning")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Patch applied.

Yours,
Linus Walleij
