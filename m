Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84BE11AB9D7
	for <lists+linux-gpio@lfdr.de>; Thu, 16 Apr 2020 09:26:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438971AbgDPH0r (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 16 Apr 2020 03:26:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2438815AbgDPH0p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Apr 2020 03:26:45 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5C14C061A0C
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 00:26:43 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id l11so4816217lfc.5
        for <linux-gpio@vger.kernel.org>; Thu, 16 Apr 2020 00:26:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3j80w2FhZyJuSHwvNHKpsmCuR7Wp79q1b1zeo/FUfao=;
        b=elFmhWnKsy3gKxm/ghTFt7sc3g0MXm2manuh1t2TgiTbYuxgogh6blOebPY7Os0qKq
         yLzOzv/FJh34trA0Uz17Pq0Qm596qeyB5kfupyIlC/scov0cvgK8CRpR3pZa6rewFxgC
         wq3Io9UvBdZVMnU72fzzkZTUN8KqHgTOixHW8G6kBJe19rG3Ayk/P1QjpU/TI3wnTtMn
         6Hlz81reVuvgOVI2VKpZYaKzsTj6RLmQ0SrXdHKS0qtZ9am3+F/TcYeo26wIVQ2asY2f
         /CpZsvTl5moXmH5LEfOPHKSKn2xMjFEEYxQa8zVrVW1ZojT2SMEa26Qw8tJmKO57D5Th
         3udQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3j80w2FhZyJuSHwvNHKpsmCuR7Wp79q1b1zeo/FUfao=;
        b=fzgBHt1bvOp5j63ia2uKQvCOrczqkRHb3Tx+5XL27VWOWQLxOeipXPvELk/OOjyRPd
         Su8cOtpOOHct0Gg8wnWlfbm1R+7yvVYEmCwUCJstz10WigJGeoJfLiSL4Jsdj48epIlW
         p9BXTQIzH7z/fOUazFlz35q/7N9k7CsI3KGdCEpObAufyKKACRyR/OdbW3xIzTxaUU0c
         9JuPHGOPA0YAQoC/Z8olBXNLsDe4Bbf2pvUn9K9mXTntiZeDx5kZpoDAyfP88ax8MmTc
         Jy1bRjx+t1p6ifzta11RDSjQI4RKDoi1R8JbgftBNb83rd+LPESoD8jpXXWt0oRf5wgI
         f2Uw==
X-Gm-Message-State: AGi0Pubt+O7MetPTrVyG3mwdgy+hSLXnuZcqlJDsUp5FobJKP9RJaDPf
        StwmJUeabncPiv6X0eQFs0i/0VV0asUry5GEAsdaR04w
X-Google-Smtp-Source: APiQypJo8OFnVk7HT8UtPK81E8eBDDQzxAWyjX3zhnq8A6QWlDK4pD83YSMQP0E/skmPxPtJvbK8RsSDIfOmpQH2tj4=
X-Received: by 2002:a19:cb41:: with SMTP id b62mr5304889lfg.21.1587022002213;
 Thu, 16 Apr 2020 00:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20200415141534.31240-1-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Apr 2020 09:26:31 +0200
Message-ID: <CACRpkdZ2Fhq2BTjR6Affig8O5cb_Gg_pCOi6kYf9O0NJWGcGaA@mail.gmail.com>
Subject: Re: [PATCH v2 00/14] gpio: dwapb: Clean up the driver and a fix
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 15, 2020 at 4:15 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> It appears that GPIO DW APB driver wasn't touched for a long time. Here is
> the fix for long standing issue, i.e. missed module alias to make the driver
> be loaded automatically.
>
> On top of above a lot small clean ups here and there.
>
> The series based on the v3 by Serge Semin which he sent earlier.
>
> Driver has been tested on Intel Galileo Gen2 with AT25 SPI EEPROM using it
> for a chip select.
>
> Changelog since v1:
> - added Tested-by and Reviewed-by tags (Serge)
> - split IRQ refactoring patch to two (Serge)
> - update hwirq variable type to be irq_hw_number_t

I managed to pull this v2 series out of lore with the b4 tool and applied
it check the result!

Yours,
Linus Walleij
