Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1750812F669
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2020 10:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727436AbgACJv0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jan 2020 04:51:26 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:35420 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727443AbgACJvV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jan 2020 04:51:21 -0500
Received: by mail-qk1-f194.google.com with SMTP id z76so33695625qka.2
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2020 01:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=m2l4ZP00y1MciphnLaoZDMF/+IkQks5KZaGyrGhDRiA=;
        b=cG4ow4LHRj767jnNAQOpyl17Q+p40TAAcPfpSpHHXDGlrwj62Hpbce+n9FDrk+qkc/
         hF5ZyqmmFsJTtYTiw79voWF6jUJzD3jMMLxaKlR24Yfx0wH19vRA84WzFpBPdLB301Wn
         oDHYiFn+x4VsG0+cQjGtKP+AgiFhJEl2gny+42Vv2QuoSuDmtZTYXxHfkb2SYQSXio5l
         4izdl3cbPeqe/fUEgmo7jINRJHhXeZzjP7rcRM1zIfCdONmAYkusOFVw3KH4tD5KGrsX
         B2TTgSy+6TGCiaGzC+uIdpJ7YevNhC6HmCAOCMdMswOZwgLLOkvTEExLz90pSslcmLhv
         3Jtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=m2l4ZP00y1MciphnLaoZDMF/+IkQks5KZaGyrGhDRiA=;
        b=fYjhQYkmwEKjQZxRb33USpkkYqyM9LsHnc8FwQcQ2hNClDhYHT/97712KGxJwbU3HS
         o0FntFwT1nXD6j4dpBbYVe9JSYwQbyISh+PEe39rnWjvvI0jygBcMzBoS/blslqLnSCe
         ZwX4sh0zD5yP9KF6rDO7NNhvR1S/VGHeC95AJNVAnQPok2N6ztvCa3RaZzb4iZ2e0k37
         Jk3v4fb7n53FaK0YLcoBJSzkh1l1GLnzcFD18I1qXqDBrZNAh0X+iQRJ1+Gawu3u5czh
         RaDyPxDF4hsOR/roCUKmCbqaqc8Ji2OxpokY+LiF53ztsx/LVacTu2j7gatyLbsWELKA
         9GXA==
X-Gm-Message-State: APjAAAWdHWYfRF6xhKEAlw4HbPmnqUp9+0qdz4KNK4Lhtdi7athqTvJu
        xG+2r+mY83tZWU/ce/gz4mO7p9JWw1GxM7c1EH2zDA==
X-Google-Smtp-Source: APXvYqzAZelvEL1bp9L+Dip8BtcvxrfIeDBmaKGivW0X8lJb2LdaJs31IH9b2gpMP+zcFkudxHBKRdWDiyhDv4QqwCw=
X-Received: by 2002:a37:6255:: with SMTP id w82mr71281142qkb.330.1578045080489;
 Fri, 03 Jan 2020 01:51:20 -0800 (PST)
MIME-Version: 1.0
References: <20191230133852.5890-1-geert+renesas@glider.be>
In-Reply-To: <20191230133852.5890-1-geert+renesas@glider.be>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 3 Jan 2020 10:51:09 +0100
Message-ID: <CAMpxmJVN3f5vWZoUpgsM0kocmBYSO=T0OeoG--5rQi9=jk2t2g@mail.gmail.com>
Subject: Re: [PATCH/RFC 0/2] gpio: of: Add DT overlay support for GPIO hogs
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio <linux-gpio@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

pon., 30 gru 2019 o 14:38 Geert Uytterhoeven <geert+renesas@glider.be>
napisa=C5=82(a):
>
>         Hi all,
>
> As GPIO hogs are configured at GPIO controller initialization time,
> adding/removing GPIO hogs in Device Tree overlays currently does not
> work.  Hence this patch series adds support for that, by registering an
> of_reconfig notifier, as is already done for platform, i2c, and SPI
> devices.
>
> Perhaps this would be better served through a pinctrl-gpio driver?
> Pinctrl is already working fine with DT overlays, as the pinctrl-*
> properties are part of the slave device node, and thus looked up at
> slave device node attachment time, not at pin controller initialization
> time.
>
> In my particular use case (talking to SPI devices connected to a PMOD
> connector on the RSK+RZA1 development board), the GPIO performs board
> level muxing of a.o. the SPI MOSI/MISO/SCK signals.  Hence the hog
> really needs to be active only while talking to the SPI device, so the
> muxing could (in theory) be done upon demand.
> But how to describe that in DT, and implement it (using Runtime PM?)?
>

I may be missing the whole picture, but from your description this
sounds like a job for the mux framework. Maybe we could make runtime
PM aware of muxing for this type of use-cases?

Bart
