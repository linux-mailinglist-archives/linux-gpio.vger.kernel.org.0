Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FB6A35938C
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Apr 2021 06:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229673AbhDIEIJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 9 Apr 2021 00:08:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbhDIEIH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 9 Apr 2021 00:08:07 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 19F94C061760;
        Thu,  8 Apr 2021 21:07:55 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id 1so3307271qtb.0;
        Thu, 08 Apr 2021 21:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6yyDCVy3mgN7UIfoc4Ica7qnzkHDt6TIUyqqtfM/zDo=;
        b=etu1TFPpik1av1/qSzQkkOdpkLUwlHQfWIufkgDSas80OORkeuUMA2SfOv6IMJsDBj
         D11FbakI/UtmiZUE3c2n6Y9I015razUdcPx+m/1QyUkoowcm1GLD4lgIiROIbQ+HVsbZ
         gIoYRGTc22RZDxmJ9TBzF22uLhbjo15pMflAM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6yyDCVy3mgN7UIfoc4Ica7qnzkHDt6TIUyqqtfM/zDo=;
        b=AIzoyYvFi/WlMf8oPor1ZVR/9TNLzDboPwhf5TbDFKB+a/g1nUESUmlDE/Q34wd3CE
         9+ZFLM2JzIV+qOXedVMX4iHjE2aC8uu7QTstnVa9EaxOO83zvy1ueUko59wwuGzdUmeE
         OdoQ6Nbg7yajpssaVSc3HCbXqLiUziBpNkf5KusINutm/0Q/kusDf8hvHtl6bmK6xNLb
         kkK0Qc1D2OJgNyMeZKYN7EDcfptAIPfGf7HSOEscgchz8VEvi/lbuRX85nliQ9CoqdjF
         F1x8Vdm0bFl+D7sGmDyRYP5j81dgqcXsx66Uv/hsZ9ODBLkgcnjo4Jc6DC9xEnt2aPUV
         BDMA==
X-Gm-Message-State: AOAM532/E7v5PbbRtF7/VyXNbEudfqe1CIj1HJOsaNa/03w6rKi+rhvK
        jNi44BmBKyt1R4k8+V8F76V7Uc3lDkrI1MzkEvc=
X-Google-Smtp-Source: ABdhPJxL9rRQjeysZInGfbAHqF/7yTWuj4Sgw3/i2T+opVmkZocP5jOEO3AeeBapuqiz1ZJDZdAR+BRPln4hRFaqmtw=
X-Received: by 2002:ac8:4d1b:: with SMTP id w27mr5588742qtv.363.1617941274284;
 Thu, 08 Apr 2021 21:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210319061952.145040-1-andrew@aj.id.au> <2db77e16-3f44-4c02-a7ba-a4fac8141ae3@www.fastmail.com>
 <20210408121441.GG7166@minyard.net> <6ff29d26-543a-4790-abb4-ebaa3f8d0265@www.fastmail.com>
In-Reply-To: <6ff29d26-543a-4790-abb4-ebaa3f8d0265@www.fastmail.com>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 9 Apr 2021 04:07:41 +0000
Message-ID: <CACPK8Xc5HC7TZ6cUDH6+uHQO1LQCZE0YeENua1sE8nDXs0R2mg@mail.gmail.com>
Subject: Re: [PATCH v2 00/21] ipmi: Allow raw access to KCS devices
To:     Andrew Jeffery <andrew@aj.id.au>, Arnd Bergmann <arnd@arndb.de>
Cc:     Corey Minyard <minyard@acm.org>,
        openipmi-developer@lists.sourceforge.net,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        devicetree <devicetree@vger.kernel.org>,
        Tomer Maimon <tmaimon77@gmail.com>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Avi Fishman <avifishman70@gmail.com>,
        Patrick Venture <venture@google.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Tali Perry <tali.perry1@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Lee Jones <lee.jones@linaro.org>,
        "Chia-Wei, Wang" <chiawei_wang@aspeedtech.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Benjamin Fair <benjaminfair@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 8 Apr 2021 at 23:47, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 8 Apr 2021, at 21:44, Corey Minyard wrote:
> > On Thu, Apr 08, 2021 at 10:27:46AM +0930, Andrew Jeffery wrote:

> > > > 1. It begins with patches 1-5 put together by Chia-Wei, which I've
> > > > rebased on v5.12-rc2. These fix the ASPEED LPC bindings and other
> > > > non-KCS LPC-related ASPEED device drivers in a way that enables the
> > > > SerIRQ patches at the end of the series. With Joel's review I'm hoping
> > > > these 5 can go through the aspeed tree, and that the rest can go through
> > > > the IPMI tree.

> > > >
> > > > Please review!
> > >
> > > Unfortunately the cover letter got detached from the rest of the series.
> > >
> > > Any chance you can take a look at the patches?
> >
> > There were some minor concerns that were unanswered, and there really
> > was no review by others for many of the patches.
>
> Right; I was planning to clean up the minor concerns once I'd received
> some more feedback. I could have done a better job of communicating
> that :)

I'll merge the first five through the aspeed tree this coming merge
window. We have acks from the relevant maintainers.

Arnd: would you prefer that this come as it's own pull request, or as
part of the device tree branch?

Andrew, Corey: once I've got my pull requests out I'll look at
reviewing the rest of the series. Perhaps it would pay to re-send that
hunk of patches Andrew with the nits fixed?

Cheers,

Joel
