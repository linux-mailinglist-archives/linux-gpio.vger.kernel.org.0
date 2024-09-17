Return-Path: <linux-gpio+bounces-10211-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5613397B03B
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 14:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB708B21EEF
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Sep 2024 12:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31A78170A3F;
	Tue, 17 Sep 2024 12:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="sORbWmSt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EADD43150;
	Tue, 17 Sep 2024 12:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726576840; cv=none; b=rmQ2iExTlulmV5Pnb9xj73tGhtI2H4E32a4fjfyQWmDCWLdbuqPrAstHy/F/tL/0rqjN6XJ+tWDCKE529Sn8lQa/W7hf6vRXVriJd9Zl/P6k+3lVzeEX2EjT2+hhM2JqgKEhx6BPE4C5jBVRnNYEgRWjpqPwU0RqOn+sFy0mmWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726576840; c=relaxed/simple;
	bh=MkZU8nSmVyItwTK7BYMpcreavSZTc6M/jSXt1iY+tlo=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XEhr8fe8yPHvJEkd43ybXKC3zopKhLnTdCRSftZ7UwLexM03Ty/6HnwWVgosLXPrQbLaTAHhzEn4MbEX81pjJeTY4+gvS23C9aguo7jXhmaYtlsBXLhBMM/zqXcbf/nNkmfCI4ZIwL0X9Z5y+ZHuXQtl2H6aZR6SOcpXLV8uO8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=sORbWmSt; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726576838; x=1758112838;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MkZU8nSmVyItwTK7BYMpcreavSZTc6M/jSXt1iY+tlo=;
  b=sORbWmSt7nHEFxixqDcwt+9+wlit+KHdHEsDteJZ5ZkH+MXitln8HCyX
   V3O1LprPJeSs/m9580TUafv07IZavjuGmVxCOCW0Usu/JTPXkeGluMGc8
   ppyZndz03JKRyCjRfq7ffgoBpVG1GxDuYoZ65ooTEy3VEI17XT1QT2/FV
   Xtw24VupXViV3mLQg/ny9j8swhY48cnK1mDcdrpmttmhkGqBj9t6KlVsl
   AQBZnKT0LNkbfPecdgQ/dbGhyWapeMhc9xn4JIryiUyljCYqfhblAAtJF
   g9XCT4E7RLKKRZtG/rHVIlxc2NGzwRJz7Uvii8kfV6Ypqp3et2JnGPqaa
   A==;
X-CSE-ConnectionGUID: eRdbKzpNR3Gd9Bv4JBdHiQ==
X-CSE-MsgGUID: 9iC/upM9TJqHhHAMOl1OkA==
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; 
   d="scan'208";a="262889110"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Sep 2024 05:40:36 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 17 Sep 2024 05:40:29 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 17 Sep 2024 05:40:27 -0700
Date: Tue, 17 Sep 2024 12:40:26 +0000
From: Daniel Machon <daniel.machon@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Lars Povlsen
	<lars.povlsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: ocelot: document lan969x-pinctrl
Message-ID: <20240917124026.qzefy743r54w5pwx@DEN-DL-M70577>
References: <20240914-lan969x-pinctrl-v1-0-1b3a4d454b0d@microchip.com>
 <20240914-lan969x-pinctrl-v1-1-1b3a4d454b0d@microchip.com>
 <20240916-uncut-badge-f31b97d7c375@spud>
 <20240917075259.deuwi5s5gdqo3w6z@DEN-DL-M70577>
 <20240917-squander-stunt-c6bec4409491@squawk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240917-squander-stunt-c6bec4409491@squawk>

> > > >    reg:
> > > >      items:
> > > > @@ -85,6 +95,12 @@ allOf:
> > > >            contains:
> > > >              enum:
> > > >                - microchip,lan966x-pinctrl
> > > > +              - microchip,lan9698-pinctrl
> > > > +              - microchip,lan9696-pinctrl
> > > > +              - microchip,lan9694-pinctrl
> > > > +              - microchip,lan9693-pinctrl
> > > > +              - microchip,lan9692-pinctrl
> > > 
> > > > +              - microchip,lan9691-pinctrl
> > > 
> > > This should work on its own, since the other devices here have it as a
> > > fallback.
> > 
> > Just to be clear - we only need the "microchip,lan9691-pinctrl" here?
> 
> Ye, in the enum you should only need that compatible (in addition to the
> exsting one) because lan9691 is the fallback for all the others and
> therefore the compatible must contain it.

OK, got it.

Thanks Conor.

/Daniel


