Return-Path: <linux-gpio+bounces-8579-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6774E9477D2
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 11:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82BEE1C216A6
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Aug 2024 09:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E207715443F;
	Mon,  5 Aug 2024 08:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Ox3Yus4E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2052.outbound.protection.outlook.com [40.107.237.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9F414830D;
	Mon,  5 Aug 2024 08:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722848339; cv=fail; b=ILHTJRgjzHZtFWLdERRNAIra5fl/vpqEO9ffDzxdEI7AJEUeZU6ubawkdHoqvWabp3sWt+LhMOKynHAmeFiig0mOKA10+hC+gkd+rcoExGytVWz15RhKSaOQpALNbMKQHSyhZCkVfInf7u1cAr/luDBkKxZcRK0sv2ElSWWuJ4U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722848339; c=relaxed/simple;
	bh=ztypBoPkIZAB7ZjWVKeWCvwxgb23I06QHzXEPvopzv0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=guTjrGqH8vS9EoWOMZc11MDbFyudOUxP5CY/lb32Yna051MuTAD7x8IsvbMvijVJmBnX9Iuw0vY1hKUufQjYwE+sCmV7q7mhSAXCkup9adeWRjW1CfmONVJMvCaKZSzvk67s+7fhL/JyJdILY8JJX5McZ5gYv1VCt9DqV/uL2Hw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Ox3Yus4E; arc=fail smtp.client-ip=40.107.237.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jgeG8MHQOpp+3mFekUDxx3vmrSscpZEZZ9hQ79no0fAej/Cu/d8q4cybs63X7nBT+6a02xp4DBnDHC41rYepgNNAq9+G5dQpUZhRkqKX7kjVSefEBBKWGohGFpcOoWcEIi8m0bmSDblulnksnOAjktRTflGGutlVByvPOv0S6BVO7fWO3bei99WOwqy2LL6F5L4qhv2vfouiP2tyL9MMB71vKzghBXQt9M7RU8GCCVwWlaso1S6qNydlb70h7H+BQkOtSu68RFJQnj8IGhsNMvrOurGpP/NVx0W01Pd1JEgdeQEsP0UZjefbkRKDVYUQzIxGj5Hwxy2HKbkb/FmvDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ztypBoPkIZAB7ZjWVKeWCvwxgb23I06QHzXEPvopzv0=;
 b=Q/kpuhba1qWlqn4kMTVgTurcXffU9zkgbURK5pbI01Aq8w7IK/1aSIyuDSq5CsX1fXKwhMox1FMDbs9RVa4VoyjEznlEH4bjTwbCo6PF4Ax4skgfWIq2poc81NM2WRRdU8hDt1Hw6gQFE2K5jFlSPspn2EPNj+q6lLlIFFuLk9d/aeR0LaDd48Z67HxnPDHM0qP7U56J/MyotQLlIUyz0oGOHQGK/BgiNLdiz1hq2T33bYiwomOogabC9XIYFHHeqYTo2eiUB7OZEIER7kgXDNpaeuc3d9dxdwwZIp4x/BzoVL2qz+NTJ/0RjrRAoqB+1bZY682rO6hZzCyjulGnDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ztypBoPkIZAB7ZjWVKeWCvwxgb23I06QHzXEPvopzv0=;
 b=Ox3Yus4EbiDhc9o5VK8QoTUETOyEPIPwu8tOlFJ3AVPefrSpX8ZFlSh11A0cvNX5tHBHNmA9HovT/zNJrr/HlbKDzQE8BlBk4plTsBrhSwFQTIqanhHPhFQDBDUsmTFbbjJbyfPHkDUeJyMlBTQdoFU9JX5ww/bTv9JyjFETVDc=
Received: from CH2PR12MB4264.namprd12.prod.outlook.com (2603:10b6:610:a4::15)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.26; Mon, 5 Aug
 2024 08:58:54 +0000
Received: from CH2PR12MB4264.namprd12.prod.outlook.com
 ([fe80::934b:f664:a66b:d637]) by CH2PR12MB4264.namprd12.prod.outlook.com
 ([fe80::934b:f664:a66b:d637%4]) with mapi id 15.20.7828.023; Mon, 5 Aug 2024
 08:58:53 +0000
From: "Potthuri, Sai Krishna" <sai.krishna.potthuri@amd.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, "Simek, Michal" <michal.simek@amd.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	"Buddhabhatti, Jay" <jay.buddhabhatti@amd.com>, "Kundanala, Praveen Teja"
	<praveen.teja.kundanala@amd.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "saikrishna12468@gmail.com"
	<saikrishna12468@gmail.com>, "git (AMD-Xilinx)" <git@amd.com>
Subject: RE: [PATCH v3 0/3] pinctrl: pinctrl-zynqmp: Add Versal platform
 support
Thread-Topic: [PATCH v3 0/3] pinctrl: pinctrl-zynqmp: Add Versal platform
 support
Thread-Index: AQHa5Ap1fozp0WvlrkGM+mGt/pJ7rbIXMwKAgAEsiaA=
Date: Mon, 5 Aug 2024 08:58:53 +0000
Message-ID:
 <CH2PR12MB426446B0084EEE56C13DA6ECDBBE2@CH2PR12MB4264.namprd12.prod.outlook.com>
References: <20240801120029.1807180-1-sai.krishna.potthuri@amd.com>
 <bf1faea5-bc1e-46df-bf68-c222570c09a2@linaro.org>
In-Reply-To: <bf1faea5-bc1e-46df-bf68-c222570c09a2@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4264:EE_|CY8PR12MB7585:EE_
x-ms-office365-filtering-correlation-id: c09e94ba-f890-40db-47e6-08dcb52cd4e2
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|7416014|376014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?OHlxVTYwVUJKR0VQME1aV2ZBM1cxOGdoS2QrVmdsMWRoMUQxeTkrc3lhL05v?=
 =?utf-8?B?U1A2T1hvWXVGUFJmWDMzL3owR2dGZXU1cldUeFB5ZzFhaWZuQU9GNXVUYzJr?=
 =?utf-8?B?TUsvQXlqVmJwL1lVcTdrMW1Wa0dHRWdvQU52LzBrMDN5UWgxVHYvRGI5NEkw?=
 =?utf-8?B?SUZsSFhvenozSWtwaVRiYWNON0NrVVI1cm90VTl0SkJWTU9EajFvQjAvR0E5?=
 =?utf-8?B?MUdZZ2h6cTgxdDJ5Nm1COWMxaXBSQ08wOG0xUncvYm9JV3NMVU9jbkd3UE54?=
 =?utf-8?B?VWhSektFTVJoRS85ZkZPcTZTRjJxMmtnWUpPNjE1WjgyTlJyNkY4MS81LzVl?=
 =?utf-8?B?Qk1HT2JqZU9GckFxNmRrVFZWbHRxOHhvQXlFNzFPVG55ZFQ3aFlYOUhBUnlh?=
 =?utf-8?B?ZGVOQjF0RnFSRFpwb2xrMjBLUW9uWDRRd0VzUEh5enlUU0hML3VudXJ0RkQw?=
 =?utf-8?B?N1ZWTEtGUVZvSlVpQk9qNHg3SklqWFYyaXM0b29wcmFNVU9GWmZiSWNIM2V4?=
 =?utf-8?B?bUM2YUFyRXNVSElqZFFiVUd3djlLM1BvcW9TdW11WkhkdnZrMGZ4SWVJejd1?=
 =?utf-8?B?R0JIdzZQOE9hd1NYOGhac0VmRTRkL0U1YnlQTU5VUDUxaHp6RnNWYUZCWjVG?=
 =?utf-8?B?aWxuQTRMYll2NlpFU1poQzRnaUVMbElUU0QwRmd3bTRRWHIwamF6QWYvQjFC?=
 =?utf-8?B?VXV0bFF1L05KWHRrdXBsc2haZ2YwZ0VBV3hZT2E0UVFEZE5sNXY5UnJ1Mjk5?=
 =?utf-8?B?VjZ4d2RBWFZmRVFxZlRoOHF5b09Dc1QrTmFIeWJPQ25ReXUvVEt6NlZhYzRz?=
 =?utf-8?B?MFFPUUFUL0F2bW5JWjhxUG5GZ0k2ZFF2dDI4YXAxcHEzS2prRFpmQUlXTERO?=
 =?utf-8?B?SVlGcGFNNWl6eDI4TEozYWxoMVBRS3JVRkFCZFEya2todHZoaTdweUkzRHNu?=
 =?utf-8?B?RXNCZEVnOWxLVzl3K0tSMmpmMVZZZ3JEejh1UDkwdCtNWEQzOEczeXJXNFpD?=
 =?utf-8?B?dW5ia1NQOHBzdWl6S29GbVc5ZDV4RUdWMmg5cm11Vm9FWVFIdXJ6ZTRVdXNV?=
 =?utf-8?B?ZE41ZHpVZUZENW0vaHE3eEUzQXBGUExSdDNPUnFWRDBIa2pKNDB0RjRSWmtv?=
 =?utf-8?B?YkxnYXMrcEp6VmVvWnM0WTRremRrM0ZKcUZRcS8rb1Q0dEErUVFaNEo0N2V0?=
 =?utf-8?B?NmNrMmJFVlJVYlJXN3laVWxtOGZLTi9ndHd2SnlSQ3FtT2VxTzFPYVdWb0c4?=
 =?utf-8?B?d2lhUkF1eWcvZ0RZQjI2Qk11ZHlrOGZndUZjT3k0a2tuT3dVZnBiZS9FWkxk?=
 =?utf-8?B?Zm1EWXh5bTZwQy93Q2lTRUM5b3VZSUFMRjFPY1FOMnMyVGRWUGd3U3NQdWxD?=
 =?utf-8?B?R3F3cFpWSXYwT1VycjBwMGpqNU5lTFhyK1E5clVLbTdwcm5vMkRqWDRFbEpU?=
 =?utf-8?B?WDJHY3ovaEpHRjU5SFBEeUtJRE9meUFVU3B1d3haK2pXMnBlUnpJQjE3dW9s?=
 =?utf-8?B?N3l0RGlIRndEQzlmc2Fub04zczloYU9QUnRvNHRLOFZWSyt3K0I3MHR3VVlM?=
 =?utf-8?B?VGk0N2lwREpOV1VHQTBWUnl5Y25QRnhSRWpHL2U1ZWhiUWZZc2xLUjhBRUlS?=
 =?utf-8?B?eW1sZ2MxRmVVRlN3a1JXODV5M004NXYwSy9kTEtiU29HUUJOdktIMXJDa1I4?=
 =?utf-8?B?blk4Ty83UEhMRGRKQ1FPZnBleWxnbmNQUWc3Ym96VnJ3NGZ6UU9jQnBYcENE?=
 =?utf-8?B?VEVIZU5qUkpnYVJjZkpDa0k5U3RTYVRsampSQndwY0M1SEFySGUyWXAvdktl?=
 =?utf-8?B?KzNTeStOTlA5YlBUSkpVdHBjU2E0RHFGQTVDUWlycExyaTVJQmZBeXFWVkVQ?=
 =?utf-8?B?MXIyMktCTmF3dDZHOEdDeFAzRDhXL0xzd1c0Tk5QRTByUUVHODJjQVBxSzA1?=
 =?utf-8?Q?98dJqoKJctU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4264.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VjdDOW5PRUdhYlp4bE85RDYxM1JzSDVWZnBsSGNWNk83VzB1ZjUvOXRLbkhl?=
 =?utf-8?B?a0FBdTJ5VkkxS3Q4T3R6TlA2aisySkFhSFZoNnBMcURXRVUwNlBWcWdDT1Bm?=
 =?utf-8?B?NEJOWm1KK0ZZZUwyRVExYXVxZlVPRVNGd3E2NVFvNDluTE9XcjgvWDgrQ3hs?=
 =?utf-8?B?bnVENld3ZHUya0k5NC90YVJLbkxPNWFBMTFmVGpLVkVxeXFSNGRPYitWbStq?=
 =?utf-8?B?WG10cEpIUDcxbnVSZ2hZbUk2YU4vRGtkRGpFeCs1bXFyTEhHd243WUl2cXEr?=
 =?utf-8?B?L0VZOWY3MUd3WnRVQU5jdDBCbW40NkdCVFJaUlhwM3FMb1ZaR3BjdmZZbWpv?=
 =?utf-8?B?QnFaMkF6S09OMlQybWtHMXF0d1RjenM4RUhoODlBZGZSbnVaZkZXbUVLUFJW?=
 =?utf-8?B?T2RSd1liSHJvY0p5aHVqTUMySzZ0Z0JMcnBNZ1kwaXdqQnhtM0FyZ05RRHdm?=
 =?utf-8?B?NFpTT1M3RC9UVklTeXpmN0daaEcxNWtyWWw3RjNVRVM0SmY4a3hwNW9haXFP?=
 =?utf-8?B?bHJBSUE5Y3VxdDRGUVhxNzJEYllVMnVCOGFPeXZ5c1lleVFydG5uTEFPWEdY?=
 =?utf-8?B?QllNTStkelZEUFRhUVRJd1BTZmxBZnp0bkNFbC9jRWh6NWQvMCt5UTdjeDB2?=
 =?utf-8?B?d3IwMjNxYkg3T3dSbEI5emhFQUtQUGpzbGVLaHI3emRIR0ZRNHl1amY0T254?=
 =?utf-8?B?SXoyTlFrQ0xMaWxrVmNUMUNIS1dMVFlWMlVDcVNhUzZUamN5a0s3RDRpQ3du?=
 =?utf-8?B?aVAyUE1BVWVNdUxLbkxwVkp1MFVobnpuUlJhWWhrVzgzaUQwK2pUK1h2UWNJ?=
 =?utf-8?B?UWF0dFNKb2loOHFSMnNDUko1aEg4TjhCaVZ6QWtKSjlNUGp4OVhXWDRBcWJH?=
 =?utf-8?B?WFNaSERwZkN5RHJPNUxRVGFCU1RkK0NkVHY3dHJ1ZFluTTZPbDJ0UGx0ekFD?=
 =?utf-8?B?bWNwVkVkTXhqRGpqU3pLa0dyeW9DZHI4U0ZhL1RCN3FUQWxtU1Q5bmdCMk9M?=
 =?utf-8?B?eDNKMDl4ZTNNenc5a0pvaG5DMmluUm5zQWtWMFVHTFA1ZitkMCthcERoTmZp?=
 =?utf-8?B?eTRKZWMxMmJlMlV4b2dPQkNsTXBzVlI5K0RJRkZwNUZLU2lEc2Q5MFdmdmdJ?=
 =?utf-8?B?WnRxRkhwSXBNSnl5UDEvc1RiMEptZjltSnh0Z1I4MklLU01iMmd4Wngva1hO?=
 =?utf-8?B?T1A5WnJjajBtWGZwSnUwSGw5bXVWUlFRczRPSm1OMGxPMERvZjNiK3ltTVdS?=
 =?utf-8?B?WjhaZkVpblZtWTJLMWlCcC9pK0lyZU9vc1oyZ2piQ2p6RG0zNkY1RTZ1b1Fr?=
 =?utf-8?B?U1k2bFE0YWMvV29ocjUrZVBUbE9QUGp0SUk2UWtEQjRlNUh3RVNSeEllc3lK?=
 =?utf-8?B?Yjg5dlRFSkphVUV6ZlpkRTNuM1FibG1PTThjR2MyOWVabVJJUEwrMDZORFJP?=
 =?utf-8?B?bnVxay9EcVhVYmdUWTJJblo1OTZrMWQ0M0FEcWJyOXFGUFZvSi9XbWl1Q3Vz?=
 =?utf-8?B?WFVjcDAyV3RzejBMenNXQ1BTNHFFV2txWXl2dlNORnBiVVVzUVdIMVJzR0xn?=
 =?utf-8?B?ZXMxMTRndDVJclcxYVpWbUlNcW9hZ2xlL1kvTkFubmN5VE9HSXpLRTQ0RlZS?=
 =?utf-8?B?T24xTkxRZTlnMU1CZ2QzcDhWUXlKblpOVHo0WUQzMHN6ZGpmOENHTUw5aEdY?=
 =?utf-8?B?aWJONnBSZmFBYkIxdy83RXJXRGMxdytwL0xkS1NxWSs4NThpaEZwNUtHalZv?=
 =?utf-8?B?dmlBVTdFeWE2andCV2ZQK0VBZ2NPMTRVYXUwelhsRHAwTlNWNEhxamM4UzBT?=
 =?utf-8?B?TWwrV05XVjMvVThUNGRJSEw3RFhiSnFiVFo5cmp2TlRMNmlVR21QTWlMYzBU?=
 =?utf-8?B?R2lNREoxVEEwNmgrTG92dE5Kam9sSGJYZFhySCtXUU5zQjcwWlZiR1VFRGZu?=
 =?utf-8?B?cGVmM3huWlRzb1V4enI1VWU3Q1Ywc0hQOStJL1dadC9YaFhCNG1KZkJrM0hO?=
 =?utf-8?B?N21IbzVPRlE0RVQ0THBYcnFKK2tOdUZoczc5TTRoTmRtaFNWQWM1NDRaeFR6?=
 =?utf-8?B?dytIMVd6dCtZOHBaRlZ4YzFmbEJId0RkQVlad0laenJvYXJUTTI1ZjdaU1Ja?=
 =?utf-8?Q?2St8=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4264.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c09e94ba-f890-40db-47e6-08dcb52cd4e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Aug 2024 08:58:53.4156
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: o89yCYxab8WP4hyoVVOSLj8m0EVPrYGyMKXjbn6+ynEwXmGHm6kZ3Cv/F2vzfl9ZFWheUXXWuaFtxrM5Isz+Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585

SGkgS3J6eXN6dG9mLA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IEty
enlzenRvZiBLb3psb3dza2kgPGtyenlzenRvZi5rb3psb3dza2lAbGluYXJvLm9yZz4NCj4gU2Vu
dDogU3VuZGF5LCBBdWd1c3QgNCwgMjAyNCA4OjIwIFBNDQo+IFRvOiBQb3R0aHVyaSwgU2FpIEty
aXNobmEgPHNhaS5rcmlzaG5hLnBvdHRodXJpQGFtZC5jb20+OyBMaW51cyBXYWxsZWlqDQo+IDxs
aW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBTaW1laywgTWljaGFsIDxtaWNoYWwuc2ltZWtAYW1k
LmNvbT47IFJvYg0KPiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5lbC5vcmc+OyBLcnp5c3p0b2YgS296
bG93c2tpDQo+IDxrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc+OyBDb25vciBEb29s
ZXkgPGNvbm9yK2R0QGtlcm5lbC5vcmc+Ow0KPiBCdWRkaGFiaGF0dGksIEpheSA8amF5LmJ1ZGRo
YWJoYXR0aUBhbWQuY29tPjsgS3VuZGFuYWxhLCBQcmF2ZWVuIFRlamENCj4gPHByYXZlZW4udGVq
YS5rdW5kYW5hbGFAYW1kLmNvbT47IEdyZWcgS3JvYWgtSGFydG1hbg0KPiA8Z3JlZ2toQGxpbnV4
Zm91bmRhdGlvbi5vcmc+DQo+IENjOiBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5v
cmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7DQo+IGxpbnV4LWdwaW9Admdlci5rZXJu
ZWwub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsNCj4gc2Fpa3Jpc2huYTEyNDY4QGdt
YWlsLmNvbTsgZ2l0IChBTUQtWGlsaW54KSA8Z2l0QGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjMgMC8zXSBwaW5jdHJsOiBwaW5jdHJsLXp5bnFtcDogQWRkIFZlcnNhbCBwbGF0Zm9y
bQ0KPiBzdXBwb3J0DQo+IA0KPiBPbiAwMS8wOC8yMDI0IDE0OjAwLCBTYWkgS3Jpc2huYSBQb3R0
aHVyaSB3cm90ZToNCj4gPiBVcGRhdGUgdGhlIGJpbmRpbmcgYW5kIHBpbmN0cmwtenlucW1wIGRy
aXZlciB0byBhZGQgVmVyc2FsIHBsYXRmb3JtDQo+ID4gc3VwcG9ydC4NCj4gPiBBZGQgR2V0IEF0
dHJpYnV0ZSBJRCBpbiB0aGUgWGlsaW54IGZpcm13YXJlIGRyaXZlciB0byBnZXQgdGhlIHBpbg0K
PiA+IGluZm9ybWF0aW9uIGZyb20gWGlsaW54IFBsYXRmb3JtIE1hbmFnZW1lbnQgRmlybXdhcmUu
DQo+IA0KPiBBbnkgcGFydGljdWxhciByZWFzb24gd2h5IHlvdSBhcmUgZGV2ZWxvcGluZyBwYXRj
aGVzIG9uIHNvbWUgcXVpdGUgb2xkDQo+IGtlcm5lbD8NCkkgY3JlYXRlZCB0aGlzIHBhdGNoIHNl
cmllcyBvbiB0b3Agb2YgbGF0ZXN0IFBpbiBjb250cm9sIHN1YnN5c3RlbSB0cmVlKExpbnVzIFdh
bGxlaWopLA0KJ2Zvci1uZXh0JyBicmFuY2guDQoNClJlZ2FyZHMNClNhaSBLcmlzaG5hDQo=

