Return-Path: <linux-gpio+bounces-14663-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FA57A09438
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 15:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7AED13AC0A6
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jan 2025 14:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D42121420C;
	Fri, 10 Jan 2025 14:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b="mQTX3y8t"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A64C213E88
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 14:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.67.36.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736520362; cv=none; b=qC6weoFQZBuw6A1PMG2FucF569Dogr/pO/UDBaT/TROC1XJuuVZ8EPbvcUqRyof3XcXkhMaOnoFnAi0cUG0fvoQ6jQaad26Elg451QirQM+Plhz0jjNVujnbloyFmZDCnar0FIsDinurmqgi9tjkMb5oQHq7QY/ENhwpDmNQz+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736520362; c=relaxed/simple;
	bh=dYYaYFEM24+iiQPImiW+lLFpDQ1hFqc+9xNycR8IE3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LSQiW2bpO0fxtbejm262vL9ic/DUCXbAd4nrfa13J1S57cDrgWBFqeEnBdxTBnw7ZmX8Lmnq5ZJRFv2KEONHE3g+9omfnGktRvvPKyElI3UJxRPgw9A2dqafLXlPY1vdNFaJ1qxkMjLacozmhQ4ujV8DSMIfs5vN6EF5+yOnjbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net; spf=pass smtp.mailfrom=posteo.net; dkim=pass (2048-bit key) header.d=posteo.net header.i=@posteo.net header.b=mQTX3y8t; arc=none smtp.client-ip=185.67.36.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=posteo.net
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id CED47240029
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jan 2025 15:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736520352; bh=dYYaYFEM24+iiQPImiW+lLFpDQ1hFqc+9xNycR8IE3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=mQTX3y8tMVkoUzUoLoHNqk6Efo9PMc+vYEnVnhkKokT0BwTiK9uzovbdH4tps0r0c
	 WNYDYn6tkkBBp60NiXOpxTW8tCoTu3iHhx0cGxfHa9CqcJiaHp3yUJaXa+XZty6r0Y
	 jBh46z7ei2dg4UGJOIkBmcLwvekAcO/CX9eOqm4wrqJGDW8veA8mSo+t3++itJntsE
	 cP28ijJ8ZfvQYjVkTY1QbTVH1NypaPifrVjdlxuv7OePJbLYs3WMpSBvr2EFvvQRn+
	 yV/7+CROrI92h4qg9fk+xWYMRjZLnUgnQ4g6T3gis5vyOlIEYEctkUl4x9msX4V66g
	 JLiNfydXYIAbg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YV4G56d9Bz6tx7;
	Fri, 10 Jan 2025 15:45:49 +0100 (CET)
Date: Fri, 10 Jan 2025 14:45:49 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 14/19] powerpc: mpc83xx: Switch to of_platform_populate
Message-ID: <Z4EynSpNghUpjY8W@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net>
 <CAL_JsqKU0AQ+ym_iDZSN5hNUTMF0bgjqu-aAVtG792Mw_eZTbg@mail.gmail.com>
 <Z3lKqLXphxeI1Gvo@probook>
 <CAL_Jsq+HrXpqi-mDJF+vyg5zL5mTD5FsCTSq_39U8DffKW+XYQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAL_Jsq+HrXpqi-mDJF+vyg5zL5mTD5FsCTSq_39U8DffKW+XYQ@mail.gmail.com>

On Sun, Jan 05, 2025 at 02:28:37PM -0600, Rob Herring wrote:
> On Sat, Jan 4, 2025 at 8:50 AM J. Neuschäfer <j.ne@posteo.net> wrote:
> >
> > On Thu, Jan 02, 2025 at 12:51:47PM -0600, Rob Herring wrote:
> > > On Thu, Jan 2, 2025 at 12:32 PM J. Neuschäfer via B4 Relay
> > > <devnull+j.ne.posteo.net@kernel.org> wrote:
[...]
> > > >  static const struct of_device_id of_bus_ids[] __initconst = {
> > > >         { .type = "soc", },
> > >
> > > of_platform_populate() won't work on this match unless there's a
> > > compatible in the node, too. Can we use compatible instead or are
> > > there a bunch of them?
> >
> > In arch/powerpc/boot/dts, I can find the following cases of device_type
> > = "soc" without compatible = "simple-bus":
> >
[...]
> > - arch/powerpc/boot/dts/asp834x-redboot.dts  (MPC83xx!)
> > - arch/powerpc/boot/dts/ksi8560.dts          (MPC85xx)
> >
> > i.e. there is one affected devicetree. I can simply patch that one in
> > the next iteration.
> 
> You can, but that doesn't fix existing DTBs with your kernel change.
> 
> We either have to determine no one cares about that platform or the
> ABI or add a fixup to add the compatible property.

The last substantial change to asp834x-redboot.dts happened in 2009,
so I think it's fairly safe to suspect that any remaining users are
stuck with old software versions; new or recurring users will have to do
some debugging to get the board up and running anyway.


> > >
> > > > -       { .compatible = "soc", },
> > > >         { .compatible = "simple-bus" },
> > > >         { .compatible = "gianfar" },
> > > > -       { .compatible = "gpio-leds", },
> > > > -       { .type = "qe", },
> > > > -       { .compatible = "fsl,qe", },
> > >
> > > Better still would be if we could move the remaining ones to the
> > > default table and just call of_platform_default_populate().
> >
> > of_platform_default_populate does sound preferable.
> >
> > I'll investigate why exactly the "gianfar" match is necessary and how to
> > fix it in the corresponding driver (I don't think it's general enough to
> > warrant being listed in of_default_bus_match_table).
> 
> That may work too.

I have investigated this issue now and will include a patch in the next
version.


Best regards,
J. Neuschäfer

