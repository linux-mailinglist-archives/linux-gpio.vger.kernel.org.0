Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F03C85AE305
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Sep 2022 10:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239648AbiIFIjS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Sep 2022 04:39:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38202 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239402AbiIFIiP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Sep 2022 04:38:15 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A293792FD
        for <linux-gpio@vger.kernel.org>; Tue,  6 Sep 2022 01:36:23 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id z9-20020a17090a468900b001ffff693b27so9280688pjf.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Sep 2022 01:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Z35Ea0ACEPUI3Tc7GfX22hl2yV54pQ6voDGTnuu0l4k=;
        b=ZsaDArWrReCBd7fSxDcW7Ui9ZIEIsKJWy0KbjRk4+1A5BLpMugUt8DmCN2BbllGAzC
         hLa6D5OjrPFP3LyT/x6EW3+8MC+KnrOKuQg81QVS35XXWFc6AJcw7ra2xhKC/sGkHgWj
         NWRGKuTav2TcLljS/XXEfqjdq+bSfMOP9OF8k4WUja/l/FvWFeG7w8lhzu4mNOp3sZhW
         1ga/S+5bgGQTeJlC62aw1cSzeHuLgNOIPDyfkSGjb68BcT/c1kE+HPf5MzKcelZBvdqb
         URuh8OucFrKgqPfGYJZgEJTKNlePG0cwB6cyypp7ukeMi/em3FLWbQzS0SDfdtn+Edyc
         wkAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Z35Ea0ACEPUI3Tc7GfX22hl2yV54pQ6voDGTnuu0l4k=;
        b=0YNny3rLXi1Ngebnjv4UNE+LWojDY2UFlkyiOFx41ix+lp2kA+dFD6ahYpzqA8JqqP
         VMkig38BkxUvy1LgT6fpQhCVSwxTSITF648bJS6zctElYz5S+JwbImJoWj7H/rt6q9Z+
         MZP935BrUNVkXvnVrZtlivKMBn0zTDlfF9bf4FaEp8IB9U/MhX/tW3lnbxvBT5vCw63n
         1ag422+fjViLEYXHnTlJPZXyr0XFgWviK5Dlnid0mLgZNSg+3mtW6enpjgwHuvyN7euf
         CjLTk6ThUSW96ZaGXkmlEkAus7xNph7pe07tULSByvi3MFOAnW6bIWWu9Pj42XiYvag+
         MJtg==
X-Gm-Message-State: ACgBeo1Yv2mrabF7yGd0j+d0PUOo/hMoYBHGy7k2vO4KGYofufTERr8C
        iNFF8tmzASr0xIQePC5j5Ny265bnTro+anSD/SPVlw==
X-Google-Smtp-Source: AA6agR4Y3v4BGPFQ7IyMFDxcQJYH8gJSG07viQL/4+wzDfD29DCjn6nCfyQ55oX21MtEIPA/VULBFf0i7lnR264bRTg=
X-Received: by 2002:a17:90a:9907:b0:1f5:2318:ea6d with SMTP id
 b7-20020a17090a990700b001f52318ea6dmr24184972pjp.163.1662453381495; Tue, 06
 Sep 2022 01:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220902182650.83098-1-andriy.shevchenko@linux.intel.com>
 <20220902182650.83098-3-andriy.shevchenko@linux.intel.com>
 <CAHp75VcNGEVRnkWeVThaq4zNYoiZGSY-+KfbV5_9zG_5XoriMg@mail.gmail.com>
 <YxXyTCSKzL42PF1D@smile.fi.intel.com> <CACRpkdY4nJuXAxM7tYviWSPeqmCc6o4D--Vq0CZRPNjWNj+E_A@mail.gmail.com>
 <CAHp75VcbucZ_3+bvJCsLk78D6egwckN=rMAdttmVwt8H9MfCSw@mail.gmail.com>
In-Reply-To: <CAHp75VcbucZ_3+bvJCsLk78D6egwckN=rMAdttmVwt8H9MfCSw@mail.gmail.com>
From:   Patrick Rudolph <patrick.rudolph@9elements.com>
Date:   Tue, 6 Sep 2022 10:36:10 +0200
Message-ID: <CALNFmy0Hu-BUH8DLMk+5L=5OW46pM_dP47Jy8iKJeixDUW815w@mail.gmail.com>
Subject: Re: [PATCH v1 03/17] pinctrl: cy8c95x0: Allow most of the registers
 to be cached
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,
I've tested the patch series on my OpenBMC platform and it works fine.

I don't think it's worth the effort to implement virtual registers for
the muxed pin configuration,
but I won't stop you.

Regards,
Patrick

On Mon, Sep 5, 2022 at 3:37 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Mon, Sep 5, 2022 at 4:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Mon, Sep 5, 2022 at 2:57 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Fri, Sep 02, 2022 at 09:42:00PM +0300, Andy Shevchenko wrote:
> > > > On Fri, Sep 2, 2022 at 9:36 PM Andy Shevchenko
> > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > It's unclear why many of static registers were marked as volatile.
> > > >
> > > > the static (yeah, forgot it)
> > > >
> > > > > They are pretty much bidirectional and static in a sense that
> > > > > written value is kept there until a new write or chip reset.
> > > > > Drop those registers from the list to allow them to be cached.
> > > >
> > > > This patch is not correct due to indexing access. It's sneaked since I
> > > > forgot I added it into my main repo. The proper approach should be to
> > > > create virtual registers and decode them before use. This allows to
> > > > cache all ports and as a benefit to debug print all port actual
> > > > statuses.
> > >
> > > To be clear: With this one removed from the bunch the rest can be applied w.o.
> > > any change.
> >
> > I'll give Patrick a day or two to test/review and then I'll just apply
> > them all except this one, they are all pretty self-evident
>
> Sure!
>
> > except ACPI
> > things which have obviously been tested on hardware
>
> Yes, I have a Galileo Gen 1 board which has been used for testing.
>
> >  so from my
> > point of view it's good to merge.
>
> Thanks!
>
> --
> With Best Regards,
> Andy Shevchenko
