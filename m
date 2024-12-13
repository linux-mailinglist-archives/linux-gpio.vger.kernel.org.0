Return-Path: <linux-gpio+bounces-13868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B64409F136D
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 18:15:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 786BF188D5A7
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 17:15:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80CCC1E5018;
	Fri, 13 Dec 2024 17:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V+L6qAou"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335CD364D6;
	Fri, 13 Dec 2024 17:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734110139; cv=none; b=fosVDgh06nYnu7pn2dg+eg+EpOFDwKT0Sohx5OzaNptj8jestbgV9mPe6mZu4ixEzk3fCwO+xpn8Rv6QWS+wh3AafI2tGuMSfe4PTQ6ylg5flWyLPk7aAo5JTqlZrBz623J2xwF+bvHXw2m2JA4i9DvTPCKfUwhCRNXkT0RSsMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734110139; c=relaxed/simple;
	bh=NjO68/4nw+UEWFu3KmtWhUhnC0oLYN4ipiYpYuD9K5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MzCZMtyi6AvGlSyqut9wocqsCVTtz0ZbfpyNHd8bXc67hLjCJ4VtCqKpQwh6WZiz1W8z18teva2RviKXRei7u7MpSGFzG4k/HoTXa1eyAQrUAbSuSCKZyMZGUo5hmPK7fr4RTJDCA7IAksUR6W0/T1+NkmE+Djmrd7gyKXqBbvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V+L6qAou; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30639C4CED6;
	Fri, 13 Dec 2024 17:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734110138;
	bh=NjO68/4nw+UEWFu3KmtWhUhnC0oLYN4ipiYpYuD9K5g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V+L6qAouX7ebPUEU7rg451bIO2bAuBVcQx+aw+c9s3wAomHfVNqJpvAkSU3nnTTTu
	 udPTG6A9zgi8i4YMXByqvhxvSEpEC6wHBxbUepbk9k1utvsPbqvzQ10ggmC2bEyfXp
	 HFEZVsPlMFMgv6aLEN7mZPDpcBjMaPmzf3LiBgydLHI4yeHEz6lSc6fYGr5sF3v1Kt
	 5hWIqt7I5QCF65b4Rf6mfqhPlkQNxfhfUcC5G4bDgHLWQfIE4+0vZ8ho7/djUyPxjM
	 U+tY6YYSbMkERryXPdJ/HMqVh3WX9pA5gtKDJsdsHz18FioFl0zTIeDGYoAlK1Pbww
	 0A/UuQtaqXHUw==
Date: Fri, 13 Dec 2024 17:15:29 +0000
From: Lee Jones <lee@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	NXP S32 Linux Team <s32@nxp.com>,
	Christophe Lizzi <clizzi@redhat.com>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Enric Balletbo <eballetb@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev
Subject: Re: [PATCH v6 2/7] mfd: nxp-siul2: add support for NXP SIUL2
Message-ID: <20241213171529.GF2418536@google.com>
References: <20241113101124.1279648-1-andrei.stefanescu@oss.nxp.com>
 <20241113101124.1279648-3-andrei.stefanescu@oss.nxp.com>
 <20241211124454.GE7139@google.com>
 <3b090335-20b4-4d73-aabc-ddac98311e33@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b090335-20b4-4d73-aabc-ddac98311e33@sirena.org.uk>

On Wed, 11 Dec 2024, Mark Brown wrote:

> On Wed, Dec 11, 2024 at 12:45:56PM +0000, Lee Jones wrote:
> 
> > Seeing as the vast majority of this 400 line driver pertains to Regmap
> > handling (!), would you be kind enough to cast your expert eye over it
> > please?
> 
> Is there something specific you're concerned about there?  It looks like
> it's just data which should be fine.

Just the mass of complex hoop-jumping to get all of these Regmaps
registered.  But if nothing stands out to you, then it's probably okay.

Still, I can't review / take this until it's a proper MFD.

-- 
Lee Jones [李琼斯]

