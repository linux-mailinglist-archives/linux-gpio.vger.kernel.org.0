Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7063B56A32B
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Jul 2022 15:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235363AbiGGNKI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 7 Jul 2022 09:10:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234163AbiGGNKH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 7 Jul 2022 09:10:07 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAB23B2
        for <linux-gpio@vger.kernel.org>; Thu,  7 Jul 2022 06:10:02 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id n12so19329110pfq.0
        for <linux-gpio@vger.kernel.org>; Thu, 07 Jul 2022 06:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=gDOYdhE3B186UnPAoYD+RUnP2sxjAF6Mi+ce7L0GXDo=;
        b=kI9N7cLi/KTrkiYTXPEQ/LJcg9G5rUzPAl+2OKKK47V580sDLyBa+8//KHkllAljuA
         6KU1L/jv191N3hWv/vxJtbktm6/TGS5PLMewrmGjAAtAkOQNWowp9dXGtDWokCbFg1Le
         LNKWksKBIcqgCFJ/nYrWtTOpRlcsnYi4SOSgACXNXyhtJ9Isd441o2jpYRtJ3cQZopw9
         4MwfvJ0XlLEAKFEWoGpFjl7DlnP8vOr+TtYe6UD5z+W5EgBenBKZMioofXdMtLjM9PLx
         PuvbVQNG/g2BPayIcK+8X71lK0Ow3gUV6tEKEmnirbZLnxkzm2/3KlTtZDX5sMZiAtTZ
         aV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=gDOYdhE3B186UnPAoYD+RUnP2sxjAF6Mi+ce7L0GXDo=;
        b=ZF67tarx7dJGRdBt6Rbz0ClOCQj9q5dCajUxEvUYM9ypOykmE8KY9i1kZ82M4ryj5r
         HKVwq9KlhA8gcNjGdjcZuYZGjJqtzCj/WkowaywXBJ7KCJu872yIbrPirbsCVGTIL1Zm
         oSYFdnP/MKMnNNWBm5zxX8WFfxcgNwtn8DnqCZzh3BStBxoeNLzoJhVdLYawwBHmcaB/
         033+qro4IrqiQFMsQ1Zjhp+JBCBvY5U/9TvyLQpLtN/X74azPFmIQm+ig3RkX8j79K3v
         s8UlhhmosRsPhzx5FZAhONKeqNNQ6kv5b6s3C6vjmD2H5jRYbTxCCI78QEV6zDjqgVwR
         LQmA==
X-Gm-Message-State: AJIora9IBpIZxb5i4BoKRR6Q6MzP+FGxeqSHarhh76ZMeBqkeUZXFazO
        oLcD4AQOKawsA6Cq5rWzWuU=
X-Google-Smtp-Source: AGRyM1vgK1DxtvjFz32PeqmyL1ZWHT4YgVyPcOHNxGEgWhFT8TGIGrBPXWvrmqGwcMOjB5VHaVKlug==
X-Received: by 2002:a63:f405:0:b0:40d:48c1:e32d with SMTP id g5-20020a63f405000000b0040d48c1e32dmr37769077pgi.25.1657199402266;
        Thu, 07 Jul 2022 06:10:02 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id f10-20020a631f0a000000b003fbb455040dsm25664031pgf.84.2022.07.07.06.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 06:10:01 -0700 (PDT)
Date:   Thu, 7 Jul 2022 21:09:55 +0800
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
Message-ID: <20220707130955.GB66970@sol>
References: <20220628084226.472035-1-brgl@bgdev.pl>
 <20220628084226.472035-6-brgl@bgdev.pl>
 <20220705020937.GB6652@sol>
 <CAMRc=Mec4C2RUvZjxc=6G6Nv0-Us91X-j-3jnNNGzE8MjrbCag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Mec4C2RUvZjxc=6G6Nv0-Us91X-j-3jnNNGzE8MjrbCag@mail.gmail.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 07, 2022 at 02:19:17PM +0200, Bartosz Golaszewski wrote:
> On Tue, Jul 5, 2022 at 4:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> 
> [snip]
> 
> > > +PyDoc_STRVAR(chip_get_line_offset_from_name_doc,
> > > +"Map a line's name to its offset within the chip.\n"
> > > +"\n"
> > > +"Args:\n"
> > > +"  name:\n"
> > > +"    Name of the GPIO line to map.\n"
> > > +"\n"
> > > +"Returns:\n"
> > > +"  Line offset corresponding with the name or None if a line with given name\n"
> > > +"  is not exposed by this chip.");
> > > +
> >
> > It should throw if the name search fails.
> >
> > If name is already an int then just return the int.
> > (to allow the method to be used as a mapping function on a mixed
> > list.)  Though ironically the name isn't the best then.
> > Perhaps just get_line_offset() or map_line_offset()?
> >
> 
> Do you think we should change the C function name to
> gpiod_chip_map_line_offset() too? And possibly make it parse strings
> representing integers as well?
> 

