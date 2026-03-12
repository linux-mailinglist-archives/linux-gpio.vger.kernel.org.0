Return-Path: <linux-gpio+bounces-33278-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGjwFRH7smmLRAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33278-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:42:41 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DBF276AEA
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 18:42:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 68E263023D73
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Mar 2026 17:42:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 229173F87E4;
	Thu, 12 Mar 2026 17:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b42H45l/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D983B2FE066;
	Thu, 12 Mar 2026 17:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773337356; cv=none; b=HXYW5yfRflBYv3WIBpliAjxx5/p/H5vhH2WPcclkxSxv0O9vN49R0N0gLWAEtW9QQtLdT8fMCF/esIRkK+umkvuTBaA7PVhD9m/l5j2iVYCZ30j261BbV075Lb0NEpULbRT2mRB4f9kTnvMmwP7ispI1NeCwhHyjE13Zqap8sZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773337356; c=relaxed/simple;
	bh=BvynsxQT+72Rrn/uUDDfsNj/GLSJx+wlAMlrdvLf+NM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=go9n9mwczgsfhubuAgoIrduWsnoRh5SvBEVTGSEZ8nm9d0+z9BY7s4B4+i62qCByGzmTZIVSoGci5ZdAS2f6F5uOLCPJ5GjvzgZ88/59e5Q0qVd+Zhc40dzn2awW1ESqGS5bc0K60NH1fdGcL03mWM8kTGlZ62uQJmlzR+RKxNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b42H45l/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D81CC116C6;
	Thu, 12 Mar 2026 17:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773337356;
	bh=BvynsxQT+72Rrn/uUDDfsNj/GLSJx+wlAMlrdvLf+NM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b42H45l/gDxAJEGfU3qTzBjD5/TLjqEZCpox7A9y23bQ9X8cfOwytTgRTG6/sneL2
	 yMrLK8HaLmlBQvNFmI9wJiNgFOxizT51v99W4BOe8Aq0pG4DPwx/B5turcZUsAnKGG
	 N24AMEuHGDi+h0jVsDIb8DduFqPfD5cvgN2yOq1a68l2LmJ6vul46oBx3gEggY8d77
	 X0YInjHaJQ1qBpHiOZISuTdYh5GQYHKvKWV5X4JaEPSU5RP4PsH54PMCh5TnDHau/3
	 8mdokoNztYo8m58TrFJphotlXvS505D/P2NEZomy/4Okie4VJ2bnkcwfCUhlWLqfK5
	 dXOVbl1fmXO7A==
Date: Thu, 12 Mar 2026 17:42:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, afaerber@suse.com,
	bartosz.golaszewski@oss.qualcomm.com, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com,
	tychang@realtek.com, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org
Subject: Re: [PATCH v3 1/7] dt-bindings: pincfg-node: Add
 input-voltage-microvolt property
Message-ID: <20260312-decathlon-unheard-33543f7c9f38@spud>
References: <20260312113040.68189-1-eleanor.lin@realtek.com>
 <20260312113040.68189-2-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EkrqEmDpWds7n/h2"
Content-Disposition: inline
In-Reply-To: <20260312113040.68189-2-eleanor.lin@realtek.com>
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33278-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: F1DBF276AEA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--EkrqEmDpWds7n/h2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 07:30:34PM +0800, Yu-Chun Lin wrote:
> From: Tzuyi Chang <tychang@realtek.com>
>=20
> Add a generic pin configuration property "input-voltage-microvolt" to
> support hardware designs where the input logic threshold is decoupled
> from the power supply voltage.
>=20
> This property allows the pinctrl driver to configure the correct internal
> reference voltage for pins that need to accept input signals at a differe=
nt
> voltage level than their power supply. For example, a pin powered by 3.3V
> may need to accept 1.8V logic signals.
>=20
> This defines the reference for VIH (Input High Voltage) and VIL (Input Low
> Voltage) thresholds, enabling proper signal detection across different
> voltage domains.
>=20
> Signed-off-by: Tzuyi Chang <tychang@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v3:
> - Rebased onto the devel branch of the pinctrl tree.
> - Improved commit message and description.
> ---
>  Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b=
/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> index fe936ab09104..fd49a0d53bf0 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -162,6 +162,11 @@ properties:
>        this affects the expected delay in ps before latching a value to
>        an output pin.
> =20
> +  input-voltage-microvolt:
> +    description: Specifies the input voltage level of the pin in microvo=
lts.
> +      This defines the reference for  VIH (Input High Voltage) and VIL
> +      (Input Low Voltage) thresholds for proper signal detection.

Should this be added here:
  - if:
      required:
        - input-disable
    then:
      properties:
        input-enable: false

and made mutually exclusive with input-disable?

> +
>  allOf:
>    - if:
>        required:
> --=20
> 2.34.1
>=20

--EkrqEmDpWds7n/h2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCabL7BwAKCRB4tDGHoIJi
0pKEAQC6Ey1baSsob113/Wx8B3QdXrW3HwDRHNbW+DMmvy+UjQD/XOOL9otVRpeA
+g1SsE3I8Zj7rlmTtKL+9i55DXfyTA8=
=JhZK
-----END PGP SIGNATURE-----

--EkrqEmDpWds7n/h2--

