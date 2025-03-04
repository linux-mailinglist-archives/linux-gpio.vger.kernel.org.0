Return-Path: <linux-gpio+bounces-16987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D97A4D4EF
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 08:39:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1AB313AB26B
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 07:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87F31F7911;
	Tue,  4 Mar 2025 07:39:08 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FF01F55F8;
	Tue,  4 Mar 2025 07:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741073948; cv=none; b=It1Net4l+lONuG3duUn91SpAeEpvDxDOtQ06nZ1Lksc3FBkRM04TwuAcZiVNEo82nCmy7EcTSVvNMaY6+U4jyo1fwpDsEYaOoD7U8EvJ9qmypgfn97b17yXYG2CnR7omI7vyY1DfyXQjE01/dFPehG/VWS4vjBW2BgLi1ZzU1D0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741073948; c=relaxed/simple;
	bh=pp6cxliTAdX/ToQmnTQjP3FVGBVTcVn4aX4ceR300nU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WtWXGHRvUbPvXPMd4B72/vulDWM23R7mjOElfZaWCervCY/xUijQPdGhxbpr2i+WsUo+dwSO9G/p5+hhkFRkkG2HqUJlbrcvDFWFzAHmuv2LafZ0TtlqmpyaEzNU2zSGDFmT9oYurRl94VABEz/BHyhoLciSKyVw2Ve0pvliZe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id B8E58343072;
	Tue, 04 Mar 2025 07:39:05 +0000 (UTC)
Date: Tue, 4 Mar 2025 07:39:01 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/2] irqdomain: support three-cell scheme interrupts
Message-ID: <20250304073901-GYA60841@gentoo>
References: <20250302-04-gpio-irq-threecell-v2-0-34f13ad37ea4@gentoo.org>
 <20250302-04-gpio-irq-threecell-v2-1-34f13ad37ea4@gentoo.org>
 <87jz97cml1.ffs@tglx>
 <20250303124011-GYA59067@gentoo>
 <CACRpkdZn93oA6Tmi4EaWw9U=TAjEAdqgtK+2Ct_Nf1YUUrurgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZn93oA6Tmi4EaWw9U=TAjEAdqgtK+2Ct_Nf1YUUrurgw@mail.gmail.com>

Hi Linus Walleij:

On 08:31 Tue 04 Mar     , Linus Walleij wrote:
> On Mon, Mar 3, 2025 at 1:40 PM Yixun Lan <dlan@gentoo.org> wrote:
> > On 19:30 Sun 02 Mar     , Thomas Gleixner wrote:
> 
> > > Why is the three cell translation not following the one/two cell scheme
> > > and has the parameters at the same place (index 0,1), i.e. adding the
> > > extra information at the end? That makes sense to me as the extra cell
> > > is obviously not directly related to the interrupt mapping.
> >
> > I think we currently just following the scheme with gpio cells order
> > scheme, which is (index(instance) offset flag..), the index and offset
> > are parameters to locate the irq which can easily derive from global
> > gpio pin number, so I thought it's more intuitive to group them
> > orderly together..
> 
> Right, the DT bindings are mainly for human consumption, and the
> cells are positioned in left-to-right intuitive order.
> 
> If they were only for machines it would be another issue, but it's
> people who have to write and maintain these files.
> 
> For example, in a library a machine could arrange books by
> first letter in the title, then by second letter in the title etc, but
> that would be very confusing for humans who expect to find
> them in author order.
> 
> There are many examples of this in the DT bindings.
> 
Ok, I got your idea.. thanks
I will rework the patch to address Thomas's concern

> Yours,
> Linus Walleij
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

