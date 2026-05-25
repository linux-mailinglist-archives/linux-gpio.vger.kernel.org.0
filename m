Return-Path: <linux-gpio+bounces-37482-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KBocBsKYFGoUOwcAu9opvQ
	(envelope-from <linux-gpio+bounces-37482-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 20:45:22 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5395CDC21
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 20:45:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 526933006173
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2026 18:45:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A936F37D116;
	Mon, 25 May 2026 18:45:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MgybNK8e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DCC379EF2;
	Mon, 25 May 2026 18:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779734717; cv=none; b=uC2LJzmElGThkjKSWPU61k6ZO6J1EPA4yefTI1UJwxhMFWJqdtoh8dt3rYyI6Dh1REQWnxLXUhVrD5ggVpEGi1Q5hfHAWD8POBxEUU2xNbAGUR8p4bVG/fpjYkMxJleYzrdx9MjxxrerHb0yrtogvXLAlOgX+kASXPqcwP72DrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779734717; c=relaxed/simple;
	bh=03Un+L4U/WbKGCEwwjeTdw4zVgtXpZk1M28Ig4TLEr8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=V5t0D+HAFSY/OzCnmzHLAlSzxPvF4NaCtsHAGXXol2E3M4SbBqC3h/c9QvStYNOZYN0Sive4fRsvdFH3YiwED5S2SsdLKnLCsKxYm7o5wX3EPVydzpCEY7hcr2t2JqK9SELqGN+t2fCMFhumZ/14FkCJYJxVkSGCda4BW8b0ySY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MgybNK8e; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68E281F000E9;
	Mon, 25 May 2026 18:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779734715;
	bh=64e79zTo0Q/3LTOxcKMi6PmSR/wzB/guSZphOxF/gzg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=MgybNK8e0qDHzldZoTzHC4seiisEWAeA9YkqVlO80OC3g5EwZK2bBSsVmE3ZKoFdz
	 UNygU6b5ZqVG/6WJkRDh9Mse/ZjObjuaWU/45K+K8DCy5maEZyOGGgX9hpA+f1rx06
	 arEWKWJQ/hKGPpprOvUZMK5NIJmNvTKPWmzdCCFOFCBfarBJz91XRVTPqy/ysv/S5r
	 TRB0wfVzXVW6izyDUKvqUiKPgsJo+jN/yHIuVm3aGMGp9Tir+moBdS7N9lkX0rNGVX
	 wpONYLWinFang3PCQk20mbS9aN+zOpjObtCM8Yl2bjtY7itoLzBUFeFogtvBhTQBq5
	 jvVGgwfFosk7Q==
Date: Mon, 25 May 2026 13:45:14 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, linux-staging@lists.linux.dev, 
 gregkh@linuxfoundation.org, devicetree@vger.kernel.org, 
 alexandre.belloni@bootlin.com, Frank.Li@nxp.com, conor+dt@kernel.org, 
 linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
 brgl@kernel.org, linux-gpio@vger.kernel.org, linusw@kernel.org, 
 wei_wang@realsil.com.cn
To: zain_zhou@realsil.com.cn
In-Reply-To: <20260525125128.297-1-zain_zhou@realsil.com.cn>
References: <20260525125128.297-1-zain_zhou@realsil.com.cn>
Message-Id: <177973471463.4085017.2026764711842557373.robh@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: i3c: add Realtek RTS490x I3C HUB
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-37482-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14]
X-Rspamd-Queue-Id: 8B5395CDC21
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Mon, 25 May 2026 20:51:27 +0800, zain_zhou@realsil.com.cn wrote:
> From: Yin Zhou <zain_zhou@realsil.com.cn>
> 
> Add DT binding schema for Realtek RTS490x series I3C HUB devices.
> 
> The binding describes configuration properties for:
>   - LDO enable/disable and voltage level per port group
>   - Pull-up resistance per port group
>   - IO driver strength per port
>   - Per target-port mode (I3C/SMBus/GPIO/disabled), pull-up,
>     IO mode, SMBus clock frequency and polling interval
>   - Hub network always-I3C mode
>   - Hardware identification via CSEL pin (id) and CP1 pins (id-cp1)
> 
> Signed-off-by: Yin Zhou <zain_zhou@realsil.com.cn>
> 
> Changes in v2:
> - Rework binding per Krzysztof Kozlowski's review:
>   add realtek, vendor prefix to all custom properties; use boolean
>   for enable flags; use u32 with unit suffixes (-microvolt, -ohms)
>   for voltage/resistance; change to unevaluatedProperties: false;
>   fix title, maintainer name, description, $nodename pattern
> - Consolidate examples; add dt-bindings/i2c/i2c.h include
> ---
>  .../bindings/i3c/realtek,rts490x-i3c-hub.yaml | 263 ++++++++++++++++++
>  1 file changed, 263 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/i3c/realtek,rts490x-i3c-hub.example.dtb: /example-0/i3c-master@d040000/hub@70,4ba00000000/target-port@1/i2c@10: failed to match any schema with compatible: ['i2c-slave-mqueue']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260525125128.297-1-zain_zhou@realsil.com.cn

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


