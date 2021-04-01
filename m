Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF166351093
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 10:07:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233491AbhDAIHH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 04:07:07 -0400
Received: from mx1.tq-group.com ([93.104.207.81]:12465 "EHLO mx1.tq-group.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230291AbhDAIGz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Apr 2021 04:06:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617264415; x=1648800415;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JvK38X2egqiefDWRwDTzm+i6MajAYS5riqwtUmLVTBQ=;
  b=AJEFl7Sn0ZYlklsNW1UEDFlswI9GpYwmPuVYtocwGEH/X1vfK9honvZU
   nz5CjGjJXQfMee9ojWJ37zSEC8XfyEPaL5fJBq5mi+Robd9HTNo89x90w
   Qu3t14C2hL8eG+ciM5xOnhdDZE9gsztCXlBcftW6hLZHswxSkGPA4BJ+S
   83wGnA63LE9Eo8LXj9wzJ9IuW91HOAFsBMRwYjWcHSqmYCdrBVY8+giRY
   dNrhSXfQmYZgLIMEWCO6Km3lqMQQrcXEdUQ9kq8lfSK+xo76N2oUIhKuu
   CmwmaxMgpSDe5p9yOnQ7dQlB6p5mAcm+UtVXUBF1pC7Fb6g/ktIAkpNtC
   w==;
IronPort-SDR: Kx60w8r8TnJMRw+yDMmJZFd11On0RZCLb4LPX7V7kP320tUgcKrrmzJdVmInHxMuG9v8KKBBmu
 EgFPaUftGi0s6nHx0OxOPWRXiYp2KT1pua8CCoMMjmfFGCUe1YsT8lewD3PcZWtNCGSPK+aMmN
 z5WrO/+iUkP6BhiI0Ii5QbU8wc6iiGe7xeo4Gv86vkwRmYUd7cnoNRqkOWM3vcT3RxWiXi6YHC
 JMQ7TraGS1Ht1x+jgIjzzG61OMxOyIqBUUu5nPtvvxa0AHsAfsOwPotRgJ8vRuKbPYzBpk4IHl
 S8E=
X-IronPort-AV: E=Sophos;i="5.81,296,1610406000"; 
   d="scan'208";a="16758882"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 01 Apr 2021 10:06:50 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Thu, 01 Apr 2021 10:06:50 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Thu, 01 Apr 2021 10:06:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1617264410; x=1648800410;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JvK38X2egqiefDWRwDTzm+i6MajAYS5riqwtUmLVTBQ=;
  b=EgZES/zMRuCIf/LSH5FFipGT7TSAQ1I3e0+V+wzbR80m4qFf50XM1JZl
   YTFRdVtM8cHiNvXy24WcgSsBrmYx7zYlEOmcAfNCLQ6bv6FkJVQJWkmyF
   SHWqA6lSX/d7ynFb4CLZWljyCfhqvmCEl85sVWpZ6vsa+BKX05GwC1ubt
   tymI0Iy4emx23g/3cl7gkm6g/z9YP6kmgQEicMGBi2aMpEBihw08J6t+m
   SAw2E2SuAaO+ZykSU2XDfiK1442qh52mefcYJS65lrfTWrCiLM2B6l5v+
   QVEl7hkTSVS0VSII1qntPjBzTRciDQv67fF3M1tLffTkWR+bJfQ8kRnm8
   g==;
IronPort-SDR: GNwTxHPp0HjhOq+w7b8gURPaEtsTZa/Wv2HW63XfMaiLRZgOk6pZQAjh91FKGnw9CFawcsadol
 L8HJ4jEYT1liO7BLgcomj/wxOavrGqsE8A/ciKJkMHYqACbn1AhWZnEBbE4PJLvaoH0DIWv4+E
 GL6pT0UL2cUqjJZsuV5xfD8o1dXrGEHaqcnAY8caK8X4L2Q/bWKfRXTktJXGbViOA0QBSJ6vIS
 mea6CY2tpzMqvE0X5UMN738CsRJ/4RuptWh2nqdOaaWL6U5rtKEsAKCr6/LPnWks93Itz0YAD1
 5g0=
X-IronPort-AV: E=Sophos;i="5.81,296,1610406000"; 
   d="scan'208";a="16758881"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 01 Apr 2021 10:06:50 +0200
Received: from schifferm-ubuntu4.tq-net.de (schifferm-ubuntu4.tq-net.de [10.121.48.12])
        by vtuxmail01.tq-net.de (Postfix) with ESMTPA id 26F8D280070;
        Thu,  1 Apr 2021 10:06:50 +0200 (CEST)
X-CheckPoint: {60657F17-10-B70C521D-D627A946}
X-MAIL-CPID: 7A1E7E5013B3DDF7CDC4AAEFACC49D7A_0
X-Control-Analysis: str=0001.0A782F27.60657F1A.0056,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Message-ID: <35e8c3ce5d4265b4e7294b4296c60484aab6adbc.camel@ew.tq-group.com>
Subject: Re: [PATCH 3/3] mfd: tqmx86: add support for TQMxE40M
From:   Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To:     Lee Jones <lee.jones@linaro.org>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Date:   Thu, 01 Apr 2021 10:06:47 +0200
In-Reply-To: <20210401080437.GM2916463@dell>
References: <cover.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <3c19d714645f788913956223097adc360ceb6203.1617189926.git.matthias.schiffer@ew.tq-group.com>
         <CAHp75Vdk4rxiD_nm8Cb53oTYNvMqkAOM4U5zEn5tchtptQZEBw@mail.gmail.com>
         <83d7ea27b27225727fec7b077efe1a67ba1184a9.camel@ew.tq-group.com>
         <CAHp75Vc5Nw+GJ4tFeciYZQhJ_NbRZMJjJNcWeFq7nOuAOe0=jQ@mail.gmail.com>
         <20210401080437.GM2916463@dell>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 2021-04-01 at 09:04 +0100, Lee Jones wrote:
> On Wed, 31 Mar 2021, Andy Shevchenko wrote:
> 
> > On Wed, Mar 31, 2021 at 4:33 PM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:
> > > On Wed, 2021-03-31 at 15:37 +0300, Andy Shevchenko wrote:
> > > > On Wed, Mar 31, 2021 at 2:38 PM Matthias Schiffer
> > > > <matthias.schiffer@ew.tq-group.com> wrote:
> > 
> > ...
> > 
> > > > > +               return 24000;
> > > > 
> > > > AFAICS it will return 24 MHz for "Unknown" board. Is it okay to be so brave?
> > > 
> > > As noted in the commit message, our hardware developers intend to use
> > > 24 MHz for all future x86 SoMs.
> > 
> > What may go wrong in the future?.. (rhetorical question, obviously)
> 
> My preference would be to be explicit.
> 
> Rather than support boards implicitly i.e. by accident.
> 

How about logging a warning for unknown boards, but still returning
24 MHz?

