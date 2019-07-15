Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7824D69985
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jul 2019 19:04:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730914AbfGORDp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jul 2019 13:03:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:51330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730782AbfGORDp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jul 2019 13:03:45 -0400
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 454392080A;
        Mon, 15 Jul 2019 17:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563210224;
        bh=rjrlrnQPDBPyEI2VvOI7m0hccqKp54THKXzQCNuj7e8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rD0dF+yCPBgLJ83N++laHPgUXgCYGAMz72tCRtdR8UGZKaN70hvg/XOtOAQglbDmg
         G89e88qOwY2fe8WqBu5ApgXpAqOOVcczcWs2prqWcWewX7h8rF6gJN105q/T1aiRvU
         USG4hd3jDr+PTIiK0elLNX7e1NozVpX8HYEvRdtA=
Received: by mail-qt1-f181.google.com with SMTP id w17so16369330qto.10;
        Mon, 15 Jul 2019 10:03:44 -0700 (PDT)
X-Gm-Message-State: APjAAAX64xkwZdlrM4yLU4NvYSbGWek+DmWwPIoiRU2QI344R+MHMJ8w
        Ibzodl8cqPpnLXXTnse2h/eJHJ+Sni+uGwKpJQ==
X-Google-Smtp-Source: APXvYqwJvWYWvEZ7jhvuIO0kny3nJ2FG1ki4BA/d03vXMpzs2ob165VOtQejHnSTXliJm/t+yYCx8Ni0kj3f+zn0LUM=
X-Received: by 2002:ac8:368a:: with SMTP id a10mr19043100qtc.143.1563210223567;
 Mon, 15 Jul 2019 10:03:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190713034634.44585-1-icenowy@aosc.io> <20190713034634.44585-8-icenowy@aosc.io>
In-Reply-To: <20190713034634.44585-8-icenowy@aosc.io>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 15 Jul 2019 11:03:32 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLk0EkF5YK6AvK0JFMH7JbdFvYK2XKh37rJv651DZ_M2g@mail.gmail.com>
Message-ID: <CAL_JsqLk0EkF5YK6AvK0JFMH7JbdFvYK2XKh37rJv651DZ_M2g@mail.gmail.com>
Subject: Re: [PATCH v4 7/8] dt-bindings: arm: sunxi: add binding for Lichee
 Zero Plus core board
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 12, 2019 at 9:49 PM Icenowy Zheng <icenowy@aosc.io> wrote:
>
> The Lichee Zero Plus is a core board made by Sipeed, with a microUSB
> connector on it, TF slot or WSON8 SD chip, optional eMMC or SPI Flash.
> It has a gold finger connector for expansion, and UART is available from
> reserved pins w/ 2.54mm pitch. The board can use either SoChip S3 or
> Allwinner V3L SoCs.
>
> Add the device tree binding of the basic version of the core board --
> w/o eMMC or SPI Flash, w/ TF slot or WSON8 SD, and use S3 SoC.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> No changes since v3.
>
> Patch introduced in v2.
>
>  Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>


Rob
