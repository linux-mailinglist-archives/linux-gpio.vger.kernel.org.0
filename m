Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2C1506013A4
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 18:40:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229726AbiJQQkC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 12:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229932AbiJQQkA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 12:40:00 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F83329374
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 09:39:52 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id n18-20020a17090ade9200b0020b0012097cso13365286pjv.0
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vO1PLV9icXOoZ0GtBhWXfAsoZz7dZGJrQoA4q7r8CT4=;
        b=d+68ZKf0X/3+wM+jqI/YuQZbODHaweuNZJA9P/YfNTO5YQCLelILOSGqL1N7acMWlB
         tGYcbItr8frv8bi7+ggE1KERSdFHq/SIykIo+wgEvu7mYWX098DO5HUuWVza+1Q8bGPp
         Lyv9pLzuc3f5hCw7eiXSP6kK9932c2SZEDlUjJRcka4g5gJsYK1LIgaWNAO9YZ84GVWD
         sSKskvfE/nq7/DFTzsSvEZ4ft+a9fiLRkeobvGkQD97luprzcAbltR78SNQKYm7isO1N
         qz3GytR+B/0Y0+xVev3uVXicoCEfULDYCtO2EYnoELCo+w9Bv+Ig9pfPtlVweUYdClP3
         aLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vO1PLV9icXOoZ0GtBhWXfAsoZz7dZGJrQoA4q7r8CT4=;
        b=SFrhHT4rtP3ujs7lrp8L3CTGEvjIFQWCndyhH7QNtO8tFvOXdM1GDrvpJRnazeyrmx
         WKOhHOOp8y7tBhXrdSpV30KpnAigSi8vZDTUZ2by6GtF4+9C/c1l2oDci/HaSXp/cYXD
         DSIOG1YzQNc/yiT7pdBYd6LWaXKz4nk+0FS0SbjU3/o5IEdJQEGu0638x626nce8UC3Q
         mVaalfHAI9Fh4tHLYmDuXohWhwpBrv4/4XunT/dajQzRFeJ9NFJF8srRIcYShWk6VNgx
         PebiGvdctoX5eVjsw2iUGSUPim6wM07+YnrHTgc4Uj14YLCWvP0nDVyPsDOlgCw8YJRq
         M8LA==
X-Gm-Message-State: ACrzQf0QusrsFICQMVnjKeVg91+nzEl9MUunAPOa7DR4lqHvjjUgzuPD
        u6MY5Y19y3iuoj7i1pnUZFA=
X-Google-Smtp-Source: AMsMyM6DF3NL7xj9WcpAkF7SW4NOkwiFZiICob0sIRQc4aiXK/q7PsKwh2VvJl8CYmyBwvFxr2m7QQ==
X-Received: by 2002:a17:90b:33ce:b0:20d:7450:6b49 with SMTP id lk14-20020a17090b33ce00b0020d74506b49mr14722817pjb.128.1666024791772;
        Mon, 17 Oct 2022 09:39:51 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id i4-20020a170902e48400b00176c6738d13sm6831581ple.169.2022.10.17.09.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 09:39:50 -0700 (PDT)
Date:   Tue, 18 Oct 2022 00:39:45 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y02FUckEjN3UTPcS@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol>
 <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
 <Y01GcJbDKPdctduH@sol>
 <Y01dg+vTDKbdjcOI@smile.fi.intel.com>
 <Y01hlUvj7cSdpCcx@sol>
 <Y01kYc8K8oStLz3g@smile.fi.intel.com>
 <CAMRc=MfAVVpc_k9ZsAib1s5WCyThgmfTb46VCx7P8iuDKBpuoA@mail.gmail.com>
 <Y02ByMEjM7LjvHE4@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y02ByMEjM7LjvHE4@smile.fi.intel.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 07:24:40PM +0300, Andy Shevchenko wrote:
> On Mon, Oct 17, 2022 at 05:53:52PM +0200, Bartosz Golaszewski wrote:
> > On Mon, Oct 17, 2022 at 4:19 PM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> 
> ...
> 
> > How about this?
> > 
> >     lvs = list(
> >         map(
> >             lambda val: [val[0], Value(int(val[1]))],
> >             [arg.split("=") for arg in sys.argv[2:]],
> >         )
> >     )
> 
> Yeah, this looks ugly... So initial variant with two lines looks to me
> like this:
> 
>   lvs = [arg.split("=") for arg in sys.argv[2:]] # btw, needs handling 2 exceptions
>   values = dict((x, Value(int(y))) for (x,y) in lvs) # needs to handle an exception
>   # Perhaps you need ordered dict?
>   lines = values.keys()
> 

Indeed, an OrderedDict keys would provide the lines in argv order, so values.keys()
could be used in place of lines.

And if you use a parser function then it can deal with the parsing exceptions.

   values = OrderedDict([ parse(arg) for args in sys.argv[2:] ])

Cheers,
Kent.

> >     lines = [x[0] for x in lvs]
> >     values = dict(lvs)
> 
> > It's so much less readable but at least it's pythonic, look at those
> > lambdas and comprehension lists and even a map! :)
> 
> 
> -- 
> With Best Regards,
> Andy Shevchenko
> 
> 
