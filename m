Return-Path: <linux-gpio+bounces-26453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C701FB916AA
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 15:33:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8EDD37A22A9
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Sep 2025 13:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8D22D3720;
	Mon, 22 Sep 2025 13:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="lIh/OUTH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010015.outbound.protection.outlook.com [52.101.228.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82907305E04;
	Mon, 22 Sep 2025 13:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548031; cv=fail; b=DF9R7nR2pV1SFsSrQqt9q5ucBef8ynbziFjuxkfPpufo8E/v2HNnZLYCQL9xEEB4INIhT0za9i0FFaB1IiqEOpOX7Fu1szTTdoWA7rb49R3T/jM85f9pkT/xTaEGHJ0iKmAZWJfvxbz0tZLu3ErDRAUZnY6Nfmqb+YPR7Rgb+B8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548031; c=relaxed/simple;
	bh=gftSMOY2eXg970oR/DeifyreuA5uvFtNZCE9tUh2Deo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MvGmUQWfPX7Xut+Zc6vRK1Y1C1/bC/s274fZb+eaBQFgJmZ9e4oC/d0WmH4Mz7roURcqOjRkenHvdxMJod8tiRF85ev4WO8L49uxwYjR0vSTvtncKjBJGb4t4hnavNk0wg5IUcxRUgZ3V+qxasLefp+rbVUcditwlAE0QeUqj2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=lIh/OUTH; arc=fail smtp.client-ip=52.101.228.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1eqXVl1yFYWrMY26O2r77JSHkYgVmvmdAqVa20ncg7HXSNOkMJ1sKQInU0BhdMp/HJcc2XxvS+qOh9xbM51DLNnQGlOEtuw73VIem02AmsjwZBI2B6x0XTpuWLMQFY4JOFasKn+Kwg7nZBNv2M2bnJjiaoxg/gWYJ7xWbjBUrxEYsuHUd5+g79nZs9IiSjEoBHiBpGQ9QYfvrhoSsNbIAd5Ms+BrEBr7ZvTB4ykoj6YQlwyKagtDYW0cf4Rnwnie9H+UucUt7BQNGaIJT8/mglJAIQsbvck6qp2JmaiCWkYmOnf1u13BUbt2mbC+tw/BlMn1WSo6TZmxghlE3BQgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gftSMOY2eXg970oR/DeifyreuA5uvFtNZCE9tUh2Deo=;
 b=RtLK9gQPFjeLm4cwm9NWWzZ6M3MP1gcQHpSyWFpxWqRWL+hOJzOT2x/P+Yh/oU2os3+G9gfPdOv9stQ0jFLxrmGRR+hQuPyCBoh2DzZR7MPfGnmiPP1BeysUL4tyk/ZOGz5/AP73yvxB+qf9TorArPFxjKncbLmHBwGaXZpoZjvaUfACC3vhF6tIM+fhWE/9YScHZtWNrRycoIH1C50SyY8plqSqg6U5lkoBs1begR8rEXa6c4fGzQ+xvKULNkDaNjmh/zz42OiZ12VGJdwMwrP5UOgrO6+VVbKojpc/TwdCBzFEP9MEjyF8gL7gZlG+mBEg0BYIEfEA/BGKptofhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gftSMOY2eXg970oR/DeifyreuA5uvFtNZCE9tUh2Deo=;
 b=lIh/OUTH9Cn16Yxdiw1bOoinEQ0imuAYIFRbA9PmJ9O7vzk+ap8uCyql8fBIuuENdp0TEzunLWnerh3urJ47KmlAavCW+eNHWlOgmge8ekNRgBLEr/3QxGxAGm/in7lQjx8PMDJlYqGe42vG/lu6VpHRmWbn8g+a6FkMyNW8AxQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB17301.jpnprd01.prod.outlook.com (2603:1096:604:43a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.20; Mon, 22 Sep
 2025 13:33:42 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%4]) with mapi id 15.20.9137.018; Mon, 22 Sep 2025
 13:33:42 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>
Subject: RE: [PATCH v4 2/2] pinctrl: renesas: rzg2l: Drop the unnecessary pin
 configurations
Thread-Topic: [PATCH v4 2/2] pinctrl: renesas: rzg2l: Drop the unnecessary pin
 configurations
Thread-Index: AQHcKuki3f+Qk8/5lEut2E/gJJkWFLSfMaGAgAAC06A=
Date: Mon, 22 Sep 2025 13:33:42 +0000
Message-ID:
 <TY3PR01MB11346F4A0D1A5550F089AA4768612A@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20250921111557.103069-1-biju.das.jz@bp.renesas.com>
 <20250921111557.103069-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdWtpv325awR06pFA+_EHh5GZ90K6OEf5S6Wkg+_89uRBQ@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWtpv325awR06pFA+_EHh5GZ90K6OEf5S6Wkg+_89uRBQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB17301:EE_
