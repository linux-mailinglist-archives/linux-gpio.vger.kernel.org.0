Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0FB51F50FC
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2020 11:14:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbgFJJO6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Jun 2020 05:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726948AbgFJJO5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Jun 2020 05:14:57 -0400
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com [IPv6:2607:f8b0:4864:20::842])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 895A0C03E96B
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 02:14:57 -0700 (PDT)
Received: by mail-qt1-x842.google.com with SMTP id k22so1159420qtm.6
        for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2020 02:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=SBtPGgE9qdJflgn4DQLaNFra5KvxmwclfVQj0PL/4CA=;
        b=VAmyMGyv6H8k03ivOtSyLiLRExv8+vgAAFSoG3XPB2+vhh09y9s8jfY8L0On0lxZGm
         5A9xjWH8raLRG680PoG2RnWEHdFAwt5aaOD92sLTLE4CiUEjlDAzQR1uzTbTLSiyoyif
         2fAgslFZH3viPUHk4jX2mS+3q0E8nA8fKmcBPqe5EWTRDiPkRAl68UdSBqXznu6sbZm5
         qcQLxD+rX+kKz+dVA4tV5IDpV0Lg9MYvWEgEmvb7i7ZGu2h8Dr0U8AYCiYDEaN71RiS6
         PxBhillZXGqttN3j8iqK7k3GTTe94J/7nlDUQqL6j7MWTUYVjJ8OAb9ChpXiKmNhYA8E
         vJCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=SBtPGgE9qdJflgn4DQLaNFra5KvxmwclfVQj0PL/4CA=;
        b=I9e3ua9/t1WV5labWdILQBIXSFVoSUFtGdBN7mnZhmDRWUKCpRIVT7FkTA3uL+5fw/
         zD97k2iznQXEnWoy+GN2jRMu9pSXx2eKXCATg0BQsGLEVS74a/BFFP1rS47VGiy43yRf
         4rJPslLR2E0tAp683xNjKylGljZnKa+qVDwIVKXZlwr0wWvxZjWpVEUJ4SQ5dcfPRGYk
         e9I5VRuYq9gU01MJ8kDcO006/CraFpHFk8jtFBx8F9edNeiuzbNZp5TXufdL40H8x9Mg
         b0ywHJzQ9Yt1hM1bQM9lTVUYEatc+pvrKgh/+PoskQWM4LwVeyk/YuBSWpKKl1bwW7Vx
         c2yg==
X-Gm-Message-State: AOAM533kc0dhUX71Ex6OBwtQ+h+G3axNte8kMjeGoemTDdDO33Sb4Y6u
        9kWWJkZOv/dP7vRDc4dGdGSozOzRI0EsIynEbQAL4w==
X-Google-Smtp-Source: ABdhPJwdaN2HPQUAqzmLFFlf3iVbSsUplE5LPCnjLu9JEIi+ixsonGl+1PLeI3HL+RAB3dEgno/+OPRqatLmRrBnwXc=
X-Received: by 2002:ac8:23fb:: with SMTP id r56mr2135833qtr.197.1591780496712;
 Wed, 10 Jun 2020 02:14:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200602141048.1995-1-warthog618@gmail.com> <CACRpkdbVmrjgqXHvav3JWmncrKhNnroJKvTYm57dgKu1VrVfUQ@mail.gmail.com>
In-Reply-To: <CACRpkdbVmrjgqXHvav3JWmncrKhNnroJKvTYm57dgKu1VrVfUQ@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 10 Jun 2020 11:14:45 +0200
Message-ID: <CAMpxmJVe=YqTmLyW28-uc=qfUauT-kHQ6psMbsMRXF=v7b8B3g@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: split character device into gpiolib-cdev
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Kent Gibson <warthog618@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

=C5=9Br., 10 cze 2020 o 11:13 Linus Walleij <linus.walleij@linaro.org> napi=
sa=C5=82(a):
>
> On Tue, Jun 2, 2020 at 4:11 PM Kent Gibson <warthog618@gmail.com> wrote:
>
> > Split the cdev specific functionality out of gpiolib.c and into
> > gpiolib-cdev.c. This improves the readability and maintainability of bo=
th
> > the cdev and core gpiolib code.
> >
> > Suggested-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
> Patch applied as early v5.9 development.
>
> I will include it into linux-next after v5.8-rc1 is out.
>

Hi Linus,

FYI there's a v3 already on the list with a minor fix.

Bart
