Return-Path: <linux-gpio+bounces-27350-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 22B3CBF5646
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 11:01:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C3BA2352564
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:01:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EAE8329C76;
	Tue, 21 Oct 2025 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b="Bh4w7XtV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from polaris.svanheule.net (polaris.svanheule.net [84.16.241.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 673601DB15F
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 09:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.241.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761037311; cv=none; b=NOsR/C+F+kRa6CWOdk5STPaGeIAVbtQuiPHuTRqgdgMM21AbvCKatY1dDMT4OMtukwueglcucW3eBS6cd214jFi1I+EzwJMYytQyGSGLQhJ8WNBtGVPkGcDJ1x6FTpgJA22IFRs1vKrB2i075cSAVwMIDDJ0SV1gXNZvB/XmbIs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761037311; c=relaxed/simple;
	bh=uuJjKKlSdmzwd3hm7w/2y5ZNkMQ1XCCgtGUFKE50J84=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=qmz56IcMbdlfYtKqd28U46grrkVL6QGysEqblF3q95uAaN/QODBiH833MR8UjLNrd8lp9ufCQwT66rUju6hmzGu0udz/hVUSrNXo/DeAVEOpRzXYJHkz5zowjV7PL7CXHixmIC2fFtwR4QSHbClpwfz+VnjeHdjOweDQyp4AAkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net; spf=pass smtp.mailfrom=svanheule.net; dkim=pass (2048-bit key) header.d=svanheule.net header.i=@svanheule.net header.b=Bh4w7XtV; arc=none smtp.client-ip=84.16.241.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=svanheule.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=svanheule.net
Received: from [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8] (2a02-1812-162c-8f00-1e2d-b404-3319-eba8.ip6.access.telenet.be [IPv6:2a02:1812:162c:8f00:1e2d:b404:3319:eba8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id D96DB689CC3;
	Tue, 21 Oct 2025 11:01:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1761037308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uuJjKKlSdmzwd3hm7w/2y5ZNkMQ1XCCgtGUFKE50J84=;
	b=Bh4w7XtV7fnpuBjZ2iGzRx2bF+lGIjK4AsU/KP0sVa1146/N7Hr2sAxWAz9maDRfj/HtZg
	Z4mxMGUBxQvr4Sjyiq2xfe8bUpiHOa04SlZVrWBMo8vtPanYiViZ4E6xhkBhfE+xSNNl7H
	4glcgeMnDeVS3nqRnxIrxszKvjzP4IgQNGg8/zYqHmo2xt5RKQ/kIPJgJEJwD8muVpri+x
	ppctJOdiDbG7XbM/AIFatBV0p4e06EB8mYfcLoVfY/+1QD1YBnES8I5yl/oY6UunofNbAt
	/Nho+jrR51J3Ek4t7dOq9a55Ed4SCXFKUAM9xtxgo3JvTPbxBDvwI60HQKLNmA==
Message-ID: <77ae9012af0565fe64e585043541081e48627566.camel@svanheule.net>
Subject: Re: [RFC PATCH 2/2] gpio: regmap: Bypass cache for aliased outputs
From: Sander Vanheule <sander@svanheule.net>
To: Linus Walleij <linus.walleij@linaro.org>, Michael Walle
 <mwalle@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 21 Oct 2025 11:01:47 +0200
In-Reply-To: <CACRpkdaqXzogkbcnR3uaDeGFcVtwmUq5DbETSqzjVQECJROF7g@mail.gmail.com>
References: <20251020115636.55417-1-sander@svanheule.net>
	 <20251020115636.55417-3-sander@svanheule.net>
	 <CACRpkdaqXzogkbcnR3uaDeGFcVtwmUq5DbETSqzjVQECJROF7g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Linus, Michael,

On Tue, 2025-10-21 at 09:18 +0200, Linus Walleij wrote:
> On Mon, Oct 20, 2025 at 1:56=E2=80=AFPM Sander Vanheule <sander@svanheule=
.net> wrote:
>=20
> > GPIO chips often have data input and output registers aliased to the
> > same offset. The output register is non-valitile and could in theory be
> > cached. The input register however is volatile by nature and hence
> > should not be cached, resulting in different requirements for reads and
> > writes.
> >=20
> > The generic gpiochip implementation stores a shadow value of the pin
> > output data, which is updated and written to hardware on output data
> > changes. Pin input values are always obtained by reading the aliased
> > data register from hardware.
> >=20
> > For gpio-regmap the output data could be in multiple registers, but we
> > can use the regmap cache support to shadow the output values by marking
> > the data registers as non-volatile. By using regmap_read_bypassed() we
> > can still treat the input values as volatile, irrespective of the regma=
p
> > config. This ensures proper functioning of writing the output register
> > with regmap_write_bits(), which will then use and update the cache only
> > on data writes, gaining some performance from the cached output values.
> >=20
> > Signed-off-by: Sander Vanheule <sander@svanheule.net>
>=20
> That looks good to me for sure!
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks for the reviews, I'll prepare the full respin for the RTL8231 patche=
s and
send them later today or tomorrow.

Best,
Sander

