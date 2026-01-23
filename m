Return-Path: <linux-gpio+bounces-31007-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OWzJjFfc2l3vAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31007-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 12:44:49 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE061754AF
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 12:44:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47C7530BC50B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jan 2026 11:39:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC5D9337B87;
	Fri, 23 Jan 2026 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hE9mGaxf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60702E8E07;
	Fri, 23 Jan 2026 11:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769168287; cv=none; b=Ikh0685UdBesCBA4A6Ha32dB4hz6xFe8k/d2gvDxbOG6GdzNiPZJz9VM4pF1iFkC1bzehoWlfA1R9gZdHWaM2BKzno848qfm1+dfa6Qf0NJ+ySMjhIaF45cmWh4ldHQbWYM+nVYcosfT3bTXpeWeaz0kM4khDryFITgixVGX+ZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769168287; c=relaxed/simple;
	bh=6AsOP4H1gPx88LFV+WRcrIxpnKRWhNEYhBcF0D/GriM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=uCuTmRiCvPwSPY7oayibMe3XtxhsUftf7JYZZ7J1B/8TEfnuMHRIGHjs3v19qRZkFLBpDQTVFkGqMkTDw0mNBkabHOahbUIireSMoOWN+Woy+5/dAcfpKaAJpF6AxvZUuc5xRfQI/mZv9IAblh9MWF0ZNInLxJ7QPrKSjHCfLz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hE9mGaxf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1606EC19422;
	Fri, 23 Jan 2026 11:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769168287;
	bh=6AsOP4H1gPx88LFV+WRcrIxpnKRWhNEYhBcF0D/GriM=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=hE9mGaxfuFAvwhvqFlfTyugmXbwz4VSiW0dixHmngkIHl3Xt3fGK/CdYOoUJs8KkO
	 Gf4Ygs+GP1wC6jFJ2m8FVuie8OHaUqgBbc0DcT7G6dNmELd9Fh4PRvIbTJyXQ0NLgm
	 ulZcVGtmCZoJ3IWZJQj9q2345NSHi1zlEWZa5051o144g3C+w6S6Nampm6mA6xGL6C
	 asbLHM0iUvyrj4iM8HwW+NBsuVgXV1Fdr9I60Ky0dBNlPXopXIh2RKL2/59pCHD7Q8
	 3DLmovcKV7K2qoHRZUbSJQ9x50s42ajC5bFxfQP3HocAryXYwPkM9wWBSpal/Mp4yA
	 i+NdBW2k7xPnw==
Date: Fri, 23 Jan 2026 05:38:06 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-gpio@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 Lee Jones <lee@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-watchdog@vger.kernel.org, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Shawn Guo <shawnguo@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 =?utf-8?q?J=C3=A9r=C3=A9mie_Dautheribes?= <jeremie.dautheribes@bootlin.com>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
In-Reply-To: <20260123-dev-b4-aaeon-mcu-driver-v2-2-9f4c00bfb5cb@bootlin.com>
References: <20260123-dev-b4-aaeon-mcu-driver-v2-0-9f4c00bfb5cb@bootlin.com>
 <20260123-dev-b4-aaeon-mcu-driver-v2-2-9f4c00bfb5cb@bootlin.com>
Message-Id: <176916828626.1389324.17938615184098184972.robh@kernel.org>
Subject: Re: [PATCH v2 2/5] dt-bindings: mfd: Add AAEON embedded controller
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,pengutronix.de,kernel.org,bootlin.com,lists.infradead.org,lists.linux.dev,linux-watchdog.org,roeck-us.net,gmail.com];
	TAGGED_FROM(0.00)[bounces-31007-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.973];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,devicetree.org:url,0.0.0.62:email]
X-Rspamd-Queue-Id: EE061754AF
X-Rspamd-Action: no action


On Fri, 23 Jan 2026 10:54:31 +0100, Thomas Perrot (Schneider Electric) wrote:
> Add device tree binding documentation for the AAEON embedded controller
> (MCU). This microcontroller is found on AAEON embedded boards, it is
> connected via I2C and  and provides a GPIO control and watchdog timer.
> 
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.com>
> ---
>  .../bindings/mfd/aaeon,srg-imx8pl-mcu.yaml         | 56 ++++++++++++++++++++++
>  MAINTAINERS                                        |  6 +++
>  2 files changed, 62 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8pl-mcu.example.dtb: embedded-controller@62 (aaeon,srg-imx8pl-mcu): '#gpio-cells', 'gpio-controller', 'gpio-line-names' do not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/mfd/aaeon,srg-imx8pl-mcu.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260123-dev-b4-aaeon-mcu-driver-v2-2-9f4c00bfb5cb@bootlin.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


