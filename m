Return-Path: <linux-gpio+bounces-35729-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COjrKJH+8GnubgEAu9opvQ
	(envelope-from <linux-gpio+bounces-35729-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 20:38:09 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 1369B48ABCB
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 20:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B0F50305A5DE
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 18:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5DBEB47AF57;
	Tue, 28 Apr 2026 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="vpOGzabY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010055.outbound.protection.outlook.com [52.101.229.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884BA47A0AE;
	Tue, 28 Apr 2026 18:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777401306; cv=fail; b=qfef3s8r0LXCJZlzlxi3g27mbkywfRtmt3Tc+ykSvQlYIqn7mA5mD5DEz92FpKT3CVF65MunotAbIJ87jqtAVllZoL/3e9N+FBrYrSDT3nzzbNQhjw2CQWmYoyvsruhQl+LB857MaMwKi+KVJY1xXLP6V0AQInkSE9dgIUA5wEA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777401306; c=relaxed/simple;
	bh=utU+WCjYS24lCPQZq0P2LjIFeuh7EEzTa2gHqGqnxRk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bAqznZ0anmWhze5dbFiZYVJLvOi83EArXDMSjMsXQDNJvWCJCaVet5uAp64qA50dRxGMA1OB7mGGICpOF3fube8uQE2i2VtCw/jbY3pJd0S8FYw8Vi1nZolj9kYI1S2ZnEDrjhrZKKzaoLZp7rzvOJSY64l/1qLuKCIfldFiqOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=vpOGzabY; arc=fail smtp.client-ip=52.101.229.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vs2UbOh3bCtGhkGJtysDIlZqhlgKGv+7mw3fb9szA0H9X1b8ihWTxpWPlbeRZ4z73KlcPhk82anke6a8LqPKbXJLraLyzCD2G1/ujBcg08aQixYIarU/Q2iVK+C41SCRcnR8hrmHYw2wmB1uUsu6on9IKFUm+/3VOJMlp7lAqNaSLsMuoY9xQ/1GaC6C9bt5Helgy0riwz6CUlGDfHXMFIN5Aql1XZnpkuR1wRdZTRSzbiRxMG7o1qfmVBMt3T0KHcUoN2Oa1EK4BPmvZCHQ58P7sLNxIJRfb/l8nMsiqKw96yjnSmujWuGQvWC/kwT//KtEAznTym8vYVa7OIFBdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utU+WCjYS24lCPQZq0P2LjIFeuh7EEzTa2gHqGqnxRk=;
 b=Py6MC4cbgP9xAWI7aEnh+uIrHKfESqt3zMvEeqWMVl70VN5IKd/S/0jb8KlyAxxNq1JLjUX/UrcWoG7VUpYTF6A/oM2m/jCPaL3e1GjrIDzLc8LTe9Wisk9/APHIC5rV0W7k+Z+XW1U044NvE6KU9V9FqlVphfgCql8jVRF7rXeonG+/WYlMJ7yc8gMfwCLWUBToNZTALPFP9EUxLLdpF8nws0b4CpO9yGvlreu6JdDVT1RlZ0k+qfB2PtczSs5lEC19urZQD+oSd9Te0O/nSAJ/fiLt8sGz7qmoUYGCVU8hg+pCVEkirqzfByBIf2/fspcJFHfY5gLB8+gbyGvrMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utU+WCjYS24lCPQZq0P2LjIFeuh7EEzTa2gHqGqnxRk=;
 b=vpOGzabY66hl3VB8zx8yezNOhVo5LZ8bNqwgmjN+6ytw4IIF8bOFBtIbTuOB0FmTsTtOq0UqpCKR4V1FdurCL9HQf5/iRrcAyuDNjyJjj5Qw8pRTfCMvO5D3gdLHQwJekoHXWkF5rKX6GZGR+NDx5xcfq3I9sUuaxT7X6RdsR0U=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYWPR01MB11542.jpnprd01.prod.outlook.com (2603:1096:400:400::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.26; Tue, 28 Apr
 2026 18:35:01 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 18:34:56 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linusw@kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v3 5/8] pinctrl: renesas: rzg2l: Add OEN support for
 RZ/G3L
Thread-Topic: [PATCH v3 5/8] pinctrl: renesas: rzg2l: Add OEN support for
 RZ/G3L
Thread-Index: AQHctfcldnhhyYSng0m/RwDaL7E28bX0t3CAgABXwdA=
Date: Tue, 28 Apr 2026 18:34:56 +0000
Message-ID:
 <TY3PR01MB11346C6DAFBC7C1036B5D3CE386372@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
 <20260317101627.174491-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdUXQNfg9fh9BEr+KYkVjFg7T9hTXEUk6ki7xxZEzDYKBQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUXQNfg9fh9BEr+KYkVjFg7T9hTXEUk6ki7xxZEzDYKBQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYWPR01MB11542:EE_
x-ms-office365-filtering-correlation-id: 3bd65da3-be6b-456b-e380-08dea554d87c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 zgL8hPGfpMeGvS/Z4Lr41JxzIeFUcA15LpHmUZJyQ3wiiMzkvxJaVVdMDoADQztkEP/BtYyFLm6l4HJ9BUJYwoDye90FAoBznn4CmsMh4TNIY6JwVyqtjFTnGOz6t7vCaLZNry5kLdFMc4eKZ3L5o91ncmVcvrIHz5Jnzxg2Q9VBiXB98POLiY41rMZcKJR6GDizPaf3ixYqCIMczjvaSngx4unvynpdQ0SGbTAow17Wb7+XSYHOKmUuFlYhsg6YwU0zzR0g4/puHhmZjqniwB9YJSPegkMp6JcZaaSs9ejGw4MF+xWzlhb91eV4SKqf4toHHm3F4lJZN8g7vL1pAVXzuHm+TtJQ3DMnE9mNq3pMo9+WRR0CKp70RYsv2VzAzvSyLRDlfKz/xcIBTnmubfeIOJ8Oh9kcttkmSu9FDh76TRaU+Bc2RsnkOEclH3aC+Lv++UHUvTWshorVyQzLHus3in2M/+NPK8KOfhBGCSago4eELTtseQ70X6CBAxrP//xUj2Rcalq2avdxQeqZPSxJDGH9U2xg6+YZh5DHAAegjZePCA36reNf0/We7g6cH0tR8xk7Ce2Mt3aZMRMZvVZXnEdLpByurL7z/+VqrfyIUFkDRgxxWraHvMnQ5BkLJBuYGC1pjaqdaFZVYp0Sx13N4GPlkH5X69gnxzl2kh/rCf93ipnh7qQ6lMfNeIxxLTdBXe9Kmk26N9atPJMfGX639q9pVgdOJChSdfp+WRL5ICqWxxddnX+AdCzQ5XM70qwXtBn4hCMS0zR11SeJscGEUGQjy+QrwM1YwxmUq8E=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?b0hkY0UxRk5BMWJMSU1rajB0REZTTjZUUmhBUTcwUmMzN2NzaEVNaTQwTDFQ?=
 =?utf-8?B?a3lpR1Y5TWFsNERILzZ0OXY2RkpJU3NJK2JOR0V3cDl3UFNXUHFtTmxvYmt5?=
 =?utf-8?B?a2E0NFlrSWs0RE5mYUpGVjNUTVcwSllXbEZXTVZGV2pEQTBPeTZNblhTUFY5?=
 =?utf-8?B?TUdIaTA2aWU3SHp1RnFTSGVuTFVYZ0I0aHpFQW5WeHprMkdVY29RZzB3dmIr?=
 =?utf-8?B?ejFiVkFqNVBaV0xNSzV3bU0xejdLRWsyNXRZd01HdmZpZ3dpQ0FtSFhpTHFp?=
 =?utf-8?B?cTJXMXRqQ05ZZVRnbzNsMXpaaGdHaEtKdDcvbUEvaUZQeHFVby9FWUtJanJH?=
 =?utf-8?B?Z0RadlRpVysxK2dCUEtkcEQrcE42dlEyZnh0dXRqbXh6N1czbEFHNkZJeGhR?=
 =?utf-8?B?czhwMHZrQjlCeVJNTU1RL0Y3NjZjT3FWNVkyYy9Uck5KdFdNem1qVWFmK1lX?=
 =?utf-8?B?NVkwUnQwZTN0Y3o4dFBYWDF6YTYyelBSM2hTaGJVS1pRWEliWFZRK2pPQjlk?=
 =?utf-8?B?KzVPYThxWWFTUjNmOE9jTnNaQXpWRzhsN3gwZWN5MnhSVEdHalJ0SVo0U3Vw?=
 =?utf-8?B?RlpVRitrbXBXbUc2dU1HOE00M1RaV0tQZnpqblc1NU1pMzA2L05nbGI2YXZo?=
 =?utf-8?B?bmFDN2h4SzI2VGwvaFRzejBERVd6MGtqKzdMaTNHWWRpNGsrV1p6ZXZPb3RZ?=
 =?utf-8?B?WjQ2L0hDZWF2a3R3aGptN1BaK3VrdU5nRDRvSDJtZ0VRbzNmYTBYR25PaVd1?=
 =?utf-8?B?UGluL09XVzdUSEdtSXFEWDlmdm1ob0RyS2xabjVtZzhDVmZ4NmRvYWFISWMy?=
 =?utf-8?B?Q2tMcWMxT3ZKdGQzYTlWZk02Ykh5YnJ2bTlUVWtXOW16b1RtQ0pvV3JVSDQr?=
 =?utf-8?B?SHR3WXkzZ3hpRUcwRG1tT3ZMbUQvQmhXNUpxZk84OU5oWTh2aFE0OUthaTAy?=
 =?utf-8?B?WVNSUmkxVC9JSTRCd3lBR1FleWIwTk03dFlMNmt1QlE4aGxuUmZGeWRUa3hJ?=
 =?utf-8?B?L1JWMDlaci9HK2IzTFFMR1VhbkszK21RVm02b0dxQnlSdzEwazgrUG9kS2pp?=
 =?utf-8?B?T0w3NDgxU3dRK1ducEJCOGZOZ1ZhVlFmMk50WTJJOEl2blN6NXYrbHlpd1cv?=
 =?utf-8?B?K1AwQTNqOVB2QVpMNG5vR0xISHZDQnNVZVg3WnlLUEZPdmZkR1FxaGdMZU4w?=
 =?utf-8?B?RTJXNElTWlpyQTgxdXRyZk5DVW91VHE0alNEUFNTQ2RiRTJYNzFNd1JNWWdv?=
 =?utf-8?B?SXlFYnFwTUVjcTVpdERiQkxFcDNwT1Zvb1RvWW1oNXNGQ2lFakpzRVhGc1I0?=
 =?utf-8?B?UElObFR0TkxMbG1vbXJtSEZIWVNEODllWUlQYlMzZHNOZUFmdm5ENm4yU0RV?=
 =?utf-8?B?UlVNZDlkNVN0SC9pcldTM2MvWmJHcHd0dUVKQkJvVXVsSVVXdzR3QmlqMy9F?=
 =?utf-8?B?RXk1OXU1dWlwMTd0bjk5TDdRTnZuVDU5VzVWTzk2dER4NS85SktXcHJNWC9t?=
 =?utf-8?B?MWhKTWdJQWwrd1FwanB4QnBCdGMzbEJvSkF5cXVSZmVVWHhlcVFKWGs5aWQx?=
 =?utf-8?B?UDYxYTlxU1F3VDR5NVZrMCtKT2NjeW1wMGpDSlN5cGVUSjBod09DZG9Pbk8v?=
 =?utf-8?B?Vms4L2x2cGV6Zit0Wkk3RlVORHJlL25zOENEWE9UdEtLY3BOS2RreThaMFN3?=
 =?utf-8?B?R2FaU2JYOXhqVHl2QlArejRvcldiZlpsZVJWRkVPSDBWb2R1UXE1TUxVSmZz?=
 =?utf-8?B?Yk5BRjAvWkZ0SW01SzZXak5HcWZQbDJCdVEzOWNxKy9STDN0RllzQ2FsZFZK?=
 =?utf-8?B?bUVxT3ZQODJiL29oNlZWUFg1NjkvRlYvdmxxb0dsTUFYMmFtLyt3M1ArNk5G?=
 =?utf-8?B?N0QrOEN5NGk5M2MyV29KOHVqbWRyMFY4MjRNQTZCWFZaOWRWYm5kN0IyVVFO?=
 =?utf-8?B?NnFtNUFrSXBJSHpYQmM5WjVwYXB1VmM1SHJWbmxHY3dLN3pxTWNiVmZwL3lJ?=
 =?utf-8?B?bkxRazloL0dONUtOMm03Ykx1czVSQzRhWE5PSGo4aGxlRzRRY1FseC9aelY5?=
 =?utf-8?B?SGtDWk1VUEx3UDJjK2pkK1BMWWgrQjR1OWpmQm5FK21tVkdGR0dOdVR4S2Ix?=
 =?utf-8?B?aFlvdDJ4eHlCYnd6MVkzVGJ3TERTVCtFSkxHbVFqdmp1TTYxVHN2d1BLZU9I?=
 =?utf-8?B?R0lNZWVRTFg4YVF1ZlgxVlExR2xVZWFBYzVPTjUyQ3hGZjZGMjhPVk1rUXhK?=
 =?utf-8?B?UU5jQW1RSnZRc2VwMXJITFJzY0h0NGVubW01NnNNQzlXZXdWL3FpM2hYM1RY?=
 =?utf-8?B?M3N4cGFvMml0bXRkTVJrcnJMdE5Ncyt4aTMyT3JFZHl1eGMrSHB2UT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3bd65da3-be6b-456b-e380-08dea554d87c
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 18:34:56.1049
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I0ztsVdKWwHXgFParg1f3Pqg302PJCviUEvOj/eZXC5QG78BZ9Vco4owfmCuAaiu9Za14RbLHRPb+0cnj6LkPs5UBIJBf9JogIRUW4Lqqbw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB11542
X-Rspamd-Queue-Id: 1369B48ABCB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35729-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_SEVEN(0.00)[7];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,linux-m68k.org:email]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEFwcmlsIDIwMjYgMTQ6MjANCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyA1LzhdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBBZGQgT0VOIHN1cHBvcnQgZm9yIFJa
L0czTA0KPiANCj4gSGkgQmlqdSwNCj4gDQo+IE9uIFR1ZSwgMTcgTWFyIDIwMjYgYXQgMTE6MTYs
IEJpanUgPGJpanUuZGFzLmF1QGdtYWlsLmNvbT4gd3JvdGU6DQo+ID4gRnJvbTogQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPg0KPiA+DQo+ID4gQWRkIHN1cHBvcnQgZm9yIGNv
bmZpZ3VyaW5nIHRoZSBFVEhfTU9ERSByZWdpc3RlciBvbiB0aGUgUlovRzNMIFNvQyB0bw0KPiA+
IGVuYWJsZSBvdXRwdXQtZW5hYmxlIGNvbnRyb2wgZm9yIHNwZWNpZmljIHBpbnMuIE9uIHRoaXMg
U29DLCBjZXJ0YWluDQo+ID4gcGlucyBzdWNoIGFzIFB7QixFfTFfSVNPIG5lZWQgdG8gc3VwcG9y
dCBzd2l0Y2hpbmcgYmV0d2VlbiBpbnB1dCBhbmQNCj4gPiBvdXRwdXQgbW9kZXMgZGVwZW5kaW5n
IG9uIHRoZSBQSFkgaW50ZXJmYWNlIG1vZGUgKGUuZy4sIFJNSUkgdnMgUkdNSUkpLg0KPiA+IFRo
aXMgZnVuY3Rpb25hbGl0eSBtYXBzIHRvIHRoZSAnb3V0cHV0LWVuYWJsZScgcHJvcGVydHkgaW4g
dGhlIGRldmljZQ0KPiA+IHRyZWUgYW5kIHJlcXVpcmVzIGV4cGxpY2l0IGNvbnRyb2wgdmlhIHRo
ZSBFVEhfTU9ERSByZWdpc3Rlci4NCj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJpanUgRGFzIDxi
aWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEN
Cj4gDQo+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+
ID4gKysrIGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4gQEAg
LTExOTgsNiArMTE5OCwyMyBAQCBzdGF0aWMgaW50IHJ6ZzJsX3dyaXRlX29lbihzdHJ1Y3Qgcnpn
MmxfcGluY3RybCAqcGN0cmwsIHVuc2lnbmVkIGludCBfcGluLCB1OA0KPiBvZQ0KPiA+ICAgICAg
ICAgcmV0dXJuIDA7DQo+ID4gIH0NCj4gPg0KPiA+ICtzdGF0aWMgaW50IHJ6ZzNsX3Bpbl90b19v
ZW5fYml0KHN0cnVjdCByemcybF9waW5jdHJsICpwY3RybCwgdW5zaWduZWQNCj4gPiAraW50IF9w
aW4pIHsNCj4gPiArICAgICAgIHU2NCAqcGluX2RhdGEgPSBwY3RybC0+ZGVzYy5waW5zW19waW5d
LmRydl9kYXRhOw0KPiA+ICsgICAgICAgdTggcG9ydCwgcGluOw0KPiA+ICsNCj4gPiArICAgICAg
IGlmICgqcGluX2RhdGEgJiBSWkcyTF9TSU5HTEVfUElOKQ0KPiA+ICsgICAgICAgICAgICAgICBy
ZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+ID4gKyAgICAgICBwaW4gPSBSWkcyTF9QSU5fSURfVE9f
UElOKF9waW4pOw0KPiA+ICsgICAgICAgaWYgKHBpbiAhPSBwY3RybC0+ZGF0YS0+aHdjZmctPm9l
bl9tYXhfcGluKQ0KPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4gPiArDQo+
ID4gKyAgICAgICBwb3J0ID0gUlpHMkxfUElOX0lEX1RPX1BPUlQoX3Bpbik7DQo+ID4gKw0KPiA+
ICsgICAgICAgcmV0dXJuIChwb3J0ID09IHBjdHJsLT5kYXRhLT5od2NmZy0+b2VuX21heF9wb3J0
KSA/IDEgOiAwOw0KPiANCj4gSU1ITyB0aGVzZSBvZW5fbWF4XyogY29tcGFyaXNvbnMgYXJlIHZl
cnkgb2JzY3VyZS4gRm9yIHRoZSBjYXN1YWwgcmVhZGVyLCBpdCBpcyBmYXIgZnJvbSBvYnZpb3Vz
IHRoZXJlDQo+IGFyZSBvbmx5IHR3byB2YWxpZCBjb21iaW5hdGlvbnMuDQo+IA0KPiBXaHkgbm90
IHVzZSB0aGUgc2FtZSBsb2dpYyBhcyBvbiBSWi9HMkw/DQoNCk9LLg0KDQo+IA0KPiAgICAgICAg
IC8qDQo+ICAgICAgICAgICogV2UgY2FuIGRldGVybWluZSB3aGljaCBFdGhlcm5ldCBpbnRlcmZh
Y2Ugd2UncmUgZGVhbGluZyB3aXRoIGZyb20NCj4gICAgICAgICAgKiB0aGUgY2Fwcy4NCj4gICAg
ICAgICAgKi8NCj4gICAgICAgICBpZiAoY2FwcyAmIFBJTl9DRkdfSU9fVk1DX0VUSDApDQo+ICAg
ICAgICAgICAgICAgICByZXR1cm4gMDsNCj4gICAgICAgICBpZiAoY2FwcyAmIFBJTl9DRkdfSU9f
Vk1DX0VUSDEpDQo+ICAgICAgICAgICAgICAgICByZXR1cm4gMTsNCj4gDQo+ICAgICAgICAgcmV0
dXJuIC1FSU5WQUw7DQo+IA0KPiBJIHRoaW5rIHlvdSBjYW4gZXZlbiByZXVzZSByemcybF9waW5f
dG9fb2VuX2JpdCgpPw0KDQpXaWxsIHJldXNlIHJ6ZzJsX3Bpbl90b19vZW5fYml0KCkuDQoNCkNo
ZWVycywNCkJpanUNCg==

