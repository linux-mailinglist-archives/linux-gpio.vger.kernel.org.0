Return-Path: <linux-gpio+bounces-20244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57CB9AB9265
	for <lists+linux-gpio@lfdr.de>; Fri, 16 May 2025 00:51:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DAB71BA7CE4
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 22:51:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46BC928C2C2;
	Thu, 15 May 2025 22:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Pu1VaHdm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2075.outbound.protection.outlook.com [40.107.236.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E1171F153C;
	Thu, 15 May 2025 22:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747349484; cv=fail; b=emA/FAWnkPqYsYfyqBcdGdAb+LV47sUq+Pj66LK48pJn8i5tyiRBkjtmj59KJc6nFw7Hv1IWEo60mDJpYPD4xYUTCONOFszKe0WJ05lf8YiOlbUrGzE0Wl420R9XF9a15vMvWZ2bg7rtHP790cJZZalOM8eMze1alh3RH1PBujc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747349484; c=relaxed/simple;
	bh=jw0PFwbuuiK24awk4W6q/feWYrhypA3cjAkJHw9Fzug=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tjUPhyePQKsmn1uwETUGjMQAirKBsspx+PcOSosS/HJSx3xA3GN0ngm3ofqaBLOtzonw+HihbvUnSdUPSL6ThjfQY/ftGaubAwAh1t5/8oomqGyD8V1SAISTpmfkWS7TuZTBBWYtX8a64+ytBhVqglTpl7B2QEQwB8vUzN9xlXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Pu1VaHdm; arc=fail smtp.client-ip=40.107.236.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gFmTlXUWcwCmnRLeyA35IdSOO/WyYCvDJ4uUbpHSwSpdqnWwqF/1n3jK+Ee9nO0UL8+k1iNoOoeDhbtBxu7LbFeTWYOTA7EzshlBePZSlw9FhX3dhw4+7WwLaB2LxLsjkLw9bXIZvqaeO3nuMD21+G2bgsKrjIvyn9JLKcIQCHTuH9wblZZKNHokB40AT7SbSFZX4YsIWQlTQs3rDdgmkZwkPRGOnifWSquFiGN8E18FqUokMH8VDnUqP3+PdGg57QxW58/OVsCd4PhE8nMDSP6IHdI7zyGasV2w9mQ9seY56nndvbYOTlHvpHKlVeRNzhzgYe44XjCSo5rAA5wqNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GexVeiwwLdNy9EMaPsCLcO+HEIRNg+RmWjvpqJjwmWg=;
 b=u9H3ilMLr+vWxOLpSio3CWm43zpUDIDSaUA7/nfRsFRae4WCkbUYsMR0LaxXUwv+/wYhtujZOEIvrNKz1k1mpyj7wtFN0IXIf8CgtI+7suwhGaLqdC60QpSd/1guiJI2f3Z2C6Mpzq185mA+MvKocyfP7L+8LOVd78bdxH8Vzl8GDnJehoQFiZhVSGEEXT6evj0TonG1HnCb3n69x/qDLP+UKhoGzLvHMx38vqfXtM5VS44tE2eltN0S2FtJKv7mvjoBG3+gilBvVBcjZccJjBrBgS0ZDci1fEpmjK2ZxiboRbT/NMR76Ml8ZJ1PRkkq3d7kql4heTc/9oii2fSccg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GexVeiwwLdNy9EMaPsCLcO+HEIRNg+RmWjvpqJjwmWg=;
 b=Pu1VaHdm8Js16bvQmzO2sKuAu5pN92zpyGYxwGmMMJUkOBWspPR5CrfsTeH/dKXtCi6meGBOOupR0JVCEqHmSq0gH7SBOIvxiwJvajwnpaawi+uhnJu+7PbDyjzfVeZBLnzBhoi25Kd2Qd5mcNbRvaDxaZzuDc46mwZWAwKTPw/H2uCsBokOFs6BFUfr/j3UH7iJbjSTzOVkGQYPSzMikNJL+Dyb+nBubiL9DFt+CxgEvljMY+vD2BhsmZM54kxyFlY+Xe8s9PZufzSVjZSwpJeA13qed5nKlv7QIlZgSwRBVhbTLOcTlweImIEnopQ3jpZSeLshJYxkN+1nv2hs/Q==
Received: from PH8PR11MB7965.namprd11.prod.outlook.com (2603:10b6:510:25c::13)
 by IA0PR11MB7816.namprd11.prod.outlook.com (2603:10b6:208:407::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Thu, 15 May
 2025 22:51:17 +0000
Received: from PH8PR11MB7965.namprd11.prod.outlook.com
 ([fe80::ad6c:cf56:3c3d:4739]) by PH8PR11MB7965.namprd11.prod.outlook.com
 ([fe80::ad6c:cf56:3c3d:4739%7]) with mapi id 15.20.8722.031; Thu, 15 May 2025
 22:51:17 +0000
From: <Ronnie.Kunin@microchip.com>
To: <Rengarajan.S@microchip.com>, <VaibhaavRam.TL@microchip.com>,
	<Kumaravel.Thiagarajan@microchip.com>, <arnd@arndb.de>,
	<gregkh@linuxfoundation.org>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
	<linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<UNGLinuxDriver@microchip.com>
CC: <Rengarajan.S@microchip.com>
Subject: RE: [PATCH v1 char-misc-next 1/2] misc: microchip: pci1xxxx: Add PCIe
 Hot reset disable support for Rev C0 and later devices
Thread-Topic: [PATCH v1 char-misc-next 1/2] misc: microchip: pci1xxxx: Add
 PCIe Hot reset disable support for Rev C0 and later devices
Thread-Index: AQHbw+gjXcEcB6a0LEe3pRMswGcUKLPQnIyQgAOxiLA=
Date: Thu, 15 May 2025 22:51:17 +0000
Message-ID:
 <PH8PR11MB796563EE3D53DDD693AED6799590A@PH8PR11MB7965.namprd11.prod.outlook.com>
References: <20250513091557.3660-1-rengarajan.s@microchip.com>
 <20250513091557.3660-2-rengarajan.s@microchip.com>
 <PH8PR11MB79656E8B640C7497F074DDF49596A@PH8PR11MB7965.namprd11.prod.outlook.com>
In-Reply-To:
 <PH8PR11MB79656E8B640C7497F074DDF49596A@PH8PR11MB7965.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB7965:EE_|IA0PR11MB7816:EE_
x-ms-office365-filtering-correlation-id: 1a0965ca-1f54-4784-80f6-08dd940300a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|38070700018|921020;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?MFa1s/TigsWrrdXnIGCOC+DDtQQYrHDcVyJVgCh/kZ8O3wLvYOT/VLr1mX+C?=
 =?us-ascii?Q?NUnpxHPJZmo7M9PnQ5e35vubsUhGj8q0OztFr7WlKmvrvAwqF3/u5fGnWPuQ?=
 =?us-ascii?Q?ykB/6NBjO8f16lnLwYIG6jenYF3MWsxyoQj7Q8RCdLlqwuJRNTHbOpiXsy/O?=
 =?us-ascii?Q?6YK5tzfO2G2vqtPsFGL0N3tGgI+xkEHb3mjfcwORZHvmTz6FuRe02vcmW6kA?=
 =?us-ascii?Q?DXoeGw4CiM7LZ9JOpKJciQUNKb64iWEcAS0VlrNCC0Jn1fbT45brqDZyO3qZ?=
 =?us-ascii?Q?Agedwra6YogHUzLYhgVt4DxnddyuGT9chURQ0idC+CsDM1A9ueqESeurZ4UQ?=
 =?us-ascii?Q?eSmemPgZlPP0k3y6Q3MjeC0rw8Ofrx9XQ6Tn1tPVY8AilYSk925gNKoBNro9?=
 =?us-ascii?Q?h8IE+rf7F3fzLkJ1v2uEteZe5p1RJFpH1p18MypZW+ndyhFtQegWpB/B157W?=
 =?us-ascii?Q?jHDCS12SH/fD6K2Logy6aBF8/4H0HNfnx/Mamr5a1jb4uwYlDvWlnoWV9K4D?=
 =?us-ascii?Q?hcnnrZkLDdranPfftZIjeq03i+1razN916Wg4P4JJEkkNtBRRaWBXcSWCZH4?=
 =?us-ascii?Q?NPcK+T6e0jHIki25RuKaHr2EvbyG0jn+LioQKl8yxDXmkqIqiy/8kGlCkcvy?=
 =?us-ascii?Q?Hz4aJNO4kiUKQmG+18v6My2wvIiRvlAjpRlTOsI/jwowUwkICtN37nviIm5w?=
 =?us-ascii?Q?jYlaufjVpGP+qNa/ExacDl2V55k45ehWR/Zt2/GILS6jO8bnpGd6L2Xs7WJV?=
 =?us-ascii?Q?8cECXarU2qRdrnMjmuLIgqSdnsF59bWQJdJxC0HhOSWUhGQHMGu0MZNgp+0U?=
 =?us-ascii?Q?EtziHSFdlTCzvtHfkhFnDOe16zht8amqn/WbWm6wYJJNsMkIFG+HnpFzRznj?=
 =?us-ascii?Q?gzNHF1o8visckkG7QuTOLqJiiljPOTqtxXpH7SRcVrd0e2uCvVHY4MmFNoYf?=
 =?us-ascii?Q?QRKQL48p/5qhSzNnUihsZ7oEKhNvNt8dyfsRXYfaD12oLcA6cfQI35doVrJA?=
 =?us-ascii?Q?VnTOiKp3zDiAWNp1bi8pK2i92jGV3DSJIQaVTQuqblpH+cMlLK2zKRaqgCta?=
 =?us-ascii?Q?b/4Lexeakn9epmXEx1wmAcpyr2nstNI217T7i4rdGa1Q1XYIyi+AsuITyAyz?=
 =?us-ascii?Q?X2P4WdkKwI8YyFiHlkhsq86aYIGPSrrm8es+9zSh8N0DgFkENIIrb0cvY+aV?=
 =?us-ascii?Q?I4jVkGaMjlRiPL45ewwNvzHCd6iER7llU49gLeTTFIC8UvCDkG7OFygODlHp?=
 =?us-ascii?Q?5VWZ4Q2CNaMVjwbix3ENBArqe59K+sIZ9pOr3iTzpBUTFJHNG8OUjntTgk+7?=
 =?us-ascii?Q?sKt7vUOXUKjHicjqLK2Z2tcEmvUwU63/SIzYnPN5svpk9gopwWPdXuTeVGmy?=
 =?us-ascii?Q?rF2c5LQGn+v1mIaMcTYaAl3wDqooj51/aj6TBXV/BhhKBEznTux8LCzxUgCW?=
 =?us-ascii?Q?pvPYT3KU2t6unO51b3lYKSfsU7WyGRLVANrFkf2jJNlnpwJ6UPuZFqUp2lZI?=
 =?us-ascii?Q?W7W4/g/G59Lw3qK7ITkgPeoKbnJeesFGpVB5?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7965.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yhLfeKpNmYIWWGkaVh5oOslRk9XKXlVJn8wouCJqKIq2KEt40KtF1pSGjwdf?=
 =?us-ascii?Q?ZWxs3MgnEZUU1sGAAHqyBjGizQ3DIAxfUfQmai+7ELxaoJRvjDH5UT/WgPqh?=
 =?us-ascii?Q?If8wYzo90EwNWPxS8UWuxDg5Mgw4bpNo0noauKzJXDgp/TJ8aV0t7iPhIyAK?=
 =?us-ascii?Q?AhD4jBiOaBuCLgziVIU+kK4R7Ey88+KEYOyH0cyDSt2goVe+ne8j+IUUJm+o?=
 =?us-ascii?Q?6SD7gyyCEzIZoh1gX0WluavE6D6Gn6O5qzhPgcBn8ftUzF7stYbOgzsunBBg?=
 =?us-ascii?Q?lnDP3xuWxwlsyswLfcaZLpg+XKNjTeH6eiehzapKSjNdqzC2O1Qtj+kuaLaV?=
 =?us-ascii?Q?qhBuEBlyoHAFWBDiLBidGgPHsPHLr5LjYLxVkXjFpGna0jYm6C8Yxj7BuQN6?=
 =?us-ascii?Q?py5MATb21a63+7wvudJ89XlQR9sD94WVHth37W//Ve+8iBC9KVXe5ktLjMHB?=
 =?us-ascii?Q?ty3+Qqxvpzguktjnd2R8dGxLNFV7xKZ4C7DRIRW715OKMs796l6dESDAYA7Q?=
 =?us-ascii?Q?GZDZFLeYNVaTIlaf2bsPkKTkIs9/OvdL9fSRrxYJQ2epQY6knOX/rYn6VkkC?=
 =?us-ascii?Q?xJ9QecZSoPYUA/yrmc70fuvKOItfz17dI7Do9P1xYqgpa8Sm+oyI1edIWaFY?=
 =?us-ascii?Q?EEExWfXnaJ9Yh/h/BfB7xP0GsdMBLDZrERD8Juc1QRBKcHWpldFSFmFUusye?=
 =?us-ascii?Q?6yErYEKNOhoo50pIu2oZEa4wg1yy7jke4SqiTUwmIVUpGS6kzETBRzMagYXf?=
 =?us-ascii?Q?n1RY/25vm98r0xfLdT84P6D5CTUQtA21IP6/gzvZryU15OjDgcxgFysVPzSH?=
 =?us-ascii?Q?ulgwg+0sRevxcCRBTrOjCE5MtYYfObkFRgEjMbirDJUXXYJuY/U1l764Nk8X?=
 =?us-ascii?Q?p3XoLlhaQPnfVqFwY1nsQg3aZw5oPTGr7hiBYDYVaHSmpS3BfqRcbWCH8UXv?=
 =?us-ascii?Q?FsxHBhCBs6k+Qz2/oL9j85DIQo1IGii9dIfBdf4Gle4p1s9BB1DMrImwFvti?=
 =?us-ascii?Q?hbDua6VxhrixVn8Ua/Ah361EGNXtiqwaqXBKPR02iYcR6raOeV4P+zE8ceJi?=
 =?us-ascii?Q?4GngM8fq0qKe0CRcRDS2vL+C9ivN8kG+pTzc3O5ul3QzFMW3wKQMBj2sEOnX?=
 =?us-ascii?Q?DgrrgTLTVf8Tt4lXA7H89ueTE5qlV5+wVT5oxvcdPeuCuitt92NmCaAdUb+K?=
 =?us-ascii?Q?QB81lDuPwFMTPBSn+qbySeQF4fIoG9LgPtWB0r/bwSahtwpD2pr31aTc8TYB?=
 =?us-ascii?Q?ASxrDY1Yk0th/3rmd0wN24YF61gVlmGij0nK9Am4FgJVS6PMDJwhsiT7X/tv?=
 =?us-ascii?Q?i4t1E6Ed4TlFW/IPtmNgHY3THTwe6SGD74tV31uBpk775fujfPL1b2QbwPUi?=
 =?us-ascii?Q?mzpWTVOm7BeuRJJb9neTCvWgjzZZwr1uPNQO2wItH+f6t62zl5w1zDfURZp7?=
 =?us-ascii?Q?uSE7eIeCyhU/KWSdgrC1Ct1Fp4/HmGLY8iENrQpQ0Ypym79TCBz5jnWupipl?=
 =?us-ascii?Q?7/IdFouJVMwkfX83E8jHX0AgnNek8IoSU7cFLqFH7pKRn1BpYtlgyTsQ19Vb?=
 =?us-ascii?Q?RyqtzUWjFPcO+tQa6bpJ2ODBv/vtWiRbEznyuvrk?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7965.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0965ca-1f54-4784-80f6-08dd940300a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 May 2025 22:51:17.2387
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2w+QNaWlifIfZrj2yr/4l30uqU+fqse5fqZxvh+xseVYN7Ig4Dwchw7DfW6u7/SVvm3N5E2k7YRw3emxbMR0ImL0vxpqkZ2wSUtAsB8STIs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7816


> -----Original Message-----
> From: Ronnie Kunin - C21729 <Ronnie.Kunin@microchip.com>
> Sent: Tuesday, May 13, 2025 10:26 AM
> > ...
> > +static int pci1xxxx_gpio_get_device_revision(struct pci1xxxx_gpio
> > +*priv) {
> > +	struct device *parent =3D priv->aux_dev->dev.parent;
> > +	struct pci_dev *pcidev =3D to_pci_dev(parent);
> > +	int ret;
> > +	u32 val;
> > +
> > +	ret =3D pci_read_config_dword(pcidev, PCI_DEV_REV_OFFSET, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	priv->dev_rev =3D val;
> > +
> > +	return 0;
> > +}
> > +
>=20
>=20
> Reiterate my comment close to an year ago for the SPI driver
> https://jira.microchip.com/browse/UNG_BRIDGEPORT-
> 5468?focusedId=3D4336619&page=3Dcom.atlassian.jira.plugin.system.issuetab=
panels:comment-
> tabpanel#comment-4336619
>=20
> "Just so we are clear. using the PCI config Revision ID field is NOT as c=
omprehensive/safe a solution for
> checking the chip revision as checking the internal BAR DEV_REV_REG regis=
ter's REVID. You are only
> guaranteed Revision ID to match the DEFAULT value of DEV_REG REVID.
> While it would be highly unusual to do that, if a customer were to custom=
ize the (VID/PID) / Rev for his
> device they will not."
>=20
> If you are going to continue to check revision ID thru config space in mo=
re drivers for now, then for each
> one please open a new Jira so that whenever you decide to do it the prope=
r way you do not forget any
> driver that needs to be updated.
>=20

My apologies that this comment with microchip private link went out to the =
community,=20
it was meant to be an internal Microchip discussion.=20
Just short FYI to the maintainers, my suggestion about a "proper way" which=
 we use in the=20
ethernet driver of the PCI11x1x devices for other purposes beyond ID check =
is not directly=20
portable without other major changes in the architecture of the GPIO driver=
 which is overkill=20
just for this ID check purpose. Therefore, the implementation Rengarajan pr=
oposed in this=20
patch is perfectly fine at this time and I have no reservations to merge it=
 in.

Thanks,
Ronnie

