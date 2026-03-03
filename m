Return-Path: <linux-gpio+bounces-32429-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uHJWFbkJp2kDcgAAu9opvQ
	(envelope-from <linux-gpio+bounces-32429-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 17:18:01 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EE91F37F8
	for <lists+linux-gpio@lfdr.de>; Tue, 03 Mar 2026 17:18:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7E26E317D95E
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Mar 2026 16:10:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E58974A2E1D;
	Tue,  3 Mar 2026 16:10:42 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE714A33E9
	for <linux-gpio@vger.kernel.org>; Tue,  3 Mar 2026 16:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554242; cv=none; b=qY0yjsW79/EPti8XaIpgERzcXKbzAkw5ylIseh8zJlyeXYIxQ4uPorpwSwLBC2WBmIPbAuKi743+0gv2+Dzlail8EBPdDvYtw0n7djBccXqfZRe8OEc2rqHIvia6fWrX3BfdNqlppkbjdsl5cpYWh32oFxmlhnxlHpeKoj2/QiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554242; c=relaxed/simple;
	bh=3Bq5QIwIvHJGRt95CVL/++zlq/FaP6pRDBmGmePMbqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnL9RU1URZxfaAFB+yutP2SnTHUcWMEHgecpcv89rdqNthBH0TOu3HyQBTOGJt0kymYvdsinZAMSelxYWLKaJLHIGAkJI2MG2aZWKKTMZAvN/DjCouuTtQTyiO/TChpgEzQAowoEvRE3XhluTc4BL2PmHjAmvEA1K8b2Z2s4KlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1vxSKD-0008QC-Jo; Tue, 03 Mar 2026 17:10:21 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1vxSKB-003Zjk-12;
	Tue, 03 Mar 2026 17:10:20 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <ore@pengutronix.de>)
	id 1vxSKC-0000000G7OJ-2Kx7;
	Tue, 03 Mar 2026 17:10:20 +0100
Date: Tue, 3 Mar 2026 17:10:20 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	kernel@pengutronix.de, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>,
	Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
	Linus Walleij <linusw@kernel.org>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/6] dt-bindings: mfd: add NXP MC33978/MC34978 MSDI
Message-ID: <aacH7NmkOzZued0Y@pengutronix.de>
References: <20260303133947.1123575-1-o.rempel@pengutronix.de>
 <20260303133947.1123575-2-o.rempel@pengutronix.de>
 <177254885509.3251575.14819823286886805862.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177254885509.3251575.14819823286886805862.robh@kernel.org>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Rspamd-Queue-Id: E9EE91F37F8
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32429-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[o.rempel@pengutronix.de,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_FIVE(0.00)[6];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.941];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hi Krzysztof and Rob,

On Tue, Mar 03, 2026 at 08:40:55AM -0600, Rob Herring (Arm) wrote:
> >  .../devicetree/bindings/mfd/nxp,mc33978.yaml  | 114 ++++++++++++++++++
> >  .../bindings/pinctrl/nxp,mc33978-pinctrl.yaml |  82 +++++++++++++
> >  2 files changed, 196 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/mfd/nxp,mc33978.yaml
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/nxp,mc33978-pinctrl.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/nxp,mc33978.example.dtb: gpio@0 (nxp,mc33978): $nodename:0: 'gpio@0' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml
> 

Folding the mux node into the parent as suggested [1] causes this error.
Because the parent now has #mux-control-cells, the generic
mux-controller.yaml forces the node name to be mux-controller. Since
this chip is primarily a switch/GPIO controller, naming the parent SPI
node mux-controller@0 is misleading.

What is the preferred way to go here?

[1] https://lore.kernel.org/all/20260226-clever-rustling-dolphin-871aff@quoll/

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

