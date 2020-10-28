Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1607029D9F8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Oct 2020 00:08:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725789AbgJ1XI3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Oct 2020 19:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726227AbgJ1XH4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Oct 2020 19:07:56 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33F2CC0613CF
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:07:56 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id 15so744176pgd.12
        for <linux-gpio@vger.kernel.org>; Wed, 28 Oct 2020 16:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6onY/cyHQJjWQ4fPaDqaxXHp8VVVnMX7pOZI/8u2/m8=;
        b=egtQj0RJtXLHRcjAwNLSXyI5Cw2+9jFDA7qJTD1lPO2cnPH/FR7w3d4e8TiRo9j4fC
         BE/c5CVHFCWIacBMD426zyEYHhsK9aaSuhoiBXoROp3MxCKqPOb4aLOfKPKS64Sj459S
         pTkZxUMorl30GjHPgFyrvAHZz01AdrqA0/AmRTOOyTwhMGLAEIPAwYwLs8cv9MA7+zaC
         MrnPwMbUFUNTbCIqoSP2ly+jLE200Xc3zMItSRlDziXLV6pzcMvZPIkG2+9xhVOzvJ/4
         EhqzR2Sho7iks0++Mtfl/4/nXexBYSBk9JCekJvfvIF7h4b27sVr8GDgLPYchcj0K/vm
         ILMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6onY/cyHQJjWQ4fPaDqaxXHp8VVVnMX7pOZI/8u2/m8=;
        b=C8svU8E+T9IGOqEgx8MA+GuEqA1sj/FkCTgjKqUhO46A90BzQ5qIHH4g9TaL7XodFN
         BNvWTgLkV5blmZCRH/AAFDRXAtVijJ+1mA+MnXVjY6Q31CsLjX15EOCkRa4vGe9C60MI
         H4oKrCZ2tSrIwWlz5C/z85O6NLZSS54cRLwA2/NLY8SCj0MbEwe0UEhgblTmtcbR9OP/
         xDUOujdWXvxVNTOjBJaszI5N8yQZlXFRdEnCCAeZB06Xc5Z+od8t1hEt4/7nWXeReWTh
         U2g/emz4HWNHQVdOhnIi9jBOqxN3vGvqOSvN8A7H5uKv4rd2khUvgImbiNIPBkoRpcLm
         UKvQ==
X-Gm-Message-State: AOAM532FBPNZNd0jG7zVbQFMV2A5yQf+1DIB5XyHwoI0hYMNg3GnrfQL
        E7K3zCxP3yYJzPKZc7NtUpI=
X-Google-Smtp-Source: ABdhPJzAUCaB5w1qOD4g7T85rhIKkxLrJR5/j9tiLHWorgp4TqwRqcaKbcWFbrhL8/K0NQ71xyGp1Q==
X-Received: by 2002:a62:f94d:0:b029:15c:f1a3:cd47 with SMTP id g13-20020a62f94d0000b029015cf1a3cd47mr1177113pfm.81.1603926475726;
        Wed, 28 Oct 2020 16:07:55 -0700 (PDT)
Received: from sol (106-69-179-84.dyn.iinet.net.au. [106.69.179.84])
        by smtp.gmail.com with ESMTPSA id 10sm448761pjt.50.2020.10.28.16.07.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 16:07:55 -0700 (PDT)
Date:   Thu, 29 Oct 2020 07:07:49 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Jack Winch <sunt.un.morcov@gmail.com>,
        Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: Re: [PATCH v2] treewide: rework struct gpiod_line_bulk
Message-ID: <20201028230749.GA4384@sol>
References: <20201027091715.8958-1-brgl@bgdev.pl>
 <20201028093928.GA152368@sol>
 <CAMRc=MeyFR450u7=LUhGNqs7jKv0PAduUAHvM-um2SjfEMRQOw@mail.gmail.com>
 <20201028150322.GA221014@sol>
 <CAMRc=McvhpgKdyV4W8pN6cy5UyQi2jZWvaTPKBDumo0YsMefrA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=McvhpgKdyV4W8pN6cy5UyQi2jZWvaTPKBDumo0YsMefrA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Oct 28, 2020 at 05:26:51PM +0100, Bartosz Golaszewski wrote:
> On Wed, Oct 28, 2020 at 4:03 PM Kent Gibson <warthog618@gmail.com> wrote:
> >
> > On Wed, Oct 28, 2020 at 02:19:05PM +0100, Bartosz Golaszewski wrote:
> > > On Wed, Oct 28, 2020 at 10:39 AM Kent Gibson <warthog618@gmail.com> wrote:
> > > >
> > > > On Tue, Oct 27, 2020 at 10:17:15AM +0100, Bartosz Golaszewski wrote:
> > > > > From: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > > > >
> > > >
> > > > Subject should be prefixed with [libgpiod] according to the README ;).
> > > >
> > >
> > > Oh come on! :)
> > >
> > > [snip]
> > >
> > > >
> > > > If you replace the gpiod_line_bulk_iter_foreach_line() here with
> > > > manually looping over the bulk lines then everything from A to B above
> > > > can be dropped.
> > > >
> > >
> > > Something is telling me that dedicated iterators are more elegant. But
> > > I guess we can do everything manually for now and see about that
> > > later. Fair enough, I'll drop it.
> > >
> >
> > Good thing I'm here to let you know that little voice is wrong :).
> >
> > I've got a couple of commits in my working tree[1] that apply to your
> > patch and drop the iters as I've suggested if you'd like to compare.
> >
> > Cheers,
> > Kent.
> >
> > [1] https://github.com/warthog618/libgpiod/commits/for-v2
> 
> Would you mind if I squashed those changes into my patch?
> 

Not at all.

Cheers,
Kent.
