Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B03F360155A
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 19:29:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229452AbiJQR3W (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 13:29:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230240AbiJQR3T (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 13:29:19 -0400
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D7772FFD
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 10:29:07 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id e22so4619237uar.5
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 10:29:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QM3ay29stJ6T3EPksB3W/Rdmd8GJLiwsJedRHa6WM8c=;
        b=WNl+mUERXiZpKj/sf7Pc2uaMmBn5Oxf806UUD7Zajm131l6Hjsupo6+Ltnm8zHldhH
         4jC28AFipbs6eGhPAdX611Jpxv9tZcy/aN9BpnBbozsIQ3D85q/BRKFXcsbHWEaV5UZI
         PvDmBU/GRpL3gvFdeJOXvlolFqDXe3LCo/bzEHhdvNcjcMh9m9GlcsJv4nnnCvPP5M/F
         JuZizoOS7tzNcriBYjTazRtUYuFXQsK51c73OKWGOL3TU9Oq1jmtvV7xZE2d/TUGN/5p
         poPpksiQhPH7ebG+BnY0oBQXqAdVy2HjUzDbB8G3HdlMylZGbMreJrCThl84M35FdLu5
         w+4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QM3ay29stJ6T3EPksB3W/Rdmd8GJLiwsJedRHa6WM8c=;
        b=LUZPdj4g/lkYnUbOHf1zVONqlse/SX47EnwBbsjjeHM/CSQC2qCOVcNw4Y7dPweX5Y
         Tvp9Jc/uC/ySdRR8NLFm9T3+zvF0ylJLVSJuFDjKhL06zJIFVNjxoTuMKwisrLSTzV6B
         pn05P5Eyp3ZRUcFCHEgfBdBsdkSjKcb5AwuC10po5qb/2ZxaGRmnCI8EjPozylwY2Tz1
         68kYKHQNDhwkkNbs+v44Sc8oxuO3VnqZvD8AHfO+gMEXu2ffXrA4Xre5zgQMYnUvPAfd
         XWMi+eUkJIACHDioQ3UCjHA+oozYGE4xJfDzjd8Sy6GwvhXXvGdt3Fl9xpZAUldtJ5/p
         dtHg==
X-Gm-Message-State: ACrzQf0kECUEFccQr0OjEHN6bIid/rg/iHo87PMCvXBr2PM/kvRx17OQ
        NXOcD6Z2Rl0gFpSVa5Ew1vcE4KIhDEb1ZstOa2I/kA==
X-Google-Smtp-Source: AMsMyM589vkZSSRUhCs/T/QLLn7zVE2uWJoHATg5CjbYbo1FrYfdJwveIzsYmxBj9oQRxzao9duKOubqP/h0bblm9yk=
X-Received: by 2002:a9f:3626:0:b0:3b5:c921:e0aa with SMTP id
 r35-20020a9f3626000000b003b5c921e0aamr5215479uad.92.1666027621801; Mon, 17
 Oct 2022 10:27:01 -0700 (PDT)
MIME-Version: 1.0
References: <Y0eBbUkzryyJZKwq@sol> <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol> <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
 <Y01hlUvj7cSdpCcx@sol> <Y01kYc8K8oStLz3g@smile.fi.intel.com>
 <CAMRc=MfAVVpc_k9ZsAib1s5WCyThgmfTb46VCx7P8iuDKBpuoA@mail.gmail.com>
 <Y01+JhOMc53Dhps1@sol> <Y02Awqv4w3oC1Yib@sol> <Y02JDbeZbPJ6VftG@smile.fi.intel.com>
 <Y02JgEXQyjNryfkF@smile.fi.intel.com>
In-Reply-To: <Y02JgEXQyjNryfkF@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 17 Oct 2022 19:26:50 +0200
Message-ID: <CAMRc=Mf296635cTRHbkDyasMp6HBXcS-Ng0Fc3VRrJFkFiAwBg@mail.gmail.com>
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 6:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Mon, Oct 17, 2022 at 07:55:41PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 18, 2022 at 12:20:18AM +0800, Kent Gibson wrote:
> > > On Tue, Oct 18, 2022 at 12:09:10AM +0800, Kent Gibson wrote:
>
> ...
>
> > > Oh, btw, the parser fn version would be something like:
> > >
> > > def parse_value(arg):
> > >      (x,y) = arg.split("=")
> > >      return (x, Value(int(y)))
> >
> > Not a lisp, no need for too many parentheses. Also, we could use splices:
> >
> >       eqidx = arg.index('=')
> >       return arg[:eqidx], Value(int(arg[eqidx + 1:]))
> >
> > or with split()
> >
> >       l, v = arg.split('=')
> >       return l, Value(int(v))
> >
> > > lvs = [ parse_value(arg) for arg in sys.argv[2:]
> >
> > Dunno why you put spaces inside outer [], but okay.
>
> and this actually can be directly put to the dict constructor:
>
>         values = OrderedDict(parse_value(arg) for arg in sys.argv[2:])
>
> This looks short enough and readable.
>

Let's stop bikeshedding, I'll move on to stuff that really matters now. :)

Bartosz
