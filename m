Return-Path: <linux-gpio+bounces-32460-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SKCmJdX3p2l2nAAAu9opvQ
	(envelope-from <linux-gpio+bounces-32460-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:13:57 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0240A1FD607
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 10:13:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7A769312E4CA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 09:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBAE03932F4;
	Wed,  4 Mar 2026 09:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="Xwx9n+xa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp16.bhosted.nl (smtp16.bhosted.nl [94.124.121.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5962A39447B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 09:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615275; cv=none; b=gcky/Bwr94fryXzYWMstmsqX0V1rO3/c+GrIdG7xK/G360Eo6QEHI/4bPuuttOX8k1T50G1dgF8Xb1rxyyYDSeOarfuePWin87wJ8ZXRT9e6929najxUTtgNSLCbYkZEY29RIrhJfCfd/nf+wsRIsQQvhjMVqUl/NgsYVMqWLkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615275; c=relaxed/simple;
	bh=HzGhRH94uYQhm+jiWYn+DKKu4qjvpXaVupl5oLLTzEA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pY2U/m1Hb0IhU6BDTYC9mwOWFnslVmjVYYWAOr91obTdyjTMy+bYbI/9ZZSsAohrlvDRwuPU7eoPuFeo45FcHXou+AmhKGL4NXo7YWMXsUoDGGUuHTc6h1uHCPEY2BpElzjYbskhg2ClrflpnMLIm9WM/UWhduBtp+4M4MWtihE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=Xwx9n+xa; arc=none smtp.client-ip=94.124.121.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=ANgf0NirWa/yPqZ74gRfT33LDkbxijfweyinRAYArLg=;
	b=Xwx9n+xaFIhq1CObs4uX0c/ShhFw6TqnK1+/PvKSZcM0go5tDwJUPghr/UHqI5Lpw22ejAKMy6TDR
	 E2zysWfgMZRPnEGAkM6GLHuOyoUNofUEAiu99erPrqsxMLmP5S5BD2kINOoQf+5dPhlO31yQMUyXRk
	 zlwJDYie0pVavdchPu+bZjUk8xY1waITkH4HCSxAki+aMxteC04nmLL7S3lyvysT42aMSre04j+GPE
	 UJawikvRkDA3Zu67ej7X5DXJiPNo6JNYW9t4CX7/oqpKjMEAGyrW9scckueCbV2EDQ6r8IJ+LqKlJP
	 mj1eTjouyzWZff0wnrUnfVgDbEaBfgw==
X-MSG-ID: 76524656-17a9-11f1-9155-005056817704
Date: Wed, 4 Mar 2026 10:06:42 +0100
From: David Jander <david@protonic.nl>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>, "Rob Herring (Arm)"
 <robh@kernel.org>, devicetree@vger.kernel.org, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Rosin
 <peda@axentia.se>, kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Lee Jones <lee@kernel.org>, Guenter Roeck
 <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>,
 linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <20260304100642.44d00b99@erd003.prtnl>
In-Reply-To: <20260304-graceful-sweet-bittern-98efdb@quoll>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
	<20260303133947.1123575-2-o.rempel@pengutronix.de>
	<177254885509.3251575.14819823286886805862.robh@kernel.org>
	<aacH7NmkOzZued0Y@pengutronix.de>
	<20260304-graceful-sweet-bittern-98efdb@quoll>
Organization: Protonic Holland
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 0240A1FD607
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[protonic.nl:s=202111];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[protonic.nl];
	HAS_ORG_HEADER(0.00)[];
	TAGGED_FROM(0.00)[bounces-32460-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@protonic.nl,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[protonic.nl:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[protonic.nl:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.0:email,nxp.com:url,erd003.prtnl:mid]
X-Rspamd-Action: no action


Hi Krzysztof,

On Wed, 4 Mar 2026 09:05:11 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Tue, Mar 03, 2026 at 05:10:20PM +0100, Oleksij Rempel wrote:
> > Hi Krzysztof and Rob,
> > 
> > On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:  
> > > >  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++++
> > > >  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
> > > >  2 files changed, 196 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> > > >   
> > > 
> > > My bot found errors running 'make dt_binding_check' on your patch:
> > > 
> > > yamllint warnings/errors:
> > > 
> > > dtschema/dtc warnings/errors:
> > > /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> > > 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
> > >   
> > 
> > Folding the mux node into the parent as suggested [1] causes this error.
> > Because the parent now has #mux-control-cells, the generic
> > mux-controller.yaml forces the node name to be mux-controller. Since
> > this chip is primarily a switch/GPIO controller, naming the parent SPI
> > node mux-controller@0 is misleading.
> > 
> > What is the preferred way to go here?  
> 
> https://www.nxp.com/products/interfaces/multi-switch-detection-interface/22-i-o-msdi-programmable-current-analog-mux:MC33978
> 
> Name of the mc33978 device is "programmable analog mux" and further
> description says "analog multiplexer for reading analog inputs ", so I
> don't find "mux-controller" a confusing name. It is EXACTLY a
> mux, so mux-controller.

Sorry to chime in here. I'm afraid the NXP description on that link you posted
is a typo. It is not correct. This chip is primarily a "Switch Detection
Interface", or in other wordt a switch input interface. Wee here for the same
page for the MC34978, which is the exact same chip:

https://www.nxp.com/products/interfaces/multi-switch-detection-interface/switch-detection-interface-22-i-os-programmable-wetting-current-temp-sensor-3-3-v-5-0-v-spi:MC34978

It has an additional function that can be used as an analog MUX, but it is an
extra feature and definitely NOT its primary function.

Not sure if this is relevant, but I fear there might be some confusion.

Best regards,

> Anyway if you want gpio, then please add a patch extending the pattern
> in mux-controller.yaml to allow "gpio".
> 
> Alternative, because it is rather a mux than a controller of a mux,
> would be to call it just "mux" or "io-mux" (maybe the latter, since we
> have "i2c-mux" in the spec) and allow that pattern to be in
> mux-controller.
> 
> 
> Best regards,
> Krzysztof

-- 
David Jander

