Return-Path: <linux-gpio+bounces-23121-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AA838B014D0
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 09:38:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 066905A1B83
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Jul 2025 07:38:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C09E1EFFBB;
	Fri, 11 Jul 2025 07:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EJ21gcZ6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B051DDC15;
	Fri, 11 Jul 2025 07:37:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752219476; cv=none; b=pTFmFka84srtCFv4b8wrOZy4YCguR0LQwdtjtcznxY3qGA4RT18saxmNQy8JLvUOnk9qIyIaH+pU69majbRJ00TjSi5Tq+0sLHXWf7MxkMDH8OrSMuZPqPvDterZoPMfGkMiwlFXU2OBkrg3DV7Idsakw8hV7CPFH655W7eF5AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752219476; c=relaxed/simple;
	bh=hlaTSOfwU5t5uUBJH15EMSZMX/iXkdPXO1i1im6HrmY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rs3WQ5M9MndK/M8iEeg3IqooURpmFbeNmlX1mEhFclb8o7SX6A1p/2eIjKX3Q0RpoA4Q3NhZAVk8YaZ1v+Q38PQxHEe+tuCID++9TRcEHEq/mbGWVpYT6SaPVJpiJ4bnjTsa4hs58clQSo2MZcocV+IF/GHebjGqVg/Q7L/zRcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EJ21gcZ6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF13BC4CEED;
	Fri, 11 Jul 2025 07:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752219476;
	bh=hlaTSOfwU5t5uUBJH15EMSZMX/iXkdPXO1i1im6HrmY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EJ21gcZ6wG8Uj0HdA04vOksRm0n2/UU4SoJfCNz3NmrhNV24uv9zxFXii8sKLVNsF
	 m5Rh6w1zUQTpkVJ9HyCfSpFEmRrTJVXUQf2AAAe1P/5dPD6/o8wXhhcVJ5eZ/FoMn4
	 Fq52ac5fiXga0CofTseD3XacSQs3FADD8hmgVHT+KSbm57/u9WPDrCT4uqguPk0GL1
	 t54Z43UWfWMTQthbWjWwB1DmU/bNbVU7t9TN+FKgVqAlpikG0MggjHm8/UNFEN3jaR
	 YIVdQs0LoW+Qz4ZCcItWXfbs9tcjH136a6cOD+VlNjHO7BrcZWtpUPWucg66dF69hS
	 rGyIlMUNsP1DA==
Date: Fri, 11 Jul 2025 09:37:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, chester62515@gmail.com, mbrugger@suse.com, 
	Ghennadi.Procopciuc@nxp.com, larisa.grigore@nxp.com, lee@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, aisheng.dong@nxp.com, ping.bai@nxp.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, srini@kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, s32@nxp.com, clizzi@redhat.com, aruizrui@redhat.com, 
	eballetb@redhat.com, echanude@redhat.com, kernel@pengutronix.de, imx@lists.linux.dev, 
	vincent.guittot@linaro.org
Subject: Re: [PATCH v7 01/12] dt-bindings: mfd: add support for the NXP SIUL2
 module
Message-ID: <20250711-lean-burrowing-jacamar-38fcc5@krzk-bin>
References: <20250710142038.1986052-1-andrei.stefanescu@oss.nxp.com>
 <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710142038.1986052-2-andrei.stefanescu@oss.nxp.com>

On Thu, Jul 10, 2025 at 05:20:24PM +0300, Andrei Stefanescu wrote:
> +        properties:
> +          bias-disable: true
> +          bias-high-impedance: true
> +          bias-pull-up: true
> +          bias-pull-down: true
> +          drive-open-drain: true
> +          input-enable: true
> +          output-enable: true
> +
> +          pinmux:
> +            description: |
> +              An integer array for representing pinmux configurations of
> +              a device. Each integer consists of a PIN_ID and a 4-bit
> +              selected signal source(SSS) as IOMUX setting, which is
> +              calculated as: pinmux = (PIN_ID << 4 | SSS)
> +
> +          slew-rate:
> +            description: Supported slew rate based on Fmax values (MHz)
> +            enum: [83, 133, 150, 166, 208]
> +        required:
> +          - pinmux
> +
> +        unevaluatedProperties: false

I noticed Frank's comment and he pointed out that this changed, so all
':true' lines before should be removed as well.

Best regards,
Krzysztof


