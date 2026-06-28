Return-Path: <linux-gpio+bounces-39079-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id y7I+JVaJQWqvrwkAu9opvQ
	(envelope-from <linux-gpio+bounces-39079-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 22:51:34 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C706D4E9C
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 22:51:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Rt5qoxJU;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39079-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39079-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3480C300F5D2
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 20:51:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A104636A34E;
	Sun, 28 Jun 2026 20:51:30 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A44C296BCC;
	Sun, 28 Jun 2026 20:51:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782679890; cv=none; b=i2+EWy+zBSHMvtCmPbWa2KOo/acMfwgTmCv7DdrLT25ef5/AsH3lbsJuY53ur5xf+jasSPUA9jzNDDh2Xs5uTRX0TPKQpc3IdqlVKAa2r6gt8scV7DzaMJLSu6WAl0LxH8rc1FsdHcQ4idNJb+EJ8ET4l/47+OYBgaBYFVMXKxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782679890; c=relaxed/simple;
	bh=NuSoezA6CsEri4HJSkCqu929MiDPypJ9nW5yGSepTgk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=h9ca1s0y6gkN+KVZjpmmog2BCJhNdUGq3oTVp28R0ZtOjKWN2RQhSnuVjDnxEYvQgw/Qp5R3GKwYBqButuu5rnZa0IV65FBnJjZgPbHddLIdGekZ6oC/DdsxGx54XZ5GGYGU2RBnS2YU8pJiUUc9O2zZ3hXBE3aUNdOHal4mi1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rt5qoxJU; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C852F1F000E9;
	Sun, 28 Jun 2026 20:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782679889;
	bh=RnAKkvp3tjg0tQG+8c9vd7fLfC+BW+vCdDsM8cjhipw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Rt5qoxJUbZhSdIBOWkSkrlQNxi/j6+hZdwXs+zCnBI9k/yplflXEzLFAk1ZrVAt4b
	 VonK3qFQaM2VAqVGi7n7RwQROmWV5zZcWvPTUp+dwfiTNyKMqT6IKDVC9UZv+nc45b
	 vgHAj7K3bZbDlBigGEW9QYKJTV1v7cmHqii5gEBT81VX64vHte+KdFx+eRszUFxNT3
	 qyeTzKCThUGySt0UooEIX9eVRr0FQ7j0ARp8WuxS4jShw5ueT14y5c7K3/vg0QaKww
	 uTtzVV9sz/ItBnLfQRsaI99B5qmfvhzH+OngjK8LkmWY5zORlQEQdXi4IIvYItULgL
	 nv2rLXDhwOOsg==
Date: Sun, 28 Jun 2026 15:51:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Matheus Sampaio Queiroga <srherobrine20@gmail.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, linux-kernel@vger.kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 Markus Gothe <markus.gothe@genexis.eu>, Linus Walleij <linusw@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu>
Message-Id: <178267988674.4168191.17911240000077972868.robh@kernel.org>
Subject: Re: [PATCH v6 17/17] pinctrl: airoha: add support of an7563 SoC
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39079-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:benjamin.larsson@genexis.eu,m:krzk+dt@kernel.org,m:srherobrine20@gmail.com,m:ansuelsmth@gmail.com,m:linux-kernel@vger.kernel.org,m:angelogioacchino.delregno@collabora.com,m:devicetree@vger.kernel.org,m:lorenzo@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:linusw@kernel.org,m:conor+dt@kernel.org,m:mikhail.kshevetskiy@iopsys.eu,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[genexis.eu,kernel.org,gmail.com,vger.kernel.org,collabora.com,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D8C706D4E9C


On Sun, 28 Jun 2026 17:37:33 +0300, Mikhail Kshevetskiy wrote:
> This patch adds support of Airoha an7563 SoC pin controller.
> Also it adds corresponding device tree binding schema.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,an7563-pinctrl.yaml        |  348 +++++
>  drivers/pinctrl/airoha/Kconfig                |    6 +
>  drivers/pinctrl/airoha/Makefile               |    1 +
>  drivers/pinctrl/airoha/pinctrl-an7563.c       | 1115 +++++++++++++++++
>  4 files changed, 1470 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7563-pinctrl.yaml
>  create mode 100644 drivers/pinctrl/airoha/pinctrl-an7563.c
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.example.dtb: /example-0/pinctrl: failed to match any schema with compatible: ['airoha,en7521-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260628143733.273651-18-mikhail.kshevetskiy@iopsys.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


