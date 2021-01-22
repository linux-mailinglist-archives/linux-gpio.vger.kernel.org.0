Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D7D63003E8
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Jan 2021 14:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726633AbhAVNPD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Jan 2021 08:15:03 -0500
Received: from mail-ot1-f41.google.com ([209.85.210.41]:38126 "EHLO
        mail-ot1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbhAVNPB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2021 08:15:01 -0500
Received: by mail-ot1-f41.google.com with SMTP id s2so2795313otp.5
        for <linux-gpio@vger.kernel.org>; Fri, 22 Jan 2021 05:14:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AnH/YNcoHDFNkyP+n4jsdiFLN7wzfDUTYAAH/KnWYwY=;
        b=C+S56AbpqqmsTGFOQ3PMY27cePHDWvhpXNr7SrIhhj5VwlXp2/mtznHnERFBpyqLve
         bWfFmk1iuy0j/gQ+gXEaDIqDX5647Hu4fqE4BEMLLZfG6RxpPYcK1Dh/aCkF21KiFX3D
         K9n4Gh/QMtBbVeKJBtDt0f3AECTp+Jph7s9k7N1/90fszYW3ifge1HaXKHKQl99w+nbN
         b9ldwjsObuLLW2b1Khhq0FrEMpJCXsl2dG+uc2J62ciQMfWwZSdmycYCJ95FP/nR+Zqm
         k/fYqHN+pE7+9DT2NjUxASMphzhuERjvX9CdTP128GP9RBfwqPHelJmaOlBNRY2TKzDC
         UvbQ==
X-Gm-Message-State: AOAM533C+2SKIu9kBCT9jvGER2eKF7UPk8YasUSpA/0nF8hb9dD/DsRq
        H4uMB1/J77wE+raD5jHQqPZK20IcMzoVcDeRKRlunQjn
X-Google-Smtp-Source: ABdhPJzWm+lb0S1Fn55SfH643EvqGt8Gxla9JO8Av2lJ4e2ANG5MrQ6jDWS+AFo1l9zmG34JsoM+v9r8mUnPd49A2Ik=
X-Received: by 2002:a05:6830:1f5a:: with SMTP id u26mr3262682oth.250.1611321260952;
 Fri, 22 Jan 2021 05:14:20 -0800 (PST)
MIME-Version: 1.0
References: <20210122123853.75162-1-andriy.shevchenko@linux.intel.com> <20210122123853.75162-4-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210122123853.75162-4-andriy.shevchenko@linux.intel.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 22 Jan 2021 14:14:09 +0100
Message-ID: <CAMuHMdWejXyj4Z3eZ5S5te8OT2NUPQAhG5PUGFs46VxAQG+2Vw@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] gpio: aggregator: Replace isrange() by using get_options()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Andy,

On Fri, Jan 22, 2021 at 1:39 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> We already have a nice helper called get_options() which can be used
> to validate the input format. Replace isrange() by using it.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Let's hope this is never backported to stable before [PATCH 3/6]....

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
