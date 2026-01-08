Return-Path: <linux-gpio+bounces-30296-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D23ED058D5
	for <lists+linux-gpio@lfdr.de>; Thu, 08 Jan 2026 19:32:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C9E723083172
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Jan 2026 18:28:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 049CA3128D9;
	Thu,  8 Jan 2026 18:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="dnznepGF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0267312825;
	Thu,  8 Jan 2026 18:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767896881; cv=fail; b=IWqUHRbEdGTCGcrB5wL1wDGIHnV7v/1ZoqiZPdCJOIj8/UfPlR2JoFAdsMoJyY1iyTmX5KQYAkmmBKINf/eITIFmjFODHYDPaf7R7KJji8Hp240A9och4X8u/Tvq3SRAjggigkUD3VQXko0Z8OiM8rKHDANvbzGtmZsQxxfnYfY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767896881; c=relaxed/simple;
	bh=79uskSFTmMXXlbcJN70Peh9uvzqpnlQ8sgsbgmBkOzA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=l+PNR6l9bPEefBWIaYG36IfAosq0pJ+8D7imIDsEgakBanb80fEi+CdYppZGR8s/IkPEI+y7PSCRq8MwV+iAO5aNtaWblUkfo6eYCJNDsreypxxbL8QJGypEeOAsZuwB1EboT9mPluzWrkqqUkK1jwiE8U3iNGMrF1qg6VnlPp8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=dnznepGF; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l1PbGpmaXy9FPrkOnamN888lnajVpaIC2HyLzlLSqaE90G1KBs0FkeOtVopnqV94n9FkPRGwcm99Aybo6+m1Qs5yGGI3IH0GavvovwGY5GVuBHPmkp+zMioZ5+GDfnrLPkpMoh6APOA7CdbUovkbvaIdJxoUXbypupJlCaoapFODcIPjOHJH/IccsIATyeoDLc8rZ5+KuPuU4QMilZ8zr9Y85URjQcGrDHsWMKkycRZRoYExe1G7fo+Z3sl9rRsYqQyIj02RgNSeZOmUL5qbbDBp9NQvTEMTjg6/39PN5pthMOht3Rrb0teyGVbbQ+kthDHsPC2M0VG0bwsE7xcskg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79uskSFTmMXXlbcJN70Peh9uvzqpnlQ8sgsbgmBkOzA=;
 b=X2x9FgjFfCvUOw9KGKUg56Wd25nMYpeczbaVgsHMyTUi0KtqfKH3JoFqHqouEXEetghtcdpEPMGgSVlWYnZ3A7yunbUhUS383kQFomexpOvk6MMul1qLlR4wtP5NivcdpMAST6LSpopl+y2esUr9//n/2e78wMzpB8l7utTqb1jotbhNsvaa5HLuPLnwrdc8W+Pvkwn/pVEW0x9C/FyJbQ/5YxVqTpYmDU83I9h7jjZdEmmc3/PKSC/hEZY7dnc4Wm3I67/fx75pLN5zwJlYRMuXAt+IZp821yt3XWDBkmvcJrwCdSQbnfqTPuKw9Ea7avICGMrv1SV0RjgErcrxbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79uskSFTmMXXlbcJN70Peh9uvzqpnlQ8sgsbgmBkOzA=;
 b=dnznepGF8x8o1smAw7SVQCYiFwjMsuC6VmOlON7xJV73rWBMdBkWP7y9I5f1sHF6z047Eayn0JBqMT/ydzUtrobRnYBnT+tsjI4SnKsjNDoWUTZG9sDNmzbwDJekgb1Wu/jsQzCv8pvbPugKmgAB7gtZgBpXPn0WY8mICkiE6SI=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by OS7PR01MB14362.jpnprd01.prod.outlook.com
 (2603:1096:604:386::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.0; Thu, 8 Jan
 2026 18:27:55 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::606d:1c5a:2899:5ea6%4]) with mapi id 15.20.9520.000; Thu, 8 Jan 2026
 18:27:55 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 7/8] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: add
 GPIO keys
