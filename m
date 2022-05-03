Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F30B517F65
	for <lists+linux-gpio@lfdr.de>; Tue,  3 May 2022 10:06:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232640AbiECIIa (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 May 2022 04:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232614AbiECIIY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 May 2022 04:08:24 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FA871838B
        for <linux-gpio@vger.kernel.org>; Tue,  3 May 2022 01:04:52 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id g8so11723692pfh.5
        for <linux-gpio@vger.kernel.org>; Tue, 03 May 2022 01:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=T7IItMGhIBUjOewHLcVVaGps0NLubdVPiprOoOODtuQ=;
        b=Mn2OI8J4ixSGQekU0/iKqDtrSou8rPrzoMaWL1YPT7aKaE8i7Nwu/I/e4zR2iwQcJo
         O2hKc0EGeS4Ehs8lpSPwNPWdRcXBWSfXEdO8d4aU3zjHZ0eTx29AQeUkVCs891suo3Z8
         FfOeoFgBBnZfpYFkGHPpy5Dh13NLmjgV2WjbuHgphnfOfKLtoIdH4+xZmCPCT5AAQUnP
         wafvl5o1mCeyntMl3ostvSc1vF/mzqY6+O3QdKI2aj2ddQZqox6H/Lt3jD4JYihgwTxQ
         079jDe6fcAnSJAnUZpjOung9dJzTLqESgVtTPT2BkHioth/H2wSpaDxpd116LVjY04Xo
         e+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=T7IItMGhIBUjOewHLcVVaGps0NLubdVPiprOoOODtuQ=;
        b=RaeqmVqfg9Ea7m6NtxLI41EXtp2TYEXrq/XC614ASOARxcA15WFg4uMYa5szj/K5kD
         TgkmGbl78mVE9mkk6e4bq31LDTjx0g3e8v8+BcG49ogbyim/myjZ9FUmugJUqMvgmjKN
         /EVR0ZCdrHTtsjTFbVlCwecHdh0+SJZHMa04IzdKvdc5dSq1hd+F3Oru/hhUICnC+P6V
         WFZuyGmBn0YWxz+zsNQqUNrTnAyyuJB3tRvvqhrMKfEZV34qd8xwuSiCscpXx5XDKYSP
         TIiMIrHxizEi6ucJKZsffmGUfce/hT9mERLYEWNIqPeQFHIqMm7vXz/WxqF0uHF7iifA
         7IgA==
X-Gm-Message-State: AOAM530ZcHg+zWKhh09JkA82NVhzIwqSvZNQs/EZ2yl4bwaolshCYXH4
        tBaYxXAOiXVjgkND+PA/P/g=
X-Google-Smtp-Source: ABdhPJxXiQcj3XTSKpfooNose5Tn98l7VfzTRx8vaoV/JPwABweMPHYwOca1xFm3lNe8YJmBxRlgrg==
X-Received: by 2002:a63:38e:0:b0:3ab:ada6:a219 with SMTP id 136-20020a63038e000000b003abada6a219mr13046918pgd.140.1651565091963;
        Tue, 03 May 2022 01:04:51 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id e7-20020a170902ef4700b0015e8d4eb284sm5821108plx.206.2022.05.03.01.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 01:04:51 -0700 (PDT)
Date:   Tue, 3 May 2022 16:04:44 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Alexander Stein <alexander.stein@mailbox.org>,
        David Kozub <zub@linux.fjfi.cvut.cz>,
        Jan =?iso-8859-1?Q?Kundr=E1t?= <jan.kundrat@cesnet.cz>,
        Michael Beach <michaelb@ieee.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [libgpiod v2][PATCH v6 5/5] bindings: cxx: add implementation
Message-ID: <20220503080444.GA8054@sol>
References: <20220426125023.2664623-1-brgl@bgdev.pl>
 <20220426125023.2664623-6-brgl@bgdev.pl>
 <20220427060153.GB118500@sol>
 <CAMRc=McZirBT_sdWxrhVomUoODTb-tz-og86Zf6KY4BBMXOw7Q@mail.gmail.com>
 <20220502135412.GA16365@sol>
 <CAMRc=MdtE+bJ=2suVvYH3VmyBWjZbG+Ob=fMxPh=um2FeSgWhw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MdtE+bJ=2suVvYH3VmyBWjZbG+Ob=fMxPh=um2FeSgWhw@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 02, 2022 at 07:41:56PM +0200, Bartosz Golaszewski wrote:
> On Mon, May 2, 2022 at 3:54 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Mon, May 02, 2022 at 02:34:34PM +0200, Bartosz Golaszewski wrote:
> > > On Wed, Apr 27, 2022 at 8:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Tue, Apr 26, 2022 at 02:50:23PM +0200, Bartosz Golaszewski wrote:
> > > > > This contains the actual implementation of the v2 C++ bindings.
> > > > >
> > > > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > >
> > > > [snip]
> > > >
> > > > > +
> > > > > +GPIOD_CXX_API ::std::size_t line_request::num_lines(void) const
> > > > > +{
> > > > > +     this->_m_priv->throw_if_released();
> > > > > +
> > > > > +     return ::gpiod_line_request_get_num_lines(this->_m_priv->request.get());
> > > > > +}
> > > > > +
> > > > > +GPIOD_CXX_API line::offsets line_request::offsets(void) const
> > > > > +{
> > > > > +     this->_m_priv->throw_if_released();
> > > > > +
> > > > > +     ::std::vector<unsigned int> buf(this->num_lines());
> > > > > +     line::offsets offsets(this->num_lines());
> > > > > +
> > > > > +     ::gpiod_line_request_get_offsets(this->_m_priv->request.get(), buf.data());
> > > > > +
> > > > > +     auto num_lines = this->num_lines();
> > > > > +     for (unsigned int i = 0; i < num_lines; i++)
> > > > > +             offsets[i] = buf[i];
> > > > > +
> > > > > +     return offsets;
> > > > > +}
> > > > > +
> > > >
> > > > My previous comment was "Cache num_lines locally rather than calling
> > > > num_lines() several times."
> > > >
> > > > You cached it in the wrong place - it should be first thing in the
> > > > function, so you only call it once, not three times.
> > > >
> > >
> > > I fixed it when applying.
> > >
> > > > And the throw_if_released() is still "redundant as this->num_lines()
> > > > also does it", and it is the first thing called here - after the
> > > > throw_if_released().
> > > >
> > >
> > > I think it's still worth having it here because at least the code
> > > makes it clear, we need to have a valid request here. It's not like
> > > it's a hot path where this additional function call would matter IMO.
> > >
> >
> > So add a comment?
> > Pointless work is pointless work, hot path or not.
> >
> > > > And I would've made this patch 3/5, not 5/5.
> > > >
> > > > But I'm fine with this set going in either way - in fact give its size
> > > > I'd rather see minor tweaks applied later than go through another round
> > > > of review.
> > > >
> > > > For the series:
> > > >
> > > > Reviewed-by: Kent Gibson <warthog618@gmail.com>
> > >
> > > Thanks I applied it for now as it is, let's get it into master with
> > > the Python bindings and then polish it some more there.
> > >
> > > >
> > > > I really would also like to see some feedback from C++ developers that
> > > > will actually be using it, as they have a bigger stake in it than I do.
> > > > But that is up to them.
> > > >
> > >
> > > Indeed, any idea where to post that to get some free code reviews from
> > > C++ devs? :)
> > >
> >
> > That does raise the issue of whether libgpiod should have a forum other
> > than this mailing list.
> >
> > I was hoping to at least nudge the others on the CC list ¯\_(ツ)_/¯.
> > If no one is sufficiently interested to bother reviewing, or even acking,
> > the C++ bindings, perhaps deprecate them instead ;-)?
> >
> 
> Well, I've received enough emails over the years with questions about
> C++ bindings to assume they are being used (although Python bindings
> seem to be preferred indeed). I think it's just a significant amount
> of work to go through 10000 LOC just for fun, hence the lack of
> reviews. :)

That was why I asked to have the original patch split.
An end user/lite review could just cover the headers and examples, and
optionally the tools as additional examples, and say "yeah that makes
sense", or "why the hell did you do it that way?" and not have to concern
themselves with the impl or tests.

> 
> Anyway, I'm pretty happy with how they turned out and I intend to keep
> them. Hopefully nothing is too broken to require an incompatible fix.
> I'll try to find some reviewers outside the list in the meantime.
> 

Btw, by "deprecate" I didn't mean throw them away, just delay merging
them into master until you get some user feedback.
And even then it was in jest.  Mostly.

Cheers,
Kent.
