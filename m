Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E5D351C038
	for <lists+linux-gpio@lfdr.de>; Thu,  5 May 2022 15:07:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378773AbiEENJr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 May 2022 09:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1378874AbiEENJo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 May 2022 09:09:44 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09ADF56425
        for <linux-gpio@vger.kernel.org>; Thu,  5 May 2022 06:06:05 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id t5so5112160edw.11
        for <linux-gpio@vger.kernel.org>; Thu, 05 May 2022 06:06:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mL7w0UMKorZQ2g0L1DfCw6LR3UMP76ttTU+pAi6oLp8=;
        b=thkq/Oe9nJNhuWKKyXJioTRuksejdS4P/kXbCrE43AhgzOgACtL3WlfvieNBmQqQ+G
         MffenwvYyEE/lyM6o5nlmL6cqoqXf2JLlV9Pqf59ZwhnlRsg0EEZAaaBRwGtqynW9/3D
         7nIMP/GeOSzcRkEGfmLrPzxr2OcLJtnZshwKErO0/B8ah6A/IhRVB6dZWKeScY8dMPNX
         1zRNKzTFQ3NxyxG0Zh62W3IcJeUkNoLDAuqfKXM0K2J815M+nocKNHapidlHY7FPLyw5
         7z83NA03x9UBBjVvstLDBu+6qQ3ESO9XqXHwoTHF7FFaDJCJY/e8q6BySCbLEWHt85VA
         eiBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mL7w0UMKorZQ2g0L1DfCw6LR3UMP76ttTU+pAi6oLp8=;
        b=lKK4UDm8xpFZiL4XTFzgHCDIohNX7yN2n8gYI3CLSoFBPpSLmRPbkHwphAznhYdAgt
         64scBMhq/sKX4tLgNmDax7Y4srtgbhndrB9w/BL5ExqTz+dns2lP+neCfS1KWkJt6099
         jjJhAtmid61u29lnNh7gD2s9tMhb2Kqi+6Q0roXLlsfTG4hSNtgG/J3Nx5igZjZ6m78H
         e324dDd+tMim+0PqAsrORYLNyHuyuZevDXMBevcKd+S2Bi1q8XcPMHyw7jjqBtNq1Rww
         4MvLlM9hZ1oNxgTz1uEx0BPf1UTYsj6vS4Xqn5Nh+i/jGtmwC6Z1aY3iQ3bCPyUZTnDQ
         f6Vw==
X-Gm-Message-State: AOAM530w3pTACvqyFwbZafsZU8neaoFm2O+aqDJB0kiPfsoiw3hZzyaL
        2Qe4EkCadJZB8jGMkcPYWAaz+NgzKlFYqOgg7BcEuw==
X-Google-Smtp-Source: ABdhPJxr7BHz9MN/SywvgtY21Ie07p3CIeurjYtmb7zi7rCM463OgbWz+0yWrSPh0S+WrcPNGwAj+sr6dUi1BvovgpY=
X-Received: by 2002:a05:6402:5286:b0:425:f0fb:5d23 with SMTP id
 en6-20020a056402528600b00425f0fb5d23mr29314171edb.243.1651755963620; Thu, 05
 May 2022 06:06:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220414190242.22178-1-andriy.shevchenko@linux.intel.com>
 <20220414190242.22178-2-andriy.shevchenko@linux.intel.com>
 <CAMRc=MfE0othcfwETf13_K3sOLKmUGwCnjapzVjLMk1cD+ihVQ@mail.gmail.com> <CAHp75VcpZPB12Y4FVN4h9RdkvYQfELtbRnd08FfPpG1cJG-99g@mail.gmail.com>
In-Reply-To: <CAHp75VcpZPB12Y4FVN4h9RdkvYQfELtbRnd08FfPpG1cJG-99g@mail.gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 5 May 2022 15:05:52 +0200
Message-ID: <CAMRc=Mef77ejvzx2Pg1P_xzozxb1VjxGtArfvFdS=Cgq-8Mbwg@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] gpiolib: Introduce a helper to get first GPIO
 controller node
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-amlogic <linux-amlogic@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Apr 26, 2022 at 12:29 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Apr 26, 2022 at 12:27 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >
> > On Thu, Apr 14, 2022 at 9:02 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > Introduce a helper to get first GPIO controller node which drivers
> > > may want to use.
>
> > > +static inline struct fwnode_handle *gpiochip_node_get_first(struct device *dev)
> > > +{
> > > +       struct fwnode_handle *fwnode;
> > > +
> > > +       for_each_gpiochip_node(dev, fwnode)
> > > +               return fwnode;
> > > +
> > > +       return NULL;
> > > +}
> > > +
> > >  #endif /* __LINUX_GPIO_DRIVER_H */
> > > --
> > > 2.35.1
> > >
> >
> > Any chance you could name it get_first_gpiochip_node()? It's static so
> > we don't have to worry about the prefix and it would make the purpose
> > more clear.
>
> There are two things why I prefer it as is:
> 1) it's static inline, so it's part of (internal) but still exported API;
> 2) it's already in my for-next branch which I would like not to
> rebase, until it's a really serious issue.
>
> That said, if you still insist I can rename it.

No that's fine and I also pulled that into my tree.

Bart