No, Python is different due to dynamic typing.

For C, the function we already provide is fundamental.  It can be used
to build the function you are describing, but we should leave it as is.

If you are asking if we should add that higher level mapper as well...
maybe.

> > [snip]
> >
> > Provide a helper to convert timestamp_ns to time.datetime.
> > This one is a bit trickier as the kernel only ever provides monotonic
> > clock, so need to perform the monotonic -> realtime conversion.
> > (for reference my proposed gpiowatch tool does this)
> >
> 
> Should this be put into libgpiod C API directly maybe?
> 

If you mean converting between clocks, like gpiowatch does, I'd rather
not - not something I want to actively encourage.
Only doing it here as a last resort - would prefer to be able to request
the appropriate clock from the kernel.

> > [snip]
> > > +PyDoc_STRVAR(line_config_set_props_default_doc,
> > > +"Set the defaults for properties.\n"
> > > +"\n"
> > > +"Args:\n"
> > > +"  direction:\n"
> > > +"    Default direction.\n"
> > > +"  edge_detection:\n"
> > > +"    Default edge detection.\n"
> > > +"  bias:\n"
> > > +"    Default bias.\n"
> > > +"  drive:\n"
> > > +"    Default drive.\n"
> > > +"  active_low:\n"
> > > +"    Default active-low setting.\n"
> > > +"  debounce_period:\n"
> > > +"    Default debounce period.\n"
> > > +"  event_clock:\n"
> > > +"    Default event clock.\n"
> > > +"  output_value:\n"
> > > +"    Default output value.");
> > > +
> >
> > How about merging the _default and _offset forms by adding an offsets
> > kwarg?
> > offsets=None (or unspecified) -> default
> > offsets=int -> offset
> > offsets=iterable -> offsets
> >
> > Off on a bit of a tangent... why should the end user care about
> > defaults and overrides?
> > For a higher level abstraction I'd prefer to see the whole "default"
> > concept disappear in favour of the config for each line.  That would
> > remove a lot of the complexity from the LineConfig interface.
> > Though it would add complexity to the binding internals.
> >
> 
> What would that look like (in python code) if I wanted to request 5
> lines and use the same config for them?
> 

That is the trivial case - you use the module level
gpiod.request_lines() as is and pass in the config parameters and list of
lines you want.

req = gpiod.request_lines(chip="gpiochip0", offsets=[1,2,3,4,5],
                          direction="output", values=[1,0,1,0,0])

The more complicated case is where the lines config differs.
Then you have to build the LineConfig by adding the config for each set
of lines in a separate call to set_props().
Then you provide that LineConfig to the request_lines(), along with the
set of lines.

lc.set_props(offsets=[1,2,3], direction="input")
lc.set_props(offsets=[4,5], direction="output", values=[1,0])
req = gpiod.request_lines(chip="gpiochip0", line_cfg=lc)

(simplified examples using stringified prop values etc - hope you get
the idea)

Building that on top of the C API, you would determine the "default"
config based on the most common attribute values, then override the
config for the lines that differ from that default.
That is the internal complexity I mentioned.

> > [snip]
> > > +     static char *kwlist[] = {
> > > +             "path",
> > > +             "req_cfg",
> > > +             "line_cfg",
> > > +             "lines",
> > > +             "direction",
> > > +             "edge_detection",
> > > +             "bias",
> > > +             "drive",
> > > +             "active_low",
> > > +             "debounce_period",
> > > +             "event_clock",
> > > +             "output_value",
> > > +             "output_values",
> > > +             NULL
> > > +     };
> > > +
> >
> > My suggestion to provide a lines parameter here was actually a poor one,
> > given the LineConfig only deals with offsets - which is totally reasonable
> > as supporting line names in LineConfig would be complicated.
> > I would prefer the two to be consistent, and so use offsets.
> >
> 
> I disagree. In the module-wide request function we have the chip
> already, we can map the names to offsets. It makes perfect sense to do
> it implicitly here as a pythonic shorthand for opening the chip
> manually and requesting lines separately. This function already got
> improved a lot in my v3.
> 

Yeah, good point - the caller of the module level function won't have a
Chip object to do the mapping.  And forcing them to create one defeats
the purpose of having the module level function in the first place.

Cheers,
Kent.
