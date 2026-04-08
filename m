Return-Path: <linux-gpio+bounces-34858-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mIm5GvnQ1WkZ+QcAu9opvQ
	(envelope-from <linux-gpio+bounces-34858-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 05:52:25 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0013B6A8E
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Apr 2026 05:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D553300E035
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Apr 2026 03:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C79EE34DB56;
	Wed,  8 Apr 2026 03:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Kj8NOG0d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013061.outbound.protection.outlook.com [40.93.201.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E25716132A;
	Wed,  8 Apr 2026 03:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775620336; cv=fail; b=K16eGXJhD2uSL6E7bNZlPxQGVFSVUL6iZEpAxSvZI8TPpUb7Dg5oPTPr+v97lbyevD3CekzKkfoMXzw0Vt8Ko2Afz27MhFyltLN+1CujvTHKnYpv1HWvS8zmnKy2kqFXXVeljilX5C+9Q4/C66IP6MgMv3PMuWNOvtSKAsorE2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775620336; c=relaxed/simple;
	bh=2IARcToub2Gv1O6V6PdsjDSxNIfPmCABrHXKYMfhg3I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZE1U2momaMQc1ZeX5iuWNeLQcuF8T7QvRGwsJtkctmWeNsm4LBYEN9pDIh/YiyyV7wCxLyZcZ5Go4WNSL2DGkc19w9HJ+KZcEEAIXIC7hbtH8V1nhkgEk5G5208GGEk+nD96p3IQZFBBtE4/rZC25l1nc7nh1VqwaGnwA6SnpOI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Kj8NOG0d; arc=fail smtp.client-ip=40.93.201.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C4Er+sRZZSiM1sw571KFRt192rv9iawmE6tgC/3DcbELx6Q9RXILgWhkD8/L6za6S9DkiTsW5rLiaGpUx0WFMnGDyqkX7YvRN73/R7kFRUXrfIIXC3RSo8+yz9JyyCkNIUjhU0qhgg2cPnsrGfg4OwCD9yXMdYMZtzgR0TDwuOAXP8Ww08IoOHO0KmPRqrXFGwOQQCG89f/vk9GZ0mdl7r+uZoHCkFpvWiZXPv/XMj3w/A+sCmuhCnLHw5AnquZQQQuq/Gkw4h2TWoc8KnQBeNZ9D/aj0tgMW9UKYq2T80k0OIje8k7SC3qZFeFrniuZlMSP3GH21rT3+cJC7bzLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2IARcToub2Gv1O6V6PdsjDSxNIfPmCABrHXKYMfhg3I=;
 b=nrpSdAKMRi4ri0E0htvDzSgI+y+RyUylyFf0daRhHyqIVRUhqqx22RR/FU7rCFqq1teuVqzN3dSY1m3K/skzAm/9ZHlRWJgAVtfpQ9LiadA4HJV+310EbvuY4r6LE2c0IWR4wKB9rKm9EOJ8ds7otooJrLa5h8i4Z3h0R2LwKitaZbCh7Nd6BVX1bPQ7Yb9cOD+Enm9vv/pEJg1RHHtRR2PFbP8wrCqPHMW+XaVInf/A4ztvy+n0W17j4B9D7NfETUtk5oeLgHowKZSPWE9dlyd6RSA5OZAF43uupGMSIKbdk3kCch+bkkMEnOSQkqRewTJfdFk5LljNoJlPxWHbWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2IARcToub2Gv1O6V6PdsjDSxNIfPmCABrHXKYMfhg3I=;
 b=Kj8NOG0dPiWgcafduubCR+DZoypt7r2EWtqc3bzCWZtlvtUIkw2mQ+EGnOI/LHi19WeUWwmOmEo/zJqE5InQvGdum7MpM7eS0569VPBqLSQYxtEfXnozFMdGCFVteRiez3qLPWtSaHDbqvrBZkxrdAAJVbOSWrrsPKWPrlV3KR0=
Received: from MW4PR12MB5668.namprd12.prod.outlook.com (2603:10b6:303:16b::13)
 by DM4PR12MB6230.namprd12.prod.outlook.com (2603:10b6:8:a7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Wed, 8 Apr
 2026 03:52:10 +0000
Received: from MW4PR12MB5668.namprd12.prod.outlook.com
 ([fe80::dde5:4651:de59:c311]) by MW4PR12MB5668.namprd12.prod.outlook.com
 ([fe80::dde5:4651:de59:c311%7]) with mapi id 15.20.9769.018; Wed, 8 Apr 2026
 03:52:10 +0000
From: "Dayananda, Vivekananda" <vivekananda.dayananda@amd.com>
To: "dumitru.ceclan@analog.com" <dumitru.ceclan@analog.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, Laurent
 Pinchart <laurent.pinchart@ideasonboard.com>, Julien Massot
	<julien.massot@collabora.com>, Rob Herring <robh@kernel.org>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund@ragnatech.se>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Cosmin Tanislav
	<cosmin.tanislav@analog.com>
CC: "mitrutzceclan@gmail.com" <mitrutzceclan@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-staging@lists.linux.dev" <linux-staging@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?TmlrbGFzIFPDtmRlcmx1bmQ=?= <niklas.soderlund+renesas@ragnatech.se>,
	"martin.hecht@avnet.eu" <martin.hecht@avnet.eu>, Tomi Valkeinen
	<tomi.valkeinen@ideasonboard.com>, Cosmin Tanislav <demonsingur@gmail.com>,
	"Dayananda, Vivekananda" <vivekananda.dayananda@amd.com>, Cory Keitz
	<ckeitz@amazon.com>
Subject: RE: [PATCH v10 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Thread-Topic: [PATCH v10 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Thread-Index: AQHcxgIb1x5xj34AcUiTIjtSS3peFbXUiiCA
Date: Wed, 8 Apr 2026 03:52:09 +0000
Message-ID:
 <MW4PR12MB5668E5503DA47E0D350A23D5E85BA@MW4PR12MB5668.namprd12.prod.outlook.com>
References: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
In-Reply-To: <20260406-gmsl2-3_serdes-v10-0-645560fedca5@analog.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_ActionId=6c31534c-1ce5-4595-8d73-7a87065f3c85;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_ContentBits=0;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Enabled=true;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Method=Privileged;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Name=Non-Business_New;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_SetDate=2026-04-08T03:37:01Z;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_94523dde-f9d1-4aa7-80a9-c0900420d3c3_Tag=10,
 0, 1, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW4PR12MB5668:EE_|DM4PR12MB6230:EE_
x-ms-office365-filtering-correlation-id: 1e778b18-2d00-4a2b-702c-08de95223602
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|921020|38070700021|18002099003|56012099003|22082099003;
x-microsoft-antispam-message-info:
 gDzIRD3qLedPy/CLOUzyNNLU/LDlSlBm2hDLnu7u8sbuGrKFtn1KyK3dcmePVeAAigZt+HdcFycetV9Sh3nJy84RSzni8H7Gef5vnVeUWrUS6Hs35aN6xIADjXWcCspUmMk7Z/kTd9OIps2+ipzHu6SglrS/SmLNitls47DakFC+j1OWuXdEDh10jXCCCgSBqRsSVFvA45EyCQrjZZl/ouh4Dx9NaPcoBajXmsNiOj6lISfNNVI3ECEgPKvgE09IscH3s3fuWLVLkoLBPSFU2zUMvoO9lextSYdXFKZtXSXkvIWWoGr7iAsUG7oAH7z0MysnpRBOKrEB3QjoLDuVtY9RDlgDaenEMaB75QMoo3s1B4pOV6OfRCTkUUKxfPgW/c/TIcjQO25XdDXNyzLl0fl3MD9nZBU1Hg8e1VXv0Q9VJtC40Y92a4Fu/sO/aNjksl5Nrw5euwJhVfmCE+IeGuCgPeUKKdO9VJ6m7dNVEj7oOJa8nT1sS+ycBoIbshtl2+Xwv4RCJnsKljckgoYUpNoBavzQxzbymmt5R5EwZJtH7+8Npy5klZwjpRZzAWLVjV3KphbjavhGeXFW60693sEHRPcNaBWQbR5kEuSwHVwzlCyUaNWZzm2sDHJQyEiqnEdn+SwKHYrkTdFc2nctFYtLus+Xdcc0AvNroGK5O1czIJ5ChLXWhAly2ESN5AjnMuYA7a/8FtkZQLw02XMgp5TBZPuQyuY4QUVxZeZljiO1CZKkiKvwVlSflwyABWQNlO+5lUUuRSHGZEzZXQ0wzYo2tKVgxpmGANuxYTojJ5ToiTQxwRLztF3TcliKMHF/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB5668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(921020)(38070700021)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?d1JZMXdQWEtZdUFMRndtOElBS0lUb0M2N1drVzd5b08za2JUN2ZBYlNqcHdk?=
 =?utf-8?B?bUVrSDNHTkhjeDdyT0tzWnNkUHU1YWhiam9Jb0tROVkzaWVldXlTaXBpbm1m?=
 =?utf-8?B?ckpocmttSjA3Y2srUlVhMUlkY1NpdXZGbTI4M1VvK1poVTZHdTV6N2FmZnNM?=
 =?utf-8?B?UUNPYkdiT0JYOWZzK3N3ZkltWHhzWE81b2VJeG1KNGIvcFJNQU9TMU5GTDNN?=
 =?utf-8?B?clpFb21hcFdTdzhUZm9XWUFYZzFiR3hDYjZIQnRpcHViUEFTU2dxQWpOdktl?=
 =?utf-8?B?SHVrTUVYbXdyNWRrcU43aUV2TVZpTlkvWUs3VEhnREs1RjNGWXh5N1FaTXVY?=
 =?utf-8?B?ZGFxaGFmUzJjb1RzZWJzUW1TdWNjK0VtVitDdjQwZkNCWmtabXppZ1huTnVL?=
 =?utf-8?B?NWFCNnFJcWJnWitKdG9HVjNTSVVGRmpWR2xBdnJ3Q3NUNDFRWWd0QmVoajc1?=
 =?utf-8?B?VXFXMkxpK0lJeWEvWm4zRWtOWUczdzMvSDd4MHR4VmFPVEtOV2pTSWw5WVJZ?=
 =?utf-8?B?Q3JSRHVtMWt3YytPRU5WTjdEOHlmNlF3RTg2cjBTUFpPYUxTejZCMTZIc2hv?=
 =?utf-8?B?NDR0cWRQODBvLzN0czlTYjRxOWYxRHpEK0RNcERPaUx4RFZVMi9hcjBuVlI4?=
 =?utf-8?B?cnYycE5rNlVIQWVUaFFDbWRSOUx0THUyeXErUlFnMERDWDN4MnRUb3BkTzdw?=
 =?utf-8?B?ZlQ5c1pMS3RvNXN0ZnhSVHZvWEszclV4NVpNSWV0RU9zR213QzVTU093d3VR?=
 =?utf-8?B?c1YyTm1pRzVpeTNBV3pyTVp6U3U2WFJxUnNrUGVrVUVHWkdhL0c0WE9oZng2?=
 =?utf-8?B?TDZVMEFhTjQ0Z3ltaitIMjNFNkhDbjJJTTJ4M29UcWhyWGFJS1VWZ09aL05U?=
 =?utf-8?B?RCtkbHpwUHRGYTNMb0JwcndZaVZWTVV1K0hkZmgrOFJMODhlT3A2dkM0ZzRQ?=
 =?utf-8?B?dWo5U2FPbmNrSzVuUVZWTUxJQ1ovMk16NUFvUWZPR3psZHFSK1RHL3NldWtI?=
 =?utf-8?B?c1ZqS1g4YzVPQUUrNUZmcG13Znd4VU8zRUg3azdYV3dGQTVUMWxkcFErVWlN?=
 =?utf-8?B?S1hqY2hjNUFzT3h3VmFvd2htbldEbW01bVNGeWE5ditRYWQ0SUM3SUVDa2R2?=
 =?utf-8?B?L2tLczdIRDhFZXl5QmNXV00raEJOLzN1MzBpRVNHYlhDaXJ2ZUtLbC9Fa2o5?=
 =?utf-8?B?WVdEV21zV1pLSjl2RjRqd0F3MFRIaXdUemNValAxRVE3Z092VksvSE1pL3gz?=
 =?utf-8?B?dWk5WUk1ZVorWnk1d0NaS2FvL2JRc2tGNWtXV014akppY054dXNVTDdSdHJN?=
 =?utf-8?B?ZWpXY3M4Z1RaZDIwRFF1ZmtaUFJ1OWlZRjN3UjEyRWlDT1lXK1ozazYxVE5P?=
 =?utf-8?B?NTdaclI2dFhtb0NJV1llSGRrQnVlVUtjdFZUaTRzdnk1VTZuby9SRjlnQ1Qz?=
 =?utf-8?B?SzBjU0hJclRzUDlrZnp1NWFTSUFzRXZ1STgxYWl5bU9wekI5MkFoT3h1aVJa?=
 =?utf-8?B?M1UxNWRGek9XKzIxN1I1YmJuU0ErbkFFZVBuZDJCZFVjSEx3cmhkWUF4L3Jy?=
 =?utf-8?B?QzdGTVE3cVA2YXhreVF5K2VpUUI3NGp4OVFqZ2w1a2xEUFJ5K2M5dXVMTWFZ?=
 =?utf-8?B?a2syTVZJYnh6NW83ZXU4MTB3c1AzblNTY0NpTi9veG1DT0NzZXlSV2pBTi80?=
 =?utf-8?B?dEZjc3FxYVpzU1QzVUJvVDNnR1F3YmZLaE83cndVWFBRRUNpY2pVTWVNVlpu?=
 =?utf-8?B?NmJQMWx0SkdDL0dZdjZlVXc0Z2Vnb0oxS0dGaXU0WjQ2VzNDUHdhWXM4bGxx?=
 =?utf-8?B?M3Zkcno4TjgrblZhQjNWWjBPVndWY3FEQ0g2WHA1MVFxaGhzUGNCVkIvbURB?=
 =?utf-8?B?ZVRnakFrRVYwc1lMaENVRnpHL0NNemdQQkdKRHJoVnkvVXVITUhqUWZZV1RF?=
 =?utf-8?B?bmpQWVQzWXNvckxlVHE5a0V3MG5LZWxaUERDSGlHRW5jVGJIS1VoNnJWZ1Qy?=
 =?utf-8?B?ZVNjSGVTVUNIWWU1L0Y1VHZaSTdIMzY1S1BxMGtsNDRJeEZnTUVneEJ5OWg0?=
 =?utf-8?B?SXliLzE5dEZjUjFsZVozYmtJazM1SEQ1anRCcjhpSFdBMk4zSmhSY0NnSUdx?=
 =?utf-8?B?Yzh1R0xTL2MrQkVmRjBJaEE0TTUrUlZQUzkxWlE5YkJ5NTdBSzQ1eGp4S0JV?=
 =?utf-8?B?cnNRVmhETGdJd3UwUlN1M2dIeWdSaDd4a1RUckw2K29WbHM4MXpQWEtPaGtM?=
 =?utf-8?B?KzIwUkdRRGQrWlBDVVVEejhkQmhVL0pWVVQ0czliZFViY3MwbDRQby8zcll0?=
 =?utf-8?Q?hbgjJvgy/ovwb/Mi1B?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB5668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e778b18-2d00-4a2b-702c-08de95223602
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2026 03:52:10.0164
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5NEDi9gLHor/GGw5apANQn15zWBvNSxYM2VgcTvb80CoV+yeaS9UW4REe7Sy8b/teEK3mrXOypi9RgjBGDJtjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6230
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-34858-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.linux.dev,ragnatech.se,avnet.eu,ideasonboard.com,amd.com,amazon.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivekananda.dayananda@amd.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,renesas];
	NEURAL_HAM(-0.00)[-0.999];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[MW4PR12MB5668.namprd12.prod.outlook.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: 3E0013B6A8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgRHVtaXRydSwNCg0KVGhhbmtzIGZvciBzcGlubmluZyB0aGlzIHNlcmllcyBhZ2Fpbi4gSSB3
YXMgYWJsZSB0byBydW4gaXQgZW5kLXRvLWVuZCBvbiBvdXIgYmVuY2ggKElNWDIxOSDihpIgTUFY
OTY3MTcg4oaSIE1BWDk2NzI0KSB3aXRoIHRoZSBkZXNlcmlhbGl6ZXIgdXNpbmcgY29udHJvbC0N
CmNoYW5uZWwgcG9ydOKArzEsIGFuZCBldmVyeXRoaW5nIHN0cmVhbWVkIGFzIGV4cGVjdGVkLg0K
DQpPbmUgdGhpbmcgSSBub3RpY2VkIHdoaWxlIHRlc3Rpbmc6IGluIG1heDk2NzI0X3NlbGVjdF9s
aW5rcygpIChtYXg5NjcyNC5jOjg4OSksIHdlIHplcm8gTUFYOTY3MjRfUkVHMyBiZWZvcmUgd2Ug
bG9vcCBvdmVyIHRoZSBsaW5rcywgYW5kIG9ubHkgc2V0IHRoZSBiaXRzDQp0aGF0IGNvcnJlc3Bv
bmQgdG8gZGlzYWJsZWQgbGlua3MuIFRoYXQgbWVhbnMgZXZlcnkgZW5hYmxlZCBsaW5rIGZpbmlz
aGVzIHdpdGggMDAsIHNvIHRoZSBwcml2LT5jY19wb3J0X2NmZyB2YWx1ZSB3ZSBjYWNoZWQgZnJv
bSBtYXhpbSxjb250cm9sLWNoYW5uZWwtcG9ydA0KKDB4QUEgZm9yIHBvcnTigK8wLCAweDU1IGZv
ciBwb3J04oCvMSkgZ2V0cyB3aXBlZCB0aGUgZmlyc3QgdGltZSB0aGlzIGhlbHBlciBydW5zLiBU
aGUgc2lkZSBlZmZlY3QgaXMgdGhhdCBhIGJvYXJkIHJlcXVlc3RpbmcgcG9ydOKArzAgaW4gRFQg
d2lsbCBrZWVwIHRoZSBkZWZhdWx0DQpwb3J04oCvMSBhZnRlciBhbnkgY2FsbCB0byBzZWxlY3Rf
bGlua3MoKS4gSWYgd2Ugc2VlZGVkIHZhbCB3aXRoIHByaXYtPmNjX3BvcnRfY2ZnIChvciB3cm90
ZSB0aGF0IHZhbHVlIGJhY2sgYWZ0ZXIgdGhlIGxvb3ApIGJlZm9yZSB3cml0aW5nIHRvIE1BWDk2
NzI0X1JFRzMsDQp3ZSBjb3VsZCBwcmVzZXJ2ZSB0aGUgRFQtY29uZmlndXJlZCBDQyByb3V0aW5n
Lg0KDQpWaXZlaw0K

