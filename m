Return-Path: <linux-gpio+bounces-39080-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id YPe9NWiJQWqxrwkAu9opvQ
	(envelope-from <linux-gpio+bounces-39080-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 22:51:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 178696D4EA8
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 22:51:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=H11eCqCw;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39080-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39080-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2B293301B71F
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Jun 2026 20:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA4EC37757C;
	Sun, 28 Jun 2026 20:51:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718EE2FFDE3;
	Sun, 28 Jun 2026 20:51:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782679891; cv=none; b=LzMNSBD0KgsjMXPVCYJfuexlTGQGlYEB50eVxPUmV9iXSavK2mBserFPGQr5CkKk0eT3Yi+9w6t9KB3uMoxammbX27qU2LfjBawD+2dg67Uhz9SuO4XGs0akWE629amrxmAElGBuj6MWoatwU3wr22Fi6IhdutS+m1+4Y0WH1wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782679891; c=relaxed/simple;
	bh=/Psvts4bK0De9buR/Tb14Gff3P1NfGViWnpQhQj3bbg=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tbcR/WgD+sYtJrBXQZmTLuabxesVTMcD8jnY07bnhwX+bIs1DQclbaWLHYFfergdMKbCaEcaT/ZYqkBexa38yeH68FZTdEHXk+fEYXc+8j1lx6y6yamQ+1aR+fUKXkOJquOkgJpNU+FDN1CoZc9ZQVeXNXeALYkKYIDpm4C/G+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H11eCqCw; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF13A1F00A3A;
	Sun, 28 Jun 2026 20:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782679890;
	bh=cV5nLM46V6v/htc0lFctV0QauB6Y72+YuHxfHLCch3w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=H11eCqCwY1jc/+hlN4DaU9CVWUaM5QBNrKK6D7zyITL8TzgdMVTvM0Ta6kjU13c/Q
	 KRKDZe7OQZytTmS/I/KD7V+2XB4+E7+PIMzEtHhgQOqwMZ0HMWA60f8gJTHng+35Rh
	 aX/qNg9SuiN7MYnS+etDBgMXQ2UnxFiPNOQoxb8gd7Wrmxnf9seeiaHRvwCGkMOoiQ
	 yB0gVqIqI7vKsh8FKItB0VepxKqaM+BzKpWvmyQynuLdef30/6KnQKoT4SnC0eUjtJ
	 EdDIXkD/lgjHGy6hQ8OBBgsHeLlpzTbZI55P64RAFovUc1OzIKpEi1jkE3kGkQIC36
	 tEPq2zOItg+BA==
Date: Sun, 28 Jun 2026 15:51:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Matheus Sampaio Queiroga <srherobrine20@gmail.com>, 
 devicetree@vger.kernel.org, Benjamin Larsson <benjamin.larsson@genexis.eu>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mediatek@lists.infradead.org, 
 Markus Gothe <markus.gothe@genexis.eu>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linusw@kernel.org>
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
In-Reply-To: <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
References: <20260628143733.273651-1-mikhail.kshevetskiy@iopsys.eu>
 <20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu>
Message-Id: <178267988796.4168242.2437491560145176405.robh@kernel.org>
Subject: Re: [PATCH v6 15/17] pinctrl: airoha: add support of en7523 SoC
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39080-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:srherobrine20@gmail.com,m:devicetree@vger.kernel.org,m:benjamin.larsson@genexis.eu,m:ansuelsmth@gmail.com,m:conor+dt@kernel.org,m:linux-mediatek@lists.infradead.org,m:markus.gothe@genexis.eu,m:krzk+dt@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:lorenzo@kernel.org,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:mikhail.kshevetskiy@iopsys.eu,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,genexis.eu,kernel.org,lists.infradead.org,collabora.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 178696D4EA8


On Sun, 28 Jun 2026 17:37:31 +0300, Mikhail Kshevetskiy wrote:
> This patch adds support of Airoha en7523 SoC pin controller.
> Also it adds corresponding device tree binding schema.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>  .../pinctrl/airoha,en7523-pinctrl.yaml        |  375 ++++++
>  drivers/pinctrl/airoha/Kconfig                |    6 +
>  drivers/pinctrl/airoha/Makefile               |    1 +
>  drivers/pinctrl/airoha/pinctrl-en7523.c       | 1124 +++++++++++++++++
>  4 files changed, 1506 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.yaml
>  create mode 100644 drivers/pinctrl/airoha/pinctrl-en7523.c
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/pinctrl/airoha,en7523-pinctrl.example.dtb: /example-0/pinctrl: failed to match any schema with compatible: ['airoha,en7521-pinctrl']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260628143733.273651-16-mikhail.kshevetskiy@iopsys.eu

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


