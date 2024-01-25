Return-Path: <linux-gpio+bounces-2561-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFEDA83BD75
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 10:36:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F2C521C20844
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jan 2024 09:36:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A2A01BDFA;
	Thu, 25 Jan 2024 09:34:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3671BC5A
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jan 2024 09:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706175250; cv=none; b=TaQh/hnupr5GTZFXeozNKupqv923OHk9ilqCgCYnMnTwsdKMNhhDhduEGJWtsK1YvEe/wy5NznZpUHR1ycESpmyVTFHEld1d7gPqEkacmwv1A6F53jo9F3ii8x7eWMHTZLl+pY1qi+UNUcv9ItuCPx1Wjdt6AITC6fxIl2lf12Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706175250; c=relaxed/simple;
	bh=+HM7ZIgfkzs+RxyDpfsP/OxJC75F+qDscpolVrnkeY4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eoIEIze3sXZQh4ZmvYm2lw56Q7wapD5/SL/UeewjXmxAfgNpIjScDZndTpUPRqZbWs62bMgGcjzAUZWqVV3yRmJG1cot5AgtkdTOiRU15gqmvZM2zFIBChGiKn5tpnFICccXBZ216PlMj+fHjg3HEUuXOH61traLoUP4GUZBT3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSw7X-0001la-Qq; Thu, 25 Jan 2024 10:34:03 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSw7W-002Fia-PR; Thu, 25 Jan 2024 10:34:02 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rSw7W-0003Ri-2M;
	Thu, 25 Jan 2024 10:34:02 +0100
Message-ID: <2baf1f8c0b3d116da55d75621929ad186b33afd7.camel@pengutronix.de>
Subject: Re: [PATCH 3/3] gpiolib: add gpio_device_get_label() stub for
 !GPIOLIB
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
	 <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Peter Rosin <peda@axentia.se>,
  linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,  kernel test robot <lkp@intel.com>
Date: Thu, 25 Jan 2024 10:34:02 +0100
In-Reply-To: <CAMRc=MdXRm5UGu3abXXwtGhw5TG7NC0O5w6_X_RoZRH_C6YgdA@mail.gmail.com>
References: <20240125081601.118051-1-krzysztof.kozlowski@linaro.org>
	 <20240125081601.118051-3-krzysztof.kozlowski@linaro.org>
	 <CAMRc=MfYg5MgndDZtrAaScmtjXm4-AX6y1np7V3p4ngBKZG-pw@mail.gmail.com>
	 <0039e8e3-bfb7-43af-ab04-53aeaa02f4b0@linaro.org>
	 <CAMRc=MdXRm5UGu3abXXwtGhw5TG7NC0O5w6_X_RoZRH_C6YgdA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

On Do, 2024-01-25 at 10:28 +0100, Bartosz Golaszewski wrote:
> On Thu, Jan 25, 2024 at 10:14=E2=80=AFAM Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
> >=20
> > On 25/01/2024 10:04, Bartosz Golaszewski wrote:
> > > On Thu, Jan 25, 2024 at 9:16=E2=80=AFAM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@linaro.org> wrote:
> > > >=20
> > > > Add empty stub of gpio_device_get_label() when GPIOLIB is not enabl=
ed.
> > > >=20
> > > > Cc: <stable@vger.kernel.org>
> > > > Fixes: d1f7728259ef ("gpiolib: provide gpio_device_get_label()")
> > > > Suggested-by: kernel test robot <lkp@intel.com>
> > > > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > > >=20
> > > > ---
> > > >=20
> > > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > >=20
> > > > Reset framework will need it:
> > > > https://lore.kernel.org/oe-kbuild-all/202401250958.YksQmnWj-lkp@int=
el.com/
> > >=20
> > > And I suppose you'll want an immutable branch for that?
> >=20
> > I guess that's the question to Philipp, but other way could be an Ack.
> >=20
>=20
> I prefer it to go through my tree in case of conflicts as I have a big
> refactor coming up. I'll give it a day or two on the list and set up a
> tag for Philipp.

Works for me, thank you.

regards
Philipp

