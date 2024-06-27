Return-Path: <linux-gpio+bounces-7744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71B4919F09
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 08:09:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D81DE1C21FC7
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 06:09:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1882D792;
	Thu, 27 Jun 2024 06:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="mDDrk9uj";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="U8ZFp40m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9EF22EF4;
	Thu, 27 Jun 2024 06:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.153.233
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719468529; cv=fail; b=c1Hc3ePoUXihY1DoCsKs0i8Bt3HMzedbtWxVuqg57hDvEyO+CmJkVBRJyPIGrZeBv2pVrPVBZean+eE2s+iF8I6sNbGgr+4NbdiWunyJbIuFAt6M/PafHwVxL2VJDQhhJ768o2PeWhgy+2idoxo3lEcFdxK9+qNUepTLtKpPcgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719468529; c=relaxed/simple;
	bh=RX1i7MUtXFt1fqQ5egaqviXRPay8HXJrmffpzyUWDgk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=AEC5wXXLEUcRmnf6h/KDmqEQ1/LRbk6PUNM7ZZoDevFIYhjyJlGgzhP6h3bik9IgKcUrLd6twfyHwS0Hq3yNacJZXJVlhOAuHN5MvhTAT9/ZIQr5KvD2OXqwPiA66qem2J4X8WajT5t09OmDEF+uiUwGPl4/g6T/3PGPoW/KVJs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=mDDrk9uj; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=U8ZFp40m; arc=fail smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719468527; x=1751004527;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=RX1i7MUtXFt1fqQ5egaqviXRPay8HXJrmffpzyUWDgk=;
  b=mDDrk9ujhGm25d9bFy5jXWlanfqGgk6eWIvy9h8QH3iG057U4BVqkPON
   p9sFAn1t4TzJ3FSRrogPbeRm54vUzjDn/+Z1Hz5hBKro+LNkBAGHzCtjc
   M/wxHb27TNdMkNltf0kzCdnqiErGzdlAW0sFoxirsceilw7VLKlUp8iwW
   LknUPjw0L+qrX29fGJ9AHAqgpF4Qvm4Jn8FvXQVUTlyjLoVC22C7m3znu
   zOPuCiAkZ4vIshgYe0TVsg6ygvmvyevQbGigrLBb8ut9w4XH3LjqvW0zg
   gyms4sPVJ4RkPN7G5JTK9OfJMylP40/5QkuZrB0UlLMnHCWchyxWOd2EQ
   A==;
X-CSE-ConnectionGUID: DoVVEmInTb2bd2Eizmm76A==
X-CSE-MsgGUID: kiIN9I73QtKIktfHdR8xRQ==
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="259438106"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 26 Jun 2024 23:08:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 26 Jun 2024 23:08:17 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 26 Jun 2024 23:08:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UUx1fRufiNVoblCI5p8wjlRHK+sWOAFGmt07wcyNRKlB/LbxGAECGBWpbqCQbxiCdublql42UtnHIU3Dmr+tc62HJFuxTNLDdmMHuBUVYd8kwT/7z8RRd2/mfxYVn2e4ckp32jV2NEou0o/ngcRg8bVbSm2T/WKXL5Dpv9uW//7orLj+equZtJQLNOocJnYJ0psB1pZxT9KpOaChV+BkRqJhWV7NGQssLcyipuVsvyLQfPSb5JAA1zYVae/dxMvvverO24KYiAXtY5hXorTQ/CViuK6RxdMaXkwWEqpIEir3n1FeKmW4YR6dzBIjvxIay2mSYN/4G9N9Ar3Cu8LVgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RX1i7MUtXFt1fqQ5egaqviXRPay8HXJrmffpzyUWDgk=;
 b=GefL8a64FSaAnEi33AU66MVVdk0pfhygzXc3m+JBZCVCYMhguqOK57nlHReRUce/iXdGxX1TPCBeyh/+l7M51gLsa2LFJWucwB8Ntj3L2Cvg4snEQN89ICpuBCubcZF8UdnqRWAfEHHZyLswuUDVDy+R6axXHmoZKCKo4O36klaIUT5dFnzdsEir1ZTmKX0ueIBVlkOSOhIPx3kIte5yLfbSCsrQpB3DxdplX2dvEfjJzW7US5gIibIx3C+kuv5J1SdduLoPBfTB/hneH6TfEyTrmzGbxb8rrpqYbpLfn8SllUMuz5qncjH6BxeF8YyhwKuz3Tz5Xddsmsyguz9gLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RX1i7MUtXFt1fqQ5egaqviXRPay8HXJrmffpzyUWDgk=;
 b=U8ZFp40mClrbvT/XdzIiK7CqLV1tThU1xFnlOBBvIyLl33leRmXKgJ2VKImrpZq4tCEig4I9VJXG9cHF4QSYaTE+W0XrItQakHodilWSMEp5Exlg1SHr/LNduGyvH4WNKHqtEoSdJtI3SrgNy/Pcl/XIv0cn8/nzLLAnkYZ+juCZwiZoFG8CtEnvXuaueGNC1zGRkctKycsE6lHkL2G2QT+1aLucFMGE4oS6MoaqhGu8DbN6rrs3MZNZhpOvcf9JP8LJrTGhLVPAnf/xt9fDV9K/TqKPMU2bm5bO/2voY/joML1iXxfkv6zI6ACcopiY71gaALb+pxy45I14sbVR2A==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by CY8PR11MB7289.namprd11.prod.outlook.com (2603:10b6:930:99::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.32; Thu, 27 Jun
 2024 06:08:16 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7698.025; Thu, 27 Jun 2024
 06:08:15 +0000
From: <Manikandan.M@microchip.com>
To: <conor@kernel.org>
CC: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<Durai.ManickamKR@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 4/5] dt-bindings: gpio: convert Atmel GPIO to
 json-schema
