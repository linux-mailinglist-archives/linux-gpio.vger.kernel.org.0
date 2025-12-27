Return-Path: <linux-gpio+bounces-29946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BAF59CDFC81
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 13:59:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5F06A300C2A6
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Dec 2025 12:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A70DE31AF0A;
	Sat, 27 Dec 2025 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3tfka+8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D70B3164BF;
	Sat, 27 Dec 2025 12:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766840334; cv=none; b=Spjri9JQ9WtVsrYQEV5MzG9t6Nl0S6J55f9EKY65odKupcl2SW7BGu2TQRZ9jE3ZjKmDxcseLk7UZwCMVjS8g0LEaoM7sYme5/amVa8Ebm1oyaKhrAC7wUHLvM6lj0+rHPu5kUuiOcxP+KtbP232cBt+iDR/ub7Ja/D0CE6xxEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766840334; c=relaxed/simple;
	bh=k4FB5zVKTKqkWa9q1H2Dj2JT2mpBhRONcOMtrdXSqvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o6/0jHTfmuuyc2z6FjnBpVDhm2zvQzXmDsgAnIu2hyMIZ/DuuIuMjvZii38pXUrA1ufKe3Tiz+vtgPn6kuRCC/Tne2uudoq2km30gJDwMMfRKWCJ5ANZ8O0ARwvkxjirGreJKdQcQyZFNGzrBnaR7CZ4jvneX7isZDrKDDqly3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3tfka+8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D75D5C4CEF1;
	Sat, 27 Dec 2025 12:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766840334;
	bh=k4FB5zVKTKqkWa9q1H2Dj2JT2mpBhRONcOMtrdXSqvo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3tfka+8fd5bfBRBJw4GDpHKx+C9QZYi1/1GeoC0lJDaWrWmz2VbKlF6Dh5Gbmxt3
	 zFQRB5XBreiQvlF+27l6rjI3wh4CZq3vneXmiIaSEH5dHmX2IIdtfKUOEy/04LSQnw
	 JzJA2jc1HLPsmmx8IC/WMYAzGRJLiGM+T/sNtiUGc8eG9hb1kRLXhyAlRgCZ/BGfGA
	 h/HbRz8vyBaJrY/NTTMoR2ovlKY1sbXNHYeoBFV/Ixxj0Ase55sFq/pqomiSrhtaOe
	 hlthOFUkZc5w/rXIcge7f5zzB6ze7sPtrIVA+g0Xx0wkP/qYJjgMB5bC2aYOChjeJl
	 PEgXCD6uSt8og==
Date: Sat, 27 Dec 2025 13:58:52 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add syscon property
Message-ID: <20251227-lavender-turkey-from-camelot-ab6aec@quoll>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-1-5f1090a487c7@linux.spacemit.com>

On Tue, Dec 23, 2025 at 05:11:11PM +0800, Troy Mitchell wrote:
> In order to access the protected IO power domain registers, a valid
> unlock sequence must be performed by writing the required keys to the
> AIB Secure Access Register (ASAR).
> 
> The ASAR register resides within the APBC register address space.
> A corresponding syscon property is added to allow the pinctrl driver
> to access this register.
>

Also:

Please use subject prefixes matching the subsystem. You can get them for
example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
your patch is touching. For bindings, the preferred subjects are
explained here:
https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

You are not adding syscon to all pinctrls.

Best regards,
Krzysztof


