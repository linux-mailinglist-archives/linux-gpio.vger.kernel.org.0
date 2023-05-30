Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2821F7166D2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 May 2023 17:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbjE3PSI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 30 May 2023 11:18:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbjE3PSH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 30 May 2023 11:18:07 -0400
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EB7ABE
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 08:18:06 -0700 (PDT)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-64d2e8a842cso3436105b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 30 May 2023 08:18:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685459885; x=1688051885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cPFeLL3RYoEbWXT4QX7QtV29zz9S+Jf+vuHVabYwGMI=;
        b=lKZdM+Y/eONISk06G/8ppNi0qhSuoY4EZW4yylPcFYq85ELTEra8c6+89qy7uW56LP
         zZQUw678HVtFwamqJTQxhivkYQA9IgwaGSvcTlbTmjCfjP0M8CSs5eNrBu25diqNQvQM
         iiRT8ubmgXMq5jvJOTF+k41CyvwCq9IGU8ho31QIzAa8R8EV01857OlhJKosaY8EOHVn
         +oevgXHcWoXaqjLNKmhsMIzSpn5rUAZWk7UxebmqUHAw57q5txG20JPfxs2rLRcRV4CZ
         83gaF1b0PfNzSAPXoDMNAW2BaO+WWsQonB4EQY0dLD+kwzQw/7K4h8BeaaPnOQsWTdLh
         XJfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685459885; x=1688051885;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cPFeLL3RYoEbWXT4QX7QtV29zz9S+Jf+vuHVabYwGMI=;
        b=XTYmtzSNnx/96IRav8M88HCZgibdk4SEHuSbtctNndzr9RkvX4Ey0yW2jEmpi2E2wM
         FzxBaF9yFier6RNN2rzNKgKSJfTHOK+z3QWAxKPoz0eo1x3XRvWFP0/qpfG2FJvLwNji
         dQ/ppNe5Wl1fZbvFMJGdvzEYpnf1Z3sbTz5rzfCQj4z5jmYcmC2m6H0iALr67gqh/8sL
         EzU0cfAjxAlOQNOup2w6xsFVLEdmoc/tKpq4gNp1x8KvhxlaWMea8dR5g3A0K79OJ9er
         pI8SZqmlx+5jp5HR3YxjmTBC4ZGpuYpSYHKa1Ev1qxyeWmhBDOXVNfwrKwcbICNh4m0S
         xdSw==
X-Gm-Message-State: AC+VfDzlG8inm/3nku1RgBmAl1+9tbMcsV5dBJ8D9lHLkr8w9zY0iunf
        NO/D8P1x7eUu7nA0UotHat+6xKcopWI=
X-Google-Smtp-Source: ACHHUZ5fHOspxfyL7IokOaQEOJZqVFTyMeGiu1JNM2kYVZ6TMdhWMqT+S3BAsTMvZRcGnw8C0F/YzQ==
X-Received: by 2002:a05:6a00:114e:b0:64d:123d:cc74 with SMTP id b14-20020a056a00114e00b0064d123dcc74mr3208221pfm.4.1685459885515;
        Tue, 30 May 2023 08:18:05 -0700 (PDT)
Received: from sol (194-223-178-180.tpgi.com.au. [194.223.178.180])
        by smtp.gmail.com with ESMTPSA id c14-20020a62e80e000000b0064d35cdaa54sm1705853pfi.218.2023.05.30.08.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 May 2023 08:18:05 -0700 (PDT)
Date:   Tue, 30 May 2023 23:18:00 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "Slater, Joseph" <joe.slater@windriver.com>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "MacLeod, Randy" <Randy.MacLeod@windriver.com>
Subject: Re: [libgpiod][PATCH 1/1] gpio-tools-test.bats: modify delays in
 toggle test