Thread-Topic: [PATCH v2 4/5] dt-bindings: gpio: convert Atmel GPIO to
 json-schema
Thread-Index: AQHaxrlS+Df6OrvTPEWeX/LKfYI4pLHYrbMAgAELqgCAAAeXAIABYmKA
Date: Thu, 27 Jun 2024 06:08:15 +0000
Message-ID: <cb42c36c-6496-441a-a6c5-e4fdb512292e@microchip.com>
References: <20240625043525.279711-1-manikandan.m@microchip.com>
 <20240625043525.279711-5-manikandan.m@microchip.com>
 <20240625-clerical-manicure-ebc8a1d1b16b@spud>
 <96898000-1ef4-40c7-83de-3759d48c9ace@microchip.com>
 <20240626-fondly-batboy-e99846fd6c45@spud>
In-Reply-To: <20240626-fondly-batboy-e99846fd6c45@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|CY8PR11MB7289:EE_
x-ms-office365-filtering-correlation-id: 83969e5d-ec27-428e-f24c-08dc966f8893
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aC9qNXNxalhGN0oyRlBzdnNYajBIaGYzQkVST3lMWjNyaGpicVFjS2ZtQ3gr?=
 =?utf-8?B?ZXQ4THJZT0k0OXF3cllvdlBCSlB4TmxjTHQ5ako5U0J5TFRpYUhLTyt2a1Z5?=
 =?utf-8?B?Y3hEY3ZJZ0dvUzdOeWJzd1dkT0VHK1JQTVhNTnFKL3ladWNtaFYwejhZUnMx?=
 =?utf-8?B?dUswdlEyL0cvUCsxZFN0bi85QnFvOHpLUTVQZTcrN1l0SWdVSXJ5bEV0aXhi?=
 =?utf-8?B?QUtOakZuS1FPRkF4Y3FpbDBOMkdHdXREaVBNZ3JQcHlvMFpHMUdzdEpnSTFm?=
 =?utf-8?B?emJ2ZXdHRUphWVRLN2JCL1RqcERMcW1YVlZYbDlNZEFWd29iZ21YeDlOakJo?=
 =?utf-8?B?QXZKUFU2U0lqeGNYaTlmc0FTcWpRMHhWbkp1OUZtWWFIeGlqc0Rmd1dEMC9D?=
 =?utf-8?B?QldRZkZsMlhUelczdWhHakNaWjM5b1FocVVUNEtJUmhZT3NGUnAyd0g2c2g5?=
 =?utf-8?B?anM4WWFXV0RXaW1Ra3EwUWdwc3ZSQjVORlRieG5WeVg4ZTJpbjZmUTFySjhW?=
 =?utf-8?B?ZUtycForTFN3eGwrcTg2UVZsLzNEUnJYQjRBVExDQXlyTVlHbVFwcENEUThV?=
 =?utf-8?B?TjVVU2dCVmh6bFlLU1FERVNTLzFIZ1FCS3BXYTI4QTNoVTZ2ajQrRTlTRjBi?=
 =?utf-8?B?NXYwWW9oY0RhdC9CZS9pMGd3amdIcENSUTRKdU5aZzBXRGErbkJkd3ZzTXNk?=
 =?utf-8?B?U1Fzb0JndnJJWWZYUk1BRXl5Y3I5WVUyTzBHYW5za1NnUEVOQ3VkV1pqd3lh?=
 =?utf-8?B?T2JvRmFMc1NIaERoRnYxblVqa2o0cVlVYjd1QllJcUhHSURRYXVQQTlUZktQ?=
 =?utf-8?B?OGZiZFEvWlUxOVZST2xKL3NFUEhvUUNXQWtqMHg4Z2FudHVuWkxhNFVjQ21N?=
 =?utf-8?B?SFhnczE0c0tsVmczajdVMHRWS1pxbVlIT1gzQlhuRHNVSk1nY2VTSmI4Mngv?=
 =?utf-8?B?TEpjZlBuVTlhTDdoQ0tGUGxwbmNlOGw1eFhhdVphcmtQYlFSaU9IVi9XbS9M?=
 =?utf-8?B?dVp4WENKS0ZnQklWVzU0OUlFZlBPazJYUkRGUW1tN0cyejFvUisrUGR3RFlT?=
 =?utf-8?B?cUhDQXJydWdjY3RMeFhIdDJINGVrZU9Ub2NibDRIdTNMYll5TEZzRVcrbi9E?=
 =?utf-8?B?MS9tM25sTUhqZlR0cDkvQ3I1aDEwT1hjUVdRZm1oQjhSMCtkM3VpYXArNGhm?=
 =?utf-8?B?cnloUVltaWhVRXAweldKRFozb2hoWkxaMG5BRG01K0RyWC8yalROa3VWTGRI?=
 =?utf-8?B?OHh2L2xJZkhVQmhJY2tQdTVscDg0bHU1ZzFaMmdFSFlaQno1cEUwYkNlbTNB?=
 =?utf-8?B?OFU4aGIxOWRiRVBLNmVvVXZPZmp4cTNxSlJGazRVR2MwUWtOK0xCSmREM3Nm?=
 =?utf-8?B?dldLaUhwM1UxeVBFMExYeGt3VHZlSHp0Wllzb3llT3QyMkM3bkZoWkdLSFpS?=
 =?utf-8?B?SUh5U3RuZDJQQm1KbWNlMncyNzVaMlVHanVQcG42VjVCOVlUdS9rYnluQkdo?=
 =?utf-8?B?TGhoODhlOXc1Q0xrYzE0Y3F0WkpVR0RjVURvVmsrajhndTdmNUhaL0Fld1Vm?=
 =?utf-8?B?VWxQRUhvb0NUZzlWMEpQMEtBNkZPb2F2QWhaMFNZSGE0OFdwL3llaXNWa1gz?=
 =?utf-8?B?NTBWMXRUcnJORlVDbDd3NnVsWjdXZU9zVTlFTGpyVjZGUzVQZlBxT3FTOGl4?=
 =?utf-8?B?amcxYnFWcXU0TTF3NFU5dTRkc0trWlNmQm9XMDZBVm5zWDNDL09rREJ0SC9v?=
 =?utf-8?B?Sk5lbjJUejNPV2N5K2hsWitReCtrTENTMWlhSGVPOUpSeGFZdzZtT3J6REtm?=
 =?utf-8?Q?XyfIMacVo0H4u0mEb+SyZ8/+Wyhh/JRvBYR1Q=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6609.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aGE5anpmZmRWVlNnZFQzeU5kRHZRK3NSWk1zOE9qTnNDcDVXNUdXbmNGVXdC?=
 =?utf-8?B?SitXWEs5MmtjMlN5M29EenhuTUpvT2kybjM3eUpnSVMyT05xOE9zK05BejlE?=
 =?utf-8?B?QlQ4bjhZQUVTNlBCbUJQYTRpTXlHRVZodmhXSGc1V21lL0M3TjRIU1hVT0tp?=
 =?utf-8?B?LzVLWW5iYTVRTlVzUlFsZVNBWGpDOHVOUGhRSEQ5R3F3OWoxNFpsOXpRMFVh?=
 =?utf-8?B?Z0RtZ2hFWUVMWlZNcDZVRXRhNU9RU2JqUlpCZjRHV3Z0b1RBNXhJNlB1K3Bt?=
 =?utf-8?B?VTk3Y0N0Ujk2dGFtdHVvRE5BSEltaG9YUjhTTjkyZTJaMERNZTd1elVZTFVx?=
 =?utf-8?B?MkJENWFSSVYvcU03Q0dmd1paaEtxNllvdXhnWU5OZmY2Vnkrem9GL1k2SmNX?=
 =?utf-8?B?enFJcmpYL1YreTh1bkw4R2E2TDU4VmFzemd4QjNCMm5JT1hYaGVVTGZFZU5E?=
 =?utf-8?B?Y2RlVFFKY09iUGFTaWVBRUQ5Z3kyc282VE4vUlorK2xCQkFTTmZ5SVQxb0Zj?=
 =?utf-8?B?WktMSDlUUTgvdkxuTk9lT2YwU2NzY3BMUkxzczVqRm1qU3RDbEl5c3dMOUJ4?=
 =?utf-8?B?S3RtaHc2U3BpWDdLWVFOK2pWY0hCNjBhNGJESzM3OEZ0SkpxN24xa2ZPbTJY?=
 =?utf-8?B?N1c2aE9Xdnc5cHJhdlhZMkU2eC8vYkJvMHNVVlV2dXNnczhRVGRjY2RUL1BQ?=
 =?utf-8?B?dWduUTBHNWduVGFNWmExQXRBcDIxZVQvenA4UkxCTXk0OStOL0o3cnNQU25w?=
 =?utf-8?B?cUJMSXltbmhnbC8xc0tEb2hxQWRoWFhJRGhGVnJvbXVXVFhqTmZVU2t1c01M?=
 =?utf-8?B?ZGwyUERqVW9VTStFRmZ1UHpBeUQ2bVlienkyWDFzZW05TGQ3b1pjcnk5RUVK?=
 =?utf-8?B?Nk81N1EvM2RhZ1FxYTF2c2lqY2EvakFadFpoc3ppS0lyK1N0SW5rckxlR0o0?=
 =?utf-8?B?c3BkZkdlK0dEbWtQZm56eTM0WUVGYk1IczZKbEh2RlRvMnl3ekk2TUd1b1dC?=
 =?utf-8?B?WVpoZ1loTkpKN0xWRDBkVWdNMzV0aHJkT3ZoM3RFaHRERnc4NUMxL2p4S3R5?=
 =?utf-8?B?b3BKanZtNEZaZEFPbzFFZGtnTTAvZEJLWk02NHh3RGtaZFNnWWdHZURLbGNJ?=
 =?utf-8?B?SGxTTHR2TEV1c0cySk90NkdKZmV5dENPZEZ2ZDFlOVBsWkRZdTVTam9HUjlW?=
 =?utf-8?B?WGdBdDNSNzJPNjI1eE5DV3lYNEFKSHBtL0xoN1N6NGZuaEVnUjZveUtHOUV4?=
 =?utf-8?B?eUk5K0VVZUpUYWlxOFBaMmtoTXUyUzVLQ2wyNXBhSW51UnlEa29TdzI5eno2?=
 =?utf-8?B?Y2dWbDRrOWw4dXlKaFFQaGU0cG5yaWFoMWpOYUhwSVJUVDd0c3dvK1c1TUdT?=
 =?utf-8?B?Q2pQTEN6TytETkVqL1hrUUp2V09HaU5UVUpyRHNpNDVZUTZEMThlMmdPUUNV?=
 =?utf-8?B?TDBZTWlYd01lUWtEMXZ1QlY2eURvR2lzMEZoM29rN0x1VnJuMHE5YWZQNzY4?=
 =?utf-8?B?Mm1yb21YM3VhMkRKYk5aUFlrWjIyaERJSTkxMUowYWw4TXAybklmd01NOUVm?=
 =?utf-8?B?OHh3QWlyWldaUDRGWll5UmFTZlovb3J5bVhGVmU0MFRscUEvMlVmY1RhL3pD?=
 =?utf-8?B?SlNFb092NFdqZlFYMDl1Uy9wTjg2M2dnMWdjU2RyQUpKL1hzZFRPc2dsaUVI?=
 =?utf-8?B?d09Dc2UzSkI4UlhtdWFFMThVbCs1eEhvR09PZVB6UC9zRG92Yi81SS9iVlRG?=
 =?utf-8?B?MWpMQUtLTjVMOUljNTBFOHFya3RJSERLMU1NUjVVV0hXOHpWZzYzOUdsZE00?=
 =?utf-8?B?Y0I1V0k1U1hINzZpK3h5aXZMWno0ZzJNem9wSlJnTkJlQkowUHc0a2x3SkJQ?=
 =?utf-8?B?N1dDTEpEc2QzVFJpamUrbWdNbG14VUZFV3RVdVlwSXprVENNbkx5emJsRUNQ?=
 =?utf-8?B?UGtrZ21pdTZJYlpjV3I4WUJzZTdNL0d4Z3MyRWhEQnMxdVNrcUtCTzllemxG?=
 =?utf-8?B?YU5yeUxQSFNLNWFSdGRGMjd5Z1BYN2k3TGdzUlhGdEVPNjlVYTNhWVNZaHF2?=
 =?utf-8?B?WlpxdC9YODE3WjNQV2IrMERUT3RObVRoWE1iVXFXazA3eFFyTVhrempxK1Jn?=
 =?utf-8?Q?gyLHSfsQTNqjGTPo7PqHMGMyM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A881C1CA252A66419E6727945B2F0ED9@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83969e5d-ec27-428e-f24c-08dc966f8893
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2024 06:08:15.6275
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4UkIO9shcU0f72ImXLCCsdgtMx1JGyRijmzDTdv8ux3MNWPhIkrOk0l4kKImM/mvpo1uXkgjtnJB56qyoPFCEt0WByaK2IuPwLYSJ/GnX6Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7289

