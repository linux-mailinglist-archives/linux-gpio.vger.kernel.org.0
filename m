Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1CD2572A68
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Jul 2022 02:50:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbiGMAuX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Jul 2022 20:50:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232270AbiGMAuT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Jul 2022 20:50:19 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FB1BD6BE
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 17:50:18 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id n74so16823866yba.3
        for <linux-gpio@vger.kernel.org>; Tue, 12 Jul 2022 17:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eVIBXNYPXflbhDmPqNeN1vaRHXCTr9TZKw/Aud6ynFk=;
        b=Nu3pXsQlpr+nHQz8QjjrfuPjjPgEQqhb8j1ylQsPAXC6P8SvTDsCeuasC2zzotvpBc
         Xe0UikySBB08ir1wMpHcEMIWWvUq3ha/ChC5IVOZjIWe7MUZxnp1RL6fVd070TXj6WRj
         yP+3DG+zkKtk4aiDmfo1TXbN1T7wY8aU8waLlNo4ksz5F0vQSczmeTXt0aQK519fECUI
         HB1+d1QQ3ZY+Jv+x4Vfrx/wZ87sna0vI5yskR0cno2XD6bRijQ1pC9IOSuWmVds2J3ZV
         bF89sWT/Mdik1KR3fT+VI0E0iHZnqAS3JxalCLCRRmZVQevNvNNnSm7jtXbpWfev6rac
         f98Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eVIBXNYPXflbhDmPqNeN1vaRHXCTr9TZKw/Aud6ynFk=;
        b=hUWeGpkGQ5Ww//ZAQvOk78NWo4+dUtfiPvNqbwQhrn4cx72+w3UGcyk12drErX9/dY
         cJxBXWlFGSsvvYaC5joThNd9Ji2BoQIv5qjilRJFiqRYH878OPAC5uxgGbkS5HrzT1i/
         FDvKjiiroq3rbqg5QPfzhBR/G9oVZuW11jobCGGFid2oioTgDSe/AbfpJ049tB+MRF6D
         wh24/ZnER6T6kPEZqf7PPW987o8j0QH9/OUgH0rgryZkXxhdfA0rh16sUKY5znognOQ7
         BhwJQJUvuYBm3N5nulf0G0XyLIuS9x0qGLCFFObB8uVwJ/gOA8/bzIDgcUG1G7cPlGZP
         ABIw==
X-Gm-Message-State: AJIora+m6MxikFn7dhgKpoO4OBRV+C/Ry3H8FVgPnLd8VUPmrbVngK5P
        jRzPz8gerENAV/0L5bg0IHymWTgUuEy8lqz2Ru2qqg==
X-Google-Smtp-Source: AGRyM1sXEWzOoeg1U8/u/4j1RYqldWG9lxWSBF6cTvrLkXZVlMxc4bTQnunavx6CE6WqvYGm7jSY/6dJZSFqgBtr2fU=
X-Received: by 2002:a25:9947:0:b0:663:ec43:61eb with SMTP id
 n7-20020a259947000000b00663ec4361ebmr1164051ybo.115.1657673417598; Tue, 12
 Jul 2022 17:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <CAGETcx9aFBzMcuOiTAEy5SJyWw3UfajZ8DVQfW2DGmzzDabZVg@mail.gmail.com>
 <Yrlz/P6Un2fACG98@atomide.com> <CAGETcx8c+P0r6ARmhv+ERaz9zAGBOVJQu3bSDXELBycEGfkYQw@mail.gmail.com>
 <CAL_JsqJd3J6k6pRar7CkHVaaPbY7jqvzAePd8rVDisRV-dLLtg@mail.gmail.com>
 <CAGETcx9ZmeTyP1sJCFZ9pBbMyXeifQFohFvWN3aBPx0sSOJ2VA@mail.gmail.com>
 <Yr6HQOtS4ctUYm9m@atomide.com> <Yr6QUzdoFWv/eAI6@atomide.com>
 <CAGETcx-0bStPx8sF3BtcJFiu74NwiB0btTQ+xx_B=8B37TEb8w@mail.gmail.com>
 <CAGETcx-Yp2JKgCNfaGD0SzZg9F2Xnu8A3zXmV5=WX1hY7uR=0g@mail.gmail.com>
 <Yr7wA8d4J7xtjwsH@atomide.com> <Ys0ewNYFB25RWNju@atomide.com>
In-Reply-To: <Ys0ewNYFB25RWNju@atomide.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Tue, 12 Jul 2022 17:49:41 -0700
Message-ID: <CAGETcx8H9je6Yg-fciU5-dh22xB0_h6XzAfH5UsCSeET97wrpA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] PM: domains: Delete usage of driver_deferred_probe_check_state()
To:     Tony Lindgren <tony@atomide.com>
Cc:     Rob Herring <robh@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hideaki YOSHIFUJI <yoshfuji@linux-ipv6.org>,
        David Ahern <dsahern@kernel.org>,
        Android Kernel Team <kernel-team@android.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        Linux IOMMU <iommu@lists.linux-foundation.org>,
        netdev <netdev@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 12, 2022 at 12:12 AM Tony Lindgren <tony@atomide.com> wrote:
>
> * Tony Lindgren <tony@atomide.com> [220701 16:00]:
> > Also, looks like both with the initcall change for prm, and the patch
> > below, there seems to be also another problem where my test devices no
> > longer properly idle somehow compared to reverting the your two patches
> > in next.
>
> Sorry looks like was a wrong conclusion. While trying to track down this
> issue, I cannot reproduce it. So I don't see issues idling with either
> the initcall change or your test patch.
>
> Not sure what caused my earlier tests to fail though. Maybe a config
> change to enable more debugging, or possibly some kind of warm reset vs
> cold reset type issue.

Thanks for getting back to me about the false alarm.

OK, so it looks like my patch to drivers/of/property.c fixed the issue
for you. In that case, let me test that a bit more thoroughly on my
end to make sure it's not breaking any existing functionality. And if
it's not breaking, I'll land that in the kernel eventually. Might be a
bit too late for 5.19. I'm considering temporarily reverting my series
depending on how the rest of the issues from my series go.

-Saravana
