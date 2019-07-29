Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B93179B2F
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2019 23:36:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388692AbfG2Vgb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Jul 2019 17:36:31 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41731 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388522AbfG2Vgb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Jul 2019 17:36:31 -0400
Received: by mail-lj1-f194.google.com with SMTP id d24so60017485ljg.8
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2019 14:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m+uKl3DmiY8dW8TGLrxGk/fNxMPrGaMpCCMkd3OfZgg=;
        b=XiIC1pelgzO+M5iJgoHNGaFTyBt4JyMKlOsZ+f6+nAfV9oBGWKwb7dU3vhdcbctnq4
         VCEcyn7DrLpIeckFKbi/1dLpgiJtSsuxe2S9dKXC/RJ85kB5lYrKh0T7ZZ2A+Lsc96lj
         RZiZhzpeU87NdQRdREAH+PhFluvzgtMhf4R85gbIovSIzVN07VdPFBUZ2DymoY4rkNq4
         t6ipq/cHvX4AzeY+CiEFb87Q6Dkc26eS4keDhi13IS/16+QXJpHdfi7+Nw7ttGvzKd41
         Jghzth8iqGKCq40V9ct1stdODtFsAPaRDLUJcHC+kuGT94mQMJ25XhbNwswKtuNkNFaR
         f6Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m+uKl3DmiY8dW8TGLrxGk/fNxMPrGaMpCCMkd3OfZgg=;
        b=Q8JLnsJe9AvZuGHc0JXHDsnvtWeXTW4Tt4KDQ72kFIgHjJzJeSlqtl96rjFePIwTnt
         TqeMMu08Cyngrs8Qsh9G2PW856q9Xp/hkYVNfHokGKFz0vKLGSIIY5C+8GM1ry63Ir3f
         oXE0eIMPtwQ0Uuib11zu21EoKt+jpXdZAKIRrmKZxt09AERsRA+BgtN2mImZTs/ghnyM
         ngYyUdN9Y+Jo5RBTRk/xJIYoKQ3Cs+FoyCbsl1S/xR0DkEI/aixNs9/FGcWhhkHEUFw5
         m/lAMDVJvVeUdqnOsAL/zHjryP7izJy0DeAAXLD/RsX2tUAvdLNDq2NE2vN5OYrRJrlQ
         xtBg==
X-Gm-Message-State: APjAAAXTFVpw6LgMGvXPoFUb1qQyYSyvlMr1GL9r6lNyXenYvgBV+1Sp
        /RV0PcjB1HAZOctyqC5afZwdwtO/dKm152oDq/C1wA==
X-Google-Smtp-Source: APXvYqzpGev1ZgT7UDoBmrvnEtfYU3dY7RXU+9rHQOkrcjsAH41AmeGJd40sfREgQBCjTHKjCZUWI87ScfuEsB+15wM=
X-Received: by 2002:a2e:9593:: with SMTP id w19mr12040674ljh.69.1564436189593;
 Mon, 29 Jul 2019 14:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190711142457.37028-1-yuehaibing@huawei.com>
In-Reply-To: <20190711142457.37028-1-yuehaibing@huawei.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 29 Jul 2019 23:36:18 +0200
Message-ID: <CACRpkdbBWPN8px=5gxeXWifDz5gCdbqWvgk6ZPdXS6Pa_hKO0g@mail.gmail.com>
Subject: Re: [PATCH -next] pinctrl: aspeed: Make aspeed_pinmux_ips static
To:     YueHaibing <yuehaibing@huawei.com>
Cc:     Andrew Jeffery <andrew@aj.id.au>, Joel Stanley <joel@jms.id.au>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 11, 2019 at 4:25 PM YueHaibing <yuehaibing@huawei.com> wrote:

> Fix sparse warning:
>
> drivers/pinctrl/aspeed/pinmux-aspeed.c:8:12: warning:
>  symbol 'aspeed_pinmux_ips' was not declared. Should it be static?
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Patch applied with Andrew's ACK.

Yours,
Linus Walleij
