Return-Path: <linux-gpio+bounces-17670-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AA1A64706
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 10:22:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C58CD3A8DB7
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Mar 2025 09:21:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5B2221F1B;
	Mon, 17 Mar 2025 09:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtSD5kPr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C85521C173;
	Mon, 17 Mar 2025 09:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742203315; cv=none; b=bFI99uaRdjdpmqnuZoOwq2+FmBDpRM8sde6+yS0+jGBXJgr3BFAUlHuSgkKhESnQH6REo7fBifO+AQ7GR9Iqg2s9mxcMpGmJUR8/0/lPNmjcsbVb0Utd2TIpgqQoIj+0TxFajdTK7lSXneXPtkWGW6uXx+Oa1sFsqf5J8SLkD5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742203315; c=relaxed/simple;
	bh=UIR53RBEBGjhoxZodhVv//7PYC64fcsZWaxeAors98k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tUvrplJwtd554gPutCia2blfekdLRIMek9fVHK4az+PBVOIxLkKWTGNmnHV7DmAsEGS8HGg7cexchzvEC3a6t1euuuh2il1GfGG+ogur3fAGlFMIdJerjGjhAa/NfVl8unHGQd2TD53fEMFVqBy/DHIbsc2ggAk45Ocb+GlJbfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtSD5kPr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878E3C4CEEE;
	Mon, 17 Mar 2025 09:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742203313;
	bh=UIR53RBEBGjhoxZodhVv//7PYC64fcsZWaxeAors98k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GtSD5kPr+LfiDNyVdFU85kUPAvtVq8Kutc4BbhAQojIQLxvx9vvddHoblN5gsu04W
	 6sRbGW7QN9sax49m8IKwxDIpvclkqIDOoBVu4PZp/V3/0tjwSDgNKMheZLvj4hwiIw
	 Djb7sXVsReG8U8rD9F9mcTiiRGhmCMfJTSffcFm+WLG9Iaum4Wnvhwl+BnYHk+XijX
	 2aiiGdWr3IBULXidx9BVnh77IwUp9oE288nt6ve6g8sYA+5OzZV8fNaCmXeuEyN2l+
	 tuwtAthxo0m64qccp+YKMWk1YI1a2erhC7pwsmz1oRdVwkNFoBsFN6IcNWY5HsjvoS
	 k4Ne+lFQixi9Q==
Date: Mon, 17 Mar 2025 10:21:50 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephan Gerhold <stephan@gerhold.net>, Otto =?utf-8?Q?Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, iommu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, linux@mainlining.org, Adam Skladowski <a39.skl@gmail.com>
Subject: Re: [PATCH v4 3/6] dt-bindings: drm/msm/gpu: Document AON clock for
 A505/A506/A510
Message-ID: <20250317-hypnotic-weightless-mosquito-f489ad@krzk-bin>
References: <20250315-msm8937-v4-0-1f132e870a49@mainlining.org>
 <20250315-msm8937-v4-3-1f132e870a49@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250315-msm8937-v4-3-1f132e870a49@mainlining.org>

On Sat, Mar 15, 2025 at 03:57:37PM +0100, Barnab=C3=A1s Cz=C3=A9m=C3=A1n wr=
ote:
> From: Adam Skladowski <a39.skl@gmail.com>
>=20
> Adreno 505 (MSM8937), Adreno 506(MSM8953) and Adreno 510(MSM8976)
> require Always-on branch clock to be enabled, describe it.
>=20
> Signed-off-by: Adam Skladowski <a39.skl@gmail.com>
> [reword commit, move alwayson on the first place]
> Signed-off-by: Barnab=C3=A1s Cz=C3=A9m=C3=A1n <barnabas.czeman@mainlining=
=2Eorg>
> ---
>  Documentation/devicetree/bindings/display/msm/gpu.yaml | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Doc=
umentation/devicetree/bindings/display/msm/gpu.yaml
> index 6ddc72fd85b04537ea270754a897b4e7eb269641..5028398cc3b517e404a92a2c3=
0688f72eab4c1b3 100644
> --- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
> @@ -152,11 +152,13 @@ allOf:
>        properties:
>          clocks:
>            minItems: 2
> -          maxItems: 7
> +          maxItems: 8
> =20
>          clock-names:
>            items:
>              anyOf:
> +              - const: alwayson
> +                description: GPU Always-On clock

Are you adding bindings for devices which were not described previously?
Then don't grow this pattern, but create if:then: with a strictly
ordered list for them (and keeping order of other variants).

Best regards,
Krzysztof


