Return-Path: <linux-gpio+bounces-6834-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D0C8D3652
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 14:24:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB69B28769C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 12:24:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82364180A97;
	Wed, 29 May 2024 12:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="b5JKglK/";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ghMneyPw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5573B295;
	Wed, 29 May 2024 12:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716985443; cv=none; b=XeVkhYJHA/6O9mLh7iKrKbafMWhrnFp1YYmpu+oneQCthnBJDYCx0YRdpjLW3nsiEzjtfet59o4Taq70g/38+Dlu5A0lK0/ft6yQWPHHlCpW2Iw8vcpDoqixI/tSHSPhNX+5ftp7u/ILuPGuQfkEaD/jOeneNHKku4t6vJJ7bvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716985443; c=relaxed/simple;
	bh=czqyFmNXe0Nn20OjypurysmGhajb2thuPoegbMjzh94=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SBdiT4emWb8nVhi/w/7APLPWZccTtPb2zYjVjzwaERMJl/Hft+yYYG4xLeOPBEOEJpbwFB5QwlMC43vW/e15X8hGY2EOS9e4NM5UeTD5/DOr+eOGJApmQVz+Rq05PMaIvzQ2ZaIh799dZQVjeSQ+4REJybp2N1uMKOksMBs/bVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=b5JKglK/; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ghMneyPw reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716985439; x=1748521439;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=AK+PLBQH4NTyua07V0s1IK8ojq+PtKADHdWPDdKYg+Y=;
  b=b5JKglK/Trj/Pjnyy+fkEZEG/DJhaAAxtWRGwXv//kGyIAZYlyG1FBo6
   egbsH65UR6dQW1ORQGJfErpqZeN/+idUspLnvpNsyUJUZqJ3HoAhAjmUX
   YSr1HEDVZFQyVdNNSEeltpVxgOUu61Yot8Jy00Gf7YzCNBpxTbFrpgpa0
   o7STDlDYPnzzwgxnBK+aucvhPZXAyNT2N4rvfvvlr67htdGlvKHmN3x7/
   S/VGFenvVgDFwg0pdyNsv4uzvqffmQ8OWPXF6GynUFQ1o6jYX4GMad+8A
   em0bN80jqbNDYZmuVpY556V23zDYDmDEMlKarI4Vz+9aa8D2yW05pA8WX
   Q==;
X-CSE-ConnectionGUID: 5GiaChy4TeWh5QBs27tLrg==
X-CSE-MsgGUID: RM/Cgre6RbOysbdaumDqdg==
X-IronPort-AV: E=Sophos;i="6.08,198,1712613600"; 
   d="scan'208";a="37128533"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 14:23:51 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B6144162D90;
	Wed, 29 May 2024 14:23:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716985427;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=AK+PLBQH4NTyua07V0s1IK8ojq+PtKADHdWPDdKYg+Y=;
	b=ghMneyPwWcafWRZ1/GVALatLebLFE/lhVspBfudEUDf9yNqVYPqKn12GldnDH49jUAUl51
	OMHNqNtLSG1c2paBaJnZQjuey/duNG8sRv5MRGv4jZ9gPaXApDnFozAgKf9MvC4rdTZA0z
	uXiAoOT3WAU7g0JKlkHiabfGhmH4iJJtVNtMMHP0slpiFkNlUPfdX4LzqZO9xwN3VmmMet
	AD3angvuR9HiwOOv2HFqsYYVdded5jt6MB9eC3bWOQNxNMblG738C9bsmEDSMi3Dy7kfvb
	e7DUH65NCVzfpFhwVLRt+RnA7ttC+HMu82xxAQk1FoYMow2l5vCS65U4h8KKaQ==
Message-ID: <ec96f8c72d4de7f7e6507f3bed38469cd609b8bb.camel@ew.tq-group.com>
Subject: Re: [PATCH 3/8] gpio: tqmx86: change tqmx86_gpio_write() order of
 arguments to match regmap API
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Andrew Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Gregor Herburger
 <gregor.herburger@tq-group.com>,  linux@ew.tq-group.com
Date: Wed, 29 May 2024 14:23:46 +0200
In-Reply-To: <a83d2274-3b45-4206-891d-b1e5bbfd6e23@lunn.ch>
References: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <56cb8a4f19ac0596318d740ed14091d6904d3f7f.1716967982.git.matthias.schiffer@ew.tq-group.com>
	 <CAMRc=Me_JMjp55VYLFH_gX6+fdCR+3zpsWtds1W+hCmf+k70KQ@mail.gmail.com>
	 <a83d2274-3b45-4206-891d-b1e5bbfd6e23@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

On Wed, 2024-05-29 at 14:11 +0200, Andrew Lunn wrote:
>=20
> On Wed, May 29, 2024 at 02:03:35PM +0200, Bartosz Golaszewski wrote:
> > On Wed, May 29, 2024 at 9:46=E2=80=AFAM Matthias Schiffer
> > <matthias.schiffer@ew.tq-group.com> wrote:
> > >=20
> > > Conversion to actually use regmap does not seem useful for this drive=
r,
> > > as regmap can't properly represent separate read-only and write-only
> > > registers at the same address, but we can at least match the API to m=
ake
> > > the code clearer.
> > >=20
> > > No functional change intended.
> > >=20
> > > Fixes: b868db94a6a7 ("gpio: tqmx86: Add GPIO from for this IO control=
ler")
> >=20
> > This is not a fix.
>=20
> Agreed.
>=20
> I'm somewhat conflicted by this patch. It is a step towards using
> regmap, but then says regmap does not make sense. So why make that
> step?
>=20
> Changing the order of parameters like this seems like it is will make
> back porting bug fixes harder, unless all supported versions are
> changed, which is why fixes make sense. Does the compiler at least
> issue a warning if the parameters are used the wrong way around?
>=20
> Overall, i'm leaning towards just dropping it.
>=20
> 	 Andrew



Okay, will drop this patch.

Matthias

