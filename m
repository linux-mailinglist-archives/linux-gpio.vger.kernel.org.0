Return-Path: <linux-gpio+bounces-38502-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xO6WIzoOMGpoMgUAu9opvQ
	(envelope-from <linux-gpio+bounces-38502-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 16:37:46 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E216873EB
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 16:37:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linaro.org header.s=google header.b=trZDIpWN;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38502-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38502-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linaro.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 98AE03000B9B
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 14:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7C933FA5E6;
	Mon, 15 Jun 2026 14:37:39 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E34A3F660B
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 14:37:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534259; cv=pass; b=S/PyHQ7NEef2SJGf80tfo6xQzFlrY73OuJxoZbX4prK/OZAPO/TjwbSxIerGZ14XpEEL3tDEKkC8RBxR1ScTeYeHewrK0MovNW03BZOUzEEdep7zIqjGrgAmn+K6nVqiRmlDMoATehRFGwXC28Sms7HFKP5s2ovpn7lJxEwo88A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534259; c=relaxed/simple;
	bh=4k2Mw99a5llfRvdMVuY0Q94wOPzpx+M3oiuPKHWHcyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GrLDwHLjoRvaLBROmeekYdrP4wY6DCLBIMvgaa6T88FpQ+n0SXFm6Qf9m/+Dy9rou3Vfy4RHCsMzX+zK4OFAkFJfAUV4+aB/gwCMwqzeEJPvtIqLkEVxeDZvKEwfLfzF4MeKas2s/YVGmCnP6GDXsTFBlhMMDjSnXKVTAw37DJg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=trZDIpWN; arc=pass smtp.client-ip=209.85.208.44
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-691c5776f35so5484965a12.3
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 07:37:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781534254; cv=none;
        d=google.com; s=arc-20240605;
        b=jDB6QSpI8gk6kQyTkRzVCbQ724ETSVbEYwmTN6pvXM4P0UQ33gtJuSvDPSyBa6TuOA
         XOoMY0rkPBynoWxG0BbUjmMptX5Jkoo4h1fnZ86iTvAiwk3ZgshqWzjZT6dwCVMLmxfp
         3HD/1I9fnAnoWtEI1Yk+BrYuJN/D9zhBf2TxmQNzVV3C5gG305k+PH11Z49Mz5kGK+X5
         unHzlEUhJXvmuqDtuUu2BIM9cbdMWnYyQLmaIraF25OAlJo/iqdnZ4mnrMgNb2MCk95Z
         9BML81p/+R2J5xjYe09fREVThkOiXQKWI5IRypzsF7s8pI25LXrJQinphaLhIAmJF3BQ
         H96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pNTgpeSODbW8fA2CiQ0TTKa3WB869mQ9r3APlwXpORg=;
        fh=/QFQ8ZbmrqSA/tObSIW7hQAgrfWNOu+/WIgH5OXeT0w=;
        b=ZEp38pol5rehjez7CPS+ofpbxowz9LApnYnLbvTaunVN/P1JrVS9TL2T3HuGDC1y7X
         noPON2uwewYsFNzq9F7mFjZfPA8yrPmr43jJ3vjqDC4EswtRY7sWE8FnbL5i5Dngd3m1
         VQyNuDUBDxoZPJ7QNE9KPwevO5RoJ0L4wEa8kLVg+aOr2YgtpmF1GZa/zBkBZVyhZXPi
         DLNBdrEOOoX+ztw3NwVO2ppiB/jiSa2436qX+mXQmp4bjyLyeNgol0MTDFs+7FQIDqbj
         HtDztYbGMeBFUx7WxZ5aqH8OTVsSyB2tC/19r2ip1MWH5F6qcawmAGmZ8hK+Ca9d9gCb
         wRCw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781534254; x=1782139054; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pNTgpeSODbW8fA2CiQ0TTKa3WB869mQ9r3APlwXpORg=;
        b=trZDIpWNF9siuoK2aPxp/ZmYsdhR+pnOZJuZAuin4sUCR8WHLi9AlMnRXpkXdbKopo
         XVOzRhUJOVqfpD0cyN+bO/a6K254tJGgsDYc68v2fw/foLQcCsBPDVchcsBjAiOIthVO
         Sub+dJ/nfGrx4Ih5uW+QTIwIdLXbfkvDDGGF71FF2QekZk6cis/VaMd/kz3agQbz9Kc8
         JHmnA/+XcAci+M5eMZ4hCpZd0AgONSUUZU1Vd24enqUEmBTqLbz9vQ6UETyOvD7qG35o
         0i0JKsmveQ0jIoyO7YttX3v/bg8O/XkIiU6qPyB7x7CS+fL1s48AxgUE+4bqNlc1pDNH
         e0Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534254; x=1782139054;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pNTgpeSODbW8fA2CiQ0TTKa3WB869mQ9r3APlwXpORg=;
        b=EHAWbHsP5tr08znqWfiOnZF3T2GY3Qh1TblcBE8BhxlSmzRjBPr30RRQ8CF23ociZs
         naWPp9xxPrUijzeD2Bsy8oU4EinHs0Umf5Jf0LoSufG9lajgXgny5in6ejKiGNB3sWx7
         Wo9Tfcof5t2/mlymyFhLDrjo8RvppoBQ0cH8OJb3HUiCqbvLMQUvi5MG8wcRJCujFflo
         e8Y5pxLSEQKJOn9QqnyGwyzNTyUyyJi7wpx+PU080Lawj4pWWl5csNPa3GL7BxHCV68f
         wgPy3r5XtwgAycniMQsRunMuALUQvrzaFZUJn25t00Fw8ANlbUpG7WDUrAwBTiq/a//8
         i4/A==
X-Forwarded-Encrypted: i=1; AFNElJ8JXv6rn/cdiXx8ZeuANP2qDPMjyQ5hGrCZX3U3cZm3mWm1LyR7DtQFum4ieBu6G9m76K3tPolkAfTt@vger.kernel.org
X-Gm-Message-State: AOJu0YwRpj0yOI/1J4MXPywcFFX57V7mZZFA5P4WfzXOKlUq09vZYzw0
	228AzQWQD5rk+4mNR0wpUiQBRd/l2mkf0rfMuzNgls3ibX4tEUI494i2mQnChGCFNO1GcWka5T7
	KRuiRWFYeS+SQLMMyrJC2iZO1LQJLGbygseGKsHM2AA==
X-Gm-Gg: Acq92OEYqlr38FcX70Kl+MSstrmqMnrFA2iquCnJ4Gt0OsQ/dN11oyvDzCW75oHkHZQ
	msbJAg6NW0BwQQsyALM+/Rq+rgpFTCQY53N0+PBj3ivUL75qhEl9iP3/r/zryIeuR+/hfYqNEWh
	gky+wUDPW8Nrbl9ROdBESvlp+86ix8HGIrg0rSLgtfFe/8R9Q2/Z/rC5ObuSsmRtHv5cDwmRsCP
	o9AKS80ZiRmLSFc2afc1UgobS2sCbQGlaG98eS8vOVvk4IUYvPrVUhuF5I9dt3PYHisrj6QAII8
	LbcGHjkOBX2FTLTfqCAZXa/fKRWZDTLofZGoCa7SiQ==
X-Received: by 2002:a05:6402:3509:b0:691:b129:6374 with SMTP id
 4fb4d7f45d1cf-693c6bb1155mr4076869a12.20.1781534253600; Mon, 15 Jun 2026
 07:37:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20260615083428epcas5p15eb83d4d631296cf4863e330542cd7dc@epcas5p1.samsung.com>
 <20260615085252.1964423-1-alim.akhtar@samsung.com> <20260615085252.1964423-5-alim.akhtar@samsung.com>
In-Reply-To: <20260615085252.1964423-5-alim.akhtar@samsung.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Mon, 15 Jun 2026 15:37:21 +0100
X-Gm-Features: AVVi8CdyAmDV3V1XLVdrgHm2SJuvGn45ObQOKAvV3zPFgvm4HNYd9FmG2O2s0Nc
Message-ID: <CADrjBPqS=d2Q02UhdpkSxHJ-RYe-hvurB-1meurTOLoUcUidFQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] arm64: dts: exynos: add initial support for
 Samsung Exynos8855 smdk
