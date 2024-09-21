Return-Path: <linux-gpio+bounces-10329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F8797DB0F
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2024 02:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F464283B02
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Sep 2024 00:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2B023BE;
	Sat, 21 Sep 2024 00:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSoK4n68"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF59E15C3;
	Sat, 21 Sep 2024 00:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726879967; cv=none; b=qpLPRwQo6SDnoYfx+IxchD/N3rMgy6WYJCH3DhVb327/ok1vslnYrnkDI3E4s8jYLWoWjImKpRT7zk6JqA0axt1xhM3dvi44VSPzVmOeNpUUmRpZo9EMEq5nj81DfTdJDu466xqD+BQdN8vKXCSRUcopuv+Wg1bKxoqQzPPVdeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726879967; c=relaxed/simple;
	bh=Ew4IcMCEa8YzyxrVwkXd+y/Nq+B0O5bzEquyaZoikgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fSZBCvKImaNU2YAcf/vuKhKjREFR6BByr4qvXpnaQAi2N+fG6TR8gO/HR4V106GClOevsWjoLQXO57JRC3zIsF9lL6tj3uhuZTniI/Czp6lc226pTx7JVY655+hQndUSJ9qikYJi0G19Zg3uy0CsvAQHX5FIMbN2aNlEYpI171A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSoK4n68; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1DEC4CEC3;
	Sat, 21 Sep 2024 00:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726879966;
	bh=Ew4IcMCEa8YzyxrVwkXd+y/Nq+B0O5bzEquyaZoikgM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSoK4n68mb6GjY/LyqV67r3PQRcQypBSo/NljlG18Oq5RoxyH4/sszulryAkIqVB9
	 Fi7lZVmH6hx//DPBp0v6qlDA83EyXzaeYx3AaxTiM9HzxmD/ZVP3TY9+Q+Og5oBqC5
	 Q8vQavEhHSaL6g2xFOs+aekyXpf6D8LVlHJkWt3y1VOYq54pFbHb1d9QcEvYAptWw8
	 lGw+lSjirlGvgnXqXA+iZNRKYmgPGKrVuz/ZXDJ9bTa7M063+o3vkKO2/VayY0baFd
	 tkLsAWjQeaejMPIb32iHV7vMQuWpIQa0JDY5qaV7pgW8BsDBoqqLF53DmvYf8Pqu7v
	 z+2fu7fTARfrQ==
Date: Fri, 20 Sep 2024 19:52:45 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Allow
 'input-schmitt-{enable,disable}' and 'drive-open-drain' properties
Message-ID: <172687996507.184385.8256447340209726726.robh@kernel.org>
References: <20240918120909.284930-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240918120909.284930-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240918120909.284930-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Wed, 18 Sep 2024 13:09:07 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On the RZ/V2H(P) SoC we can configure the 'input-schmitt-{enable,disable}'
> and 'drive-open-drain' of multiplexed pins. Update the binding
> documentation to include these properties.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


