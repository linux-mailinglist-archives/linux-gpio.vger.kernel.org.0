Return-Path: <linux-gpio+bounces-12133-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DF4659B17ED
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 14:19:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 950DD1F2240F
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 12:19:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2627A1D5ACE;
	Sat, 26 Oct 2024 12:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhCwQ+Wv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7AA1D2F50;
	Sat, 26 Oct 2024 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729945134; cv=none; b=RBSP6HcY7fUS+DmZGOkoLEXZjGgrckCUwUmTEewSOLvXzHo5vq2AbDHY5pZ9NwryJoTF2Xyr+DLyhjcIy/iZr+6+PXSClUj8bGlHFh93z7tEXvx6tdSfsqME7adTYFR8Tk+mVX0Ncoo/m6Q1XpA5zE4H2d2dvFqJ47bgdd/YaPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729945134; c=relaxed/simple;
	bh=Puqn0sjtF8hvWJ7T+g8tK0oVrEl1m4uPOE9f4EjtbLw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JWuduaH3XuluvNqRn9MyxhmpmvgY+8E/p8wnfnx+w9tg7lUgf8ocptYbBBEciL9d1fQlCe1YpJL2zFkG9/RWzNnb/LHFTk2K0jFsYVMYzUcUTJiFGRAlb2hvt+Scb7yuhuMQpezAlBWPI3sPl6WktjzZcsfm4SBdD1VQwxTIZyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhCwQ+Wv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672EFC4CEC6;
	Sat, 26 Oct 2024 12:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729945134;
	bh=Puqn0sjtF8hvWJ7T+g8tK0oVrEl1m4uPOE9f4EjtbLw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhCwQ+WvFquoYJL0klaU4J3OlIAd5bzL9tSbKNAWDdMcQ7NHBkjD10907P9So1G5b
	 lmsDWX6mmCF+BhshpAgg4xBTQXUN7sIn2PDQMTltwWSCSDCUfZR3ITf0tsovFndmSG
	 IGtt9BA+ViW1UjnORx3Zu0t7wTSaIPy8Qe6nN33kaxI0bS+WEJU88l+yfoQoPDkS9K
	 klr5vkWgG4aJXeA//BxWhDkMxPUj3Qr5p4IjwlqNuSzTSy7NhFjn+kJemWUjWzq/Vn
	 3k3RunD1idt2kNSnw/OmFUc9tnQFNOUIQmj9pTSR4VjQ9YAU1AvIA/v7Ng2o+zAVHe
	 rIKnVmtZ/OP5A==
Date: Sat, 26 Oct 2024 14:18:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	tarang.raval@siliconsignals.io, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Message-ID: <usqmeunejf44l6wjw67ocv4idyxfpw5ivt5v4hqkputd7d7xsk@3ies2iwutzsz>
References: <20241024124654.26775-1-himanshu.bhavani@siliconsignals.io>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241024124654.26775-1-himanshu.bhavani@siliconsignals.io>

On Thu, Oct 24, 2024 at 06:16:18PM +0530, Himanshu Bhavani wrote:
> +  pinmux:
> +    type: object
> +    properties:
> +      pins:
> +        description:
> +          The list of GPIO pins controlled by this node. Each pin name
> +          corresponds to a physical pin on the GPIO expander.
> +        items:
> +          pattern: "^gpio([0-9]|[1][0-5])$"

Since I expect resend, correct also quotes - use consistently either '
or ".

> +        maxItems: 16
> +
> +      bias-pull-up:
> +        type: boolean
> +        description:
> +          Configures pull-up resistors for the GPIO pins. Absence of this
> +          property will leave the configuration in its default state.
> +
> +    required:
> +      - pins
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    i2c {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mcp23018: gpio@20 {
> +            compatible = "microchip,mcp23018";
> +            reg = <0x20>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +
> +            interrupt-parent = <&gpio1>;
> +            interrupts = <17 IRQ_TYPE_LEVEL_LOW>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            microchip,irq-mirror;
> +        };
> +    };

Drop this example.

> +
> +  - |
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mcp23s17: gpio@0 {

Drop unused label

> +            compatible = "microchip,mcp23s17";
> +            reg = <0>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            spi-max-frequency = <1000000>;
> +            microchip,spi-present-mask = /bits/ 8 <0x01>;
> +        };
> +    };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +
> +    i2c {

Keep one complete example for i2c and one for spi. This was not in
previous patch and changelog does not explain why you need three
examples.

> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        mcp23017: gpio@21 {

Drop unused label

Best regards,
Krzysztof


