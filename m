Return-Path: <linux-gpio+bounces-8112-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0B292B397
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 11:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D4181F22711
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 09:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33E5E154BE8;
	Tue,  9 Jul 2024 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="hVjuuzlQ";
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="oeEqTTH5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0511A154434;
	Tue,  9 Jul 2024 09:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=68.232.154.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720516880; cv=fail; b=V0AEx9hOs+hfC4k0JmLKpmOfLSsfB27qe8Gn/yqyXlCnUg6pYaEEZEwFNb9p3aRwOcfyWUAfV1G8CATb2tUCJvVDW5r7//INT1iWuLcNpP8VSlQJyLBWjaWPvBk/3Dnt/gx6VpjbozLS1YEehAhJ3uddCnob58LL+5JJha4m2rs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720516880; c=relaxed/simple;
	bh=BP24HSMqhVoHieXe4Tcd6HH/K2bPoHbn3594hXFPMfY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nodd0XQfTewwWRA4IKUsji1Od9k7Mn4QiNyBDt0x0B/bJIEl8CMfmAFHJx8NL2fTKewUC+m3txhmzLv5PMWAdtISmom3oXCEwGTGOM4L+xHAj1qOPM0dC1OXoZU1fpgKS/IwjKgD7PmJZdsiyYmHESIJc5ZGz8W5W2ZNYtpvc6U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=hVjuuzlQ; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=oeEqTTH5; arc=fail smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1720516878; x=1752052878;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=BP24HSMqhVoHieXe4Tcd6HH/K2bPoHbn3594hXFPMfY=;
  b=hVjuuzlQ74jgU9hrJvPWAOcmqGYkBSzmtq2IgLbr7fS07IceHNEJ87Ll
   OJe07GbZq9WKZ9ZbPrThPg3mx1kTyfU8LjYF7bwmhvd3d8buDzUMUQK9o
   +UPfClB9KbFubYxP4I7LCva7gX19NBKMgYhK+Xo9Bch4XHXG9sYbCBe5X
   b72wXJBumaOXY5pc4tzxzmBFbGDHAzGDtOI2ItMUFEdn4rzVGJCPAQYHS
   vKbWOrLjzDzbXSGjTyqCKsuxWLI3pKjuxzHGq2ngAY61aIQIDrPwgkEVH
   aHUS/ZqlXflwaFWSz3s166dODDze+syr+1ni/H8diD738dG8Fwb+YWm9B
   Q==;
X-CSE-ConnectionGUID: JT6QY741RjiXiHEHYax2/Q==
X-CSE-MsgGUID: AMLy9pzdR4mhBfcUBw1JUg==
X-IronPort-AV: E=Sophos;i="6.09,194,1716274800"; 
   d="scan'208";a="196398303"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Jul 2024 02:21:16 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 9 Jul 2024 02:21:06 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 9 Jul 2024 02:21:06 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eidPFcwfXXnCf/h09OlexWTZAzs4jG04SWZvHNM4LEtvLtusAPC3VS3vVivvltJbZ/mNxiOVjHF0W7BW2KbbMQ8EijfrkARf4h7VbZsRa7OB7zfpl6kE/DWdtsuMC5JN0NPsPqYjRkLhXaNqYICftF3Juojs4VtZvQEjM5T1ruVHcugtw+LkPbj+TTylhGZaiZlOmSLCApG6oOE8sM4k+oi++/tgNJxik0ZMohYzsNp5Qob0kOjPvRPtPTtQLf93qRs8C16Kti5rdwgMhJXnEC/c2JxsOO8FjfX/iIXB2C0bBIc7dR3X+4bC2ZP4BWuhTjU31v2i9Z0RcTnFrewqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BP24HSMqhVoHieXe4Tcd6HH/K2bPoHbn3594hXFPMfY=;
 b=LRdTn6vO8kACH+QE5iNov2VdI/HZzjLGuEf3xma9iiI6LGy2flRhmsEh3hiVB+k5bMWx1VrUM5OGSPuYlxha9AMduJgxztCCHRTAqxzS8uFoYJjL8OMljUf6/8XgR/hqtg+AZBoIpwTADVPTp1VuJjT5Dv6s/qrTbYIDGsRWE6UoivFbxJcA6XE+B49z5rmplMwrSgnU713YlDZzxa0wABGOBxO67iu2KzaLLlhdnQkVRohjjl4mpuJpp4maWojQizI105eK3nRXktEcuCGcQhwl00DHyg0/TUofHPsdrD5I/+OobN9LQL6G4zCx66p/OHleuD06SspdF7HrqRr9dQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BP24HSMqhVoHieXe4Tcd6HH/K2bPoHbn3594hXFPMfY=;
 b=oeEqTTH5ViWinCRTNLLCbRbQVhfpKhbkSbbbn9ZkI0UJkFpoAqAqRa/vJPYEaGM0f04J7vhLlYqrzTlnaoa+ZfL1v1Rww/omHv95qFUdUN4jCwNMnK0Li1GGMARuuhsXPUXeElJsekosY+/dIciswF9RBikMBegjRJB6VSRr82Ig9O+Lc4rQgm839LiYR7/6HSuzrZhL0zSHjItFU8iNuAl+7kiWzcukvvm6M6pu51js/QZl+BmBpmxVZfgnonrjrzBimCwmDfx9//WrzwnwISChLlDD2Uk2877v/wvK0+cgGMpoSGAZ1HNcshD/A6VhInGc7Lhe8jEArrqzx/CgyQ==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by PH0PR11MB5143.namprd11.prod.outlook.com (2603:10b6:510:3f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 09:21:02 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7741.033; Tue, 9 Jul 2024
 09:21:02 +0000
