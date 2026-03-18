Return-Path: <linux-gpio+bounces-33745-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHvEFNydumngZgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33745-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:43:08 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDC42BBB1F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 13:43:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B1808318F94F
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Mar 2026 12:39:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DFCE3D88F1;
	Wed, 18 Mar 2026 12:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mnxz28Ri"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DB0F3D6698;
	Wed, 18 Mar 2026 12:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773837559; cv=none; b=aOgmWpiml7b3ql2F9uRYsgq/gqCMnqhpMjJt859HqPjKmMzset9qowDvhTz1LiCr5rjWvZ03FDgXyRk/B0LXgK1vqTVqA4wS8+fytzsEUXMVA/JKim8DTXF9gDk3zQ6wFCD6sWoHXJhyqsR/nByVLr8wQre9j93KYMFtf0Q4MmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773837559; c=relaxed/simple;
	bh=RBuqnVZJEy7b5iSK48Q0ap0YOczP8iWoM+/YF46iV9U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KzaN/V1XWTi46qWW67InL4YHx3A+OkbQiMHNnCpqIr0E3PUxTo6NckqqJynK31Cred8eCpmYujRNKK306QthrDvUqGXiy7UGIB1pIpRXcEUgZ+FMEWgfm01an3/LK+UZH4S9gy1mmcoMHrmOAacvvLBmBRez0O6Io4hiSdm18X4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mnxz28Ri; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773837555;
	bh=RBuqnVZJEy7b5iSK48Q0ap0YOczP8iWoM+/YF46iV9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mnxz28RiDchaD+WKXdz42ZRrqmZbt3YNm0LrfuHQbCBHfT3eGvwEAgiHqzovfMPC5
	 WI/wVfdCoNCibGl8iCCnua0DDfWy68ucTCTA1acHaQ1g14PHiyeWlwwT5rML3lby2l
	 k+71Du17DZ4vz66j7kd/5rMRpZq4g6Z7mOtEpV37eEPLI807izbd9fkFRGgSelTp/4
	 UQ/CcNBmW35c1WUV2j8vAI27EwZLk8JOiotIYGnfbwGjq+R0rV5iaB4ISNzEpG4HOu
	 iBtGLH1z1HfcShn0NFsUp7Myld8KpdsQnfHl6tksSMMF3lDOAcNEjfpObG29k9j/bs
	 jDByGaCI2HxSA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9D4CD17E1355;
	Wed, 18 Mar 2026 13:39:14 +0100 (CET)
Message-ID: <62b1463b-3d32-4d5c-8af3-f09202f96fb5@collabora.com>
Date: Wed, 18 Mar 2026 13:39:14 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 linux-mediatek@lists.infradead.org
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Julien Massot
 <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>,
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
 Val Packett <val@packett.cool>, Fabien Parent <parent.f@gmail.com>,
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-gpio@vger.kernel.org
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-4-l.scorcia@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260317184507.523060-4-l.scorcia@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33745-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,lists.infradead.org];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,mediatek.com,collabora.com,packett.cool,vger.kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:dkim,collabora.com:mid,devicetree.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DDDC42BBB1F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Il 17/03/26 19:43, Luca Leonardo Scorcia ha scritto:
> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>   .../regulator/mediatek,mt6392-regulator.yaml  | 318 ++++++++++++++++++
>   .../regulator/mediatek,mt6392-regulator.h     |  24 ++
>   2 files changed, 342 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
>   create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulator.h
> 
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
> new file mode 100644
> index 000000000000..fa4aad2dcbe8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulator.yaml
> @@ -0,0 +1,318 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6392 Regulator
> +
> +description:
> +  Regulator node of the PMIC. This node should under the PMIC's device node.
> +  All voltage regulators provided by the PMIC are described as sub-nodes of
> +  this node.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt6392-regulator
> +
> +patternProperties:
> +  "^(buck_)?v(core|proc|sys)$":
> +    description: Buck regulators
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          BUCK regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
> +        items:
> +          enum: [0, 1]
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(adc18|camio|cn18|io18)$":

There was a discussion a bit of time ago and we decided to drop the "ldo_" and
"buck_" prefix from the regulators.

Can you please drop those?

Cheers,
Angelo

