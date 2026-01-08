Return-Path: <linux-gpio+bounces-30260-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 433D8D03943
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 15:56:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 967FA3021942
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 14:52:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A941A3A0B09;
	Thu,  8 Jan 2026 09:56:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029DA451DF9
	for <linux-gpio@vger.kernel.org>; Thu,  8 Jan 2026 09:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767866204; cv=none; b=PvouIOmdGuoIztG/OAHhQvjzyDDmpyWYn34xVdT3ykPqQ909h6UCFOA2ladfKYma/vtP/5E0OWyvxEETctEcN63/rKA/A7hgkKWVIZeJLJA9TH8uDW5XIWvzsPE+rtVfHsL4faFONNNsrtP5c8gzJ+yVrZ9wwGJB3imlIGmC/A4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767866204; c=relaxed/simple;
	bh=xD5y6I5ED+awsboXcZBD4Y4YB9ZOIqfXv+SpP7f45ag=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EyPaGcOa3ILPUjB1hsMZynnmakNimOz73oiUob7JShcWeqwdX8tCBHJaUpIeWNCydtnAZvhwqk9a0fbuVbUMqXEG5/7X3DfUn12D4ACE7VlGBp+wAVGcT3xgBOghNBpcv23Bh+1/HRHIOXfE6RQ8m45zXxMUaU1oqyfK76mRqCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdmkN-0004h1-Ca; Thu, 08 Jan 2026 10:56:03 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdmkM-009eit-2n;
	Thu, 08 Jan 2026 10:56:02 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdmkM-0000000044p-3Gjs;
	Thu, 08 Jan 2026 10:56:02 +0100
Message-ID: <5efcdfff3b259294954fdd14d12e16f20944d4ab.camel@pengutronix.de>
Subject: Re: [PATCH v2 04/13] reset: eyeq: Add Mobileye EyeQ6Lplus OLB
From: Philipp Zabel <p.zabel@pengutronix.de>
To: =?ISO-8859-1?Q?Beno=EEt?= Monin <benoit.monin@bootlin.com>, Vladimir
 Kondratiev <vladimir.kondratiev@mobileye.com>, Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?ISO-8859-1?Q?Th=E9o?= Lebrun	
 <theo.lebrun@bootlin.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
  Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,  Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Linus Walleij
 <linusw@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk
	 <tawfik.bayouk@mobileye.com>, linux-mips@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Date: Thu, 08 Jan 2026 10:56:02 +0100
In-Reply-To: <20251223-eyeq6lplus-v2-4-cd1fd21d182c@bootlin.com>
References: <20251223-eyeq6lplus-v2-0-cd1fd21d182c@bootlin.com>
	 <20251223-eyeq6lplus-v2-4-cd1fd21d182c@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Di, 2025-12-23 at 11:02 +0100, Beno=C3=AEt Monin wrote:
> Declare the two reset domains found in the EyeQ6Lplus OLB and add
> them to the data matched by 'mobileye,eyeq6lplus-olb' compatible.
>=20
> Those reset domains are identical to those present in the EyeQ5
> OLB, so no changes are needed to support them.
>=20
> Signed-off-by: Beno=C3=AEt Monin <benoit.monin@bootlin.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp

