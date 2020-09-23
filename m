Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D96D27565E
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Sep 2020 12:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726645AbgIWKai (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Sep 2020 06:30:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgIWKai (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Sep 2020 06:30:38 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19738C0613CE;
        Wed, 23 Sep 2020 03:30:38 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id jw11so2940840pjb.0;
        Wed, 23 Sep 2020 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nP++NZ224p8zlGXJK1tGuiJs6j6iH4DYtzzmMH1lbLU=;
        b=MEf1Do95YjkVTRjkgSLDwQmlFDPBYnD7B5zCT61hqQCC/M3lvEoYojHU8Ml0oQwL11
         U35d39H9r357oaXWR0FJi/TIYdI7o0SJS+8IzNBzfMUdclT4O5VZsiokLioh8rYN1CQ0
         KcXFG7mfAtNegt8lvej9k6t6uSN95WJ2TBF7HaCE6syh54Yx+IkoCamQ26UGbcTK/xlQ
         ATx5TNLH8dgAEvcIEGIFrvFVbWm3ZW3V69jaX4NcYlfuRNHTvB+tHqzPziCSOxXf+dwG
         f+ELVK2oRusE1dtgzoy7myMrycheMmEt4wwoxWCQEA61NpXLS6Hs9GxvPg1J1jK4wCRy
         3M1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nP++NZ224p8zlGXJK1tGuiJs6j6iH4DYtzzmMH1lbLU=;
        b=D0LB6V7l+z/C0w1gyK/78Z38bdhyfF1UuLv5j/nyRnJJrOOZZnSyc/b+I6Uaxzo4qB
         1wrtiorTi7ZfgYisge1UkDb93zs5g+13NrE2GVsSNCOFCl0z3Zoy8Mv0pHuiW7GECF9H
         MxzDk2yeQqtzoX9jVcmVjf/eKjKca28oyQ2JhjlTUzrWqEIUyy87rjYkNStGbHbi08+C
         AswfNscQAvJltyUFfRTDzsDMKYPpzUQ1JXTxDpYTLcaFq1nfv+CN41+qIVyR09CLJrkI
         ElLoRBapgDocRVZ4I77p3ok3hFHAdG/9vFBxca09MZi9KAsSyFJivjCPoRVPnjiARf6Q
         wG1g==
X-Gm-Message-State: AOAM530JJeTLT7ZqH14oUe7EsMEx7M5GVE+wbotp5SH0nRNmsk2ikQ/+
        SQx7EulZm2h0onr8ylh6l4d8WhSPgKTPew==
X-Google-Smtp-Source: ABdhPJzVgHX/nb1wRN/QuarS3kijpOYxBfZF/qRxvwAmrqGKPRBFAYNeHg+vrVkcu3zskwEpDrKTLw==
X-Received: by 2002:a17:902:ab88:b029:d2:18ab:9a0e with SMTP id f8-20020a170902ab88b02900d218ab9a0emr9118351plr.56.1600857037540;
        Wed, 23 Sep 2020 03:30:37 -0700 (PDT)
Received: from sol (106-69-189-59.dyn.iinet.net.au. [106.69.189.59])
        by smtp.gmail.com with ESMTPSA id s19sm17606398pfc.69.2020.09.23.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 03:30:36 -0700 (PDT)
Date:   Wed, 23 Sep 2020 18:30:31 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v9 04/20] gpio: uapi: define uAPI v2
Message-ID: <20200923103031.GA579645@sol>
References: <20200922023151.387447-1-warthog618@gmail.com>
 <20200922023151.387447-5-warthog618@gmail.com>
 <CAHp75VewJYDQ1Moi4jw=wbBMLNpaUGPgz+AsPjNdZqtHCgkjwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VewJYDQ1Moi4jw=wbBMLNpaUGPgz+AsPjNdZqtHCgkjwA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 23, 2020 at 01:04:05PM +0300, Andy Shevchenko wrote:
> On Tue, Sep 22, 2020 at 5:34 AM Kent Gibson <warthog618@gmail.com> wrote:
> >

[snip]

> > There is also some minor renaming of fields for consistency compared to
> > their v1 counterparts, e.g. offset rather than lineoffset or line_offset,
> > and consumer rather than consumer_label.
> >
> > Additionally, v1 GPIOHANDLES_MAX becomes GPIO_V2_LINES_MAX in v2 for
> > clarity, and the gpiohandle_data __u8 array becomes a bitmap in
> > gpio_v2_line_values.
> >
> > The v2 uAPI is mostly a reorganisation and extension of v1, so userspace
> > code, particularly libgpiod, should readily port to it.
> 
> ...
> 
> > +struct gpio_v2_line_config {
> > +       __aligned_u64 flags;
> > +       __u32 num_attrs;
> 
> > +       /* Pad to fill implicit padding and reserve space for future use. */
> > +       __u32 padding[5];
> 
> Probably I somehow missed the answer, but why do we need 5 here and not 1?
> 

Sorry, I got tired of repeating myself, and just acked that we disagree
on the approach here.

Your suggestion to use the size for version would result in an
explosion of ioctl signatures - every time we add a field we have to add
a new ioctl and handle it separately in gpio_ioctl() or linereq_ioctl().

Instead what we do here is reserve some space for future use - that we
can replace with fields without changing the signature.
The padding is required to be zeroed now, and any future use will take
a 0 to mean "leave alone".

The sizes are a guestimate as to what may be needed in the future, and
as such are almost certainly wrong - but hopefully on the high side.
If that fails we can always fall back to your approach.

Cheers,
Kent.
