Return-Path: <linux-gpio+bounces-26759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA7DBB2AC5
	for <lists+linux-gpio@lfdr.de>; Thu, 02 Oct 2025 09:15:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E1DF3A6371
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Oct 2025 07:15:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9CD2BCF6A;
	Thu,  2 Oct 2025 07:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Yp4kaWoE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010051.outbound.protection.outlook.com [52.101.229.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EAB2BE641;
	Thu,  2 Oct 2025 07:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759389315; cv=fail; b=TfCOp2tktmp/YwimckVoIdXEvL7v3rgGDaTZMD48QEWOnYlsCJ09s7tATiCQdaeWzEKLdy5r4CIRQfMjTKEcczMRNl1Fxh55Of3P0YzrB/xEGIqH9wmW+wL4dzvoY8Kuf1DDnuv/+y7ZZ29SeLOFEQ5TuE9QpuMcTeO5UrfSrCg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759389315; c=relaxed/simple;
	bh=Gz+3Y/Y2mGMpEm3o3YFZF9JUT8MH4XZrsjJGGWhtB2k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=BIZY5phR03zx06G4tu293JB0mAEqadQum8DyI2yt/26XCpYXZkR2SY5ue8mSshAP9/VHBLpPf9di9otUMBKKmLGpLWnpW4hjdINul0R8DKqtdL4ljCCGVc78zK22t9Spj8VjYX4lJ3DaS9JVmplX/Kmn3Bd9bUaAjjEZDnnYuKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Yp4kaWoE; arc=fail smtp.client-ip=52.101.229.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sbpMKTvDDFlc+xN66SX4/H4kUjmSG6R4h8coltUQ2blnpBmeuzdS2Gj3VL/hAGTuGBNpeC+oFLsIQEFjqLk7rz7yG2Jg5XkWGxDH1ULz3Fz6NG6t/5w2YSvjRDnYdXKaowXJAZYy/d03bCvcJMpKH+MN4fV4eIRHWjQ+qIuP+KfMuKeNhI0A7jEq0KM4gYaI54bWqURFHwAMu4x56FOs/FR5ZHDJgCELD5tUE+ws8TwpST9xbaDI3JjYQ2nw3hfwuhAeFZUSM+4eoWMYaMpDzukWWX4ngMidJTVPZ2O+EREpYKHVt3AAStGKdtBlTYT9NepVxRNtldh9agDazO+eEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gz+3Y/Y2mGMpEm3o3YFZF9JUT8MH4XZrsjJGGWhtB2k=;
 b=VASJqxwF0tfY4xTirS/Mq5xEm/xCvv0rRiD5/YylwC4AAcdvPXOtEQbceQ/oaa5jgFNMcVRaZBXZUo83OyN8WI2jyN5M+QHJ9G4uuBc9QXYu9UPASfH2YniRBW5wgyDZSMbsWJiX4Vbr9TOwNgXJrbbdTh6dqFwRr6W1T7HZnPg0uQ24WFJhW3hT9FIHIOH2ho54U8wWmttvHV0m7WbsI2t27jvgbjcPC6oZwhY9FOXAAQH0ixp7pOoe6DA3EijlcFMcKcn7w6Eoz3sc8UB1+dEmTitfRD05j2/Dtuz5WqywKRI2WotluvelSQsDV1SQxilYkfDLU9TpZW3DefDatw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gz+3Y/Y2mGMpEm3o3YFZF9JUT8MH4XZrsjJGGWhtB2k=;
 b=Yp4kaWoEKsoL9ikq1fN9aqGnPeNypTXTlrgbbEu6B6uvkfaY76nTF+XtL/aDB56ZLDHKKI5zVrwVuy/ncHnngkmMOd2lJlcBTGk7sXaNTCYvFyYxZgB07QvLD2yXXa6Jx/jQEDZLhpalMegSfdS1UoAvHWfpRiSOnWuZUozE8tc=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB14431.jpnprd01.prod.outlook.com (2603:1096:604:386::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Thu, 2 Oct
 2025 07:15:07 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9160.017; Thu, 2 Oct 2025
 07:15:05 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v3] pinctrl: renesas: rzg2l: Drop the unnecessary pin
 configurations
Thread-Topic: [PATCH v3] pinctrl: renesas: rzg2l: Drop the unnecessary pin
 configurations
Thread-Index: AQHcIXaBG4An/rkewUCUw7JH/R5FvbSrpe+AgALvaKA=
Date: Thu, 2 Oct 2025 07:15:05 +0000
Message-ID:
 <TY3PR01MB11346B17DEFEAC5B18267B64186E7A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250909104247.3309-1-biju.das.jz@bp.renesas.com>
 <CAMuHMdV5bn1CjqNKvrtgEUTq8iQPZyg4UVh44s=6Z81XF1-F5Q@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV5bn1CjqNKvrtgEUTq8iQPZyg4UVh44s=6Z81XF1-F5Q@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB14431:EE_
x-ms-office365-filtering-correlation-id: d6709c44-941f-4506-bf0e-08de01836982
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?Ky9RMDZ4S05JNWpCWFdmM2czSEdkd0Vyd0d3eW9HV0JBYmhISE5SM2hqUndt?=
 =?utf-8?B?M245YUdPWklBT0RzYUh4YUZtZTg0RXpTamlpMjhVakllZ3VvdXk1RnFNMXNH?=
 =?utf-8?B?cThKREpSTWhJM1dyRFU3NzFUL0o3SEZwajg4dmRTb1ErUTRrS1A1VEZIUFd5?=
 =?utf-8?B?U1lIMkJJNFBJWWJQbEw0NGtWWnoycGo5V2VhekF5a29nTUtXMld3a09NbmJm?=
 =?utf-8?B?eXdSZ2dZdlNqMU1TUVVJS3FXbE9EZ3NrV3hNdy83V0plUnZDTk5kTkQ0VUFz?=
 =?utf-8?B?dmkzUzNvUHpIRjc2SFBPNlE5ZzNZMmFxalBtOEM0WGFYa3JReDVTY00wcThy?=
 =?utf-8?B?VVdqTXpZR3VFd1dLZnZydzd0Wm52enFPczV0ODNTZWZ5TXJzYjM0d0JRWlVj?=
 =?utf-8?B?MEF0OVkvZGVkMVRwY3phSWJFSlY2cXVqb2NoaEovRnhnT2hNRytacmRqc2FD?=
 =?utf-8?B?Mkk4ZTN0Rll2L1cyTlp0Y3lKd21uTk03bUNUUkFmRHBlczcrZmhZcCsyWjhu?=
 =?utf-8?B?SWxaRUd0YTErWEJSTlhJeE0zd2tuczBORm5LRmJvQmxOckVhdHhJVHFZb2RN?=
 =?utf-8?B?ZjlMckJPUmh5YUNWVjRGckd2MC9zNk9oaWw1QW5ya3orLytqZ1ZKK1c2bVQw?=
 =?utf-8?B?NFdMTUM0QlpUQzdUWUhsNVBzekFSWEVtaUFaQVM2UWV5NGM0UVZac3RWWUlp?=
 =?utf-8?B?ejlwVThGZXRCbDVvQWhTNkoxb2xiR0ZGNGlVYWp2YWNXc1pNeEc3UFNmazF2?=
 =?utf-8?B?bEhwVjgrZk0yWUhnMTZmVjlQbTFWREZmUW52a1VRREVBK2N4UmhoNW5VLy9y?=
 =?utf-8?B?b3kwdjlzd2o5SitjNHhITVFaQjBkdU9GZTR3QklsMm80VG51NlR0R0lGTXll?=
 =?utf-8?B?WVdmUUpHMGVnTSthYUFTSWRqelBQOThGT3dDZnVYUmxxT1lBNXI2aGdjTzlh?=
 =?utf-8?B?ckxVU1hyVTRNNU1Va3RFT3NJRTdFaDM3ekp2L01lbW0yVCtZa2FXbDRGUi9y?=
 =?utf-8?B?WVNCNkxVVXBlNFhVWFJDWnNIa2U1Y3ZSYTVZWUNyQmVSVlQ1Y2h6ckZHbHVj?=
 =?utf-8?B?a3NXMEYvMUVGaDI3YUZQSkZQaEdVbHBweFVXcXc4T2RLWTBjSHpyU2hVT29h?=
 =?utf-8?B?SVhVR1c4bVBCM0lOQkZJYVByTHdVTzNuUVF1ME1LZTFpYUNIZVdMbTJ4dUZs?=
 =?utf-8?B?Um1qcGFjTndXeXpreHkvT3pvem9LOU9GUkVaMWljcy9SS0RkVk8rcHlaSXdX?=
 =?utf-8?B?M1NQN0M1aGY0WHZKTTlIN3BmNWlKUldna253dWovbGw0NEo0YzhDRDREU3gx?=
 =?utf-8?B?M2tFVnQwb1pON285dzczOWtUWnlsaDVHRWhjUDJoTUhTZ2g1SGU2TXNncFE4?=
 =?utf-8?B?clRMcHdVUERXd2s1bEFkYS92Wk01YjNrMzdKWkZLTDYyQ0hvWCtMK0FXWlNr?=
 =?utf-8?B?TzRhNGZUdFg1L3FCZmZrbUFpbnU5bUxMUzN4c2cyMzEyNVROZlNDVHpoUUNy?=
 =?utf-8?B?Y0IyYTZmMHNHenRIcHhYKzRvODlsWTlkVCt0cW04OFkyS2FFOVdHcVdmMHlj?=
 =?utf-8?B?Nit3MzhUV0M1NkhDZ3BBMkVNQXIrVmRwR0RmeUtvNXNhUmFaRW42YnEyQWNa?=
 =?utf-8?B?OGpsU2N5ekxiak5jdUxoK2FDYTFmbDF4VTJjaDROdVFaZDV4UGVUUkZ3eTNs?=
 =?utf-8?B?R0xSWGU3c1NzSVUvRHJrMFVIUUx6d3ozM3lWN0p5Wk1wQTNEcEg4aUE5b05N?=
 =?utf-8?B?dHhvU0pUeWpXcXFKWlUrM3Jid2RLVUhncUJtY1NIN3lHMmowS2pUOVZLRkJv?=
 =?utf-8?B?TXhyaE1FYjVEZjd5VFE2L0hKSWV5Y1VEWUxFcjI3andnK0lraWhmS3QwVWRt?=
 =?utf-8?B?aUY3cUZpdVNvakVnRmZnZENVbkJ1OW5mTUVHRkgvUStuVU11Njh3NmY1MHpr?=
 =?utf-8?B?MFpXV2hGZXlzbEllMEFRVFRSVU0wWkhoQzBtRFpzRGpidkJOWitWQk9MVDhz?=
 =?utf-8?B?eXdYSTR1Vm9hUyt3dFBISmJMOXRRcmtmdTM2RUtHc0pBdWh4NVBrWEdMMUJL?=
 =?utf-8?Q?hCFWdM?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?V2NPbU0vVTYrOWFhM0pheXVkbUxud1Z3blNtWG1YaVN5TkxaZ0JsUU5MNlBQ?=
 =?utf-8?B?dGxlbEVxNERIaUdwQnNaMVpRSGNaWDBZa1BBb1N5VXZkY200SGhLSXIrUmVR?=
 =?utf-8?B?VjdvUmZqUUtwN2dwNENkbXRzNExvRStVNFBrVHNWTFo3YS81R3kxbEQxOXcz?=
 =?utf-8?B?bExqQUtjaUtobjV3R3BGNkFjQm1uUnJDckIxbTY5Z25nNFF1TWgvSk5ENy8x?=
 =?utf-8?B?eTdRMFU3SitYcnV0LzBQRmJUZ1RXbTdZblRJZGpVOWtmN0h1MlpCYXd2bkJV?=
 =?utf-8?B?R2NxRG1IbXl1MUlmWngzQzRtVWlGaDNmY01YZkxGU25hWWJkS0hXM2o2TGZZ?=
 =?utf-8?B?OGt3a3cyNTBMVlRUTmRlSHhJSjBHaEtVa09GcnZoVlZzdXdSQWZrQzJ6NlVF?=
 =?utf-8?B?eXNwcitLcjZJa1o4dkx5WktEVy9Wejh1TEFldXBUYVVHWGxBVXVnM3ZKV0Y3?=
 =?utf-8?B?NlZPTzhaS3lXenRhalNKbkgxS0xYdHVQY25HNWpSOEdQRkczYjNWcEx2OVdG?=
 =?utf-8?B?dFprQmcwK2M0TzBSWVcyc2FEa0xQYkdkWWtQSGhaYmFQendxOHRyUHViclJW?=
 =?utf-8?B?cUhkU3VtOWNkOUZ1R2x4K0h3c0M2Y3JJMTZQcGJMQWFLc1Q2TzI0OVBSS2RC?=
 =?utf-8?B?OVhPVFpnYzdGL2dxdnY1cDJVOCtaRkFoTWRqSlVlblY0MUxmUUIvL1pLenNX?=
 =?utf-8?B?VzdzNWx5bGk2S0xLZ1NGV1NUUnNDbkc5TDlhUllhZ1RXYkk1WElpRzZHNkJ4?=
 =?utf-8?B?TlVlQmIxaTlGWWZkc3lzNk02ZzlWT1djZjdKUEE5cmZhVVBqc05aM0FxVDRF?=
 =?utf-8?B?dVhOUUVicXdrMEdnclk3V0I0Z2ZDd1ptS2p0REVjSWZxTXY5ajZSdEFpWWw2?=
 =?utf-8?B?UUtqSEx0S043dlNxWE5yQmgwQWtjUmZYK3FuK1hLMnQzNno2WG1LK3JFV2Jq?=
 =?utf-8?B?KzJtNnA5WUxYc1VON1paU3BId1BUTW55QjNVU1hkRU4zK1RPQmd3WlhxZmFz?=
 =?utf-8?B?ZFlHVk4vUnhqOGJ6SFl6dE9iMnl6ZmZvRVlrcTlyYVhmdlkxaFV0Sm9RYUZV?=
 =?utf-8?B?bjhENlpOUytMWWJsaUkrQXpUTmpBUHJoL0pnbUNvblJya2RDWVBiYVpLbDBE?=
 =?utf-8?B?dEcxT2ZpalMxek5mNEF1VnhTYU04TVM4cm10QW9HTWM3MmUzdmtFSWxIMGxm?=
 =?utf-8?B?aUxXUWpNZm5xUUFnbHRGQXhLWCtSUkdTcE44a1JOUUlHUm1kZHp0YmJ6K2lu?=
 =?utf-8?B?TVZtU2l5L1B5bE85TlRjWU9lUE1oYmFFWWdqMWFMN3ppS3VqTnBuVHJUc1U0?=
 =?utf-8?B?MUQ0S3JTSVNNVUhpRm5lMldPblJrL1dyR21mUzRDV3JrbVk1TUhwUnhSYVJZ?=
 =?utf-8?B?eWhUNDZoZ3lXdFR0dXRyVWNGTHg2RmxpOGpHUDFXVk94eWlpUEp6bUdJa3Fp?=
 =?utf-8?B?RmsyYXE5ZHU1N3lzeXcvV0ZaejIzY2Y0R2h1YjNFcUI3enZzZVk0VThlTGVo?=
 =?utf-8?B?YmJCWVlLNjRBZXgzcEx1S3JpUVNPalNKYnh2d3R5Vk1uOVZ1dngvTXlGNmp4?=
 =?utf-8?B?UVlrSmoyR1hkSXd2R2cwQkpSWDhaWS9keXpOQjJvVTY5YXpRSlY1SEYxS2dT?=
 =?utf-8?B?dXNZUHExeDhvVU1Zc3ZRZ05xaDk1bzBPdHBEcjI5UzdlVzRvVW9GSG1ra05w?=
 =?utf-8?B?QXFLaFJNK1lUQ3oxdDdxdkdUN2pWVng3cG9QUjJZNW42NTdTdEo0SXdrK1R6?=
 =?utf-8?B?aHhZb1kyREUwaHV2Z0JlL3daK2V1R2NtUDNJRTgxcHFGNFJZaWxtQ3Nib25X?=
 =?utf-8?B?VFRjSHVsc2ovakNybC9rU2ZGelZvL1QrWlA2L3pqWElEOG9WNkNEWEZvNXd5?=
 =?utf-8?B?U041OWJGWm9BQkdYeHgwM0pja09TOVZXblBxVU1HdlJrQ3ZlK0YzL3k3dVB3?=
 =?utf-8?B?MFVnS2lyMkpHZWZGWUlRaXArVHhBTlhPWjIwUkd0dUNPa3BCUjlOSFVXUkpP?=
 =?utf-8?B?OGk2REJZMjVEV3RlVUdvZ1VUOFdmQXd3bzZEbTZGYVFyTWE1V01WLzlSM0th?=
 =?utf-8?B?S1I0MHBlUFYyL0FzcUE1KzdUSFc1aHNPREJZT0tVUHVJeXJyTUxQZ2pKbUJl?=
 =?utf-8?Q?ITkchlNk12jZaRso3Sj5hxTd4?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6709c44-941f-4506-bf0e-08de01836982
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2025 07:15:05.5548
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ur2+xsJCkwtZvQz/s6lCX+cBs4vlnoKiTsTA5Lh9jpMYCo96yKNDe9LWukFNeFowq6zTPqAEqOIzpr8FdEN5ny0AoI5OeCy3eOq9pPzeO0E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB14431

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjNdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJs
OiBEcm9wIHRoZSB1bm5lY2Vzc2FyeSBwaW4gY29uZmlndXJhdGlvbnMNCj4gDQo+IEhpIEJpanUs
DQo+IA0KPiBPbiBUdWUsIDkgU2VwdCAyMDI1IGF0IDEyOjQyLCBCaWp1IDxiaWp1LmRhcy5hdUBn
bWFpbC5jb20+IHdyb3RlOg0KPiA+IEZyb206IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5l
c2FzLmNvbT4NCj4gPg0KPiA+IFRoZXJlIGlzIG5vIG5lZWQgdG8gcmVjb25maWd1cmUgdGhlIHBp
biBpZiB0aGUgcGluJ3MgY29uZmlndXJhdGlvbg0KPiA+IHZhbHVlcyBhcmUgc2FtZSBhcyB0aGUg
cmVzZXQgdmFsdWVzLiBFLmcuOiBQUzAgcGluIGNvbmZpZ3VyYXRpb24gZm9yDQo+ID4gTk1JIGZ1
bmN0aW9uIGlzIFBNQyA9IDEgYW5kIFBGQyA9IDAgYW5kIGlzIHNhbWUgYXMgdGhhdCBvZiByZXNl
dA0KPiA+IHZhbHVlcy4gQ3VycmVudGx5IHRoZSBjb2RlIGlzIGZpcnN0IHNldHRpbmcgaXQgdG8g
R1BJTyBISS1aIHN0YXRlIGFuZA0KPiA+IHRoZW4gYWdhaW4gcmVjb25maWd1cmluZyB0byBOTUkg
ZnVuY3Rpb24gbGVhZGluZyB0byBzcHVyaW91cyBJUlEuIERyb3ANCj4gPiB0aGUgdW5uZWNlc3Nh
cnkgcGluIGNvbmZpZ3VyYXRpb25zIGZyb20gdGhlIGRyaXZlci4NCj4gPg0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+ID4gLS0t
IGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4gKysrIGIvZHJp
dmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4gQEAgLTU0MSw5ICs1NDEs
MTYgQEAgc3RhdGljIHZvaWQgcnpnMmxfcGluY3RybF9zZXRfcGZjX21vZGUoc3RydWN0IHJ6ZzJs
X3BpbmN0cmwgKnBjdHJsLA0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHU4IHBpbiwgdTggb2ZmLCB1OCBmdW5jKSAgew0KPiA+ICAgICAgICAgdW5zaWduZWQgbG9u
ZyBmbGFnczsNCj4gPiAtICAgICAgIHUzMiByZWc7DQo+ID4gKyAgICAgICB1MzIgcmVnLCBwZmM7
DQo+ID4NCj4gPiArICAgICAgIC8qIFN3aXRjaGluZyB0byBHUElPIGlzIG5vdCByZXF1aXJlZCBp
ZiByZXNldCB2YWx1ZSBpcyBzYW1lIGFzIGZ1bmMgKi8NCj4gPiArICAgICAgIHJlZyA9IHJlYWRi
KHBjdHJsLT5iYXNlICsgUE1DKG9mZikpOw0KPiANCj4gSSBhbSB1cGRhdGluZyB0aGUgY29tbWl0
IHRvIG1vdmUgdGhpcyBhc3NpZ25tZW50IGluc2lkZSB0aGUgc3BpbmxvY2sNCj4gYmVsb3cuDQo+
IA0KPiA+ICAgICAgICAgc3Bpbl9sb2NrX2lycXNhdmUoJnBjdHJsLT5sb2NrLCBmbGFncyk7DQo+
ID4gKyAgICAgICBwZmMgPSByZWFkbChwY3RybC0+YmFzZSArIFBGQyhvZmYpKTsNCj4gPiArICAg
ICAgIGlmICgocmVnICYgQklUKHBpbikpICYmICgoKHBmYyA+PiAocGluICogNCkpICYgUEZDX01B
U0spID09IGZ1bmMpKSB7DQo+ID4gKyAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJlc3Rv
cmUoJnBjdHJsLT5sb2NrLCBmbGFncyk7DQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybjsNCj4g
PiArICAgICAgIH0NCj4gDQo+IFRvIGVhc2UgYmFja3BvcnRpbmcgIltQQVRDSCB2Ml0gcGluY3Ry
bDogcmVuZXNhczogcnpnMmw6IEZpeCBJU0VMDQo+IHJlc3RvcmUgb24gcmVzdW1lIlsxXSwgSSBh
bSByZWJhc2luZyB0aGlzIGNvbW1pdCBvbiB0b3Agb2YgdGhlIGxhdHRlci4NCg0KDQpJdCBpcyBv
ayB0byBtZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K

