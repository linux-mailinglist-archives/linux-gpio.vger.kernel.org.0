Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92CDB56B010
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 03:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236281AbiGHBin (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 21:38:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236289AbiGHBim (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 21:38:42 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707DC1D336
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 18:38:41 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id o15so12323396pjh.1
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jul 2022 18:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LjdDc+g044uEze76bOy7vqtG1uMpSW++RNf+eSzXM8E=;
        b=Gwtib6BMbpTl4sCIIj+RP2wAdRv8sGsXcBGOXdxNxucTOlhSIOoAd89IXrWhqDvnTq
         xNJi49V6EIueTliiWCaDo7CPz1Lvs1USdPgw5bUhEltY5wL1hEXSeyBEpH/Lfxf3SiRH
         0yVVFRUj2YzvkoCmKwmqMqRUYmrMgppOtsVLpQsmPpQIxBBr7vQFdTSOv3UMuUDvt0wJ
         QQVAOPsk576bSmv4FfjKx5GWaSvBLV+FWqjFJTIKLuupaI1fHDirfQgwq3LzO4X5NS8c
         Dd7wH0yAskAsZjoAHschAPTnro/Co8Jn0w9ArLhHmcHi+6u/a+tYj53NPXI8uzy8z3dl
         O7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LjdDc+g044uEze76bOy7vqtG1uMpSW++RNf+eSzXM8E=;
        b=Magj0q+TPB/1QXou/RvbHR02FzO5s6adghdeso+7mwHKQ4KyricS8yiF/BG2FcItVE
         QOYyfSGmWBRuJjhWAiPuP7kHPB1rxCHdBAmQOg+IXBDEyBnMPVQ+RZVrqI6lIs7E00Xf
         whzaSpcJ382CzDpRE7JJQjf4HZXV9RjXHkcFcmbCJA1K0Xi3pCwkH0Hrg5ai06d4uMkG
         C3yt9h+FD8C5ud7hc2n1jCFQ004dusawXDdEhqGyKgT46j4hNgkS5OtkbifydADJ7eNa
         1ngm5cb7ZJd9JNAOT5xUL8lVLTOF+qqsyvl2yyQ0XsAxVOSoSbGVz6nZSOJtrdHOzOlp
         wZoQ==
X-Gm-Message-State: AJIora/XHWa451orur2MrPeV8J5sp2sjhbVvWU8hfl0n4959nRa1i/1E
        +TTzLjkzVgVJFoGFoc3YAO9++kzcOjmMsA==
X-Google-Smtp-Source: AGRyM1vEmDbmYHXe4fQN4IbHB8NETuDTtes0EgcahrU+KgyV44h8kH6biKVi3FiLAOCj5H6iV3O/BQ==
X-Received: by 2002:a17:902:f54e:b0:16a:75a9:9a39 with SMTP id h14-20020a170902f54e00b0016a75a99a39mr1029884plf.70.1657244320787;
        Thu, 07 Jul 2022 18:38:40 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id y16-20020a17090264d000b0016c066e566bsm3728871pli.164.2022.07.07.18.38.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 18:38:40 -0700 (PDT)
Date:   Fri, 8 Jul 2022 09:38:34 +0800
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
Message-ID: <20220708013834.GA6484@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-6-brgl@bgdev.pl>
 <20220705020937.GB6652@sol>
 <CAMRc=Mec4C2RUvZjxc=6G6Nv0-Us91X-j-3jnNNGzE8MjrbCag@mail.gmail.com>
 <20220707130955.GB66970@sol>
 <CAMRc=MfuzzjkApJ4LBARG0OpfvfBeMqVMTRnKJuj7zV4Gvez1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfuzzjkApJ4LBARG0OpfvfBeMqVMTRnKJuj7zV4Gvez1Q@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 07, 2022 at 10:09:44PM +0200, Bartosz Golaszewski wrote:
> On Thu, Jul 7, 2022 at 3:10 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jul 07, 2022 at 02:19:17PM +0200, Bartosz Golaszewski wrote:
> > > On Tue, Jul 5, 2022 at 4:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> 
> [snip]
> 
> > > >
> > > > How about merging the _default and _offset forms by adding an offsets
> > > > kwarg?
> > > > offsets=None (or unspecified) -> default
> > > > offsets=int -> offset
> > > > offsets=iterable -> offsets
> > > >
> > > > Off on a bit of a tangent... why should the end user care about
> > > > defaults and overrides?
> > > > For a higher level abstraction I'd prefer to see the whole "default"
> > > > concept disappear in favour of the config for each line.  That would
> > > > remove a lot of the complexity from the LineConfig interface.
> > > > Though it would add complexity to the binding internals.
> > > >
> > >
> > > What would that look like (in python code) if I wanted to request 5
> > > lines and use the same config for them?
> > >
> >
> > That is the trivial case - you use the module level
> > gpiod.request_lines() as is and pass in the config parameters and list of
> > lines you want.
> >
> > req = gpiod.request_lines(chip="gpiochip0", offsets=[1,2,3,4,5],
> >                           direction="output", values=[1,0,1,0,0])
> >
> 
> This is close to what I have now in my v3 branch. Except that values
> is called output_values and takes a dictionary like its counterpart in
> LineConfig but that can be extended to interpreting a list as
> providing the values for corresponding offsets/lines. Current version
> of request_lines() takes all LineConfig options and uses them as the
> defaults.
> 
> > The more complicated case is where the lines config differs.
> > Then you have to build the LineConfig by adding the config for each set
> > of lines in a separate call to set_props().
> > Then you provide that LineConfig to the request_lines(), along with the
> > set of lines.
> >
> > lc.set_props(offsets=[1,2,3], direction="input")
> > lc.set_props(offsets=[4,5], direction="output", values=[1,0])
> > req = gpiod.request_lines(chip="gpiochip0", line_cfg=lc)
> >
> > (simplified examples using stringified prop values etc - hope you get
> > the idea)
> >
> > Building that on top of the C API, you would determine the "default"
> > config based on the most common attribute values, then override the
> > config for the lines that differ from that default.
> > That is the internal complexity I mentioned.
> >
> 
> Internal complexity is fine - it's the implicitness of the defaults
> that make me not like this idea. I think we discussed something
> similar for the C API and I was against it too. Your examples are fine
> but the defaults for lines not mentioned in set_props() would be
> filled by a freshly created LineConfig with its well defined default
> values. In other words I prefer to keep the override mechanism visible
> in python but unification of the property setters is something I will
> consider.
> 

I suspect you are right that we've been here before and I'm flogging a
dead horse, but you get that - I must think there is still a bit of life
in the old nag ;-).

I find it ironic that a feature of the uAPI that is there due to
the constraints on the uAPI, i.e. to keep the line_config to a
manageable size, gets propagated this highly.  In my mind the
configuration for each line has always been distinct, and the uAPI
line_config is just a reduced form.

(it was also a logical stepping stone from the v1 "all lines have the
same config", which maybe where your attachment to a default originates,
to "all lines can be configured independently" that I was going for in
v2, but practicality limited to "all lines can be configured
independently - to a point", basically by supporting a limited number
of deltas - which you refer to as overrides)

> To me it should look like:
> 
> lc.set_props(direction=Direction.INPUT, edge_detection=Edge.BOTH) sets
> the defaults
> lc.set_props(offset=4, direction=Direction.OUTPUT) sets a single override
> lc.set_props(offsets=[5, 1], direction=Direction.OUTPUT,
> output_value=Value.ACTIVE) sets a set of overrides.
> 

I could argue that I don't like the implictness of lines 1, 2 and 3 here.

The LineConfig defaults are safe.  Allowing the user to redefine the
defaults that apply to a request, separately from where the request is
made mind you, is potentially dangerous.

What if you make the default OUTPUT, and then elsewhere you request
lines and include line 6, forgetting to set it to an INPUT or assuming
that by default you'll get an INPUT?  Kiss that board goodbye.

OTOH the LineConfig "well defined default values" are safe.
Forget to define the config for a line - get a vanilla input.

I wasn't overly concerned about this in the uAPI itself as I was assuming
that at a higher level the lines would be configured separately, and
the higher level language binding would perform the encoding to uAPI.
Turns out that isn't always the case :-|.

Cheers,
Kent.
