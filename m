Return-Path: <linux-gpio+bounces-14583-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C75A04C97
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 23:45:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4B1CB16691B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 22:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB191DD539;
	Tue,  7 Jan 2025 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="NED0+7Ze"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B983218DF81
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jan 2025 22:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736289951; cv=none; b=f+MWmTnQ1CPepp30ItRaFVf57K4UndzfP9pTkif4nE3TJH9JPRbXzcGp3uxBD8jN1mqLZK0FwvuffFKkOvrjoe++LMTa8lsjMHsf/mqArWOts+YXck8ImwSTpZGCEMSf6O4d1q5UDPqjdIIKXeBUgTsIuzZefCWi1cbGY4QDDFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736289951; c=relaxed/simple;
	bh=0p7I6CjwprjKUPF85iarFF3/An5PH4d3rFnUVpXCKjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFCVML9/PROjCAXiLS630ziIBk2QnxOVbxSnHfMdwqi5MS/mCOf+0jKc3g0r99xJgktaeHE8lsf6ls+EaEoEoKPYFof5LCagU35cCqC9Zy0/0gozlFNE5tJ1O+99r5SdYuDJ7dwQAq6cOpJUvrnvy3Yb5IJ1Ve8LPeQWtiFdC+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=NED0+7Ze; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 3B019240027
	for <linux-gpio@vger.kernel.org>; Tue,  7 Jan 2025 23:45:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736289942; bh=0p7I6CjwprjKUPF85iarFF3/An5PH4d3rFnUVpXCKjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=NED0+7Zef0TlyRwcDOcxyomiAje/XlK64U5Isxg5aOeL8X9Liz8niSLE6ZnPkXXXt
	 y+rkSZgKeB59X49tFTC8BwOpFWgDJpcgEl8VOn19kTfSrlqmJLz8Hl05foLpILl5Gp
	 oCFXU53bh2eh5mug3HfK35IOrV4Q27i5qEEXnim1YkXzQtCjwWhM2noQXAI2Bgqr5w
	 KsFh39G/+TsFiBc6dtKKLhWzzF0MKCC/dVtRl90eoN+S4p9Q2fx8r2C9SQ1pk7vQJz
	 IkSbdZ0LscoGj4sVWTrCtx0ueYR9OKzw9ucpzYOVErxqrfVBwxHGjywToOVpxDNtLi
	 1fIjeHFpUFAjg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YSR374WRgz6tvZ;
	Tue,  7 Jan 2025 23:45:39 +0100 (CET)
Date: Tue,  7 Jan 2025 22:45:39 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 01/19] powerpc: Generalize MPC831x platform support
Message-ID: <Z32uk8VJqhlogY50@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-1-86f78ba2a7af@posteo.net>
 <0b66e94d-7116-4916-b897-06b1199752b4@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b66e94d-7116-4916-b897-06b1199752b4@csgroup.eu>

On Mon, Jan 06, 2025 at 02:50:31PM +0100, Christophe Leroy wrote:
> 
> 
> Le 02/01/2025 à 19:31, J. Neuschäfer via B4 Relay a écrit :
> > [Vous ne recevez pas souvent de courriers de devnull+j.ne.posteo.net@kernel.org. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> > 
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > The Reference Design Boards (RDB) don't have the same relevance they had
> > then the MPC831x platform was new; if any work is done today, then
> > likely based on used production boards, which are more readily available
> > than NXP's discontinued devboards.
> > 
> > To further reduce the focus on RDBs, add DT compatible strings for all
> > four MPC8314/5 variants.
> 
> Seems like this patch does more than adding DT compatible strings.

I'll move the addition of DT compatibles to a new patch.

> 
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
[...]
> > diff --git a/arch/powerpc/platforms/83xx/Kconfig b/arch/powerpc/platforms/83xx/Kconfig
> > index d355ad40995fdc0fc3b4355126c65c761c21c296..944ec44a1fa6044b03ac71c295e891cd411ce444 100644
> > --- a/arch/powerpc/platforms/83xx/Kconfig
> > +++ b/arch/powerpc/platforms/83xx/Kconfig
> > @@ -18,12 +18,12 @@ config MPC830x_RDB
> >          help
> >            This option enables support for the MPC8308 RDB and MPC8308 P1M boards.
> > 
> > -config MPC831x_RDB
> > -       bool "Freescale MPC831x RDB"
> > +config MPC831x
> 
> That looks confusing. We already have CONFIG_PPC_MPC831x

Fair enough. How about CONFIG_MPC831x_BOARDS?

> 
> > +       bool "Freescale MPC831x boards"
> >          select DEFAULT_UIMAGE
> >          select PPC_MPC831x
> >          help
> > -         This option enables support for the MPC8313 RDB and MPC8315 RDB boards.
> > +         This option enables support for all MPC831x-based boards.
> > 
> >   config MPC832x_RDB
> >          bool "Freescale MPC832x RDB"
> > diff --git a/arch/powerpc/platforms/83xx/Makefile b/arch/powerpc/platforms/83xx/Makefile
> > index 6fc3dba943dade4f63da090b520b0c35bb46a091..92fb0b34913e1113d3e6eac49acbb1c32fb06ab7 100644
> > --- a/arch/powerpc/platforms/83xx/Makefile
> > +++ b/arch/powerpc/platforms/83xx/Makefile
> > @@ -6,7 +6,7 @@ obj-y                           := misc.o
> >   obj-$(CONFIG_SUSPEND)          += suspend.o suspend-asm.o
> >   obj-$(CONFIG_MCU_MPC8349EMITX) += mcu_mpc8349emitx.o
> >   obj-$(CONFIG_MPC830x_RDB)      += mpc830x_rdb.o
> > -obj-$(CONFIG_MPC831x_RDB)      += mpc831x_rdb.o
> > +obj-$(CONFIG_MPC831x)          += mpc831x.o
> >   obj-$(CONFIG_MPC832x_RDB)      += mpc832x_rdb.o
> >   obj-$(CONFIG_MPC834x_ITX)      += mpc834x_itx.o
> >   obj-$(CONFIG_MPC836x_RDK)      += mpc836x_rdk.o
> > diff --git a/arch/powerpc/platforms/83xx/mpc831x_rdb.c b/arch/powerpc/platforms/83xx/mpc831x.c
> > similarity index 65%
> > rename from arch/powerpc/platforms/83xx/mpc831x_rdb.c
> > rename to arch/powerpc/platforms/83xx/mpc831x.c
> > index 5c39966762e4264d2ef91b2c4ef75fdf2c2c5d65..7250fc11c7ee80b266f39d0b3aebb0deb777c129 100644
> > --- a/arch/powerpc/platforms/83xx/mpc831x_rdb.c
> > +++ b/arch/powerpc/platforms/83xx/mpc831x.c
> > @@ -1,8 +1,8 @@
> >   // SPDX-License-Identifier: GPL-2.0-or-later
> >   /*
> > - * arch/powerpc/platforms/83xx/mpc831x_rdb.c
> > + * arch/powerpc/platforms/83xx/mpc831x.c
> 
> Please remove the file name from the file.

Will do.

> >    *
> > - * Description: MPC831x RDB board specific routines.
> > + * Description: MPC831x board specific routines.
> 
> s/board/boards ?

No, the "board" in "board specific" doesn't get pluralized when there
are multiple boards. How about the following?

      * Description: MPC831x specific routines.



Best regards,
J. Neuschäfer

