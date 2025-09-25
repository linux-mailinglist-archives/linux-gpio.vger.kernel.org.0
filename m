Return-Path: <linux-gpio+bounces-26575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4CEB9EB85
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 12:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1FFC5425909
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 10:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E67F2F530A;
	Thu, 25 Sep 2025 10:34:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022101.outbound.protection.outlook.com [40.107.75.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98632EB87D;
	Thu, 25 Sep 2025 10:34:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.101
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796491; cv=fail; b=EgD1or0TugHNkt5sZ4H4ge/Prq8wgsf5i7ZolJY6/TqvJscBVoqkNv+BaFKMtRnKxC6BlGTdsrlwQGE6Prqge4iRaHMs+M/jh0UdPDpAs5ktnDUTHK/RqtT9MvGfMWi5xpUA/wa5w5OgVs8LS10rgRIv4jJ9qy8vqv/jdr9rwfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796491; c=relaxed/simple;
	bh=coKX2uD+TaYHn+LsSTcFpdJGfWJRIj5+d7kDYYgZNNY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=cgHrDNvUwWxDmhwVAPW3TroYB9VWxz9rsxqGkmUIoIa3iMuAM1w1nKF2Pmb/qiRdZ0ECe60IXETLfYcLN8JYLIGbZ0jFRdy+epEQ72O9g05uGWiCFUtjHJcm3MEbz5+vvodYEkVt2kq28RY06ntUdusxbEBSSADI/8MU4B5z4IA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VpmhEzkVwjjkQiROxgsIJO6uQ2cYTXWwLkk7Y+eIMNPhRDA1r2Tn0QU99S/yz9MPMz0ZHT8s/p/d2rZCEpNsjnmvow0ehBWIYQhi5AGDHXX3eDA7+HKcE06CKrgoyobKEArnY8MxWaLFK9Lyvavu9VHZPusN/lU3ZN0D2ESNNbCfufQTgYbg11guTzh01ZN0GcFHtT2Wi0U+oCtd1B4TfOhYrKwGmiAdo5CW+2nvNWQr3eVIK5EwkqHbjP+lA6fogu8MQmhLEmqK2kM1qmeQBzJ+o6IGmnu/oMbx4FLO3qmFM+djnqifLdxYRiI8xxAUIcFx98Xdo5zB9UgDC2jQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coKX2uD+TaYHn+LsSTcFpdJGfWJRIj5+d7kDYYgZNNY=;
 b=dBXgL15LzO9BNvx8gu+aTaf3pixEE5GPV/2HAtN8mfLoHmyeMXuOMXQRSG1Ncc2Rln8vkDiaX2xQwNfTEmoe3J01wrFYwy8JyWZH+xHbOeN2ZznZTXsGlELClQK+3jVfn3lDcRHrJVemp7Fdx+lT9ChGIHZT5FCzrNdT1e2gCc6imHKfw+LAqi4uQZ2PTTfjNr+vMRGvIAZiQX5uZpSitF348F+aMhkR0cGgCS4ZZxrqF88O359kZFEO+xyUFh6fteKsioCe+GkYzbNwWhx1L25LhdnWvaqOuYuH3y9+0N4sFsi9e7JiZpMoE4iQxQE/dWml7dG1HGy0qRAwHbmsJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by KUZPR06MB8059.apcprd06.prod.outlook.com (2603:1096:d10:46::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 25 Sep
 2025 10:34:44 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%3]) with mapi id 15.20.9137.018; Thu, 25 Sep 2025
 10:34:44 +0000
From: Gary Yang <Gary.Yang@cixtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, cix-kernel-upstream
	<cix-kernel-upstream@cixtech.com>
Subject:
 =?utf-8?B?5Zue5aSNOiBbdjIgMS8zXSBwaW5jdHJsOiBjaXg6IEFkZCBwaW4tY29udHJv?=
 =?utf-8?Q?ller_support_for_sky1?=