From: <Manikandan.M@microchip.com>
To: <robh@kernel.org>
CC: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <krzk+dt@kernel.org>,
	<conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>,
	<Durai.ManickamKR@microchip.com>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl
 to json-schema
Thread-Topic: [PATCH v2 5/5] dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl
 to json-schema
Thread-Index: AQHaxrlNcR9Mu0do00GmqcpH4sULQLHiAlGAgAwy3AA=
Date: Tue, 9 Jul 2024 09:21:02 +0000
Message-ID: <b30d21fe-dd49-451d-96c9-a354f6dfcc7d@microchip.com>
References: <20240625043525.279711-1-manikandan.m@microchip.com>
 <20240625043525.279711-6-manikandan.m@microchip.com>
 <20240701150351.GA4051458-robh@kernel.org>
In-Reply-To: <20240701150351.GA4051458-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|PH0PR11MB5143:EE_
x-ms-office365-filtering-correlation-id: 8f5dbabd-810b-49a4-22e8-08dc9ff873a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|7416014|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QzZEdnBaKzBWQmpnb0xCMnNuVUtjQjVJR3o3QTJBYXJncDBXVVdlSTVwbHFp?=
 =?utf-8?B?bVBFajg0UFBRM29DSmpsdmRDTFEvdVdqRUFEenpQT2FIeVZ2Ti9ITExaUWZS?=
 =?utf-8?B?eHhuOXJ0NDB3elR1UHl4SGNJbHZJYXZsanVwYThOWUY1L25CbllldktMWFNx?=
 =?utf-8?B?S0NldW1RVEpVUm5mTnQxSndJNVRKYmFvT29CTGc2YnpZeEdlczZvaDRueUIy?=
 =?utf-8?B?SEs2RVBwYWNTNmJWdWZwODZNR3N5SUlhcGxOM1lEZVdHa2YwaWpEVWp0SlE2?=
 =?utf-8?B?QWZ4Nk0vdGhGWDV6cDh0ZHdZUFFXMHQ5TFdyS0NHQ1RkN1pRcEcxUXBBeUMz?=
 =?utf-8?B?MXJsSjgvQVNFYVBkb0UvTjREMDdrbis5WlJRQmNhR0Z1OTI0OXY2dG10anN6?=
 =?utf-8?B?YWMvcldFLy81dVFuZHAzL0QrcmJkYnNpYWh0SWpuaEp1LzFzY3pNV0htdGlt?=
 =?utf-8?B?Mmd5Njl0bkpiZ1JUQ3VxOGJqRHI0eDBmRVBOMDNtRU1PclJaU25zYjZMUFFH?=
 =?utf-8?B?N0p6OGlWamcwZWRJSThkTjc4NEx1SlovalpscFhwRWN0Y29PTUVuMVBIaC9C?=
 =?utf-8?B?RitreERGYkhJTmg3R1BQcUxXY1Boa3R3b1h0UEN0Ty9NcklnTkZIc0NlSUc2?=
 =?utf-8?B?VjVTeDVwUDZ0Y2Rmd0RGR1U1c1N4eWdKRzF2Y1V4dVpkRmc0QTZRTDYxYytp?=
 =?utf-8?B?cUFrKzYzZC9qMVJNSXAzeXdTY013WnJNdTBjcXFzQllYSjArVW4xOG1SczdT?=
 =?utf-8?B?SHYzWGpSRWJPWitKMWJoc2FpbmsvdHdOZFV0T1VoeXhRR0QyUmdRWGZxQmda?=
 =?utf-8?B?Um5OOU14cDVwaFRZUVpGR3FMMEd3aDdpcWFNOXBwMWVzeXQyUWtPdzFXd3Rh?=
 =?utf-8?B?SUtUMmg0QVNRcEZOb1J2djRTd00ybzJlQXFXdENoZjA2WEM0dUM4SkN5cnRv?=
 =?utf-8?B?OFhoMTc2M0RSVU1HZ1VMcGhBMXFmT0RiZW16djhuZEQrV1BIeXdyQXVBK0dP?=
 =?utf-8?B?ZUdockRFZFU3OHc4Z2VNaTNvWU85V29ONkw3YTdHWFdXZmhvN3p3a1EzMEZu?=
 =?utf-8?B?Q28xeXJwRzRsOGVEZ1ZmSGFwaGg1UWZWNEJhK2txSGdvbi96Ym1kWHVlOEx5?=
 =?utf-8?B?OWo0dEhVWjFWL0luWnhDNlZBVGxNemxCR2NQQlQxM0kycUNFWlZhaThnL04x?=
 =?utf-8?B?WUtZVHUxSDRMQktmZFplZWhuSUp5NS91cWN2TkcyNzFRVnBDVGUzekJYVTZ4?=
 =?utf-8?B?eHJ0ZHR0b01EWlJMRnVFNWZ3SjdsaHNNY2g2OTdtRGlLV1dQZDN2aXYvNVV6?=
 =?utf-8?B?VU5GMTlsWGJqemt5bnFHL3R3dGU1TVk5Q2FUVlprditHNXhmK0owVUZ6VE9C?=
 =?utf-8?B?dFJJV3d0RlNkZzUrekEramJndW1KYWxnMy9BSlRwN0hrRGhteXZ5NzRqemFm?=
 =?utf-8?B?TUs0cWZFOTBkVFBiREFCNTJERzZrYlZCSjA3S1NUM1hiWkQvYnltSC85b1NE?=
 =?utf-8?B?Tjhwb0p2ZDNDaHgydHVURXgzUjZVWjFrTnRJdVRWcjhxVERhdCtDUndoYmJk?=
 =?utf-8?B?SzVPZW9zbGcvUkdBTU5qN1pNUGVPOEJmM1ZlbTZEbUJ6bXA1YzR5clpLK2hL?=
 =?utf-8?B?VDZ1bURlbVJlY0dEVDJNQkFnWVgzRkdlcDk2QVRoRCtzZVdRK1FZTmlSazdD?=
 =?utf-8?B?UERKakp5WmNjc3RsQm1BWDBJbkRDNGc1YTlmVGNSVVVlalpqTlg3S1hUWVRz?=
 =?utf-8?B?ZzJyeE1CZGNtODNKSUNaU1pOZE1qYXhZb1Vld0F3SlJlM3duWWpEM25EVWtJ?=
 =?utf-8?Q?xQ98BNC3xeL4DTvlhiB/xyw8V1enjvRRFct8E=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB6609.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?UnExUWVoZW5jbkhIYnpOUWMxajZuVWRuY1hUaVU1WGtXMUY5Q09VczZXM0ZL?=
 =?utf-8?B?bTBJVWNxaUNCS01penpHaGhldVJUNE1SZ252VTIwYTZXYXBwWU10c21PYmcv?=
 =?utf-8?B?ZnVKemswVXljU1BiOVQ2bkVuVG8yK1Z6NGdkMkxSUkNBZnpLQThjMVpyUVhX?=
 =?utf-8?B?R2pqZHh4bW9rK25oVDR5NENYTm1kNWNRYjJWT2g0OTRqaGJ1ZjZKbWRtOW5n?=
 =?utf-8?B?R2JxS0t6K205TmdFRGk1YXR6ZTQyU3dhVjVhOVgrdm9MSmxCYWVpOGdIbXdv?=
 =?utf-8?B?VTQ1TWhEaXZRMS9Qb0plSkwzbWRseklGb3lTTFlTS0sxSVRrTnR2UXJrVXRL?=
 =?utf-8?B?dGEyNWI1WHhVb3NmVFJFd1YrOWtPSFhUS1kvN3NqMUZyQmpOY2Fad1dGZWJp?=
 =?utf-8?B?SUxrdDJ6ZXB6UEQ1R09BdzNBbWFJYnJsK0FmbjB1TmYwT2tIclZJSGFUc2p5?=
 =?utf-8?B?MHlMbXNTWlNoY0JFR29Kb3ZtQ1ZadVYxY1VablN0UCtJRUN3YWhzdTB3OWc1?=
 =?utf-8?B?OXVNY3hocEhNNDdpTTFRbzFtLzVIV0ZsQXg3T2lNdkJQNHNGV3I2OUdJMzJJ?=
 =?utf-8?B?eTZ0K3h0YzcwWER6UE16T1ViUVNpb0VXUDNrUGZZWkI4eUg0TlJ6TVNpUDNt?=
 =?utf-8?B?bm1FSzlUQk90bGJZa3dhSW9jUWF0dlNGT1VLL0tUdDdLZlorWnlaWFh5Vnhq?=
 =?utf-8?B?VGZCdmZyOEx6enhyZUo3RHJVYkQ3V3VEZ212N3dMR0JPWmxucW94Y3M2WGRG?=
 =?utf-8?B?elNhSkhzbUM0cUJCKzFlR2wwU3U3RUhGSnNaSG8zOHRYSWVZbFluNytScmhq?=
 =?utf-8?B?TmpDV3ZpZlUxRys3SHc5em5FclpjUXh5NCs2R2RCQ2liclRXMVNrVGtMVHdR?=
 =?utf-8?B?Z2ZDN2YwOVFoMzJldjJOYm9IWno3dGtCNzFtc01sNHVlczNwRTJ3eVJvMU1j?=
 =?utf-8?B?Y29kdEdKV3NvU3RKdnFIbWo4ZEVheURQbk1VcEV5d0dYK0MwK0Vpc0hwUzJZ?=
 =?utf-8?B?akIyQS9QZmFpVjhpOHQ3TlBBYmtkUG4rMU11SHF1NDZrbGVrZHJzNXVPZ28z?=
 =?utf-8?B?NGkxT3VTc0RhVHAzc2VwL3NuYzhodHNpbitsakowT2l2V1FYQXF1RGJLcTlI?=
 =?utf-8?B?R2E4WGpZdnR4VEFtam1JTGtFMVYzNFlRWmVHSHoyQlNMWHNWMEc3NTRPSFFy?=
 =?utf-8?B?dTFGMFZXVXN1L3dxUE43WWlDTFpRamNoVlJCUkRkSmxzclpjTi81VW9rRnZM?=
 =?utf-8?B?MjlqeGM2TzBIOVlrMm03TXhpSmExUUdrUFNHVkhmcHJ4WmZiS1doVG0waDUr?=
 =?utf-8?B?bnIrM1hUVlFWTHdCTDRXeWI1S1JkelM5WXpnSWx4K1E3aFR0anpucmtqRjAx?=
 =?utf-8?B?MkJtYXVpU0tTZ053VlUvNk5OMkJLY1M3UlVkbGlma0VvcS85TTh3T0RFYVBt?=
 =?utf-8?B?V3hlVk1vWE5iRFVCVk8xUHNCZDYvOTh2S3l2Ykt3K1F1cG91dlpGemZQU1ZC?=
 =?utf-8?B?ZnpMRnZ1Z0F3TnhWbGVrY0JyQ1hQYThBeTI1RlFKaDU3ZEdlaHl3RGdWaFdE?=
 =?utf-8?B?WjdacVYrUWJ6N3gvOGNpOHFXMmZ5NC9lQmhMNmVCSGJscDVPQ042WjVjbW1z?=
 =?utf-8?B?WGIwRXV5NWRJTVByM3FBcHI0Zkt4WWhSY0VnZzU2c1Jlcm80aDVkVWFNbGo4?=
 =?utf-8?B?bWVzMzdJWUNYTCtHanM3WWE4QXlwTURORUhDU0pGMjRVSGp4dm9yOXlVbGRo?=
 =?utf-8?B?bzE2ZHFvRFZvUGJTZ210S2dFb2FwNjZ2SlUrU3hna2orNERBM01wSGhuRDJ2?=
 =?utf-8?B?dU9CWWRYeEVwVFo2dmxtakhZSzVwQ3dxV1VOV0E0Y0JTalp1ZEFkT1B2dS9D?=
 =?utf-8?B?SlZlNFlHbEx6L1h6UGdMYlk5QU9wei9ZWStaYVBwdEVFNkFIWVVHTGpsbEJx?=
 =?utf-8?B?QWhUTVVSYWZUZWVSVWRmY24yVW1qUjJ1Nm9IL1IyNERCdDlBelpEV1FmWmo2?=
 =?utf-8?B?THRDZ05LUmg0azR4R0JnNmxNWFQxQmQ2ZzRBZnFieDR0Qk82NzB0MDFyTnBi?=
 =?utf-8?B?L1E2ZWl1dFA0cUJ3MnB3Z0hrNXFQbUxhQnJ3WlNKUlBOV3lHcC9ZVU16ZEox?=
 =?utf-8?Q?T73kvTY5wPJ3F4D3Axq3triFz?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D72328EBD702424D8B85968915E006F3@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f5dbabd-810b-49a4-22e8-08dc9ff873a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jul 2024 09:21:02.0405
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n+mW1xyz/3D6sJ09ti/6dFajLOvQhgpCXBAQWY8DVYYMgChVxqLGhkIH57Z97kS0cg0upqOB+azFdixcZ1vX2T4MvKhn65QzFA3potts0Dg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5143

