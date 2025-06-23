Return-Path: <linux-gpio+bounces-21977-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED67AE3681
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:12:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9AC0F1892ACC
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 07:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A34C1F1306;
	Mon, 23 Jun 2025 07:11:53 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F091F4C8C
	for <linux-gpio@vger.kernel.org>; Mon, 23 Jun 2025 07:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750662712; cv=none; b=Mzg9pryo6NyTmW9Um+Bh2XwVbdm86V8jaXU0ZixydDviP68h4xlaklKpr7ePDm7o+wKUcknbZ2NIC57ycMNaCijs46WnnGuc+0AUA6hvg8ejF72lM5+roPERGMOOnbEFHFF488fIIwcd2eQhPjfq5lHE8F+6nsXuqB3VWNsOdto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750662712; c=relaxed/simple;
	bh=8E9pKEeqU9K5+berDfkrRQez1dGqpjpeYbjpaAzRN7U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SiRDw+U7Je3RbN0pTXnxBOLz3g/NOqN0vYhHdp/R0MZ5L+PnHMSYUV4eQAI6Z8gzcZmc0mZizLhV4wUh2MCtEKx3za3JfP7j2W5PumS8CW8bFVsUQQl4MXk5EHHH9AxAGLqoCaKiH6A8gyWN2hXR1AMShZO2QONGHrusx8sVnk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uTbL3-0003AE-8Z; Mon, 23 Jun 2025 09:11:33 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uTbL2-004uJr-0o;
	Mon, 23 Jun 2025 09:11:32 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uTbL2-0005Oi-0T;
	Mon, 23 Jun 2025 09:11:32 +0200
Message-ID: <c1b2f651f73b4469a410f1f5027f974b4e07ddd2.camel@pengutronix.de>
Subject: Re: [PATCH v1 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Mohammad Rafi
 Shaik <mohammad.rafi.shaik@oss.qualcomm.com>, Srinivas Kandagatla
 <srini@kernel.org>,  Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela
 <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
 kernel@oss.qualcomm.com
Date: Mon, 23 Jun 2025 09:11:32 +0200
In-Reply-To: <f9f96bf0-3539-4e77-8d3e-b87ddc561925@oss.qualcomm.com>
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
	 <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
	 <f9f96bf0-3539-4e77-8d3e-b87ddc561925@oss.qualcomm.com>
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

On Fr, 2025-06-20 at 21:35 +0300, Dmitry Baryshkov wrote:
> On 20/06/2025 13:30, Mohammad Rafi Shaik wrote:
> > On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
> > multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
> > To handle such cases, use the reset controller framework along with the
> > "reset-gpio" driver.
>=20
> How does this handle the fact that resetting one codec will also=20
> silently reset another one?

It's the other way around. Since shared reset controls have a common
deassertion refcount, actual reset assertion only happens once
reset_control_assert() has been called on all shared reset controls
[1]. The speakers would only be put back into reset once the last one
is unbound.

[1] https://docs.kernel.org/driver-api/reset.html#shared-and-exclusive-rese=
ts

regards
Philipp

