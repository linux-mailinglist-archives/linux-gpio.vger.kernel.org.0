Return-Path: <linux-gpio+bounces-18477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BC66BA7FA43
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 11:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3275B1883101
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 09:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8C7C265632;
	Tue,  8 Apr 2025 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="CbYZSFHt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on2057.outbound.protection.outlook.com [40.107.247.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F7D265612;
	Tue,  8 Apr 2025 09:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.247.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744105602; cv=fail; b=kU3NKMVW95OviiScgUd7V9GgpvFzISbea+HiE71b0SNQUkATpH8QyewOPLfzAw7voWswqXFNTuHdfsqxg8E1WSjuaA0nrlBVv0T7iXFRDjYT/ekakSW/ZtgYYyJTRjXDRIqDyQrvSJ5Qg/OPf7ZP0eWQwn2UZAz+D0vDABOyZ0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744105602; c=relaxed/simple;
	bh=BH7xPxTEps6Iw803U7LlBNilX0cZXY0izTunp/LrMBI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PbBYEcpRUPLZCKh5OoXqEcVIOgskHPEPYZ4aVf6W5XaGymUT2n9+8e+cSew+0srbDVUu/oExjd8XoCmnS5aLqzEzwqQNJhwX0bCnghb5HpsjWpSu/Ktw9C83lsz0PWT8qiwNnbkAlJ7NOsjAMDUtjTrTZFzb8ojf2SDGl/5MFS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=CbYZSFHt; arc=fail smtp.client-ip=40.107.247.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QPtwd25BA7NzGwBESgE0aPv14FpWIP8km/YYaemo/yUcnDGRUamBCJNucMN3qmAJmoX2dP5pVw+5ZfSOBY8Z22gJ6thgWik8DcDehyReb7tF0IhpjaTjN84YNwEUBJynvhQ86UVd8RRYLJ9MuVwcA/FrdECvvdnhF781KoaWfZnDVhW9Kti/hnFhuzGSJymgrNxECVi6iqlOMwxLkDgz+uTGuSF+a4EG1R/tqm4H+SjR1+0FeAM42GAPqCQujClCeAvN/c5MHc/T0YMOyjDgrPXsMBmMWK6j199B/piH4PQ+rqxoNt62sYlVEBJfLXbBz2xFOzB6T8KZFDhkFkoiqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BH7xPxTEps6Iw803U7LlBNilX0cZXY0izTunp/LrMBI=;
 b=ci0+SClbi4Y9zjo+yaUoIXS+p5WkuCZbd1L4cqd2L9/+JpFvONzQ7U86anTlUl+7l6nKo76Uhklkxad2hRrHcuAUw4fRq8OM0MZLbEOPXEOM4FHZW7S0W03oKyPbucW8GIh9X2Fg7+tcnJxigGXQSpv8Iaqo0KeXIQTsDWkdNO9gwBUZx27S/kThH/oi2TQCm9ATA9nNmzm22JGHPXHQ7fRBjZFA4YJXMkh+lbCeHLhaWVo5TGIe00G5f6zJ1DDT6DLCilBGRBI4czMkp1j203Vu9BJnXkseD27Rp/j3m6SyoAisvegKfw3pzhNnrdJnSwdlZ45CIHCK9jHUhaX4Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BH7xPxTEps6Iw803U7LlBNilX0cZXY0izTunp/LrMBI=;
 b=CbYZSFHt78sVZ/7OIuRs8hjG7KUgY+dOdOL8RM8qV1RJ9lXf7DnoKxpSDPYyclJFmKrb1b+jezR9qNUVr5Z+HVKhJw9gxKzzPfiZro9pZ6JnvWj9vg0LoMUzD+m+rgl6eWO6HZnmjQmAvTEO2mLMSB3x9stA4l+X7xfdR6fTnyoEWRJYmzGVptQjbDQ+HHILlRmqfyuyDRlmuuF3mUGfiMxPAAEeYI4WkutRLk7x+4TV/IQ+StXxFTEDYgT+SIBSXxy7/5OUpNAWz2tQ/MU/8pazAx3jgYIbMbM/qi1w/wMmRFzEQN1HqIOLTRuLaSufkIzDmn73Jc+exSZFkm44yA==
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com (2603:10a6:150:27::9)
 by PA2PR04MB10373.eurprd04.prod.outlook.com (2603:10a6:102:416::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.33; Tue, 8 Apr
 2025 09:46:37 +0000
Received: from GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::f8e8:b04f:49bf:f636]) by GV1PR04MB9183.eurprd04.prod.outlook.com
 ([fe80::f8e8:b04f:49bf:f636%4]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 09:46:37 +0000
From: Jindong Yue <jindong.yue@nxp.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: Re: [PATCH] gpio: vf610: Allow building as a module
Thread-Topic: Re: [PATCH] gpio: vf610: Allow building as a module
Thread-Index: AQHbqGsfE6G3R8f16Emw9TlMffk1fQ==
Date: Tue, 8 Apr 2025 09:46:37 +0000
Message-ID:
 <GV1PR04MB91836DE75CB528C1B9CFB8ADFBB52@GV1PR04MB9183.eurprd04.prod.outlook.com>
References: <20250408082031.582461-1-jindong.yue@nxp.com>
 <CAMRc=MfuHs=7vda2CaMzHfVDXe41TV3u3ezPmt38xJ9=8JD1sA@mail.gmail.com>
In-Reply-To:
 <CAMRc=MfuHs=7vda2CaMzHfVDXe41TV3u3ezPmt38xJ9=8JD1sA@mail.gmail.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: GV1PR04MB9183:EE_|PA2PR04MB10373:EE_
x-ms-office365-filtering-correlation-id: 1eff1031-634b-41cb-e394-08dd768241b8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?c1NzVkp6bjYzVGxtbGlOU2k4dzdIVm9GbFIrNTJFdjVwdlFndUJRNzhZd3dn?=
 =?utf-8?B?aEJrNHdxZkl5OWIydTFWSE5vaWtQWmtmK0NGMG5mY0lKQzgwaW54WHZNK1BR?=
 =?utf-8?B?L3BoWDlDS0dObVVNclJ6TXM2ckVld0YwSy92K09oakRISXVGUXJVc3pWVndw?=
 =?utf-8?B?QVFzbkNTcUhIMkNlaSsvV3lhcDFYN2pNcCt6Vk1rZ1JGUFJMV2JFNW9PWjhj?=
 =?utf-8?B?M2ZtdGNvd3RrZWF1MGpnbnh5eUNITlJlZ3RYS3AwR2pPblV4TlVKaHdrZ1dv?=
 =?utf-8?B?UnBxbTEvWXY5SEIxUlBjUGp3SDdvYjdELzFyNEQzOWJBRStIYWkzZXgveDJD?=
 =?utf-8?B?OTRONStVTFpaQ3lmYTc0SUxwMWRqcG1xc01Qdk9SaGtuUUpuSDNDZGs4RCtG?=
 =?utf-8?B?NElmSTM0MzVtaEk2WTU2b3RvSi9tUjVhMHg5dU15czNuckp1cURWck13czlS?=
 =?utf-8?B?Wk1wcWx2RmlJR1J5dENESUJQOTgrdFZUeXg2b0lZUXhmcFlTcGtnS2RTTEVY?=
 =?utf-8?B?RUNXdURaTjlzbWQ5U3N6UEUwM3l5YkRzeUdWQXh1b0cvWVVSTFExQ3k3TE1F?=
 =?utf-8?B?SllGWXlsUGZncncrRFl6ck1TdE5yNFVXN1F1eGlIcWsvTXptUHZoOW5Sc3dF?=
 =?utf-8?B?bnVrbWx3Sjhxc2gvQzhkcmR4Tk1BK0gwd2JtNFU0aVVmckRqSURKcnBvWWRh?=
 =?utf-8?B?OVV3L2FsbElzWll6YWxJWHpMZUpBQm80b1NmUjdPZytnMnlrWmhEc09QNE9u?=
 =?utf-8?B?aUhpcFZJNnR3VXdVQzlqWHFRMkdoQmZRM0NiWTVDUmc4NWpxY0crTThQVVhi?=
 =?utf-8?B?Z0JHL3VUVFJ4Yk94R0Q2ViswOXZ5V3FOWXZVNkYzblRobjZjaHdHM0hQcFRZ?=
 =?utf-8?B?NVZJUmlJMDBWTVRocUZlYU5hQlpJZ0YwUFFEelVGV3R1dEp3QXBjaWtXS1Qx?=
 =?utf-8?B?aUJ2b2FXbFdLVlBhUFVFSzBRRVhaZXlzdzNZVHFJeitQNlp3bGorZWwyL2ZM?=
 =?utf-8?B?Y0xzWHFQcTFmU3ZSVUt0SkJtUi9lZUFrZnpVRnFsdVRIZVBBbDJYKzZGWU45?=
 =?utf-8?B?cU4wY2RCZWZtTEdrS1YyTEdlN1JHOElmUENXa2ZHSE0rbHMzckpIUTQ5WEZu?=
 =?utf-8?B?b3Nwd2FDalNUSXJ3cGZ2ZSs4d1gvemdYN1FXY0ZDYUhxMU5UeG1KQVVWQ2Ur?=
 =?utf-8?B?SThqdTRPQUE2MnVjTUt5YkZEazJzQ0RwMnpBNEpvYWxmd3JIV0hqTHV1Q3dO?=
 =?utf-8?B?TnBhclUrUWFGWVJEZ205OGVRNUtUZVM2WDJYTlBRVFNrQmo3NUtETHoyakpu?=
 =?utf-8?B?SkhEYWpWNWc4UW5KVVduSFBLWXhKYXB6VkhMd1BNa29RbUhOS2c0WldzamZJ?=
 =?utf-8?B?YldRV0c5SHdWQWJpZ05oRUFwUlRtc0Nkb0U0Yks5Ym5MZ1RRWGM0UHp3V3ZH?=
 =?utf-8?B?c1czU0tablBxWFVUWTlKVmdLMGlXOTJMOHFjT0VqeWdiVHcxUnZuUXAxSzV5?=
 =?utf-8?B?c2VDZGNlUGdaY0VmczF2b3lvR3JJNCtpVG9yc3RMWEppTFd6amhPUHlkWmVo?=
 =?utf-8?B?YVZxb1ZUbFNzVElGcjBtVkg0YUdPL0lleUZCT29mYnE2TXhjMHVEMkR6Wm5l?=
 =?utf-8?B?SmxlRXNkMU9LME4rQlN0VUhVdkZoc3lLRmxXVjlVa1pSMDl3UDJ3YkZrQ2Mx?=
 =?utf-8?B?ckhIR0pPZXFXQnJwWGZ4cnlsQzdxSlk3T09CQTJSNDRkaGpnSGpVT2ZaV3R6?=
 =?utf-8?B?eHh4NmV2amlUV21UL2RWR1dSTEZsbnFDb0pLQUNJdkEvbU1KMGZ1M2JIbUZm?=
 =?utf-8?B?ZFRJZnd1QU5MaElWQ3RNNUhCZEg5VEptcUdXdjRyQjRWRHJJUk5HNzJ0Rkg1?=
 =?utf-8?B?dmlQckNJaUVSTmR2SFlFY3AzNVhRTTJNK2dOdjhvWG5hL1djcWtrcVV6cmgr?=
 =?utf-8?B?VVIvRFhiWHVaNjJyMCtzSERDcEpxVlNFajNrTzlVeWRRbmxPSFViYjQremhU?=
 =?utf-8?B?dkg3YXFsWGlnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9183.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?N2xtVERMZlZXWXBDcjZreGpKWTNlRG1nYUpwRmpEZDloNkh5Vnc0QzY3Zmdx?=
 =?utf-8?B?TE1CR0pKTElxUlo3cWFueStVQ2dBYUhhdFM3UlFrbzN4VzF6bnl5SkgzYzl3?=
 =?utf-8?B?cDdsWTdSR1RsMlJ6NVc4YjBDc3lWUVlLT3hYcGh6a0lJck9laDREYnhCVTVr?=
 =?utf-8?B?N2dZNGxPRVNLdnhXTWhCNG9tVlFTVzhWcWNpZWNDcWhnN2hKckNSNWdtRGZG?=
 =?utf-8?B?eHVSYWJjckZKa0xoRkptdTd3WGJwT3lxV1NKMUdzVC9OMUprdUQ5ZmZJSVdI?=
 =?utf-8?B?QXEvbElkZE5iYnQzSStwZGR1N3JNdjFYTjNha2c3ZW5HbWE5Nm8xR2FnVGo3?=
 =?utf-8?B?YnRVanQ3TERjREozM2dIWlBWT1N1SnNsdytlblhqbGpKY2dLSUpBbGU4UDM5?=
 =?utf-8?B?Yy9Kd2ZVRnVZeFlPY0ZTQzhnRnYwVnoxWENyUDIvOWgwUWNLMVhLWFMwczFy?=
 =?utf-8?B?L3NrT1IzblhpdDl0blp0cTRtMVZWMmdUbVpYRGw3am9LQUYvREpra2cxVFo2?=
 =?utf-8?B?dWl3eXBTWnE1anRJNXh5d2lEYjlwSHN4MGh3THJZS3hvRDgrRkxjUUFMWlJL?=
 =?utf-8?B?ZGwrYnRsdjNKdWtaUGNVOThWQnR5UkluV2FucEl4QnhMbGdCRWQxNlBHaUNG?=
 =?utf-8?B?YlYxU2FEZkt6NjZCYk1EOGZwK3JhcEZQanlTd2N3b0p5NUFGSFRBZHZNOGFL?=
 =?utf-8?B?WFVmL1o4Uno2SnN3RFZZNzJxbzVmcXpmS2YwVzhvSWNtZGY5WVNqWWlkNmVY?=
 =?utf-8?B?Y1NLcDE0STlyZkRKeVp2Ums1OXZLQk9yWlp0L0FsSXlvVkx2bkoyT3NTVytR?=
 =?utf-8?B?Wmk1UVA2UHNBcHYweWdGNGhIZzFZakc4MW81S1Z6dC90bDlTUFVWNXlnc0Uz?=
 =?utf-8?B?L1hZRUdFU00rU1I3OGVCdVIxY3Y5ZllTbDFRTE1UQWM1bTBxc3A0eEoyNVpL?=
 =?utf-8?B?UmxOdldmNzJjVjJIMnBNTXZSb0EwMmxobjlaQUZLU2pvaXZpU3lTbTNPeUtS?=
 =?utf-8?B?RkJ2ODl0OFhTaFF6T2ROL2ZzSC9pQ1BvaEJ2Y1AwTFcxdUJ1L0FVYVNMRkY0?=
 =?utf-8?B?aDlXYXNJZXZXSzhnbXFjRExHUzZBajlyNGpMbTlOSGtqemRlbUV1YWplTU5a?=
 =?utf-8?B?b3pNcjM0SkZhaXBCM0QrQjZtRmJ2ZDA5VXhtLzJLZWdNU0pTSE8wNnhVY1RF?=
 =?utf-8?B?bUVmK0Z2NUhGVzJ6VHNUdTFUQzhaVDlGdzdiZ2d3dXJxd2JVSUFBUWNMa01R?=
 =?utf-8?B?WEI5eDJHRnRwNXkxRHRvK04wSURzakVTMTVLclNvOFRVZXE4TGY2NDJDR3lz?=
 =?utf-8?B?UUpydzVrbW9SamozMlN4akR3Y01QZDJPeVhBUkMrdWY0WElwdW11eFprNHNq?=
 =?utf-8?B?UHpOOUI2NHQvN0VIMTVXS2poZHlrRCs0SWN3eUp4NWxIaklBT1czUFIxU1gr?=
 =?utf-8?B?aGFTaXpOZE5kMmlJZEoyNWxDa3pUZUx4S0dCNDBndXVUendJQnpYUUdxVFpU?=
 =?utf-8?B?aEkyY04vck9zNXhYdjBIOHB0RmRXMXM3OVh0dUlsYTFiTVQwRnhLWnpXeW9s?=
 =?utf-8?B?YVN4RGxWOSszelI5dGdjejhyV3ZBQjRxM3ByNHRWbkg0N0tWREhhTWN5eGsz?=
 =?utf-8?B?ekROdXkwcEVzTyt2OGZOUm5NNTNKdi8xaXNPNjhOQ203Q05jSXpkam5NZmUz?=
 =?utf-8?B?Q1ZYdVFkczN1YTF5MDkxcHVGYmRFZDVDdllsbXBtZWhHdURLYWxTd1ZacWFH?=
 =?utf-8?B?WXhUektla2kzS2RLWVRnNTNTRlV0RytEV2Fqd3VnaE5LanRJMm9XOEVyZWNl?=
 =?utf-8?B?WmE2dWRBbis0SFQ1ZW00UjZpZi9WcGNmMWdiSkJLUUFhbHVmYlNmRUtRZ1gz?=
 =?utf-8?B?ZUNhblJ1VkQ5NCtMVjNyZWNCUm5KUmFLUG1zR1JOTXVsek9LSVJ1MTVQWXJ0?=
 =?utf-8?B?QmtVVnFURll3U1Vvd2xGZ3BJWktxcEV6dVBOdzNyZU1FQjdxSmRycUdGYko4?=
 =?utf-8?B?b2QxT2Q0VzBPakFqTm1KR28xS0JZWThGV2U3L3l5dXlDd3pZVGhLMkIySWxQ?=
 =?utf-8?B?Q2V2RExUUnFKQlM1WlRTejJSeEF4MEdQN3RmdUZ1YllOSTVQOVg3TEJiOTdw?=
 =?utf-8?Q?X60jLzjKONo9DMkOs6sAO/jG3?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9183.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1eff1031-634b-41cb-e394-08dd768241b8
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 09:46:37.6923
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: giHyTEAOQ0mgDhSoY/BRjRhCHCMtWady8gtIPoux5CP6FiMYq82yc381Q9Z2GCZvQi/kc1VhJSjVc/8cMWI6Tg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR04MB10373

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBCYXJ0b3N6IEdvbGFzemV3c2tp
IDxicmdsQGJnZGV2LnBsPg0KPiBTZW50OiBUdWVzZGF5LCBBcHJpbCA4LCAyMDI1IDU6MDYgUE0N
Cj4gVG86IEppbmRvbmcgWXVlIDxqaW5kb25nLnl1ZUBueHAuY29tPg0KPiBDYzogbGludXMud2Fs
bGVpakBsaW5hcm8ub3JnOyBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsNCj4gbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBbRVhUXSBSZTogW1BBVENIXSBncGlvOiB2
ZjYxMDogQWxsb3cgYnVpbGRpbmcgYXMgYSBtb2R1bGUNCj4gDQo+IA0KPiBPbiBUdWUsIEFwciA4
LCAyMDI1IGF0IDEwOjIw4oCvQU0gSmluZG9uZyBZdWUgPGppbmRvbmcueXVlQG54cC5jb20+IHdy
b3RlOg0KPiA+DQo+ID4gQ2hhbmdlIHRoZSBjb25maWcgdG8gYSB0cmlzdGF0ZSB0eXBlIGFuZCBh
ZGQgYSBtb2R1bGUgbGljZW5zZSB0bw0KPiA+IHN1cHBvcnQgYnVpbGRpbmcgaXQgYXMgYSBtb2R1
bGUuDQo+ID4NCj4gDQo+IEkgY2FuIHRlbGwgd2hhdCB0aGUgcGF0Y2ggaXMgZG9pbmcgZnJvbSB0
aGUgZGlmZi4gSSdtIG11Y2ggbW9yZSBpbnRlcmVzdGVkIGluIHdoeQ0KPiB0aGlzIGNoYW5nZSBp
cyBuZWVkZWQuDQpJIGFtIGJ1aWxkaW5nIHRoZSB2ZjYxMCBkcml2ZXIgYXMgYSBtb2R1bGUgZm9y
IHVzZSBvbiB0aGUgQW5kcm9pZCBwbGF0Zm9ybSBiZWNhdXNlIHRoZSBBbmRyb2lkIGtlcm5lbCAo
R0tJKSBkb2Vzbid0DQpjb250YWluIGJvYXJkLXNwZWNpZmljIGRyaXZlcnMsIGl0IHJlcXVpcmVz
IHRoYXQgdGhlc2UgZHJpdmVycyBiZSBidWlsdCBhcyBhIG1vZHVsZSBhbmQgbG9hZGVkIGludG8g
dGhlIHN5c3RlbS4NCg0KQlJzDQpKaW5kb25nDQo+IA0KPiBCYXJ0DQo=

