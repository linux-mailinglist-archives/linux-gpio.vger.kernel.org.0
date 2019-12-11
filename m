Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04C4011A68B
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2019 10:14:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbfLKJOa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Dec 2019 04:14:30 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:40757 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727829AbfLKJO3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2019 04:14:29 -0500
Received: by mail-qv1-f68.google.com with SMTP id k10so3825597qve.7
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2019 01:14:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r0gVQXuC6a8DJTUTEo5suxWb6NqvG3m1Y5eO4L17BxU=;
        b=bNjp2CSwAwJBRkHlE21fA2+oQHaa1seGpALK5gMpFZBRUweh616cc6A6NjuV3+jP7t
         g+avl1kCd9byKb6OLRWoCARmcnjUMCDWZEVNMYHwcwq2N14q+0Zs5gKmbn2v8QLkXlTu
         qYT1j3fhiE+HvHPvq+5C8dY3pDcfH8rPaHt6qHrXYFCzpU3tQuLtDKmRQXWEU0wL1bu3
         XD9Fpr5nzGis98WDLXJ2dEtgi9E9jwJki0nduViVaSEEfNJCDk7B2WzJW4nUmbeKRtSE
         EwrMoY4b/3ywG1wFw8EbFjXcoFkI0JmL0qp722LB/JC0izmuz7ikSSrBNnztdHuLMnYW
         93cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r0gVQXuC6a8DJTUTEo5suxWb6NqvG3m1Y5eO4L17BxU=;
        b=aPd2QoQAt2YxyNsz2fmaqoqciSyDs4Ugo++vuT2w2h7kJYz9yYbcExXg0JPMNy207x
         GRmAaeR30nUm3eLierP3lKSdX24iZLFtdnZYpgEQxM5a19h0jaRX2OOHcUQx+F5HWH0G
         PFMvUgQfQlm6fQCiUyU/m7HoDgncdLX7mf15gvmln8gBuVgry4wSN+rxM83YywF/CbHd
         z7aTWFKDuTdrLeqUWoeGf36qj7m1axEpXDRL9g/Zc4UDEwziqZbGqKKb4I2iOouuKx6c
         Ca+o6zv6a6hz3zR6L0ZG3HpSfbCUXtY5SlqFPOvmuUdxNJxIZfecVjBvdAX6pZwYa3Tf
         POBQ==
X-Gm-Message-State: APjAAAUIUD4/ed+hcJf6iMB9ZRzf2cnp+33dvKel6ujet/3DkyxEFvpo
        FvjT/t55Kx6XHZDKbLv0QXhwTTm9Dm5BgFnmWaIcCQ==
X-Google-Smtp-Source: APXvYqzjKg+vHur/oJLRJqO8JGriJMPsHU3Yxw2c45bVX3cqASfK5p6p7v8TgWUig6+CE+I07XNmKBR7AxR/u500qXY=
X-Received: by 2002:a0c:f990:: with SMTP id t16mr1951160qvn.134.1576055669090;
 Wed, 11 Dec 2019 01:14:29 -0800 (PST)
MIME-Version: 1.0
References: <20191210195414.705239-1-arnd@arndb.de> <01669f6c5d0e40c7a410da2dcce6c9e825e4a1d4.camel@alliedtelesis.co.nz>
In-Reply-To: <01669f6c5d0e40c7a410da2dcce6c9e825e4a1d4.camel@alliedtelesis.co.nz>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Wed, 11 Dec 2019 10:14:18 +0100
Message-ID: <CAMpxmJVuN5vqA1j0ddpctJQJJMPu1EnakduO2rJnBo3Ao==Enw@mail.gmail.com>
Subject: Re: [PATCH] gpio: xgs-iproc: remove __exit annotation for iproc_gpio_remove
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "arnd@arndb.de" <arnd@arndb.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "scott.branden@broadcom.com" <scott.branden@broadcom.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "yoshihiro.shimoda.uh@renesas.com" <yoshihiro.shimoda.uh@renesas.com>,
        "yuehaibing@huawei.com" <yuehaibing@huawei.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "rjui@broadcom.com" <rjui@broadcom.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

wt., 10 gru 2019 o 21:24 Chris Packham
<Chris.Packham@alliedtelesis.co.nz> napisa=C5=82(a):
>
> On Tue, 2019-12-10 at 20:54 +0100, Arnd Bergmann wrote:
> > When built into the kernel, the driver causes a link problem:
> >
> > `iproc_gpio_remove' referenced in section `.data' of drivers/gpio/gpio-=
xgs-iproc.o: defined in discarded section `.exit.text' of drivers/gpio/gpio=
-xgs-iproc.o
> >
> > Remove the incorrect annotation.
> >
> > Fixes: 6a41b6c5fc20 ("gpio: Add xgs-iproc driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
>
> What's the current best practice w.r.t.__init and __exit? I seem to
> have messed this up on multiple fronts.
>

Applied for fixes.

Bartosz