SGkgUm9iLA0KDQpPbiAwMS8wNy8yNCA4OjMzIHBtLCBSb2IgSGVycmluZyB3cm90ZToNCj4gRVhU
RVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVz
cyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiBUdWUsIEp1biAyNSwgMjAy
NCBhdCAxMDowNToyNUFNICswNTMwLCBNYW5pa2FuZGFuIE11cmFsaWRoYXJhbiB3cm90ZToNCj4+
IENvbnZlcnQgQXRtZWwgUElPMyBwaW5jdHJsIGJpbmRpbmcgZG9jdW1lbnQgdG8gRFQgc2NoZW1h
IGZvcm1hdA0KPj4ganNvbi1zY2hlbWEuDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRh
biBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+PiBj
aGFuZ2VzIGluIHYyOg0KPj4NCj4+IC0gRml4IGJvdCBlcnJvcnMgYnkgZml4aW5nIGlzc3VlcyBp
biA0LzUNCj4+IC0gcmVtb3ZlIHFvdXRlcyBmcm9tICRyZWYNCj4+IC0tLQ0KPj4gICAuLi4vYmlu
ZGluZ3MvcGluY3RybC9hdG1lbCxhdDkxLXBpbmN0cmwudHh0ICAgfCAxNzggLS0tLS0tLS0tLS0t
LS0tLQ0KPj4gICAuLi4vcGluY3RybC9hdG1lbCxhdDkxcm05MjAwLXBpbmN0cmwueWFtbCAgICAg
fCAxOTQgKysrKysrKysrKysrKysrKysrDQo+PiAgIDIgZmlsZXMgY2hhbmdlZCwgMTk0IGluc2Vy
dGlvbnMoKyksIDE3OCBkZWxldGlvbnMoLSkNCj4+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IERvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2F0bWVsLGF0OTEtcGluY3RybC50
eHQNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9waW5jdHJsL2F0bWVsLGF0OTFybTkyMDAtcGluY3RybC55YW1sDQo+Pg0KPj4gZGlmZiAt
LWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9waW5jdHJsL2F0bWVsLGF0
OTEtcGluY3RybC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcGluY3Ry
bC9hdG1lbCxhdDkxLXBpbmN0cmwudHh0DQo+PiBkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQNCj4+
IGluZGV4IDBhYTFhNTMwMTJkNi4uMDAwMDAwMDAwMDAwDQo+PiAtLS0gYS9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcGluY3RybC9hdG1lbCxhdDkxLXBpbmN0cmwudHh0DQo+PiAr
KysgL2Rldi9udWxsDQo+PiBAQCAtMSwxNzggKzAsMCBAQA0KPj4gLSogQXRtZWwgQVQ5MSBQaW5t
dXggQ29udHJvbGxlcg0KPj4gLQ0KPj4gLVRoZSBBVDkxIFBpbm11eCBDb250cm9sbGVyLCBlbmFi
bGVzIHRoZSBJQw0KPj4gLXRvIHNoYXJlIG9uZSBQQUQgdG8gc2V2ZXJhbCBmdW5jdGlvbmFsIGJs
b2Nrcy4gVGhlIHNoYXJpbmcgaXMgZG9uZSBieQ0KPj4gLW11bHRpcGxleGluZyB0aGUgUEFEIGlu
cHV0L291dHB1dCBzaWduYWxzLiBGb3IgZWFjaCBQQUQgdGhlcmUgYXJlIHVwIHRvDQo+PiAtOCBt
dXhpbmcgb3B0aW9ucyAoY2FsbGVkIHBlcmlwaCBtb2RlcykuIFNpbmNlIGRpZmZlcmVudCBtb2R1
bGVzIHJlcXVpcmUNCj4+IC1kaWZmZXJlbnQgUEFEIHNldHRpbmdzIChsaWtlIHB1bGwgdXAsIGtl
ZXBlciwgZXRjKSB0aGUgY29udHJvbGxlciBjb250cm9scw0KPj4gLWFsc28gdGhlIFBBRCBzZXR0
aW5ncyBwYXJhbWV0ZXJzLg0KPj4gLQ0KPj4gLVBsZWFzZSByZWZlciB0byBwaW5jdHJsLWJpbmRp
bmdzLnR4dCBpbiB0aGlzIGRpcmVjdG9yeSBmb3IgZGV0YWlscyBvZiB0aGUNCj4+IC1jb21tb24g
cGluY3RybCBiaW5kaW5ncyB1c2VkIGJ5IGNsaWVudCBkZXZpY2VzLCBpbmNsdWRpbmcgdGhlIG1l
YW5pbmcgb2YgdGhlDQo+PiAtcGhyYXNlICJwaW4gY29uZmlndXJhdGlvbiBub2RlIi4NCj4+IC0N
Cj4+ICsNCg0KWyAuLiBdDQoNCj4+ICtwYXR0ZXJuUHJvcGVydGllczoNCj4+ICsgICdeW2EtejAt
OS1fXSskJzoNCj4+ICsgICAgZGVzY3JpcHRpb246DQo+PiArICAgICAgQSBwaW5jdHJsIG5vZGUg
c2hvdWxkIGNvbnRhaW4gYXQgbGVhc3Qgb25lIHN1Ym5vZGUgcmVwcmVzZW50aW5nIHRoZQ0KPj4g
KyAgICAgIHBpbmN0cmwgZ3JvdXAgYXZhaWxhYmxlIG9uIHRoZSBtYWNoaW5lLg0KPiANCj4gICAg
ICAgICB0eXBlOiBvYmplY3QNCj4gDQpJIHRyaWVkIHRvIGFkZCB0aGUgInR5cGU6IG9iamVjdCIg
Zm9yIHRoZSBhYm92ZSByZWdleCBwYXR0ZXJuIGFuZCBnb3QgDQpoaXQgYnkgRFRDX0NISyBlcnJv
cnMsDQoNCnBpbmN0cmxAZmZmZmY0MDA6IGNvbXBhdGlibGU6IFsnYXRtZWwsYXQ5MXJtOTIwMC1w
aW5jdHJsJywgJ3NpbXBsZS1tZmQnXSANCmlzIG5vdCBvZiB0eXBlICdvYmplY3QnDQoJZnJvbSBz
Y2hlbWEgJGlkOiANCmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BpbmN0cmwvYXRtZWws
YXQ5MXJtOTIwMC1waW5jdHJsLnlhbWwjDQogIHBpbmN0cmxAZmZmZmY0MDA6IHJhbmdlczogW1sw
LCAxMDczODcyODk2LCAxMjI4OF1dIGlzIG5vdCBvZiB0eXBlICdvYmplY3QnDQoJZnJvbSBzY2hl
bWEgJGlkOiANCmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3BpbmN0cmwvYXRtZWwsYXQ5
MXJtOTIwMC1waW5jdHJsLnlhbWwjDQoNClRoZSBwaW5jdHJsIHN1Ym5vZGUgc3RyaW5nIGluIHRo
ZSBhdDkxIERUJ3MgdGFrZXMgYW55IGZvcm1hdCwgDQpjb21iaW5hdGlvbiBvZiBsb3dlcmNhc2Ug
YWxwaGFiZXRzICBvciBjb21iaW5hdGlvbiBvZiBhbHBoYWJldHMgKyANCm51bWJlcnMgb3Igd2l0
aCBzb21lIHNwbCBjaGFyYWN0ZXJzIGxpa2UgJy0nIG9yICdfJyAuDQpObyBmaXhlZCByZWdleCBm
b3JtYXQgaXMgZGVmaW5lZCBmb3IgcGluY3RybCBzdWJub2RlIGdyb3VwLg0KUmVmZXJyaW5nIHRv
IG90aGVyIFNvQyB5YW1sIGZpbGVzLCBJIGhhdmUgcmVtb3ZlZCB0aGUgcmVnZXggZm9yIHBpbm11
eCANCnN1Ym5vZGUgaW4gdjMgKyBhZGRyZXNzaW5nIHRoZSBvdGhlciBjb21tZW50cy4NCktpbmRs
eSBoYXZlIGEgbG9vaywgVElBLg0KPj4gKyAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UN
Cj4+ICsNCj4+ICsgICAgcGF0dGVyblByb3BlcnRpZXM6DQo+PiArICAgICAgJ15bYS16MC05LV9d
KyQnOg0KPj4gKyAgICAgICAgdHlwZTogb2JqZWN0DQo+PiArICAgICAgICBwcm9wZXJ0aWVzOg0K
Pj4gKyAgICAgICAgICBhdG1lbCxwaW5zOg0KPj4gKyAgICAgICAgICAgICRyZWY6IC9zY2hlbWFz
L3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3VpbnQzMi1tYXRyaXgNCj4+ICsgICAgICAgICAgICBk
ZXNjcmlwdGlvbjogfA0KPj4gKyAgICAgICAgICAgICAgRWFjaCBlbnRyeSBjb25zaXN0cyBvZiA0
IGludGVnZXJzIGFuZCByZXByZXNlbnRzIHRoZSBwaW5zDQo+PiArICAgICAgICAgICAgICBtdXgg
YW5kIGNvbmZpZyBzZXR0aW5nLlRoZSBmb3JtYXQgaXMNCj4+ICsgICAgICAgICAgICAgIGF0bWVs
LHBpbnMgPSA8UElOX0JBTksgUElOX0JBTktfTlVNIFBFUklQSCBDT05GSUc+Lg0KPj4gKyAgICAg
ICAgICAgICAgU3VwcG9ydGVkIHBpbiBudW1iZXIgYW5kIG11eCB2YXJpZXMgZm9yIGRpZmZlcmVu
dCBTb0NzLCBhbmQNCj4+ICsgICAgICAgICAgICAgIGFyZSBkZWZpbmVkIGluIDxpbmNsdWRlL2R0
LWJpbmRpbmdzL3BpbmN0cmwvYXQ5MS5oPi4NCj4+ICsgICAgICAgICAgICAgIGl0ZW1zOg0KPj4g
KyAgICAgICAgICAgICAgICBpdGVtczoNCj4+ICsgICAgICAgICAgICAgICAgICAtIGRlc2NyaXB0
aW9uOg0KPj4gKyAgICAgICAgICAgICAgICAgICAgICBQaW4gYmFuaw0KPj4gKyAgICAgICAgICAg
ICAgICAgIC0gZGVzY3JpcHRpb246DQo+PiArICAgICAgICAgICAgICAgICAgICAgIFBpbiBiYW5r
IGluZGV4DQo+PiArICAgICAgICAgICAgICAgICAgLSBkZXNjcmlwdGlvbjoNCj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgUGVyaXBoZXJhbCBmdW5jdGlvbg0KPj4gKyAgICAgICAgICAgICAgICAg
IC0gZGVzY3JpcHRpb246DQo+PiArICAgICAgICAgICAgICAgICAgICAgIFBhZCBjb25maWd1cmF0
aW9uDQo+PiArDQo+PiArICAgICAgICByZXF1aXJlZDoNCj4+ICsgICAgICAgICAgLSBhdG1lbCxw
aW5zDQo+PiArDQo+PiArICAgICAgICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCj4+ICsN
Cj4+ICsgICdncGlvQFswLTlhLWZdKiQnOg0KPiANCj4gJyonIG1lYW5zIDAgb3IgbW9yZS4gWW91
IG5lZWQgJysnIGZvciAxIG9yIG1vcmUNCj4gDQo+PiArICAgICRyZWY6ICIvc2NoZW1hcy9ncGlv
L2F0bWVsLGF0OTFybTkyMDAtZ3Bpby55YW1sIg0KPiANCj4gRG9uJ3QgbmVlZCBxdW90ZXMuIHlh
bWxsaW50IHNob3VsZCBoYXZlIHRvbGQgeW91IHRoaXMuDQo+IA0KPj4gKyAgICB1bmV2YWx1YXRl
ZFByb3BlcnRpZXM6IGZhbHNlDQo+PiArDQo+PiArYWxsT2Y6DQo+PiArICAtICRyZWY6IHBpbmN0
cmwueWFtbCMNCj4+ICsNCj4+ICtyZXF1aXJlZDoNCj4+ICsgIC0gY29tcGF0aWJsZQ0KPj4gKyAg
LSByYW5nZXMNCj4+ICsgIC0gIiNhZGRyZXNzLWNlbGxzIg0KPj4gKyAgLSAiI3NpemUtY2VsbHMi
DQo+PiArICAtIGF0bWVsLG11eC1tYXNrDQo+PiArDQo+PiArYWRkaXRpb25hbFByb3BlcnRpZXM6
IGZhbHNlDQo+PiArDQo+PiArZXhhbXBsZXM6DQo+PiArICAtIHwNCj4+ICsgICAgI2luY2x1ZGUg
PGR0LWJpbmRpbmdzL2Nsb2NrL2F0OTEuaD4NCj4+ICsgICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdz
L2ludGVycnVwdC1jb250cm9sbGVyL2lycS5oPg0KPj4gKyAgICAjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvcGluY3RybC9hdDkxLmg+DQo+PiArDQo+PiArICAgIHBpbmN0cmxAZmZmZmY0MDAgew0KPj4g
KyAgICAgICNhZGRyZXNzLWNlbGxzID0gPDE+Ow0KPj4gKyAgICAgICNzaXplLWNlbGxzID0gPDE+
Ow0KPj4gKyAgICAgIGNvbXBhdGlibGUgPSAiYXRtZWwsYXQ5MXJtOTIwMC1waW5jdHJsIiwgInNp
bXBsZS1tZmQiOw0KPj4gKyAgICAgIHJhbmdlcyA9IDwweGZmZmZmNDAwIDB4ZmZmZmY0MDAgMHg2
MDA+Ow0KPj4gKw0KPj4gKyAgICAgIGF0bWVsLG11eC1tYXNrID0gPA0KPj4gKyAgICAgICAgLyog
ICAgQSAgICAgICAgIEIgICAgICovDQo+PiArICAgICAgICAweGZmZmZmZmZmIDB4ZmZjMDBjM2Ig
IC8qIHBpb0EgKi8NCj4+ICsgICAgICAgIDB4ZmZmZmZmZmYgMHg3ZmZmM2NjZiAgLyogcGlvQiAq
Lw0KPj4gKyAgICAgICAgMHhmZmZmZmZmZiAweDAwN2ZmZmZmICAvKiBwaW9DICovDQo+PiArICAg
ICAgICA+Ow0KPj4gKw0KPj4gKyAgICAgIGRiZ3Ugew0KPj4gKyAgICAgICAgcGluY3RybF9kYmd1
OiBkYmd1LTAgew0KPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIGF0bWVsLHBpbnMgPQ0KPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgPEFUOTFfUElPQiAxNCBBVDkxX1BFUklQSF9BIEFU
OTFfUElOQ1RSTF9QVUxMX1VQDQo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgQVQ5MV9Q
SU9CIDE1IEFUOTFfUEVSSVBIX0EgQVQ5MV9QSU5DVFJMX05PTkU+Ow0KPj4gKyAgICAgICAgfTsN
Cj4+ICsgICAgICB9Ow0KPj4gKw0KPj4gKyAgICAgIHBpb0E6IGdwaW9AZmZmZmY0MDAgew0KPj4g
KyAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJhdG1lbCxhdDkxcm05MjAwLWdwaW8iOw0KPj4g
KyAgICAgICAgICAgICAgcmVnID0gPDB4ZmZmZmY0MDAgMHgyMDA+Ow0KPj4gKyAgICAgICAgICAg
ICAgaW50ZXJydXB0cyA9IDwyIElSUV9UWVBFX0xFVkVMX0hJR0ggMT47DQo+PiArICAgICAgICAg
ICAgICAjZ3Bpby1jZWxscyA9IDwyPjsNCj4+ICsgICAgICAgICAgICAgIGdwaW8tY29udHJvbGxl
cjsNCj4+ICsgICAgICAgICAgICAgIGludGVycnVwdC1jb250cm9sbGVyOw0KPj4gKyAgICAgICAg
ICAgICAgI2ludGVycnVwdC1jZWxscyA9IDwyPjsNCj4+ICsgICAgICAgICAgICAgIGNsb2NrcyA9
IDwmcG1jIFBNQ19UWVBFX1BFUklQSEVSQUwgMj47DQo+PiArICAgICAgfTsNCj4+ICsgICAgfTsN
Cj4+ICsuLi4NCj4+IC0tDQo+PiAyLjI1LjENCj4+DQoNCi0tIA0KVGhhbmtzIGFuZCBSZWdhcmRz
LA0KTWFuaWthbmRhbiBNLg0KDQo=

