Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46B59601352
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 18:20:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229671AbiJQQUc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 12:20:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiJQQUb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 12:20:31 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AF446D9D3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 09:20:24 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y1so11557954pfr.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 09:20:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WVZMMfJZuL5uR8BpCOac4ctAi4CmU51FfxwDUlFTLOY=;
        b=VAHNr7hv86sIS+y7M7A8tnCSepCEBSoaqpTpjEWBWBxhJSDW8Ce0ebdAFS1Al4M8DZ
         HSwJpacy/Mw7I2hj3PdEFv/Zul9tknS1cc/vLbRYyRNLi2RgAY8I7TIxRFb4a6Frp/jJ
         /gbnG6mIkEmsfSQBdaEPz9SKijEIOyqnJeSboWpB/LL/IgQBhlFaOhvXnfC/s+1/8uWe
         ywCMOvCWFEwD0irQ8KsA5ZjssPda3malm5UaQZqLyh/HQx0FjKtGgEQR0bDP19vwMDBl
         hCDjIom4uiAfMzbM20B3QrzCNQK5qTMBvvP9uOcIjDlE+TVlsqq7KWGMG5dxCC3Uw8Hp
         gXtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVZMMfJZuL5uR8BpCOac4ctAi4CmU51FfxwDUlFTLOY=;
        b=qMXTOVvfdl6YwZTF6W9fkdp1lho/rsR4FTleiFmvriMAXHECgHZX82iqOeYi01bQif
         IETQr+qcKGK3ZWntMsaYrgvjfpvI+ZG7+vKEUx5INNmcbQWThg32D4x3EkqKMd5pId+4
         eR1oa1Rf2xCWmTaArxTc2mld3BXObo2XsL157AJlIif6b9RI0sgQhxb+qd6lZqeDncUE
         cIMRths8fAu8mBvzM1Q/kciZOKISR6EMCxVXzsMlfL4dUCMCndJyIRIyRNljYYCdPzHM
         am/ZnARHD0jii6TnvB3lIsPczgKlyFXeqFGvIhEQSmsZDYfpewHfzID+osHsGHTJ3mNI
         LVPQ==
X-Gm-Message-State: ACrzQf0cwws8rH80wu67vnWBLU0rIbJEALFwbbcsL3cuNimFaqC6Peq1
        Dn40x2FR6B3d4mNESS3vdcc=
X-Google-Smtp-Source: AMsMyM4/J371sUiZQWzwWms0QvYILcKSpI5TfG4orOizrHNCHOIK8Ozrtw5Ak/l+1KoWk9kgUdx+aQ==
X-Received: by 2002:a63:82c6:0:b0:460:a691:356 with SMTP id w189-20020a6382c6000000b00460a6910356mr11304008pgd.621.1666023623881;
        Mon, 17 Oct 2022 09:20:23 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b00180a7ff78ccsm6847917plh.126.2022.10.17.09.20.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 09:20:23 -0700 (PDT)
Date:   Tue, 18 Oct 2022 00:20:18 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y02Awqv4w3oC1Yib@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol>
 <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol>
 <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
 <Y01hlUvj7cSdpCcx@sol>
 <Y01kYc8K8oStLz3g@smile.fi.intel.com>
 <CAMRc=MfAVVpc_k9ZsAib1s5WCyThgmfTb46VCx7P8iuDKBpuoA@mail.gmail.com>
 <Y01+JhOMc53Dhps1@sol>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y01+JhOMc53Dhps1@sol>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Oct 18, 2022 at 12:09:10AM +0800, Kent Gibson wrote:
> On Mon, Oct 17, 2022 at 05:53:52PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Oct 17, 2022 at 4:19 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Oct 17, 2022 at 10:07:17PM +0800, Kent Gibson wrote:
> > > > On Mon, Oct 17, 2022 at 04:49:55PM +0300, Andy Shevchenko wrote:
> > > > > On Mon, Oct 17, 2022 at 08:11:28PM +0800, Kent Gibson wrote:
> > > > > > On Mon, Oct 17, 2022 at 02:00:15PM +0200, Bartosz Golaszewski wrote:
> > > > > > > On Thu, Oct 13, 2022 at 5:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > > > > > > On Fri, Oct 07, 2022 at 04:55:19PM +0200, Bartosz Golaszewski wrote:
> > >
> > > ...
> > >
> > > > > > > >         lvs = [ arg.split('=') for arg in sys.argv[2:] ]
> > > > > >             lvs = [ (x,int(y)) for (x,y) in lvs ]
> > > > > > > >         lines = [ x[0] for x in lvs ]
> > > > > > > >         values = dict(lvs)
> > > > > > >
> > > > > >
> > > > > > An extra pass to fix the int values.
> > > > >
> > > > > In Python we have map(), which I think is the best for that kind of job.
> > > > >
> > > >
> > > > My understanding is map/filter is old school and list comprehensions
> > > > have replaced map, as generators have replaced filter.
> > > >
> > > > i.e.
> > > >     list(map(function, iterable))
> > > > becomes
> > > >     [function(x) for x in iterable]
> > >
> > > Definitely it does not cover all the cases map() is taking care of.
> > > So it can't be old school :-)
> > >
> > > * Yes, in this particular case it may be map() or list comprehension.
> > >   But I think with map() the two lines can become one.
> > >
> > > > Either way, what we are missing here is a parser function that gives us
> > > > exactly the (offset,value) output we want from the command line string.
> > > >
> > > > Oh, and we need both the lines list and the values dict, both of which
> > > > are easily created from the interim lvs.
> > > >
> > > > > > You could do it in one with a more appropriate parser function.
> > > > >
> > > > > It seems we need some Python guru to revisit the code, because to me
> > > > > it looks a bit C:ish :-)
> > > >
> > > > The for loop or the list comprehension?
> > > > Last I checked only one of those is available in C.
> > > > And yeah, the for loop version reads as C, so not at all Pythonic,
> > > > which is why I suggested the list comprehension.
> > >
> > > Yes, but I believe it does not utilize the powerfulness of the current Python.
> > > Anyway, I'm not a Py guru, take my remarks with a grain of salt.
> > >
> > 
> > How about this?
> > 
> >     lvs = list(
> >         map(
> >             lambda val: [val[0], Value(int(val[1]))],
> >             [arg.split("=") for arg in sys.argv[2:]],
> >         )
> >     )
> 
> which is the same as
> 
>     lvs = [ (x,Value(int(y))) for (x,y) in [ arg.split("=") for arg in sys.argv[2:]] ]
> 
> which is the same as my two liner, just nested - though it may only
> iterate through the list once if the inner list comprehension is
> treated as a generator.  Not sure.
> 
> Either way, not too fussed - it is only example code.
> As long as it isn't a for loop ;-).
> 

Oh, btw, the parser fn version would be something like:

def parse_value(arg):
     (x,y) = arg.split("=")
     return (x, Value(int(y)))

lvs = [ parse_value(arg) for arg in sys.argv[2:]
...

Is that clearer?

Cheers,
Kent.

