Return-Path: <linux-gpio+bounces-27255-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 845D8BEA998
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 18:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6A5875C0586
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Oct 2025 16:03:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64EC92749DC;
	Fri, 17 Oct 2025 16:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LHoSw/PZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BD5726E717;
	Fri, 17 Oct 2025 16:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760716964; cv=none; b=KUNYRsttCcXZwm7O4tWXcLvOzY9F/D1sFzJtPlIvl2WS6xP8dGqfJhATx1LW0Qqf9jdpLC8GSb6t1Zbi/kEAMezlmo2+UKHggiUWi0tb6Tp0dtpLCh7wDHn9Rko+DFhZ0oYH6C2/4nORPYYlGuoE4rI5EOFgKmjqg3r+jT+hCz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760716964; c=relaxed/simple;
	bh=xojrpFlz1LFNv97U0p6wiXyxxqPnBp1q0KSfoha5XPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B154F9uOvNxv5ebOnrypo3h/x7dbeE2iwQmYCmfkS77N6WPSLIzqr7Dkr8hOUmTjTh/BsgYgm7IqMH6WxER/q8r9d+7mgAE8unSsIefqtPg/c+A7q0fWqULtVxgGgc5bzqA/DP6m+YhlaM8rWr2z7FxonOmjkgmcpF7sty3WjTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LHoSw/PZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91458C4CEE7;
	Fri, 17 Oct 2025 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760716963;
	bh=xojrpFlz1LFNv97U0p6wiXyxxqPnBp1q0KSfoha5XPA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LHoSw/PZokmUd2Wc0/IYOV1WttAmj1Ak5JnKJdEt0h3QSQBtfIxDIQgkomsBc5l1n
	 el08IFWZToc9N5U0hSwBjvv342efsu0yc9Pu/pyZduyk7DUre0EMfyqYvky97Rtbyr
	 UwxD7s+NEdOCv2uCjfPi0bvGrM/DCp7rLM2p78bga74zGKcvBiuQ2hJgghXCYTpYBt
	 YhCluy32wjj8x2k1Wgl7X5llmtwOzeZd6aZV0HdwChvfpoNyeERpOl/Yxr5Ldz5WCX
	 G6O4HPO/muoUrNzAuvYRoJYtif8/ypWig3+XayEUkcGrrvIhW15CsBBBr3vrcDr9RS
	 SE7KW+1EMRJgA==
Date: Fri, 17 Oct 2025 17:02:39 +0100
From: Conor Dooley <conor@kernel.org>
To: Gary Yang <gary.yang@cixtech.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	cix-kernel-upstream@cixtech.com
Subject: Re: [PATCH v4 3/3] arm64: dts: cix: Add pinctrl nodes for sky1
Message-ID: <20251017-expectant-tingly-95cd6d57962c@spud>
References: <20251017074646.3344924-1-gary.yang@cixtech.com>
 <20251017074646.3344924-4-gary.yang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H64nj9AQoov3hoOl"
Content-Disposition: inline
In-Reply-To: <20251017074646.3344924-4-gary.yang@cixtech.com>


--H64nj9AQoov3hoOl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 17, 2025 at 03:46:46PM +0800, Gary Yang wrote:
> +#define DS_LEVEL0	2
> +#define DS_LEVEL1	3
> +#define DS_LEVEL2	5
> +#define DS_LEVEL3	6
> +#define DS_LEVEL4	8
> +#define DS_LEVEL5	9
> +#define DS_LEVEL6	11
> +#define DS_LEVEL7	12
> +#define DS_LEVEL8	13
> +#define DS_LEVEL9	14
> +#define DS_LEVEL10	17
> +#define DS_LEVEL11	18
> +#define DS_LEVEL12	20
> +#define DS_LEVEL13	21
> +#define DS_LEVEL14	23
> +#define DS_LEVEL15	24

All of these just hide the amperage, please drop them.

--H64nj9AQoov3hoOl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPJonwAKCRB4tDGHoIJi
0iOeAQDyBaIb9gA3BPzuk30EVWGx8N+rGqa+2Z8gxw7jelG+/QD8DPxps1C5UQBi
wFmCW5uuw60FSmq8tcTuX3dEPar0jgQ=
=Z8KD
-----END PGP SIGNATURE-----

--H64nj9AQoov3hoOl--

