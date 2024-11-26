Return-Path: <linux-gpio+bounces-13295-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44ABC9D9E94
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 21:59:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D58A31657BE
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Nov 2024 20:59:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D581DF27B;
	Tue, 26 Nov 2024 20:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b="iGUOlM5G"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com (mail-vi1eur03on2045.outbound.protection.outlook.com [40.107.103.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29961D63E9;
	Tue, 26 Nov 2024 20:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.103.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732654778; cv=fail; b=XE0EcYmS150yraWuc+YSCsSfLi3Z3lxDgG7vwax66mT0Pf5dIAUSMu93pzykiFa6pK1UhSNJ9ob6Nt3DeXaKpD/GDl1SSNtVbNoewiTOxftak91SmN4j5qIpOKN3IZWVGtnOYH1kpUY892tKWSHKxON3YlgNHGEkBMVmHtuN7Xo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732654778; c=relaxed/simple;
	bh=QuroeKIbXtunh58xOxpkXC0n1uhNG0ooySwV1+VxDFQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Lah58mqwVD82qU+F30GoEUTnLndte9N+nNuwv1idPuqRX6Luz7Smgu4To1DJvkrNPbIgJg7OKgC2x2nwlZokYhYMMJqy2m+iYbddfirv1qZmCjF6jqfr0jE9sl1K84rRwAebEsEilfGN6FFuHfmSdIBa9vnmUIY4H9/PFZK/wI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=@siemens.com header.b=iGUOlM5G; arc=fail smtp.client-ip=40.107.103.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dLDLjHNS9C15ifO/2ztmamAugbsh3VJqreSXkCBWkRr5bB1jR9ELyVcxGJHKomDJbT8HBd5Jvx+1BBH3hKbheSAMrUcTSIrq0vVTGdGW1hXtMbF1I/Q8F6Hvknztwa6lGPUYNXDJ/USzKGKgiRm6Vwc/xIz4neVsT14yo+W/sDFCL1PfHi9ai5rfH0l7HW91fm0pBamqF8aq+qL0FsWiKNcmZuBp5pRTeFC6iVbZL8WmI1yOH62u6yFU8nkF7mWnbDpsHy5x31CDPmb7Nt5y3sbHi7oER2PLQw8odDg1g4o7WKS++LcfmPaAqeC14VJU0qufpqo1YzzCIIjvE9TNQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QuroeKIbXtunh58xOxpkXC0n1uhNG0ooySwV1+VxDFQ=;
 b=V3tGaU/eOkFdqtD5gVno3RLHgX34L/0jStCWB7jUbaj9wtUOelSCOMlFE/nsJ2TlXbRaf0KRwhwjwVl2qcETRlZxNFFztgwHawOnrFSmq4RVWlS85k2/rIECUHX52JQgVRV8iYTEBEKWTEFWgAApPMLRfm08z/3KlYZ+JBse33VuUWN5e0IrZ5hAd8DqhszS5QtDRCSIEu0xYgCKkEevozZ/TXJQ81wfPRUWCZd991TjvOjSJqxOD4G8iA+pg5XTkT6A7YmTodFhRAT4lerEE4mKAPmguP7JDN0MvCBDn4iomLg1kNAeK3Wd66DRYbW3X17SGnPSTMWIFUTMujodpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QuroeKIbXtunh58xOxpkXC0n1uhNG0ooySwV1+VxDFQ=;
 b=iGUOlM5GWQcBaBTpnPGS1UZrqlVyOryrgBOhvTbXav6Xs8Zo0l8y+1Sl9BszMp0ShwAfAw/RBql1b8xRWU3DM2JbhkK1vVPDmx6JZfS/DxPU2CtlertrE2eHKb2ziZnmihYpLgwqfe5ohbBh6NQe0H/hwjo9VBl/j0N49MvaLF1Nmr7LsE07rlOkVLHreLSSijWQcjz02B/+qQlMyH1vu6/wHn7nCq3BzCJv/dUv01G6sVBd/jfQQ6GspmzPSl5RjJhUOamIeXWCmog9A39lW0hse8rNK7yI5bJjo3NJAW0/q+huN/xBaz/6wDhVI1xHEokYJ3jZ/IU5uIq660kZ3g==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS2PR10MB6661.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:55c::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.11; Tue, 26 Nov
 2024 20:59:33 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::baa6:3ada:fbe6:98f4%7]) with mapi id 15.20.8207.010; Tue, 26 Nov 2024
 20:59:33 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "brgl@bgdev.pl" <brgl@bgdev.pl>