x-ms-office365-filtering-correlation-id: 6c805e72-ec5c-4244-99b4-08ddf9dca5cc
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?QThxdHlORTlVUmo3MUNiS21ZMThWTXhEelloa01RSmtaYW1KTVcwV0dxN1Fu?=
 =?utf-8?B?UFZkRlJnYWhwKzc2S0lCNzVVQ2lXc1lwRUx1a0lRY1VteUJBai9YU3I3U2xa?=
 =?utf-8?B?VzZ2eHlTaWxnb3FSNC9TWDFxY2NtSmJuZWliTFFrVDNaRm4zK2ROdEZxQUhy?=
 =?utf-8?B?ZTBqQnQvRGY3RFVOc2padWU0OHVERVROYUI4NXJsM2ZhU3JVTUg2M2xmY3Rh?=
 =?utf-8?B?RG9UMDJNT1MwbzgrUjJxT0RMNXpaUHE4N1l0K3RQb1RlNVJBWFdTY0pYa29k?=
 =?utf-8?B?OGRubjhzNTVUcWw4TFgvakxWYk14bXJCb0hzTkE0Z2lFK2xFVjlBc25kOU1U?=
 =?utf-8?B?VkQvelJyRzZ0WmliRXZPdzZOb0JUTCtlTXNNVW9PMzR1WHJBNVd3TFV5QkJP?=
 =?utf-8?B?bW9hbEZPMnl2cjlsd1d0OEZURys2WG90OWJIZ05HYm44TlNNSUNNT05zdzFY?=
 =?utf-8?B?WFNkT2RlTnc1NlR6Nk9VUGxkdlNlcko5VTZNdDF4N0lNVGJsTnA1Y3d6clFk?=
 =?utf-8?B?eUt1YzhNRkpJMDBiZFVrTlhDVXlRMnVFMHlJbHZPR3NaN0tOZ1pkbHNxQk5X?=
 =?utf-8?B?UER4NkZnMUhlQWZtM2dwK1kzS29iRlV6a05lOHJ6SmM3bnZvQ2hYTE5PRGxX?=
 =?utf-8?B?WE02SVhDZjdhaFVwRCswRXJ2d2lFejA3bDZyVzdTMEtaOUg5QjEvY3c4TnE1?=
 =?utf-8?B?SnVnM3BSM1o3ZlN4SGpCT1cvbjVoN1pyVUoyUTVhZTkxOE9ONXBqTEZGdFEz?=
 =?utf-8?B?YndPUDk0TjJWK082ZDJ6NElFK2piU2Z3OE4vcmczQnExdUJyZEdlTTROYWUr?=
 =?utf-8?B?ZldhNnpiWnpYdlpDOUo3RmkyR2p2RHRpQ0dVMkVBK3ZTOXVyOVR6SmRRQUtL?=
 =?utf-8?B?RjBZZjQzcFdtUklrNzRPT1ZjUlBsZTFBTEJzaW9pKytPN3NPanR0MktNUkJz?=
 =?utf-8?B?Vmg0TkFUYk1VTnZld1k2N2JBTDN6TFZ2VnVCQjlENldRZy9xWnVkdDdQVGU5?=
 =?utf-8?B?SGIrUzF5M2U2RnhzeitOWnZTN2czdDJDekVqWVV3cW4rS2NUQ2NWenVvT1k1?=
 =?utf-8?B?SllIQ21DMW5maGZnWEpKL1h6SDZzZzY1a1d6eWxQMUUzSzVadmlpT2locWFU?=
 =?utf-8?B?YVhxcUxqK1ppbGEvemtoSEI2c0hlMXkxdDgyTTNBVU96VDdYcTZZY281WHhl?=
 =?utf-8?B?OFpBMnpOQ1RySjlpLzZkQXNaRkQxbkErcy9oc0V3T0VaUFFoeU5sdHBWLzRC?=
 =?utf-8?B?bjhyVzZ2TlpJcThheWN1ZzJRQnprdXBnclArbytxNG1nc3VWMCt1eXNQcytu?=
 =?utf-8?B?RFVVRzl6OXM5Tyt5dmJtOVEzOElVM2VKbXBuNkRuTW1kcTJFZC9wcS9sV1dj?=
 =?utf-8?B?WW1UTXpzcGMrRmNyaDRSTmVMVnFQdjdJOXkwMVliVXZweW9iVnJuR01jMkhO?=
 =?utf-8?B?Q1p5UVRpdUVETTJuZStUWCtUYWVacHRheFFNUXhMSWdtL1VJbEZVMkZzL1Jw?=
 =?utf-8?B?dzFoTjhLdXVNOGc0SUdoNWUzUVdjSm9FbHh2NWcwakFqZ3NKRWI3Q2lrbWpu?=
 =?utf-8?B?Q1JSQmdVTGFGUTRGeXlNLzR6QTNQa2lRSjYwaU9XSGVIQkFaVUJkVzRCWjRp?=
 =?utf-8?B?dUlmNURrWTR4L1RWMmdHb0ZCUWszYkN3eXNMUEdDYjhFTUpDd1k5T1V1Zys0?=
 =?utf-8?B?N29OOUljbDIwWU9lbTV6ckh4VHkxSFI1dG13MmMybmorUWJhUm9HT2NnMGxj?=
 =?utf-8?B?Z3FxcnlkRWl2VUlIbmlhN2wxZlpUZ1dRbzFpQzRNUVJqRnpGaWZLa2dlWGd0?=
 =?utf-8?B?WTBGaTlJRm82Q05DTGMzSmw2Y3ZoMmhDYlRESjlmdjhudkRIaDhFcmRPWVor?=
 =?utf-8?B?UEFwNUpCeUNrWS9pdlUzVVVITGI4OEpKUmtWMWl6OGJlMFFMSW9BYnBWM1Y3?=
 =?utf-8?B?cUFScUpqbGY2SHFJTVJ4bUpXTnVjdDdSL0R6RTFiUUp2UzA3cUtWYU5aTTJJ?=
 =?utf-8?B?MEZQSWpYWjVRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?c21XRUYrZjl1T1NmQkhiS1RMS1laNjF0cnpxUzMrTG9jY1I5ZUI2MzdQTjlZ?=
 =?utf-8?B?cFZKK2ZjN1lqdjh1Z0l5ZWtNbTQ1L21QdjQ2WnN3azJrMjJscXlhYVMyRFRl?=
 =?utf-8?B?a2lZMkdvWnNLa0hQTDNQei9CWjN5UkRFb2o4MFdhMnlpaGplUjRvc3YzeEo2?=
 =?utf-8?B?bmVQcFJEazlzeExYNWdIdStYY1ZsajRaQ0VEck9ZbjRESnZUTVVSaFFsZ05s?=
 =?utf-8?B?RUtlTGlEMGxHSzJIOGpNOUczT3lvNEpWdVg3V05tQ09WVFV4VVlpTlFnWjJ4?=
 =?utf-8?B?Y1FHOFpuVlFEeE9LcWpGZXU0YlhCcWhEM25yZEMzUGNuOW1oMUI3S2ZUdGVv?=
 =?utf-8?B?ZEhYdUlQNWFzbjc4bzhEUTArbmJrQk5lSHBRY1czMzYzNmtQS1dDNldBTEpy?=
 =?utf-8?B?U0VSaHR1R0gzOE4zQTJMQ2RZNWNtRzJYMHQyS3dlZ2NCL0w5b1lMdFZBRWoz?=
 =?utf-8?B?UlRZWVQ0NmFBbXhuNWx3UEwxcmJnaVZETm9KZXRaT1IyMHljaFZOTFFqYWhL?=
 =?utf-8?B?Zjk4MlhpZXIzc0xpY2dkUTF1ZkJIdy9Ec0taS1ZzazZuOHU4VXRQTWZtTVQ4?=
 =?utf-8?B?UXZGNTczblZiVzhublFGTUY1WkxDQmJmY2EyTGF0MmpJZTlhVkxwUXpleTc3?=
 =?utf-8?B?bE8vZE5lYWc4Mmdha012NXRncDBscUlQeUhkZ3RhcEhVSlJtTi8yaEhVNHRq?=
 =?utf-8?B?S1JwZkdUaHJKd3BWVlBlMEU0RTRpcFFZTWJMcE1iQ1lBMnFwcDI4Zk9PYTNt?=
 =?utf-8?B?RzZDVEM4T1F6d2hCdUxQVG9XcDUrSmhQSGx4N1hJUFhZTDdMOGhHUEtOdFho?=
 =?utf-8?B?b3pvcjlrYjNDb3J2cVp3a2lnOXk4cGNTSkd5b1VsQWU4SDdJUnpRd1BPZjNT?=
 =?utf-8?B?ckdWTjQrb2kxbUZoVTNvV3N0YitHNmFlRERkWDYrc05aNXh5NmhyNE5WUHo1?=
 =?utf-8?B?ZjQ3TGowVHNXblB3Y3VOcUpxbGp6UUUwMlc4Z3R4Qk8vYUY3RlhTMU5WL1N5?=
 =?utf-8?B?TTY3UGx3QzVpZ09rN1dIT01jMEVHQW9mRW4wZU40bmd1clFhRFlJRzA2Q2Z1?=
 =?utf-8?B?UzRtTWtVRzJ3SHA5OFNMTEdWVjNyM3NnOGxXSlFOWjkvRkRiWTkrVlVsTVlh?=
 =?utf-8?B?b1JQaE42QTZ2eUF5VDNQNmQrdnVEN3NJb3puK0ZNR2xQTi9uNnBtcFBwRHJX?=
 =?utf-8?B?L0Q3bTdxQVo2WGY2MDFieXo2STBmdVJHMFRRdG5DditJRng4UkljVnBuUG9h?=
 =?utf-8?B?T05zVHNGV3ZQemRxQnptUGRrVFFFdWNlUGZvUVRoVDdNbWtVY0VnM2ZJa1VQ?=
 =?utf-8?B?aXJZWWROT1ZncWlXUHRKM2c1SlNKVjJ1VmFpWWZIQlJJVmY1RVNTb0JXYURJ?=
 =?utf-8?B?dU43RnRHaG1KeDF0RlI1Q0hxVHNoM1lhMCtuajhUZEJyNnMwVCtwOUxuT0U2?=
 =?utf-8?B?Y2diSSs2VGMwdWVpcEg5eUw1V0NvNnNuSC9kZVRULzZyQ2h0KzYzSmVBYTcr?=
 =?utf-8?B?b0hDaWpTMDZKSStMZHk1QzdTbGJGMDRRaERha2FRdHJ5WU9KKzgyY1U0MVA1?=
 =?utf-8?B?bDlNcUFCeGo1MkhRaUZNZVRpa09ZN1FEUWM1R1dLam93U2dFdDRWODJMTjhG?=
 =?utf-8?B?NVV3d0lnMTlXY0FlSWVKSUVUalBKcDlnajFURndjQkU1SFJEdDJBY09Ddkg4?=
 =?utf-8?B?YnppNGFpVWhiWWcyMkl1S29SNWNKbWhOOHF5L1AvTDkyV3lpRmdkeC9TUmV3?=
 =?utf-8?B?ZXplaWlBeW5QWDcyWERCL0RURm5iOHlMOS83TU1FREdDd1NsQTAyK2d6b3li?=
 =?utf-8?B?dGR4OEhQcTlOWXRlUW5zeS9xMnpQcHdNZGMvbkc2dkFRakVuMWlMZ3ViMUxR?=
 =?utf-8?B?MWI2Z0h0VUVxR3pMNWFDZm9DUUxPNXoxT0xnVitxN2tSSG9iYVA0T0dEdkxY?=
 =?utf-8?B?VXZQVTc1aGZ3MkhJNnNRalBDN2lxdEgwVHM5RkhtTkFpNHFrODAzWW8xcUFJ?=
 =?utf-8?B?MGdDb0NIdVFTZU9ya2tNRHdZTkxMeEdURkRCcEUwNVVTdVVVcjhnYzVxS3Vy?=
 =?utf-8?B?amVOcGNudDNaMEp3RGQ4SExORjFyUjZOcG1vb091dHZ4Tkt0T21YL29FdHRE?=
 =?utf-8?B?aDVyVE03RFVZNEczbnBITXQyRUFGM25NVzV4WVhsUlVrZWdVem5kTm1KYVRD?=
 =?utf-8?B?eXc9PQ==?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c805e72-ec5c-4244-99b4-08ddf9dca5cc
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2025 13:33:42.6229
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2a6Ox4Al7wuTqFHAU9vzlKMeOMENNS3aXRn8gzKaInK4KDEgej+y5qyA2U2SkkW8xTKelkERKEGll2PntNZEBvXPhrrUvK8b/2vRSukA98=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17301

