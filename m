Return-Path: <linux-gpio+bounces-34999-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJN6BFLa2GnHjAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34999-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:09:06 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 84FB93D5FC3
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 13:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 26B693051C9B
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 11:04:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B363B52FD;
	Fri, 10 Apr 2026 11:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m674Ppac"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDDE3B4EA1;
	Fri, 10 Apr 2026 11:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775819056; cv=none; b=ox34cfHxtPoM8qMucipfHL1ITdFR1ENUw2jcBeYdKn722jVMsERuoKMH7NWH0yL8AiGgMPb3E2DSe0XWzEZRS/3XWkAaN2vUnYaGAymJIllGMsjX1rdVoxa/6q1Rq9rQgAdpt1Phf8z2YtBVDZkAGokLt1f5fSswEN9XcsbHCR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775819056; c=relaxed/simple;
	bh=eI3yZtBifn+Tvm3XHt8F66yFfF+QddglqdQ5u1Nyc8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZLXK9UKTHMKv+kLKNnWM5zArge62MmC/eG4WtyCEHNvH+sKJG4/HF3KOAcgXqE5hu0UA7/fHrNVJQmuZUSHsbpHbUChANczjS76oP3bIdQfr6sNWaDcfvdSSGBUD2BcWVPeOWfizOkeIFW7mgrlFNsh6Ituv2/VzjsKHbsVWWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m674Ppac; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAB3BC19421;
	Fri, 10 Apr 2026 11:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775819056;
	bh=eI3yZtBifn+Tvm3XHt8F66yFfF+QddglqdQ5u1Nyc8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m674PpacO0txBkhs7bOnAMp06TF5P5bm9vZss9AyXFfYJ7WUsDnmWdgO+oItucsWN
	 U97kU0JhVZlTTEVvSMboWYuH6aOiEGGnMmrbR3oaWDJcxBaXM1gdLeG0UL1YI8tvpT
	 tAhIsoE3FVu0IUihu2MrFjmxcBgdvbFQddeDoBLjNtaZI4fmhJ/X2IuCwfeH7phMZ8
	 G6KVijfMMFWxqQuaPzbyDBx8FC5n6N307pQWLNrx+MlLt+uEyAUTZfoM1M3A4BjkNc
	 kHsDkCLYJ+YO/x3UrkJZYltYslthoZ6Vg9AdDMe+Z70XiCD6m0XqfYi/1GHPvx80rh
	 x5Iw8L261CmVQ==
Date: Fri, 10 Apr 2026 13:04:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: pshete@nvidia.com
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de, 
	bjorn.andersson@oss.qualcomm.com, conor+dt@kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
	ebiggers@kernel.org, geert@linux-m68k.org, jonathanh@nvidia.com, krzk+dt@kernel.org, 
	kuninori.morimoto.gx@renesas.com, linusw@kernel.org, luca.weiss@fairphone.com, 
	michal.simek@amd.com, prabhakar.mahadev-lad.rj@bp.renesas.com, robh@kernel.org, 
	rosenp@gmail.com, sven@kernel.org, thierry.reding@kernel.org, 
	webgeek1234@gmail.com
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: Document Tegra238 pin
 controllers
Message-ID: <20260410-offbeat-thistle-tuatara-cb1c1a@quoll>
References: <20260409131340.168556-1-pshete@nvidia.com>
 <20260409131340.168556-3-pshete@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260409131340.168556-3-pshete@nvidia.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34999-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,arndb.de,oss.qualcomm.com,kernel.org,linux-m68k.org,nvidia.com,renesas.com,fairphone.com,amd.com,bp.renesas.com,gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_TWELVE(0.00)[23];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: 84FB93D5FC3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 01:13:36PM +0000, pshete@nvidia.com wrote:
> +      properties:
> +        nvidia,pins:
> +          items:
> +            enum: [ bootv_ctl_n_paa0, soc_gpio00_paa1, vcomp_alert_paa2,
> +                    pwm1_paa3, batt_oc_paa4, soc_gpio04_paa5,
> +                    soc_gpio25_paa6, soc_gpio26_paa7,
> +                    hdmi_cec_pbb0,
> +                    spi2_sck_pcc0, spi2_miso_pcc1, spi2_mosi_pcc2,
> +                    spi2_cs0_pcc3, spi2_cs1_pcc4, uart3_tx_pcc5,
> +                    uart3_rx_pcc6, gen2_i2c_scl_pcc7,
> +                    gen2_i2c_sda_pdd0, gen8_i2c_scl_pdd1,
> +                    gen8_i2c_sda_pdd2, touch_clk_pdd3, dmic1_clk_pdd4,
> +                    dmic1_dat_pdd5, soc_gpio19_pdd6, pwm2_pdd7,
> +                    pwm3_pee0, pwm7_pee1,
> +                    # drive groups (ordered PAA, PBB, PCC, PDD, PEE)
> +                    drive_bootv_ctl_n_paa0, drive_soc_gpio00_paa1,
> +                    drive_vcomp_alert_paa2, drive_pwm1_paa3,
> +                    drive_batt_oc_paa4, drive_soc_gpio04_paa5,
> +                    drive_soc_gpio25_paa6, drive_soc_gpio26_paa7,
> +                    drive_hdmi_cec_pbb0,
> +                    drive_spi2_sck_pcc0, drive_spi2_miso_pcc1,
> +                    drive_spi2_mosi_pcc2, drive_spi2_cs0_pcc3,
> +                    drive_spi2_cs1_pcc4, drive_uart3_tx_pcc5,
> +                    drive_uart3_rx_pcc6, drive_gen2_i2c_scl_pcc7,
> +                    drive_gen2_i2c_sda_pdd0, drive_gen8_i2c_scl_pdd1,
> +                    drive_gen8_i2c_sda_pdd2, drive_touch_clk_pdd3,
> +                    drive_dmic1_clk_pdd4, drive_dmic1_dat_pdd5,
> +                    drive_soc_gpio19_pdd6, drive_pwm2_pdd7,
> +                    drive_pwm3_pee0, drive_pwm7_pee1 ]
> +

And missing required. I'll also fix existing ones.

> +unevaluatedProperties: false

Best regards,
Krzysztof


