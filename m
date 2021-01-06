Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076EF2EBE96
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Jan 2021 14:26:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727172AbhAFN0N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 6 Jan 2021 08:26:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727148AbhAFN0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Jan 2021 08:26:12 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49836C06134C;
        Wed,  6 Jan 2021 05:25:32 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id t6so1557961plq.1;
        Wed, 06 Jan 2021 05:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rfSaaKFPCsYTMKsjFLgb3PFNNPkndz/7XIsR9mU4RAc=;
        b=GTlDexopRbKwOa+ypeSiLjjyE8zwQquIDctLHgca8vAQm1SRUs823w6TlQY15E5LQs
         RtJjhiY+fbzXELiUkaQs9I0FimvmjxAI7R0ybH04bJDymL1wRi5tsfXzsvJqry97BlXY
         aPMUk8OeLmzttl/1gHfwBU8jczaV3h3sD3T5mf7F7weo7f461oVQ+B/5kktHYTxWyxvh
         skAKkQ0ZcH2NK4IKolmAjMWWNJHDnv/2vdlKT/qNHdK6usElk12N5L+lMxOHj5A25K5u
         oPCshmYSzgdy0/n/BLBkEgXR/01JdSh5FOqLNE2jsquIn6v+OeyAGaTlddEtP+smEj9v
         g+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rfSaaKFPCsYTMKsjFLgb3PFNNPkndz/7XIsR9mU4RAc=;
        b=Z7Nbz5/iNN9u9AUEmjnLg5E2DugR40ZAxNZszcPvo2SZHtVO+2vnhdcDerp/sNdUdJ
         aJCDYsYoU0f4vAEaqSF/x2dJtQFhAoOR49fWb1U4lEINpeIL2RDClO5YoZ/nyuYtQ/D4
         m4XFW+2yMmKFIgbPneM2LNfnzIR+/oiCPgXjAH4vnum665YZHHo1HjdD/OKZsdbR0atN
         uh7DgeXwWp0LUhTG6VEkOlXZ99CIGcXpZxrVNlfYOQ2zqeHzASkR3wfCXZPxnknpQj50
         GF94MeH0eb0PdZcRSnBMu7f3qByhD2+whkkZCsAKIj+hnLFkdp4ZzBla3+W7dtNxN7Ot
         dOmQ==
X-Gm-Message-State: AOAM533SbpPqTtZuGTWTYfUQKnB2ZzNU7kpzZQwF7jiVxhjjtvHCOHd8
        dP93VQiX726lC4Nn5aHgHroAgntokzVs07v1Bko=
X-Google-Smtp-Source: ABdhPJy0QSxbDksTicF54QIKxE4nVtTb7NqYcG/EoK3gOoKqzHtI0LBY1KG4w+K3hjjFWLCC+ppAdbbcbcOGwfKtig8=
X-Received: by 2002:a17:902:e98c:b029:da:cb88:f11d with SMTP id
 f12-20020a170902e98cb02900dacb88f11dmr4265530plb.17.1609939531800; Wed, 06
 Jan 2021 05:25:31 -0800 (PST)
MIME-Version: 1.0
References: <20210106131932.774-1-zhengyongjun3@huawei.com>
In-Reply-To: <20210106131932.774-1-zhengyongjun3@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 6 Jan 2021 15:25:15 +0200
Message-ID: <CAHp75VeihR0kDy0dW4d=bwykFkS8+G3=u_yjS-SFU74C=i6z9g@mail.gmail.com>
Subject: Re: [PATCH -next] gpio: wcove: use resource_size
To:     Zheng Yongjun <zhengyongjun3@huawei.com>
Cc:     Andy Shevchenko <andy@kernel.org>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 6, 2021 at 3:19 PM Zheng Yongjun <zhengyongjun3@huawei.com> wrote:
>
> Use resource_size rather than a verbose computation on
> the end and start fields.

Wrong commit message (or the code).

> -       wg->chip.set_config = wcove_gpio_set_config,
> +       wg->chip.set_config = wcove_gpio_set_config;


-- 
With Best Regards,
Andy Shevchenko
