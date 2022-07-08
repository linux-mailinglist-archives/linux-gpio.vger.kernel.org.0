Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C12556B7D5
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Jul 2022 12:57:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237783AbiGHK4o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Jul 2022 06:56:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237706AbiGHK4n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Jul 2022 06:56:43 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DBEE788F12
        for <linux-gpio@vger.kernel.org>; Fri,  8 Jul 2022 03:56:41 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id bf13so9000085pgb.11
        for <linux-gpio@vger.kernel.org>; Fri, 08 Jul 2022 03:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X+HkFXNH51jA80iANQqyniTTYo5qztF/E2qXcUrjRrY=;
        b=pCBFnfxtGb/NV8nl1MObucj2Gu7IyYUpULyhOPljpzIZTXXkcsBG5TqvzeKP7xqyta
         OV4jO/kVRyw580sQ6GM86S+whEdoBIUZf8oK5j+2ZnJcQdcHI+PWm9AmN97zKCa8hqR2
         8Y+eO3N5ZFarUSIZcI/rZyoW46LS5g8Bm/YOjHVRxKDItxbNRf5um+PdfiT6Oh4wnZjV
         lG1DT/rw72tdcoaMwkOjMBLyZHR7xnvqonHtG34A/sp6iWawm5BESxOBWdlgHXnvpOwx
         R9zdCzoimHoFOhGAGgDRxiI+/Au44GsahFmVtWM+G6GdgkufWRzlBZLmSdEaWkf8SQpm
         1oqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X+HkFXNH51jA80iANQqyniTTYo5qztF/E2qXcUrjRrY=;
        b=nZtVkrQ0CxNfLfkSZ1JP2NjiD1hlzP/tZinTdyswizsBf/rdahm11F/RxjWKEEy9dA
         QgZIEd94UOXgh3PCCOGtC3aJGWf6moDXhs45WAC2drnjIdM6pG4ry8e4qlX8CIv9Xvnz
         1PW+Y7m06cbTJgsqSKVodYw3d/Ue60YkhTkyHiniIWuBYD4PQTn3R5PimPJ+q7zjCqzc
         BTS8oUsVjYzDBbbgInrqktBx29gUyxt8ixJItkXj984pkZSly5Qwy8noKVnFayO5gQLx
         BKISb5Cdby5poMvr7rb8WkVQykNaRPhNM+1ctK1jrF21V8jRx2anFSrBYsuSIu16xlb2
         Kn6A==
X-Gm-Message-State: AJIora/DfyYYqw3TAEG0m7oR7SEMpNG+7xDVIL6R0qT7gQkgBbekZv87
        fOWMHujAowdjpEw4HFloY/o=
X-Google-Smtp-Source: AGRyM1sQZKc4hXmTjclXDjBFPH+dbZ4x2gWSjsHMSAU6Q8fqnaoDIMNGLgtrR4tlWDPJI7TDUVmdYQ==
X-Received: by 2002:a65:6d0c:0:b0:412:6da1:df6b with SMTP id bf12-20020a656d0c000000b004126da1df6bmr2820917pgb.14.1657277801177;
        Fri, 08 Jul 2022 03:56:41 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id d15-20020a056a0024cf00b005258df7615bsm26424572pfv.0.2022.07.08.03.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 03:56:40 -0700 (PDT)
Date:   Fri, 8 Jul 2022 18:56:34 +0800
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
Message-ID: <20220708105634.GA84979@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-6-brgl@bgdev.pl>
 <20220705020937.GB6652@sol>
 <CAMRc=Mec4C2RUvZjxc=6G6Nv0-Us91X-j-3jnNNGzE8MjrbCag@mail.gmail.com>
 <20220707130955.GB66970@sol>
 <CAMRc=MfuzzjkApJ4LBARG0OpfvfBeMqVMTRnKJuj7zV4Gvez1Q@mail.gmail.com>
 <20220708013834.GA6484@sol>
 <CAMRc=MfGT_FZ=LToa4DPqc3UqjAbt+9dpT2NtKOmMqhcFKWLZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfGT_FZ=LToa4DPqc3UqjAbt+9dpT2NtKOmMqhcFKWLZQ@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 08, 2022 at 11:49:59AM +0200, Bartosz Golaszewski wrote:
