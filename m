Return-Path: <linux-gpio+bounces-26079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C66FB55339
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 17:24:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C9333BE75C
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Sep 2025 15:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6610A21D3F5;
	Fri, 12 Sep 2025 15:23:14 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022105.outbound.protection.outlook.com [40.107.75.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A6A155A4E;
	Fri, 12 Sep 2025 15:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690594; cv=fail; b=ZOrWf6lhrTu/Aygo9pHvjuAj6VCbTUvggKkQOnxFFXvskZ7Bc8FteDxAVtmyrJ36HJEKHy7teGlEIU96y10tv91KZ+tY44tSVnp79LPA2DzDpqlw502hvkuhYnqKbCTPJOk/+FUAbXeREndLirEDmp/Wih/uJOX6yBSH8KCUyvg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690594; c=relaxed/simple;
	bh=kSl+XusDKV8alonwryScrSyWNjfwwlWiDpvTwrKUS5k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ll3Frc+af6bzmYMsVJ6rSg2uJEYR0ztvbE5FEby9rmnYMqXYphxSLePt6Wx1pHZ6tRpkKqNt2+uC9TyL9Y8r2dZW36EOJQllH9xjbPXYXNMz3/VP4b3Vc6ueM0eBanE9mWdWfm0JmA6kUZ5/aLLzW3T20qXEJZnwCYnRPCjN8Ys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.75.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IFEnCJn3gT27JzRwczxXYCE30hj0H0L0ewrnOagJMK7Nl/MoUDrpnbX/SoSeERYbGytJnE/Rju9SP56p9D7lHvwcHuveyS6FJf6qJRTQBcXNgyY8mwusmHcdNNZXQhGoK6rYi6AdDXo2baWVWo2+tbkZGSmx4+HdDvNchaXxtxZvk1ImAUF/oUCuRZmjULnuhp/lnYn3mxnyZgqBHK9JwfsAe2Skyd/4mEYtu456LXkRc7z+nSKSHFn5f4M3M9CsIb4lAg7miDj/O5Ls6S56snT76hj0gupQrXNTf1PKPIHYEJoEdkDLWmVSCWcDXjPcwdKfUzhxfdfwHBD64BZWEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSl+XusDKV8alonwryScrSyWNjfwwlWiDpvTwrKUS5k=;
 b=gZu8DZeBX5jgxEA4yB7H2+XSrVp659kT1mx9O3/ZsUgvX5SB6WcAE1Nha6pM7xuJ/kODqABtawS1DoLJtPF8dFWWpPrrh5ojoqCFCoDr6NwVKUE+OcxmRa8MRJymHWHGYni/u9NBuQodvQ0OWHc+rPvaKKOTmRCsjoHy8L9Qr0zfMkxFkLCF6/cFC2SsdJLExbv+VyUKtOAsYx84/+HUamja2NA388slA13qHY1xK0su9Du3DBPvBMEmWJ/m657AJrHN81+07OIP0Xy3LHvEc0KyDTxQwBQc9wO+FvrDvNnxyOqikys+x6TXb/M25OxpmeNX5FqCx18oq7smz4hbjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cixtech.com; dmarc=pass action=none header.from=cixtech.com;
 dkim=pass header.d=cixtech.com; arc=none
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com (2603:1096:301:117::13)
 by PUZPR06MB5820.apcprd06.prod.outlook.com (2603:1096:301:f2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 15:23:06 +0000
Received: from PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d]) by PUZPR06MB5887.apcprd06.prod.outlook.com
 ([fe80::611c:7f38:af2e:22d%6]) with mapi id 15.20.9094.021; Fri, 12 Sep 2025
 15:23:06 +0000
From: Gary Yang <gary.yang@cixtech.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	cix-kernel-upstream <cix-kernel-upstream@cixtech.com>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject:
 =?gb2312?B?u9i4tDogW3YyIDIvM10gZHQtYmluZGluZ3M6IHBpbmN0cmw6IEFkZCBjaXgs?=
 =?gb2312?Q?sky1-pinctrl?=
Thread-Topic: [v2 2/3] dt-bindings: pinctrl: Add cix,sky1-pinctrl
Thread-Index: AQHcI6twPz7UDZTDi02WkkHM3e7J3LSPmmUAgAAMbPA=
Date: Fri, 12 Sep 2025 15:23:06 +0000
Message-ID:
 <PUZPR06MB5887D3C4EF7861525F174377EF08A@PUZPR06MB5887.apcprd06.prod.outlook.com>
