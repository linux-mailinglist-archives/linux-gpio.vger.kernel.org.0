Return-Path: <linux-gpio+bounces-34446-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0HYSLr3YymmWAgYAu9opvQ
	(envelope-from <linux-gpio+bounces-34446-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 22:10:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id BA620360D54
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 22:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A745130102FD
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Mar 2026 20:10:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B51396D2A;
	Mon, 30 Mar 2026 20:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="f6F4ohmK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from USG02-BN3-obe.outbound.protection.office365.us (mail-bn3usg02on0056.outbound.protection.office365.us [23.103.208.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940852D97BA
	for <linux-gpio@vger.kernel.org>; Mon, 30 Mar 2026 20:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.208.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774901429; cv=fail; b=EuXF/RTUDRUgBdIeIGpPSRrdy3UN2AKx8k4nadwHkgktllV/XiVbgkaiVsh3uSZB7waxzu9j4SqlKC7LpG/BxJXjRolf9GMoW9LMNvintam6XA67XwzjJ90HXjc3hTm0lxFAr6vOFUS14GhTH+1DgL1Gn28hK4M+39a1F2iuMqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774901429; c=relaxed/simple;
	bh=49kIQqisiGGGVFAQ9M2FN4wRiBvHp4Iwpk2E+SMVMf8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OHuMTdgTS5QBeXvPOjQRYmrxtRt2R92lfj0FlQj6zf8zNZWB7FckdPI0o3V9HT5vKtRpJsO2dIRSH7Qwaxn0hsTHrMVs1OnC0iwey4L1S9jRbax5hgunPkwJ2kt1S7AsN1bMF1kk3Zz3i2A77u/NhPUfIaX6zU3pbnxuPsZhGQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=f6F4ohmK; arc=fail smtp.client-ip=23.103.208.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=G5WkFw+k36P4gZVfd9YLniUNcFcJHAw41PUUFsuG88prHX3dufqwsj3etHU9OlCPsU+QZUpby50ppmkRObr9EI4rfreIVKgTI13gGc6oN1xhdN3QavIarOoPQa55P2/DtpJDdNYvLtffdBltw5bBXQC6XTLienDQdFeg7Gp/jP89sJdpGqjX8SSp2GPOjOuqRyHLISRldPt+HnvPiv4WXLpKMwlAC1i1aVO3n1kXa8MhZHfiuD4ab5ZvY0AcWyCHrk/dbn2Oy+YQyH53AN2NZE1/ZxIvZFpb337sQyuTk+lwB+lb0fRVscIPVF9VY9zMAgIS7fjEVQksJSkOV76KUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=49kIQqisiGGGVFAQ9M2FN4wRiBvHp4Iwpk2E+SMVMf8=;
 b=LLUpS1UIcjwR16fDOLyHSsCAPrKmxIc4TX/LptCZx29d4t0BtmXde46ZCXL8RxR0ETuStrw3/jTMvP9PYE+lO51tusT5g2gMhIml7p72sc+LiKCdiz1sSMgM9htcWLmFy5+WvhNwuVZsbsMOrPr4FIoijSrd6Q8F29WRdQJh0uq09k4czYi9P75d6Saw6KM8dtJ6LDW0l2VjeVVqsUhsapjte50eyHvjkLIVqc0l3fvGtrgPN/3RMSjN5ITSYIYZnlIKuSgjfnmO9OiIoGFlN8fBkWZ4KY4p0E5opJ4zJs3EK7Nw0fLXuzgBmp5fU7yUfcs7BUlacpsC4q9s/SGN8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=49kIQqisiGGGVFAQ9M2FN4wRiBvHp4Iwpk2E+SMVMf8=;
 b=f6F4ohmKGSuKl9is5OBle3Df5Jk0dxJQCWb31tyyjpGD0fRYJGHVuKjRcflk0qxlaKqsFhglFfG8jpejSRTABMB2661tpobFiwK6ln0wn3qEnpeJElEk7FoCVXyb2M6aqmQw9bfEeajEAZSILb446+8xdMOxowuaLjs+N7wUkQ0THLr7qJaLsGuokrDJZq4re4eSK/+0ygjvLwjshW9y/AnR5Xo9ylsJkQIigKLHYbAl1BuId5ayZjBWTDAtdEaqDF8+pgZ4zoFVhrCeZw6t20qD08tX2+ElTKrmCgSfy1JY7QxQ6XsqLcIvSSSqMikias5eavQE/i//UbWaH5nalw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN8P110MB2498.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:4c3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.24; Mon, 30 Mar
 2026 13:34:14 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%4]) with mapi id 15.20.9745.024; Mon, 30 Mar 2026
 13:34:14 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [libgpiod][PATCH] Revert "bindings: python: replace
 PyModule_AddObjectRef() with PyModule_AddObject()"