SGkgR2VlcnQsDQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogR2VlcnQg
VXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gU2VudDogMjIgU2VwdGVtYmVy
IDIwMjUgMTQ6MjENCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCAyLzJdIHBpbmN0cmw6IHJlbmVz
YXM6IHJ6ZzJsOiBEcm9wIHRoZSB1bm5lY2Vzc2FyeSBwaW4gY29uZmlndXJhdGlvbnMNCj4gDQo+
IEhpIEJpanUsDQo+IA0KPiBPbiBTdW4sIDIxIFNlcHQgMjAyNSBhdCAxMzoxNiwgQmlqdSBEYXMg
PGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiBUaGVyZSBpcyBubyBuZWVk
IHRvIHJlY29uZmlndXJlIHRoZSBwaW4gaWYgdGhlIHBpbidzIGNvbmZpZ3VyYXRpb24NCj4gPiB2
YWx1ZXMgYXJlIHNhbWUgYXMgdGhlIHJlc2V0IHZhbHVlcy4gRS5nLjogUFMwIHBpbiBjb25maWd1
cmF0aW9uIGZvcg0KPiA+IE5NSSBmdW5jdGlvbiBpcyBQTUMgPSAxIGFuZCBQRkMgPSAwIGFuZCBp
cyBzYW1lIGFzIHRoYXQgb2YgcmVzZXQNCj4gPiB2YWx1ZXMuIEN1cnJlbnRseSB0aGUgY29kZSBp
cyBmaXJzdCBzZXR0aW5nIGl0IHRvIEdQSU8gSEktWiBzdGF0ZSBhbmQNCj4gPiB0aGVuIGFnYWlu
IHJlY29uZmlndXJpbmcgdG8gTk1JIGZ1bmN0aW9uIGxlYWRpbmcgdG8gc3B1cmlvdXMgSVJRLiBE
cm9wDQo+ID4gdGhlIHVubmVjZXNzYXJ5IHBpbiBjb25maWd1cmF0aW9ucyBmcm9tIHRoZSBkcml2
ZXIuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVu
ZXNhcy5jb20+DQo+ID4gLS0tDQo+ID4gdjMtPnY0Og0KPiA+ICAqIE5vIGNoYW5nZS4NCj4gPiB2
Mi0+djM6DQo+ID4gICogRHJvcHBlZCBleHRyYSBzcGFjZSBiZWZvcmUgdGhlID09IG9wZXJhdG9y
Lg0KPiA+ICAqIE1vdmVkIHNwaW5sb2NrIGFjcXVpcmUgYmVmb3JlIHJlYWRpbmcgcGZjIHZhbHVl
Lg0KPiA+ICAqIE1ha2Ugc3VyZSBpdCBpcyBjb25maWd1cmVkIGZvciBmdW5jdGlvbiBpbiBQTUMg
cmVnaXN0ZXIgZm9yDQo+ID4gICAgc2tpcHBpbmcgR1BJTyBzd2l0Y2guDQo+IA0KPiBUaGFua3Mg
Zm9yIHRoZSB1cGRhdGUhDQo+IA0KPiANCj4gPiAtLS0gYS9kcml2ZXJzL3BpbmN0cmwvcmVuZXNh
cy9waW5jdHJsLXJ6ZzJsLmMNCj4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5j
dHJsLXJ6ZzJsLmMNCj4gPiBAQCAtNTQxLDcgKzU0MSwxMSBAQCBzdGF0aWMgdm9pZCByemcybF9w
aW5jdHJsX3NldF9wZmNfbW9kZShzdHJ1Y3QgcnpnMmxfcGluY3RybCAqcGN0cmwsDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdTggcGluLCB1OCBvZmYsIHU4IGZ1
bmMpICB7DQo+ID4gICAgICAgICB1bnNpZ25lZCBsb25nIGZsYWdzOw0KPiA+IC0gICAgICAgdTMy
IHJlZzsNCj4gPiArICAgICAgIHUzMiByZWcsIHBmYzsNCj4gPiArDQo+ID4gKyAgICAgICBwZmMg
PSByZWFkbChwY3RybC0+YmFzZSArIFBGQyhvZmYpKTsNCj4gPiArICAgICAgIGlmICgoKHBmYyA+
PiAocGluICogNCkpICYgUEZDX01BU0spICA9PSBmdW5jKQ0KPiA+ICsgICAgICAgICAgICAgICBy
ZXR1cm47DQo+ID4NCj4gPiAgICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZwY3RybC0+bG9jaywg
ZmxhZ3MpOw0KPiA+DQo+IA0KPiBMb29rcyBsaWtlIHlvdSBhY2NpZGVudGFsbHkgc3dpdGNoZWQg
YmFjayB0byB0aGUgY29kZSBmcm9tIHYyPw0KPiBTaGFsbCBJIHRha2UgdjMgaW5zdGVhZD8NCg0K
TXkgYmFkLiBZZXMsIFYzIGlzIE9LLg0KDQpDaGVlcnMsDQpCaWp1DQo=

