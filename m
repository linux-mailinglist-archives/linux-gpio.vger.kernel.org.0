Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 94041517105
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 15:54:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236475AbiEBN5w (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 09:57:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236323AbiEBN5s (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 09:57:48 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AF0F13DC2
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 06:54:20 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id l11-20020a17090a49cb00b001d923a9ca99so12791986pjm.1
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2022 06:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=KMLjelAQm14zk1bEIcVvty9Y+q7DpUAdjSmBIzqgGok=;
        b=JCtGEf41fwkLSaqkVxkF/txe0cxHWuapOkj4Is/ioydnRKv2Dayall3S9NYK78NeAW
         q8kA4m2ogU+BkBj7VWYo2hp7g2e4EBz/kUNyq8QZiZMJl8Ih1Au1Xk2Lg1dID57sQd8v
         MyDfIKDTDUQSt0xz5FM0yvMo8GjTR5tWgfYRPARmW9KVCtpaxSiDVCtY4q8sEzoQGJ6O
         ZRS2OlrJBJErLSg6H4hHrqAqiu9+g25mHJXI8yxdurhNJ1D80cVnd1xwKSgTrmZFEXfL
         mfZDtTVjQki3Nf5vU9AMZHKC0yB0bsZK472ao15Qvn7p3I2q7sx/9Akgt8Pw/FocL2IF
         MFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=KMLjelAQm14zk1bEIcVvty9Y+q7DpUAdjSmBIzqgGok=;
        b=e214umQs/69Q0byLlqE9kkPkkl4nAKRxFI7b/w410K9Onic+saapSoBQ7LTBEC+Ilp
         c3FCTvQ1Gk06H50P/DUhfqtAX/9RpbaSvPz7XEYtFoUdQTcNGeCVAJHEWA9ZnSyvqH4E
         nY6wu6pmjvPaTVXTYy5fSwQFc3/u3okJIGNcX9VAVO4J+/irr3m+389Te2zGKHjcK8s0
         T3zdaFiMZzQb/47ryJpDJJ0+Uo5TXTCrAuphaLEckwCnMRVj3Yxb9Wt+mZICYxPpt4vp
         xaDEEu5IXBps1LhykRvTbBo4+ZKokiSM1rsySNrh+LajjRa3chDUtjqCEUakNO46V9Yg
         RYLA==
X-Gm-Message-State: AOAM533ilDleJPYMC61X+Oy66KnMwHobtOP6cBkz0Wx9v0ClBOy2YhfQ
        ksD/Q4bol57NekR5zZ9kH18=
X-Google-Smtp-Source: ABdhPJzKTsDy5iE7MYQQPBAjNxAilXosYBcz1Q6PjDHmT6rkYGVe5IOsi/dbpeUnywyup3Jtt7MLvQ==
X-Received: by 2002:a17:902:e546:b0:15e:b129:7d8 with SMTP id n6-20020a170902e54600b0015eb12907d8mr1283606plf.138.1651499659571;
        Mon, 02 May 2022 06:54:19 -0700 (PDT)
Received: from sol ([118.209.204.33])
        by smtp.gmail.com with ESMTPSA id z21-20020aa791d5000000b0050dc76281ddsm4715613pfa.183.2022.05.02.06.54.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 06:54:18 -0700 (PDT)
Date:   Mon, 2 May 2022 21:54:12 +0800
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
Message-ID: <20220502135412.GA16365@sol>
References: <20220426125023.2664623-1-brgl@bgdev.pl>
 <20220426125023.2664623-6-brgl@bgdev.pl>
 <20220427060153.GB118500@sol>
 <CAMRc=McZirBT_sdWxrhVomUoODTb-tz-og86Zf6KY4BBMXOw7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=McZirBT_sdWxrhVomUoODTb-tz-og86Zf6KY4BBMXOw7Q@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, May 02, 2022 at 02:34:34PM +0200, Bartosz Golaszewski wrote:
> On Wed, Apr 27, 2022 at 8:02 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Tue, Apr 26, 2022 at 02:50:23PM +0200, Bartosz Golaszewski wrote:
> > > This contains the actual implementation of the v2 C++ bindings.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> >
> > [snip]
> >
> > > +
> > > +GPIOD_CXX_API ::std::size_t line_request::num_lines(void) const
> > > +{
> > > +     this->_m_priv->throw_if_released();
> > > +
> > > +     return ::gpiod_line_request_get_num_lines(this->_m_priv->request.get());
> > > +}
> > > +
> > > +GPIOD_CXX_API line::offsets line_request::offsets(void) const
> > > +{
> > > +     this->_m_priv->throw_if_released();
> > > +
> > > +     ::std::vector<unsigned int> buf(this->num_lines());
> > > +     line::offsets offsets(this->num_lines());
> > > +
> > > +     ::gpiod_line_request_get_offsets(this->_m_priv->request.get(), buf.data());
> > > +
> > > +     auto num_lines = this->num_lines();
> > > +     for (unsigned int i = 0; i < num_lines; i++)
> > > +             offsets[i] = buf[i];
> > > +
> > > +     return offsets;
> > > +}
> > > +
> >
> > My previous comment was "Cache num_lines locally rather than calling
> > num_lines() several times."
> >
> > You cached it in the wrong place - it should be first thing in the
> > function, so you only call it once, not three times.
> >
> 
> I fixed it when applying.
> 
> > And the throw_if_released() is still "redundant as this->num_lines()
> > also does it", and it is the first thing called here - after the
> > throw_if_released().
> >
> 
> I think it's still worth having it here because at least the code
> makes it clear, we need to have a valid request here. It's not like
> it's a hot path where this additional function call would matter IMO.
> 

So add a comment?
Pointless work is pointless work, hot path or not.

> > And I would've made this patch 3/5, not 5/5.
> >
> > But I'm fine with this set going in either way - in fact give its size
> > I'd rather see minor tweaks applied later than go through another round
> > of review.
> >
> > For the series:
> >
> > Reviewed-by: Kent Gibson <warthog618@gmail.com>
> 
> Thanks I applied it for now as it is, let's get it into master with
> the Python bindings and then polish it some more there.
> 
> >
> > I really would also like to see some feedback from C++ developers that
> > will actually be using it, as they have a bigger stake in it than I do.
> > But that is up to them.
> >
> 
> Indeed, any idea where to post that to get some free code reviews from
> C++ devs? :)
> 

That does raise the issue of whether libgpiod should have a forum other
than this mailing list.

I was hoping to at least nudge the others on the CC list ¯\_(ツ)_/¯.
If no one is sufficiently interested to bother reviewing, or even acking,
the C++ bindings, perhaps deprecate them instead ;-)?

Cheers,
Kent.
