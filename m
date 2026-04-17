Return-Path: <linux-gpio+bounces-35210-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJbYLfdI4mlh4AAAu9opvQ
	(envelope-from <linux-gpio+bounces-35210-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 16:51:35 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D09E41C3E7
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 16:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DDBD0301A50C
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Apr 2026 14:51:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A65D23C1985;
	Fri, 17 Apr 2026 14:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSHs9lU+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F472C027B;
	Fri, 17 Apr 2026 14:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437484; cv=none; b=m0kQPYUlsrq5HssMFVYWEt7iqhlJWl/ghP+EMAlQvEy3ZwAgJEFo9DcR9mXc74XJ7Mv5U96drNsdc8Z2u9D+D8FJeQRZaOt4ZP66isr+ChoqSeddempsEg+Iro1GQIA0PmPQz9Kpn7Yw/poXE0XOd0ptxBdqGuC9oOZRjCalOk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437484; c=relaxed/simple;
	bh=0WlQsgQ9vdAi/fQs63xgbJ+x3wmh2V+kgGHYinqBMNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QlxhpU/5YYpCyPD0xgycIKE/Z73wBiX695S0qD/oE9guM6x52Syl+NBR0/+byxFixpTykWEhAFlhWQTlqmwMv2lZK7dEy55DUhlVVdXCnFD+JHNhqlUX7EujcHjOfhLN4z1L3elDj31Fyq/BLlPMx1DSRcSrIh+aQdHg8NIRaOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSHs9lU+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E9E9C19425;
	Fri, 17 Apr 2026 14:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776437484;
	bh=0WlQsgQ9vdAi/fQs63xgbJ+x3wmh2V+kgGHYinqBMNo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSHs9lU+aW0fMLQl7vYxCgrIrFrn3x/+I1ZlG3Eh5gZpKWtJ443Ep3FdnZe/ZqhN2
	 enhrOcEUdmLNrKZ2Xe4KaKDDZXWJAKZoRty2mejQ/o8I48ZBuX6/jl6DSWLfICaKLA
	 6tB5F17PlxJBCmhs6RFbFPxvT/6AHNo/hrTT1aNB26BfmL9cBXl1S9ek9Z3KSMkVF6
	 zafktzheuXF1PGXJ5bkuKgjqT/QMzPmIKRtXSclsoHs1FKfdPwO57M8ASXaI8EcQ4g
	 Va6H0b0Dq+Vzck7xlw3w/fxLuOGyHTYQMxsdeY0LZ6FC9rteLUsyWK/IByVqnzS/Is
	 lj6Zm+BpDDkVw==
Date: Fri, 17 Apr 2026 15:51:19 +0100
From: Conor Dooley <conor@kernel.org>
To: linusw@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [PATCH v3 6/6] riscv: dts: microchip: add pinctrl nodes for
 mpfs/icicle kit
Message-ID: <20260417-outweigh-escalate-f056312b3f4b@spud>
References: <20260119-rearrange-germproof-3e3096cc0da4@spud>
 <20260119-natural-buddy-acb391bcd9f6@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LBW7VOKBT163tmLl"
Content-Disposition: inline
In-Reply-To: <20260119-natural-buddy-acb391bcd9f6@spud>
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-35210-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchip.com:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5D09E41C3E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


--LBW7VOKBT163tmLl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 19, 2026 at 11:03:57AM +0000, Conor Dooley wrote:

> +
> +&i2c0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0_fabric>;
> +};
> +
> +&i2c1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c1_fabric>;
> +};

Seemingly, I have run into an erratum here. What I noticed that this
didn't match the schematic and changed it when I applied. Turns out,
this is actually correct on engineering sample silicon but not on
production. Something like
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/ar=
ch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index 2d14e92f068d5..9078e5b1e49c1 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -101,16 +101,6 @@ &ccc_nw {
=E2=80=83=E2=80=83status =3D "okay";
};

-&i2c0 {
-=E2=80=83=E2=80=83pinctrl-names =3D "default";
-=E2=80=83=E2=80=83pinctrl-0 =3D <&i2c0_fabric>;
-};
-
-&i2c1 {
-=E2=80=83=E2=80=83pinctrl-names =3D "default";
-=E2=80=83=E2=80=83pinctrl-0 =3D <&i2c1_mssio>;
-};
-
&mmuart1 {
=E2=80=83=E2=80=83pinctrl-names =3D "default";
=E2=80=83=E2=80=83pinctrl-0 =3D <&uart1_fabric>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts b/arch/=
riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
index 8afedece89d1f..636493f6584d2 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts
@@ -14,6 +14,16 @@ / {
=E2=80=83=E2=80=83=E2=80=83=E2=80=83     "microchip,mpfs";
};

+&i2c0 {
+=E2=80=83=E2=80=83pinctrl-names =3D "default";
+=E2=80=83=E2=80=83pinctrl-0 =3D <&i2c0_fabric>;
+};
+
+&i2c1 {
+=E2=80=83=E2=80=83pinctrl-names =3D "default";
+=E2=80=83=E2=80=83pinctrl-0 =3D <&i2c1_mssio>;
+};
+
&syscontroller {
=E2=80=83=E2=80=83microchip,bitstream-flash =3D <&sys_ctrl_flash>;
};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv=
/boot/dts/microchip/mpfs-icicle-kit.dts
index 556aa9638282e..6fadce815c9a2 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -11,3 +11,22 @@ / {
=E2=80=83=E2=80=83=E2=80=83=E2=80=83     "microchip,mpfs-icicle-kit",
=E2=80=83=E2=80=83=E2=80=83=E2=80=83     "microchip,mpfs";
};
+
+&i2c0 {
+=E2=80=83=E2=80=83pinctrl-names =3D "default";
+=E2=80=83=E2=80=83pinctrl-0 =3D <&i2c0_fabric>;
+};
+
+/*
+ * Due to silicon errata, routing via MSS IOs doesn't work on ES devices.
+ * Instead, i2c1, appearing on B1/C1, which are normally MSS IOs, is routed
+ * via the fabric and back to B1/C1 via "fabric-test" functionality.
+ * This is done silently by Libero, so the iomux0 setting for i2c1 has to
+ * be fabric IO, despite tooling etc saying that MSS IOs are used.
+ *
+ * See Section 3.3 of https://ww1.microchip.com/downloads/aemDocuments/doc=
uments/FPGA/ProductDocuments/Errata/polarfiresoc/microsemi_polarfire_soc_fp=
ga_egineering_samples_errata_er0219_v1.pdf
+ */
+&i2c1 {
+=E2=80=83=E2=80=83pinctrl-names =3D "default";
+=E2=80=83=E2=80=83pinctrl-0 =3D <&i2c1_fabric>;
+};

is needed to restore functionality and a further change is required to
"document" in code the extent of the hack required to make it work.

--LBW7VOKBT163tmLl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeJI5AAKCRB4tDGHoIJi
0vKtAP9ZXaTAVu3j1YyONGgM0DO2d27IZPB6X6YXseeZZVKFUAD9FBgRKGbjZt/J
duGUc+FtA0xH3v2xT64t2VeulBfDXQg=
=oDvd
-----END PGP SIGNATURE-----

--LBW7VOKBT163tmLl--

