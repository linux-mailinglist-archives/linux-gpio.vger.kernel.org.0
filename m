Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97FA33DDCD6
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 17:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234998AbhHBPzH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 11:55:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229979AbhHBPzG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 11:55:06 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DD1CC06175F;
        Mon,  2 Aug 2021 08:54:56 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id t3so18016455plg.9;
        Mon, 02 Aug 2021 08:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Tb85RMd9lzkgRNrQJGP8oYSwbsR7j/RmW0SM+oKm+9g=;
        b=biJkJVShAZPizW0Zk8lJBNq+QNccEkZm+iMXZnSFhrigzxYnbHH+BJBEr2i8XGZWVp
         51Mcc51l9cMacwkF0FJpj9eX5ZAR9njx5pi/20fvo9UkfZ4mWeyvNaUIt9J0mT+wF4Dm
         FfxX8Ret+gxR+fQP37ljnO6OQnUFTwOogDXXKRNoJW15qez7xW8iKi5tc2kprlvnJxGJ
         cvSt/zTLSQq7BBhA0FIGRagPNMKsmKbxHtN5JtiHIKhZOduPsaUIyzbQBFsGhZbxFtDA
         kkcETgljLWf/V6b/eZVRCnyesCUFgh7Aiyx8z+tRWH/zk5LFWkHRdxu4J1HV2/K5711c
         FnVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Tb85RMd9lzkgRNrQJGP8oYSwbsR7j/RmW0SM+oKm+9g=;
        b=ADlN18JyG2qs+MuVFUnuYkWu57Sp/NColBDcK2jt6Bf20o8CQKd0spcQ50J9lcuEl7
         6zKRpAwMoIcgXjFRapg2M9A6reMCKxemwui5EkQiU2YM4XX6L6I9elAH4qVBno878wMx
         agzdlbDDjL3GtRgSu0GSl1qIU20aeLiPeC37EIXuqV9zAZP7uo4Eec0QvMywkTcn42GU
         lMrYZfBQ5F6I+w7R8qtLSZlm1Q6o5wph43eZlbdffbU9oaQMtywjtmmpLJyTlhd0f7uP
         cUhMNcJoQbSfnWp5NU+OqcbVaXJ6zosOp3DMeP/LXcKj3DN0asjpG2cjxY/4LdadfLkW
         9bRA==
X-Gm-Message-State: AOAM531sVbti3wFeqkdJ5iFP+0nzr6t/gyRMD5x3nEi9WZ+hz/hz1dND
        1pi/KEbp+AB0p04ZaEn5hdj70/BKnlxxgAKoe1E=
X-Google-Smtp-Source: ABdhPJy0Jqcrx1ia5Jl2W6+BUhbaj9OxP6HDKEm12FPAajn32MMtkxVsT8QkgABU3DD4jhlELo8RWN55xab2LobApWI=
X-Received: by 2002:aa7:860e:0:b029:3bd:7e49:7a14 with SMTP id
 p14-20020aa7860e0000b02903bd7e497a14mr5793319pfn.40.1627919696170; Mon, 02
 Aug 2021 08:54:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210726125436.58685-1-andriy.shevchenko@linux.intel.com>
 <20210726125436.58685-4-andriy.shevchenko@linux.intel.com> <20210802140721.vxhqidrkcxo3ex53@mobilestation>
In-Reply-To: <20210802140721.vxhqidrkcxo3ex53@mobilestation>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 2 Aug 2021 18:54:16 +0300
Message-ID: <CAHp75Vf0a=SFPz8atUaDP=M=m9Umny4+msUaVT1gBWuHXPnOrQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] gpio: dwapb: Get rid of legacy platform data
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Lee Jones <lee.jones@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Aug 2, 2021 at 5:23 PM Serge Semin <fancer.lancer@gmail.com> wrote:
> On Mon, Jul 26, 2021 at 03:54:36PM +0300, Andy Shevchenko wrote:
> > Platform data is a legacy interface to supply device properties
> > to the driver. In this case we don't have anymore in-kernel users
> > for it. Just remove it for good.


> > +struct dwapb_port_property {
> > +     struct fwnode_handle *fwnode;
> > +     unsigned int idx;
> > +     unsigned int ngpio;
> > +     unsigned int gpio_base;
> > +     int irq[DWAPB_MAX_GPIOS];
> > +};
> > +
> > +struct dwapb_platform_data {
> > +     struct dwapb_port_property *properties;
> > +     unsigned int nports;
> > +};
> > +
> >  struct dwapb_gpio;
>
> If you need to resend the series anyway could you please move the
> structures declarations to being below the forward declaration of the
> dwapb_gpio structure? Of course it's not that critical, but for the
> sake of just not to have the later one left somewhere in the middle of
> the unrelated structures and for at least to keep some order in the
> declarations.

Fine with me, I'll modify accordingly in the next version, thanks for
the review!

> Then feel free to add:
> Acked-by: Serge Semin <fancer.lancer@gmail.com>
>
> The whole series has been tested on Baikal-T1 SoC:
> Tested-by: Serge Semin <fancer.lancer@gmail.com>

-- 
With Best Regards,
Andy Shevchenko