Thread-Topic: [libgpiod][PATCH] Revert "bindings: python: replace
 PyModule_AddObjectRef() with PyModule_AddObject()"
Thread-Index: AQHcwEnmxcFKFQmT4kin7a+SoHZ75Q==
Date: Mon, 30 Mar 2026 13:34:14 +0000
Message-ID:
 <PH1P110MB1603DF3349C616940C07CC6E9F52A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20260330125023.109789-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20260330125023.109789-1-bartosz.golaszewski@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN8P110MB2498:EE_
x-ms-office365-filtering-correlation-id: f8c400af-c0e4-452e-8e9b-08de8e6108ca
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|41320700013|1800799024|55112099003|22082099003|56012099003|18002099003|38070700021;
x-microsoft-antispam-message-info:
 /vkV1rYOK5crUI4FooRh2SZTKz/wymcLxhRxdhAYTcSnBScXMTF2vjWa0HuNLP7x+tlA3gZcsUAFYjWyn3wzOqxvGaBzUrERpgqa8kSj3K/hfRwV61A/Mvf/3HBIRJrsRKt1GkFjxeXSbHipocrIUfP4r/rqSEm2zjHy2fYfIZNFsSuuLzens8VB09+PdVy2jJ4EgY5Llx21bBJ47pURveoiGiFKnnYoZPuPbCfwCIg2POi8R8JVZqIVI74f5GyEFxVJja2ZBemhQPiD/b7+HSZvJUg/LgRyKYZWBRtuvRO9AljPPNAxcgJvNxkEXYp6JukAzRLFoNbUO6hgg5uiwUr+XtID+b3myEHFVkKv5nbneETQlEteOud9dLqYG08lx3oCYQCSdidaLTRTGs0TVu6emvWfmHWflnXK7zthrezdrZLqyk7JTDVuwjNNQbN0VsI8q1j7NzXq4VbgqjB+TC+k6OHNeyg5ZQYah3jClyumgkoeGDy4yaB1p99r5H8eusrTGuM49C0sHUyPib5c8T6925HrA/TdevHJDojG3Jaat07mnNWqaFcIOMR+odxC+F0wU7ImXlyAzd+NlP1J73NEcHB+PrvAu7tpzuzXbHX/XCn8F4Zn4dMyADooBFmz0uRd05sqpqh8+ys0eHDADWuS6Wc5XGK3W7nWv0+sy96+FBUgeg8oiraSMj3emaK/EwkcVowppiyUT3vUAVx62JnVfbqAt3dMWssuH/tLb2ZbzZHvm0objXOR9XR3/GtUQ6hz8Ll/IzLdM/mQVkZrpTXiNRAmLjQTrLYVfgYaKnE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(41320700013)(1800799024)(55112099003)(22082099003)(56012099003)(18002099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?HAgjTNYS9Kfh2X2fRFiF/cbnJB0m0/8j96NLi2a0n3U6SfDtCE6dRhPrrjx8?=
 =?us-ascii?Q?TgtWGBmg1a+Wm5/z73d/ySl6IJPPhk7hp73XjPG/4lnfg+Vy0dbyiIPPWjIP?=
 =?us-ascii?Q?lVwhXMvtBaRzYQksbz3WVTt134xk7ba3S4y04J7YhzRGbVZEIq5BZRj6S0xw?=
 =?us-ascii?Q?TYJqJRXPMSEORAwCYsFCk4zRNGc3AoZDtl7sr80USy0woHhaMei/w9ThxbUt?=
 =?us-ascii?Q?unBkXopfNZkvjVCshkLUgBSYdcjhxaYrmYPl7Y8lI70yiM1SPDr/w+BOry9/?=
 =?us-ascii?Q?nu9r25iihkQkvsM9cQXJFTfzHxOHd4UYLbiS7Z8PyTrhvHs+F8EmpfOHdmA6?=
 =?us-ascii?Q?u/+LIGJof3+SMPkBunFjknt0FT05sINqRQApjSm2sDCdJU6vAic7lMbpcuch?=
 =?us-ascii?Q?tpc5SQ363WpkTLyikRRUSosKRNi3bxKhocsWey9OYkYjRkR935A/YPEz+TiP?=
 =?us-ascii?Q?tv019JStiF5AZhA1jcSL4pap8fgHBA28vC3YV6e0n1DsvOW4J+rZrxym/BJo?=
 =?us-ascii?Q?VUaVORYOypf0N6mixbwzp3/2GqpdebmvnV/Pmx4IDY3UJgO/uX6qq8p4sgvS?=
 =?us-ascii?Q?mdtx6HZ92+qtnk6Vz71fVG6SIf6ShTnahiiiC+r6IDRVOd8e7L8lL0ooulIU?=
 =?us-ascii?Q?BRlkJyyRG89h9LaAWo0B0hrKOwRppvLIjQKijGhGlRCGV5SwT37W0ct1GbV5?=
 =?us-ascii?Q?+pUHcJYxCw51SMJk2CXUlILwkgIkaOn6zzqdTT7ne34SapwBZbSAUyOA2CH+?=
 =?us-ascii?Q?Gt4b01j8BaeNRljn0JfDgJRZcyGOGLgJlQkhWYnfg0DIFhP53tQJe5qczzGG?=
 =?us-ascii?Q?18cwbv+6hkDlTtG6tMcvSbWTM78EQX1cbSWcLA9S+QqHcohGnbleAbQcykMn?=
 =?us-ascii?Q?HL+d3wo37VvEUHVX2A/HZ+2xy2RDHyM5Y8frm0H5slTVkToa9hJvB8xckh51?=
 =?us-ascii?Q?CCdh0yY2ooCclsSYc8Y/iMirzuMa+j7EuzTPQbb4TrZzalnBvlJbuw/yBwTp?=
 =?us-ascii?Q?j7lmrNIeXEIqVHuhf1VoS9wMiyPO1LQ2LqzZgYfFF6OMeNB9j1hJWPZf69WB?=
 =?us-ascii?Q?96xLr84OTblEZl1WtY9V9G6YmYNIaHup9T72UT1+KM8wWYgyZ5PIMfPtPdja?=
 =?us-ascii?Q?ds6B0Shdb8am1c80h41ztFTh+dgqg2hT3xYPuGqBxUykmC2GjqjiJD4SNYkN?=
 =?us-ascii?Q?dCXQ6Mot7/okMYdlH3vGFVp/APZHgUjRVnX0JgSayI16Es63tw65hfoIOemk?=
 =?us-ascii?Q?Q9v83oGBxqFW0FT0SIb/DPwIXsrPwhBqWyzXjVjz8zUeSRHdxOfrvCsYWjFB?=
 =?us-ascii?Q?tRcTCNj1JOj8gaYjE+Fuhw3r25a/e2Bx0M24kFWqqj/6opUiYy/wzWDVmGQc?=
 =?us-ascii?Q?sP3TJ4YMrgBf3mmcVphiWMa3AhUr+na2j5vCieyhvAKaoC55mpaAdiqA0sYW?=
 =?us-ascii?Q?jOHsmwrbQFUNyRHvq4vifRm+sSHngOR0BhcbVDR+9XzdJbz5UdRGHwZzCfT2?=
 =?us-ascii?Q?NYqjU+wiGwj6FPGDmpKBg+0Cu+lE8eis06lWdgdby6CC4houL6xnHwuDuBuR?=
 =?us-ascii?Q?hYYS5ZEFxs8HGc12THlb7z5vI1rEO0DsC6apRU3H4Bd47S6+Z3w7Vw05+mkW?=
 =?us-ascii?Q?I/d/SZo1UYRRWC2n7j6WFVY7I+4K4b7oWIUjrH1mMNek?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f8c400af-c0e4-452e-8e9b-08de8e6108ca
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2026 13:34:14.3310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8P110MB2498
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[xes-inc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[xes-inc.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-34446-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_MULTI_FAIL(0.00)[xes-inc.com:server fail,qualcomm.com:server fail,PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM:server fail,sin.lore.kernel.org:server fail];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vfazio@xes-inc.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[xes-inc.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xes-inc.com:dkim,xes-inc.com:email,PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM:mid]
X-Rspamd-Queue-Id: BA620360D54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


> -----Original Message-----
> From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Sent: Monday, March 30, 2026 7:50 AM
> To: Linus Walleij <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.o=
rg>;
> Vincent Fazio <vfazio@xes-inc.com>
> Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com>
> Subject: [libgpiod][PATCH] Revert "bindings: python: replace
> PyModule_AddObjectRef() with PyModule_AddObject()"
>=20
> This reverts commit b436d05809b17ed734d08a36a8913eb687506433.
>=20
> Commit 950ff3d1b300 ("bindings: python: drop python 3.9 support")
> removed support for python v3.9 and with v3.10 now being the minimum
> required version, we're now free to use PyModule_AddObjectRef().
>=20
> Signed-off-by: Bartosz Golaszewski
> <bartosz.golaszewski@oss.qualcomm.com>

Reviewed-by: Vincent Fazio <vfazio@xes-inc.com>