SGkgQ29ub3IsDQoNCk9uIDI2LzA2LzI0IDI6MjkgcG0sIENvbm9yIERvb2xleSB3cm90ZToNCj4g
RVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVu
bGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiANCj4gRm9yd2FyZGVkTWVz
c2FnZS5lbWwNCj4gDQo+IFN1YmplY3Q6DQo+IFJlOiBbUEFUQ0ggdjIgNC81XSBkdC1iaW5kaW5n
czogZ3BpbzogY29udmVydCBBdG1lbCBHUElPIHRvIGpzb24tc2NoZW1hDQo+IEZyb206DQo+IENv
bm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4NCj4gRGF0ZToNCj4gMjYvMDYvMjQsIDI6Mjkg
cG0NCj4gDQo+IFRvOg0KPiBNYW5pa2FuZGFuLk1AbWljcm9jaGlwLmNvbQ0KPiBDQzoNCj4gbGlu
dXMud2FsbGVpakBsaW5hcm8ub3JnLCBicmdsQGJnZGV2LnBsLCByb2JoQGtlcm5lbC5vcmcsIA0K
PiBrcnprK2R0QGtlcm5lbC5vcmcsIGNvbm9yK2R0QGtlcm5lbC5vcmcsIE5pY29sYXMuRmVycmVA
bWljcm9jaGlwLmNvbSwgDQo+IGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tLCBjbGF1ZGl1
LmJlem5lYUB0dXhvbi5kZXYsIGFybmRAYXJuZGIuZGUsIA0KPiBEdXJhaS5NYW5pY2thbUtSQG1p
Y3JvY2hpcC5jb20sIGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnLCANCj4gZGV2aWNldHJlZUB2
Z2VyLmtlcm5lbC5vcmcsIGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZywgDQo+
IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmcNCj4gDQo+IA0KPiBPbiBXZWQsIEp1biAyNiwg
MjAyNCBhdCAwODozMjo0MUFNICswMDAwLE1hbmlrYW5kYW4uTUBtaWNyb2NoaXAuY29tICB3cm90
ZToNCj4+IE9uIDI1LzA2LzI0IDEwOjA0IHBtLCBDb25vciBEb29sZXkgd3JvdGU6DQo+Pj4gUmU6
IFtQQVRDSCB2MiA0LzVdIGR0LWJpbmRpbmdzOiBncGlvOiBjb252ZXJ0IEF0bWVsIEdQSU8gdG8g
anNvbi1zY2hlbWENCj4+PiBGcm9tOiBDb25vciBEb29sZXk8Y29ub3JAa2VybmVsLm9yZz4NCj4+
PiBPbiBUdWUsIEp1biAyNSwgMjAyNCBhdCAxMDowNToyNEFNICswNTMwLCBNYW5pa2FuZGFuIE11
cmFsaWRoYXJhbiB3cm90ZToNCj4+Pj4gQ29udmVydCB0aGUgQXRtZWwgR1BJTyBjb250cm9sbGVy
IGJpbmRpbmcgZG9jdW1lbnQgdG8gRFQgc2NoZW1hIGZvcm1hdA0KPj4+PiB1c2luZyBqc29uLXNj
aGVtYS4NCj4+Pj4gVGhlIGNvbXBhdGlibGUgc3RyaW5nICJtaWNyb2NoaXAsc2FtOXg3LWdwaW8i
IGlzIGFkZGVkIGFzIHdlbGwuDQo+Pj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1hbmlrYW5kYW4g
TXVyYWxpZGhhcmFuPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPj4+PiAtLS0NCj4+Pj4g
Y2hhbmdlcyBpbiB2MjoNCj4+Pj4gLSBGaXggYm90IGVycm9ycyB3aXRoICdtYWtlIGR0X2JpbmRp
bmdfY2hlY2snLCBtaXNzZWQgdG8gYWRkDQo+Pj4+ICJhdG1lbCxhdDkxcm05MjAwLWdwaW8iIGFz
IHNlcGFyYXRlIGNvbXBhdGlibGUgZm9yIGRldmljZXMgdGhhdCB1c2VzIGl0DQo+Pj4+IC0gUmVt
b3ZlIGxhYmVsIGZyb20gZXhhbXBsZQ0KPj4+PiAtIEFkZCBkZWZhdWx0IGVudHJ5IGZvciAjZ3Bp
by1saW5lcyBwcm9wZXJ0eQ0KPj4+PiAtIEFkZCBuZXcgY29tcGF0aWJsZSBzdHJpbmcgZGV0YWls
cyBpbiBjb21taXQgbWVzc2FnZQ0KPj4+PiAtLS0NCj4+Pj4gICAgLi4uL2JpbmRpbmdzL2dwaW8v
YXRtZWwsYXQ5MXJtOTIwMC1ncGlvLnlhbWwgIHwgODEgKysrKysrKysrKysrKysrKysrKw0KPj4+
PiAgICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW9fYXRtZWwudHh0ICAgfCAzMSAt
LS0tLS0tDQo+Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygrKSwgMzEgZGVs
ZXRpb25zKC0pDQo+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvZ3Bpby9hdG1lbCxhdDkxcm05MjAwLWdwaW8ueWFtbA0KPj4+PiAgICBk
ZWxldGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8v
Z3Bpb19hdG1lbC50eHQNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncGlvL2F0bWVsLGF0OTFybTkyMDAtZ3Bpby55YW1sIGIvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vYXRtZWwsYXQ5MXJtOTIwMC1ncGlvLnlh
bWwNCj4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQNCj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi4z
ZGQ3MDkzM2VkOGUNCj4+Pj4gLS0tIC9kZXYvbnVsbA0KPj4+PiArKysgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9hdG1lbCxhdDkxcm05MjAwLWdwaW8ueWFtbA0KPj4+
PiBAQCAtMCwwICsxLDgxIEBADQo+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BM
LTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkNCj4+Pj4gKyVZQU1MIDEuMg0KPj4+PiArLS0tDQo+
Pj4+ICskaWQ6aHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvZ3Bpby9hdG1lbCxhdDkxcm05
MjAwLWdwaW8ueWFtbCMNCj4+Pj4gKyRzY2hlbWE6aHR0cDovL2RldmljZXRyZWUub3JnL21ldGEt
c2NoZW1hcy9jb3JlLnlhbWwjDQo+Pj4+ICsNCj4+Pj4gK3RpdGxlOiBNaWNyb2NoaXAgR1BJTyBj
b250cm9sbGVyIChQSU8pDQo+Pj4+ICsNCj4+Pj4gK21haW50YWluZXJzOg0KPj4+PiArICAtIE1h
bmlrYW5kYW4gTXVyYWxpZGhhcmFuPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPj4+PiAr
DQo+Pj4+ICtwcm9wZXJ0aWVzOg0KPj4+PiArICBjb21wYXRpYmxlOg0KPj4+PiArICAgIG9uZU9m
Og0KPj4+PiArICAgICAgLSBpdGVtczoNCj4+Pj4gKyAgICAgICAgICAtIGVudW06DQo+Pj4+ICsg
ICAgICAgICAgICAgIC0gYXRtZWwsYXQ5MXNhbTl4NS1ncGlvDQo+Pj4+ICsgICAgICAgICAgICAg
IC0gbWljcm9jaGlwLHNhbTl4NjAtZ3Bpbw0KPj4+PiArICAgICAgICAgIC0gY29uc3Q6IGF0bWVs
LGF0OTFybTkyMDAtZ3Bpbw0KPj4+PiArICAgICAgLSBpdGVtczoNCj4+Pj4gKyAgICAgICAgICAt
IGVudW06DQo+Pj4+ICsgICAgICAgICAgICAgIC0gbWljcm9jaGlwLHNhbTl4Ny1ncGlvDQo+Pj4+
ICsgICAgICAgICAgLSBjb25zdDogbWljcm9jaGlwLHNhbTl4NjAtZ3Bpbw0KPj4+PiArICAgICAg
ICAgIC0gY29uc3Q6IGF0bWVsLGF0OTFybTkyMDAtZ3Bpbw0KPj4+IEl0J3Mgd29ydGggcG9pbnRp
bmcgb3V0IHRoYXQgdGhpcyBpcyByZXF1aXJlZCwgYmVjYXVzZSB0aGUgZHJpdmVyDQo+Pj4gaW1w
bGVtZW50cyBhIGRpZmZlcmVudCBzZXQgb2Ygb3BzIGZvciB0aGUgc2FtOXg2MC4gVGhlcmUncyBu
b3QganVzdCBtb3JlDQo+Pj4gb2YgdGhlbSwgdGhleSdyZSBkaWZmZXJlbnQgdG9vLg0KPj4+IEFy
ZSB0aGUgc2FtOXg2MCBhbmQgYXQ5MXJtOTIwMCBhcmUgYWN0dWFsbHkgY29tcGF0aWJsZSwgb3Ig
aXMgdGhlDQo+Pj4gZmFsbGJhY2sgaGVyZSBzb21lIG1pc3Rha2UgdGhhdCBvcmlnaW5hdGVkIGlu
IHRoZSBkdHM/DQo+Pj4NCj4+IFRoZSBQSU8zIHBpbmN0cmwgZHJpdmVyIHVzZXMgdGhlIGNvbXBh
dGlibGUgImF0bWVsLGF0OTFybTkyMDAtZ3BpbyIgdG8NCj4+IGZpbmQgdGhlIG51bWJlciBvZiBh
Y3RpdmUgR1BJTyBiYW5rcyBhbmQgYWxzbyB0byBkaWZmZXJlbnRpYXRlIHRoZW0gZnJvbQ0KPj4g
dGhlIHBpbm11eCBjaGlsZCBub2Rlcy5UaGUgZHJpdmVyIHByb2JlIGZhaWxzIGlmIHRoZSBhdDkx
cm05MjAwIGlzIG5vdA0KPj4gcHJlc2VudCBpbiB0aGUgR1BJTyBiYW5rIGNvbXBhdGlibGUgcHJv
cGVydHkgbGlzdC4NCj4+IEZvciBzYW05eDcsICJtaWNyb2NoaXAsc2FtOXg2MC1ncGlvIiBpcyB1
c2VkIGFzIHRoZSBmYWxsYmFjayBjb21wYXRpYmxlDQo+PiBhbmQgImF0bWVsLGF0OTFybTkyMDAt
Z3BpbyIgaXMgYWRkZWQgYnkgZGVmYXVsdCB0byBhdm9pZCBwcm9iZSBpc3N1ZXMNCj4+IGFuZCBo
ZWxwIGZpbmQgdGhlIG51bWJlciBvZiBHUElPIGJhbmtzIGJ5IHRoZSBkcml2ZXIuDQo+IFRoYXQn
cyB1bmZvcnR1bmF0ZWx5IG5vdCB3aGF0IEkgYXNrZWQuIEZvcmdldCBhYm91dA0KPiBhdDkxX3Bp
bmN0cmxfY2hpbGRfY291bnQoKSBmb3IgYSBtaW51dGUgYW5kIGFuc3dlciB0aGUgcXVlc3Rpb24g
YWdhaW46DQo+IEFyZSB0aGUgc2FtOXg2MCBhbmQgYXQ5MXJtOTIwMCBhY3R1YWxseSBjb21wYXRp
YmxlPw0KPiANCj4gSGludHM6DQo+IC0gRG8gdGhlIHJlZ2lzdGVycyB0aGF0IGFyZSBpbiB0aGUg
YXQ5MXJtOTIwMCBoYXZlIHRoZSBzYW1lIGJlaGF2aW91ciBpbg0KPiAgICB0aGUgc2FtOXg2MD8N
ClRoZSByZWdpc3RlcnMgaW4gYXQ5MXJtOTIwMCBoYXZlIHRoZSBzYW1lIGJlaGF2aW9yIGFzIHNh
bTl4NjAgZXhwZWN0IA0KdGhhdCB0aGUgZm9ybWVyIHN1cHBvcnRzIG9ubHkgMiBQZXJpcGhlcmFs
IGZ1bmN0aW9uIHBlciBwaW4gd2hpbGUgDQpzYW05eDYwIHN1cHBvcnRzIDQuDQo+IC0gQXJlIHRo
ZSBuZXcgcmVnaXN0ZXJzIGluIHNhbTl4NjAgb3B0aW9uYWwsIHNvIHRoYXQgaWYgYWxsIHNhbTl4
NjAgY29kZQ0KPiAgICB3YXMgZGVsZXRlZCBmcm9tIHRoZSBkcml2ZXIsIHRoZSBkcml2ZXIgd291
bGQgc3RpbGwgd29yayBmb3IgdGhlIHN1YnNldA0KPiAgICBvZiBmZWF0dXJlcyB0aGF0IHRoZSBh
dDkxcm05MjAwIGFscmVhZHkgc3VwcG9ydHM/DQphdDkxcm05MjAwIGZ1bmN0aW9uIHdpbGwgd29y
ayBmb3Igc2FtOXg2MCBidXQgbm90IHVwLXRvIGl0cyBmdWxsIA0KcG90ZW50aWFsLlRoZSBuZXcg
cmVnaXN0ZXJzIGluIHNhbTl4NjAgZm9yIGRyaXZlLXN0cmVuZ3RoLCBzbGV3LXJhdGUsIA0KZGVi
b3VuY2UsIHB1bGwtZG93biB3aWxsIGhlbHAgZHJpdmUgdGhlIHRoZSBjdXJyZW50IHBpbm11eCBj
b25maWdzIGZvciANCnNhbTl4NjAvOXg3IGJvYXJkIERULg0KPiANCj4gVGhhbmtzLA0KPiBDb25v
ci4NCj4gDQoNCi0tIA0KVGhhbmtzIGFuZCBSZWdhcmRzLA0KTWFuaWthbmRhbiBNLg0KDQo=

