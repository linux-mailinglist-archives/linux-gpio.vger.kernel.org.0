Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98457601309
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 17:54:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231164AbiJQPyU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 11:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230513AbiJQPyG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 11:54:06 -0400
Received: from mail-ua1-x933.google.com (mail-ua1-x933.google.com [IPv6:2607:f8b0:4864:20::933])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951F26D9D1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 08:54:04 -0700 (PDT)
Received: by mail-ua1-x933.google.com with SMTP id i20so4516162ual.4
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U0zCDwy7x1U1zGqBki4r/ZJvsmrn+/rT/617UOGKydA=;
        b=xzC0hJbznC20qMGVOeCudS0llCE2+Ji0tvm6pdOruXKD29fMTuywYm4XmoM2/1SbJT
         8VINsy/d6/G1VA4cYVHU7CByaEQupiUxde1xH6gl28lkQSjda+EfoD52Qz4iJap+6Q5V
         bCy+gPRuQi20G9i7lfNBidBB4HM2d+QAzdcMwkJpJHQAbfBgSVa/UklOxsigzsz0xjvF
         t6AJKiNRDDxc9P/1wfyZF8NL18xzCLQf6sHcknF9J/zzb5QbFTWDd7tj/t260vUV1RrG
         6BSi6ENCLkkHRMzk4pU4aeA9koYr+fJNfqONZEz45D1EH42BJwwXzdfyCUfYj2hC0p/m
         68ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U0zCDwy7x1U1zGqBki4r/ZJvsmrn+/rT/617UOGKydA=;
        b=RL2SzFkmOowRYRroMncq7msHh4jr+PqskMKADhAdIJQj0HlIJZm+e+aVNkyY7HZHqD
         rvgxu1bjcMze776JghNdyN9M1i9FqoYMZWLlr5wiq3bBqf9iaVMFr51S6+a4omIdK7Rs
         /84dgdKLTG5PHTJ6hMScOE7N4em/YWdfKVD9rU8mYocHlG/RRvmIe8+WNptaOJEHEqim
         +rfE/9kxhZhaC3aMbXG9GlzMZK/LdJbGKddyGiHjd0WwFp3bJ5Fu6mQ7xFerTU9GBMdN
         3+ON3WZ6Ep3Z/14zpuEma9MKooObkEJ2KTxIcT60KvDUQYOtALoBeF3L0qhuCPeCAVdI
         8SHg==
X-Gm-Message-State: ACrzQf3/iKDTYK6hjASJKoaRfgXjjYhjHXTfSZZvn0UEk8eOUoQViQgO
        UZzXqWTcr5DutcLr49R+VAMqH/wjYv0+pZXO3Chpcg==
X-Google-Smtp-Source: AMsMyM51VL4l4nyGUXkeiT1H5avDBYQm2Ghz5SIs90qVIihLLLuxaHmDDGQNNMMn/ROM4Z6bIP/sMpIN+8asYaYnWq8=
X-Received: by 2002:ab0:39d9:0:b0:3e2:39a9:a986 with SMTP id
 g25-20020ab039d9000000b003e239a9a986mr5171247uaw.81.1666022043596; Mon, 17
 Oct 2022 08:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <20221007145521.329614-1-brgl@bgdev.pl> <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol> <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol> <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
 <Y01hlUvj7cSdpCcx@sol> <Y01kYc8K8oStLz3g@smile.fi.intel.com>
In-Reply-To: <Y01kYc8K8oStLz3g@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Oct 2022 17:53:52 +0200
Message-ID: <CAMRc=MfAVVpc_k9ZsAib1s5WCyThgmfTb46VCx7P8iuDKBpuoA@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 4:19 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 17, 2022 at 10:07:17PM +0800, Kent Gibson wrote:
> > On Mon, Oct 17, 2022 at 04:49:55PM +0300, Andy Shevchenko wrote:
> > > On Mon, Oct 17, 2022 at 08:11:28PM +0800, Kent Gibson wrote:
> > > > On Mon, Oct 17, 2022 at 02:00:15PM +0200, Bartosz Golaszewski wrote:
> > > > > On Thu, Oct 13, 2022 at 5:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > > On Fri, Oct 07, 2022 at 04:55:19PM +0200, Bartosz Golaszewski wrote:
>
> ...
>
> > > > > >         lvs = [ arg.split('=') for arg in sys.argv[2:] ]
> > > >             lvs = [ (x,int(y)) for (x,y) in lvs ]
> > > > > >         lines = [ x[0] for x in lvs ]
> > > > > >         values = dict(lvs)
> > > > >
> > > >
> > > > An extra pass to fix the int values.
> > >
> > > In Python we have map(), which I think is the best for that kind of job.
> > >
> >
> > My understanding is map/filter is old school and list comprehensions
> > have replaced map, as generators have replaced filter.
> >
> > i.e.
> >     list(map(function, iterable))
> > becomes
> >     [function(x) for x in iterable]
>
> Definitely it does not cover all the cases map() is taking care of.
> So it can't be old school :-)
>
> * Yes, in this particular case it may be map() or list comprehension.
>   But I think with map() the two lines can become one.
>
> > Either way, what we are missing here is a parser function that gives us
> > exactly the (offset,value) output we want from the command line string.
> >
> > Oh, and we need both the lines list and the values dict, both of which
> > are easily created from the interim lvs.
> >
> > > > You could do it in one with a more appropriate parser function.
> > >
> > > It seems we need some Python guru to revisit the code, because to me
> > > it looks a bit C:ish :-)
> >
> > The for loop or the list comprehension?
> > Last I checked only one of those is available in C.
> > And yeah, the for loop version reads as C, so not at all Pythonic,
> > which is why I suggested the list comprehension.
>
> Yes, but I believe it does not utilize the powerfulness of the current Python.
> Anyway, I'm not a Py guru, take my remarks with a grain of salt.
>

How about this?

    lvs = list(
        map(
            lambda val: [val[0], Value(int(val[1]))],
            [arg.split("=") for arg in sys.argv[2:]],
        )
    )
    lines = [x[0] for x in lvs]
    values = dict(lvs)

It's so much less readable but at least it's pythonic, look at those
lambdas and comprehension lists and even a map! :)

Anyway - unlike the programming interface - these are just
implementation details that can be always improved later.

Bart