Message-ID: <ZHYTqIt+CZOf4XTR@sol>
References: <20230524210945.4054480-1-joe.slater@windriver.com>
 <ZG7bpE8xRuIeq7J+@sol>
 <BY5PR11MB3992F8CA5B13108F6310D72A88469@BY5PR11MB3992.namprd11.prod.outlook.com>
 <CAMRc=MeOiCKkn2OqNtSfRrh6_jSgEpWbh5DJNK30FmKP5NfPDg@mail.gmail.com>
 <ZHXKRtJOYSw42BAi@sol>
 <CAMRc=Md8CSiX4PyoXG-Xy0PktHseLgecRUEC=XZWsQmMRAuWSQ@mail.gmail.com>
 <ZHYHAXLPwX0C7aTK@sol>
 <CAMRc=MciugO5qS_fzfEipWN7vHBUKWLVkAJFLShZeuK8u9W9Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MciugO5qS_fzfEipWN7vHBUKWLVkAJFLShZeuK8u9W9Bw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 30, 2023 at 04:52:36PM +0200, Bartosz Golaszewski wrote:
> On Tue, May 30, 2023 at 4:24 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, May 30, 2023 at 04:13:06PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, May 30, 2023 at 12:05 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Tue, May 30, 2023 at 11:51:05AM +0200, Bartosz Golaszewski wrote:
> > > > > On Thu, May 25, 2023 at 11:54 PM Slater, Joseph
> > > > > <joe.slater@windriver.com> wrote:
> > > > > >
> > > > > >
> > > > > > [Slater, Joseph] I'll get rid of the comment and try the test with a shorter toggle time.
> > > > > > The series of 159 tests takes, maybe, 10-15 minutes for me, so I don't think saving a
> > > > > > second or two here would make much difference, though.
> > > > > > Joe
> > > > > >
> > > > >
> > > > > That can't be right, are you running it on a toaster? It takes 26
> > > > > seconds on my regular lenovo thinkpad laptop which is still longer
> > > > > than I'd like but quite acceptable for now (though I agree it would be
> > > > > great to improve it).
> > > > >
> > > >
> > > > Consider yourself blessed.
> > > > I just got:
> > > >
> > > > real    2m25.956s
> > > >
> > > > on my test VM.
> > > > Not sure exactly what the hold up is - it isn't using much CPU, or any
> > > > other resources AFAICT.
> > > > Compared to all the other test suites I run, this is far and away the
> > > > slowest, especially since switching everything over to gpio-sim.
> > >
> > > I agree it's too slow - be it 20 seconds or 2 minutes. But similarly
> > > to you - it's very low on my TODO list as I only run it every once in
> > > a while. I'd be happy to accept any patches improving the situation of
> > > course.
> > >
> >
> > Same.  I already had a go at streamlining the tests when I updated them
> > for v2, so it is somewhat better than it was, but it is still painfully
> > slow for me.
> > To improve further I'd have to start digging around to see what bats is
> > up to.  Speaking of which, do we need to stick with bats?
> > I've driven similar tests with Python in the past, and I'm sure that
> > would provide a better experience.
> > What constraints do we have?
> >
> 
> I went with bats because it looked the fastest to write tests in -
> it's shell after all.
> 

Really?  I wouldn't write anything of consequence in shell if Python was
an option.

How about Rust?  I've gotten over how spartan the Rust test framework is
so I wouldn't have a problem writing it in that either.

> But I think that we could potentially package whatever python
> subprocess code we need into enough helper wrappers that it wouldn't
> be much more complex than this.
> 

The end result would look similar in terms of test complexity, but
should be much easier to write and debug.
Not that that counts for much given we have a functional bats test
suite.

> We also already have python wrappers for libgpiosim ready.
> 

Exactly.  And Rust bindings too.

> No objections from my side, it's just that I won't have time to
> rewrite the entire thing in Python anytime soon.
> 

I'll update my todo list.  No promises - it is low priority given the
only real problem with the bats solution is its performance.

Cheers,
Kent.