CC: "stable@vger.kernel.org" <stable@vger.kernel.org>,
	"linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"ssantosh@kernel.org" <ssantosh@kernel.org>, "khilman@kernel.org"
	<khilman@kernel.org>, "grygorii.strashko@ti.com" <grygorii.strashko@ti.com>,
	"linus.walleij@linaro.org" <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: omap: Silence lockdep "Invalid wait context"
Thread-Topic: [PATCH] gpio: omap: Silence lockdep "Invalid wait context"
Thread-Index: AQHbPxDOQhx+KS++tkuaGsavRuNpBLLKB+qAgAAGIgA=
Date: Tue, 26 Nov 2024 20:59:33 +0000
Message-ID: <0f5f4cca8b7f69b4b9cd3c34abceb7846e4cc187.camel@siemens.com>
References: <20241125080530.777123-1-alexander.sverdlin@siemens.com>
	 <CAMRc=Md03oSc6jkib=g9B7C51i4aAD6LdXGHsmXuRxB7VjDxaA@mail.gmail.com>
In-Reply-To:
 <CAMRc=Md03oSc6jkib=g9B7C51i4aAD6LdXGHsmXuRxB7VjDxaA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS2PR10MB6661:EE_
x-ms-office365-filtering-correlation-id: 31382e88-e35c-4d1c-ebe4-08dd0e5d3aa7
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?WUFOUklpQ3Jpc3MzajF0ZnNadWpmL3UwMWp0T0tnWk1RTUkrd3NERjJObVFX?=
 =?utf-8?B?UTBKR3pQRVArU0FLNlR1UHgxVSs3QkpvRkc0QTZPRytQOGcxei94VlFjdWY2?=
 =?utf-8?B?QjAvenI0R2hlZW1BVnZMQTNNTkMzeVBrd0h5THE0a2hCNUttVlJRNHhacTdC?=
 =?utf-8?B?NWZOZzB3SWJLd3Z3bDB6aWF0ZkJnQ2wxbzhIOHVrbFRBcmhwU0N3bDVRS3N1?=
 =?utf-8?B?Qm9nV2daTlBEdm56S0oxVGNUZFhyS3RyVGQrSytaS1RWeVYrM2t1NjF1UUx0?=
 =?utf-8?B?NUV0RmFXZVkwOEhRc0lqTEJIRzFueDM2UHpvVVlkeExaQzhDUjVINHEzbDdt?=
 =?utf-8?B?NWNEVkNDZGpPeUNBR2xEZlRsalhQZzM3SFAwRkxmVTFyc0NUdTZURURSZ2lm?=
 =?utf-8?B?c01JNGdONXlxUjBtajBlZkJsVTNIcXhaTVYvSGFkam1IQzRTSTZnTExyTE5k?=
 =?utf-8?B?OXkwaW92ZWQyNWpGV3N0UVRGNmJWRU0vTklCOFMvSmxvZHZyWDZKSXZzbW5k?=
 =?utf-8?B?Smw0Wk8yRERNV1prdXVrRiszNjJOLzhDRlBYNmFCaGg2WDl5WlByT3ovWnNP?=
 =?utf-8?B?YjB6K3ZNOTVyWTV2Z2Joa1pXck9STm51dGlrNWlEMW9McjJQbGYweVRJSWZz?=
 =?utf-8?B?V0lHcmZrY3cvZWx5ZStCWjZWOGxsSHpZN2tCT2tnakhsdTFzTlozTFk2cGQ5?=
 =?utf-8?B?em16ajlsR25CVkh1NHQwQU1QNzZFSDZTQUY5bktJZnFuaW85MDEzSTg4Tkpn?=
 =?utf-8?B?QzVZbFZVTTFya3lHeWVBTVFzMXZDc0huVW9XVENFUTlyUUVuNUpvV3EzMmpN?=
 =?utf-8?B?UkNmY1I2endJS2tvSnB2cmNBVHRDSFhKVTlSUkxqOUVXSHRyUElsYmRhVzhF?=
 =?utf-8?B?WjNGN2M3dUdNbUtCYU0weisyTGR4OE5KTWR1TU5sS1kvODRzVm5QSWFtSmpS?=
 =?utf-8?B?M3dlUHlSU0JlL0RDWUgwM3drVWxWWTNQNUlrVGxMUXhDNDJWbmk4R0tMMldO?=
 =?utf-8?B?WmhPdWlaclhpdTIyMVlyUEhYcTVYMldleFV4WU9RTkxoZVhvVmJwV0RKOEh0?=
 =?utf-8?B?KzN2VzVxTGU2bFFWZlFPWlUyQTU0c1lCL3F5c29OODJXWFhYdHBQbXR5azA2?=
 =?utf-8?B?K0JRSUNEMEJ3cnZWS3JycTJSOWRacmxRTG0wczEvbUNBaXFZcnZERjdmYUxK?=
 =?utf-8?B?L0Y1QWJVaUNXdC9DSE91b2hFNm94b0NGWjdPK2QwTmM3M2I5c0tlbGhJdmt6?=
 =?utf-8?B?cGJLUWduSklOeUdsK0ZKbFZQbEpWeDJ2ckdwcjAwdHZHTm5iV29tY21UZDBX?=
 =?utf-8?B?cGcyc2p0Mys0RzVPanlXSVBDcGxTcjU5akxIM0ZWVmFXNkpsZWJSQmxFNW41?=
 =?utf-8?B?cmVIYWo3cmhXUE1DK1h6Z1FCZ2JoTWJxbjlyNzRhbVo1VmM4dEdiR0c1YU1t?=
 =?utf-8?B?MjFlc2lUV0l0aCtmUWJoWEs0MDhlWjVZOVJ5bDlTZzRKTmhoTXBLSzRjWjJ0?=
 =?utf-8?B?R0JoQS9Ram9VckZ5MHc3ajNXS3l2eEdmcXJJaDBKd3lucVR3VDFjY2FMSXFX?=
 =?utf-8?B?US9pamhJcWdvQ1hZSU1wM1pEenIvTjdvVSs0cnRMcU9ZeEFvOU50cDQ0Uk5Y?=
 =?utf-8?B?MkNHVXJFeVVqMld5ZWlQMlJiS3NkTm5iQmZRWkxBTmtJY25kam9ibEJLa0dt?=
 =?utf-8?B?Y3YvOU1JOUtEdXp3bWdZQmJNQzVYVTk5M3FpUE5WbTJzUDhRTDk1SHdyWWFt?=
 =?utf-8?B?bHJkMHVSM3RXMjZkZlc0VlN6eVp2RkMyaWNjekk3UFU1SFBwdDFqelVLSzBI?=
 =?utf-8?Q?Bth6yxUiO9LNh1wm0mz8l0E/feAHKYkVjU8qs=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TlUwYnlsUE5wVWZGeEVtbHRCcUF3eDV6MExqbGNIbGViMG84V2xHZGlSYzZ1?=
 =?utf-8?B?QUVMZGFEd0ZEbWx1VjUxblppRDVJZTJaakl2dklkM2dNRGZyUkxlUmRXV0My?=
 =?utf-8?B?U1Fvc1RycUhXRElTdnVLR3ZVN01yc2tBNm0vSDNWQkV6SVFoWkNEMEEzQjU1?=
 =?utf-8?B?UUk1MmNLQzV2WlhXaHlTc291emtNN2NwQndxWHVGMFM4YmVBd1NFVFhJa2FE?=
 =?utf-8?B?NWttU1R3b1UreWtyay9nbUp3U2hvWnMrd1NsRGFsMkdGMExxRGsyTjNiYXdO?=
 =?utf-8?B?VWtiMmJIQjIwRGl6T3pwRFBaWW80SVlBR2lBbWpuUkJFb2tTSHo3UnkvdHF3?=
 =?utf-8?B?MEZKT3o2NGxKZ05tMzhkNTVKMjJoMlIwUjJWNmtkZEhHb2pMVUNnYWRGTStM?=
 =?utf-8?B?ZGIxOGxEbVpsa1poNDU5ZFlrSllRWUJoNUFDMHgxQ1VlSUlVNHJWLzN3WVA2?=
 =?utf-8?B?VGttb3YzWXhiZzVHbmphRHkxTjRvR0FkeHFlejhpTnV6aG53VkR1a3pjeTF6?=
 =?utf-8?B?MnkxbFhCTXJJR0NjRklHZHFnNmZ3bHA3QnEwdjl0MkZIaEZZcnRGbjhrT2xB?=
 =?utf-8?B?MUlCNGJ2Tmlpb000d2FtUUtyQUdYZEwyemxuRXcyelRHbzdoZ0RVUEZaTnpE?=
 =?utf-8?B?aTlFdzdCUndROTlJSk8wajg2NWlIRFkzVVpnN3EvZDJncnZNcHBBTU1wNUNO?=
 =?utf-8?B?dWlkelBJRVFtUWpjS3A1Yk8xQUNiSUNlYVh1VFpVUTlEaHN2R2xzdXZ0MU9G?=
 =?utf-8?B?N2pmaHJONTRkV0p3LzhIMHIxQXpxU3k1aktNcEZsNjQzK1gvVGZsSDJnQlpS?=
 =?utf-8?B?UUlwMVRLNWF4R21LbDlZVkVXYXVZODBLbWNzRDVXNFlTTGF6aWN0eU94c3JD?=
 =?utf-8?B?NHI2Qy8rS0JEV0MybXVWVms5UElyQWZRSWF6aSt1WGNheVZJdWt6WCtKaW52?=
 =?utf-8?B?dEhPeFBhRWZBV1c5RWxFdnpDT01DcWlTa2dwbFRYWWRFbW1tL0hxQlRjQVd0?=
 =?utf-8?B?Z1dSR25jeTYzcnRQUnRZR20vZVc0MWRUcHpyejBlWFNFUEg0cmUzOVJ3a3NT?=
 =?utf-8?B?NXFETExUT29HQldzQ29qd2pWWkNtcFdzSGUrc0ZRakd4M2pVV3hYSmcyMjV0?=
 =?utf-8?B?S3RweGhpT25mdGlnSnhrNzJ5NUpxU2Y2djRZVXJ6TXA3K3lKM1Z5RTVsVnVM?=
 =?utf-8?B?MHFZcDJ1cUJpTUVYT1JGNW5QTlViQjhrMldBU1llaTVxWXRRcW1XaU5uZjdm?=
 =?utf-8?B?bzAxUHFkT0tQQWFDNEkyc1dhc3RUdGlVM0lxQldEb1BnS0c3c1pTeUdJRUJM?=
 =?utf-8?B?cC9xYmZPVW82S0ZTTFJabHZneVpNMGNLZ2ljQ2VpTnd6N3gvREFyMUdQVG9u?=
 =?utf-8?B?TjhCenY2V0M3Q3hqUVNxamZHa09aNmpiUnN3TGV5TFltYXBEQWJVOW9RUmlC?=
 =?utf-8?B?SFdRUXdkMTk1eWNFVDNTK3NiemJXTjFzckh6UjYrWTNTRUxEVXh3NCtJcC8y?=
 =?utf-8?B?bmdkRW5CU1J0Q0hWVFlBOVhobHNJWGNSUGpvUk5leHVhL2IyRjVZRG85Y3hq?=
 =?utf-8?B?WUxxZHk4aWc2SUZFQkd1dVo2dzZWRXF4c2xwdm5yRTVHVTNhc1FGZVZocnZo?=
 =?utf-8?B?QldyVVA2dlFrcm4rK0xhcm1XVGNGWGFoeExWb0lxVmh3bXlIUHZSVXF0Nk9w?=
 =?utf-8?B?a2xiQVYzWmdOVGZYeVFyT3IwWjB4ejhBdEovY1ViaXRlQ0lkck5jVlNuL2Ni?=
 =?utf-8?B?d2J2bU43TXpFZk1XWVNMMmVTMWRxOU9oa093blRpRUlyYXVBc0pWSVVIT2gz?=
 =?utf-8?B?Y0NodjZ0Z1VvOTB1VXlmdExhODhKLzh6RmE3UGxLV29NSU43SEQ0eDJUc3NV?=
 =?utf-8?B?SkZsTnJNRGs3NmpFdHVTTG9RN0dEdzBWV2JRRWVlUkI4clBxM2ZJMjlBY2Nx?=
 =?utf-8?B?ejdseXNGa2RwNE4rdWlZK2R2bkZFcHBkem13VnpSaCtTaXQvaDVNc3dHSkpL?=
 =?utf-8?B?eUpRSGZ6dnlLOVNsZU9iVU1mQXd0ZDQ2a2VBT1VPSzZTaXlvWUFWd0NpYW9M?=
 =?utf-8?B?RXdheE0zMVNudXFyTTFPRlgwVkpIdVhTSFVxNVRYMnVlSnNQRG1pSGZVMkU3?=
 =?utf-8?B?UjBHQUtLbmoydjFyNHZkVUpWOEtKTUNNYThvdHZOTHBwVHRyTWwxTVdUV084?=
 =?utf-8?Q?En9VZbIu8ubtB1dceArK4O8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <58A3C05645A3D846A64DCD6E122EC814@EURPRD10.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 31382e88-e35c-4d1c-ebe4-08dd0e5d3aa7
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 20:59:33.4770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VOdlDSYatUu7ko67FxfIMUwPSofPqca0zQnBl+dJsqahFlYbGsYcN/CTk8SZLsl8+pOX53Ju/CqmMQeE/BFdgUW7hIAP1efWmCtcNdGuaY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6661

