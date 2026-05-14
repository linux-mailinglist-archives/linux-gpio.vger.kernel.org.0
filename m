Return-Path: <linux-gpio+bounces-36846-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ILLhMtzLBWocbgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36846-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 15:19:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 914EE542375
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 15:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AE925301DC06
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:17:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 018633E0242;
	Thu, 14 May 2026 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJAq4mOo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AFFD3DFC6E;
	Thu, 14 May 2026 13:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764649; cv=none; b=lrodGi9KauFvI6WAdyU36Tf+0SroJ/oEl0v3FcjL2SuA8zr7LeMIHeiHWY6f4KUhNgvJAx8iEyWe9/4ArkYqCC1bZ9SkE8xFbPp+D0ZeBk1CnP7aP9YGohzhf8qzoDWPTt9r7KyqKxHrbN0aVfMwMHYhxJfQtC2XnazubjDz8Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764649; c=relaxed/simple;
	bh=JabA8iVrRmdRx3/WY9m7cqceq4n9VeeE63bzUTTwXOs=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=QqW4AJOTdTp9ixZxGpP8k2lqUHSYlu6+kt1G3SRgP+t2qo17IbIqPsibqr70pO0Gw/4e7BYwP9OnnSZS8NaKbKf0qqHCtbmKwgcfU9sSj20r250P1uZH6EwMSLYBr8OnNZ8hGBZS/wpUJmfIxG4PwiR0rtavnKYz0t9KxexDhVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJAq4mOo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEED8C2BCB8;
	Thu, 14 May 2026 13:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764649;
	bh=JabA8iVrRmdRx3/WY9m7cqceq4n9VeeE63bzUTTwXOs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=MJAq4mOoJIhX7kLmBSG9hecTxDHn/mOKyTxgVMNy8oM7G9TUhuMjOxwmeIn5nE9Iy
	 jrwkx4PpFFOBbDrHIfgnbSfKCGQNFHbARL6urn6wX5e6/p1EMEY/DFx20fxZyhF9sd
	 SahDQ30QOieqXcULH2uLqBlN393cszTQ/0gVtNBxAA899tx8x2SwxLyfXVWHGb7AbS
	 CO/02s9604aG1Sk8zncaUCsXiojhvKn8SvPBDglxjOZAe8j3WHwcJ/INppKU3PS7jU
	 /MMOOLWaNP42vI8qpuEtqcTG3zOmfMLcaG/qWBRfwn1E4aAFLyHUyQsD9K9tBOLr3P
	 DBoSy6T/wMNSQ==
Date: Thu, 14 May 2026 08:17:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij <linusw@kernel.org>, 
 Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-7-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-7-changhuang.liang@starfivetech.com>
Message-Id: <177876463825.125803.11297264723733467391.robh@kernel.org>
Subject: Re: [PATCH v2 06/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0h-pinctrl
X-Rspamd-Queue-Id: 914EE542375
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36846-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.199.152.224:email,devicetree.org:url,starfivetech.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.199.149.192:email]
X-Rspamd-Action: no action


On Thu, 14 May 2026 04:12:02 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../starfive,jhb100-sys0h-pinctrl.yaml        | 174 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
>  2 files changed, 188 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.yaml:136:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctrl.example.dtb: pinctrl@13080800 (starfive,jhb100-sys0h-pinctrl): gpio-ranges:1: [12] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl.example.dtb: pinctrl@13080000 (starfive,jhb100-sys0-pinctrl): gpio-ranges:1: [4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-7-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


