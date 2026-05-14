Return-Path: <linux-gpio+bounces-36848-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yBceG4fLBWrvbQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36848-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 15:17:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 47151542317
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 15:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7A5D43021F51
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 13:17:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AB926E6F2;
	Thu, 14 May 2026 13:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rZqgPjyd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AE83E0732;
	Thu, 14 May 2026 13:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778764654; cv=none; b=tiGpTM6ffUudF0VkUZr2fUSEIDPzibDrlQkfRHG1J4YdPtCrDCqN3tN+vAYVnXR/nD040pzRe8syqVdA6R2J4a/mtTMj2lDAgMxkv2g43RHmudK+pPqPgxKZuH33hBlCgapHUw7zrTjAl8+w9+ZzJBx9At11TRnWaPq3CRvbDCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778764654; c=relaxed/simple;
	bh=LXjR9KI/K4yRWbtOHy6vX/mBQ02JhQVFQtCevl9ZyN4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=qquoE/TxMWhpkqpbBvOBQk0qBuC4n6b6vA110Wvo7z4UObV7dpj/GxHEH1qfg1ToNcnEqt17KEm3hdnZ8n561ldQcqZHX0yhsdPQ3efTWIFDNCSSPb5TzuMz4g1wzSUePO25d2hPsiDZXyDWXDSwmR9hg/J61zDxhmDALvoQoaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rZqgPjyd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CC04C2BCB3;
	Thu, 14 May 2026 13:17:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778764653;
	bh=LXjR9KI/K4yRWbtOHy6vX/mBQ02JhQVFQtCevl9ZyN4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rZqgPjydVuobHeUYkV1cuOag+GmpEeNIEQR/HfW94JNIsgt/CABxNOsb6cPpkxgAW
	 GB7XsEUzIjp7c/qAFZKhatGp8u4BGIf8m3ifeuJH/vAsDkmfF1rIR/KRcAXxE84zmt
	 eYffQKHeaTxWIbYoWYUqQA9OJT60BRCjNG2bGZWM9Y2erzBnTTGOinHyKcGW8iSE2R
	 koDyK/MqmVGmmBX+v0+x8mVtzgSxXzgUgJxKxAgG/W6Y2rd7fW6eK1tM8C3TQr86ld
	 DPgzyCqlVD4MNGMLE2e8/uoFdW8tYOc7f7Zqd8zClC4mavyyR3jjAMP1uov1v5fA+O
	 vRjjs0NZ6llXg==
Date: Thu, 14 May 2026 08:17:31 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, 
 Paul Walmsley <pjw@kernel.org>, linux-gpio@vger.kernel.org, 
 Palmer Dabbelt <palmer@dabbelt.com>, Linus Walleij <linusw@kernel.org>, 
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Bartosz Golaszewski <brgl@kernel.org>, linux-riscv@lists.infradead.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>
In-Reply-To: <20260514111218.94519-15-changhuang.liang@starfivetech.com>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-15-changhuang.liang@starfivetech.com>
Message-Id: <177876464157.125909.5389364363930328136.robh@kernel.org>
Subject: Re: [PATCH v2 14/22] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
X-Rspamd-Queue-Id: 47151542317
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36848-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,11b42000:email,devicetree.org:url]
X-Rspamd-Action: no action


On Thu, 14 May 2026 04:12:10 -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
> controller.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 175 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  38 ++++
>  2 files changed, 213 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.yaml:135:14: [warning] wrong indentation: expected 12 but found 13 (indentation)

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinctrl.example.dtb: pinctrl@11b42000 (starfive,jhb100-per1-pinctrl): gpio-ranges:2: [32, 4] is too short
	from schema $id: http://devicetree.org/schemas/gpio/gpio.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260514111218.94519-15-changhuang.liang@starfivetech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


