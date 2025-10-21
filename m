Return-Path: <linux-gpio+bounces-27355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3E9BF576A
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 11:18:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5997A481A0B
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 09:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4123332AAA5;
	Tue, 21 Oct 2025 09:18:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEEA8328B67
	for <linux-gpio@vger.kernel.org>; Tue, 21 Oct 2025 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761038289; cv=none; b=b7GfFXw8RtYn50Pr6+0E9UwMhspVe1sT8xuMry7gPfmjEgkHjEPmHIhTjkaknh9VmAGHgUBnBKvVjQZpaMg33HbFFBIs3soz/lY97/UBRr2m+IsNNrcGi4IthxvMYwZkcf4AFVJGh5nuZ+7AsgBEfdTRlR51dh0N4bCo/UOi0KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761038289; c=relaxed/simple;
	bh=sxN9Glz3sFE/HdyyuHbJiz7TF/YHuXhweLSBVq0Y/QQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Us2UgiVcrRzbrBXbXBkeVOVeteP0RkH2TloCFHQG5sq4Vi1oZKzXAmG21yqb0l6hGOtxP/y+Pzoto7T5GTwg738QQ03fPb1SB9mxlYYL/4RCcwozsWioRXXaGsyK9+5Jdd++2y9ADW5c2r/BwMiyZFEJVoKrbdpVMPSSjh8sNVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vB8Uw-0001iN-Dv; Tue, 21 Oct 2025 11:17:42 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vB8Uv-004hJ9-1C;
	Tue, 21 Oct 2025 11:17:41 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vB8Uv-0000000041g-1CkS;
	Tue, 21 Oct 2025 11:17:41 +0200
Message-ID: <075a4511a6ae4b047599757d41b559c6b7cf9d0f.camel@pengutronix.de>
Subject: Re: [PATCH 7/9] reset: make the provider of reset-gpios the parent
 of the reset device
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko	
 <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, Sakari Ailus
 <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich	 <dakr@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Bartosz Golaszewski
 <bartosz.golaszewski@linaro.org>
Date: Tue, 21 Oct 2025 11:17:41 +0200
In-Reply-To: <CAMRc=Md_-mO=HqfncD-vJS6XzPJ+aTcBjSjtkxLH_h1=pNjCcg@mail.gmail.com>
References: <20251006-reset-gpios-swnodes-v1-0-6d3325b9af42@linaro.org>
	 <20251006-reset-gpios-swnodes-v1-7-6d3325b9af42@linaro.org>
	 <95bbec130437846d4b902ce4161ccf0f33c26c59.camel@pengutronix.de>
	 <CAMRc=Md_-mO=HqfncD-vJS6XzPJ+aTcBjSjtkxLH_h1=pNjCcg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
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

On Mo, 2025-10-20 at 17:25 +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 6, 2025 at 5:19=E2=80=AFPM Philipp Zabel <p.zabel@pengutronix=
.de> wrote:
> > [...] could you take this
> > opportunity to prepend a patch that splits the part under guard() into
> > a separate function?
>=20
> If I'm being honest, I'd just make everything else use __free() as
> well. Except for IDA, it's possible.
>=20
> That being said: I have another thing in the works, namely converting
> the OF code to fwnode in reset core. I may address this there as I'll
> be moving stuff around. Does this make sense?

Yes. There was already a previous attempt at fwnode support [1], but we
abandoned that when there was no use case anymore.

[1] https://lore.kernel.org/r/20220323095022.453708-3-clement.leger@bootlin=
.com

>=20
regards
Philipp

