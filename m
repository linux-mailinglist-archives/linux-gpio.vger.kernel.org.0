Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1D710550EA
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 15:55:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726659AbfFYNzU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 09:55:20 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:32878 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbfFYNzO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 09:55:14 -0400
Received: by mail-lf1-f68.google.com with SMTP id y17so12725032lfe.0
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 06:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FMqlAp58Lm3MdFL1/oLfn8r6VrExYv+Qlr+51/E8+CI=;
        b=HBCIky80cw7b2VS9iWLL0Ww6oY2T4Czf/fAe41KlVer5eCS70N2T9N6i+HMJWbByYC
         s+fMTPIHVitU4jqxF2KA93qimnYLgc650UEYlCKuf1gfuyyQ33gDonObiXqXZe+gjs8O
         waAx5wLbgWDVZc3uKTHvWP6rM/o1xiWun8bYPuYn4HvHH+wq2MYhGCsRznPA1MyLWkA1
         /ZYctoRM+yOUBYmZXs29rpsTNWSfiQjdOe2MFcf487r4GU8KskEXpOGER/nADBI5ZvoK
         ABMpuOMCDGJwjkf6gnqacfGJeTxgqj9SsNuIcRnbDZ0aJsB+cfzaUGMtzb0UkeOYZUqV
         97DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FMqlAp58Lm3MdFL1/oLfn8r6VrExYv+Qlr+51/E8+CI=;
        b=WYC5HCD/qa5q9n6s43bEcZ+Gq4yQtzX8e4rlgy2UUD3IIAzslbKzfZDYa7cRwUsS1z
         K4zUmvGMtUFvDEgj4eBl1m3TnQK8iM0dmbl3PgG3ia8q7N0YvnT3SXDpvtICkgrXsyax
         qD0oOhU9DKKBq7VLW3Y2c06KRefkpHlZpBQnx/k5gkLlLWGybwmsjGN7vzhMQj/tKVAd
         wCJppDFT3LsePpDjg56xCT7QH43D3dPsAn3ffQ3MAs3r9nrW8eCfAPjJ4N2Vuq8pKx/u
         CgAoIUD1ymbZG2Bz7m3W8UgprTUQWHjmHXeRCqxCGjk/U1kQtxZqIiu1Mfb08jIrvQI7
         yg2g==
X-Gm-Message-State: APjAAAWEFcW0n3cMxPrG1CyQpqnhPS8nsKYyJ0apxTw7lVQUmWjyvtew
        P+GY77Hl/ZZ72wHhXUVTGWszkgfOba2pJ5D/cmwDkRHs
X-Google-Smtp-Source: APXvYqx4zfh4abumT8QCcMwPsQ4kGAi3uQZl6qg+f4xwtibi7ko9pWMCa9GCVANnvSnW7NG6HG7bW+OUwbld6KRMjBE=
X-Received: by 2002:ac2:598d:: with SMTP id w13mr250893lfn.165.1561470912218;
 Tue, 25 Jun 2019 06:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190623043801.14040-1-icenowy@aosc.io> <20190623043801.14040-6-icenowy@aosc.io>
In-Reply-To: <20190623043801.14040-6-icenowy@aosc.io>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 15:55:00 +0200
Message-ID: <CACRpkdbbxgeGPh1oKfyKKOMhpXiz4sQWjZv23FbYaafCz6NyCQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/9] dt-bindings: vendor-prefixes: add SoChip
To:     Icenowy Zheng <icenowy@aosc.io>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jun 23, 2019 at 6:39 AM Icenowy Zheng <icenowy@aosc.io> wrote:

> Shenzhen SoChip Technology Co., Ltd. is a hardware vendor that produces
> EVBs with Allwinner chips. There's also a SoC named S3 that is developed
> by Allwinner (based on Allwinner V3/V3s) but branded SoChip.
>
> Add the vendor prefix for SoChip.
>
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> No changes in v3.
>
> Changes in v2:
> - Add the review tag by Rob.

Should I apply this to the pinctrl tree? Rob?

Yours,
Linus Walleij