Thread-Topic: [v2 1/3] pinctrl: cix: Add pin-controller support for sky1
Thread-Index: AQHcI6tw6+x/ILBPUUWp4esQTXOPtLSPcekAgAQSvmCAAGttgIAEYAuQgAt4RAA=
Date: Thu, 25 Sep 2025 10:34:44 +0000
Message-ID:
 <PUZPR06MB5887C7BA551EBAFC05564400EF1FA@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-2-gary.yang@cixtech.com>
 <CACRpkdYgTjerG5mks_+3sjhKKYtCsFY=1NWhgw_YEuib7gZm3g@mail.gmail.com>
 <TYUPR06MB5876BB28E3C30EEB9BB05997EF15A@TYUPR06MB5876.apcprd06.prod.outlook.com>
 <CACRpkdYKnFAyq8C5h2=5NQ8AU92RmzShNHd6+=21rWednjv-fA@mail.gmail.com>
 <PUZPR06MB5887DA8FE0E128993F11E2B3EF16A@PUZPR06MB5887.apcprd06.prod.outlook.com>
In-Reply-To:
 <PUZPR06MB5887DA8FE0E128993F11E2B3EF16A@PUZPR06MB5887.apcprd06.prod.outlook.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|KUZPR06MB8059:EE_
x-ms-office365-filtering-correlation-id: 04afedfc-17b2-4d96-15f0-08ddfc1f2496
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?R045bnZOVGN1Q1o2Tk5HUU9kTjdPUVkrWHdwaGx2bnl5Ynk1bGRrazIyN25u?=
 =?utf-8?B?bjlQeVh3cVhmdlZCNHluTjVCbXkySkVkNis0ZWVEYzFTTGlwMzhsQStSbnJD?=
 =?utf-8?B?NXpHZklsZkgyUHFFdGsvU0JsbTJIemYyTENIejBCT1pZeU93elU1WTlXb1o2?=
 =?utf-8?B?SUNYckVEWkNlTmN1MEpBbUliTWxnTlFUUUdYNFdZYXVBME1mYkJuUGRnbW1q?=
 =?utf-8?B?SVUvc3FJNS9OdjExcmNVNnFzUGVSZGtvd3BZYVRrbDlCM21KUEhQdVRFaFo3?=
 =?utf-8?B?dUJSck1zcnUyTUVTMHRodGgyNUl5R1RzM21SeTVCMkJDUmRtaUxJaUljTE0r?=
 =?utf-8?B?Mi8xVjZZQXJZL3A2MVErNlk5VDF3RHVKYlVNaFRYRzR3V2VvY1FmSERkSTA0?=
 =?utf-8?B?UXUzbUp4ZndVS2gvTXN1QlVONnVUcGVXKzJkRC9WQ3FPb1M0YmpuVkZjV1Fy?=
 =?utf-8?B?UkpINitQa0I4ZVJoZTYwVDJkYmpBQWFUZUN6S2tGbmRLQnhvRnlKLy85dFBF?=
 =?utf-8?B?UG5jcTJkWGt3R2p5T09udlhadXhHSnI1N0llamh0cjhONUJKbEhuL0JvV1hR?=
 =?utf-8?B?c1BQSFNSVHhQMlpNZHhRQkZleno5Qmcva3dhODBjOVdrNXRwTXIvR1dZTnNM?=
 =?utf-8?B?eDZFRVVIN290VXdUSW8xek9SSlI3MzczYVRpWFFSVEoyc21QZk1VRFBscE9K?=
 =?utf-8?B?dWdrSy92OThuM0JDeE1adksxc3dJdjRiWjkrcHNEbytqMTJ0YW5lTVFnWUNX?=
 =?utf-8?B?RVJkTG90UmVoeHc4VHhzOVZWOG1JWEtrdTRjdGhOQ0g3dVBRS3BnWDc4d0VN?=
 =?utf-8?B?N2FWTkM5U01GelVpT3h5R1JEOTdtb2hGL3FvVUU0aTZreGFiQmRvY2JBb2di?=
 =?utf-8?B?QmMxU1JlbkNsMHI5YUhZZnVkUXZyelhQM0t0Z1luOVc5ZTVZVnBpc2h6bDlU?=
 =?utf-8?B?QThnTy9VNTRrbVBkeEdrK0h4SXFyMERjU29qU092dGNsTlBVQzR4YlVvTHpI?=
 =?utf-8?B?U0x5TzBRV1Vta0gvRzRuRFVZNlJiZTRCdlhaS0loTDcwazBRNmlQTDdFQkla?=
 =?utf-8?B?TGZSWGZTeTgwMEhTYjByMlFmbmdqUjRQRDVqT3hJNUw3blVSSnU2ei9pWU9u?=
 =?utf-8?B?dVdkem45dHV6UWVLQjFvL3J6KzY1T25JZjI4dWRPUjZ5T3BVblVLWFA3WFRL?=
 =?utf-8?B?YlM5Uyt0RXlGRDFnbzdCRWM0YVl2SjcvdWpFK1F5MDVNekZPaHhmejh3clpj?=
 =?utf-8?B?bGdNR08wZ1haOWVudDRKWjI1dUdYeHBvUjJmN2RleU5oWjN4Y0hxVkNqK3VR?=
 =?utf-8?B?cVhQNTRPR0Yyb0xHeVdyaU5Tc1lYWE5QcFFNTlFuZk5BejNaeHh2aENpaGxi?=
 =?utf-8?B?S0lTRDBwWnZYU3IyZ012NHExS2VBR2xldERRT1dmSU10VnplZ0liWi8wS2ZT?=
 =?utf-8?B?SlZEYWhpUStCeHhVa25mQXA1Wk1OeC9Pb2dVVEZBNzdvSDZFUTRDdDEremQr?=
 =?utf-8?B?WGNXdWU0bG96dE5iWHNYN1hoQ3ZNVkRGSXRaZlpNQ1FZVHQvRlZDZTFGei9Q?=
 =?utf-8?B?Smpab0RKSkFEMVU4Ni8veVFKQzVFblJEYVpWWmJqZmpyQ3Q0YkVNaTlYbFB3?=
 =?utf-8?B?OTRPbXN3aDBvYVRVQTE1Nko5bDRKK2NIbGpQSEZ6bTY1bU0xQ0xRcmhZeHpF?=
 =?utf-8?B?TGRWZ3k0MDVtNUxtWFpXYVVyeWxYY0RuaVZUSVJycS9zRVRXSWt6Ny9LN3l0?=
 =?utf-8?B?d2FyMTZvRitQYUQydWpWV1dTK0Y3c0JBc3p3OWlzZjNPNjlleW8rTzhJWE1D?=
 =?utf-8?B?WDVkanZRUGVvWVIvT0VFTTJ3T0hwV0M4b3pxblhScFQvVUlQOG9QOGRLNURQ?=
 =?utf-8?B?SkdnUnlqQUFwZCtQaFkwTllMcG1HeTVPam9PWDhta0k2Lyt1WGUyRWlQcGZP?=
 =?utf-8?B?QmthVitpM3hJSDBNamNJNEk5SzVwai9DSFNRQXE1MG1JNTE3aW5JM1BHUlcx?=
 =?utf-8?B?ZUlYQlRLQzBnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?OFF0a3grMGpTUk14Z3hkTi85U1BVUEJHK1Q3RGw1eDE2dW95VkpJZ3NjTnds?=
 =?utf-8?B?ZGZYdCtnUkt0NVN0OHZnanVQZVBVVG1RaVE3T3hrUVNiOG1RZFcreWlrK0Vi?=
 =?utf-8?B?Yi9mY0dBcml0L01Ub0tIZzh4Z0t0ZzVSL3Q1d08raUM5RS9FemF0dmNnSEtk?=
 =?utf-8?B?bWROMjRYZHd3V1pjVGJQMC9XbHVLUEptWkpyVVRLL09OTmkxYlk5ZFNETTBC?=
 =?utf-8?B?S3NiM3M0U1h3OW9JcGhvc3hTRlFMY2tRQWlpS21sMXNIWDdZR2tiOExQTTNF?=
 =?utf-8?B?UVNleG9BcFFOSHpyMEtSYzdVckl0aHl0NVdjQ3BpWjFnc1Q2SzkvcmtCRW45?=
 =?utf-8?B?U3BGcGY2RCtiYXJTa1M4eTFZZWdSYmhKbWozSVB0MW9YV1pScjh3Qmp3SVhQ?=
 =?utf-8?B?TVJ2WTRhVnhlMyt2NkRhdkthbXgxNTdTZnlkNWtBcERZREI4Zklna0VadFFP?=
 =?utf-8?B?WjA3blY3c0xtcjRNZ2kwclVOR3JCRExxeHR6ZjZ6T3pMcEszSGFEeUFvazlC?=
 =?utf-8?B?S09raTYyN3FKcXZxSnpxekpjNTNweTdMYVVab3lQV3ZGc05vcFZWQTNNVURL?=
 =?utf-8?B?TWl0cWNPSXZDYnpyWVZOd3FoZEg1R0FHU05SaWVBWWVlK0xxeENFQzRZNUp3?=
 =?utf-8?B?U2EzOWVidVhONEtTUHRSRHNkaDFZRVlmelpYL21iYkQzRjBKbnFZZGFCZlNJ?=
 =?utf-8?B?L0dGbTZDT1BCWjVCbTVBcFliMWVlaEsvZ25zckF4Q3R6Rm1oUnU0Y0Nkdjk2?=
 =?utf-8?B?MWxWQ0x4R0Fuakw0S2huNlpUZDRMa2lkUDdiUzJGVGZXRlZZZzYzZjRMU1pN?=
 =?utf-8?B?azltNGdBWXZrTWxZK2d2ejFmZFR4UUNHNnJGdzNpSTViMVErNHFUcFd1MlJ3?=
 =?utf-8?B?WjVaa3B1UXZQSkQ3NUMrczE0OUxMSkV5RFpjcTBMdW4vU0poTDJMc3QxQU5m?=
 =?utf-8?B?M1hLYnAzQ21tRHFBRExPOFhmRXJtcVpzQjNwR1NCWmY3YkRlRU9SNXc3bDJ4?=
 =?utf-8?B?QVlVS3RLWkE1SUxCekxVVVUxSGx5bzZTaHM2MTliTytXWFNVNHdiUVpRTGg5?=
 =?utf-8?B?WC81dzA2U1BXRFViOGF5d0NjRzN3OWhjOFBJMFNXclU0N0kvbTlyRnVtM013?=
 =?utf-8?B?dzEyc042YlFwSjhpb09kMmV5eWdHckhJUTlQNk1xdUkvbEpCRU9FQmJONUNt?=
 =?utf-8?B?RVc2eENsdkJFcUtBbHZGaUVaNXdhOFcrTTE3aFh6OXRkTmVTSnNUSG9xUmdG?=
 =?utf-8?B?SDNNT3Z4aG9HSEcra0JvUUVtQ1o3QXpleGREVEE0UUh0R1NFd2RwWElqQm56?=
 =?utf-8?B?TTVSQk9YaS91WlQ0algxMk9jMUJNRnBaaEpGUUpLSTJGeTB2RktRMnJFcnVY?=
 =?utf-8?B?VjgrOU05enRiR1N6WG1EU2FKL2RpK0VhM0RPVnRUcG5BeFhjSzVpSDFieHFm?=
 =?utf-8?B?WHZyMnBGU212YW1BMkU2cDFicWxqL1ZBalRQdXUrdHF3c2V0VHdCdUt6Qkg2?=
 =?utf-8?B?czdKd3IzaUo4OGN0ZWc3NDBnaEdlZEJrTnFqWWhNYjkwS2NTOWRPYmt4dGRW?=
 =?utf-8?B?UkZzSDR5algrRGFGWDdLNjBubGFkZUJiSHNlMFZCak53SDB6cW1SKzJOUE8z?=
 =?utf-8?B?MU9UeUtjUmc3eEhVTFZOR1YyZm4rN2lnT2FKUzB1TDh2SGtsNGd0WGl5ZmtN?=
 =?utf-8?B?ZitKSEc4NmlHTnFsUXlqd2x2dnNzZUZPUFp2ZHpLSmVob1VuY2V0V0treXFH?=
 =?utf-8?B?OGZ0eDZpR3I4UjZhdzN3NGUrUlZiZlIvNDVxRERscWNodzVFdjRIZS9xWHkz?=
 =?utf-8?B?OFc3M0FWenVSaU1zKzNmWXZ0MnJabHZ3N3hjK292SEVkUS93QjNmZGluMUQ2?=
 =?utf-8?B?QTgwSTRwaUh6R0dFU2NaV0FhcklZZUZzamJYWStoUWVXcTF1MXE3WklML1NK?=
 =?utf-8?B?YmtLRitWT3dVNTBKYlZwVjl3bzhsNk9VSGRKNFlrSjh5V2hraGVzaWtBYjN3?=
 =?utf-8?B?SG9OMWcwa0ZiUGZtaGRhR3g5TlVuRGI3R0tLamVoOXlVaHgxdG5EUnZuWFpP?=
 =?utf-8?B?TUtjc0hCUU1tNGpOc1VzZE5yWW41VEUwWHo4RXBMdXlHdjE5Wm5QR21WM3lG?=
 =?utf-8?Q?c6Y+Jl7rB/6ZxN1ThI1tei/+n?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5887.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04afedfc-17b2-4d96-15f0-08ddfc1f2496
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 10:34:44.4214
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WVQJVAhqVuos5RiwLcUN9PYqeD5Gz09b7uds+rRR3aXfPky8jjfdvn6bppMLfbVgt8RCLrz8wqtz08LLbnA69w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUZPR06MB8059

