Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA7E72C8FE
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 16:54:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238065AbjFLOyJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 12 Jun 2023 10:54:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238173AbjFLOyH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 12 Jun 2023 10:54:07 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F86DCD
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:54:00 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6549df4321aso4549109b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 12 Jun 2023 07:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686581640; x=1689173640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wyl4Y+vPfZo91Dd64if2wm7dA3d5X/87IMVXXrPZ6Oc=;
        b=pfIY4AwoMQ14b64D2o5exABOiN8aFT8HMwBlUGIjvTgIPj9E4mxiZN+mqDa8aGR9Bt
         3DhsP9Y4uWxUazNvsixG/H7Karc7Fl71RFYcvFpWogy5rNbh08BWXVG1+Id0OM9HoB5+
         Zzv8TrC90Ax2Vnxf/nXEDO+Ebjx/QNqXEwRwSAzrObyeKm+ilvq4EsHOKabX1QD2Gos6
         M9HMkdUGBLs8h92JcSxag/iNDFASfG1IBNNRzGuQpBjdfdfu4AIy0lDXaLM+YIKeyorH
         7NuPuiHVHz+pGvZL/IUT4CqM+z3g+4RmO+CbYYz3VKkVy2mdiVdIUdfEy38cfZpkzW2J
         ZEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686581640; x=1689173640;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyl4Y+vPfZo91Dd64if2wm7dA3d5X/87IMVXXrPZ6Oc=;
        b=PI/V2yP25kXUvMx+q86D1+bn7pUnEPvhyRurtXlSs0eJfP0ANqJbVACN/geWqhqARp
         Ke3UKogTSWsn0aPSwVZuKTLw2NJdX056WQwphc6Dd1HyGVfJxPGm92qe+PhdtZDUoCE3
         tCutyL2TFUbq0jyOflfMR1PlSiQHIfZknHIzeYVs7Ckpz6LFoPZALkS8PFR8O8dx8VfQ
         SHS+GEM339EEdiWzsVezB3O7X3DIXUx0gPZj5KUkqcIFczHoL2tVjVA8bxRW62k2IRIB
         5jecxoIVLCn3svgQnIQNKyETOdR6tE4EafKDotrcuQ0YwTt7aPPcIDdM6/hfa9raBjHs
         qftQ==
X-Gm-Message-State: AC+VfDz5d0CvqJo2F+0KutnLvosIPSSMaJYghqEH4pm5VUkMtPOa67in
        isY/O157TVZL3g1oU5RO4m8Sn9ekJCI=
X-Google-Smtp-Source: ACHHUZ7HtJvnOIu3+Nml1Lw0ZuYXenileoRTCB/tuCdUTBEN5Yl87OIvryavzJKMXjgIcohc9NW69A==
X-Received: by 2002:a05:6a20:4417:b0:10d:6dc6:32c8 with SMTP id ce23-20020a056a20441700b0010d6dc632c8mr12243877pzb.32.1686581639612;
        Mon, 12 Jun 2023 07:53:59 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id x21-20020aa784d5000000b0064fd8b3dd14sm7007146pfn.124.2023.06.12.07.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 07:53:59 -0700 (PDT)
Date:   Mon, 12 Jun 2023 22:53:54 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     andy.shevchenko@gmail.com, Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org
Subject: Re: [libgpiod][PATCH 1/2] bindings: python: examples: fix potential
 glitch in gpioset.py
Message-ID: <ZIcxghbvNPtCr8+o@sol>
References: <20230609153607.133379-1-warthog618@gmail.com>
 <20230609153607.133379-2-warthog618@gmail.com>
 <ZIOJM-CgPrfKtIFC@surfacebook>
 <CAMRc=MeYRKpoU8TaOGnYCqrBy2BdxfNPKhorUx=5rkRNNC7dkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MeYRKpoU8TaOGnYCqrBy2BdxfNPKhorUx=5rkRNNC7dkg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jun 12, 2023 at 04:26:46PM +0200, Bartosz Golaszewski wrote:
> On Fri, Jun 9, 2023 at 10:19 PM <andy.shevchenko@gmail.com> wrote:
> >
> > Fri, Jun 09, 2023 at 11:36:06PM +0800, Kent Gibson kirjoitti:
> > > gpioset.py requests lines without setting their output value, and so
> > > sets them all inactive, and subsequently sets them to their requested
> > > value.  This can result in glitches on lines which were active and
> > > are set active.
> > >
> > > As this is example code, it is also important to demonstrate that the
> > > output value can be set by the request itself.
> > >
> > > Request the lines with the correct output values set in the request
> > > itself.
> >
> > Do we need a comment in the code to specify this?
> >

Andy, I'm not ignoring you - I'm still not getting mail from you, and I
hadn't looked on the list for replies.  Weird.

In answer to your point - yes and no.  The code is not doing anything
unusual, so no.  OTOH it does serve as example code, so a bit of
commentary wouldn't hurt.

> > ...
> >
> > > +    config = dict([(l, settings(v)) for (l, v) in lvs])
> >
> > Aren't [] not needed?
> >

Ok, but now I did get this one:

> Think about it in dynamic:

> In [1]: x= [(1,2),(2,4)]
> In [2]: dict((a,b)for a,b in x)
> Out[2]: {1: 2, 2: 4}

> [] are redundant, so I remembered that correctly 😄

Terrible example - which 2 is which?
1,2,3,4 would've been better.

True - dict() accepts an iterable, so the [] are redundant in thise case.

Cheers,
Kent.
