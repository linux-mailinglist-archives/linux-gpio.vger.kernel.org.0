Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7A725AD3EA
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Sep 2022 15:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237818AbiIENa0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 5 Sep 2022 09:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237813AbiIENaX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Sep 2022 09:30:23 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADA9117E33
        for <linux-gpio@vger.kernel.org>; Mon,  5 Sep 2022 06:30:21 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id s11so11348307edd.13
        for <linux-gpio@vger.kernel.org>; Mon, 05 Sep 2022 06:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KrRA2cX8z10HEQ4v1cXvZVjulHhsSFP9pWWa+tjEAn4=;
        b=v5nprAvdybdSNnBEAeyC/crVd/J6prq4TENcOLwQEaD9hjnmcfr5jRtgeLBU0u0ruv
         J8RD5vjuI5VuNnJTGPvoY+S7BY954tfc9cS9nGvu0qy9+GaHxZBgih/XtO/RmXzD3O/e
         oH+5OmNKBpN78s8uKbQJJmMMWuzV/RZ45i5HagxXHqHejXv+FWr6cZDp/Zgg851tVYLs
         WpixmQE+gVDaNLG+ZGUhccB7mqi6PMZ0r+jg3c558mcMUL90tik0VBSP/TPat35RDCp7
         Ghh4jqR012tqBQNUcnBN3p/aurvW5/TgQgcd5slGn1iym8T/pan9muhvrbrnQqpObD9s
         yzaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KrRA2cX8z10HEQ4v1cXvZVjulHhsSFP9pWWa+tjEAn4=;
        b=NBy8/ZM7VNlh6Q10yBimmfGil43qc+kh0g+N3+j2a7MccpEyhW0PM3MhmDfRzcuMvb
         gb4ZL/KMMqZuHpZcsAsF7m3WN81dRy2V0uUeFhYJVnmVslKTGW1+WREg2nDC9N68Lv7F
         rnfVpbFiTorG91I321W+kA5LM5cHnmpONqrjPuBhveRleNN8t6FXUtETvLrQkRWu4OEN
         JOV5b/pKjNLz7ketnFFvxXwVNCwlnZ3ldWrdeeegF8MPRd8/cyRlNwcWNvNqOoSTIHyJ
         nuMh2Kw0QzMtdtmLnXsqWaXuAIhZbOHedtVF4JzeUgStBC9+cdbDLupkXDc6qUR0mWqU
         y+7A==
X-Gm-Message-State: ACgBeo3oLLP7TXwEu1/Gk5C8w7whtBk79PG9RxLw77m9hzRI5/Ea5Qp9
        t4Wrpb8tjJsMJFA1xgFBLJYIDGSCk62G2dFy+eirJQ==
X-Google-Smtp-Source: AA6agR6zkSK5djgMG2gZnKqFh8/UxlxLbrRpBu9JlVipw0Ev9r7eAygJBB3ZC+lzPPVR/n6oS8Ufr+6YySwLggti3Og=
X-Received: by 2002:a05:6402:4517:b0:443:7fe1:2d60 with SMTP id
 ez23-20020a056402451700b004437fe12d60mr43741158edb.133.1662384620295; Mon, 05
 Sep 2022 06:30:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220902182650.83098-1-andriy.shevchenko@linux.intel.com>
 <20220902182650.83098-3-andriy.shevchenko@linux.intel.com>
 <CAHp75VcNGEVRnkWeVThaq4zNYoiZGSY-+KfbV5_9zG_5XoriMg@mail.gmail.com> <YxXyTCSKzL42PF1D@smile.fi.intel.com>
In-Reply-To: <YxXyTCSKzL42PF1D@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Sep 2022 15:30:08 +0200
Message-ID: <CACRpkdY4nJuXAxM7tYviWSPeqmCc6o4D--Vq0CZRPNjWNj+E_A@mail.gmail.com>
Subject: Re: [PATCH v1 03/17] pinctrl: cy8c95x0: Allow most of the registers
 to be cached
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 5, 2022 at 2:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Fri, Sep 02, 2022 at 09:42:00PM +0300, Andy Shevchenko wrote:
> > On Fri, Sep 2, 2022 at 9:36 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > It's unclear why many of static registers were marked as volatile.
> >
> > the static (yeah, forgot it)
> >
> > > They are pretty much bidirectional and static in a sense that
> > > written value is kept there until a new write or chip reset.
> > > Drop those registers from the list to allow them to be cached.
> >
> > This patch is not correct due to indexing access. It's sneaked since I
> > forgot I added it into my main repo. The proper approach should be to
> > create virtual registers and decode them before use. This allows to
> > cache all ports and as a benefit to debug print all port actual
> > statuses.
>
> To be clear: With this one removed from the bunch the rest can be applied w.o.
> any change.

I'll give Patrick a day or two to test/review and then I'll just apply
them all except this one, they are all pretty self-evident except ACPI
things which have obviously been tested on hardware so from my
point of view it's good to merge.

Yours,
Linus Walleij
