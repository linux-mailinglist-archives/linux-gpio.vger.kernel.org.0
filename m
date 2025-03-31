Return-Path: <linux-gpio+bounces-18123-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AABAA767B7
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 16:21:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B6560169B87
	for <lists+linux-gpio@lfdr.de>; Mon, 31 Mar 2025 14:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83C7D213E8E;
	Mon, 31 Mar 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uP9GrF4h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C601D618E;
	Mon, 31 Mar 2025 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743430888; cv=none; b=Mce0htm2RLXZTm9uiWY5pOCc6PxwBWTtAKFVmmStz0z8V+nmywOmdR7SpleZKO6n8HCRxkwBv4yYk1mxLwuERP0vjbaoxd0QwnPuIUOPzWLQ2fHntmltcgpoHexb34A2hYFCeCur0viacjUv8n1uLSgKUgzc+osSzF3GTZaQOxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743430888; c=relaxed/simple;
	bh=0Pm6SE1CsM5OheYKnhI6q5puoPhrV1EB/nOjRx65ljg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fnOYuA9t/VZSRHKkXgA4GT08eFVM+Gi79cpj/0tHwuB4pxhFHmCh1Y0KzwJs9ocdx9NUHJ6/LdGLEh6lTmIx1iblxidgYFlN65Sq5Kt6/Y1RrZTWBRqK9O3AHDfez0l4l3UcjiO/eGxxCklFHpYTgpnBIlYMtyPws0xF1yAUw8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uP9GrF4h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6C1C4CEE3;
	Mon, 31 Mar 2025 14:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743430888;
	bh=0Pm6SE1CsM5OheYKnhI6q5puoPhrV1EB/nOjRx65ljg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uP9GrF4hFSGPfkkBoTvOAXueutIGYi8ah4rJdpAbjPgySADVmfnn2TNtrRIqBt56w
	 2ZB7W/kAqMGaPkQr86mRj2J8d8LXuYNnJmiUnnwQV184Cr9jdv0IYjPebQ3vJFYpVG
	 8gzWdPZsEmbBdjA0tRhbKXxoK0GF3L0QR9loq6ZlBNC6bmNNhCBtoOuOyI6JSReGDu
	 pClgCw8r3WdQGXEGRxt630DjE8JrKdAJRAsmX4zu2dgM/Bg6V/3Io9sA7ZqW+Wv08C
	 c26PSA1pnsqnZPv2+X9RR10U5DYuV1VrAUgztgPWMsjgFFUdW3nJmNIcrRj1TJlKWw
	 mV/hbOFIqRTTQ==
Date: Mon, 31 Mar 2025 09:21:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: linux-serial@vger.kernel.org, Will Deacon <will@kernel.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-mmc@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Magnus Damm <magnus.damm@gmail.com>, linux-kernel@vger.kernel.org,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Michael Turquette <mturquette@baylibre.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 06/15] dt-bindings: serial: renesas: Document RZ/V2N SCIF
Message-ID: <174343088454.2718898.2281236440720595243.robh@kernel.org>
References: <20250326143945.82142-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250326143945.82142-7-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326143945.82142-7-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Wed, 26 Mar 2025 14:39:36 +0000, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Document SCIF bindings for the Renesas RZ/V2N (a.k.a R9A09G056) SoC.
> The SCIF interface in Renesas RZ/V2N is identical to the one available
> in RZ/V2H(P), so `renesas,scif-r9a09g057` will be used as a fallback,
> allowing reuse of the existing driver without modifications.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  Documentation/devicetree/bindings/serial/renesas,scif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