References: <20250912060650.2180691-1-gary.yang@cixtech.com>
 <20250912060650.2180691-3-gary.yang@cixtech.com>
 <175768614788.1334014.18023232974115676473.robh@kernel.org>
In-Reply-To: <175768614788.1334014.18023232974115676473.robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cixtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PUZPR06MB5887:EE_|PUZPR06MB5820:EE_
x-ms-office365-filtering-correlation-id: f2cbc342-6fa8-48ed-de99-08ddf21045d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?gb2312?B?MHpRQzZLRld3azZFaXgvSkpOTFI5SkN1Z2JmU2dVd3ZYK3UrenRSMjRmRTlx?=
 =?gb2312?B?ZnRJQ3J0bnpFWEtaWEFkQTRXUU5TcFhaSEFYYTkzNlkrN3VoRjBSazZXbGhR?=
 =?gb2312?B?TTlWRTVpbW9MZE5iY1hYQ1hIZkk3MzRTTjRGTXF4RUlsWkFvZUoxQm1MUVpG?=
 =?gb2312?B?QUN0Z1k3N2JxMU5BOUpiWmc0VnA3OTFuR1pqSjNobENvVUxjWEJvSXJBQlJJ?=
 =?gb2312?B?c3BFQkppbi81YU9ocmZzMG1QbDZ6VkxPbDFXWHlCODVCSk5sN2tjQUZVQXY0?=
 =?gb2312?B?OE9aZ2NGdVZ1VmhVQWpJS01ZMmJoSkYxb00wU0l3L1hLTDhDRnpOdmI0QVdY?=
 =?gb2312?B?c1RkbWpEaytnUEZlNkQzM0RDRkJmYlZHMkkvS1pmMTA3bWYwcTZ6MUdxSzd5?=
 =?gb2312?B?RlhyZWtma29UYkVzWG1xbU1TUHVXcGRVdUxVdklEd0V1Wm50NDNXb0JNQ0Ey?=
 =?gb2312?B?akl6c29vc2thRGMvRS9McXRxcHRYMnc2Sk84TFB0ajZzQ0s0SUhwUEI3WWZW?=
 =?gb2312?B?WDJFb0JSOWxLU05MMW93dDF3b0FZckdqSENpNEt1ellDOTZ1RkI3RTFqVkpq?=
 =?gb2312?B?VGJyS1pXaWo1NGpVczBMOWFDa1o5TUl1THBqYURlc09kWEZOVW5yU0hBbk5L?=
 =?gb2312?B?VnlPdzlkeVI4ZUt1ZmdHVjRHVGV0U01GUFZwd2hVaWRaZU9vYXlHREtyRlZ4?=
 =?gb2312?B?eXpEcUQ5REtocmFHbDNSUmtwMFRnMnBPenZUajdOZm9WdCt4cUt3Q25kNm9O?=
 =?gb2312?B?Tk5QYm1JNXliVVNueHlFNDJ1QWlkK2xobXFaeGhNcStRV3AwREVXQXVlczhR?=
 =?gb2312?B?Ni9xd1JIRWx6ZkQxT2RKTnZ3eFpTZUZ4TGpiOXp6RTFiTXBtU0R2eEZ2Y3Bw?=
 =?gb2312?B?eVVXcnp3blhyQlYzU1hoM2kxMUdWa3M0MHhDbS85ajBuYk1CT0h1aWZ0UDVn?=
 =?gb2312?B?d2plbWIrWnppVzlITFRhaE5nTzhKeFc1TDhLRWlGTGM1Y0twd1p4YWp1Nkkw?=
 =?gb2312?B?cEZEOS9wNnhJRitQQWMzcldzVDNrbU9kaVhlT0VKbS9za2k2MTF0Ry95V2Uy?=
 =?gb2312?B?anZwaGxLMG5kMEFPMVZ2WWl1d2J1VmFQVm5ITkJISXMzVzNjWXloNG1XTEJy?=
 =?gb2312?B?M2JTNWlXQW5PWmw0VFhHWWxYbjRaRWhvVVJqNE1CV25NeE5jYmRtSW5SekFp?=
 =?gb2312?B?UEVFM2I3TE9VZm1Qb293SitlNHM4V2RqcXd0QklnMHJ6aGMvOXpBUVRocVZV?=
 =?gb2312?B?OXZwZ3p6dCtoRk1zVmROSzBXZnZIMkRmKzBZQm8rQjJVaHFyaHlGMjQyczB2?=
 =?gb2312?B?QjZwMGNXcHRicCtXQTJtSTg5ZGdVSDZqdGErcGUvc2RjRG83aS9YelBuMDQ1?=
 =?gb2312?B?OHJDYnpNWlVZWURwR3ppdTljZUpqVjNxU0dSeFMrSUM3eXhLVHRnNzRUaUNi?=
 =?gb2312?B?b1orMWdHaktNNldTY0xibERpYUxCclFMOTg2TDNrZXVteDdMK1ltZGxnS0Vo?=
 =?gb2312?B?TE9BbHZ5aUFBcWhQa2VCalI2U3JJa2JkbTYyOFU5eGtDa0NMbjM1Rlhvc2tL?=
 =?gb2312?B?TURLTWtkcTFkWTZHaXRKeXl1MC9vYWNFdDZ4RDlLNTUwVDYvSEVGVzhsNzRy?=
 =?gb2312?B?NDJGaEp0aitEOENrVGtXUTN4anJIVXUyV0NZSlJkV3RLbWErRG81T1k1LzNn?=
 =?gb2312?B?ckp6OHFMM1krdmFhYWZrZS9CT2hzV29ZcTRTTWNTNTRnWjFkVUJLK1hPOTl6?=
 =?gb2312?B?TlMwU3ZnQ0JlNnczbVdCamVBY1FINmZ1eUZVeVJmdk1CRUhqa1NJcTVkdkp1?=
 =?gb2312?B?UldLTDhYUW9LL0dSUUZWMnYyMCtrSFZvTVkzVVJrSG1ZZVYvWnJXMFVNS0xE?=
 =?gb2312?B?S09mWVNnbUI5TEs1bENnUUdaQWpPckJnNloxUjczS2tMd0ExRjQ1Z0gxNTR1?=
 =?gb2312?Q?UcSDOELFRx8=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5887.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?gb2312?B?MjM4Nm8yYTFpK25TTmxIMDQ0U2FjYk0yOGdVQjdwZkFXMTBRVXFVMUJVSTdX?=
 =?gb2312?B?NW8vN0MrOWxEbGJNTEVrenRQUlRSSjhFZlFuYnVWWnV5SFFWcldzK2x4eENw?=
 =?gb2312?B?V1ozV2Job0hmeWMzYVZ0ZlNEMGZXdlAwbnVXT0loZTZSeGdhUzJZYy9qMktD?=
 =?gb2312?B?UklyYXJwSktrQ1JlSHpNeWVReGtXTU5WajhROGk0VFk5TVRUQ05rMUdSUU1z?=
 =?gb2312?B?VytzQVNqSHMrWWk0OU5XUTkzVWpNRlVQTW9kVFMrdzVzQUE1T3FhcmNsNVJs?=
 =?gb2312?B?VVRVK3FUeUN0L0YzWHR1WStXSlZCZFYxMk9JV2xPLzN6bzV6RXhvdmVJQ0ta?=
 =?gb2312?B?UWtld1ZwLzVOTHhmNnk0Yno0Vi9VdDNkL0Vsa2g0ZUlBT3NXRktNQko1UnVE?=
 =?gb2312?B?MFBsaUVuYUU2QnBrRU94QU42RU1jdVBrc2xINVNlM3pUTHY2anJhb0xWb0gr?=
 =?gb2312?B?VVNsazVyNnBaYXQzL3JGbVA5cElES3NQc0xiNEpROHY2bS9qcURJWWl4cU9v?=
 =?gb2312?B?VGNLd0hrekhYZ2ROOGw3c08zRkQ1Ty9ydy9CT2plbWJ6WDAzR2loNlMzNmtL?=
 =?gb2312?B?Q3lGVWQ4OG5HTFNBR2VWdVpSNStKcFd6UjhCenI1K2M5RGZHUFBXUGFzSjJp?=
 =?gb2312?B?S1NvZHZFSjNyZHpjVTFvTllLRU0rd3pKMC9wL2hYSnRzUUVrZVVIZ1ZxbkdT?=
 =?gb2312?B?Y2xrR0NlQ1BoRUMvYkZ3bHJwMzkzbTk3WEovRE5weVBjNWJ1ekdzUHZEejRI?=
 =?gb2312?B?dzBoOFBrZlM1RmNWU2hJejYxdXc5V0YvQzVDVUV0NGJ5WEFqSTVqc2JPSkxi?=
 =?gb2312?B?YlhyTVNKQ3FQTXpvaVVqTlRzb3F0MEtUMk1mMmc1enFmeE5HSWxIMDdidEVI?=
 =?gb2312?B?clRERHB3cTFoK3RycmhnNDhSOTR0N1VOR0U0Rmtzc0ZaaVY0Y201RGhNSmFI?=
 =?gb2312?B?T3RiZU00R2RINGtVRGpnOGV6bWRGQ3Z3Zy9WZUdCYi9uRVB4OG90bGs4MTY1?=
 =?gb2312?B?aEx5Nm81WVZTM25jc29ZQlgyTEpBR1YrSUMzUDAzQ05vM0ZldTg5d2RRbkxU?=
 =?gb2312?B?ZWtlUUNFZFJHWFdqQjEwaTlOOVV4ZWtQL2RFNDhJclo5dEt4VW9QcDZ6OHIw?=
 =?gb2312?B?NEMrVXBndS9VWnFsNERucWY4VUpCZUdKdGtmSXN6aFkzTUZLczFFY0hXdThD?=
 =?gb2312?B?ZHpUQXZXcnpmVENTaTlvWktOMFlYOXp1bDB3NWdIdWlTUUNodHVDNW1LRmVP?=
 =?gb2312?B?U3JLRjZrS0JmeUhpUU95cnZqSmZYYlo4V1cxTXdLMUpwT2RVck8zazk0bUFR?=
 =?gb2312?B?OWdIK2JPZGd5SlVmeWdrRFRZcEVlaXAyR1h2YklzYTV4UDRFZkF5MzJ3U0FT?=
 =?gb2312?B?OGJ5NjdIR3dGNklGU3VEWTI5YjNxbzhwa1dwdU1NYWljUlhJaTZlekZFV0Fu?=
 =?gb2312?B?SkpJWG52bjVzM1VkclU3aFdRMmNDMDBoaHlObVZsQ1Rab3dSd04yTVVnMEww?=
 =?gb2312?B?ZjA2eEpyOTNyQVhuRWVNTklWU2pCT0VHdTY4TU1aRFNJRkRjMnUrUGM3clVs?=
 =?gb2312?B?T2RqaVZiMVZ6ckV6ZERNckFjTlQyd0JORmRDb3hkLytKcWVsRGNnYzFSRWZ3?=
 =?gb2312?B?Ym84WDFlVWxBcTBFSkJibWNtdUp3VTFQZDZUV08vR0pNcE12dndMZjRWdG8x?=
 =?gb2312?B?VjFadEFmeHdCVkdmVGVUTjNUbno2NXNkdzlhMG5wV2RwRFkrbUs4OHVGTzZr?=
 =?gb2312?B?WVFoQ0ZrUWpVQkNnZERpVkE2ekJYWWNwUDRDYktlUlU0SU5GOG5GRnBGbE5Y?=
 =?gb2312?B?bTRVTzdEOS8zWk5NMVRteHNpQ0p2d1dRcVEzMUlnYUJScG1uT1EwcWc5NjBS?=
 =?gb2312?B?Y3NrVnhUd3BXRDRmSTlRdGl6WHZYVmRWY3Z0TEF5Z1JFTkpCRmt3UWtpMytv?=
 =?gb2312?B?N1pFdEFXSkJNVTdIc2VZcHZKN0lKYWtjSW53ZTluQVBwUjdTeWlQRnR3SDJj?=
 =?gb2312?B?WUF0eXFlenI1R1NZU2luY25PZzlxb2FsVkZhTTY2cUhBenpmSktqTXB3L3g2?=
 =?gb2312?B?TjJJSG5EL2g1c09wRUVnMDJmZkxMVHV4TXlSVmVicFBPdjlxNFNUNGU5RFJ1?=
 =?gb2312?Q?oInYomrzZrjIr80Mn/sTJcdUj?=