SGkgTGludXMsDQoNCj4gDQo+IE5ldyBzY2hlbWUgd2l0aCBtYWNyb3MgaGFzIHZlcmlmaWVkIG9r
LiBJIGp1c3Qgd2FudCB0byBjb25maXJtIHdpdGggeW91DQo+IGJlZm9yZSBzdWJtaXQgY29kZXMN
Cj4gDQo+ID4gRVhURVJOQUwgRU1BSUwNCj4gPg0KPiA+IE9uIE1vbiwgU2VwIDE1LCAyMDI1IGF0
IDk6MDnigK9BTSBHYXJ5IFlhbmcgPGdhcnkueWFuZ0BjaXh0ZWNoLmNvbT4NCj4gd3JvdGU6DQo+
ID4NCj4gPiA+ID4gVXNpbmcgYSBOVUxMIGZ1bmMtPm5hbWUgdG8gdGVybWluYXRlIHRoZSBhcnJh
eSBsb29rcyBhIGJpdCBkYW5nZXJvdXMuDQo+ID4gPg0KPiA+ID4gQ2hlY2tpbmcgd2hldGhlciB0
aGlzIHBvaW50ZXIgaXMgYSBudWxsIHBvaW50ZXIgaXMgZ2VuZXJhbGx5DQo+ID4gPiBhY2NlcHRh
YmxlLiBBDQo+ID4gbmFtZSBtYXBzIHRvIGEgbXV4IHZhbHVlLg0KPiA+ID4gSSB0aGluayB0aGF0
IGl0IGlzIHNhZmUuIE9mIGNvdXJzZSwgeW91ciBzdWdnZXN0aW9uIGlzIGFsc28gYSBnb29kDQo+
ID4gPiBpZGVhLiBJZiB5b3UgdGhpbmsgdGhpcyBpcyBub3Qgc2FmZSwgd2Ugd2lsbCBjaGFuZ2Ug
Y29kZXMgYXMgeW91ciBzdWdnZXN0aW9ucy4NCj4gPg0KPiA+IEl0J3MgT0sganVzdCBhIHN1Z2dl
c3Rpb24uIFRoZXJlIGFyZSBtYW55IHdheXMgdG8gZG8gdGhpcywgZmlyc3QgZml4DQo+ID4gb3Ro
ZXIgcHJvYmxlbXMuDQo+ID4NCj4gPiBUaGVyZSBhcmUgdGhpbmdzIGluIHRoZSBsYW5ndWFnZSBh
bmQgdGhlIGtlcm5lbCB0aGF0IGNhbiBoZWxwIHlvdSB0bw0KPiA+IGNoZWNrIGJvdW5kYXJpZXMg
b2YgYXJyYXlzIHN1Y2ggYXMgdGhlc2UgZnVuY3Rpb25zIHNvIHlvdSBjYW4ndCB3cml0ZQ0KPiA+
IGNvZGUgdGhhdCBpbmRleCBvdXQgb2YgcmFuZ2UsIGUuZy4NCj4gPg0KPiA+ICtzdHJ1Y3Qgc2t5
MV9waW5fZGVzYyB7DQo+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3QgcGluY3RybF9waW5fZGVzYyBw
aW47DQo+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3Qgc2t5MV9mdW5jdGlvbl9kZXNjIGZ1bmN0aW9u
c1s0XTsgfTsNCj4gPiArDQo+ID4gK3N0cnVjdCBza3kxX3BpbmN0cmxfc29jX2luZm8gew0KPiA+
ICsgICAgICAgY29uc3Qgc3RydWN0IHNreTFfcGluX2Rlc2MgKnBpbnM7DQo+ID4gKyAgICAgICB1
bnNpZ25lZCBpbnQgbnBpbnM7DQo+ID4gK307DQo+ID4NCj4gPiBJdCBpcyBwb3NzaWJsZSB0byB1
c2UgYSBmbGV4aWJsZSBhcnJheSB3aXRoIHRoZSBpbnRyaW5zaWMgX19jb3VudGVkIGJ5KCkgaGVy
ZSwgZS5nLg0KPiA+IGluc3RlYWQgb2Y6DQo+ID4NCj4gPiBzdHJ1Y3Qgc2t5MV9waW5fZGVzYyB7
DQo+ID4gICAgICBjb25zdCBzdHJ1Y3QgcGluY3RybF9waW5fZGVzYyBwaW47DQo+ID4gICAgICBj
b25zdCBzdHJ1Y3Qgc2t5MV9mdW5jdGlvbl9kZXNjIGZ1bmN0aW9uc1s0XTsNCj4gPg0KPiA+IFlv
dSBjYW4gdXNlOg0KPiA+DQo+ID4gKyBzaXplX3QgbmZ1bmN0aW9uczsNCj4gPiArIGNvbnN0IHN0
cnVjdCBza3kxX2Z1bmN0aW9uX2Rlc2MgZnVuY3Rpb25zW10NCj4gPiArIF9fY291bnRlZF9ieShu
ZnVuY3Rpb25zKTsNCj4gPg0KPiA+IElmIHlvdSBncmVwIGNvdW50ZWRfYnkgaW4gdGhlIGtlcm5l
bCB5b3UgZmluZCBtYW55IG90aGVyIGV4YW1wbGVzIG9mDQo+ID4gaG93IHdlIHVzZSB0aGlzLg0K
PiA+DQo+ID4gQnV0IGZsZXhpYmxlIGFycmF5cyBpcyBhIGJpdCBjb21wbGljYXRlZCBhbmQgZGFu
Z2Vyb3VzIHNvIG1heWJlIHlvdQ0KPiA+IHdhbnQgdG8gYXZvaWQgaXQgYWx0b2dldGhlci4gQWxz
byBJJ20gbm90IHN1cmUgaXQgd29ya3Mgd2hlbiB5b3UgcHV0DQo+ID4gdGhpbmdzIGNvbnRhaW5p
bmcgYSBmbGV4aWJsZSBhcnJheSBpbnRvIGFub3RoZXIgYXJyYXkuLi4gSSBuZXZlciB0cmllZCBp
dC4NCj4gPg0KPiA+ID4gPiBUaGVuIHlvdSBjYW4gdXNlIG5mdW5jcyB0byBpdGVyYXRlIG92ZXIg
dGhlIGFycmF5IG9mIGZ1bmN0aW9uDQo+ID4gPiA+IG5hbWVzLCBhbmQgZGVmaW5lIGEgbWFjcm8g
bGlrZSB0aGlzOg0KPiA+ID4gPg0KPiA+ID4gPiAjZGVmaW5lIFNLWV9QSU5GVU5DVElPTihfbXV4
dmFsLCBfZnVuY3Rpb25zLCBfbmZ1bmN0aW9ucykgICBcDQo+ID4gPiA+IChzdHJ1Y3Qgc2t5MV9m
dW5jdGlvbl9kZXNjKSB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwNCj4gPiA+
ID4gICAgICAgICAgICAgICAgIC5tdXh2YWwgPSAobXV4dmFsKSwgICAgICAgICAgICAgICAgICAg
ICAgICBcDQo+ID4gPiA+ICAgICAgICAgICAgICAgICAuZnVuY3Rpb25zID0gKF9mdW5jdGlvbnMp
LCAgICAgICAgICAgICAgICAgICAgXA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgLm5mdW5jcyA9
IChfbmZ1bmN0aW9ucyksICAgICAgICAgICAgICAgICAgXA0KPiA+ID4gPiAgICAgICAgIH0NCj4g
PiA+ID4NCj4gPiA+ID4gQW5kIHRoZW4gdGhpczoNCj4gPiA+ID4NCj4gPiA+ID4gK3N0YXRpYyBj
b25zdCBzdHJ1Y3Qgc2t5MV9waW5fZGVzYyBza3kxX3BpbmN0cmxfczVfcGFkc1tdID0gew0KPiA+
ID4gPiA+ICsgICAgICAgew0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAucGluID0gUElOQ1RS
TF9QSU4oMCwgIkdQSU8xIiksDQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgIC5mdW5jdGlvbnMg
PSB7DQo+ID4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgWzBdID0gezAsICJHUElPMSJ9
LA0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICB9LA0KPiA+ID4gPiA+ICsgICAgICAgfSwNCj4g
PiA+ID4gPiArICAgICAgIHsNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgLnBpbiA9IFBJTkNU
UkxfUElOKDEsICJHUElPMiIpLA0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAuZnVuY3Rpb25z
ID0gew0KPiA+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIFswXSA9IHswLCAiR1BJTzIi
fSwNCj4gPiA+ID4gPiArICAgICAgICAgICAgICAgfSwNCj4gPiA+ID4NCj4gPiA+ID4gPiArICAg
ICAgIH0sDQo+ID4gPiA+DQo+ID4gPiA+IGJlY29tZXMNCj4gPiA+ID4NCj4gPiA+ID4gc3RhdGlj
IGNvbnN0IHN0cnVjdCBza3kxX3Bpbl9kZXNjIHNreTFfcGluY3RybF9zNV9wYWRzW10gPSB7DQo+
ID4gPiA+ICAgICBTS1lfUElORlVOQ1RJT04oUElOQ1RSTF9QSU4oMCwgIkdQSU8xIiksICAiR1BJ
TzEiLCAxKSwNCj4gPiA+ID4gICAgIFNLWV9QSU5GVU5DVElPTihQSU5DVFJMX1BJTigxLCAiR1BJ
TzIiKSwgICJHUElPMiIsIDEpLA0KPiA+ID4gPg0KPiA+ID4gPiBJIGRvbid0IGtub3cgYWJvdXQg
dXNpbmcgdGhlIFBJTkNUUkxfUElOKCkgbWFjcm8gaGVyZSB0aG91Z2gsDQo+ID4gPiA+IGNhbid0
IHlvdSBqdXN0IHB1dCBpbiAwLCAxLi4uPw0KPiA+ID4gPg0KPiA+ID4gPiBBbnl3YXkgSSB0aGlu
ayB5b3UgZ2V0IHRoZSBpZGVhLg0KPiA+ID4gPg0KPiA+ID4NCj4gPiA+IEZpcnN0LCBsZXQgdXMg
cmV2aWV3IHRoZSBzdHJ1Y3Qgc2t5MV9waW5fZGVzYywgaXQgY29udGFpbnMgdHdvDQo+ID4gPiBt
ZW1iZXJzLCBvbmUgaXMNCj4gPiB0aGUgc3RydWN0IHBpbmN0cmxfcGluX2Rlc2MuDQo+ID4gPg0K
PiA+ID4gc3RydWN0IHBpbmN0cmxfcGluX2Rlc2Mgew0KPiA+ID4gICAgICAgICB1bnNpZ25lZCBp
bnQgbnVtYmVyOw0KPiA+ID4gICAgICAgICBjb25zdCBjaGFyICpuYW1lOw0KPiA+ID4gICAgICAg
ICB2b2lkICpkcnZfZGF0YTsNCj4gPiA+IH07DQo+ID4gPg0KPiA+ID4gUElOQ1RSTF9QSU4gaXMg
dXNlZCB0byBpbml0aWFsaXplIHRoaXMgc3RydWN0IGluIGtlcm5lbC4gSXQgbG9jYXRlcw0KPiA+
ID4gaW4gaW5jbHVkZS9saW51eC9waW5jdHJsL3BpbmN0cmwuaA0KPiA+ID4NCj4gPiA+ICNkZWZp
bmUgUElOQ1RSTF9QSU4oYSwgYikgeyAubnVtYmVyID0gYSwgLm5hbWUgPSBiIH0NCj4gPiA+DQo+
ID4gPiBQSU5DVFJMX1BJTigwLCAiR1BJTzEiKSBkZWZpbmVzIGEgcGluLCBpdHMgbnVtYmVyIGlz
IDAsIGl0cyBuYW1lIGlzDQo+ICJHUElPMSIuDQo+ID4NCj4gPiBBaCBJIHNhdyBpdCB3cm9uZywg
c29ycnkgOigNCj4gPg0KPiA+IFlvdSdyZSByaWdodCBhYm91dCB0aGlzIG9mIGNvdXJzZS4NCj4g
Pg0KPiA+IEJ1dCBJIHRoaW5rIHlvdSBjYW4gc3RpbGwgdXNlIGEgbWFjcm8gdG8gZGVmaW5lIHRo
ZSBsb25nIHBpbiB0YWJsZXM/DQo+ID4gQWxiZWl0IG1hY3JvcyB3aXRoIGZsZXhpYmxlIGFyZ3Vt
ZW50cyBpcyBhIGJpdCBoYXJkIHRvIHdyaXRlLg0KPiA+IFNhdmUgaXQgdW50aWwgZXZlcnl0aGlu
ZyBlbHNlIGlzIHdvcmtpbmcuDQo+ID4NCj4gSW4gaGVhZGVyIGZpbGU6DQo+IA0KPiBzdHJ1Y3Qg
c2t5MV9waW5fZGVzYyB7DQo+ICAgICAgICAgY29uc3Qgc3RydWN0IHBpbmN0cmxfcGluX2Rlc2Mg
cGluOw0KPiAgICAgICAgIGNvbnN0IGNoYXIgKipmdW5jX2dyb3VwOw0KPiAgICAgICAgIHVuc2ln
bmVkIGludCBuZnVuYzsNCj4gfTsNCj4gDQo+ICNkZWZpbmUgU0tZX1BJTkZVTkNUSU9OKF9waW4s
IF9mdW5jKSAgICAgICAgICAgICAgICAgICAgICAgICAgICBcDQo+ICAoc3RydWN0IHNreTFfcGlu
X2Rlc2MpIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXA0KPiAgICAg
ICAgICAgICAgICAgIC5waW4gPSBfcGluLCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIFwNCj4gICAgICAgICAgICAgICAgICAuZnVuY19ncm91cCA9IF9mdW5jIyNfZ3JvdXAsICAg
ICAgICAgICAgICAgICAgICBcDQo+ICAgICAgICAgICAgICAgICAgLm5mdW5jID0gQVJSQVlfU0la
RShfZnVuYyMjX2dyb3VwKSwgICAgICAgICAgICAgXA0KPiAgICAgICAgICB9DQo+IA0KPiBJbiBD
IGZpbGU6DQo+IA0KPiBzdGF0aWMgY29uc3QgY2hhciAqZ3BpbzFfZ3JvdXBbXSA9IHsiR1BJTzEi
fTsgc3RhdGljIGNvbnN0IGNoYXIgKmdwaW8yX2dyb3VwW10NCj4gPSB7IkdQSU8yIn07DQo+IA0K
PiBzdGF0aWMgY29uc3Qgc3RydWN0IHNreTFfcGluX2Rlc2Mgc2t5MV9waW5jdHJsX3M1X3BhZHNb
XSA9IHsNCj4gICAgICAgICBTS1lfUElORlVOQ1RJT04oUElOQ1RSTF9QSU4oMCwgIkdQSU8xIiks
IGdwaW8xKSwNCj4gICAgICAgICBTS1lfUElORlVOQ1RJT04oUElOQ1RSTF9QSU4oMSwgIkdQSU8y
IiksIGdwaW8yKSwNCj4gCQkuLi4uLi4uDQo+IH07DQo+IA0KPiBXaGF0J3MgeW91ciBzdWdnZXN0
aW9uPyBUaGFua3MNCj4gDQoNClBpbmcuLi4uDQoNCj4gPg0KPiA+IFlvdXJzLA0KPiA+IExpbnVz
IFdhbGxlaWoNCj4gDQpCZXN0IHdpc2hlcw0KR2FyeQ0KDQo=

