Return-Path: <linux-gpio+bounces-39328-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aIocEKA1RWrD8goAu9opvQ
	(envelope-from <linux-gpio+bounces-39328-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 17:43:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAA36EF58D
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Jul 2026 17:43:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=DujIxa56;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39328-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39328-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BA7603023FB0
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2026 15:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7E6F48A2C3;
	Wed,  1 Jul 2026 15:39:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABEFF43637A;
	Wed,  1 Jul 2026 15:39:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920347; cv=none; b=TmWTmdYbqmyQv8IItejan21IsykUQhtXDxVLZFLJLaLTkGbYcMUt33MYO82fLKBKtF2AB3nFyqdudsPX7Mz+B7TxXNjgJNTBLdUBFLPsW8ov+knaTkt3tWXMlxNCWTH4oL+ivzaBGGyL9OrqaZ0vBx/JSlldFeGRmA2Thygjp3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920347; c=relaxed/simple;
	bh=0foiH+ij4RI16jN7GIYYVMnnucuAlbGDmtr8OzsDHQM=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=RSzFN96svECCY3qW2bdFRfw/uQIjmktX6hpsj89p8W3hCtqk7yJ933UHRdSf5ppUk35R8M9+QqFmXJYRq6kVwHnTfBelJ6NDRBalF9fCAef+JMLw3Y6l67q+tSZft/LqZEsincZgkeX8Dh9W1GgmvOK65ihfXS9nbeF3WXx6u+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DujIxa56; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD351F000E9;
	Wed,  1 Jul 2026 15:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782920346;
	bh=T4AkqOupu39zAwLHhbxL17u3PNcF/dLuQZhEPfCEpxU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=DujIxa56mkQBTupP60pFDJqQAyLW/1zOOWC1/apL3X8IDByXPxwDJodb9IEQGEME3
	 FoKyLAivNNaopZLzt0+KydLO16sHRsxIsmhZO+iFizerJOCIM6UwjUvzLUU8w4MUx+
	 L0r2mZ2PiSqrYQA2c/tVJmZT5VV0zpkq0bEgMEBJFuJfM5PMWn6IbH+0x4+bkY1dgK
	 yMhHkPUkC/GDWTBfvhRI0hzngWqPnQtZeobkHfZv7C78/4t72DNO5GjrrOekKKlrkm
	 Su8s8UqF74+bRMry01QATLOj+NLxrEOYFEVBCXtA16XJapbeZjdNffKYtykd3Prb6F
	 HaL61ZNzqZI4g==
Date: Wed, 01 Jul 2026 10:39:05 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
 Stephen Boyd <sboyd@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 linux-rtc@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, linux-gpio@vger.kernel.org, 
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, 
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>
To: Matti Vaittinen <matti.vaittinen@linux.dev>
In-Reply-To: <67b42b5363533f11c22a6421417c3345f9872aec.1782909323.git.mazziesaccount@gmail.com>
References: <cover.1782909323.git.mazziesaccount@gmail.com>
 <67b42b5363533f11c22a6421417c3345f9872aec.1782909323.git.mazziesaccount@gmail.com>
Message-Id: <178292034520.501377.15267936510733753810.robh@kernel.org>
Subject: Re: [PATCH 1/8] dt-bindings: regulator: ROHM BD73800 regulators
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
	TAGGED_FROM(0.00)[bounces-39328-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:broonie@kernel.org,m:bmasney@redhat.com,m:mturquette@baylibre.com,m:linux-clk@vger.kernel.org,m:sboyd@kernel.org,m:brgl@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-rtc@vger.kernel.org,m:krzk+dt@kernel.org,m:alexandre.belloni@bootlin.com,m:mazziesaccount@gmail.com,m:linux-gpio@vger.kernel.org,m:matti.vaittinen@fi.rohmeurope.com,m:lee@kernel.org,m:lgirdwood@gmail.com,m:matti.vaittinen@linux.dev,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,redhat.com,baylibre.com,bootlin.com,gmail.com,fi.rohmeurope.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BBAA36EF58D


On Wed, 01 Jul 2026 15:41:11 +0300, Matti Vaittinen wrote:
> From: Matti Vaittinen <mazziesaccount@gmail.com>
> 
> Add bindings for the BUCKs and LDOs on ROHM BD73800. The PMIC state
> specific voltages can be set in same fashion as with a few other ROHM
> PMICs (for example with BD718[15,28,37,47,50,79]). Same properties are
> recycled :)
> 
> The LDOs 1 and 4 can use different voltage ranges depending on the OTP
> configuration.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> ---
>  .../regulator/rohm,bd73800-regulator.yaml     | 119 ++++++++++++++++++
>  1 file changed, 119 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):
Warning: Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd73800-pmic.yaml
Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml: Documentation/devicetree/bindings/mfd/rohm,bd73800-pmic.yaml

See https://patchwork.kernel.org/project/devicetree/patch/67b42b5363533f11c22a6421417c3345f9872aec.1782909323.git.mazziesaccount@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


