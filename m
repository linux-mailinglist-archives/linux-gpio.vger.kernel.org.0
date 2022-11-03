Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E0122617C8B
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Nov 2022 13:29:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231144AbiKCM3m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 3 Nov 2022 08:29:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbiKCM3l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Nov 2022 08:29:41 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06416BF44
        for <linux-gpio@vger.kernel.org>; Thu,  3 Nov 2022 05:29:41 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id 128so1540641pga.1
        for <linux-gpio@vger.kernel.org>; Thu, 03 Nov 2022 05:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=co6FIXnhs9oLRHRqlOMbc6Elga3uRut69UYTe2TyQ8k=;
        b=lfY97aMnBVHkfcaPW3fiRPFb0Wfd2XAePnPBTLDxnvGXX6mpNjjxjilQtZh8cuFHzf
         UNEVz7pMrWJJAWl0PlQ3SWeRCynYKpX3Sy5DHwezGkVqE6NiK3zC2pNLQZ2tknOcFN8d
         U1yRWFigqiKzCsVt5mlkCyx41XabzcYFq33iBabNLYLACkzpl8b/vRfvH2k9xgdz0Q+H
         bQSGKW2NaVKEu/PEWFz6Baa33EDzQklhmXEESuntajHTg2Fjfni8Jr+8VfB9YlvE5uCA
         EKgxcvcGUZh1L1I+jYTfhrbvNO2hHMUjk/+8Oaj1+64fiJyA7eVHSlgxyWmilVCN+o94
         YWwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=co6FIXnhs9oLRHRqlOMbc6Elga3uRut69UYTe2TyQ8k=;
        b=F4hp+1lwYw8GUv/tn7yEcJw0gIhtm+Oambtx1L8IJDKTU0rfLqzGWwZZvvcSSQUowa
         Mr3fVzgjFzysQsPypfW7lEYYeIN/cWJ+yVB65VF08poQzqoo/tLDVt7pL3XMYLRo/I/S
         nH742nezPrQihamEbYn3A+YQYa98HKj3AHNvAQ+IUUlvDF784pmKtcMz+xdjhSkF9VEi
         l+nIJkn8TTspUAnEDXC7Bjfmd68C5phayrBp1BCxR0BoDcTqpmul/Y8+e9hYRv7ZmaqC
         neICqvDhC3aYTbaEdXupwCN8nIHqZnEyAnAofFomwi2PdOxjkZtickhwc4lIzvfhCaZy
         rdtw==
X-Gm-Message-State: ACrzQf1CHpPGuDzjzHnCZiaYaDphgDAxGLHRVJPaUP6P6ro7CiL4u2Ef
        XxSdcXS9vkas515cEeF+NDQ=
X-Google-Smtp-Source: AMsMyM7xosxNor3h2W+q+FuuShjcM5ADyBlfpnSfAsPGeE9Bzjfe2Pwz5QSMNvSr3vVF4kQznmNPFg==
X-Received: by 2002:a63:5243:0:b0:43c:96a:8528 with SMTP id s3-20020a635243000000b0043c096a8528mr25471493pgl.47.1667478580458;
        Thu, 03 Nov 2022 05:29:40 -0700 (PDT)
Received: from sol (14-200-229-209.tpgi.com.au. [14.200.229.209])
        by smtp.gmail.com with ESMTPSA id h7-20020a170902f54700b001754fa42065sm554301plf.143.2022.11.03.05.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Nov 2022 05:29:39 -0700 (PDT)
Date:   Thu, 3 Nov 2022 20:29:33 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Viresh Kumar <viresh.kumar@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-gpio@vger.kernel.org,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        stratos-dev@op-lists.linaro.org,
        Gerard Ryan <g.m0n3y.2503@gmail.com>
