Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CEBEE7EC53
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Aug 2019 07:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731144AbfHBFvg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 2 Aug 2019 01:51:36 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:35961 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728724AbfHBFvf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Aug 2019 01:51:35 -0400
Received: by mail-qt1-f193.google.com with SMTP id z4so72832811qtc.3;
        Thu, 01 Aug 2019 22:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5ITQyJRBl7ht1TYk00a4jNJ9PbzaX8Bwy7nVWaA9ibU=;
        b=ZlXyZ6ztAsHkWX/gNtW3rbHVMXIy8YlD4tZkfmEg2K2GZWwrJbhbsffFVc4OaXLrg9
         4tTqk4gATmYjzkZBvV6sH+07OauO8iQOl7F9IrPpZzBS6Z/6Juf2gv2baaqlQJdyWdqq
         U2PcA4vf7asSgaO+0RaIZUlir57+Jn+ToB2VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5ITQyJRBl7ht1TYk00a4jNJ9PbzaX8Bwy7nVWaA9ibU=;
        b=a19PE+OfZKpGHR3zdgzAJXNdvzdf3NO8Xt7IlIOm4akZWv3yfJXYZ44HnUBcLTp+Ms
         x3BUrWR24qOoilE4mRvH+LNyrwG97g7DgInyZDdA5QPfkaoVkUTR5ewvUHGa9fXE5n5A
         4A9t5l0tXTkAinJOTZh0W1c3TLLILkJNg9H26dqvwslaFPdmtGaQIBgumdOHlWnF9TWL
         4HZrmuKxNgEh14YOpcdFGiPplmPiRcH1lmRlq6MzBKOlMaDw3LNUeV3uQRSgDObCn+/X
         6O5qTqdgTD9a+9fNth4AW+UmK2clfKtIALD7Yl/ChVZ7CbRng4ZXTSzhjirLHRdyAubz
         r/eg==
X-Gm-Message-State: APjAAAWV28DqtAXg09f4DGgh0htZ9UOf6G6Bb0Rsz6I64XL9y/3VWo4Y
        uhU6aUUczLhvod3V4jjsvAjmn9gAVHdUpAwGcB8=
X-Google-Smtp-Source: APXvYqxO7iXCAjOTakLYUnlXhbQV3QpIiWAYTjbetNNaVVixnu8M5TKpFH8tA3QT0jtpa2v4Vzycy56QBDbI0RnB0tU=
X-Received: by 2002:a05:6214:1306:: with SMTP id a6mr97854130qvv.38.1564725094592;
 Thu, 01 Aug 2019 22:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190726053959.2003-1-andrew@aj.id.au> <CAL_JsqJ+sFDG8eKbV3gvmqVHx+otWbki4dY213apzXgfhbXXEw@mail.gmail.com>
 <fd8e57f0-aee2-403e-b6fb-76d0c18fe306@www.fastmail.com>
In-Reply-To: <fd8e57f0-aee2-403e-b6fb-76d0c18fe306@www.fastmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 2 Aug 2019 05:51:23 +0000
Message-ID: <CACPK8Xc4Vigeu1B1Su5392BSCSKfoEDqt_tiDtgKmNH5ucAvAg@mail.gmail.com>
Subject: Re: [RFC-ish PATCH 00/17] Clean up ASPEED devicetree warnings
To:     Andrew Jeffery <andrew@aj.id.au>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-aspeed@lists.ozlabs.org,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Adriana Kobylak <anoo@us.ibm.com>,
        "Alexander A. Filippov" <a.filippov@yadro.com>,
        Arnd Bergmann <arnd@arndb.de>,
        =?UTF-8?B?WWFuZ0JyaWFuQy5XIOaliuWYieWBiSBUQU8=?= 
        <yang.brianc.w@inventec.com>, Corey Minyard <minyard@acm.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        John Wang <wangzqbj@inspur.com>,
        Ken Chen <chen.kenyy@inventec.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        openipmi-developer@lists.sourceforge.net,
        Patrick Venture <venture@google.com>,
        Stefan M Schaeckeler <sschaeck@cisco.com>,
        Tao Ren <taoren@fb.com>, Xo Wang <xow@google.com>,
        yao.yuan@linaro.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 30 Jul 2019 at 01:09, Andrew Jeffery <andrew@aj.id.au> wrote:

> > > The bang-for-buck is in fixing up the KCS bindings which removes all-but-two of
> > > the remaining warnings (which we can't feasibly remove), but doing so forces
> > > code changes (which I'd avoided up until this point).
> > >
> > > Reflecting broadly on the fixes, I think I've made a mistake way back by using
> > > syscon/simple-mfds to expose the innards of the SCU and LPC controllers in the
> > > devicetree. This series cleans up what's currently there, but I have half a
> > > mind to rev the SCU and LPC bindings to not use simple-mfd and instead have a
> > > driver implementation that uses `platform_device_register_full()` or similar to
> > > deal with the mess.
> > >
> > > Rob - I'm looking for your thoughts here and on the series, I've never felt
> > > entirely comfortable with what I cooked up. Your advice would be appreciated.
> >
> > The series generally looks fine to me from a quick scan. As far as
> > dropping 'simple-mfd', having less fine grained description in DT is
> > generally my preference. It comes down to whether what you have
> > defined is maintainable. As most of it is just additions, I think what
> > you have is fine. Maybe keep all this in mind for the next chip
> > depending how the SCU and LPC change.
>
> Okay, I think the timing of that suggestion is good given where things are with
> the AST2600. I'll keep that in mind.
>
> Consensus so far seems to be that the series is fine. I'll split it up and send out
> the sub-series to the relevant lists with the acks accumulated here.

The series look good. I suggest posting the KCS bindings and driver
changes as their own series to go through the IPMI tree.

Please add my tag to all the patches except the OCC one, which I need
to do some investigation in to.

Reviewed-by: Joel Stanley <joel@jms.id.au>

The others can go via the aspeed tree. Perhaps post them as their own
series too so I don't get confused and apply the wrong ones. That way
if Rob wants to send his reviewed-by he can.

Cheers,

Joel
