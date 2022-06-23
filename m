Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D4FB558A94
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Jun 2022 23:18:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbiFWVS5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Jun 2022 17:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbiFWVS4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jun 2022 17:18:56 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33EB64B872
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 14:18:56 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id lw20so806728ejb.4
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jun 2022 14:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FUxR+cqiRYV0Qbk6MI+lvTXui54eo2DuRPBlfrSDOCo=;
        b=jxIl4KpnOuEvLhR18SGx5SJGw76pdlcr/Hs1uaBbgVmUGQykaY1G7uXvkWTM7ArFKM
         rGtrNsJBuuFJtMGCui0cOT81Ihar38uhH3GZbyoXYmV/nTujfkZoYZ7D1njzR1SMIXB0
         R6oc/aK4OCcR+jhnnjA4piMT/E9t1MDx3MzWiIgIlWNTRyL8IxZjiaNi9587oVocHxdi
         mnuWAkTrD/GJkLa6XW0jZTMu6pHA9vkFC+mHnVQNMHmtEDo9H8QRPAfTD3u1HpaGwLk5
         Dn3RCIGVavcdR1Ja7Uvt7UzewtqQFHm9EkUXnlRc9kUQjsy9ozMGpjEb2Nc2cdMEsWYt
         viJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FUxR+cqiRYV0Qbk6MI+lvTXui54eo2DuRPBlfrSDOCo=;
        b=bM8t19doIua5HgIeCSnfk+9Ewfo3Tle/vHNj8NXsNdh1N0ZoTlDBvglKVdaCVCkTvU
         DRq0zveP07XOpgD89uo9QBHK86KlpUlM1L3tCoo6oqLfP2H1rFO5PEJJzxI48nch9sKp
         dadwJbrx9Q2wVAnDr6p2va4fgNfnGnokFVw90oaccjedZ8KINUdxALhh3YdPRt/95//a
         Zi6kxbBk53SfapU+aJP1O/6/XEsW+y9eDCsOMO1QWxZFg1SbLiroVB1T78nEP3wXtK5X
         xNQRdAPYn7s3NxEUKC6kjRW/n18CIiL4QyWm2Kmzq5q5IkNwdOC813kfC9Y4yHhWH6G/
         5Kqw==
X-Gm-Message-State: AJIora+6MU6c6uqxU5V3vHMFW4DMc9Dzi4oTw9fHmoy9OHkykHEPbDxF
        KveHfH9dsNTW59nl2O4Y4LMqOhLAH/XZiPCWICwC3g==
X-Google-Smtp-Source: AGRyM1uqAF59GsD545gVAYGU7kfV3LZ41Y0+GCVyewSzV0CJWbh0RSMS5iJdLKooKDEkGEHPzh6NSYZ+ifkRIRY/NVg=
X-Received: by 2002:a17:907:d29:b0:711:d215:5a5e with SMTP id
 gn41-20020a1709070d2900b00711d2155a5emr9923674ejc.697.1656019134834; Thu, 23
 Jun 2022 14:18:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220617103809.4162-1-stefan.wahren@i2se.com>
In-Reply-To: <20220617103809.4162-1-stefan.wahren@i2se.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 23 Jun 2022 23:18:44 +0200
Message-ID: <CAMRc=Mc1djMk1pfBDwHjE7e2RFnhtBspDhJNT+dtgDwNkzLMeA@mail.gmail.com>
Subject: Re: [PATCH] gpio: mxs: Fix header comment
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 17, 2022 at 12:38 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:
>
> This driver is about MXS GPIO support. MXC is a different platform.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
> ---
>  drivers/gpio/gpio-mxs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpio/gpio-mxs.c b/drivers/gpio/gpio-mxs.c
> index c5166cd47c9c..7f59e5d936c2 100644
> --- a/drivers/gpio/gpio-mxs.c
> +++ b/drivers/gpio/gpio-mxs.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0+
>  //
> -// MXC GPIO support. (c) 2008 Daniel Mack <daniel@caiaq.de>
> +// MXS GPIO support. (c) 2008 Daniel Mack <daniel@caiaq.de>
>  // Copyright 2008 Juergen Beisert, kernel@pengutronix.de
>  //
>  // Based on code from Freescale,
> --
> 2.25.1
>

Applied, thanks!

Bart
