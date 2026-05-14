Return-Path: <linux-gpio+bounces-36867-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMy/Ky0lBmqmfgIAu9opvQ
	(envelope-from <linux-gpio+bounces-36867-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 21:40:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B495466F6
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 21:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A3106301AEE8
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 19:40:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 024B53ABDA4;
	Thu, 14 May 2026 19:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pD0cTR28"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CFC280318;
	Thu, 14 May 2026 19:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778787626; cv=none; b=nZsPIIFHAHcFoGBeIzoi5WMeBTgTA2cwj03QiAYyTJTM/Cxm5bp0QZctCw+YUOLKJPxtXoOLo2n89Yvxqx9MMSjjgc/NvG4AtcC38SrqDtNKLk4K2CyvsKc/l0O8ozqYMVzoQDd0wHDFsrbvIgGpONN5VFKgfKMjpkOVTOsIuxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778787626; c=relaxed/simple;
	bh=/AKTU/4pX4ZFrjy08RCybTCXeS6AqYE/Ebr99UngWAM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P/N8/2RWQX33mjr31rR79kKh6nqEy4uexzG8wUR8X09bAtvri9vcxbhQLCzl8wxdpqwFfKtukXzgU2yDCow0W3pL1B51X2K9aaVuW0AcAMpHFNQvOw7HJjKI2L1NqgEYyXVOeK5C0+wWl2wV8Jn/54gQ381EjNbtzSd72h50ShQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pD0cTR28; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA71DC2BCB3;
	Thu, 14 May 2026 19:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778787626;
	bh=/AKTU/4pX4ZFrjy08RCybTCXeS6AqYE/Ebr99UngWAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pD0cTR28EicyCk7ne4IgVTPWfLOqPzEERrrv7DRXmhbsOoqLCZk5Q/sfyjUxt75rE
	 F6d2kNg/YXFm5h6t43SzvF17jxO3UStL5wMg0L5bYCsL+mjgA6xIXPVjAwByH/CRMr
	 aHA3fIVuGusuat+/Y7waKPYerkA7ST9ujppHO1u1wtC2eP8XB5ioZfXJG5lfaUAkPA
	 RVY8UzaX+ppajOtBzF4p+ETXVu5mpyZdw5zDTlA56/iePLQbCuMgByNPrnIAqR3YLQ
	 GIIV9zORiR4P7Px0eh0UEDd0vTpjwwBwZaXP+IbQzyqvXEtYmzKf66Vp+70TZ6KoG0
	 Rw1UJ1ZF4JQCw==
Date: Thu, 14 May 2026 20:40:22 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, Yixun Lan <dlan@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [RFC v1 0/4] generic pinmux dt_node_to_map implementation
Message-ID: <20260514-afterglow-overlabor-bc483b2a8b35@spud>
References: <20260506-energize-dramatize-051909e54256@spud>
 <CAD++jLkEfqDrqaxTjxf4AwHPcdCppPfO5F7H5YnR2gebzhZFig@mail.gmail.com>
 <20260514-used-revival-306ddced4ab8@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Yat47aogx/LrUfFI"
Content-Disposition: inline
In-Reply-To: <20260514-used-revival-306ddced4ab8@spud>
X-Rspamd-Queue-Id: 54B495466F6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-36867-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Action: no action


--Yat47aogx/LrUfFI
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 07:57:46PM +0100, Conor Dooley wrote:
> On Mon, May 11, 2026 at 10:23:16PM +0200, Linus Walleij wrote:
> > On Wed, May 6, 2026 at 11:58=E2=80=AFAM Conor Dooley <conor@kernel.org>=
 wrote:
> >=20
> > > Whipped this up last week, at to a first glance it appears to work,
> > > although the spacemit platform I've used to implement this has very
> > > limited in-tree use of pinctrl so it is hard to be sure.
> >=20
> > I like it, if it wasn't RFC I would merge it.
>=20
> Half the reason that it is RFC is that I knew dlan wanted to take a look
> but told me they weren't available, so I said I'd send it on the list in
> the interim.
>=20
> > > What I don't love though is how similar the functions
> > > pinctrl_generic_pins_function_dt_node_to_map() and
> > > pinctrl_generic_pinmux_dt_node_to_map() are - essentially identical
> > > other than which function they in turn call.
> >=20
> > Hm we can maybe think of something more descriptive
> > to the first one?
>=20
> I think the name is actually okay, it was the similarity of the code
> that I don't like. There's a fair bit of duplication.
>=20
> > I think the new function is very much to the point. That's what
> > it does. pinctrl_generic_pins_function_dt_node_to_map() could
> > perhaps be names something that make it evident what is
> > special about it. Not that I have a good idea.
> >=20
> > > Basically, I wanna know if you think that that is acceptable,
> >=20
> > Looks Good To Me (TM) no-one else is helping out with pin
> > control core work so I'm happy for everything I get.
>=20
> Right, well I'll go clean it up I suppose. I might send a rfc v2 with an
> extra patch that tries to get rid of some of the code duplication and
> you can tell me which version you prefer?

Actually, no need for rfc v2, can just paste here:

diff --git a/drivers/pinctrl/pinctrl-generic.c b/drivers/pinctrl/pinctrl-ge=
neric.c
index d1365acfd1f8c..9759b0186bcc2 100644
--- a/drivers/pinctrl/pinctrl-generic.c
+++ b/drivers/pinctrl/pinctrl-generic.c
@@ -119,92 +119,6 @@ static int pinctrl_generic_pins_function_dt_subnode_to=
_map(struct pinctrl_dev *p
 				      functions, pins, npins);
 }
