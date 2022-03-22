Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA284E4438
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Mar 2022 17:31:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239101AbiCVQcp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Mar 2022 12:32:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231499AbiCVQcn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 22 Mar 2022 12:32:43 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D2995AA7D
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:31:16 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id o64so20020865oib.7
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eBGT6TfuG+TZ+ZknHNg2pzCXwjZzFignFMWF792nkMU=;
        b=V52T7qwzsIvRbgpCNl3fIP5TRDzI3a91Wett8pNHrPfFGakgZ7XZN7Hw91Lqeyuesk
         hhc4kahwZfQYFQN0QLQswwmFOuS84OuI8YnBgVfZF14lR2qK8VPcTAlZpNWsGjPqmLFf
         Ed9Ld1LqkdV3iXhM0j9XLIjDugCdVX/M7BA3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eBGT6TfuG+TZ+ZknHNg2pzCXwjZzFignFMWF792nkMU=;
        b=5m4echHZqEq1DjjCPuRISmYVL9J8IHA8HX9c9AlArdf+4FzlVnaHZMCNghQDvzDpQL
         dHfE0kaqq7G/JSZlm4m6ChbgHhDEP2RRw0Y77LZQPRSjABmOH3UKBSrsDw5TjHN+qzw1
         wz8ECnE1zwlzxpjznJi7tu7cpbRM8uBiXn+8Ek5UoiOfhkamMeIMSpC283qJyqtkK0gD
         BM/0lXxPS6KScwB6J3QKmHSnIwPB0bPXlrRioFy4waN62d824cOflqOzRn2Gi/dKiTwH
         CLxNarbzrROtj8yp6QKwuHm199US6eXpA+Sj2Iqtji0Mm+S9hkJBxSkQTuSO1HP+IphB
         w+rg==
X-Gm-Message-State: AOAM532pbPkXzG7q1p1lIjpWv+jPcdD3sU2J8EY/q+yfXZQZg2GZa937
        9WPK2MW250+taL+J4nTgw9wEmA3hvZQShA==
X-Google-Smtp-Source: ABdhPJwQONz3p6gfW8HSdKYDZJB/X9+JlfpUh8od3Cuy9w7UY5knwVgPjd/7gpm4Cu8rXBpxNULeqw==
X-Received: by 2002:aca:6208:0:b0:2da:5058:346e with SMTP id w8-20020aca6208000000b002da5058346emr2555256oib.77.1647966675028;
        Tue, 22 Mar 2022 09:31:15 -0700 (PDT)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com. [209.85.160.52])
        by smtp.gmail.com with ESMTPSA id e17-20020a9d5611000000b005cb562a5545sm5422499oti.57.2022.03.22.09.31.12
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Mar 2022 09:31:13 -0700 (PDT)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-de2cb87f6aso2205131fac.10
        for <linux-gpio@vger.kernel.org>; Tue, 22 Mar 2022 09:31:12 -0700 (PDT)
X-Received: by 2002:a05:6870:c142:b0:dd:d5a3:767c with SMTP id
 g2-20020a056870c14200b000ddd5a3767cmr2047151oad.291.1647966672210; Tue, 22
 Mar 2022 09:31:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220310150905.1.Ie0a005d7a763d501e03b7abe8ee968ca99d23282@changeid>
 <CAHp75Vfbs6sPsrjwxNWLZQu=pEoar2K5sY=fX9a7KkOe=mwsZw@mail.gmail.com>
 <CAMRc=Mc_bw40uY68jcPYR-Lwe-qLcxmQeZO47WrexZtSiE_M5Q@mail.gmail.com> <CAHp75VcK0JDkTXuPc2N8G+OotXK0mqfQn7i4nDqXDODe1SqcrQ@mail.gmail.com>
In-Reply-To: <CAHp75VcK0JDkTXuPc2N8G+OotXK0mqfQn7i4nDqXDODe1SqcrQ@mail.gmail.com>
From:   Brian Norris <briannorris@chromium.org>
Date:   Tue, 22 Mar 2022 09:31:01 -0700
X-Gmail-Original-Message-ID: <CA+ASDXPncB=edDfXqkmWMqToQSt85UkAMzoApgyQATROoR1x9g@mail.gmail.com>
Message-ID: <CA+ASDXPncB=edDfXqkmWMqToQSt85UkAMzoApgyQATROoR1x9g@mail.gmail.com>
Subject: Re: [PATCH] gpio: Drop CONFIG_DEBUG_GPIO
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Jianqun Xu <jay.xu@rock-chips.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Mar 22, 2022 at 8:00 AM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Mar 22, 2022 at 4:49 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> > On Tue, Mar 22, 2022 at 3:38 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Mar 11, 2022 at 4:55 AM Brian Norris <briannorris@chromium.org> wrote:
> > >
> > > ...
> > >
> > > > Description: it says nothing about enabling extra printk()s. But -DDEBUG
> > > > does just that; it turns on every dev_dbg()/pr_debug() that would
> > > > otherwise be silent.
> > >
> > > Which is what some and I are using a lot during development.

Well, we could fix that part by updating the documentation, so users
know what they're getting themselves into.

I'm also curious: does dynamic debug not suit you?
https://www.kernel.org/doc/html/v4.19/admin-guide/dynamic-debug-howto.html
TBH, I never remember its syntax, and it seems very easy to get wrong,
so I often throw in #define's myself, if I want it foolproof. But I'm
curious others thoughts too.

> > AFAIK this: https://www.kernel.org/doc/local/pr_debug.txt is the right
> > way to do it?
>
> Yes. But it means we need to have a separate option on a per driver
> (or group of drivers) basis. I don't think it's a good idea right now.

I'm not sure I understand this thought; isn't this the opposite of
what you're arguing above? (That drivers/gpio/ deserves its own
Kconfig option for enabling (non-dynamic) debug prints?)

> > https://www.kernel.org/doc/local/pr_debug.txt
> >
> > This doesn't mention adding Kconfig options just to enable debug messages.
> >
> > > ...
> > >
> > > > -ccflags-$(CONFIG_DEBUG_GPIO)   += -DDEBUG
> > > > -
> > >
> > > NAK to this change.
> > >
> > > I'm not against enabling might_sleep() unconditionally.
> > >
> >
> > These are already controlled by CONFIG_DEBUG_ATOMIC_SLEEP, no? Or
> > maybe I can't parse that double negation.
>
> The part of the patch that converts might_sleep_if():s is fine with me.

I'm fine with that approach (keep CONFIG_DEBUG_GPIO *only* as a
print-verbosity/DDEBUG control), even if I think it's a bit odd. My
main point in the patch is differentiating debug checks (that I want;
that are silent-by-default; that have their own Kconfig knobs) from
debug prints (that are noisy by default; that I don't want). So if you
convince Bartosz and/or Linus, you can get an Ack from me for a
partial revert.

Regards,
Brian
