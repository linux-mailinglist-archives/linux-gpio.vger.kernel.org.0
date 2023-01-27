Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A67B167E6E0
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jan 2023 14:39:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233461AbjA0Njg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Jan 2023 08:39:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232913AbjA0Njf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Jan 2023 08:39:35 -0500
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F0342940D
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:39:34 -0800 (PST)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-50aa54cc7c0so39433427b3.8
        for <linux-gpio@vger.kernel.org>; Fri, 27 Jan 2023 05:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8S8RPV9fw6BMpEcc7JR02+RUT9UnoyY1lNMHQuV+VbE=;
        b=C1eg6FGJm7Is+6UP0y5Lz0u7xtTKMP+5inj9cveWQUIiiJ5EKG/YqTVPBYw7fc27yI
         4Ite8sMZnHa6gFB29yWTPtYDQotUC1vAvTK4XCx7raG1Df5gP9z8HqM22mzmo2oC0V8u
         6Q6A49HznbfTHYzM1LOlI9ZKWc/yGGRt6Klabp/0XLH3LV7xB18LKS9HwTA9/hjtl2PB
         9+9oFi5uUYge7KIc7ZOXLi3CCrKtBJMOUKGsLha6Z890Bn0yEhKtk8M17fIHWRHy+quZ
         +o3E+vOByMbRg3mmqR7yIadroDHgCDt/ilqcyS0g5q20zvflnSkxS3jwKoJ/JRbRp5lo
         BtKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8S8RPV9fw6BMpEcc7JR02+RUT9UnoyY1lNMHQuV+VbE=;
        b=JZHg3r/WBJnLO0TPASjRicanvMIhEJAG7TLpd17UuDfxnyRu2ZahwFx6ydXuWk5q64
         OUW4ZOyHKPPcGwbttfy0k0efZ+vLKYZ1xdJAyhrMs1u4y3pLtqYoz7+Zu3p0erZ4M5st
         C2Kuek0TIkuww0EBUu0bOeTb1sa01RDm0zB15eYv4MUeXELc+745icgH0dV5KHf7yO4q
         MwalxfPC+bLrUNxWfqx+r7gugw0ikMg1nUfYGhYD8sPr4AH1UKtIwmJSfyspMvAe1fkx
         58+xIRWguaV6upbpQXQiR9YadEzpCeO2fWbuSV7boiKrPb9Y1SCV1oOrTxpDEa3oQIO4
         iQNA==
X-Gm-Message-State: AO0yUKXt2ft15fcqR2vn4i7ivxzeMIUVN6435o9ABKwdb6xLjw3lNuoB
        7E2RnKoDUc/YExDqjQaXJSrVcun97iOD/hcCz+e3c5YIsp+rmuk4
X-Google-Smtp-Source: AK7set+qNTRsaSQn+dS1LZUCnQtXAXyipCMB/q4l3QYLL9SFaEovBsOzrdb2iHayUliK6bGrsN3S30MFFhA+bC503GY=
X-Received: by 2002:a05:690c:706:b0:506:6952:b9c9 with SMTP id
 bs6-20020a05690c070600b005066952b9c9mr1281529ywb.477.1674826773543; Fri, 27
 Jan 2023 05:39:33 -0800 (PST)
MIME-Version: 1.0
References: <20230127101149.3475929-1-arnd@kernel.org> <20230127101149.3475929-7-arnd@kernel.org>
In-Reply-To: <20230127101149.3475929-7-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 27 Jan 2023 14:39:22 +0100
Message-ID: <CACRpkdZDm2enFM=0AoDre=GmF+NHv+ZX9=9LdZ_KAcUJ5ta64A@mail.gmail.com>
Subject: Re: [PATCH v2 6/7] gpiolib: split linux/gpio/driver.h out of linux/gpio.h
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-gpio@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jan 27, 2023 at 11:12 AM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> Almost all gpio drivers include linux/gpio/driver.h, and other
> files should not rely on includes from this header.
>
> Remove the indirect include from here and include the correct
> headers directly from where they are used.
>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

As mentioned on v1 you will need two additional patches to
avoid build errors from the bots, perhaps Bartosz can cherry-pick
them?
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?h=gpiochip-no-driver-h&id=73ca8058a7b2075c993040bdc92b6a82f57d4316
https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-gpio.git/commit/?h=gpiochip-no-driver-h&id=89f4f9cc70c686303679e57bdc3ac86507979fe3

(Maybe the Viper cf adapter is deleted in the PXA boardfile removal so
it's not an issue. The HTE file needs patching through.)

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
