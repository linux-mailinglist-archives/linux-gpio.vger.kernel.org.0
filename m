Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 592FD1E1E8B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 May 2020 11:29:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388359AbgEZJ3q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 May 2020 05:29:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388274AbgEZJ3q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 May 2020 05:29:46 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDB3BC03E97E
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 02:29:45 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id p12so15565392qtn.13
        for <linux-gpio@vger.kernel.org>; Tue, 26 May 2020 02:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=lw3cOwmJwQHb+vIOlRMSLQ9fQR46E4EoiL1/0g68wQE=;
        b=NT/cOguZqN/kqrqed8eT5zXnVGtbNUxVfZOli6EJcSoIuxGgso4PoiTyXVx8u6GOjJ
         0fJUwQWWTLQi1mKXhPMbqdBRLmRaHU1RZV0BfACUu6sJOqmFd5DDaISsHWhMD0sUxzwo
         KzDBl5AtLDdAukUrVktJfTp8J3R35ppoq+y0MyLPjL+P/dziXRWq+lrpj1svr228Oyl9
         4NG3k07TnhYtxywiwzf6+X5vHsxP7uyglUXXbUBZ8BWCBc939H6+hhwzbAUo1NZzo18A
         ohNrGF8/moHQMLkexpaqWsEHOgiYEvwuArGH1KYplddtO3gQ7XppXxA7V29UfPI4V7nR
         +JWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=lw3cOwmJwQHb+vIOlRMSLQ9fQR46E4EoiL1/0g68wQE=;
        b=IJkypu7IgSJOTiIdE5F/D4OcXIyyjWmcCK8Ry8vr9nkxLiJex8ASBReVeWAEmG6Cvc
         Bt9a0W/zJfb7+mJUSdNjOkbmpr6ChJEGx0jqrOaEfKayHhtHVWLe0aeau8GvhFYvFA5Z
         ftNZd2sljZb2G4eIInl4zmKvbMsOFpBo7Nmu4pPdwBbRW6oM+vUVkaEJGRYbhQJmbIou
         KY6aXnFoP4BKttJWQBj1IjJI8sblCvKqPs8tV+mUeZ11kcAkmB4kPC2KrSIVIe4s6qw9
         3JTGZAeHlwJIfR2Cl89Fa0bb0PV7CxQmp4Lo3E7JtDWqFOESGdQpZL+X4CJuI+gMszAz
         c62w==
X-Gm-Message-State: AOAM533hL/MsvmTEbBjv6fi/W2gf000dIpcg3zsqYwzuGUpu6RN8uzbS
        VGUFL38cNkg8620EGBfeOl9HXiWpbfL8je3QI4R8JSqnH2k=
X-Google-Smtp-Source: ABdhPJyUOzyfsvY8qVpsyGaNsJZqUfAN8wo7LjOT6I/vwrmDMPUjR/ZU6B8HMCog+6AhVM+Mtxmo6i8e2A60bwwkMrw=
X-Received: by 2002:ac8:1288:: with SMTP id y8mr354856qti.208.1590485384956;
 Tue, 26 May 2020 02:29:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200526081539.3518-1-saraon640529@gmail.com>
In-Reply-To: <20200526081539.3518-1-saraon640529@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 26 May 2020 11:29:33 +0200
Message-ID: <CAMpxmJVWrEuSAse5uvOo-JWGPsKNUwKuHpKtXchHmYDLCA1yeA@mail.gmail.com>
Subject: Re: [PATCH] gpio:gpio-asm28xx-18xx: new driver
To:     Richard Hsu <saraon640529@gmail.com>
Cc:     Richard_Hsu@asmedia.com.tw, Yd_Tseng@asmedia.com.tw,
        Jesse1_Chang@asmedia.com.tw,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 26 maj 2020 o 10:15 Richard Hsu <saraon640529@gmail.com> napisa=C5=82(=
a):
>
> Hi Bartosz Golaszewski and Linux Walleij,
>   Thanks for your reply.I have modified it according to your
> suggestions.And our device is silmilar as AMD South Bridge(amd8111),
> then i just take gpio-amd8111.c in kernel driver source as reference.
> It says that we can't use plain pci_driver mechanism, as the device
> is really a multiple function device,main driver that binds to the
> pci_device is a bus driver.It seems reasonable then i follow it.
>
> Signed-off-by: Richard Hsu <saraon640529@gmail.com>
> ---
>  patch | 44 +++++++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 21 deletions(-)
>
> diff --git a/patch b/patch
> index a713f91..220a8cf 100644
> --- a/patch
> +++ b/patch
> @@ -1,7 +1,7 @@
>  diff -uprN -X linux-5.7.0-rc6/Documentation/dontdiff linux-5.7.0-rc6/dri=
vers/gpio/gpio-asm28xx-18xx.c linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28=
xx-18xx.c
>  --- linux-5.7.0-rc6/drivers/gpio/gpio-asm28xx-18xx.c   1970-01-01 08:00:=
00.000000000 +0800
> -+++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c     2020-05-2=
2 11:55:13.736272177 +0800
> -@@ -0,0 +1,282 @@
> ++++ linux-5.7.0-rc6-patch/drivers/gpio/gpio-asm28xx-18xx.c     2020-05-2=
6 10:41:11.401349769 +0800
> +@@ -0,0 +1,281 @@

Hi Richard,

please read Documentation/process/submitting-patches.rst in the linux
kernel source - it contains information on how to generate patches for
the mailing list. What you sent here is a diff against a patch and
it's useless for review-purposes.

Bart
