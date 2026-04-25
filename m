Return-Path: <linux-gpio+bounces-35522-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG2yFUqX7Gn2aAAAu9opvQ
	(envelope-from <linux-gpio+bounces-35522-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 12:28:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 046BE465E6A
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 12:28:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E9F16300FC57
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Apr 2026 10:28:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1A1E394789;
	Sat, 25 Apr 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NG5qN5p1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFA5392C2C;
	Sat, 25 Apr 2026 10:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777112899; cv=none; b=dmavtmVk/3IHcc7f5EYcdx4GHq8WxoVWtfKMJnaOxn0GO9zW62u+KuaUgvb9KJ4pSi2gpBwrN5dqz3B0NjoMkKjpi+6UzxfzHR6Z4szz4vsOonR1/q7SgFm2rvvTFpV8jyTG10l109qpzPhNS0QX99OPC+uOXCnMUC0jSAW5uUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777112899; c=relaxed/simple;
	bh=WlYDlFfUUzFaRHeGD4iH6v+lOpnT6yZ/E73ow4hkmvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gzebeSvNJN3GmOtUL73at3ZEsxA2XydMNFoHIISAw8bAYF9SONXynftYJruMxKAHN/hDaINuBCDqHycZ0f+eco8+0JNZS2Lk5PqYrKRfMDaBEo8GZmPXHY97EF5X+NDEevLtFNzUkY2gIU8ISWUQ3Q5ktSREIH3d7UrLbNrq8cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NG5qN5p1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 609B2C2BCB0;
	Sat, 25 Apr 2026 10:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777112899;
	bh=WlYDlFfUUzFaRHeGD4iH6v+lOpnT6yZ/E73ow4hkmvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NG5qN5p1YOXTbi8hrAatRnVtI9aDmhk1wURWmX+P/VtTeHp3J2OaeET1sF8r5oSkL
	 HKNj2Fga+ghyFspQOtAJVd7AiX/tr4J+bmDJVRDkl57yOCz060IQp0ZrYRgE6EfPcU
	 tOOJBPQVlm6zD/g2nkRuumH+NwWyip0yk1faFpkqQxq4KqXB5CfWYQvj5Nlj4Sbhcj
	 3p8+bahZJItL2yYREYmM+rCFneP5rcvE2XVTTAuYl0v5qRhAQeG0eqhFDDcqs6qBhW
	 uke4r2M7WrsmbOhKB+jYKL6e8CKmW78yWmsyvDK8I6/77+yCZRmGJzIUXvxIyHK05L
	 D/BfE+q20oq1A==
Date: Sat, 25 Apr 2026 12:28:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 07/20] dt-bindings: pinctrl: Add
 starfive,jhb100-sys2-pinctrl
Message-ID: <20260425-excellent-radiant-weasel-9f99be@quoll>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-8-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260424111330.702272-8-changhuang.liang@starfivetech.com>
X-Rspamd-Queue-Id: 046BE465E6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35522-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Fri, Apr 24, 2026 at 04:13:17AM -0700, Changhuang Liang wrote:
> +description: |
> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0, per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> +  This document provides an overview of the "sys2" pinctrl domain.
> +
> +  The "sys2" domain has a pin controller which provides
> +  - function selection for GPIO pads.
> +  - GPIO pad configuration.
> +  - GPIO interrupt handling.
> +
> +  In the SYS2 Pin Controller, there are 37 multi-function GPIO_PADs. Each of them can be
> +  multiplexed to different hardware blocks through function selection. Each iopad has a maximum
> +  of up to 4 functions - 0, 1, 2, and 3. Function 0 is the default function which is the GPIO
> +  function. Function 1, 2, and 3 are the alternate functions or peripheral signals that can be
> +  routed to the iopad. The function selection can be carried out by writing the function number
> +  to the iopad function select register.
> +  Each iopad is configurable with parameters such as input-enable, internal pull-up/pull-down
> +  bias, drive strength, schmitt trigger, slew rate, and debounce width.
> +
> +  This domain contains an IO group which support voltage levels 1.8V and 3.3V
> +  1. gpiow - comprises PAD_GPIO_A36 through PAD_GPIO_A39.
> +  2. gpiow-inner - comprises PAD_GPIO_A40 through PAD_GPIO_A43.
> +
> +  This IO group must be configured with a voltage setting that matches the external voltage level
> +  provided to the IO group.

Wrap at 80.

Please wrap code according to the preferred limit expressed in Kernel
coding style (checkpatch is not a coding style description, but only a
tool).  However don't wrap blindly (see Kernel coding style).

Best regards,
Krzysztof


