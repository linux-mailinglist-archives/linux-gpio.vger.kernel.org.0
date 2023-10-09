Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 472047BDCC9
	for <lists+linux-gpio@lfdr.de>; Mon,  9 Oct 2023 14:50:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346619AbjJIMuX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 9 Oct 2023 08:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346514AbjJIMuX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 9 Oct 2023 08:50:23 -0400
Received: from mail-vk1-xa2c.google.com (mail-vk1-xa2c.google.com [IPv6:2607:f8b0:4864:20::a2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B84AB
        for <linux-gpio@vger.kernel.org>; Mon,  9 Oct 2023 05:50:21 -0700 (PDT)
Received: by mail-vk1-xa2c.google.com with SMTP id 71dfb90a1353d-49d14708479so1397002e0c.2
        for <linux-gpio@vger.kernel.org>; Mon, 09 Oct 2023 05:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1696855820; x=1697460620; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLWvYmUYdE0xN9B1W9TIs+PCJHSr+Ef1uMZQZXLtR8Q=;
        b=Je6qy/HQlt5Hkfn9IEapBH554UeU88MfqfZt1pn6t5s6wDL9yIA556SHfZoUL5ktJw
         KZKxnpcd0cnSRXgduMozKgoi1y9azdM82GvWUoY9mhnXKlPe8HyXQW/sSEtEKAocc6Ta
         3jrd8ORUnEP1ohvqdwyp7/SeOzfDDFn+gdVJ4ykslCFf9uq3DBHA10an1iTfKVirjowF
         KlW97dBnBMJtyOvec4VpM2hHNWcsaw96im4ram3LUMsaI3wGVk5bSxS0RgbKRSQZaW89
         Z+RNx+3dLgniBxSO++ILFkhuMvBtVZYqbt/IXAiJclu9dkbBX4ZqwiByIE/AdqExqMza
         aN8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696855820; x=1697460620;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fLWvYmUYdE0xN9B1W9TIs+PCJHSr+Ef1uMZQZXLtR8Q=;
        b=CrlIAjHv+E7CuL9kiQIzpnzS5Sx2N4EpjWzFTnBOtcwSm1nkjqyC2Ttu5DhFt3T3Lo
         4v7c2B1Vwo5nVC6g8n8FgLxDzVROM4tYkipYw+KG0yna/xJzNJew/GuQKXmsPWLOs0U+
         v33GQfx/ahox4MmY6i/960vSd/KfX+NmdKLXs/kzCnP9QnczkaGY+KsR4AuCZpYkTNUY
         /+ijSjJSYvpbacqEl53GYAKpv2FC3yvrezuCJrdLd4VGZtoSXAa29NDroysFiGfeZolQ
         IGBI8BmVs8csBCeW6FjRPz2JuBjlEpoHmZCoJjeuCIGSmPwlO1SUHlVuYYGDhhXtFHD+
         6L9A==
X-Gm-Message-State: AOJu0YwZXduTzETVyjtY4ktnSR79TBwYIjRsNvRauogQ7VSNZ30qvQSd
        SJBz9lklHxu5mVK0qdukLEgBc38G1Kep+he4vbXB2Q==
X-Google-Smtp-Source: AGHT+IFaZQHpN4+6inudkN2uqYcpszhAsxEnHU1O2xqvZth+Gse3cBocqCIrOYJ5YrFBZ+hMfeSkQnSqbZAQE39Z67Y=
X-Received: by 2002:a1f:ed02:0:b0:4a0:6fd4:4333 with SMTP id
 l2-20020a1fed02000000b004a06fd44333mr2557626vkh.13.1696855820403; Mon, 09 Oct
 2023 05:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <8bbffb51-96bc-c4b-8d13-f3bbf9a72c2@linux.intel.com>
In-Reply-To: <8bbffb51-96bc-c4b-8d13-f3bbf9a72c2@linux.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 9 Oct 2023 14:50:09 +0200
Message-ID: <CAMRc=MfJ0fkFdXffe+yMqj4aVeq830q4TT05YGszyAa=dqd2UQ@mail.gmail.com>
Subject: Re: [GIT PULL] Immutable branch between pdx86 int3472 branch and GPIO
 due for the v6.7 merge window.
To:     =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 9, 2023 at 2:19=E2=80=AFPM Ilpo J=C3=A4rvinen
<ilpo.jarvinen@linux.intel.com> wrote:
>
> Hi Bart, Linus, et. al.,
>
> Here's a pull-req for merging into the GPIO tree.
> This removes the users for acpi_get_and_request_gpiod() so it
> can be removed.
>
>  - i.
>
>
> The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d=
1d:
>
>   Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-=
x86.git tags/platform-drivers-x86-ib-int3472-v6.7
>
> for you to fetch changes up to 5ccf9873ab2bcb7c480bc2ccea55ec235d9db175:
>
>   platform/x86: int3472: Switch to devm_get_gpiod() (2023-10-06 13:34:58 =
+0300)
>
> ----------------------------------------------------------------
> Immutable branch between pdx86 int3472 branch and GPIO due for the v6.7 m=
erge window.
>
> platform-drivers-x86-ib-int3472-v6.7: v6.6-rc1 + platform-drivers-x86-int=
3472
> for merging into the GPIO subsystem for v6.7.
>
> ----------------------------------------------------------------
> Bartosz Golaszewski (1):
>       platform/x86: int3472: Add new skl_int3472_gpiod_get_from_temp_look=
up() helper
>
> Hans de Goede (3):
>       platform/x86: int3472: Add new skl_int3472_fill_gpiod_lookup() help=
er
>       platform/x86: int3472: Stop using gpiod_toggle_active_low()
>       platform/x86: int3472: Switch to devm_get_gpiod()
>
>  .../platform/x86/intel/int3472/clk_and_regulator.c |  54 ++---------
>  drivers/platform/x86/intel/int3472/common.h        |   7 +-
>  drivers/platform/x86/intel/int3472/discrete.c      | 103 +++++++++++++++=
+-----
>  drivers/platform/x86/intel/int3472/led.c           |  24 +----
>  4 files changed, 94 insertions(+), 94 deletions(-)

Pulled, thank you!

Bart
