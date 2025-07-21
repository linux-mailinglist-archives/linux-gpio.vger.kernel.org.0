Return-Path: <linux-gpio+bounces-23581-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE58CB0C424
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 14:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 453297A872B
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 12:28:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5976D2D3EFF;
	Mon, 21 Jul 2025 12:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q+K9aBxx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0812A2D3EE5;
	Mon, 21 Jul 2025 12:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753101005; cv=none; b=SFBMuSJ8u0uRPkvXhjR/F16P4Ip7jJenuKV/OjWoKsk1XnTBpPLwVlBMg4MfrN1awQtNZwd4gbaGFFr8B3zg9p5cQgCYzXQaj2wO8z63Vs9U/Nxpk9OoMl0anNqz/4FX+g6/woPs1T6KN3OvCNBT/mB12Rh9TQ3f5abEA+djZcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753101005; c=relaxed/simple;
	bh=3/Mp/bZdiCCi6LZfAbd65m+AvvUXI4xEDl+vBkRyuFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f8cAsJvgxr9lxBUCBFQ6A+D/LYT4gOORC/iBEHBzMaLmDJceq4/6jMvTBZK4DURTah3vnCaFT0WRkNJaRgXt0nTn1LhmFOfOlL9dYubN+D09+f7t+MXkvxir6traCG/LnuVhp46xgdypPSrRsDQG6s6RKbUAFFjXXfJ5UMTVw/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q+K9aBxx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EDC7C4CEED;
	Mon, 21 Jul 2025 12:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753101004;
	bh=3/Mp/bZdiCCi6LZfAbd65m+AvvUXI4xEDl+vBkRyuFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q+K9aBxxeEfe6ql8kvSVGeQuzepLg/wW01yqaxnhUrqbEHylTeF3rN3YJFpy5mWXc
	 yHewAQBFICtBu6MC/d0NG7d3SsgbCp7nepeKKPGDeTmsBJXdpYiDnC6rm+Ql2iNKbr
	 HpnaC7P2Npe8SqqdHfWxO3YhLuZjheVIKut7kJesRLls9cr6MBCto+PCJtvhQ6RKyD
	 at/okL098bmsMVQyuQ3uW6v+b0FdlAsCoA4qEKOoc1MFQ8fxQ8PRNdPtg662ZrSFrk
	 ZD34bi/nb1qS7d7jfpqFE59LNOcrhU+ILSJWKnuqz3rITsxTfqsDIiJ2rnkhmeRrBb
	 gjFuIeKo/oGlA==
Date: Mon, 21 Jul 2025 13:29:58 +0100
From: Mark Brown <broonie@kernel.org>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
	kernel@oss.qualcomm.com,
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v7 3/9] ASoC: dt-bindings: qcom,lpass-va-macro: Update
 bindings for clocks to support ADSP
Message-ID: <33d963bd-c5a9-4b10-b348-bf713fbab8d5@sirena.org.uk>
References: <20250720173215.3075576-1-quic_pkumpatl@quicinc.com>
 <20250720173215.3075576-4-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WQCEN1qteZ5BnNy0"
Content-Disposition: inline
In-Reply-To: <20250720173215.3075576-4-quic_pkumpatl@quicinc.com>
X-Cookie: Falling rock.


--WQCEN1qteZ5BnNy0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025 at 11:02:09PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>=20
> Manage clock settings for ADSP solution. On Existing ADSP bypass
> solutions, the macro and dcodec GDSCs are enabled using power domains
> in lpass-va-macro which is not applicable for ADSP based platform.

This doesn't apply against current code, please check and resend.

--WQCEN1qteZ5BnNy0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh+MsUACgkQJNaLcl1U
h9BWwgf+NWAI0d/I/aIa6eGJwgfNj2DSfG0PWklhpdlVWh3zEes+nP5dCSNDhbVK
MWKkwY0gF5I4o3GnSUowpdHoXqijOacNQonhwWf2RNYOfHty0725BYt2PV42bsdY
QBOovExEfFTtHgw2w1LF/Tqtwwx1qxDLrMWD9r4KI2LFHYM2vIlav7NgzYOJ2ECN
RhXTWEmm57JhZu+Z9uTPy9FtOdBJM+UPWtqt4TCSn7VbWpisle9LLEQQOCXHULlv
VeKyvkGkjgRO0T0afl77fqyDk7p794L+X3oxhlVKLCbEKffQfhNbuMO7IsHhIh7e
qnxQ8X9o61wHTSFsxMyF/7cG8tUtWw==
=rl5U
-----END PGP SIGNATURE-----

--WQCEN1qteZ5BnNy0--

