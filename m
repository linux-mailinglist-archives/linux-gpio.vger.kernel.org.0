Return-Path: <linux-gpio+bounces-3529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A384985CBE8
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 00:17:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A2BE1F22FAF
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Feb 2024 23:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F3A76C99;
	Tue, 20 Feb 2024 23:17:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=scanivalve.onmicrosoft.com header.i=@scanivalve.onmicrosoft.com header.b="JsWBNUYn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2103.outbound.protection.outlook.com [40.107.220.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B82915445C
	for <linux-gpio@vger.kernel.org>; Tue, 20 Feb 2024 23:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.103
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708471052; cv=fail; b=Oc8jbXh71oSzgtUVygqbIshl4gXIiuY8eVTZl2EK+g7cD5R5wsf3h92tK/8DXfNDJnqXi5h9zu+36XZ2dSGkonakvqVj02a2YESeoCWXUnu07NIB+Scbp4ZrKecjCAVSO9ScX1u7YZa2M/gkqu0JGQeeahQplbb98Y6yScFryBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708471052; c=relaxed/simple;
	bh=X5UrvPqPaj0qKswSNQS/W1M0z5IJ/lE5WjHJNsBJHRc=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=VSuUvIsbQykXueBab+T74bFnn1uxv3IF+U92B0IPgDXoI8KVpl6w6CgXlRrdu+k0gzEpJrnyKa1FvN8lGDcladvbK8scZQhRcf9pVn3PL09Nw+IAVIqmnz1t41WGH/R5yLPDil2UDr8k1GD+raVpg88YMstvpmH1AQ0NeskZgrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scanivalve.com; spf=pass smtp.mailfrom=scanivalve.com; dkim=pass (1024-bit key) header.d=scanivalve.onmicrosoft.com header.i=@scanivalve.onmicrosoft.com header.b=JsWBNUYn; arc=fail smtp.client-ip=40.107.220.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=scanivalve.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=scanivalve.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PQJgE07apxOYygnHX64eGBpSZS/kgwu/jJIkeJ9/nVJ8NufcvFCQZoMjc0WSAb5CL8JTqNAxVz57vtPgYfm4xhSMlzu1uTksj5bVJH/Dy74uTReDq9tFsJaDsR1HK+lottHJPFSDCYvsfKQEMQzyn79yR5MqWtFXCEuwaxoZyL+D2paNURiJW6pOljEcnerQiGC2okOu50uZYHrU3Dk8xgjXFvNE0cNLyFwSB3jYoueq/2pDIcpM/4gJL7qxhZXluE6/KWkAnxj3hmUaecL0PHM9Ym+v+K1SvXZ9bHjUNhsZy4xsfWUB7m2k0aa40fARMUCiTgAUFwl7uIAkp72N7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JDcF0E5cH99lMnkGV9niCzC4W2KmEOr267KZdb+uxA=;
 b=B8Yzo59JY+oEjLh/XKm6zaUi0UMFsPOekp/KI2bxxWAqOVcLVe/QOxjntLfPh+BD4Iwa1m9u9TY0BuF9NPOQ8Za4wwlI6alUYH1B7IC6mMTQypw0p0HMwZ7KM++I+PPBYMXjxJogHLsTMYl9YIpxgJJiSzhjiDMqvUQ11/mujOPuYaNyuTN7GQHtRtBzY+UUuy/Ndtt6BicPUJ8GMJsRYvuh41t10rvCYgeaSkelvZOetin64685zxkH531I2X0OxZcmy/D/dntipsxNiARcX7orltPaG6FgU8zv3SaeCsLKhThgzgtwS7D4ewepobJCdjkbfibqGEnT2cdUQkycLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=scanivalve.com; dmarc=pass action=none
 header.from=scanivalve.com; dkim=pass header.d=scanivalve.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=scanivalve.onmicrosoft.com; s=selector2-scanivalve-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5JDcF0E5cH99lMnkGV9niCzC4W2KmEOr267KZdb+uxA=;
 b=JsWBNUYnedGKE29JzmVpxCqbU6N50tGmwdUtuis5JmU0QkxJD4RY+OLUliwmPmm8925EdDFlqe5Iq8jf/1nVdyk4Y0KnioNMmWl1qzP/rTSeQPlkm8YNOtvmxwMxM6DVJxwjrTnn9/8UrSzV6fwXtj4m7pMVb5bz4c+bKFkMVaU=
