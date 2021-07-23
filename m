Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFA553D3D31
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 18:09:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbhGWP3E (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 11:29:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhGWP3D (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 11:29:03 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F03C061757
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 09:09:36 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id d18so2907614lfb.6
        for <linux-gpio@vger.kernel.org>; Fri, 23 Jul 2021 09:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CUZub6tYMC5rdH2GsxFohlUBAJBqmcxB+r6GGbVLSQI=;
        b=jDcmGZqh5+TCG4aW8YRE7eHDVom1uRP1PjSpQYjST6gGZfVqMs/Kjk2L64i30vA1mt
         hCADMD9+8FknjB3QrSDx8L3AkP8jguROpDDeyh5Q6hSg0tqAY7OJmnyXscXNke8n3Nzp
         CnuDn3AoeGdPYHvUUhMH14y9Ri4GhyKV1r+nUdNMiWwLL9VY+1lb+loi005d51jaPrDb
         QGm5CV2jo2YLD1Q1SrcUwUOjXnn2+axtONqxNUMIRqM53/XKraWIULcSau3yXWU48wSi
         neMbTsLg2McH8GmBCnBFvhK3JTib0phAX+8LjpbFD92a/7m6iTSlWrSgktWjuGCTd5fc
         IvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CUZub6tYMC5rdH2GsxFohlUBAJBqmcxB+r6GGbVLSQI=;
        b=HL0B42DEnL5KGwrWYaE8XMJBzz5vGBtpfDWX0sOSy7ICXVr7epeTsd650bN8niILBs
         NAYm2PhpWRS5OS0sgLPS8UCnANiKcBGCyTktJbxAJRlTXcgQR0xjJpCp8qgFbbPW6uUv
         v8kkIoYiOrlS4UpZpPq6hV4QNduw8rfsZ1hfdvfnlAYZXGY7dk5tHloicaK7G0TJcppp
         VTJtUthFNcxF9exbK0ILpm00opOqwPvrK56jXCE0g7yLSYfPqMlu/dP7MeGMvjju90e6
         BmSAU8jB8YoPCcmPI6l0TldpVAaY6oDPrddZGu0BwSNl85EaAPAFQch/g8ppgWcYNxV4
         +xtA==
X-Gm-Message-State: AOAM531XaFAqR07+nkZ30wAqG4UuJP9K/VU7MH1bNFUaPoUsgA5jCFrl
        UUkjA8JsROHrUKJdoqntvjKGhU+f6C3mLS/aHw4/oQ==
X-Google-Smtp-Source: ABdhPJyGZM4DpxYoi4G/uaylBWCJNwRIGO7fkTktk0W9ZePKQef+muQvEXOnibA8DVz68yRY+B1BXqD87s4k8HGuhAw=
X-Received: by 2002:a05:6512:2603:: with SMTP id bt3mr3597638lfb.529.1627056575160;
 Fri, 23 Jul 2021 09:09:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210624214458.68716-2-mail@david-bauer.net> <202106251253.ajNPgHe1-lkp@intel.com>
In-Reply-To: <202106251253.ajNPgHe1-lkp@intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Jul 2021 18:09:24 +0200
Message-ID: <CACRpkdYH=UVnm379f2CyFJyO3eGyy9HCqaOW-=saYqshUO-M4Q@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] pinctrl: Add driver for Awinic AW9523/B I2C GPIO Expander
To:     kernel test robot <lkp@intel.com>
Cc:     David Bauer <mail@david-bauer.net>,
        Rob Herring <robh+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, kbuild-all@lists.01.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 25, 2021 at 6:51 AM kernel test robot <lkp@intel.com> wrote:

>    drivers/pinctrl/pinctrl-aw9523.c: In function 'aw9523_init_gpiochip':
> >> drivers/pinctrl/pinctrl-aw9523.c:812:10: error: 'struct gpio_chip' has no member named 'of_node'
>      812 |  gpiochip->of_node = dev->of_node;
>          |          ^~
>
>
> vim +812 drivers/pinctrl/pinctrl-aw9523.c

I haven't even seen the patch adding this driver, is the problem on my
side?

Yours,
Linus Walleij