Thread-Topic: [PATCH v2 7/8] arm64: dts: renesas: r9a09g077m44-rzt2h-evk: add
 GPIO keys
Thread-Index: AQHcZfhnZbmyq4PFQEq92qun7pxeeLVIx4eAgAAFALA=
Date: Thu, 8 Jan 2026 18:27:55 +0000
Message-ID:
 <TYRPR01MB156196B6A2C6808841B5BAF818585A@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20251205150234.2958140-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20251205150234.2958140-8-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdWSB=9d7jwFcLjJY3zJjs7neFJ+tr+GtTDAU85=o8xK1A@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWSB=9d7jwFcLjJY3zJjs7neFJ+tr+GtTDAU85=o8xK1A@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|OS7PR01MB14362:EE_
x-ms-office365-filtering-correlation-id: 91da37f9-6495-464e-ebdb-08de4ee3a435
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700021|7053199007;
x-microsoft-antispam-message-info:
 =?utf-8?B?RWp4SThZSmxxVTlZVmZabGVtZWlQMW1HRCtTSG9hL0dBQWJzZlNlVlRsZ3lm?=
 =?utf-8?B?dGVUeUg5TGJJbTgxWGROTDMxYk1jVGJ4dmpGczIzd0VsN0hHSFduS2FFMHpu?=
 =?utf-8?B?RkcraS9YdjlFd2hBWGdUYWk4a25pKzdDQWx4bndrdk9oZGFGbmhnQXhBbmJY?=
 =?utf-8?B?R2dNMW5UU3J6S0Zpbk40R1ZSVGFXdkMxWDdRMDJkNzJnNUxmeEtIR0ZIT1J4?=
 =?utf-8?B?TDhmM0pPVzBMR1FhZGR5ekJrZ21Fem1nMHdPL0F0bkZjNWhUODVJTGtsSGw3?=
 =?utf-8?B?d3lrUzA4ZW5nbHpJN21LYWlLejNhTGdRK2FjbFZ4Znd4M0VCTjM1d1N6UHRK?=
 =?utf-8?B?RjVhWmNPZHlBdm16bTRNQ0R2amoyZWtnZnhtOTRaWUFIamxxeFZkQVd1WjEw?=
 =?utf-8?B?Q0tkdTNWWWdwb2p2MjdPb1g5MW5OTDQxL1NXNXZkTzdNTFlZYkFsRUhmWG5F?=
 =?utf-8?B?U1lyZ0o3TlFLbC9ObURsY1lhaVNBaWNnbUE3TnVubTFzSnZvN3pZcjFWR1BX?=
 =?utf-8?B?Z01RcXpHTitWQTZyVDZwUWVYZE1mc0RueTkrU0NxSitCaHlzdGN5c3Y5Unhn?=
 =?utf-8?B?QlZEenhDcUhkN0d0Y3YzQXByWUxiekZDS3dHZVJ1bDFBM1ZpcUlTV04wL0ZE?=
 =?utf-8?B?eUdDM3Q3L2plRHQ4QU5DT0hkZ2V0YktaV0xPYnkwODQzemh6MGVqWmsvc083?=
 =?utf-8?B?WHJpNkVibDJITzh2VFl6VTNZRXZ6YmJUK0VoMlIxejBHcDNkU21CWjBJTkxP?=
 =?utf-8?B?MXZLRnJlVkN6aU1rVzJmakt2dUJSdERWczZra1NHLzNlQ01CSDFVOXNRVnQ2?=
 =?utf-8?B?YW9aQ1BKQit3SVFXWmN0aUtnWXZmK256STFzV1lXbGs3ZnVvck1PSW0zaWhS?=
 =?utf-8?B?NVlMTFppaUxpWlBuNXVtb1hUaUJNZGdUdTJsdmt2MTJKQktWc25KYUVWVHVD?=
 =?utf-8?B?QTV0SG9oVGF2SU1ndW83OWltOXFTZG91ME05SGJ1L0VTd05vMGJCc3NSSmNH?=
 =?utf-8?B?b1pqTmtnNGN3RlB3SzA4K3JHVnJrMUFOWGNKa09XVkNITGFmK0NKQTVicWdJ?=
 =?utf-8?B?bGpQS1BsSDlpNU5OU21ST0VhVXU3QmZPN1poZ3JpQUNPU012WFlFcmQxK21J?=
 =?utf-8?B?MFhsZlhyNWM5NGRQZDdyMXE5NWIrbW5HMUpJSkJ6bjhLNXVlYUdTazVOUWVm?=
 =?utf-8?B?NHptanhWTmg1dlQxbG8wYVVmUGRDdkx4L1A3WnVOUFNvSUpkRHhNSy8xOTFC?=
 =?utf-8?B?SDg3V1VZSTUyZ1ZzQWgvcVpRTzFqOGhXWC9wakg4dDh2eW5YeStjcDFQTzVI?=
 =?utf-8?B?Q3dnRHlkbkQ4WEtsN1J1TnZWSTJHUldlMk5UZGpETFRseXF5YzVFd05BRHMx?=
 =?utf-8?B?NHJDbVpZWHFZM2pWQ2NZNlhSYXFGSS9hREswcGtXYVhzaGowRDFzUGI4Z2x0?=
 =?utf-8?B?cHJNd2NWbmtvSlZNazUzajBtaG5OM2FjTlkrSXNOMUxVWGY4bE9ycU1VN3FD?=
 =?utf-8?B?RHJYWTNHdENmaHZYTk5OV2lEcC9MWFJ5aFBnQmhYeVpBbTFSREtIcGUyTTN2?=
 =?utf-8?B?a1ZvMnQ4eGZPQTVKdWt3UXN5cFdQOGxOWmd6dGJZUnhlOFpOdy9PSkNrR096?=
 =?utf-8?B?NHc3ZDAwbkVBd09rNnE2eXI1YVhlZ3VBYitmSXBXY0FWOW4rc0lSa2E4ZjJD?=
 =?utf-8?B?dmllV2ZSbS9aRTY0aVArY3duM2RnaFh3dmo1eVBXSldzK0trVjFvb0RlOFpM?=
 =?utf-8?B?R2tuMHVJakU1MHhMRGlJRlR4cGE3ekxNbkxpWUsyc29aK1doY1haWTlzU1Bx?=
 =?utf-8?B?U1FoS0JZWG5odE1BS0VLRjV5UWJ0MWNvRmszWHV6WVU1TmxlY0pqdURPRlVS?=
 =?utf-8?B?ZjRiRnh5QXp4N1NGUHhNUDI2dG1Jc1FXTHFEUjk3K1BzQUxHWHJrUHk1NWx1?=
 =?utf-8?B?d1A5TkxSR2VzakljeGUyQjlhLy9BUjJxSzh4ODlRdUVDUGlyVklLQXBWODVs?=
 =?utf-8?B?cWYvOWpGOTF2L3JtYmxJbnQ1UlJFWjJnSFNIWHVYYVREaW56aWU5K2dJK3M0?=
 =?utf-8?Q?Nnm3kO?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?YjFzTkpjYnVRSWR3RHFRd0tEQzd5STQwM0ZpVEZaMW1qcWo5emFBd09aRzQr?=
 =?utf-8?B?dUZJd1ZVQUdad0JaSHlVUC9JMHBqV3ZIZy8rVDF6eVFsdEZwelpYeFRVUFJ0?=
 =?utf-8?B?MHp0bDBiYURLYnZUTU55dFpwSHVJb1FqZEMyK2s3TEN0SEYydFAwamw5ZTVH?=
 =?utf-8?B?OWJUdm01NHRMTnFFamJlbHdoYXZ0OHkyZnV6VzFGZytCWlZqZ1hLNWRTYzFQ?=
 =?utf-8?B?ZDhwaEdhTGJ6ejhvWUVBOUR4dGltNSszZC9SZzNsU3A2alFPTzJNSWNKOTVR?=
 =?utf-8?B?WkpSSEZPQVhmRi9HNFZYT3ZYOWhOMXNXZGlOTFhkam92RkJhWTFrS3ZmYzNx?=
 =?utf-8?B?NzJCbHIzMXlXU2ZFaTRya3d0U1dHcTdUQk1LblBGOW9NSDF3OXduZFFpbW5q?=
 =?utf-8?B?V3pOajRzdWdDdFRRb2YwNDE2SUJsOTBFYWhROVpQSVpnV1FodExXNXQwQlBq?=
 =?utf-8?B?a0tGV3pxRlZkamdvVkZtMElyYXZGMWs2TmM3WTVZU1BwNWZGZi9oM3hZZHJs?=
 =?utf-8?B?QmNPZGpDVXFyb1lXcGdFWEloMGFVcXJkcXF5bkJhaGdvT3VtWkhEVGIzd3Zk?=
 =?utf-8?B?UXU3QmliMklHUXorQmI2MlVld05lTzlHcHd0dFU2Vk1qcXVHbzZsbDJUZ2pR?=
 =?utf-8?B?Q1loR04vMmpEUGZUeE8vNzNFUWZqdVV1MXk0TVh6cjRlaXJoaGppVkcrTWYx?=
 =?utf-8?B?WldvTXVLTkc2TExjWDBncDd2czhrelRFMzRZeEhDejd6eFNCNFFMTzlRamNs?=
 =?utf-8?B?Z0dCbE9CZ3lURWtVQldpUUFoZEFYck8vcUtFelhnK21WZFhaQ3NYWU1RT1l6?=
 =?utf-8?B?bVNZRzY1T05NU1V2azV4M25VY081b0VZa0tMWkYwcGxuRUg5d3JtQVd2dk54?=
 =?utf-8?B?SW1WRjZ2dUZaTDlOSytmcEdJK21qNCtmOTlMYmlNd2xGbld5Q3Vnczd6U2Nq?=
 =?utf-8?B?V01wWUdPUU1JbGROd1BmNTJxKzlFN0JhV3lZYmdVUU9nWmx0elNTSy9RM3lr?=
 =?utf-8?B?NE4zK2FkaEQ2L002cXJpVVhubkorZllEQzVQa3JkUzg2YnN6T3VISkpsa1d2?=
 =?utf-8?B?MEpDMDZqODVtTm5GanhUV0FqYWxNUXIxeHg5ZUlBYkJIc1AwVHdxSmNCV2tF?=
 =?utf-8?B?Z0VuRFFPaHd6UVBxOWpLaG1vNWQ4bkVSVlVCSHE1OTlIU2laTmRBdmVBTUVM?=
 =?utf-8?B?Ym1Tc2llTG8vWXJ0dEsrUGlscGd1cTNPSFdaVEtJamZFWjEyVEYxeWNtN3dG?=
 =?utf-8?B?SE9STktLcy84R05BMlkvK3YySFgrTjBCb1VlaXJIL05QOE5wRmE3ZE8xRnFE?=
 =?utf-8?B?azFQbzNPM1NmK25TcXdIeVdaTURMSmFFdXVzcGwwZzExbzRMR1p5Y3l4SnMy?=
 =?utf-8?B?bWR5WWRKT2w4SWc2U1IwdjdhUXRTMHlCZ2s4cVMrTnl5THJKYktGMzRLY0cy?=
 =?utf-8?B?MEtydnBvdWUxaGFSYURvMXhscHgvSDFIMjM1b1gwNHNZNHFQN0ZpUFFSaVBQ?=
 =?utf-8?B?R21kam9ZTnRZbU0yQUQ5MFNqUmhHeFJCczg4WkFNNzh2NnR1Zmd6eFZBOGpQ?=
 =?utf-8?B?YytOa2JTblU2ckxhcVFNRGhpS0lidVFJVEFWcWo2c3NoUkxVbWhYcEg5TXN0?=
 =?utf-8?B?RTJ3MkRxcDJZVjhLOUhCNW5BZ2RzSU1aV2RrbXBibytINVJTcHlUaEtrWUdp?=
 =?utf-8?B?WUc1czNIZ0IxUGJnQlZ0VFY3Tk5UdDUzbFJIVklaOFgvS1l2dDBycDU0V0Vp?=
 =?utf-8?B?eHRSdS9leGsyRWRyQU11V1N1MU81WkdqT29OTlJaMzl3RDBsSmZMUXlYeFha?=
 =?utf-8?B?VlJ0NTJzTGFVa1BUbFFGUVMwL2xNYnVBRXFPa1ZQQ3BmYWV6M3ZHbDB3QmM1?=
 =?utf-8?B?TFd2b2JqbnBMd1M3SE1LUTYwbnNSUHpPMng1NERZMEcyRWVBdHJlZHFkOGox?=
 =?utf-8?B?WlZUbjNRNVNzMysxZFBsTFdGVGtOU1hxNnV3VnpINEhtam9XY2RWaGhwNjJT?=
 =?utf-8?B?cmprZEp1ZC9SWHprYUpwL2hUT1I0dzEvV2NoR0xJK3FjakhINW1DYTlJdVFz?=
 =?utf-8?B?OUhobHg5dGlPck9aYXBwelZNdmZhTWorQWowL2pxVTRIUkhqelhoNWJ5bmxC?=
 =?utf-8?B?dFY4THBxaVkrZ2cxZDZWeEhwQk1QQ05Da1Rrck14MkJlcWlpR2FjbkFLL2pk?=
 =?utf-8?B?NUltSXVCQ1dQcUFLRTlIUEhIVDZUbUNuOWpvdEpTYSt4WVJ6dDBMUjB1OTNz?=
 =?utf-8?B?WjNGWFYxak0rRmlMWHhsMGlhbUhrcFZVOCtkUjVQbVNBOWlnV20rZEJwRHVp?=
 =?utf-8?B?cDhOUFZXdVIzZDc4R2RydFpKckJVWGhVWTJsQm5IUnhRdEJpZW1FeVNqeEU3?=
 =?utf-8?Q?DhNqI7mz8W/vlO0koGwMWZX/nC9H06KVVRH3R?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91da37f9-6495-464e-ebdb-08de4ee3a435
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Jan 2026 18:27:55.2617
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xJmckvINYn26FK3TzEa9m4Nau8NdjqIqTJeVGhpZCXdva7u+vSFk4USJeb+4g24n15xrm07IsldMqrYzLgIvWLfccvo0Bp1jliVveQgaQ19fhrWGbmEMzW2OLIJlqS4A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14362

PiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50
OiBUaHVyc2RheSwgSmFudWFyeSA4LCAyMDI2IDg6MDggUE0NCj4gDQo+IEhpIENvc21pbiwNCj4g
DQo+IE9uIEZyaSwgNSBEZWMgMjAyNSBhdCAxNjowNCwgQ29zbWluIFRhbmlzbGF2DQo+IDxjb3Nt
aW4tZ2FicmllbC50YW5pc2xhdi54YUByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gVGhlIFJlbmVz
YXMgUlovVDJIIEV2YWx1YXRpb24gS2l0IGhhcyB0aHJlZSB1c2VyIGJ1dHRvbnMgY29ubmVjdGVk
IHRvDQo+ID4gR1BJT3MgdGhhdCBjYW4gYmUgdXNlZCBhcyBpbnB1dCBrZXlzLg0KPiA+DQo+ID4g
QWRkIHN1cHBvcnQgZm9yIHRoZW0uDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb3NtaW4gVGFu
aXNsYXYgPGNvc21pbi1nYWJyaWVsLnRhbmlzbGF2LnhhQHJlbmVzYXMuY29tPg0KPiANCj4gVGhh
bmtzIGZvciB5b3VyIHBhdGNoIQ0KPiANCj4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL3Jl
bmVzYXMvcjlhMDlnMDc3bTQ0LXJ6dDJoLWV2ay5kdHMNCj4gPiArKysgYi9hcmNoL2FybTY0L2Jv
b3QvZHRzL3JlbmVzYXMvcjlhMDlnMDc3bTQ0LXJ6dDJoLWV2ay5kdHMNCj4gPiBAQCAtNyw2ICs3
LDggQEANCj4gPg0KPiA+ICAvZHRzLXYxLzsNCj4gPg0KPiA+ICsjaW5jbHVkZSA8ZHQtYmluZGlu
Z3MvaW5wdXQvaW5wdXQuaD4NCj4gPiArDQo+ID4gICNpbmNsdWRlICJyOWEwOWcwNzdtNDQuZHRz
aSINCj4gPg0KPiA+ICAvKg0KPiA+IEBAIC02MCw2ICs2MiwzNyBAQCAvIHsNCj4gPiAgICAgICAg
IG1vZGVsID0gIlJlbmVzYXMgUlovVDJIIEVWSyBCb2FyZCBiYXNlZCBvbiByOWEwOWcwNzdtNDQi
Ow0KPiA+ICAgICAgICAgY29tcGF0aWJsZSA9ICJyZW5lc2FzLHJ6dDJoLWV2ayIsICJyZW5lc2Fz
LHI5YTA5ZzA3N200NCIsICJyZW5lc2FzLHI5YTA5ZzA3NyI7DQo+ID4NCj4gPiArICAgICAgIGtl
eXMgew0KPiA+ICsgICAgICAgICAgICAgICBjb21wYXRpYmxlID0gImdwaW8ta2V5cyI7DQo+ID4g
Kw0KPiA+ICsjaWYgKCFTRDFfTUlDUk9fU0QpDQo+ID4gKyAgICAgICAgICAgICAgIC8qIFNXMi0z
OiBPTiAqLw0KPiANCj4gU2hvdWxkbid0IHRoYXQgYmUgT0ZGPw0KPiANCg0KR29vZCBjYXRjaCEg
WWVzLCBpdCBzaG91bGQgYmUgT0ZGLCBhcyBpdCdzIE9OIGZvciBTRCBDYXJkLg0KDQpJIHdpbGwg
Zml4IGl0IGZvciB0aGUgbmV4dCB2ZXJzaW9uLg0KDQo+ID4gKyAgICAgICAgICAgICAgIGtleS0x
IHsNCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBpbnRlcnJ1cHRzLWV4dGVuZGVkID0gPCZw
aW5jdHJsIFJaVDJIX0dQSU8oOCwgNikgSVJRX1RZUEVfRURHRV9GQUxMSU5HPjsNCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBsaW51eCxjb2RlID0gPEtFWV8xPjsNCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgICBsYWJlbCA9ICJTVzkiOw0KPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
IHdha2V1cC1zb3VyY2U7DQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGVib3VuY2UtaW50
ZXJ2YWwgPSA8MjA+Ow0KPiA+ICsgICAgICAgICAgICAgICB9Ow0KPiA+ICsjZW5kaWYNCj4gDQo+
IFRoZSByZXN0IExHVE0uDQo+IA0KPiBHcntvZXRqZSxlZXRpbmd9cywNCj4gDQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0DQo+IA0KPiAtLQ0KPiBHZWVydCBVeXR0ZXJob2V2ZW4gLS0g
VGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3Jn
DQo+IA0KPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwg
SSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0DQo+IHdoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5h
bGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4NCj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcw0K

