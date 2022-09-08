Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66F065B1D6B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 14:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229842AbiIHMm5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 08:42:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbiIHMmt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 08:42:49 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97E1E6206
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 05:42:45 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id nc14so37727182ejc.4
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 05:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5Wm7fqGHObSvGBpTTKpMN3/jVUagRJP8IWiLmuY+UK4=;
        b=kQNWM4aUvd/neKvXU8ezIZMSV5uRFq9nllO2SrHG4KO29Oodp9L+NR+s+LsSwgJdId
         gTzWh7txP3qSLKA12XQCkBcA6SkWbZKNNys+PI7T0L7aYnSaIEjx6yfHmO/wnQR19LpF
         O0u7Y0nALYNOzoKO6GVKW+V56i+ghPU9qeByq/+G66xcHxdlaXc/XlG3G6OJ7YhyYAjI
         fT91CsbB5+wdBY44wdNwl03zplabI0yL7O5/LfRa2rDUpa+eVoNr/bj0TWMG48t4kaRQ
         xV6HURdytVZ7kgyFNXdBMqbqNB/B/+p6Wh0H1jTQwhgIc6msQjyQp1rgI/ZoU5MkA5s3
         3P7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5Wm7fqGHObSvGBpTTKpMN3/jVUagRJP8IWiLmuY+UK4=;
        b=reVrT5djudZkL90HiGR9IRewtxPXnL9wP3ifERSX5Oi9ZEgTWBVDhzsc7ty6QSJqIn
         pKTEcVBG7JiuV5foIhOP4V6J8OULTG+nj+FrYzrynCok7iVr57DTF4Cuxf3/3zdvR/eh
         wPQNfTW7IZbfnctNrUF4D5TBLmIORg4bHHAERy3WAVJfVrZ2z3dWz7cGZnMClUpPGtDB
         w6F60Oa8me/jhoHwZch7+ykbTfAZ9pKgTVmvk+j/nFP0c1JgS1jM5VohbmZW/K5pZsKE
         6dxMIFAE7OjL9dW31lLhdKc2pEIBNz0CD7R5etPKMPQDNBfG61gA5u78+oSL5uI40MSB
         NlnQ==
X-Gm-Message-State: ACgBeo2vBVdZTTYfiGcY03zvWyX/7J842Fk8lk3fo8V6J+7DVKSv0b7L
        XUYUgARC4QtUDwvvl4714KeD1FFQUsOhahC0xEhG1Q==
X-Google-Smtp-Source: AA6agR516yrZB/gyDzPJ7B2l7ixSAyFQL9kXwrwHNeWNdAcGP3p6ZLBsg83txQLc3HWvBrPBVJphHEBRmq7mmZ8U8os=
X-Received: by 2002:a17:907:a420:b0:765:70a4:c101 with SMTP id
 sg32-20020a170907a42000b0076570a4c101mr5950348ejc.526.1662640964319; Thu, 08
 Sep 2022 05:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220908053949.3564796-1-dmitry.torokhov@gmail.com>
In-Reply-To: <20220908053949.3564796-1-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 14:42:33 +0200
Message-ID: <CACRpkdZbF_xUGLWD09tsTM8Vtbu1hpW9oOhpmMiOdXe3rCeeUg@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpiolib: of: do not ignore requested index when
 applying quirks
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 8, 2022 at 7:40 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> We should not ignore index passed into of_find_gpio() when handling
> quirks. While in practice this change will not have any effect, it
> will allow consolidate quirk handling.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
