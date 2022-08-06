Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3539D58B5BB
	for <lists+linux-gpio@lfdr.de>; Sat,  6 Aug 2022 15:41:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbiHFNlC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 6 Aug 2022 09:41:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230018AbiHFNlB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 6 Aug 2022 09:41:01 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57BEC101D9
        for <linux-gpio@vger.kernel.org>; Sat,  6 Aug 2022 06:40:59 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id w10so4928323plq.0
        for <linux-gpio@vger.kernel.org>; Sat, 06 Aug 2022 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=8UF6vpO4Dq9eext38cykAkTphDRwA4rwPpzzboMgFeY=;
        b=kfDr4lNF+ErY8mDnK2Ib+z8tY9BiTob8JVgpFSkg0n6P41qzSSle80EzxF9g43J4//
         ZerIziiWbevFxVLGlMqLaIFhlsdkxqYqwrejox68BM8zYjdKCXiodj4CNPHB3VAqC6TE
         KvgsPOHfjdxut6rzJK+r9LJsfUtUvaQ20P/TGc4y8M4zq6wPdjFQX/xd96t+LgO1JnU0
         t+s/P00iMUC6ZIdszbN0rbSHyfShzvB0p8QWZO/8pwsKiHTEBIAsSfyz8FOgOpAWO6F/
         oBRFilAF9GDp4TVV8SRP/cRq/wJttLS9srOLUENKP2AVgAd2Be9sraW0uB+5dSPDc30Y
         IlPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=8UF6vpO4Dq9eext38cykAkTphDRwA4rwPpzzboMgFeY=;
        b=R5spA9+GHgsk2nL+L4387YQC+Ih/pCEgDnujHhb0An8Q54BpuYuLOcBxT7h2OZizgl
         cqYbQ8YLUhuO9CcyYK15x+iuYbSoeJWu9GHzNhuCuvUF2z7nrOPHmNkDQfYN2ep1I97Q
         xxh3Ln+2mpxM/juXdQC6nIYfxtYbTvBPP+b4bALhpW2rHTkpTg+jVaRoA8ZyXDRXD/VI
         tt+u/dUqmQEr2j+x/pLHbi3OoInVWdxNEumM0nft4BIruyuXSR9Hkd3l6nkkKgvYpuZ9
         lW/z4OkZRw5sMD4juuAXRF7y1O9mqew/KZ2EVnSAprLCss/6UInHRW9DHLXbLWuYffgQ
         ti4g==
X-Gm-Message-State: ACgBeo0BmqLfAM0uZu0FpVcY0ydRYXAvf5HxFoBkrhBFcqcejBeINJ/L
        MhXXWz9KfSpkBUTAGpZwXhx3WQUzZk8=
X-Google-Smtp-Source: AA6agR4s/3oyLoXc2BLrQUBVAqMN4sUNF9/ldO5A2aVRynm2Ywmt1F8IWQTpbyQBmSKkrz65BLX8zw==
X-Received: by 2002:a17:903:18b:b0:16e:f09c:919b with SMTP id z11-20020a170903018b00b0016ef09c919bmr11368209plg.135.1659793258820;
        Sat, 06 Aug 2022 06:40:58 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902e19400b0016edd557412sm4913171pla.201.2022.08.06.06.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Aug 2022 06:40:58 -0700 (PDT)
Date:   Sat, 6 Aug 2022 21:40:52 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Robert Baumgartner <rbaumgar@redhat.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [libgpiod] How can I use PWM
Message-ID: <20220806134052.GA26217@sol>
References: <CAKdJ40QqZt3MbeLNZ1fuYRgaTqSJeDaDdHkQSx1-KWCW4BcJPg@mail.gmail.com>
 <CAHp75Vd2dh5QDxAY-9N0xu6D0ywBcYnRL6FF5ZoKdqnnkBtAyg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vd2dh5QDxAY-9N0xu6D0ywBcYnRL6FF5ZoKdqnnkBtAyg@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 06, 2022 at 12:12:31PM +0200, Andy Shevchenko wrote:
> On Fri, Aug 5, 2022 at 1:17 PM Robert Baumgartner <rbaumgar@redhat.com> wrote:
> >
> > Hi team,
> >
> > I try to migrate some python scripts for my Raspberry from RPi.GPIO to
> > libgpiod,
> 
> This is great and everyone should be encouraged to follow your example!
> 
> > but I miss PWM features.
> > Do I miss something? Or is it not available?
> 
> No, you haven't missed anything except Unix ideology. That ideology is
> telling us that one tool for one thing, and in very featurable mode.
> That said, lingpiod is exclusively for GPIO ABI between kernel and
> user space. For PWM you need to access the PWM ABI in a way how it's
> represented by the Linux kernel. I believe there are plenty of
> libraries more or less okayish for that purpose, but I never heard
> about any official library and/or Python bindings for it.
> 

I'm assuming Robert is refering to software PWM.  AFAIAA Rpi.GPIO doesn't
support hardware PWM, and the referenced article also refers to software
PWM for the Python case.

libgpiod doesn't directly support software PWM, but it is fairly
straight forward to implement yourself using libgpiod.

Separate from Andy's point on Unix ideology, adding it to libgpiod would
involve threading or async, which in C would open cans of worms that are
best left to the specific application to decide on.  So I don't see it
ever going into the core libgpiod.

Not such an issue for Python with its included batteries, so I would
personally consider adding something along those lines to the Python
bindings, and possibly the Rust as well.  OTOH I suspect Bart's
preference is for the bindings to idiomatically wrap, not extend, the
libgpiod API.

Cheers,
Kent.
