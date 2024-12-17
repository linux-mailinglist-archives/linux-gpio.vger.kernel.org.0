Return-Path: <linux-gpio+bounces-13930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A14F9F43BC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 07:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6517616975F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 06:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDBA515B971;
	Tue, 17 Dec 2024 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OUMxiIZG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6299F12C7FD;
	Tue, 17 Dec 2024 06:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734417109; cv=none; b=MjtxvB9USN3n4pi0xSbHL8KF6mwRatTv655+83UoCkOl/6FymD87KIRNO7iRIvpT5vqRllIFNF5JDHInbGPEK9HX2j8ccrNnBw6b8z0sSI/c9J8oIX7k5y6QPZtZsUhEWhq1PSaOKFkkm3CYiI1f4HdUO/cXosjD5ITJiNYBxKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734417109; c=relaxed/simple;
	bh=NYrIXrnNTS8K3Y788wp3cL/GpZfjjem17AfwHbJKXMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SeGtMEXY1eSCCa5Gb6pu7IVMqKSDRpeSoS3rN6KDDnjtQastje8gLGiqU2HvFsW/Srj/SzqmftG3IkMW0obfIPjDOXSqCG717a73X22kyfPEPVVuUZ1dK5dXb1uBgyDpVbDnD4hzEHYP5LT2WYnXBqXYub5kiP4N5Hd4Lc6RZmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OUMxiIZG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44F36C4CED3;
	Tue, 17 Dec 2024 06:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734417108;
	bh=NYrIXrnNTS8K3Y788wp3cL/GpZfjjem17AfwHbJKXMI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OUMxiIZGiphf5wD6HN/AiybrIkiWAxX+U8lLnN56DFYMdQhb/CCER4M38y/U8UDdb
	 GXDNh0RZmzFjoawTS6D2NXNC7WgIinqzSP2sFuMElI7WJ4d8NNFbIwlWhJyb/IjF5K
	 +qDbfrWEcqWrw0bhJDYcQFF6zo1G3kOwDL8+smIbPxrUyVKNFK6yKbhRBJQKcEfgRQ
	 huHxM+EhT24OmEvo5Npox8IEHdobxi9zg1pulmjbuxSLPc1H51dXVtc195VPRqDRv5
	 CnGr+P7P7PWmwlAGk00szdzM1K/ihf7Kuw9fQozuOn7MKq7GXHE4rjAFi9pUpwPP1V
	 OOETAXqHSPj5A==
Date: Tue, 17 Dec 2024 07:31:46 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 1/7] dt-bindings: pinctrl: renesas: Add
 alpha-numerical port support for RZ/V2H
Message-ID: <fq3q2tk3xfwd4p72b5wzo3gbfizrknxdt6zyc5ahm2cpnrtsbk@nlukbj3yy57c>
References: <20241216195325.164212-1-biju.das.jz@bp.renesas.com>
 <20241216195325.164212-2-biju.das.jz@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241216195325.164212-2-biju.das.jz@bp.renesas.com>

On Mon, Dec 16, 2024 at 07:53:11PM +0000, Biju Das wrote:
> RZ/V2H has ports P0-P9 and PA-PB. Add support for defining alpha-numerical
> ports in DT using RZV2H_* macros.

So this is only for DT? Not really a binding. Binding binds
driver implementation with DTS and you do not have here driver.

Calling it a binding makes it immutable and gives us, DT maintainers,
more work, so really no benefits at all.

I guess other DT maintainers will ack it, I prefer to reduce number of
headers.

Best regards,
Krzysztof