To: Alim Akhtar <alim.akhtar@samsung.com>
Cc: krzk@kernel.org, robh@kernel.org, conor+dt@kernel.org, linusw@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
	hajun.sung@samsung.com
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38502-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:alim.akhtar@samsung.com,m:krzk@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linusw@kernel.org,m:linux-samsung-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:hajun.sung@samsung.com,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[peter.griffin@linaro.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:from_mime,mail.gmail.com:mid,vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 87E216873EB

Hi Alim,

On Mon, 15 Jun 2026 at 09:34, Alim Akhtar <alim.akhtar@samsung.com> wrote:
>
> Add initial devicetree support for Samsung smdk board using
> Exynos8855 SoC.

I think it would be worthwhile adding a more verbose description of
the Exynos8855 SoC in the commit message e.g. a brief list of the
major IPs on the SoC.

>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
[..]
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> new file mode 100644
> index 000000000000..f5132bcaa47c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855-smdk.dts
> @@ -0,0 +1,32 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos8855 SMDK board device tree source
> + *
> + * Copyright (C) 2026 Samsung Electronics Co., Ltd.
> + *
> + * Device tree source file for WinLink's E850-96 board which is based on
> + * Samsung Exynos8855 SoC.

E850-96 isn't based on the Exynos8855 SoC. I guess it's leftover from
a copy/paste.

regards,

Peter



> + */
> +
> +/dts-v1/;
> +
> +#include "exynos8855.dtsi"
> +
> +/ {
> +       model = "Samsung Exynos8855 SMDK board";
> +       compatible = "samsung,exynos8855-smdk","samsung,exynos8855";
> +
> +       chosen {
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x80000000>;
> +       };
> +
> +};
> +
> +&oscclk {
> +       clock-frequency = <76800000>;
> +};
> +
> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> new file mode 100644
> index 000000000000..d403f41bbecb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> @@ -0,0 +1,199 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Samsung Exynos8855 SoC device tree source
> + *
> + * Copyright (C) 2023 Samsung Electronics Co., Ltd.
> + *
> + * Samsung Exynos8855 SoC device nodes are listed in this file.
> + * Exynos8855 based board files can include this file and provide
> + * values for board specific bindings.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +       compatible = "samsung,exynos8855";
> +       #address-cells = <2>;
> +       #size-cells = <1>;
> +
> +       interrupt-parent = <&gic>;
> +
> +       aliases {
> +               pinctrl0 = &pinctrl_alive;
> +               pinctrl1 = &pinctrl_cmgp;
> +               pinctrl2 = &pinctrl_hsi_ufs;
> +               pinctrl3 = &pinctrl_peric;
> +               pinctrl4 = &pinctrl_pericmmc;
> +               pinctrl5 = &pinctrl_usi;
> +       };
> +
> +       oscclk: clock-oscclk {
> +               compatible = "fixed-clock";
> +               clock-output-names = "oscclk";
> +               #clock-cells = <0>;
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu-map {
> +                       cluster0 {
> +                               core0 {
> +                                       cpu = <&cpu0>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu1>;
> +                               };
> +                               core2 {
> +                                       cpu = <&cpu2>;
> +                               };
> +                               core3 {
> +                                       cpu = <&cpu3>;
> +                               };
> +                       };
> +
> +                       cluster1 {
> +                               core0 {
> +                                       cpu = <&cpu4>;
> +                               };
> +                               core1 {
> +                                       cpu = <&cpu5>;
> +                               };
> +                               core2 {
> +                                       cpu = <&cpu6>;
> +                               };
> +                       };
> +
> +                       cluster2 {
> +                               core0 {
> +                                       cpu = <&cpu7>;
> +                               };
> +                       };
> +               };
> +
> +               cpu0: cpu@0 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x0>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu1: cpu@100 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x100>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu2: cpu@200 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x200>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu3: cpu@300 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a520";
> +                       reg = <0x300>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu4: cpu@400 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x400>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu5: cpu@500 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x500>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu6: cpu@600 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x600>;
> +                       enable-method = "psci";
> +               };
> +
> +               cpu7: cpu@700 {
> +                       device_type = "cpu";
> +                       compatible = "arm,cortex-a720";
> +                       reg = <0x700>;
> +                       enable-method = "psci";
> +               };
> +       };
> +
> +       psci {
> +               compatible = "arm,psci-1.0";
> +               method = "smc";
> +       };
> +
> +       soc: soc@0 {
> +               compatible = "simple-bus";
> +               #address-cells = <1>;
> +               #size-cells = <1>;
> +               ranges = <0x0 0x0 0x0 0x20000000>;
> +
> +               gic: interrupt-controller@10200000 {
> +                       compatible = "arm,gic-v3";
> +                       #interrupt-cells = <3>;
> +                       interrupt-controller;
> +                       reg = <0x10200000 0x10000>,
> +                             <0x10240000 0x140000>;
> +                       interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +               };
> +
> +               pinctrl_alive: pinctrl@11850000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x11850000 0x1000>;
> +
> +                       wakeup-interrupt-controller {
> +                               compatible = "samsung,exynos850-wakeup-eint",
> +                                            "samsung,exynos7-wakeup-eint";
> +                       };
> +               };
> +
> +               pinctrl_cmgp: pinctrl@12030000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x12030000 0x1000>;
> +               };
> +
> +               pinctrl_usi: pinctrl@15030000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x15030000 0x1000>;
> +               };
> +
> +               pinctrl_peric: pinctrl@15440000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x15440000 0x1000>;
> +               };
> +
> +               pinctrl_pericmmc: pinctrl@154f0000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x154f0000 0x1000>;
> +               };
> +
> +               pinctrl_hsi_ufs: pinctrl@17040000 {
> +                       compatible = "samsung,exynos8855-pinctrl";
> +                       reg = <0x17040000 0x1000>;
> +               };
> +       };
> +
> +       timer {
> +               compatible = "arm,armv8-timer";
> +               /* Hypervisor Virtual Timer interrupt is not wired to GIC */
> +               interrupts =
> +                    <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                    <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                    <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +                    <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +       };
> +};
> +
> +#include "exynos8855-pinctrl.dtsi"
> --
> 2.34.1
>

