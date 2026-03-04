Return-Path: <linux-gpio+bounces-32465-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIOqJgkKqGn2nQAAu9opvQ
	(envelope-from <linux-gpio+bounces-32465-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:31:37 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E9B1FE5FD
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Mar 2026 11:31:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2FF343050A01
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Mar 2026 10:26:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F05473A2558;
	Wed,  4 Mar 2026 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b="rxQg0s9M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp28.bhosted.nl (smtp28.bhosted.nl [94.124.121.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180EC3A1D1C
	for <linux-gpio@vger.kernel.org>; Wed,  4 Mar 2026 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=94.124.121.40
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772619975; cv=none; b=KONEbAD6PjjN0v/fK1LW8Q6ZD2q8rL0AyJprze2eT5AUp/QLRq7nNR0HI3SU2sfdUdV6nH1L9pVQUJgKSky+OWbVmRS73jfCCSlmm5AGILS6PUMRrWN416tTLyyAItbj9jQP3GTRUkPiCVtziS1Cs7NnmkpqnULNZG1VLZhxePs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772619975; c=relaxed/simple;
	bh=iaoKu1YAbCoudL14l3Rwg8N48l6zL3jjv2BcSRhzbo0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E1P+mNejl1TT5VPjgmBKdpzg+a1t8ZFTcg0nJut7T9oW5iM6o7SpJ/zhcEMh+lY7tO5bR1eLyea7SdMo1q1PIYMBI5hqI+muz9YJJJrrkp0jvVogH1E4FSM5tfwmyQH3mFEZA8r09/oiplmEEPWvNXU1mhQin0sDAWq8EngKImk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl; spf=pass smtp.mailfrom=protonic.nl; dkim=pass (2048-bit key) header.d=protonic.nl header.i=@protonic.nl header.b=rxQg0s9M; arc=none smtp.client-ip=94.124.121.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=protonic.nl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonic.nl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=protonic.nl; s=202111;
	h=content-transfer-encoding:content-type:mime-version:references:in-reply-to:
	 message-id:subject:cc:to:from:date:from;
	bh=w6F9EZJVS8+TF1xyzyXSI4fM3c5Dtg3XikqZDLJUQME=;
	b=rxQg0s9M7zsl29LETTXvuEN2hLbg7fHyi7KWCFsfIibM4SdvaeotGKAcJvJLdtpWmY02EHyKO2IcJ
	 jSjkE/blulrRpemUlqg5mDYXA9IyYZwbhn8XfkX0eqxE2mo0H92PtLIIQvFGHJ3SAYGt/hoTTWimWY
	 NnPfzJJsCBabFtdedNTtaRYO9ex26bEw+7qjDyTv+wPMIs/WK+8nQ9HS7OakRBBA7sRV8/gA9rhlNQ
	 gyC4OetacoqxSyAO22YZV9oFybgny7sx0zfBQPjRKJaJoTmdY4LDrNjqXQ/817UrDycxwn64xcZgWf
	 lFZWNcM1OLp6MFVXxNEoLk6bDXKu/og==
X-MSG-ID: 66bae932-17b4-11f1-b532-0050568164d1
Date: Wed, 4 Mar 2026 11:25:00 +0100
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
Message-ID: <20260304112500.4766f21b@erd003.prtnl>
In-Reply-To: <4d4c6ebc-698b-44c2-9a91-607381d6ece1@kernel.org>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
	<20260303133947.1123575-2-o.rempel@pengutronix.de>
	<177254885509.3251575.14819823286886805862.robh@kernel.org>
	<aacH7NmkOzZued0Y@pengutronix.de>
	<20260304-graceful-sweet-bittern-98efdb@quoll>
	<20260304100642.44d00b99@erd003.prtnl>
	<4d4c6ebc-698b-44c2-9a91-607381d6ece1@kernel.org>
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
X-Rspamd-Queue-Id: 44E9B1FE5FD
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
	TAGGED_FROM(0.00)[bounces-32465-lists,linux-gpio=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.0:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,devicetree.org:url,erd003.prtnl:mid,nxp.com:url,protonic.nl:dkim]
X-Rspamd-Action: no action

On Wed, 4 Mar 2026 10:49:06 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On 04/03/2026 10:06, David Jander wrote:
> > 
> > Hi Krzysztof,
> > 
> > On Wed, 4 Mar 2026 09:05:11 +0100
> > Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >   
> >> On Tue, Mar 03, 2026 at 05:10:20PM +0100, Oleksij Rempel wrote:  
> >>> Hi Krzysztof and Rob,
> >>>
> >>> On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:    
> >>>>>  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++++
> >>>>>  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
> >>>>>  2 files changed, 196 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
> >>>>>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> >>>>>     
> >>>>
> >>>> My bot found errors running 'make dt_binding_check' on your patch:
> >>>>
> >>>> yamllint warnings/errors:
> >>>>
> >>>> dtschema/dtc warnings/errors:
> >>>> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> >>>> 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
> >>>>     
> >>>
> >>> Folding the mux node into the parent as suggested [1] causes this error.
> >>> Because the parent now has #mux-control-cells, the generic
> >>> mux-controller.yaml forces the node name to be mux-controller. Since
> >>> this chip is primarily a switch/GPIO controller, naming the parent SPI
> >>> node mux-controller@0 is misleading.
> >>>
> >>> What is the preferred way to go here?    
> >>
> >> https://www.nxp.com/products/interfaces/multi-switch-detection-interface/22-i-o-msdi-programmable-current-analog-mux:MC33978
> >>
> >> Name of the mc33978 device is "programmable analog mux" and further
> >> description says "analog multiplexer for reading analog inputs ", so I
> >> don't find "mux-controller" a confusing name. It is EXACTLY a
> >> mux, so mux-controller.  
> > 
> > Sorry to chime in here. I'm afraid the NXP description on that link you posted
> > is a typo. It is not correct. This chip is primarily a "Switch Detection
> > Interface", or in other wordt a switch input interface. Wee here for the same
> > page for the MC34978, which is the exact same chip:
> > 
> > https://www.nxp.com/products/interfaces/multi-switch-detection-interface/switch-detection-interface-22-i-os-programmable-wetting-current-temp-sensor-3-3-v-5-0-v-spi:MC34978  
> 
> That's MC34978 and I commented on MC33978.
> 
> What is the primary function of MC33978 being described here as the base?

The MC34978 and MC33978 are the exact same part (except for the temperature
range). The fact that NXP has two different web-pages with two different
descriptions of it certainly doesn't help, but you can also check the
datasheet[1] description: "MC33978: 22-channel multiple switch detection
interface with programmable wetting current"

Further down in the description it says: "It also features a 24-to-1 analog
multiplexer for reading inputs as analog."
IMHO this makes it clear that this is NOT primarily a MUX.

Actually, I doubt many users of this chip will use the analog MUX function at
all since it has quite a few limitations that make it not very practical to
use.

The most fitting Linux framework for this chip's primary funtcion IMHO is
pinctrl/gpio, but there are some caveats unfortunately.

[1] https://www.nxp.com/docs/en/data-sheet/MC33978.pdf

Best regards,

> > It has an additional function that can be used as an analog MUX, but it is an
> > extra feature and definitely NOT its primary function.
> > 
> > Not sure if this is relevant, but I fear there might be some confusion.
> > 
> > Best regards,
> >   
> >> Anyway if you want gpio, then please add a patch extending the pattern
> >> in mux-controller.yaml to allow "gpio".
> >>
> >> Alternative, because it is rather a mux than a controller of a mux,
> >> would be to call it just "mux" or "io-mux" (maybe the latter, since we
> >> have "i2c-mux" in the spec) and allow that pattern to be in
> >> mux-controller.


-- 
David Jander

