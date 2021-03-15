Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D546C33C347
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Mar 2021 18:05:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234601AbhCORFH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Mar 2021 13:05:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231442AbhCOREz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Mar 2021 13:04:55 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 758D1C06174A;
        Mon, 15 Mar 2021 10:04:55 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id c16so15636912ply.0;
        Mon, 15 Mar 2021 10:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZYQCRNn81lFAL6SPD/yp7d53z2RJAlRcSF3q2qdHaNk=;
        b=eWTIKTZp7gDs6a8TnEbG07ZEl2WN2lv0hPqFgo/ZJdxhvdR31r3wLBLfkU0A/mTFur
         uFWyt+YpvyBeU46GIh3XZe8Vf6tvAmyEJV2kTGIbEgXniDN6zxF0DtFZvEQmncgNmS51
         u9gfGxjCtNRu5LoBDrgDc+z1pK20nKGIiXdGtOOMokU1I76lp1bd4vuXmMj5dMw0n6kE
         lVC4eCv0x0+g8j4gvEY4PEs9Z2k8LMmYNkhNfzQT36NP3tw9vCPod5kvhCc5rH+0ajSb
         HinEx3KimILX/68tn+ExWlOUG1YFwIy/mPZft0cAH92tLdm9YFUKl3Pm38QENvEBjYnG
         hO4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZYQCRNn81lFAL6SPD/yp7d53z2RJAlRcSF3q2qdHaNk=;
        b=qhYlWHSDghZvpsjTXaW2BaMABt9wHXtSwzBlvEFLj3oCDMgOL6ZPkF2X11zr4jBTnw
         BlrQ9IeyFe4Ry/NkdTlxuslAm2YTSa42QrUg/L+OnjgnOjenkmkPa6nl6Q+h0FjZyhGj
         6snqjw/JjxN0uD8w36fznS9k9F4e9XBFh7xpXtUCIhRpKs55xAER3ekxSVFja2Us5hYE
         WGaYVQ+XfYwpt8qRX+b2RL8KgE1vLr12QLqbvka+r44aKWNCi6utrFBqcj7Rdz7iMY1o
         n+AelczpVD8kPvpAFPqRlcwTcdWiXztLPbyic4ENupPHoczqxXCS5rBX07XK9Q6pS/g+
         NQ+w==
X-Gm-Message-State: AOAM532gg1Bi18750fPkNn2JYnRdFGZagtNw1smJag080AMHt1ONIOam
        q3AI7zpZjOSIwXmstZAUXWec9wc9pqWh2JNLQ5E=
X-Google-Smtp-Source: ABdhPJyz8wzDznwf88+QvlIT4Hs9wQTIh4pQMJw7mYiDbpFQ9H1J1HvTIKtXoyX1ndvETzmrUv6etiij9BfJXhLFDR0=
X-Received: by 2002:a17:90a:db49:: with SMTP id u9mr10160pjx.181.1615827894922;
 Mon, 15 Mar 2021 10:04:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210305120240.42830-1-andriy.shevchenko@linux.intel.com>
 <CAMRc=Mfye=O4mMiK01Q6Ok+ztSfMwMcrfaZSs+LhRxi=AM+C2w@mail.gmail.com>
 <YE8z+ohM9abBs9SD@smile.fi.intel.com> <YE9YGGB+k7CsCNDI@smile.fi.intel.com>
 <CAMRc=McLsamBwe8hSob11ustk2GUzOfYh7CcqNtxsM+6vgPENw@mail.gmail.com>
 <YE9whHhaa2XavKfj@smile.fi.intel.com> <CAMpxmJVUVhpcNOVQCB3p8tNpac5e5c7vRQS=-avA6Cuaag9eRw@mail.gmail.com>
In-Reply-To: <CAMpxmJVUVhpcNOVQCB3p8tNpac5e5c7vRQS=-avA6Cuaag9eRw@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Mar 2021 19:04:38 +0200
Message-ID: <CAHp75VfsGn=dTo+f2MtssqWpuj_Sm+LHtTaM=7oW9g8riz4xTg@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpiolib: Read "gpio-line-names" from a firmware node
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek Vasut <marex@denx.de>,
        Roman Guskov <rguskov@dh-electronics.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 6:49 PM Bartosz Golaszewski
<bgolaszewski@baylibre.com> wrote:
>
> On Mon, Mar 15, 2021 at 3:34 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> >
> > On Mon, Mar 15, 2021 at 03:04:37PM +0100, Bartosz Golaszewski wrote:
> > > On Mon, Mar 15, 2021 at 1:50 PM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:
> > > >
> > > > On Mon, Mar 15, 2021 at 12:16:26PM +0200, Andy Shevchenko wrote:
> > > > > On Mon, Mar 15, 2021 at 10:01:47AM +0100, Bartosz Golaszewski wrote:
> > > > > > On Fri, Mar 5, 2021 at 1:03 PM Andy Shevchenko
> > > > > > <andriy.shevchenko@linux.intel.com> wrote:
> > > > >
> > > > > > Unfortunately while this may fix the particular use-case on STM32, it
> > > > > > breaks all other users as the 'gpio-line-names' property doesn't live
> > > > > > on dev_fwnode(&gdev->dev) but on dev_fwnode(chip->parent).
> > > > > >
> > > > > > How about we first look for this property on the latter and only if
> > > > > > it's not present descend down to the former fwnode?
> > > > >
> > > > > Oops, I have tested on x86 and it worked the same way.
> > > > >
> > > > > Lemme check this, but I think the issue rather in ordering when we apply fwnode
> > > > > to the newly created device and when we actually retrieve gpio-line-names
> > > > > property.
> > > >
> > > > Hmm... I can't see how it's possible can be. Can you provide a platform name
> > > > and pointers to the DTS that has been broken by the change?
> > > >
> > >
> > > I noticed it with gpio-mockup (libgpiod tests failed on v5.12-rc3) and
> > > the WiP gpio-sim - but it's the same on most DT platforms. The node
> > > that contains the `gpio-line-names` is the one associated with the
> > > platform device passed to the GPIO driver. The gpiolib then creates
> > > another struct device that becomes the child of that node but it
> > > doesn't copy the parent's properties to it (nor should it).
> > >
> > > Every driver that reads device properties does it from the parent
> > > device, not the one in gdev - whether it uses of_, fwnode_ or generic
> > > device_ properties.
> >
> > What you are telling contradicts with the idea of copying parent's fwnode
> > (or OF node) in the current code.
> >
>
> Ha! While the OF node of the parent device is indeed assigned to the
> gdev's dev, the same isn't done in the core code for fwnodes and
> simulated chips don't have an associated OF node, so this is the
> culprit I suppose.

Close, but not fully correct.
First of all it depends on the OF / ACPI / platform enumeration.
Second, we are talking about secondary fwnode in the case where it happens.

I'm in the middle of debugging this, I'll come up with something soon I believe.

> > Basically to access the properties we have to use either what specific driver
> > supplied (by setting gpiochip->of_node or by leaving it NULL and in this case
> > gpiochip_add_data_with_key() will copy it from the parent.
> >
> > That said, we shouldn't care about parent vs. GPIO device fwnode when reading
> > properties. So, bug is somewhere else.
> >
> > In any case, I will test with the gpio-mockup, thanks!



-- 
With Best Regards,
Andy Shevchenko