=20
-/*
- * For platforms that do not define groups or functions in the driver, but
- * instead use the devicetree to describe them. This function will, unlike
- * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
- * and functions, create them in addition to parsing pinconf properties and
- * adding mappings.
- */
-int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctld=
ev,
-						 struct device_node *np,
-						 struct pinctrl_map **maps,
-						 unsigned int *num_maps)
-{
-	struct device *dev =3D pctldev->dev;
-	struct device_node *child_np;
-	const char **group_names;
-	unsigned int num_reserved_maps =3D 0;
-	int ngroups =3D 0;
-	int ret;
-
-	*maps =3D NULL;
-	*num_maps =3D 0;
-
-	/*
-	 * Check if this is actually the pins node, or a parent containing
-	 * multiple pins nodes.
-	 */
-	if (!of_property_present(np, "pins"))
-		goto parent;
-
-	group_names =3D devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
-	if (!group_names)
-		return -ENOMEM;
-
-	ret =3D pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, np,
-							      maps, num_maps,
-							      &num_reserved_maps,
-							      group_names,
-							      ngroups);
-	if (ret) {
-		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
-		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", n=
p->name);
-	}
-
-	ret =3D pinmux_generic_add_function(pctldev, np->name, group_names, 1, NU=
LL);
-	if (ret < 0) {
-		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
-		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
-	}
-
-	return 0;
-
-parent:
-	for_each_available_child_of_node(np, child_np)
-		ngroups +=3D 1;
-
-	group_names =3D devm_kcalloc(dev, ngroups, sizeof(*group_names), GFP_KERN=
EL);
-	if (!group_names)
-		return -ENOMEM;
-
-	ngroups =3D 0;
-	for_each_available_child_of_node_scoped(np, child_np) {
-		ret =3D pinctrl_generic_pins_function_dt_subnode_to_map(pctldev, np, chi=
ld_np,
-								      maps, num_maps,
-								      &num_reserved_maps,
-								      group_names,
-								      ngroups);
-		if (ret) {
-			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
-			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n",
-					     np->name);
-		}
-
-		ngroups++;
-	}
-
-	ret =3D pinmux_generic_add_function(pctldev, np->name, group_names, ngrou=
ps, NULL);
-	if (ret < 0) {
-		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
-		return dev_err_probe(dev, ret, "error adding function %s\n", np->name);
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(pinctrl_generic_pins_function_dt_node_to_map);
-
-
 static int pinctrl_generic_pinmux_dt_subnode_to_map(struct pinctrl_dev *pc=
tldev,
 						    struct device_node *parent,
 						    struct device_node *np,
@@ -250,20 +164,19 @@ static int pinctrl_generic_pinmux_dt_subnode_to_map(s=
truct pinctrl_dev *pctldev,
 				      muxes, pins, npins);
 }
=20
-/*
- * For platforms that do not define groups or functions in the driver, but
- * instead use the devicetree to describe them. This function will, unlike
- * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
- * and functions, create them in addition to parsing pinconf properties and
- * adding mappings.
- *
- * It assumes that the upper 16 bits of the pinmux items contain the pin
- * and the lower 16 the mux setting.
- */
-int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+static int pinctrl_generic_dt_node_to_map(struct pinctrl_dev *pctldev,
 					  struct device_node *np,
 					  struct pinctrl_map **maps,
-					  unsigned int *num_maps)
+					  unsigned int *num_maps,
+					  int (dt_subnode_to_map)(
+						  struct pinctrl_dev *,
+						  struct device_node *,
+						  struct device_node *,
+						  struct pinctrl_map **,
+						  unsigned int *,
+						  unsigned int *,
+						  const char **,
+						  unsigned int))
 {
 	struct device *dev =3D pctldev->dev;
 	struct device_node *child_np;
@@ -276,21 +189,18 @@ int pinctrl_generic_pinmux_dt_node_to_map(struct pinc=
trl_dev *pctldev,
 	*num_maps =3D 0;
=20
 	/*
-	 * Check if this is actually the pinmux node, or a parent containing
-	 * multiple pinmux nodes.
+	 * Check if this is actually the pins node, or a parent containing
+	 * multiple pins nodes.
 	 */
-	if (!of_property_present(np, "pinmux"))
+	if (!of_property_present(np, "pins"))
 		goto parent;
=20
 	group_names =3D devm_kcalloc(dev, 1, sizeof(*group_names), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
=20
-	ret =3D pinctrl_generic_pinmux_dt_subnode_to_map(pctldev, np, np,
-						       maps, num_maps,
-						       &num_reserved_maps,
-						       group_names,
-						       ngroups);
+	ret =3D dt_subnode_to_map(pctldev, np, np, maps, num_maps,
+				&num_reserved_maps, group_names, ngroups);
 	if (ret) {
 		pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 		return dev_err_probe(dev, ret, "error figuring out mappings for %s\n", n=
p->name);
@@ -314,11 +224,8 @@ int pinctrl_generic_pinmux_dt_node_to_map(struct pinct=
rl_dev *pctldev,
=20
 	ngroups =3D 0;
 	for_each_available_child_of_node_scoped(np, child_np) {
-		ret =3D pinctrl_generic_pinmux_dt_subnode_to_map(pctldev, np, child_np,
-							       maps, num_maps,
-							       &num_reserved_maps,
-							       group_names,
-							       ngroups);
+		ret =3D dt_subnode_to_map(pctldev, np, child_np, maps, num_maps,
+					&num_reserved_maps, group_names, ngroups);
 		if (ret) {
 			pinctrl_utils_free_map(pctldev, *maps, *num_maps);
 			return dev_err_probe(dev, ret, "error figuring out mappings for %s\n",
@@ -336,4 +243,40 @@ int pinctrl_generic_pinmux_dt_node_to_map(struct pinct=
rl_dev *pctldev,
=20
 	return 0;
 }
+
+/*
+ * For platforms that do not define groups or functions in the driver, but
+ * instead use the devicetree to describe them. This function will, unlike
+ * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
+ * and functions, create them in addition to parsing pinconf properties and
+ * adding mappings.
+ */
+int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *pctld=
ev,
+						 struct device_node *np,
+						 struct pinctrl_map **maps,
+						 unsigned int *num_maps)
+{
+	return pinctrl_generic_dt_node_to_map(pctldev, np, maps, num_maps,
+					      &pinctrl_generic_pins_function_dt_subnode_to_map);
+}
+EXPORT_SYMBOL_GPL(pinctrl_generic_pins_function_dt_node_to_map);
+
+/*
+ * For platforms that do not define groups or functions in the driver, but
+ * instead use the devicetree to describe them. This function will, unlike
+ * pinconf_generic_dt_node_to_map() etc which rely on driver defined groups
+ * and functions, create them in addition to parsing pinconf properties and
+ * adding mappings.
+ *
+ * It assumes that the upper 16 bits of the pinmux items contain the pin
+ * and the lower 16 the mux setting.
+ */
+int pinctrl_generic_pinmux_dt_node_to_map(struct pinctrl_dev *pctldev,
+					  struct device_node *np,
+					  struct pinctrl_map **maps,
+					  unsigned int *num_maps)
+{
+	return pinctrl_generic_dt_node_to_map(pctldev, np, maps, num_maps,
+					      &pinctrl_generic_pinmux_dt_subnode_to_map);
+};
 EXPORT_SYMBOL_GPL(pinctrl_generic_pinmux_dt_node_to_map);


--Yat47aogx/LrUfFI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYlJgAKCRB4tDGHoIJi
0oQoAP48vMRu/kfGiS/RrfiiMgWW8boOp9U3c4wQY1MmeZTQvQEA9QNJR63VyECY
gCqrJaYSueEBY2GU+tAzszoLF1szQQU=
=RNRT
-----END PGP SIGNATURE-----

--Yat47aogx/LrUfFI--

