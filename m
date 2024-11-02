Return-Path: <linux-gpio+bounces-12483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 64AC49B9DFA
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 09:49:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 310AD282ECF
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Nov 2024 08:49:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36911158866;
	Sat,  2 Nov 2024 08:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PTCJt3dg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC3C0136351;
	Sat,  2 Nov 2024 08:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730537350; cv=none; b=iN0Hu+jwcDJ9LxiPK6J2kHSkDOOjnSMrzQLsXDYbIl79txDqnr8X5L0XuPf6RPRRqsDCwhQamubLPKpUeg1fgHV84PDHEc/thxPtKXFYABqttLN9t72ePVPe7zHPXyvO3pDY4T7+gXS+SFJ5jPZjgw0RYcE9HgiVQiyrmF/Xyg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730537350; c=relaxed/simple;
	bh=ohhxWzZ1zwvYOUMLeaWV1CJbrqCDqjWUe6fdh6HWYns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y+UGVUfBWcisoVW9rEGJyXF1sySAPEsFYuz0Q/5F9wwL3d4in5PC90J4GUz22AXSFuTsuWabEXldZ/3k2bJuUAYUIqC8K6qOfYYG7LOUehE04jq1K6A1KFx62b8B2Cad/BsYyZi3w58ja5RrIflCOXz3QYCLhUXpqII8f2rQ4iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PTCJt3dg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12214C4CEC3;
	Sat,  2 Nov 2024 08:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730537349;
	bh=ohhxWzZ1zwvYOUMLeaWV1CJbrqCDqjWUe6fdh6HWYns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTCJt3dgQqDpl7NlwA1OQTkv/6Qa6X7vj8XbaMyhlKA0LGw32HC3u+RmbtWOYFn8x
	 rgR/WduMjvOHdtv+SeMckXYNFsb+FcWpr4UxGji8gNfGNQioWlc9M93/hAzYB6pHpg
	 Fnt/P4PGStrfA08dr7FttUqY/aywKEtlZo/paLINFUkyd7rukA6DcNAOMG39vRrOoO
	 efr57WsMKxeFD6YdPVy6xFc5KwNo0BQK95rjD3eHSIa3BrX0D5gulks6ZPtF4QG9ep
	 KCe1OBpOWZe4XbGFXly8EoRA0HuWb0UZgjrjBZexF+s2V7jEwUlUikMlugP1TcnoYy
	 Xx0qei7NGOT5Q==
Date: Sat, 2 Nov 2024 09:49:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
	Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>, Larisa Grigore <larisa.grigore@nxp.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, NXP S32 Linux Team <s32@nxp.com>, 
	Christophe Lizzi <clizzi@redhat.com>, Alberto Ruiz <aruizrui@redhat.com>, 
	Enric Balletbo <eballetb@redhat.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	imx@lists.linux.dev
Subject: Re: [PATCH v5 3/7] arm64: dts: s32g: make pinctrl part of mfd node
Message-ID: <cmisbftf7kep5ztc3sttiv22iypkaizvziy3q7l3xstqvltjpw@h24boozxaydc>
References: <20241101080614.1070819-1-andrei.stefanescu@oss.nxp.com>
 <20241101080614.1070819-4-andrei.stefanescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241101080614.1070819-4-andrei.stefanescu@oss.nxp.com>

On Fri, Nov 01, 2024 at 10:06:09AM +0200, Andrei Stefanescu wrote:
> SIUL2 is now represented as an mfd device. Therefore, the old
> pinctrl node is deprecated. Move the pinctrl related properties
> inside the new "nxp-siul2" node. The latter one is now used
> to represent the mfd device.
> 
> Signed-off-by: Andrei Stefanescu <andrei.stefanescu@oss.nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/s32g2.dtsi | 26 +++++++++++-------------
>  arch/arm64/boot/dts/freescale/s32g3.dtsi | 26 +++++++++++-------------
>  2 files changed, 24 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> index fa054bfe7d5c..e14ce5503e1f 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -114,20 +114,18 @@ soc@0 {
>  		#size-cells = <1>;
>  		ranges = <0 0 0 0x80000000>;
>  
> -		pinctrl: pinctrl@4009c240 {
> -			compatible = "nxp,s32g2-siul2-pinctrl";
> -				/* MSCR0-MSCR101 registers on siul2_0 */
> -			reg = <0x4009c240 0x198>,
> -				/* MSCR112-MSCR122 registers on siul2_1 */
> -			      <0x44010400 0x2c>,
> -				/* MSCR144-MSCR190 registers on siul2_1 */
> -			      <0x44010480 0xbc>,
> -				/* IMCR0-IMCR83 registers on siul2_0 */
> -			      <0x4009ca40 0x150>,
> -				/* IMCR119-IMCR397 registers on siul2_1 */
> -			      <0x44010c1c 0x45c>,
> -				/* IMCR430-IMCR495 registers on siul2_1 */
> -			      <0x440110f8 0x108>;
> +		siul2: siul2@4009c000 {

This will affect users of this DTS. Your commit lacks rationale for
doing this, considering its impact. Re-describing devices is really
unexpected so should come with strong arguments.

Best regards,
Krzysztof


