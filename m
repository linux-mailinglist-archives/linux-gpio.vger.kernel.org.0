Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 421A3600E95
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Oct 2022 14:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbiJQMLh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Oct 2022 08:11:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230036AbiJQMLg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Oct 2022 08:11:36 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D2E51A30
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 05:11:34 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id n7so10602497plp.1
        for <linux-gpio@vger.kernel.org>; Mon, 17 Oct 2022 05:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=o3JKXrLu+SqYfmHiz833G3l+MI8fCppqecn7cjNxb5w=;
        b=BJmIPZB3u6CSgAqChh3rTHda69yr9VjmlnFab10vARDeibGDHaLGUyxb1hBfJzCeZ0
         j56qLde7XHce0j7cKDHpiA8e+bQIQBYBPCTneQRqAfRZzuzDgG9FiFC4A/3owG05tbJg
         VHPnxF1SQw3wk31N8ug78aIhnsYMUQd/vfhqsOxG1E1dS/BL2lLfZLUSxJiBQWeHfqX4
         EcOAz5YEO+bFdr8bM28d2YGe0UmmsINxc0qoJbhUZCkdsyLa/sArDOT7w0jOibsswd3h
         NKTr/Sd6CEuG7DlRyUEfGE+Qm9aUyVa2u48bTbcFHOicThUnkBWPpftSv3acyLZfR8ed
         cxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o3JKXrLu+SqYfmHiz833G3l+MI8fCppqecn7cjNxb5w=;
        b=4twnw+AbUMsyf8ijTtOi42AumMxUnqvPQ2tNu+asGicc6lWhXxxQyciDL5vb8+Z7lb
         IZKjr4PQO+eELnB/hhKhzKxtbhcaQ25WBQoa1tuC+LzaWhPgK0tFjWGdE/FixrED78kf
         8LCEeT/nqL2J/2pd5Mitt3U+7F7B8ovckFl9uWTMOAu1XFOnGzROlHkHlPZMaZls3EHk
         Yu2naLqabcqVJ0csk1u6b095rVdiXFYwQAESejYgy3S7oia8QP2EbyywPB8391fPaSXe
         cN/eGZYeUSAyB1T5X1OUmiXFUrSW0VQ52DtaZ7kTkcq5+nt1GfLCnC5CoUJe7BznqTx3
         60Sw==
X-Gm-Message-State: ACrzQf0TWYpp3F0iNzqLJbZ1xo3HIVKj8Jxanza9iqOHg5SKbk5yr613
        Yg1e6TyhYajMWklES76CHKk=
X-Google-Smtp-Source: AMsMyM7sqNLrNKNXfq8mF9UeM24K2Fmjf9gmUjB3S+QlXbmLiVzFyH7+swisaf+61MfUUpgT5E9mGA==
X-Received: by 2002:a17:90a:e7ca:b0:20a:966e:8480 with SMTP id kb10-20020a17090ae7ca00b0020a966e8480mr32492785pjb.100.1666008693825;
        Mon, 17 Oct 2022 05:11:33 -0700 (PDT)
Received: from sol (110-174-58-111.static.tpgi.com.au. [110.174.58.111])
        by smtp.gmail.com with ESMTPSA id w10-20020a170902e88a00b0015e8d4eb26esm6481557plg.184.2022.10.17.05.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Oct 2022 05:11:33 -0700 (PDT)
Date:   Mon, 17 Oct 2022 20:11:28 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org
Subject: Re: [libgpiod v2][PATCH v3 2/4] bindings: python: add examples
Message-ID: <Y01GcJbDKPdctduH@sol>
References: <20221007145521.329614-1-brgl@bgdev.pl>
 <20221007145521.329614-3-brgl@bgdev.pl>
 <Y0eBbUkzryyJZKwq@sol>
 <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=MfpGFUPntmBNKsyuheD7Enqxq=K+K2hsp24ru18mn0x2A@mail.gmail.com>
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 17, 2022 at 02:00:15PM +0200, Bartosz Golaszewski wrote:
> On Thu, Oct 13, 2022 at 5:09 AM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Fri, Oct 07, 2022 at 04:55:19PM +0200, Bartosz Golaszewski wrote:
> > > This adds the regular set of example programs implemented using libgpiod
> > > python bindings.
> > >
> > > Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
> > > +    path = sys.argv[1]
> > > +    values = dict()
> > > +    lines = []
> > > +    for arg in sys.argv[2:]:
> > > +        arg = arg.split("=")
> > > +        key = int(arg[0]) if arg[0].isdigit() else arg[0]
> > > +        val = int(arg[1])
> > > +
> > > +        lines.append(key)
> > > +        values[key] = Value(val)
> > > +
> >
> >         lvs = [ arg.split('=') for arg in sys.argv[2:] ]
            lvs = [ (x,int(y)) for (x,y) in lvs ]
> >         lines = [ x[0] for x in lvs ]
> >         values = dict(lvs)
> 

An extra pass to fix the int values.
You could do it in one with a more appropriate parser function.

Cheers,
Kent.

