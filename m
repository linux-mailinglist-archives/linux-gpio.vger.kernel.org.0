Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A143B562E50
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 10:33:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233993AbiGAIcr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Jul 2022 04:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236480AbiGAIcp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Jul 2022 04:32:45 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6260013D44
        for <linux-gpio@vger.kernel.org>; Fri,  1 Jul 2022 01:32:45 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id x20so1734317plx.6
        for <linux-gpio@vger.kernel.org>; Fri, 01 Jul 2022 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qWObJxffPdGU7fQb4qR3zaih2iN/eXwl89RMnmQaO7c=;
        b=jnDgOHQ5wk+hmoOreC8w6ap5YTkZxAetfSHxsVs0gQVzSnCYF13R8gK18ZEUE8fXi5
         X9i9wHTKQzL9hn4Vh7dkh+6esE5pXkruYyQhVleC4FyW+N6SkLGYyYcZgYd14C+Ih6MG
         ru0QPv0knJHMvfArUz9GWt2c1soynJo4+cLu1yEJGND/7sdWpdMaUNYZ6wsuTp9Tz4nk
         gq+Leyg5qcssS6GgJwncEFwL7i26RKyWjp7hjqDMEzCkZq2BAgE3iBHTdAsb1dwI/8nZ
         ip8/tbeA7XFTmcuNnfQdJgZYXz6KB0lmL/2nkyk+L7DCJYDvU/NWRkSSixZwZ5/3IkUr
         HAAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qWObJxffPdGU7fQb4qR3zaih2iN/eXwl89RMnmQaO7c=;
        b=bB5nsqOAwf0xGSj+d8KD2TgjsM/dYiwbIngOmpkeV08yPzkUPAezl7ly1YPWGss1Ek
         C7wYetGGrJahKXsaN+tf8W0onzrKDA5LswXHxfLYkWJ45dTPEmOOgJ8Or4ww/znWe7nJ
         rQ5VhOS/6ro81l8l849WrDJgj7TkaLwZGzj0CjFEhUqyG3+y4u9bI7N/GALC5kr54lj1
         meoOYVQ2bCQHU5xhBZZvnDfCf4Ry8XYnewA+EDSbInkPl4EECIH93ERN/pj4V/4HCCNp
         Rnqm+EZrIvdJNEv2nl8yXHSBqvTnzMKgUv4MhCMLHfLmHjjZZOKn5D+gvYe5v2kifY2y
         Kjow==
X-Gm-Message-State: AJIora8jT2fgS9/Cc9BT4bTrDS1VKAVMCav7CrFfwu84glOmi3gClhz0
        C1PTMoJbz06MPUcQltH37QM=
X-Google-Smtp-Source: AGRyM1tC147qPe4L3qdJGFjG4EyUSiSP+zX4jFEgATfuYDmbYO6gpWov+h8xAJrBxaxEsRZU/I2PhA==
X-Received: by 2002:a17:903:268b:b0:16a:17e5:f2a9 with SMTP id jf11-20020a170903268b00b0016a17e5f2a9mr18307535plb.38.1656664364911;
        Fri, 01 Jul 2022 01:32:44 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id z9-20020a1709027e8900b0016b865ea2d6sm8708195pla.82.2022.07.01.01.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 01:32:44 -0700 (PDT)
Date:   Fri, 1 Jul 2022 16:32:38 +0800
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
Message-ID: <20220701083238.GA35145@sol>
References: <CAMRc=MfXqKuj4u9OiBe5Euo8BtRFb06CMZbLOoF6PD2OvJsRWg@mail.gmail.com>
 <20220630081450.GB23652@sol>
 <20220630083851.GA24642@sol>
 <20220701060736.GA28431@sol>
 <CAMRc=Mdhogn2HDR7NYmjugTi6V3zwcw38vmdpfH55f44EPOHRw@mail.gmail.com>
 <20220701072655.GA31738@sol>
 <CAMRc=McwhnjovSB7RuZQTnZ9tKww=WDvk813Wbmt5PYaK95cPA@mail.gmail.com>
 <20220701073338.GA33559@sol>
 <20220701080252.GB33559@sol>
 <CAMRc=Md7vzozjWLBMp8-fJX7Za9wKj9_uzYd9fgz5wE8gSk2AA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Md7vzozjWLBMp8-fJX7Za9wKj9_uzYd9fgz5wE8gSk2AA@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 01, 2022 at 10:18:00AM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 1, 2022 at 10:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> >

....

> > > > Timedelta constructor is much more explicit than a float IMO. How
> > > > about a compromise and taking both (mutually exclusive)?
> > > > timeout=datettime.timedelta(seconds=1) == timeout_sec=float(1.0)?
> > > >
> > >
> > > Maybe, but float seconds seems to be the way they do it.
> > > If you insist on both then just the one timeout parameter and work the
> > > type out on the fly. (it's Python, so dynamic typing...)
> > >
> >
> > Same issue for chip.wait_info_event(), btw.
> > Still working through a full review - but it'll probably take a while.
> >
> > Wrt the wait, does the C API have a blocking wait, or do you have to
> > poll() the fd?
> >
> 
> Blocking wait is simply reading the event without checking if an event
> is there to be read. select() (the system call) waits indefinitely if
> the timeval struct is NULL, ppoll() behaves the same for a NULL
> timespec, poll() does the same for a negative timeout (which is an
> int). We take an uint64_t so we can't do it. Either we need to switch
> to int64_t and interpret a negative value as indefinite wait or just
> not do it at all and tell users to just call the (blocking)
> read_edge_event().
> 

If you want to support timeout=NONE for the Python API then you will
have to change the C API to int64_t to support negative for blocking.
Having the Python req.wait_edge_event() switch to calling the C
read_edge_event() for that case isn't an option.

Cheers,
Kent.
