Return-Path: <linux-gpio+bounces-33167-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIPnB16bsWnkDAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33167-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 17:42:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB8AE2677CF
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 17:42:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DC46301DE07
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 16:41:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51B3B3E121E;
	Wed, 11 Mar 2026 16:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBuZYhsB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121253B2FCF;
	Wed, 11 Mar 2026 16:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773247279; cv=none; b=uHJ5p1vAWUDsADsAIElqn8tjehnza8Hrt2vajrTZMeQTXX5Osp2Ti7tNTux0te1BxnMMJHbIqP9rOSptKMSbrRk42TGG32USYREDcR7XmFgrQEiUVz5NCgSe0I3L/HxZEOJhZHQgISxMR24cEZIMvS0Zynk2LIuTv6yduQUk7QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773247279; c=relaxed/simple;
	bh=QGO6BKUP9pDJhAPyG3zMK+3Mt1ryUaCYnq9txTiAz88=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ie/sbVTIaOgIaE+DEzXevpfj/r7bPMJqlIKOG+sG7fScEn+iz9E7HRdX6l0Jc7Faimku5tNdcCooXY4mYXDWRbWNIJGqxTcVNL+XTK/unYUaYSbGULYLnq0dtdPycJ30F/mIZC6yFWCJC3W90Wnal3vUvVHCKhXnW3E8A4Pa12E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBuZYhsB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6DC7C19421;
	Wed, 11 Mar 2026 16:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773247278;
	bh=QGO6BKUP9pDJhAPyG3zMK+3Mt1ryUaCYnq9txTiAz88=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=qBuZYhsBBsVfeLWUk4dPXkznjTVawAHeoidar7vOXWbXyplHqm3lcWsgiy6j58Bvu
	 61jRRYIhXc2szdqohF4n5VdavlWj5vlRYZ4qZ2+WSPS6T40DUQK+WSBTjJ1O1vxcpS
	 +bQZiMeY/vj292ZYAHdHtMnNLoc7Sj8IhOvQg1pHW4Q/OdbQLNCsnWbbcr0+P10Fx4
	 GlWbDclFRBvSSvVXTsPNbP+vL4360GtDV9HFVA4bQjqNo0ZzMU/PNqcIioz+CMKr7m
	 qUVyaSn7ECW1f+4ougu1NoWpOre0ww+fP4UrtkJkLvqYtAcphnuxk0Gds5gkFs3U8H
	 HOji2hwYaqmjw==
Date: Wed, 11 Mar 2026 11:41:17 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, 
 Daire McNamara <daire.mcnamara@microchip.com>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
 Alexandre Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Herve Codina <herve.codina@bootlin.com>, linux-gpio@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org
To: Conor Dooley <conor@kernel.org>
In-Reply-To: <20260311-collar-smokiness-5313aa648a6f@spud>
References: <20260311-tasting-friend-eae39148fb96@spud>
 <20260311-collar-smokiness-5313aa648a6f@spud>
Message-Id: <177324727784.4047403.339169143402607624.robh@kernel.org>
Subject: Re: [PATCH v12 2/4] dt-bindings: soc: microchip: document
 PolarFire SoC's gpio interrupt mux
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33167-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.54:email,microchip.com:email,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,bootlin.com:email]
X-Rspamd-Queue-Id: BB8AE2677CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Wed, 11 Mar 2026 15:17:39 +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> On PolarFire SoC there are more GPIO interrupts than there are interrupt
> lines available on the PLIC, and a runtime configurable mux is used to
> decide which interrupts are assigned direct connections to the PLIC &
> which are relegated to sharing a line.
> 
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  .../soc/microchip/microchip,mpfs-irqmux.yaml  | 77 +++++++++++++++++++
>  .../microchip,mpfs-mss-top-sysreg.yaml        |  4 +
>  2 files changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dts:18.33-24.11: Warning (interrupt_provider): /example-0/interrupt-controller@54: '#interrupt-cells' found, but node is not an interrupt provider
Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dtb: Warning (interrupt_map): Failed prerequisite 'interrupt_provider'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (microchip,mpfs-irqmux): interrupt-map-mask:0: 127 was expected
	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-irqmux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (microchip,mpfs-irqmux): 'interrupt-map' is a required property
	from schema $id: http://devicetree.org/schemas/soc/microchip/microchip,mpfs-irqmux.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (microchip,mpfs-irqmux): 'interrupt-map' is a dependency of 'interrupt-map-mask'
	from schema $id: http://devicetree.org/schemas/interrupt-controller.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-irqmux.example.dtb: interrupt-controller@54 (microchip,mpfs-irqmux): 'anyOf' conditional failed, one must be fixed:
	'interrupt-controller' is a required property
	'interrupt-map' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260311-collar-smokiness-5313aa648a6f@spud

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


