Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46E1E56884C
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jul 2022 14:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232815AbiGFM2V (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jul 2022 08:28:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbiGFM2U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jul 2022 08:28:20 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5696224BE4
        for <linux-gpio@vger.kernel.org>; Wed,  6 Jul 2022 05:28:19 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-31c9b70c382so75716047b3.6
        for <linux-gpio@vger.kernel.org>; Wed, 06 Jul 2022 05:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SFftCeoPS9JnX0LvmFdEe3yxlwM+TuWNOSlHpz2qIMc=;
        b=J3vc7xUIe4IFwiah47beurvZCXS/x3GNgWPBE83dOoan3xrjnc1LfCdezuE4Fe5Fwv
         rzMpwWjv0tVFL01zy+dB8TokOg3n873YwP58UIQmuQtFRRDEPw1ThWThWmAHnlSdniL0
         ezGT0SeAiLs+BqYvcKVq+oIZIUpEs2qTSI3jwsDl/tnuE8NzIUBl23IvymcXiapygQpU
         6H07Gxwte4Nbb+iEHEbz1oBWHVnX356q3/QKXU1wnjKzy5Mwh0uMQd6vFVBhNh1nQE+v
         AJ6Q+2Nkdn3n+vT6sxPQFvn5KIeKJdSXVGpU+wtnw9O2ouM5+yhoRKxHjlBOSOPoeGaC
         brhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SFftCeoPS9JnX0LvmFdEe3yxlwM+TuWNOSlHpz2qIMc=;
        b=H12yP7WZ3aqk8Pz8AyDnWeS7ggvyj1fIjSDdXO7htL9/FynJ3pJhpHNxALA9cQXUmo
         QSD4rWGhv7uOEBNJO/n0IejmMYlQfnGr334A2qhMmc5sIYD04SpwZXRuDKrZ8Ujf6h2N
         fCQrsJ4AuOniqHBgbI0EZgDboqX5L7nJNk/A1SJkEQnbHdu28aovhiylQdKqfIl/3OXV
         24OEvE9LgoJint7SP+x0mjZSGWgTIm6rO+rbzlD5/OQtayA8U5hYuNABX+Far7xjiWE9
         GR9ihrJSkZ8I6Dc2viP2TW70yj6hYYAlLVtxpDAh5AvCl7zOqkUeoF4/PCO+9HO6ycR0
         4G4Q==
X-Gm-Message-State: AJIora/ZDVY/A696zbE1HRhOeBTXZtEV8yiQT7S8L75YeJLYoz7zLa0v
        /Briz7IxAUvyqCZ9RIJOHCHRKUA55wT21o/aCCAgW4J7ITk=
X-Google-Smtp-Source: AGRyM1tYRg8zHOl/8p0zgKwGm70EF+XAwRrFQ4qLEnQad/6wb8fINO7eJgAmuTDZwC/aXrzFgznSN52x2bUJJrL5Ljk=
X-Received: by 2002:a81:468b:0:b0:318:4cac:6576 with SMTP id
 t133-20020a81468b000000b003184cac6576mr43759042ywa.277.1657110498401; Wed, 06
 Jul 2022 05:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220706060222.302051-1-windhl@126.com>
In-Reply-To: <20220706060222.302051-1-windhl@126.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 6 Jul 2022 14:27:41 +0200
Message-ID: <CAHp75VdWBx2hMyu6902exeist24cm5NnO3z9aKjhV=H5tb8y9g@mail.gmail.com>
Subject: Re: [PATCH] gpio: rockchip: Fix missing of_node_put() in
 rockchip_gpio_probe() and rockchip_gpiolib_register()
To:     Liang He <windhl@126.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 6, 2022 at 8:29 AM Liang He <windhl@126.com> wrote:
>
> We should call of_node_put() for the reference returned by
> of_get_parent() which will increase the refcount.

Is it suggested by the so-called Hulk Robot? If so, it's not the first
time I see that people don't think about, and just repeat as robots
do. Have you read the code? Have you tried to understand what may
happen when you put an OF node? What would be possible consequences to
the rest of the code?

The above sentence is correct, implementation is not thought through.
It might be a correct fix, but the commit message doesn't show that
you really spent time on the change.

P.S> I would personally put all those Hulk Robot bla-bla-bla with
lowest priority to consider, too many broken submissions...

-- 
With Best Regards,
Andy Shevchenko
