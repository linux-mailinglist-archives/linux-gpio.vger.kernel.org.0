Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 870DC562EF7
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 10:53:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232365AbiGAIwl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 04:52:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234854AbiGAIwX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 04:52:23 -0400
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69AB6E7E
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 01:52:22 -0700 (PDT)
Received: by mail-pf1-x42d.google.com with SMTP id t21so1861831pfq.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 01:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Jx9jtx/XNTqOBt85GUAAuTJloFAJBHUlyu7DU7cwbTg=;
        b=AS2QyM3dfUvuNaUXiTydyer+K3WEEUF70ynxMa0Q4JdSq7VzK3Ud6m5lHkUBl8lYtC
         4FjWWol22VCUU4EIlroffrLWCVjMPVV6n2R6HOWrzwzNBr16bdwWM5NpN7klVWGOO5Ng
         NtzrSqoYkY61FtItuLNlzu1+Xsvm4rSkdgcgtnD9omKVWvs27GVxwTndCA+T11KR2zo4
         4YwdlTdvk4P0Ju9FOX7T9LNWBfLIKBoYyx0dSViE68cM/bT0Kl+Fte/XukXsMFS633gs
         mcISTVCUQnq4tRJuK3xyUh2nidBhHG5T7S+jUSPrbaYvfn9FkLDCUzcPw5qJohv2gmd7
         +HCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Jx9jtx/XNTqOBt85GUAAuTJloFAJBHUlyu7DU7cwbTg=;
        b=kfK3vep8sBxyXhYEKj+8G2dmdeEYuurVCLs21WPgGH//QLi2F3B/9DsYIp6P1dv0HN
         UqUe35TDEFLnMHc1De2LTLqZamyRtp8HckS1U6fnhOpQwLJd2fT7VtnuDiImYHd9tdCl
         X73wfNCZXyJrcrC2i6QofHnaZKnOIwVZ/BRONlkyhUQsDE9OxP9Z88W2ehi+vPvABId5
         mBTT+XW5BxTa4q2E/RxF2gMn22b/x7XKPh193RfVorKGszHJvHg6o3Z70A+SSdb2lR3v
         X6K+jgq0771j9hIWmkMMEDYc96zIkYg9g+FewH6AiohTWS2PkixRDQ6Ktc9LCmwq+u+T
         tPBw==
X-Gm-Message-State: AJIora9NU+ev187yWfW0rAN75C8pjgMiS3PMuqKI0bBHENIcuCmiEG6k
        uWyvqmS9rUYyE+ui+4yLNLU=
X-Google-Smtp-Source: AGRyM1vHnO6ftfvA3wuUJzsri3knXMiFqfBvZvikp/Cb9ym20/9POZW5izKttEs1QMUXleBedZuHBw==
X-Received: by 2002:a63:2c2:0:b0:411:ef11:129e with SMTP id 185-20020a6302c2000000b00411ef11129emr321107pgc.185.1656665541885;
        Fri, 01 Jul 2022 01:52:21 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id b19-20020a621b13000000b00527f22dbe4asm5408444pfb.17.2022.07.01.01.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 01:52:21 -0700 (PDT)
Date:   Fri, 1 Jul 2022 16:52:15 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darrien <darrien@freenet.de>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jiri Benc <jbenc@upir.cz>, Joel Savitz <joelsavitz@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v2 5/5] bindings: python: add the
 implementation for v2 API
Message-ID: <20220701085215.GA35727@sol>
References: <20220630081450.GB23652@sol>
 <20220630083851.GA24642@sol>
 <20220701060736.GA28431@sol>
 <CAMRc=Mdhogn2HDR7NYmjugTi6V3zwcw38vmdpfH55f44EPOHRw@mail.gmail.com>
 <20220701072655.GA31738@sol>
 <CAMRc=McwhnjovSB7RuZQTnZ9tKww=WDvk813Wbmt5PYaK95cPA@mail.gmail.com>
 <20220701073338.GA33559@sol>
 <20220701080252.GB33559@sol>
 <CAMRc=Md7vzozjWLBMp8-fJX7Za9wKj9_uzYd9fgz5wE8gSk2AA@mail.gmail.com>
 <CAMRc=MdMSwbikyZZDVayd_HZ3B=nAA2ZFXhMh5v0quT5nsYoHQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MdMSwbikyZZDVayd_HZ3B=nAA2ZFXhMh5v0quT5nsYoHQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 01, 2022 at 10:32:30AM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 1, 2022 at 10:18 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> >

....

> > > > >
> > > > > Timedelta constructor is much more explicit than a float IMO. How
> > > > > about a compromise and taking both (mutually exclusive)?
> > > > > timeout=datettime.timedelta(seconds=1) == timeout_sec=float(1.0)?
> > > > >
> > > >
> > > > Maybe, but float seconds seems to be the way they do it.
> > > > If you insist on both then just the one timeout parameter and work the
> > > > type out on the fly. (it's Python, so dynamic typing...)
> > > >
> > >
> > > Same issue for chip.wait_info_event(), btw.
> > > Still working through a full review - but it'll probably take a while.
> > >
> > > Wrt the wait, does the C API have a blocking wait, or do you have to
> > > poll() the fd?
> > >
> >
> > Blocking wait is simply reading the event without checking if an event
> > is there to be read. select() (the system call) waits indefinitely if
> > the timeval struct is NULL, ppoll() behaves the same for a NULL
> > timespec, poll() does the same for a negative timeout (which is an
> > int). We take an uint64_t so we can't do it. Either we need to switch
> > to int64_t and interpret a negative value as indefinite wait or just
> > not do it at all and tell users to just call the (blocking)
> > read_edge_event().
> >
> > Bart
> >
> 
> I'm still on the fence about using timespec. It seems that the more
> recent linux interfaces avoid timespec and timeval altogether due to
> the year 2038 problem and the subsequent change in the struct layout.
> On the other hand the timeouts are unlikely to be set to years. :)
> 
> What do you think?
> 

I prefer not using timespecs.  I prefer the int64 microseconds/nanoseconds
or float seconds approaches.
Especially for the time scales we are concerned with.
I only use timespecs where existing APIs such as ppoll() require it.

For the C API I'd go with int64 nsec, for Python float secs.
(though as already covered - with Python you could accept float
secs, int nsec, or a timedelta all in the one parameter)

Cheers,
Kent.