SGkgQmFydG9zeiEKCk9uIFR1ZSwgMjAyNC0xMS0yNiBhdCAyMTozNyArMDEwMCwgQmFydG9zeiBH
b2xhc3pld3NraSB3cm90ZToKPiA+IEBAIC02NDcsNiArNjU2LDEzIEBAIHN0YXRpYyB2b2lkIG9t
YXBfZ3Bpb19pcnFfc2h1dGRvd24oc3RydWN0IGlycV9kYXRhICpkKQo+ID4gwqDCoMKgwqDCoMKg
wqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4gwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBv
ZmZzZXQgPSBkLT5od2lycTsKPiA+IAo+ID4gK8KgwqDCoMKgwqDCoCAvKgo+ID4gK8KgwqDCoMKg
wqDCoMKgICogRW5hYmxlIHRoZSBjbG9jayBoZXJlIHNvIHRoYXQgdGhlIG5lc3RlZCBjbGtfZGlz
YWJsZSgpIGluIHRoZQo+ID4gK8KgwqDCoMKgwqDCoMKgICogZm9sbG93aW5nIG9tYXBfY2xlYXJf
Z3Bpb19kZWJvdW5jZSgpIGlzIGxvY2tsZXNzCj4gPiArwqDCoMKgwqDCoMKgwqAgKi8KPiA+ICvC
oMKgwqDCoMKgwqAgaWYgKGJhbmstPmRiY2tfZmxhZykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGNsa19lbmFibGUoYmFuay0+ZGJjayk7Cj4gPiArCj4gCj4gQnV0IHRoaXMgbG9v
a3MgbGlrZSBhIGZ1bmN0aW9uYWwgY2hhbmdlLiBZb3UgZWZmZWN0aXZlbHkgYnVtcCB0aGUKPiBj
bG9jayBlbmFibGUgY291bnQgYnV0IGRvbid0IGFkZCBhIGNvcnJlc3BvbmRpbmcgY2xrX2Rpc2Fi
bGUoKSBpbiB0aGUKPiBhZmZlY3RlZCBwYXRoLiBJcyB0aGUgY2xvY2sgZXZlciBhY3R1YWxseSBk
aXNhYmxlZCB0aGVuPwo+IAo+IEFtIEkgbm90IGdldHRpbmcgc29tZXRoaW5nPwoKQWN0dWFsbHkg
SSB0aG91Z2ggSSBlbmFibGUgYW5kIGRpc2FibGUgdGhlbSBpbiB0aGUgdmVyeSBzYW1lIGZ1bmN0
aW9uLCBzbyBmb3IgdGhlCmZpcnN0IGVuYWJsZSBhYm92ZS4uLgoKPiAKPiA+IMKgwqDCoMKgwqDC
oMKgwqAgcmF3X3NwaW5fbG9ja19pcnFzYXZlKCZiYW5rLT5sb2NrLCBmbGFncyk7Cj4gPiDCoMKg
wqDCoMKgwqDCoMKgIGJhbmstPmlycV91c2FnZSAmPSB+KEJJVChvZmZzZXQpKTsKPiA+IMKgwqDC
oMKgwqDCoMKgwqAgb21hcF9zZXRfZ3Bpb190cmlnZ2VyaW5nKGJhbmssIG9mZnNldCwgSVJRX1RZ
UEVfTk9ORSk7Cj4gPiBAQCAtNjU2LDYgKzY3Miw5IEBAIHN0YXRpYyB2b2lkIG9tYXBfZ3Bpb19p
cnFfc2h1dGRvd24oc3RydWN0IGlycV9kYXRhICpkKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgb21hcF9jbGVhcl9ncGlvX2RlYm91bmNlKGJhbmssIG9mZnNldCk7Cj4gPiDC
oMKgwqDCoMKgwqDCoMKgIG9tYXBfZGlzYWJsZV9ncGlvX21vZHVsZShiYW5rLCBvZmZzZXQpOwo+
ID4gwqDCoMKgwqDCoMKgwqDCoCByYXdfc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmYmFuay0+bG9j
aywgZmxhZ3MpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoYmFuay0+ZGJja19mbGFnKQo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrX2Rpc2FibGUoYmFuay0+ZGJjayk7
CiAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCgp0aGlzIHdvdWxk
IGJlIHRoZSBjb3JyZXNwb25kaW5nIGRpc2FibGUuCgo+ID4gwqAgfQo+ID4gCj4gPiDCoCBzdGF0
aWMgdm9pZCBvbWFwX2dwaW9faXJxX2J1c19sb2NrKHN0cnVjdCBpcnFfZGF0YSAqZGF0YSkKPiA+
IEBAIC04MjcsNiArODQ2LDEzIEBAIHN0YXRpYyB2b2lkIG9tYXBfZ3Bpb19mcmVlKHN0cnVjdCBn
cGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIG9mZnNldCkKPiA+IMKgwqDCoMKgwqDCoMKgwqAgc3Ry
dWN0IGdwaW9fYmFuayAqYmFuayA9IGdwaW9jaGlwX2dldF9kYXRhKGNoaXApOwo+ID4gwqDCoMKg
wqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGZsYWdzOwo+ID4gCj4gPiArwqDCoMKgwqDCoMKgIC8q
Cj4gPiArwqDCoMKgwqDCoMKgwqAgKiBFbmFibGUgdGhlIGNsb2NrIGhlcmUgc28gdGhhdCB0aGUg
bmVzdGVkIGNsa19kaXNhYmxlKCkgaW4gdGhlCj4gPiArwqDCoMKgwqDCoMKgwqAgKiBmb2xsb3dp
bmcgb21hcF9jbGVhcl9ncGlvX2RlYm91bmNlKCkgaXMgbG9ja2xlc3MKPiA+ICvCoMKgwqDCoMKg
wqDCoCAqLwo+ID4gK8KgwqDCoMKgwqDCoCBpZiAoYmFuay0+ZGJja19mbGFnKQo+ID4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2xrX2VuYWJsZShiYW5rLT5kYmNrKTsKICAgICAgICAg
ICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5eCkFuZCBmb3IgdGhpcyBzZWNvbmQgZW5h
YmxlLi4uLgoKPiA+ICsKPiA+IMKgwqDCoMKgwqDCoMKgwqAgcmF3X3NwaW5fbG9ja19pcnFzYXZl
KCZiYW5rLT5sb2NrLCBmbGFncyk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgIGJhbmstPm1vZF91c2Fn
ZSAmPSB+KEJJVChvZmZzZXQpKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFMSU5FX1VTRUQo
YmFuay0+aXJxX3VzYWdlLCBvZmZzZXQpKSB7Cj4gPiBAQCAtODM2LDYgKzg2Miw5IEBAIHN0YXRp
YyB2b2lkIG9tYXBfZ3Bpb19mcmVlKHN0cnVjdCBncGlvX2NoaXAgKmNoaXAsIHVuc2lnbmVkIG9m
ZnNldCkKPiA+IMKgwqDCoMKgwqDCoMKgwqAgb21hcF9kaXNhYmxlX2dwaW9fbW9kdWxlKGJhbmss
IG9mZnNldCk7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgIHJhd19zcGluX3VubG9ja19pcnFyZXN0b3Jl
KCZiYW5rLT5sb2NrLCBmbGFncyk7Cj4gPiAKPiA+ICvCoMKgwqDCoMKgwqAgaWYgKGJhbmstPmRi
Y2tfZmxhZykKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNsa19kaXNhYmxlKGJh
bmstPmRiY2spOwogICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eXl5eCi4u
LiB0aGlzIHdvdWxkIGJlIHRoZSBjb3JyZXNwb25kaW5nIDJuZCBkaXNhYmxlLgoKPiA+ICsKPiA+
IMKgwqDCoMKgwqDCoMKgwqAgcG1fcnVudGltZV9wdXQoY2hpcC0+cGFyZW50KTsKPiA+IMKgIH0K
PiA+IAoKQXJlbid0IHRoZXkgcGFpcmVkIGZyb20geW91ciBQb1Y/CgotLSAKQWxleGFuZGVyIFN2
ZXJkbGluClNpZW1lbnMgQUcKd3d3LnNpZW1lbnMuY29tCg==

