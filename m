Return-Path: <linux-gpio+bounces-35173-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KPhJ5io32nQXQAAu9opvQ
	(envelope-from <linux-gpio+bounces-35173-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 17:02:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED213405A15
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 17:02:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8878D3019B90
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Apr 2026 15:01:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D309D37B03F;
	Wed, 15 Apr 2026 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2icnaHq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C202EDD62;
	Wed, 15 Apr 2026 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776265268; cv=none; b=dzA44ZOEV/swDYYl+OQk0/ohzerAZ073xU0Tac+UD8CEPc8gqty5UXBEXd9yqzCxrGcUrAMauJ/NdSQz20xrQaZVYuhH5X9rKWDNzO69YEfj+VFO4djgr3EZEQny65fvxQbgA5NwDWjqiiSFQu1lTh9CdqSnrlKaMC9brVxpJVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776265268; c=relaxed/simple;
	bh=BkVPFcAIuT9ItmchTe1dNaR4kZ/g7siiF/QjERIMqmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkbJTm3Y1A/NEtp/4MN2LFCV51lNwE30OieE/Wznj2MeS8Z9BoYUVmKvx+dKappag/iDTEI80cacjXqI+987wqMmKRFmp7i43HuaiRH/Nnoo0WESh46e6s3EtlDu6viamY/eeUhaJXUZL1/gN2XjwRhNaduI4dCWS3zkTfwDv9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2icnaHq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E383C19424;
	Wed, 15 Apr 2026 15:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776265268;
	bh=BkVPFcAIuT9ItmchTe1dNaR4kZ/g7siiF/QjERIMqmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2icnaHqjp0xdrxXzB5xuSUu42KVP25gMmFYjCNm3a7Il6RLNqqR4teE4IRbeTWux
	 R2QKNaX3I8+yq0oAALvxJCB0wo4K+CdctFhzDSXAWdva6SV5s8ZaEd0+3SvBvqAn7D
	 HOOSpuVOmo6/c12itOJBTlTK1Bhib/A2tKFd3C4Lg0lowNiZAFKYXj/gcTuZRs1VL2
	 7VH0ORDi9Q46fIAGgVuwnHQLYcjI0QVgWfvUuKLRQUMa01TSqXnPlvblNLU6WEZY/a
	 lgi+8CB/ZhGhP/cq25p/cbCWKuDfbO9yLbixAlYx13lcjovMcPV+AORNGI7vt8z9p3
	 L1oZZqzol+J8A==
Date: Wed, 15 Apr 2026 16:01:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
Cc: linux-kernel@vger.kernel.org, git@amd.com, shubhrajyoti.datta@gmail.com,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] dt-bindings: gpio: Add EIO GPIO compatible to
 gpio-zynq
Message-ID: <20260415-rectal-visible-a8ccb534a176@spud>
References: <20260415105628.957689-1-shubhrajyoti.datta@amd.com>
 <20260415105628.957689-3-shubhrajyoti.datta@amd.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fmNPlvI7e/DqiZwD"
Content-Disposition: inline
In-Reply-To: <20260415105628.957689-3-shubhrajyoti.datta@amd.com>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35173-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,amd.com,gmail.com,kernel.org,lists.infradead.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email]
X-Rspamd-Queue-Id: ED213405A15
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--fmNPlvI7e/DqiZwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2026 at 04:26:27PM +0530, Shubhrajyoti Datta wrote:
> EIO (Extended IO) is a GPIO block found on xa2ve3288 silicon..


Why does the compatible have a "1.0" when it is in silicon?
Why doesn't the compatible contain "xa2ve3288"?
Why is this device not compatible with existing ones, since
gpio-lines-names appears to be the sole difference?

>=20
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> ---
>=20
> Changes in v2:
> - Add description of EIO block in the dt-bindings patch
>=20
>  .../devicetree/bindings/gpio/gpio-zynq.yaml        | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml b/Docu=
mentation/devicetree/bindings/gpio/gpio-zynq.yaml
> index 30a7f836c341..1ca067217509 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-zynq.yaml
> @@ -12,6 +12,7 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> +      - xlnx,eio-gpio-1.0
>        - xlnx,pmc-gpio-1.0
>        - xlnx,versal-gpio-1.0
>        - xlnx,zynq-gpio-1.0
> @@ -30,7 +31,7 @@ properties:
> =20
>    gpio-line-names:
>      description: strings describing the names of each gpio line
> -    minItems: 58
> +    minItems: 52
>      maxItems: 174
> =20
>    interrupt-controller: true
> @@ -89,6 +90,17 @@ allOf:
>            minItems: 116
>            maxItems: 116
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - xlnx,eio-gpio-1.0
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 52
> +          maxItems: 52
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.34.1
>=20

--fmNPlvI7e/DqiZwD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCad+oLwAKCRB4tDGHoIJi
0kH6AP4zWEn75f2KqDah6ah38m6Ed/q3Z94RTDr52QeRGt4XVgEAzjDeYo1oCmhR
rMEPeV6W7EqbJr5PlW6vW0H+f+vtoQs=
=vZwx
-----END PGP SIGNATURE-----

--fmNPlvI7e/DqiZwD--