Subject: Re: [PATCH V7 3/8] libgpiod: Add rust wrapper crate
Message-ID: <Y2O0LRbTvzCsbDKK@sol>
References: <20221021112238.teqz25pn3hz5d4cs@vireshk-i7>
 <Y1KTCWiGdUxkQ6Al@sol>
 <CAMRc=MdWce2Msjwjyo3ny9LyUsA8Zeq_WhhJ2=ar5CG1BPmhtg@mail.gmail.com>
 <Y1/AtfEhuijx1+tK@sol>
 <20221102040049.64b3yll7itvi7vzw@vireshk-i7>
 <CAMRc=Mc=gjGPcVOcx8YGNFqEsnve0h5a0OYqNMsWmUOP19wVAg@mail.gmail.com>
 <Y2JrywE5RB0Mdrqo@sol>
 <CAMRc=McQ11LtOGxHTVb2GbAWpPaz+2_F+WtiwPN=psBmEppGzQ@mail.gmail.com>
 <Y2MNd0Y27hZ164i2@sol>
 <CAMRc=McT1RFNdqdNJJYEXad4kcSpj4MgrKL9emcsiaJoO5YvrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McT1RFNdqdNJJYEXad4kcSpj4MgrKL9emcsiaJoO5YvrA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 03, 2022 at 09:35:33AM +0100, Bartosz Golaszewski wrote:
> On Thu, Nov 3, 2022 at 1:38 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Nov 02, 2022 at 05:34:20PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Nov 2, 2022 at 2:08 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Wed, Nov 02, 2022 at 01:47:44PM +0100, Bartosz Golaszewski wrote:
> > > > > On Wed, Nov 2, 2022 at 5:00 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > > > >
> > > > > > On 31-10-22, 20:33, Kent Gibson wrote:
> > > > > > > Wrt the Rust bindings, I was assuming that either Viresh would provide
> > > > > > > support, or as his work appears to be on behalf of Linaro that they
> > > > > > > would have an interest in maintaining it.
> > > > > >
> > > > > > I will surely help in maintaining the Rust part. Not an issue.
> > > > > >
> > > > >
> > > > > Sounds like a plan. I'm going through Kent's gpio-tools patches and
> > > > > rust bindings are next in line.
> > > > >
> > > >
> > > > The rust bindings might make it in before they do - you may find that
> > > > they are a bit more different from the old tools than you were expecting.
> > > >
> > >
> > > Yeah, I can tell that. :)
> > >
> > > I have lots of non-functional minor things to point out - mostly
> > > coding style etc. - that I will probably just fix locally when
> > > applying.
> > >
> >
> > Looks like there will be a v5 for the optional interactive set, if
> > nothing else, so let me know and I can fix them as well.
> >
> > > One thing that stands out though is the dependency on libedit - do you
> > > think we could make the gpioset interactive mode a configurable
> > > feature with its own configure switch that could be left out if we
> > > don't want to depend on any external libraries?
> >
> > Well, libedit was your preferred choice.
> 
> It's still is - it's not about the choice of the library but about
> keeping it possible to build a set of command-line tools with no
> dependencies other than libc.
> 
> > But, yeah, making the interactive mode optional is a good idea.
> >
> > Any preference on the name for the config flag?
> > --enable-gpioset-interactive ?
> >
> 
> Sounds great.
> 
> > One other major thing I had been considering, and implemented in my Rust
> > version[1], is renaming the tools, since it isn't intuitively obvious,
> > to me anyway, what gpiodetect, gpioinfo, gpiomon, and gpiowatch do.
> >
> > I went with:
> >  gpiodetect -> gpiochip
> >  gpioinfo   -> gpioline
> >  gpiomon    -> gpioedges
> >  gpiowatch  -> gpionotify
> >
> > where the names try to indicate the information returned, rather than
> > how it is collected.
> > And yeah, I got stuck with gpiowatch/gpionotify as I couldn't come up
> > with a short meaningful name for line info changed events.
> > Suggestions welcome.  And lice is not an option.
> >
> > gpioget and gpioset remain unchanged as they are already as clear as can
> > be.
> >
> > Would that work for you, or would you prefer to stick with the existing
> > names?
> 
> I don't know if it is because I'm used to the previous names but none
> of the first three make much sense to me. I think it's better for the
> names to indicate what the program is doing, not what it's returning.
> 
> On the other hand - gpionotify is great, go for it!
> 

Ok, now I'm confused - only rename gpiowatch?

Anyway, we probably should pick this conversation up as part of the
tools review, not the Rust bindings, so let me know there.

Cheers,
Kent.
