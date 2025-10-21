Return-Path: <linux-gpio+bounces-27376-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CD5BF6937
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0F514501F69
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 12:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D84B633373B;
	Tue, 21 Oct 2025 12:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="wtRgBwlb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC9C332ED9
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 12:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761051394; cv=none; b=pWqmXmSKMGUVAYbO3CCRfsIp/3tJ4Wp15kGOU0Rp/1x9XaIksTG7uftWI8b+vcf2i1hYBYmZxAsmV51OVZvYoKybHXqgx66IpNrjzDkymZm4JN8eEoh68zCM9kzwNMU7D9lAeL9PAwDp8nt2mPKrQPv67CsOAS5x1mmbn490Obc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761051394; c=relaxed/simple;
	bh=mj2SmBteO4PJAhBljE6I96UaNcSs4jK+7gDpfpoDnvg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OKmXOmRRRxdBG7l128/Xj3aLzlKORf+bt4sR5cpwGM3RQ0Cx2bbIygapnE2ki9o6I7/nZ+1SKpZj3Voz3yEZ0GnHuHw/m7mu/7o6ysU9vhNP28QVa06UOnBxF3Ga5yea35ybCYyQxwm0N+bcapjoc64HgIp2GdkvqcEm8/ZB3wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=wtRgBwlb; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id 2781768A068;
	Tue, 21 Oct 2025 14:56:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761051385;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mj2SmBteO4PJAhBljE6I96UaNcSs4jK+7gDpfpoDnvg=;
	b=wtRgBwlbNc4Mc/5/sFvgS7JRmg8ZMLPU/0KM5jAf1tWg44XVHU2ZTvMvS5EHo5XREhlPuB
	nX9opLS3hJYOjioz26CJzzrwyz8F9rdewAvF8I/PLeYXODrBSKzCDxj18cYiE6TwZo5nUz
	xYy9b92hiTfNp15SnrN9OfDKboYUHFmibrI7Bd+lD6uISOJTfm7HBqQuWZ4oOXAaNpicpO
	G4eYok4uVG+ywSbhV8/a15aBZULPbFIb6zV9m/Yu+I1vNGJ0gJ/+US6QH8jWIOR7lKd+/G
	WttlVXZUX+2NUo88AA0rdWxrGfq8I3swbS1zNDED2I9cqQ9XMoAo/gWEIzM3NA==
Message-ID: <d245b2550005c54c36051457df47e465e5624e2a.camel@svanheule.net>
Subject: Re: [RFC PATCH 2/2] gpio: regmap: Bypass cache for aliased outputs
From: Sander Vanheule <sander@svanheule.net>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Michael Walle
 <mwalle@kernel.org>, 	linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 21 Oct 2025 14:56:24 +0200
In-Reply-To: <CAMRc=MdzjKfhc5vwQVVg=VwCNJ8iMaH5RY3ky1uh_Kxo9gdv=A@mail.gmail.com>
References: <20251020115636.55417-1-sander@svanheule.net>
	 <20251020115636.55417-3-sander@svanheule.net>
	 <CACRpkdaqXzogkbcnR3uaDeGFcVtwmUq5DbETSqzjVQECJROF7g@mail.gmail.com>
	 <77ae9012af0565fe64e585043541081e48627566.camel@svanheule.net>
	 <CAMRc=MdzjKfhc5vwQVVg=VwCNJ8iMaH5RY3ky1uh_Kxo9gdv=A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi,

On Tue, 2025-10-21 at 14:21 +0200, Bartosz Golaszewski wrote:
> On Tue, Oct 21, 2025 at 11:01=E2=80=AFAM Sander Vanheule <sander@svanheul=
e.net> wrote:
> >=20
> > Thanks for the reviews, I'll prepare the full respin for the RTL8231 pa=
tches
> > and
> > send them later today or tomorrow.
>=20
> I take it, you'll include these patches in that series?

Yes, I will.

Since this was just an RFC, I don't know if everybody pays as much attentio=
n. I
will include Linus' and Michael's tags when I send the series.

Best,
Sander

