Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04CD55B1D85
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Sep 2022 14:45:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbiIHMpZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Sep 2022 08:45:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbiIHMpA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Sep 2022 08:45:00 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AFF4361A
        for <linux-gpio@vger.kernel.org>; Thu,  8 Sep 2022 05:44:56 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id r17so10381150ejy.9
        for <linux-gpio@vger.kernel.org>; Thu, 08 Sep 2022 05:44:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=K6qUZl5+GPn+7BF/6m/Yp7nAz6yxcHV9OabZ6yR+OYQ=;
        b=CDxmLKeOeqa4S+vBm4hF/MIJuvxD/AvEPJqo4Km6bdKyzyl4kRwvKaqvYeTPiBHg1y
         hzmhZCvq6Sg39pKZa49pHws40W5eRd3Go45A8Zupn2MKOdP0EQ2Vjy22DljahKG8av0g
         CWo8LaRUTyyPpTPyRxyxTQMeW7SD31ljtgdTHC6Z1twLizOkA+MNkZTybhJDe/FR7EfN
         4SjwfWmp/yZ/G6LFMh+MPm4OBHL4xGc2b/F/DLwvtfRpQP60P6Iz1ELSVweiqQ1R2bft
         iHc5FiqEWXnfsithAioNUL10zGyYyZX+UxHXHfThsWd7T2GzMTSR1k0LpBW0YDxT8b3g
         q8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=K6qUZl5+GPn+7BF/6m/Yp7nAz6yxcHV9OabZ6yR+OYQ=;
        b=p+BigLOVKbrqBXgOxdB0yyslnUJyl+NbEQDLbjm3bxlv/8HZpW4MKuedwOOpz69Yg2
         6/S2c5L7hAuyBN6ExQtA++jNwE3jeJ2T24SlXvWvyKvk8f+50yMTr8IZYDmTA4Jotg3m
         Rp9yQRAAVCPKhhQT1lRbO2bEiml2PR6lrJjXBn/kuEwuaL0CR2jWm0Dh3b3zu7vNLXUx
         +2V0Tr8rVNBVMDn6zEh7XUq2QASjjkLmyMWBuTaREqjFF174/sxmVowbL5XzSNUpw1/w
         xH70M4Zbm5RRf7IOyiVdq6M/uorzMv4KKIXSHyxnKbyIzxPeLP0x7UwLFvY17nZzNtX1
         y1VA==
X-Gm-Message-State: ACgBeo1zFHmIlll55W/DSIxTbhlWz1DL1+n7xj3nsrG9csO3o7OcfHVU
        PjNHhFk0Bu1voy0Vwd/k1PGRsR5KC1ajTY7zSSDFdQ==
X-Google-Smtp-Source: AA6agR41uBQbmOfLvAdqoxkVlanzKuT1aB1nMP2/rCtgmX+ty8jEhraX6QCEawPsHjP9cv9oQyzxvAMCORzczfXuANI=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr6046055ejs.190.1662641094770; Thu, 08
 Sep 2022 05:44:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220908053949.3564796-1-dmitry.torokhov@gmail.com> <20220908053949.3564796-3-dmitry.torokhov@gmail.com>
In-Reply-To: <20220908053949.3564796-3-dmitry.torokhov@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Sep 2022 14:44:43 +0200
Message-ID: <CACRpkdZTbSqdNztSMkj1bju5RALYt4ZxOGS2s5Y9-N1TNv+vqA@mail.gmail.com>
Subject: Re: [PATCH 3/4] gpiolib: rework quirk handling in of_find_gpio()
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

On Thu, Sep 8, 2022 at 7:39 AM Dmitry Torokhov
<dmitry.torokhov@gmail.com> wrote:

> Instead of having a string of "if" statements let's put all quirks into
> an array and iterate over them.
>
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

That's a change I wanted to do but didn't get around to, thanks a lot!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
