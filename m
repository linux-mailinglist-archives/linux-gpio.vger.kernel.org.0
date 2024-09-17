Return-Path: <linux-gpio+bounces-10207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5971C97AC73
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 09:53:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D5859B23BEB
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 07:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E3C155382;
	Tue, 17 Sep 2024 07:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="t80vha9J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F375847B;
	Tue, 17 Sep 2024 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726559599; cv=none; b=kIZXH/yjED/aVZutcmzyYDCUHEEIAmXd8xEl8LwMxCIKwyuBTeO39mt5q0UHXUfA7Jqm9nZR0i28jxE0J2gZ4x8lR3+qHzgIUDjN+0VDhSefHsoMK1NffFGuop4vJflfDX6ifdBCeYAilgzPSvNr8fVfKOMz3Ypu7Pivo4JNYfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726559599; c=relaxed/simple;
	bh=BW1bBTE+Kgi3GbEF9WPYjCD8Z3weDrmWy5PaSnftEfs=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qvGVMwMvkBmvUie5b93O57BMd4r4Lv8xdzWLoabQvqqv0Eu97OeZdipFiozAbOeGrC5OOEhs6KbOUgFDX3w7TgwrI1ezRcDypeaxu+XWdpFLRARPCGB3RxyjBJnbfrXFAEMZWquuw56+ijadPcwkmyZlfFypZ1aAcGDPqo4Plac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=t80vha9J; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726559597; x=1758095597;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=BW1bBTE+Kgi3GbEF9WPYjCD8Z3weDrmWy5PaSnftEfs=;
  b=t80vha9JteMQytKuOQaFOhvfumgNJG1sjk1sMtjSCpAb7JR4jN0A7SUf
   bUyQPNUxgcMYREx8s7P979taRJ0+DGIMgmeDWlrc7E1De5OsUAGynTKtN
   f3m+CcLRgKwklguupgL8pXJimurGURtvAQ0+tSYIPx+J5awv6NI3xV96f
   3la+CBajcHoM8TrTBXlS9riWElSSl8aBTpWGKYkpGizSGg9t2A/3m/yZb
   IjvznmvCbMspDQXwxVmykwdMn0gx5Qn1Te5ZQ3m4UwrIe5HN/kxzljv50
   aDDt18EI+Hb4K5a9Wm1zaSESjH3okMI5gt2EomJhspK5blO45a2LCFN4Z
   w==;
X-CSE-ConnectionGUID: oGLJsDF/Qd+MdI2DdWlOIg==
X-CSE-MsgGUID: D6yVr8HIQDSo9/Ku4oj0Mg==
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="31763481"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2024 00:53:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 17 Sep 2024 00:53:02 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 17 Sep 2024 00:53:00 -0700
Date: Tue, 17 Sep 2024 07:52:59 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: ocelot: document lan969x-pinctrl
Message-ID: <20240917075259.deuwi5s5gdqo3w6z@DEN-DL-M70577>
References: <20240914-lan969x-pinctrl-v1-0-1b3a4d454b0d@microchip.com>
 <20240914-lan969x-pinctrl-v1-1-1b3a4d454b0d@microchip.com>
 <20240916-uncut-badge-f31b97d7c375@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240916-uncut-badge-f31b97d7c375@spud>

> >    reg:
> >      items:
> > @@ -85,6 +95,12 @@ allOf:
> >            contains:
> >              enum:
> >                - microchip,lan966x-pinctrl
> > +              - microchip,lan9698-pinctrl
> > +              - microchip,lan9696-pinctrl
> > +              - microchip,lan9694-pinctrl
> > +              - microchip,lan9693-pinctrl
> > +              - microchip,lan9692-pinctrl
> 
> > +              - microchip,lan9691-pinctrl
> 
> This should work on its own, since the other devices here have it as a
> fallback.

Just to be clear - we only need the "microchip,lan9691-pinctrl" here?

/Daniel