> +    description: LDOs with fixed 1.8V output
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
> +        items:
> +          enum: [0, 1]
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(xo22)$":
> +    description: LDOs with fixed 2.2V output
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
> +        items:
> +          enum: [0, 1]
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(m25)$":
> +    description: LDOs with fixed 2.5V output
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
> +        items:
> +          enum: [0, 1]
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(aud28|io28)$":
> +    description: LDOs with fixed 2.8V output w/ mode
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
> +        items:
> +          enum: [0, 1]
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(cama)$":
> +    description: LDOs with fixed 2.8V output w/o mode
> +    type: object
> +    $ref: regulator.yaml#
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?vusb$":
> +    description: LDOs with fixed 3.3V output
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes:
> +        description: |
> +          LDO regulators can set regulator-initial-mode and regulator-allowed-modes to
> +          values specified in dt-bindings/regulator/mediatek,mt6392-regulator.h
> +        items:
> +          enum: [0, 1]
> +    unevaluatedProperties: false
> +
> +  "^(ldo_)?v(aud22|camaf|camd|cn35|efuse|emc3v3|gp1|gp2|m|mc|mch)$":
> +    description: LDOs with variable output
> +    type: object
> +    $ref: regulator.yaml#
> +    properties:
> +      regulator-allowed-modes: false
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    mt6392_regulators: regulators {
> +        compatible = "mediatek,mt6392-regulator";
> +
> +        mt6392_vproc_reg: buck_vproc {
> +            regulator-name = "vproc";
> +            regulator-min-microvolt = <700000>;
> +            regulator-max-microvolt = <1350000>;
> +            regulator-ramp-delay = <12500>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vsys_reg: buck_vsys {
> +            regulator-name = "vsys";
> +            regulator-min-microvolt = <1400000>;
> +            regulator-max-microvolt = <2987500>;
> +            regulator-ramp-delay = <25000>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vcore_reg: buck_vcore {
> +            regulator-name = "vcore";
> +            regulator-min-microvolt = <700000>;
> +            regulator-max-microvolt = <1350000>;
> +            regulator-ramp-delay = <12500>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vxo22_reg: ldo_vxo22 {
> +            regulator-name = "vxo22";
> +            regulator-min-microvolt = <2200000>;
> +            regulator-max-microvolt = <2200000>;
> +            regulator-enable-ramp-delay = <110>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vaud22_reg: ldo_vaud22 {
> +            regulator-name = "vaud22";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <2200000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vcama_reg: ldo_vcama {
> +            regulator-name = "vcama";
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vaud28_reg: ldo_vaud28 {
> +            regulator-name = "vaud28";
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vadc18_reg: ldo_vadc18 {
> +            regulator-name = "vadc18";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vcn35_reg: ldo_vcn35 {
> +            regulator-name = "vcn35";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3600000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vio28_reg: ldo_vio28 {
> +            regulator-name = "vio28";
> +            regulator-always-on;
> +            regulator-boot-on;
> +            regulator-min-microvolt = <2800000>;
> +            regulator-max-microvolt = <2800000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vusb_reg: ldo_vusb {
> +            regulator-name = "vusb";
> +            regulator-min-microvolt = <3300000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vmc_reg: ldo_vmc {
> +            regulator-name = "vmc";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vmch_reg: ldo_vmch {
> +            regulator-name = "vmch";
> +            regulator-min-microvolt = <3000000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vemc3v3_reg: ldo_vemc3v3 {
> +            regulator-name = "vemc3v3";
> +            regulator-min-microvolt = <3000000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vgp1_reg: ldo_vgp1 {
> +            regulator-name = "vgp1";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vgp2_reg: ldo_vgp2 {
> +            regulator-name = "vgp2";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vcn18_reg: ldo_vcn18 {
> +            regulator-name = "vcn18";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vcamaf_reg: ldo_vcamaf {
> +            regulator-name = "vcamaf";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <3300000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vm_reg: ldo_vm {
> +            regulator-name = "vm";
> +            regulator-min-microvolt = <1240000>;
> +            regulator-max-microvolt = <1390000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vio18_reg: ldo_vio18 {
> +            regulator-name = "vio18";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <264>;
> +            regulator-always-on;
> +            regulator-boot-on;
> +        };
> +
> +        mt6392_vcamd_reg: ldo_vcamd {
> +            regulator-name = "vcamd";
> +            regulator-min-microvolt = <1200000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vcamio_reg: ldo_vcamio {
> +            regulator-name = "vcamio";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <1800000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vm25_reg: ldo_vm25 {
> +            regulator-name = "vm25";
> +            regulator-min-microvolt = <2500000>;
> +            regulator-max-microvolt = <2500000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +
> +        mt6392_vefuse_reg: ldo_vefuse {
> +            regulator-name = "vefuse";
> +            regulator-min-microvolt = <1800000>;
> +            regulator-max-microvolt = <2000000>;
> +            regulator-enable-ramp-delay = <264>;
> +        };
> +    };
> diff --git a/include/dt-bindings/regulator/mediatek,mt6392-regulator.h b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
> new file mode 100644
> index 000000000000..8bd1a13faad8
> --- /dev/null
> +++ b/include/dt-bindings/regulator/mediatek,mt6392-regulator.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +
> +#ifndef _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
> +#define _DT_BINDINGS_REGULATOR_MEDIATEK_MT6392_H_
> +
> +/*
> + * Buck mode constants which may be used in devicetree properties (eg.
> + * regulator-initial-mode, regulator-allowed-modes).
> + * See the manufacturer's datasheet for more information on these modes.
> + */
> +
> +#define MT6392_BUCK_MODE_AUTO		0
> +#define MT6392_BUCK_MODE_FORCE_PWM	1
> +
> +/*
> + * LDO mode constants which may be used in devicetree properties (eg.
> + * regulator-initial-mode, regulator-allowed-modes).
> + * See the manufacturer's datasheet for more information on these modes.
> + */
> +
> +#define MT6392_LDO_MODE_NORMAL		0
> +#define MT6392_LDO_MODE_LP		1
> +
> +#endif



