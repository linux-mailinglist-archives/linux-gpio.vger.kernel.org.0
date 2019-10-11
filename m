Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46A49D41C8
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2019 15:49:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727589AbfJKNtt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Oct 2019 09:49:49 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41889 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728027AbfJKNtt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 11 Oct 2019 09:49:49 -0400
Received: by mail-pg1-f193.google.com with SMTP id t3so5835490pga.8
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2019 06:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FkkdXZCKufhPfpJuUrLtjBXl+mZnj5fRvjRYErS4ujs=;
        b=LO9BrhRvZE7epUFiyqyJYbhp4xwnr7ZMuGcnmyGsHQVMOxE2BJJVd/PpyjVsJU5H+X
         RIploftSJdisD5SlkXJMar7mS09q3WNrg6mgkenJIfK7GBSqSQBAKbajSmXFAMaOX0Nw
         m4BAmOp2wmSBFwMP37L1WK9Gphh+R0Pc5okMqSdbg/gRR0/gAEjvcLlVONXX+XUkFeYM
         M9IAg+Jz9WTBWjo7pOEqHYyufpMz7nInGyKClJNyLrlzEcxHwnj3hIBxL4Kv1hoMF3DV
         3RYnaSntHIUJYBNBLp7WootTs0MkO0bUmZJgVbgeo/Vw3e7umL3wXgtTf7NbejIrTiX6
         0YQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FkkdXZCKufhPfpJuUrLtjBXl+mZnj5fRvjRYErS4ujs=;
        b=r3BdKyMEj4uBO1i33tx1WsmXtgkxcG4o5GDYZPfVeD21yh5G95Vzd5tJH4gMu+MXZM
         CJ7/ag8Uz6g7CxU8rYbudAQsz3oOFt8tMGfJFt0LY3flOg7eCaG7S32Z46uYUynAlTeq
         H3aJMmZem126mL36Lkkcv83KsBbn2sHIC/+Lnv41Of1Q9d8IrWadazdZ/olmVnA+Jb3c
         Ul6xFukpOwzNlZ/SA49tL2OQ9h8trfyL17XQitVK+fN4VzqqqYgBNJZRB6WR56chdIq0
         KDVuau41Cc/8uCWLrnl1+4nD6Klhdnlr1g2xumsmivNOO72A9fDS36Y8L/c7aMwRh7M9
         7j9Q==
X-Gm-Message-State: APjAAAX6F4aUyfTIGkrRao+AWkKOkn14I1fOPFno8egXGyjvTcwtQCU1
        O2xhtCGfx2TlOsaxK7ERtEQ=
X-Google-Smtp-Source: APXvYqwxt1tDKSuHujrWhL+ecRzB67r6QKu7VRMrxsLk5ICihQJtRjFFz0E7qPxMfRrz4yC+dP9thQ==
X-Received: by 2002:a65:6817:: with SMTP id l23mr16727719pgt.338.1570801788090;
        Fri, 11 Oct 2019 06:49:48 -0700 (PDT)
Received: from sol (220-235-84-126.dyn.iinet.net.au. [220.235.84.126])
        by smtp.gmail.com with ESMTPSA id l192sm19689557pga.92.2019.10.11.06.49.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Oct 2019 06:49:47 -0700 (PDT)
Date:   Fri, 11 Oct 2019 21:49:41 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Drew Fustini <pdp7pdp7@gmail.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [RFC] gpio: expose pull-up/pull-down line flags to userspace
Message-ID: <20191011134941.GA29042@sol>
References: <CAMRc=MdcWUtEx3QAKxEmEEa1Effq7JpRPGNJOGfSYP6Nh0p1Hg@mail.gmail.com>
 <20191008235626.GA10744@sol>
 <CAMRc=MdCktRBkofaqAEtjNLNS=60Z9zM9a4QoBLsCsx3bSdxtQ@mail.gmail.com>
 <20191009002211.GA11168@sol>
 <20191009065524.GA4061@sol>
 <20191009133037.GA17244@x1>
 <20191009235938.GA10263@sol>
 <CAEf4M_D4C2v87XR7oyc4YLN9j9XhSctJcw1NCt8hPcuf0P_=DA@mail.gmail.com>
 <20191010101421.GA14692@sol>
 <CAEf4M_Av=kgwgqWOT+-4YAwxOKFvMnPs8AvnNFdaGTu5yd90+A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4M_Av=kgwgqWOT+-4YAwxOKFvMnPs8AvnNFdaGTu5yd90+A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 11, 2019 at 03:06:41PM +0200, Drew Fustini wrote:
> Hi Kent,
> 
> I noticed there are some additional commits in your branch including:
> 7f0bcb88f583  pull up/down on output is actually a valid option
> 
Yeah pulls make no sense for push pull lines, but while looking into
disabling bias I discovered that there are some chips that support
pull-up/down for open drain/source outputs.
It seemed reasonable to support them rather than reject them outright,
hence the reversal.

> Do you know what the result would be when the line is an output?
> 
Behaviour would depend on the driver and chip.
I'm assuming the user would only request combinations that make sense
and that the driver would reject any combinations that might have
unfortunate results.

I'm working on improving my git-fu to collect the pull changes from that
branch, and hope to mail out a patch set shortly.

Cheers,
Kent.
