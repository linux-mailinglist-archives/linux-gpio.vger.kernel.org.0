Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E976E15A93E
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Feb 2020 13:36:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgBLMgu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Feb 2020 07:36:50 -0500
Received: from mail-pj1-f44.google.com ([209.85.216.44]:51728 "EHLO
        mail-pj1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725887AbgBLMgu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Feb 2020 07:36:50 -0500
Received: by mail-pj1-f44.google.com with SMTP id fa20so845665pjb.1
        for <linux-gpio@vger.kernel.org>; Wed, 12 Feb 2020 04:36:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=b2Uk1qiEkZiDpUOfdtFzuazPEIt5nLgJBn21yRCjOHw=;
        b=l7IWMiSL2IrCx9jIQhe1qD9SHJB4JXzN9l02cUJDfHu28EZv+8FsgeLFzSvxyAAHyG
         dzyoLc/hYQYU1SjxUnY7PfYN/TerCDV6HKmxshyWwTEgE8UVI+QXSec2HwOkw7jFDHwl
         0ry4ZQR8eHThzA3M4uZqeoEbS3vAPssFLobDA2gfhFUTI5ReyJpnMlEpmFTkrtRC2CuW
         mkLoz2EcrvwUB0QnZOPMxwJUAw7cUQJ9xEI0THsRPsffnzuMq61h8b5xTo7WTy12O47n
         FYmnX/YdpwCHpduYCubTY/kKByQw74owGV/axLdBmmGt3sBMem8uuESBZ/YXkYHF6JWU
         7ROA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=b2Uk1qiEkZiDpUOfdtFzuazPEIt5nLgJBn21yRCjOHw=;
        b=j4T/QlYkgUe8oaJhY9PxHTuK3R/t01Q+4u/uJdyhJI65Szm4zCB93QhsymHXPvI2aK
         taCckVwykPNpBQhduMBCQ5Yny+g94diQJroCxJsZ9eTzYvy61pzwsZ3Qc6LJb7FMh/ko
         G71dPayDs28GsEMC0CpKGA0eh8fgk/7X4RqDcqzEciSPPUB1Ee8tR9UM9yWqKNaeJBMo
         HOCaCZvJU9jnO4KBSZ8q9wyPjR1jAchCsb3gnGnOH8v2IJ8f/oNDomPk53LJesUypyCu
         bADlhtKsm0WKPx/TORzFazz62xI+D5fkQgVeZ3mocyjVqfxeCUP/P8EXH6xAgAQdavNl
         2HMQ==
X-Gm-Message-State: APjAAAX+YTa5yj7/68Hit678hr916kYf+jLx9sT3NYmVKYbF1HT3S2Gl
        EoiJj/B6ETTRTK1WJL0yK9w=
X-Google-Smtp-Source: APXvYqypXkVJOkeGgwurf3fODYJUCYqNnOD3WFJ4mZOO052vB2lTUZBDUUxKtRy8hX2UJugWSCIv2Q==
X-Received: by 2002:a17:90a:b009:: with SMTP id x9mr9810375pjq.124.1581511009354;
        Wed, 12 Feb 2020 04:36:49 -0800 (PST)
Received: from sol (220-235-95-183.dyn.iinet.net.au. [220.235.95.183])
        by smtp.gmail.com with ESMTPSA id u1sm761429pfn.133.2020.02.12.04.36.46
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Feb 2020 04:36:48 -0800 (PST)
Date:   Wed, 12 Feb 2020 20:36:43 +0800
From:   Kent Gibson <warthog618@gmail.com>
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Helmut Grohne <helmut.grohne@intenta.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bartekgola@gmail.com>
Subject: Re: [libgpiod] consider changing the license of the C++ bindings
Message-ID: <20200212123643.GA15507@sol>
References: <20200212074243.GA17928@laureti-dev>
 <CAMRc=Mdj6whafFQ9KN+gi8HhKCSfkhGtqhO-+AM+3JEb5MCQPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mdj6whafFQ9KN+gi8HhKCSfkhGtqhO-+AM+3JEb5MCQPA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Feb 12, 2020 at 11:00:56AM +0100, Bartosz Golaszewski wrote:
> śr., 12 lut 2020 o 08:48 Helmut Grohne <helmut.grohne@intenta.de> napisał(a):
> >
> > Hi,
> >
> > I've recently encountered libgpiod and found that its API is nice to
> > work with. Thank you for this piece of software.
> >
> > IANAL
> >
> > The library is licensed LGPL, which makes it available to non-free uses
> > in principle. For the C library, I think this is a good license. For the
> > C++ bindings, LGPL poses a little problem as code can be generated from
> > the header. For instance, libgpiodcxx is using `ctor() = default;`.
> > Strict intepretation of the LGPL would mean that a downstream user
> > should be able to recompile the whole product using libgpiodcxx.
> > Effectively, libgpiodcxx can be considered GPL (not LGPL) licensed for
> > practical purposes. You can find more background at:
> >  * https://blogs.msmvps.com/gdicanio/2016/07/11/the-lgpl-and-libraries-exposing-a-c-interface/
> >  * Eigen was initially LGPL and was converted to MPL2:
> >    https://eigen.tuxfamily.org/index.php?title=News:Relicensing_to_MPL2!
> >  * QT4 has also encountred this:
> >    https://lwn.net/Articles/315251/
> > I think that the LGPL when applied to C++ results in an unclear
> > licensing situation at best and an effective GPL at a strict
> > interpretation. Varying license interpretation rarely results in
> > anything good.
> >
> > For these reasons, I ask you to consider changing the license for
> > libgpiodcxx only (and not for libgpiod nor for the Python bindings). I
> > propose following Eigen and switching to MPL2. If however, the intention
> > is the strict reading of the non-lesser GPL, consider switching to that
> > instead. Either change improves the clarity of the licensing and makes
> > the intention visible.
> >
> 
> Hi Helmut,
> 
> thank you for this e-mail. I admit I'm not very well versed in
> software licensing. What you're saying makes sense and the links you
> posted seem to confirm it. I'll still try to get a second opinion on
> this. Anyway: my intention is to make the library available to
> non-free projects - including C++ bindings - so MPL2 makes sense.
> 
> There's only one significant contributor (new features, not bug-fixes)
> to C++ bindings other than me (Cc'ed Kent Gibson) from whom I'd need
> an ack on relicensing, so it shouldn't be very difficult to do.
> 

I agree with your intent, so feel free to relicense as you see fit.

Kent.

> While at it: LGPL is the only license used by all libgpiod components.
> Do you know if it makes sense to use regular GPL for programs that are
> part of the repo and LGPL for libraries only (except C++ bindings)?
> 
> Best regards,
> Bartosz Golaszewski
