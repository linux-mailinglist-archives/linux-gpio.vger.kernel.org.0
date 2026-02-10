Return-Path: <linux-gpio+bounces-31573-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qALvAZmZi2k3XAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31573-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 21:48:25 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A513011F1B9
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 21:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FC5D30421E4
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 20:48:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 509F73346A5;
	Tue, 10 Feb 2026 20:48:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJzTyC+E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B91F331A53;
	Tue, 10 Feb 2026 20:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770756495; cv=none; b=f2eN8Ef9ALoYyd/PUSpO+VrTywKlpGKhb9+OYYkrMp0IgVRRBZLaMlcvmc9RGPWg7RlkH38SO+mTFOHWfNiAxHIdSn3RsA4MvDMK2O8zifdo/vwjB0zS4Z1EerRjuQ5QzS+W84xxXdP7mL54aHiItWRcnAPO7NgV6XZ0GYdYq5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770756495; c=relaxed/simple;
	bh=8Jn1Y4izc0UX6TWuQOTgUa1Iqbm12Lpkc6uITFUi1Cw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=c48ga/GjTJYGdFtPLi0ZxY7ZGAHjKVilN2kcwnseuVB+5K07j/w6c5wOI1gmrye2A0MqeGoFQ0jC96BDVaL2ZVo2bB+gAQZbhij4DUFfgJu3AGbmtrf49zDUz9lreoB2E11f/5rLttIRanJPZWO/TajQm8greMVbauNF4hKqtpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJzTyC+E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76B62C116C6;
	Tue, 10 Feb 2026 20:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770756494;
	bh=8Jn1Y4izc0UX6TWuQOTgUa1Iqbm12Lpkc6uITFUi1Cw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=YJzTyC+EC88DeDJ2ipytIEimaxRZK90PFnSBPqLRuFluQPRcILGA3rT4946x+/CBP
	 5DJhvuFS9D8TKYRF8/Yr/SfCS6cDI1vy8Drnt+puEMBA/9Y+J4z07CBIt5/kKRLhuE
	 giGpdE230iB1xeN9E8V8BmA7uw9UeG4vJ+I2FOZ79l8w+/pNRHA5ZSV/iAzyrGf8kD
	 h5DOmtP/3DMZPgI3/BWI0A/K3HwUN1eIe1soEuZHzkXcxUFSBVyZHebZxO51tYXkl8
	 1Z54TEuON0ZUYnc0NiTonod/3XuKJMUjf6Zq290c6jp0TamBcVgVcJiGfX1pIIzjpV
	 lCMcmxDYe6N8Q==
Date: Tue, 10 Feb 2026 14:48:13 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-imx@nxp.com, 
 devicetree@vger.kernel.org, Linus Walleij <linusw@kernel.org>, 
 arnaud.pouliquen@foss.st.com, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
 linux-gpio@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
 imx@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Fabio Estevam <festevam@gmail.com>, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
To: Shenwei Wang <shenwei.wang@nxp.com>
In-Reply-To: <20260210170814.406883-2-shenwei.wang@nxp.com>
References: <20260210170814.406883-1-shenwei.wang@nxp.com>
 <20260210170814.406883-2-shenwei.wang@nxp.com>
Message-Id: <177075649333.2817738.5507371747833844104.robh@kernel.org>
Subject: Re: [PATCH v7 1/4] dt-bindings: remoteproc: imx_rproc: Add "rpmsg"
 subnode support
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-31573-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_CC(0.00)[kernel.org,nxp.com,vger.kernel.org,foss.st.com,pengutronix.de,lists.infradead.org,lists.linux.dev,lwn.net,linaro.org,gmail.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nxp.com:email]
X-Rspamd-Queue-Id: A513011F1B9
X-Rspamd-Action: no action


On Tue, 10 Feb 2026 11:08:11 -0600, Shenwei Wang wrote:
> Remote processors may announce multiple GPIO controllers over an RPMSG
> channel. These GPIO controllers may require corresponding device tree
> nodes, especially when acting as providers, to supply phandles for their
> consumers.
> 
> Define an RPMSG node to work as a container for a group of RPMSG channels
> under the imx_rproc node. Each subnode within "rpmsg" represents an
> individual RPMSG channel. The name of each subnode corresponds to the
> channel name as defined by the remote processor.
> 
> All remote devices associated with a given channel are defined as child
> nodes under the corresponding channel node.
> 
> Signed-off-by: Shenwei Wang <shenwei.wang@nxp.com>
> ---
>  .../devicetree/bindings/gpio/gpio-rpmsg.yaml  | 55 +++++++++++++++++++
>  .../bindings/remoteproc/fsl,imx-rproc.yaml    | 53 ++++++++++++++++++
>  2 files changed, 108 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml references a file that doesn't exist: Documentation/driver-api/gpio/gpio-rpmsg.rst
Documentation/devicetree/bindings/gpio/gpio-rpmsg.yaml: Documentation/driver-api/gpio/gpio-rpmsg.rst

See https://patchwork.kernel.org/project/devicetree/patch/20260210170814.406883-2-shenwei.wang@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