> On Fri, Jul 8, 2022 at 3:38 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Thu, Jul 07, 2022 at 10:09:44PM +0200, Bartosz Golaszewski wrote:
> > > On Thu, Jul 7, 2022 at 3:10 PM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Thu, Jul 07, 2022 at 02:19:17PM +0200, Bartosz Golaszewski wrote:
> > > > > On Tue, Jul 5, 2022 at 4:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> > >
> > > [snip]
> > >
> > > > > >
> > > > > > How about merging the _default and _offset forms by adding an offsets
> > > > > > kwarg?
> > > > > > offsets=None (or unspecified) -> default
> > > > > > offsets=int -> offset
> > > > > > offsets=iterable -> offsets
> > > > > >
> > > > > > Off on a bit of a tangent... why should the end user care about
> > > > > > defaults and overrides?
> > > > > > For a higher level abstraction I'd prefer to see the whole "default"
> > > > > > concept disappear in favour of the config for each line.  That would
> > > > > > remove a lot of the complexity from the LineConfig interface.
> > > > > > Though it would add complexity to the binding internals.
> > > > > >
> > > > >
> > > > > What would that look like (in python code) if I wanted to request 5
> > > > > lines and use the same config for them?
> > > > >
> > > >
> > > > That is the trivial case - you use the module level
> > > > gpiod.request_lines() as is and pass in the config parameters and list of
> > > > lines you want.
> > > >
> > > > req = gpiod.request_lines(chip="gpiochip0", offsets=[1,2,3,4,5],
> > > >                           direction="output", values=[1,0,1,0,0])
> > > >
> > >
> > > This is close to what I have now in my v3 branch. Except that values
> > > is called output_values and takes a dictionary like its counterpart in
> > > LineConfig but that can be extended to interpreting a list as
> > > providing the values for corresponding offsets/lines. Current version
> > > of request_lines() takes all LineConfig options and uses them as the
> > > defaults.
> > >
> > > > The more complicated case is where the lines config differs.
> > > > Then you have to build the LineConfig by adding the config for each set
> > > > of lines in a separate call to set_props().
> > > > Then you provide that LineConfig to the request_lines(), along with the
> > > > set of lines.
> > > >
> > > > lc.set_props(offsets=[1,2,3], direction="input")
> > > > lc.set_props(offsets=[4,5], direction="output", values=[1,0])
> > > > req = gpiod.request_lines(chip="gpiochip0", line_cfg=lc)
> > > >
> > > > (simplified examples using stringified prop values etc - hope you get
> > > > the idea)
> > > >
> > > > Building that on top of the C API, you would determine the "default"
> > > > config based on the most common attribute values, then override the
> > > > config for the lines that differ from that default.
> > > > That is the internal complexity I mentioned.
> > > >
> > >
> > > Internal complexity is fine - it's the implicitness of the defaults
> > > that make me not like this idea. I think we discussed something
> > > similar for the C API and I was against it too. Your examples are fine
> > > but the defaults for lines not mentioned in set_props() would be
> > > filled by a freshly created LineConfig with its well defined default
> > > values. In other words I prefer to keep the override mechanism visible
> > > in python but unification of the property setters is something I will
> > > consider.
> > >
> >
> > I suspect you are right that we've been here before and I'm flogging a
> > dead horse, but you get that - I must think there is still a bit of life
> > in the old nag ;-).
> >
> > I find it ironic that a feature of the uAPI that is there due to
> > the constraints on the uAPI, i.e. to keep the line_config to a
> > manageable size, gets propagated this highly.  In my mind the
> > configuration for each line has always been distinct, and the uAPI
> > line_config is just a reduced form.
> >
> 
> The limitation of the uAPI is what keeps us from making it true in
> user-space (that each line can have its own config). As it is, only up
> to 9-10 lines can have distinct configs and making the API look and
> behave as if it wasn't the case is more confusing (E2BIG errors) than
> simply admitting we have the concept of defaults and overrides (to
> which the interface is greatly simplified in the high-level
> libraries). The idea about making the most common config attributes
> become the defaults is simply bad. It would require the user to
> anticipate how the library will behave for every attribute and lead to

It requires nothing from the user.  They are not even aware of the
concept of "defaults" or "overrides".  They just set config on lines.
If that is too complicated, which is quite unlikely, then they get
E2BIG and they need to repartition their lines into multiple requests.

Anyway, that horse is dead.

Cheers,
Kent.
