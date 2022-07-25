Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1284B58076B
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Jul 2022 00:33:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiGYWd5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Jul 2022 18:33:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237177AbiGYWd4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Jul 2022 18:33:56 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED93725C5C
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 15:33:54 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id u12so10700520edd.5
        for <linux-gpio@vger.kernel.org>; Mon, 25 Jul 2022 15:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ARaAMwQnof5N9U26EMBCbeLIKt/wib1YQjoJA6l5kqk=;
        b=mECDc+NVp+r0z5Ce+f2tUiKo+zE0YKZOsdMCcebrJGqdrvIz1e/P5NJ3Paf0i57Phw
         JT48hLRUGpP7yjgDeRnO4CVu7LBRVFaneM0HHkhrlDqi/0tNnKTcSeIaJddYsj25j2LG
         pRct3BzjmNt/GKu5KT0H15aqJ8g5qr4QwBq+05gVAi3ukQlZIzvEOElebwfEbS7wJzec
         xH9N7X846oJjcZBUcN67XIooudjPo+YTP1s4lSHumXS0c++EwyAQ6B4O40yqvIH1eML0
         qsf03/fyf78o7vMNTKIjPllpmVDvjDVgjGugcLLHGUgd59laur60RZ2SxchWvCBDJdcJ
         nbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ARaAMwQnof5N9U26EMBCbeLIKt/wib1YQjoJA6l5kqk=;
        b=W5FXsBprQ1V5Z7cOa1wd6GQAjfW5N8ddugBoz4A9NvRjaI+Fm+m2Qr5nUTf49p74Rx
         AuzLsS75zflIxAI/ylUs0oWYgmBSglivF58JG/78mpysjFbn3mBu7IYMK8dz5aLhRuHC
         pMlm/a4/8PsaMOQqxDY2FkVc2gugqfLTBA60qu2/oKbwsFyAZWWp4DzIUr+uHc/bfb6W
         3ZfTDcJOnLflT7xMBxqSsHbgrJh3g8+N2W8/uTaPvVkWDNMltTz2XZ8BjxMI/0WwKjwH
         N8XeGU3E/lmIA22xrapwoPIlRJN8mf0bqj8tuWV+ymhKXe4aSI39t154ItfKUBT6+EZT
         GYag==
X-Gm-Message-State: AJIora8PbCdiROW2rrmH8Z0Q4C1r/TtajmodbzIgQDvSfvX5cNaPPMUt
        /tdKQ+V6iH3Z2FvzBlU7XrS1CatdW+Xi/651abkxmF3e8Jc=
X-Google-Smtp-Source: AGRyM1vlZLLn1UPpjQoYnTrhb+BefGuHpBqo0P73R9gelhjmXRrvDfBEicovap9OwZKJZE573eSJEswAoH9b178y4LM=
X-Received: by 2002:a05:6402:3685:b0:43b:dfd3:9487 with SMTP id
 ej5-20020a056402368500b0043bdfd39487mr13771760edb.32.1658788433540; Mon, 25
 Jul 2022 15:33:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220724224943.294057-1-marex@denx.de> <CAHp75Ve0EQfee+eiDDG_pgzt8V3yoWeVfRZswG3EdFZZRyxa2A@mail.gmail.com>
 <CACRpkdZvjBBhNy_fQ2_dirSc1ddXCAO7dPg9OQW2eGDFWpn5rA@mail.gmail.com>
In-Reply-To: <CACRpkdZvjBBhNy_fQ2_dirSc1ddXCAO7dPg9OQW2eGDFWpn5rA@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 26 Jul 2022 00:33:42 +0200
Message-ID: <CACRpkdZozTkGv5xcL_tVR-k2p9sgJZS5bMgJ7cYCZBZr_dj5+w@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] gpio: mxc: Protect GPIO irqchip RMW with bgpio spinlock
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Marek Vasut <marex@denx.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Marc Zyngier <maz@kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 26, 2022 at 12:30 AM Linus Walleij <linus.walleij@linaro.org> wrote:

> Marek: could you see if the irqchip part of the driver could
> use its own raw spinlock?

Oh I see v5 already does, great!

Linus
