Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59FE3601332
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 18:09:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbiJQQJS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 12:09:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230234AbiJQQJR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 12:09:17 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91A64D808
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 09:09:16 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id g28so11504662pfk.8
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 09:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GbjOSEyfuoy6f2gcAOyqx/I4AHDHSjeTGnUVeUBFWz4=;
        b=jAXb1rlw0yrgJ6ufPwgk/dotJIa3A7e23X9cWhn+N5GngJMJRkuz9eWYgnGPNAab2W
         vhl72Bo3RRdTH+wlNKnjjgSPNVxUxHhWn4bJjDYY9ikAeaiWvBohuQ4WlOxhgqOloj8x
         U0/tk7e64Q8fHcWOeLa3u1HwYlJYtE+8K9jHEu5QGkHSZxEYXDMBvCYDDq0O6AXw+G51
         njshNcYzbXOn7bjBDoPlqb3jMnmHIN6bfz13w9PBEVCgXoWgtcPb1kivWcE6AZs3Xr/m
         4UO6V1rqVdyKlm/nxSwUgLUOCrJplXO7b3BfA5qn4UX2REqoPFEd8+i4FvbHx4F9kr06
         15WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GbjOSEyfuoy6f2gcAOyqx/I4AHDHSjeTGnUVeUBFWz4=;
        b=sduWSfv/2Hg740ZLqOzde8r4PQWv7/4b7tuYeQzvfe04AjSTFWb07ACYC03vUIODWr
         SnI5wL/64lb6YjZALezqz4U/G1gEZq75JjvqAef8d98N/jCglpeQ/75HtxnC7ePQ0Crj
         wHlnNx4Npbm8DVZ28ryjTp57UrrqE1Rm13ag3rZaA3WUqzHKGVj58g4JiBQdK7IWUlKQ
         fvdRa42W1wIGpu3WCr/otjKtLN4YF/2BZCZpmdicFf2eCi0F685kod8/fjcdfKhx+npL
         4Jsy4NYpw0GJU5+toavJHB6X7URUEwq7r30HJsaaHVKac1SJx8FuMhSzvfStcTgBACn+
         Z/Rg==
X-Gm-Message-State: ACrzQf1ZbJxCdzhypJjAykdBs+478/qGfdtVBMUeHCGd0eg9rfxdbep7
        7zHc0XuOkH/24FBzsovRP/g=
X-Google-Smtp-Source: AMsMyM4XloTEWnJLQFILna82lBvEywpmYUxg3ovKRQACbEYC8NxPGRolHFFbVIQUVXafK8v2Ke+fnQ==
X-Received: by 2002:a05:6a00:1349:b0:563:654d:ce3f with SMTP id k9-20020a056a00134900b00563654dce3fmr13226607pfu.32.1666022956076;
        Mon, 17 Oct 2022 09:09:16 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id cp5-20020a170902e78500b0017f5c7d3931sm6700316plb.282.2022.10.17.09.09.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 09:09:15 -0700 (PDT)
Date:   Tue, 18 Oct 2022 00:09:10 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y01+JhOMc53Dhps1@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol>
 <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol>
 <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
 <Y01hlUvj7cSdpCcx@sol>
 <Y01kYc8K8oStLz3g@smile.fi.intel.com>
 <CAMRc=MfAVVpc_k9ZsAib1s5WCyThgmfTb46VCx7P8iuDKBpuoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfAVVpc_k9ZsAib1s5WCyThgmfTb46VCx7P8iuDKBpuoA@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 05:53:52PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 17, 2022 at 4:19 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Oct 17, 2022 at 10:07:17PM +0800, Kent Gibson wrote:
> > > On Mon, Oct 17, 2022 at 04:49:55PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Oct 17, 2022 at 08:11:28PM +0800, Kent Gibson wrote:
> > > > > On Mon, Oct 17, 2022 at 02:00:15PM +0200, Bartosz Golaszewski wrote:
> > > > > > On Thu, Oct 13, 2022 at 5:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > > > On Fri, Oct 07, 2022 at 04:55:19PM +0200, Bartosz Golaszewski wrote:
> >
> > ...
> >
> > > > > > >         lvs = [ arg.split('=') for arg in sys.argv[2:] ]
> > > > >             lvs = [ (x,int(y)) for (x,y) in lvs ]
> > > > > > >         lines = [ x[0] for x in lvs ]
> > > > > > >         values = dict(lvs)
> > > > > >
> > > > >
> > > > > An extra pass to fix the int values.
> > > >
> > > > In Python we have map(), which I think is the best for that kind of job.
> > > >
> > >
> > > My understanding is map/filter is old school and list comprehensions
> > > have replaced map, as generators have replaced filter.
> > >
> > > i.e.
> > >     list(map(function, iterable))
> > > becomes
> > >     [function(x) for x in iterable]
> >
> > Definitely it does not cover all the cases map() is taking care of.
> > So it can't be old school :-)
> >
> > * Yes, in this particular case it may be map() or list comprehension.
> >   But I think with map() the two lines can become one.
> >
> > > Either way, what we are missing here is a parser function that gives us
> > > exactly the (offset,value) output we want from the command line string.
> > >
> > > Oh, and we need both the lines list and the values dict, both of which
> > > are easily created from the interim lvs.
> > >
> > > > > You could do it in one with a more appropriate parser function.
> > > >
> > > > It seems we need some Python guru to revisit the code, because to me
> > > > it looks a bit C:ish :-)
> > >
> > > The for loop or the list comprehension?
> > > Last I checked only one of those is available in C.
> > > And yeah, the for loop version reads as C, so not at all Pythonic,
> > > which is why I suggested the list comprehension.
> >
> > Yes, but I believe it does not utilize the powerfulness of the current Python.
> > Anyway, I'm not a Py guru, take my remarks with a grain of salt.
> >
> 
> How about this?
> 
>     lvs = list(
>         map(
>             lambda val: [val[0], Value(int(val[1]))],
>             [arg.split("=") for arg in sys.argv[2:]],
>         )
>     )

which is the same as

    lvs = [ (x,Value(int(y))) for (x,y) in [ arg.split("=") for arg in sys.argv[2:]] ]

which is the same as my two liner, just nested - though it may only
iterate through the list once if the inner list comprehension is
treated as a generator.  Not sure.

Either way, not too fussed - it is only example code.
As long as it isn't a for loop ;-).

Cheers,
Kent.

>     lines = [x[0] for x in lvs]
>     values = dict(lvs)
> 
> It's so much less readable but at least it's pythonic, look at those
> lambdas and comprehension lists and even a map! :)
> 
> Anyway - unlike the programming interface - these are just
> implementation details that can be always improved later.
> 
> Bart
