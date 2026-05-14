Return-Path: <linux-gpio+bounces-36849-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aLyeBTTMBWocbgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36849-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 15:20:52 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C175423F5
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 15:20:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB5833088E40
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:18:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A00D3E121A;
	Thu, 14 May 2026 13:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eB/mAagI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBA83E1203;
	Thu, 14 May 2026 13:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764656; cv=none; b=EXx/aOpPohNUoQ6s+X3cgXHPVwtlMzgrFZklXpNeJ4Ijz3+QY9WKjBZlgOdiFHEbWa7BNrry3SuW52kI/5HjXtkiLFPWvRqU3lslVpZWFbGLKwTFCprOYzT0SObKqzdwDSS3QjnA+m+/enDXZP+wHWZfmJHYVOX32UImZdcLZWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764656; c=relaxed/simple;
	bh=OZd9t7xxIbOqEzwQ69KCLTtN+MSPuLLUOwMETkKoynY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=AXG0qnxxB1eia7QexR1rDByD5FIkmxOxkgHvgMjysDVQa2jtf6Xp0rB6XBOA4YoR/MFvuf5dtz6jx3bA2EAVMwnJ53JgCOrX488r1cltPGnnk//1eRChtahJzY0dvwrcpRdUsNlTU9Q0RyOE0auDyu+9fjsAV+BpTrKg7mllCOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eB/mAagI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4DBFC2BCB8;
	Thu, 14 May 2026 13:17:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764656;
	bh=OZd9t7xxIbOqEzwQ69KCLTtN+MSPuLLUOwMETkKoynY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eB/mAagInUXV0Y+nQ0wuTyxsAjHLqgSecgy/AM9EtPtEjXHxPAj+eH7b5gRi2ApRX
	 QxEXWhp25zjFGUbAuP441PS75/JWpIDZu9INYci1sOjRB6ZD7VRDW3po+qPiSGunaW
	 E64NFjx7oPjsb8Us3YR3/NEqzzvWjjwhwckIa98DZqO5ayePqUjq9zwbK3Cp2Ek4Zy
	 c/nd+KpvsmlwLmx4TcauI2rWsNVbaC7Pde7VfkBdFQrOenQAxV3WTQYEqkZdcxNIyE
	 TTXK1wwayzNXHXz6iZxfpB66A3dYYRw0SqihoMoCXOpSr2v8mbMQNq2ulCA2VFEOEP
	 TOcLpQwF4Nk1Q==
Date: Thu, 14 May 2026 08:17:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-19-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-19-changhuang.liang@starfivetech.com>
Message-Id: <177876464318.125951.10267446970822310753.robh@kernel.org>
Subject: Re: [PATCH v2 18/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per2pok-pinctrl
X-Rspamd-Queue-Id: B8C175423F5
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36849-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[11bc2000:email,starfivetech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,11bc2400:email,devicetree.org:url]
X-Rspamd-Action: no action


On Thu, 14 May 2026 04:12:14 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-2 Power OK
> (per2pok) pinctrl controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-per2pok-pinctrl.yaml      | 173 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  20 ++
>  2 files changed, 193 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.yaml:134:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2-pinctrl.example.dtb: pinctrl@11bc2000 (starfive,jhb100-per2-pinctrl): gpio-ranges:1: [31] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per2pok-pinctrl.example.dtb: pinctrl@11bc2400 (starfive,jhb100-per2pok-pinctrl): gpio-ranges:1: [18] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-19-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


