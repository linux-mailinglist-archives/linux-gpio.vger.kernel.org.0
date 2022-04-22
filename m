Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FA4750C366
	for <lists+linux-gpio@lfdr.de>; Sat, 23 Apr 2022 01:10:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232869AbiDVWfs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Apr 2022 18:35:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233258AbiDVWfK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Apr 2022 18:35:10 -0400
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com [IPv6:2607:f8b0:4864:20::1133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33FB921A671
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 14:54:15 -0700 (PDT)
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-2edbd522c21so98512897b3.13
        for <linux-gpio@vger.kernel.org>; Fri, 22 Apr 2022 14:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GEehHjj72r2AOna47w3cx3znoSMliQkRZ/PaHh9O82g=;
        b=gukUpoOhhikm5GMzOucyyxIm9XjrkIFjSP2B8aE7813a4jST6ayvxFg3RqP3hZhnab
         /PuzYOeph4LuVHzKAzQ50dRlFhK5moaMHUnnoQY7m22WYY4gFMV4uKRayxLcqtC9yb5Q
         t3L1M+jLmvjJiSf1rts7yKRowoc8+MvEBxudWRTKNy0pUSJr4WDHCIxtJewAtvxfq5DO
         CAXIeZs0SY34cjPbiht/RPYQPz0IggyN/hR3MtojWO0i2kD5T8vJGG5zRrcD0xkYgBHL
         0j+8hQh7imj1KLdIfnE9BwiuwlD+G1JDEMmzuWap30UjVfNU0t9L5HfVA4Igc9sShDpp
         pLZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GEehHjj72r2AOna47w3cx3znoSMliQkRZ/PaHh9O82g=;
        b=RSHYx0PuXv7edYkRhLc+2NxIletSmcGpirJcdnuOa7RhL5e/k11hkMVF7ccNDFdx+V
         JHZDdZcJm531NW1VViPiq6tXyg/wdfneGIUjv5ihmVZOuW0mypoF+R9IRGQ0tZyD/JAG
         aZCdHDaJgtDUXssfeGmuJuLKoVC+0bgw6hvt0HSi+5zTxcymOm6QZNxLdr9y7TWRyq08
         TXvgYA/0e62w/kgHuTJLXygja+itHxUh+LAqpqfdFvDscN8Vwaw91ewhntqkV4ymXcML
         iKNRSG75ThXgQXLmlnwYmxOsef63vWV/0dL9WzES5FVuYW/98gad0YlcuFd4uPIc3XsZ
         rR4w==
X-Gm-Message-State: AOAM531tLLoTbIzFkIimxXF4CaGtPEj+vTjybPaM5rIpL1LIOraiGcte
        u6CyHu9VcdcssZwtuhR25P0f13oqE2An3bewdbtKTJ42feo=
X-Google-Smtp-Source: ABdhPJzQleg4D/3UjQYbj9410Yq4Xhp5O4MlHotUi6VOtw7DYRI3VosAFiqqLTc8UjtHvBv5bLqge2jOjtPM5fZh61E=
X-Received: by 2002:a81:1d48:0:b0:2f1:8ebf:25f3 with SMTP id
 d69-20020a811d48000000b002f18ebf25f3mr6863528ywd.118.1650664454432; Fri, 22
 Apr 2022 14:54:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220420065102.44083-1-eagle.alexander923@gmail.com>
In-Reply-To: <20220420065102.44083-1-eagle.alexander923@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 22 Apr 2022 23:54:03 +0200
Message-ID: <CACRpkdZuqGFeJ9BN+uAFw50W9zyNLmOzWZGvvr4D5tqUODae9g@mail.gmail.com>
Subject: Re: [PATCH] gpio: syscon: Remove usage of syscon_regmap_lookup_by_compatible
To:     Alexander Shiyan <eagle.alexander923@gmail.com>
Cc:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 20, 2022 at 8:51 AM Alexander Shiyan
<eagle.alexander923@gmail.com> wrote:

> Since version 5.13, the standard syscon bindings have been added
> to all clps711x DT nodes, so we can now use the more general
> syscon_regmap_lookup_by_phandle function to get the syscon pointer.
>
> This patch removes the usage of the syscon_regmap_lookup_by_compatible
> function as it is no longer used in the driver.
>
> Signed-off-by: Alexander Shiyan <eagle.alexander923@gmail.com>

Nice!

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
