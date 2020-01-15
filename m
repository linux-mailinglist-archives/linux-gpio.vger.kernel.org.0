Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EB88A13BD54
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 11:25:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729668AbgAOKZ2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 05:25:28 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:33226 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729650AbgAOKZ2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 05:25:28 -0500
Received: by mail-lj1-f195.google.com with SMTP id y6so17970873lji.0
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jan 2020 02:25:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=eIMmN9FypxjNqmpeIFBlE1z4/mU3fOd3YNJQx4nSeTQ=;
        b=FUP49pW2W+3CTDREc02m6WvFNL9bp9CidBbIss1DBkvF6C7edTrt4tgHqQ+rCTuvFh
         2JwWlHDGLkyateSp4pRLnw3rQkGLCf40EjrO0mWcylUdMpWH1u0J38WwVd25NotK/sa/
         FlBVrBAj5To7L1Nnig91VjMLMn7rccdoj+vIfwQpoksmXAsfRaKjIGQTIa6epyasjfLy
         9yNrx7kHF6AWG576AaIDpFCjj1rpV+42haB6aNpj3hj0tQdJylgF3dnESy07xUKa6+D6
         Acv0MiG1zWbGVH9Sbg2og5fLa/BEAHEsz/gv2CpatUpAUNBYhv2SeJ9QhLXXZKRAzPtE
         ib3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=eIMmN9FypxjNqmpeIFBlE1z4/mU3fOd3YNJQx4nSeTQ=;
        b=gC0dRl7FAf93Yr76QX8JG4XO5Aev1SzCiyrtiV5XvUCz6oC6XnaZacjDUsFDQ3fDsn
         Y0sCvmYnAMM8mwtSObmMmmj1261MYn+tpQF/JiQt2+ZbrPifB0ogYS+yepJgzn1wXLZ6
         9ee5jYx3PcEkSfTSV7QFGCtfzx6xV5qOyBKuvMszmnrnj2mcUzktIvZ/jazp01Eo2pF8
         UXvIlttDv0JQtiCjrJSozV+Ucdc5jttrCo8623JmkHJI1+PI7iJy0oohpn/vnX9DcDdu
         T/HqdSOezeVHYEgsK0dejmdUokGm94vYPtrvSwoyuACCQzIaoOmj1Bw8Uqp3hWMZD9mm
         EtJw==
X-Gm-Message-State: APjAAAVM6nUJKaxo3Gq6lMtH186hKLFNRj3c9cjmmKYkaMmuH/IKxnes
        iFZmnaUCcFAnMuybqmw+nydu0eon93fyprWrp9HXKQ==
X-Google-Smtp-Source: APXvYqzYC+eu0oRa36v1ki6wu6MdPaPpoxkLfIWQpqftXZ+1BuC8JAs7bz0oJooVKdJzWJ+V4rSKGroneRAPySFoQlA=
X-Received: by 2002:a2e:81c3:: with SMTP id s3mr1349648ljg.168.1579083926262;
 Wed, 15 Jan 2020 02:25:26 -0800 (PST)
MIME-Version: 1.0
References: <1579009062-7154-1-git-send-email-zhangshaokun@hisilicon.com>
In-Reply-To: <1579009062-7154-1-git-send-email-zhangshaokun@hisilicon.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 15 Jan 2020 11:25:15 +0100
Message-ID: <CACRpkdZQoc3O27enKiMPDCg_b9BL=+=kwK3jRYX14dMH-M2bxw@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: Remove the unused flags
To:     Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jia-Ju Bai <baijiaju1990@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jan 14, 2020 at 2:38 PM Shaokun Zhang
<zhangshaokun@hisilicon.com> wrote:

> drivers/gpio/gpio-grgpio.c: In function =E2=80=98grgpio_remove=E2=80=99:
> drivers/gpio/gpio-grgpio.c:438:16: warning: unused variable =E2=80=98flag=
s=E2=80=99 [-Wunused-variable]
>   unsigned long flags;
>                  ^
> Fixes: 25d071b3f6db ("gpio: gpio-grgpio: fix possible sleep-in-atomic-con=
text bugs in grgpio_remove()")
> Cc: Jia-Ju Bai <baijiaju1990@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>

Patch applied with the ACKs!

Thanks!
Linus Walleij