Content-Type: text/plain; charset="gb2312"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f2cbc342-6fa8-48ed-de99-08ddf21045d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Sep 2025 15:23:06.0881
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qH1dBFEx1ieald+vbFsfdvz9lh3AT0Dkt3NRk2cvRJ2CmDJXmc4ctj/pFQR51em6spyEJXaRDJ7txuWO9X07OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5820

SGkgUm9iLA0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudHMNCg0KPiANCj4gT24gRnJpLCAxMiBT
ZXAgMjAyNSAxNDowNjo0OSArMDgwMCwgR2FyeSBZYW5nIHdyb3RlOg0KPiA+IFRoZSBwaW4tY29u
dHJvbGxlciBpcyB1c2VkIHRvIGNvbnRyb2wgdGhlIFNvYyBwaW5zLg0KPiA+IFRoZXJlIGFyZSB0
d28gcGluLWNvbnRyb2xsZXJzIG9uIENpeCBTa3kxIHBsYXRmb3JtLg0KPiA+IE9uZSBpcyB1c2Vk
IHVuZGVyIFMwIHN0YXRlLCB0aGUgb3RoZXIgaXMgdXNlZCB1bmRlcg0KPiA+IFM1IHN0YXRlLg0K
PiA+DQo+ID4gU2lnbmVkLW9mZi1ieTogR2FyeSBZYW5nIDxnYXJ5LnlhbmdAY2l4dGVjaC5jb20+
DQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9waW5jdHJsL2NpeCxza3kxLXBpbmN0cmwueWFt
bCAgICB8IDg1ICsrKysrKysrKysrKysrKysrKysNCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDg1IGlu
c2VydGlvbnMoKykNCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0DQo+ID4gRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3BpbmN0cmwvY2l4LHNreTEtcGluY3RybC55YW1sDQo+ID4NCj4g
DQo+IE15IGJvdCBmb3VuZCBlcnJvcnMgcnVubmluZyAnbWFrZSBkdF9iaW5kaW5nX2NoZWNrJyBv
biB5b3VyIHBhdGNoOg0KPiANCj4geWFtbGxpbnQgd2FybmluZ3MvZXJyb3JzOg0KPiANCj4gZHRz
Y2hlbWEvZHRjIHdhcm5pbmdzL2Vycm9yczoNCj4gL2J1aWxkcy9yb2JoZXJyaW5nL2R0LXJldmll
dy1jaS9saW51eC9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGkNCj4gbmN0cmwv
Y2l4LHNreTEtcGluY3RybC5leGFtcGxlLmR0Yjogd2lmaS12YmF0LWdwaW8tcGluczogcGlucy13
aWZpLXZiYXQtZ3BpbzoNCj4geydwaW5tdXgnOiBbMjgxNl0sICdiaWFzLXB1bGwtdXAnOiBUcnVl
LCAnZHJpdmUtc3RyZW5ndGgnOiA0fSBpcyBub3Qgb2YgdHlwZSAnYXJyYXknDQo+ICAgICAgICAg
ZnJvbSBzY2hlbWEgJGlkOg0KPiBodHRwOi8vZGV2aWNldHJlZS5vcmcvc2NoZW1hcy9ncGlvL2dw
aW8tY29uc3VtZXIueWFtbCMNCj4gDQo+IGRvYyByZWZlcmVuY2UgZXJyb3JzIChtYWtlIHJlZmNo
ZWNrZG9jcyk6DQo+IA0KPiBTZWUNCj4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2RldmljZXRyZWUtYmluZGluZ3MvcGF0Y2gvMjAyNTA5MTIwNg0KPiAwNjUwLjIxODA2OTEt
My1nYXJ5LnlhbmdAY2l4dGVjaC5jb20NCj4gDQo+IFRoZSBiYXNlIGZvciB0aGUgc2VyaWVzIGlz
IGdlbmVyYWxseSB0aGUgbGF0ZXN0IHJjMS4gQSBkaWZmZXJlbnQgZGVwZW5kZW5jeQ0KPiBzaG91
bGQgYmUgbm90ZWQgaW4gKnRoaXMqIHBhdGNoLg0KPiANCj4gSWYgeW91IGFscmVhZHkgcmFuICdt
YWtlIGR0X2JpbmRpbmdfY2hlY2snIGFuZCBkaWRuJ3Qgc2VlIHRoZSBhYm92ZSBlcnJvcihzKSwN
Cj4gdGhlbiBtYWtlIHN1cmUgJ3lhbWxsaW50JyBpcyBpbnN0YWxsZWQgYW5kIGR0LXNjaGVtYSBp
cyB1cCB0bw0KPiBkYXRlOg0KPiANCj4gcGlwMyBpbnN0YWxsIGR0c2NoZW1hIC0tdXBncmFkZQ0K
PiANCj4gUGxlYXNlIGNoZWNrIGFuZCByZS1zdWJtaXQgYWZ0ZXIgcnVubmluZyB0aGUgYWJvdmUg
Y29tbWFuZCB5b3Vyc2VsZi4gTm90ZQ0KPiB0aGF0IERUX1NDSEVNQV9GSUxFUyBjYW4gYmUgc2V0
IHRvIHlvdXIgc2NoZW1hIGZpbGUgdG8gc3BlZWQgdXAgY2hlY2tpbmcNCj4geW91ciBzY2hlbWEu
IEhvd2V2ZXIsIGl0IG11c3QgYmUgdW5zZXQgdG8gdGVzdCBhbGwgZXhhbXBsZXMgd2l0aCB5b3Vy
IHNjaGVtYS4NCg0KQXMgd2Uga25vdywgbXVzdCBleGVjdXRlIHRocmVlIGNvbW1hbmRzIGJlZm9y
ZSBzdWJtaXQgcGF0Y2hlczoNCjEpIG1ha2UgTz0kT1VUS05MIGR0X2JpbmRpbmdfY2hlY2sgRFRf
U0NIRU1BX0ZJTEVTPXBpbmN0cmwvY2l4LHNreTEtcGluY3RybC55YW1sDQoyKSBtYWtlIENIRUNL
X0RUQlM9eSBXPTEgY2l4L3NreTEtb3Jpb24tbzYuZHRiDQozKSAuL3NjcmlwdHMvY2hlY2twYXRj
aC5wbCAwMDAqLnBhdGNoDQpXZSBkb24ndCBzdWJtaXQgYW55IHBhdGNoIHVudGlsIG5vIGVycm9y
IG9yIHVuZXhwZWN0ZWQgd2FybmluZyB3aGVuIGV4ZWN1dGUgdGhyZWUgY29tbWFuZHMgYWJvdmUu
DQoNCkFzIHlvdXIgc3VnZ2VzdGlvbiwgZXhlY3V0ZSBmaXJzdCBjb21tYW5kIGFnYWluIGFmdGVy
IHVwZ3JhZGUgZHRzY2hlbWEuIEJ1dCBJIGRvbid0IHNlZSBhbnkgZXJyb3IuDQpTZWUgbW9yZSBk
ZXRhaWxzIGFzIGZvbGxvd2luZzoNCmdhcnlAZ2FyeS1TeXN0ZW0tUHJvZHVjdC1OYW1lOn4vd29y
a3NwYWNlL3Vwc3RyZWFtL2tlcm5lbF91cHN0cmVhbSQgbWFrZSBPPSRPVVRLTkwgZHRfYmluZGlu
Z19jaGVjayBEVF9TQ0hFTUFfRklMRVM9cGluY3RybC9jaXgsc2t5MS1waW5jdHJsLnlhbWwNCiAg
U0NIRU1BICBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcHJvY2Vzc2VkLXNjaGVt
YS5qc29uDQogIENIS0RUICAgLi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MNCiAg
TElOVCAgICAuL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncw0KICBEVEVYICAgIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2NpeCxza3kxLXBpbmN0cmwu
ZXhhbXBsZS5kdHMNCiAgRFRDIFtDXSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
cGluY3RybC9jaXgsc2t5MS1waW5jdHJsLmV4YW1wbGUuZHRiDQoNCklmIEkgbWlzdW5kZXJzdGFu
ZCBvciBtaXNzIGFueSBpbmZvcm1hdGlvbiwgcGxlYXNlIGtpbmRseSByZW1pbmQgbWUuIA0KVGhh
bmtzDQoNCkJlc3Qgd2lzaGVzDQpHYXJ5DQoNCg==