Received: from MWHPR1301MB2208.namprd13.prod.outlook.com
 (2603:10b6:301:2e::17) by BY3PR13MB4771.namprd13.prod.outlook.com
 (2603:10b6:a03:367::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Tue, 20 Feb
 2024 23:17:27 +0000
Received: from MWHPR1301MB2208.namprd13.prod.outlook.com
 ([fe80::7025:7204:d379:26be]) by MWHPR1301MB2208.namprd13.prod.outlook.com
 ([fe80::7025:7204:d379:26be%3]) with mapi id 15.20.7292.029; Tue, 20 Feb 2024
 23:17:27 +0000
From: Jeremy Mattfeld <jmattfeld@scanivalve.com>
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: sparse GPIO bindings for mux-controller
Thread-Topic: sparse GPIO bindings for mux-controller
Thread-Index: AdpkUPHWT0vZg0Z/RgyLu5AaJtInxQ==
Date: Tue, 20 Feb 2024 23:17:27 +0000
Message-ID:
 <MWHPR1301MB2208CCD810C484F0C269D048C6502@MWHPR1301MB2208.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=scanivalve.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MWHPR1301MB2208:EE_|BY3PR13MB4771:EE_
x-ms-office365-filtering-correlation-id: 7f65e1b2-64e9-4098-df14-08dc326a1ad4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 G/oUldx0RD45e6qHDPwq4c9IyGY0cZd2cdAMpYcpTG+rQ9sKzuFgvcz2qyCPInx+YnamkyyXv+9m8v4jr02/iTRxQz/gqbek7m0uxVIBl7RJStpe51tcWdS3dhABVXq+FNH0EEweHcJdlWZ4S4K2SCAO7N/e01uTKBlvKjJlLNJgjjiBtjGMtsBE7/zz0RlsB5IMBJgBQOVJw1iSweFm8rnbsEk3DsROdRlANIYzvmkcRrmYjNghI0f6lzOMSc10pogwxLIwlqAJH2oKR1tXyLvk/j/AVDT/K42LLHCbdBYTF/9sNpt8hS607sLxXD31v8pDmBzgslDcxyZJl4eDivLVAbPIWrSpZ2VkNNIW8rFijvyGacpr/BHoFf9+ryB0XJM34HjKjHWM3o06BWb6DUz8GiC3G6FwXNIbLBGocX3BynIC8nYHPwxsrgcIxlBA68JrhISPYMO/bN20rS++mYCXqqJoUYbPGNDb9GvZcGhsYTz1kMm3w16Vy7ahgvRuCbXLA7zOpLbZQVwx6Auf0mz8x0Ztow8dQXNlzyLgk82jy72sIQ5LQct10w5H+gwEdd2SEPMRgIh2bTSmOhki/5zEcf9eCyH/6IdzWF3u+LnGcVWQ/z6ncqtOBh2hhbpt
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1301MB2208.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?FlAGj8x+V6d2TKRuncYmFCF8NBdY1BjA7rvIyX+l6Is1x3qxm6xymImf6rfN?=
 =?us-ascii?Q?/70cqYA+l0CM4NzXWfWH+wQZ1HWCq1kXqhojMtsaeMbFXOG4ex3Y+EkQE/+L?=
 =?us-ascii?Q?yfe9o1Cf6Tnaa/mymtlDc0nyGD8WNlHadmopm8EGs+QJ2vnU83iEWG5Fn7ZQ?=
 =?us-ascii?Q?gGjmhOFwfFnZR8r5JlEDwRqWGrGPlEaMROmDRYu/15QDo4Iunut4KyNgJSEA?=
 =?us-ascii?Q?bBju2dwDxiL5SArnfH14hrpJi2F94oGytNgN7FnCyX+dyn+1qXiJznpInGHA?=
 =?us-ascii?Q?yaMhIY9fdPbD/LBkA5BQQuFt1vqfckxQSUel6pCRco1Xi3gQ0DKltvSs/Nk6?=
 =?us-ascii?Q?zcwKzmSXmsdGOc6zszrJJmVyQeIztOC0hA/mhd7+kGNUl1J/IWdRuX1F1g5K?=
 =?us-ascii?Q?OhjhTNX+uxgb+ZqoVg43pmocdVZzi+cL5Yyg666TE5RlWdoKO7XpExOYaPrK?=
 =?us-ascii?Q?xVAjqfY1dJoMWcuaSDACWpbvJP7aEWmXK3R6IjU8cN7r6ETxD6uagqJ5nQVp?=
 =?us-ascii?Q?dTcu7TMY5XgoH++ZzFn/93OeO9T30hB5lQDIQA+Crs1DstSjA0F4VZVsFYXY?=
 =?us-ascii?Q?em5qnzGOlcoNZMqUWiZVeslD2b1c4O1lo2795CIIrMU1YreoTNpcuryG0Y5A?=
 =?us-ascii?Q?X7lRZWKYo/b+yQ89W3zRm5b7ouo7j35KjAVmWvce2ayrPFtKDxz5mDSnk0Ol?=
 =?us-ascii?Q?FNUfc9qje/2aZO6nt/8EcyWohLgftw9Lci1MXP5p7qk0mGTI3Q50P4vAiPSt?=
 =?us-ascii?Q?5zNfRG2+fQwRNtvO+8l0wd+qOfT/KZ62EA+nhqiFWM39ja9FeR7lpKKKKzgx?=
 =?us-ascii?Q?0nXqPLEUvSsDcl/UfEedmcAFEfsJ1fUzNm31TjYLsug7WN9Z3xbnCQElrJlC?=
 =?us-ascii?Q?6nOaUs/VpqgfyBmJZb0H5s0IgSaKUmhM4st2FWSR85LwOJnpsMXrPQ6PA92H?=
 =?us-ascii?Q?n6IS41WKw0xNgB//mPXQATC7C8jBYXfi3JHUmd+e5/rRntfc6TOAiARyAiJM?=
 =?us-ascii?Q?thqwrdW5xDuL5BGY5ruJD6wjV/GAtvnJ9TMSiwxI4SJink19Uq6Mutnc55mz?=
 =?us-ascii?Q?l7920YMf9nLihy9vrECBOA+H79gPjk75zcHOl1xR2q2t+Urg6jreujF//Zpd?=
 =?us-ascii?Q?T8Lq3OSd68WHIrj5PQ2+IBnIZIphPiVIaVraOhrifE4eYEHcDE/2Sj7YnXU+?=
 =?us-ascii?Q?xlky3g7vAr68msryUCiXOvVeM2HXFzeudX1EZQ2nuMm2f/eC3gA5Ri5+8Vwi?=
 =?us-ascii?Q?udMR96DTQBy4LAqf2jpRvUMALQoSAAu1A3R5+TrEsyLHYgRynOyUlZXFUkkk?=
 =?us-ascii?Q?3Nrh6uGLDAZwRugHXcgMi/TGR7xnmdppvI0ht56J4u+/KcN9HvEZYkCRoOvR?=
 =?us-ascii?Q?EUYGP7x6KGhXyCMcPsvGu3kfFmd0X7A9pAFVPn28fy7Ahcg9Zrn34Nykt0r2?=
 =?us-ascii?Q?OGGfiKi9ctcwTfsiCU2svmViroGkMhXAvH9rPOQjeJLCDfZuw2d/9cRwA8K5?=
 =?us-ascii?Q?zy+VoM7ksa1FzR0zJHy9OEKpzTSiQsRCBsueUZJ3DhwOH3g/SYQ5tOEVJTcZ?=
 =?us-ascii?Q?utGsmgpeNFiaGFDDwdaHAdRdDryw+y3EDlBtpIJM?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: scanivalve.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1301MB2208.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f65e1b2-64e9-4098-df14-08dc326a1ad4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 23:17:27.7767
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 86940f44-8cce-440c-9d35-85b42cdf1753
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: spOkMXdWnumtHmmwfn3Ox/OdCiM3nlBA7TxQ9zYv/OA4tbJdP8Zw4Y5KNjzUgRt6fhdz3pfGvqDX0bVxmmDf3APoLTj+xOFQo03GPy3pyJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR13MB4771

I am trying to use the gpio-mux and spi-mux drivers to control chip select =
signals to an array of ADC's.  I am able to get the mux-controller to work =
only if the array of GPIO's are a contiguous block of GPIO's on the same pe=
ripheral node (e.g. gpio port on SOC).  The docs for the DT bindings do not=
 seem to state any such limitation.  Would it be possible or useful to allo=
w the gpio-mux to set GPIO pins in sparse arrays?  I have a hardware use ca=
se where this would be convenient but maybe it is not advisable or clean?  =
Any feedback would be appreciated.

e.g. for a 16-way controller:
	mux-gpios =3D <&gpio1 0>,<&gpio1 1>,<&gpio1 4>,<&gpio2 12>;

Jeremy Mattfeld
Software Engineer
jmattfeld@scanivalve.com
1722 N Madson Street=20
Liberty Lake, WA, 99019





