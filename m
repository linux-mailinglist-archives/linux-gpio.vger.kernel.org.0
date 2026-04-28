Return-Path: <linux-gpio+bounces-35725-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMZPIJLq8GmBbAEAu9opvQ
	(envelope-from <linux-gpio+bounces-35725-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 19:12:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E825E489B36
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 19:12:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C6A9931D3DD7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E33232ED27;
	Tue, 28 Apr 2026 16:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="aWpSQR+9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011069.outbound.protection.outlook.com [52.101.125.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB182322C77;
	Tue, 28 Apr 2026 16:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394875; cv=fail; b=Mga2AtWbOFV52N9b614Doi2KEk3sXrV+JhA7OUvwlwdjsJydTea3JoeaZ6oOssZ716mQYNVpyvTog1pCuXpRK0HnkoasF0hIUPYUoKBuYNoCmLQlxULEqVjVJkW/C4SqAgRav7+VhaCjKvqVCc6tGzT97hd1ROwpadzDPEq85iw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394875; c=relaxed/simple;
	bh=vlaIb3uaOta9lmSLxlG/6HuSXO1giGIGCL2QjpMmc8o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=acQdHZrNNIYTpU9JRUy4wp+Ear5Ssx+Vfw4IdgFQ2VDNo4vWCoo9yAYsSE+pVPXu0KMklnVa+wmwqEriZoOpFe/OdGnOtpa9PItHzh8K9KkR45MvwCELqpq+UhIAH9+KETsbw4cvWopC8WYY7w+Rsp/d6BXIJ6VI04AoZEJeAXg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=aWpSQR+9; arc=fail smtp.client-ip=52.101.125.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NkqBXLJIhqVhCTpYBTjaCGvcUovuXnLLq95a3IX79OigM8f31rz4jBwVMWoU2LS8KYzM9WFZm6ZCOIsZeIl6CIKgL3xO9tJ4hJmcmNGns6il4Xz973OK+9P35apBuuVg8JQngy+FmIZri5ydPtKRZGQSDlmq9/ccbEJBlvlMvOZcy8Hi+Aj7htQoKzJqmymXVI7VY47DWp4Wer66z23lWW/UgDJcWpnMi39CFQP0pnWZ64UKDRCk28jnmqbCGxzg3fuYkFQ+Q58kjJq3+Cd3Zezlw1rZ2PODVqBi3CvlGOP0OA6aZvAQIIxy9C60cF/Bu6H6EuJf9sBGcgaTvXFPRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vlaIb3uaOta9lmSLxlG/6HuSXO1giGIGCL2QjpMmc8o=;
 b=vCLICmiZb9QxgEJganHeLu5Ca3qW1Synxpamb+Z6vcavv913+nHPj5k1QcdMYZW33vQhz/S3JHmwWeeQ+JdH3jLGN/+6louAjtE6fD2BrZAv3+ueDbiWE/HsJw+huwpaekyoXvPL8rPP2+FA8M/VOaraPMgVPrCNA3N9slk6P8938ke8P1FFBbS1TM4CB4YlSX4U3xRHm/JCREofWoMZih/1+QvvxHmya8j6WeiD+f5M2usGSo5KvOf/iXkdbFm95NN6iYeCvub926rplF4aahtc5vAGiBe/GJMx4zcgeAcgVLkVD/q0EofFmgANAzdzuE+XcMSsHsymnz4vdDkUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vlaIb3uaOta9lmSLxlG/6HuSXO1giGIGCL2QjpMmc8o=;
 b=aWpSQR+9mk+I8bzAgHWsiWOnfiphRevX/yegGsVVJCa5jHf2r1OpMAmClxKjk9xfNX87LSslkFPhP2yFYFBoXj79dq7/GUwpIBy5lDKmwO65KU26QRdy22AbSpTsCnoHfzDKdVWhM69dJj1M2rLIJ90KBIS1ljPoPAFjwcvYTAg=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by OSZPR01MB8733.jpnprd01.prod.outlook.com (2603:1096:604:15c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.18; Tue, 28 Apr
 2026 16:47:50 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::2511:10cd:e497:4d97%5]) with mapi id 15.20.9870.016; Tue, 28 Apr 2026
 16:47:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: geert <geert@linux-m68k.org>, biju.das.au <biju.das.au@gmail.com>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: RE: [PATCH v3 2/8] dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
Thread-Topic: [PATCH v3 2/8] dt-bindings: pinctrl: renesas: Document RZ/G3L
 SoC
Thread-Index: AQHctfck06Zxb1Diz0q0xKEX0Kt9J7X0tmQAgAA647A=
Date: Tue, 28 Apr 2026 16:47:45 +0000
Message-ID:
 <TYCPR01MB1133236B67596A8DF7DE580C686372@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20260317101627.174491-1-biju.das.jz@bp.renesas.com>
 <20260317101627.174491-3-biju.das.jz@bp.renesas.com>
 <CAMuHMdULLMbsGf+1Jp0aRFmT=CFD3fY0LvgjHyqVS7-Q-OMBGA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdULLMbsGf+1Jp0aRFmT=CFD3fY0LvgjHyqVS7-Q-OMBGA@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|OSZPR01MB8733:EE_
x-ms-office365-filtering-correlation-id: 5940538d-5113-4d8f-a093-08dea545dfba
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021|56012099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 Gd87fnItpfRfcP7U87dbOgXkdkHLNIfTAVQkIYWTpNsBCK1lXb9FUue/5zb70M6sFHWPZJjxw1Qj9W7Y6w8bVMSWrXGAlg2xyFRiYTEdjx+/qPls+zQFiicZ1znAqLv6RwDy/m+UApppdLtxWyiPpNnUw682jS9FIIViZ2pgP72yF5X5oxTAGWecT9Rdmsmuwl3GO71YgQqNIbdmKAcG5i4SzCGYG6WCOxhZFTGs86HDrt8QgJkpuC3wbk/L1OPQ4uqZe4ILm0VlGOOv+4RDrdW2cnFdw8OR6UdNESB6e3xBOzmCF+H7G0wUM5BL5Og+a8lNP8PyyqlNDZi1/ZlbfT9KAKDa6PSrkN1czNg3557ga3pr8gG1YCyDaJ0B9OIugqPvfe818PvzAn6Dl3v8psFRzu6HH583xuxQRNv2javbD2k8gb8GqdkpvZiVYSFzY6a2BRQoHu8r4fWwqimDc4x+csFmVSCfgfgY6O20WOb4sejzK3EY0hGz/9htv6CnACyfb1uT0ZCQlTAUfQpXk42/KB0GvGFxz4YarYKDjOceMY5mzY5Eq31kJOmdV6kq9b06EAmjmxTEqP2XrBKyyE2xzjwPXP/fR2cGQSqmp43OrES8AezGtnS1kPAEPj+kFkCZTqKMxNPEmnFE6HCkwWJftax5HUjuq2Rnch91TsoymiOQQiV1AhsQwHryDlHgFqr4pX7cRPjvt+Zqp2db9zlzorCKCdKNJ5QOB1IO92K4lwyEht7QgLrB+oezrW59yAGN2Oz5pW1CKOSTgnqeUP4pYX5UeVk7G2JelSOmD+w=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?VWJvT0dNdUxwdURpQlkxUkpic0ptclV6UWw3WTJYRnRVT2lMMm84aVRJZFNH?=
 =?utf-8?B?R2JpZWh2M1lGM2VyOTU3azF1WTh5NCtraUY0bkRaSHBtNEJqb1hQVVl4Y3cr?=
 =?utf-8?B?K2RGT1ltNk5UNWtBNlRrZm4ybFZpbXYrd0FnNTVrTCtPbE5WMTFUczR4ZlVN?=
 =?utf-8?B?MjRPSlJURmp1UytNbDN2YTRueFJna0I3ZXYwd2ZINUs5R1RPMGFGNzgzbGUy?=
 =?utf-8?B?dHFsNFdpaUJzVTRTQnNhUGNHSHhiRHQrbDdhL3JlSUExWFk3VzBtMVhHUmU1?=
 =?utf-8?B?cWpuQnM2WHFTcVZNMWRra0VjbmhQd3ZsOUpuL2kwU3FzUWNRcDlWa29LTkph?=
 =?utf-8?B?Si9OMmxLWUpGTVluSGp3TTRWZ1BKTVpTTVQxekp1RW1oMHNSUkRIVE8wNFFq?=
 =?utf-8?B?WGNvaWdVdWRJa1NnV0xyb2g1WS92dnhRS2E4cWlhaFdtSFNsMHNvZm0vYXM5?=
 =?utf-8?B?OEpQbmFzN2xRVE9xZWZ1Vlo2Q0F4UnoxR1NoUnM4RUxSMXhEelBZOE8vN0F2?=
 =?utf-8?B?RW02TllwOUQrL1VxS1ZmMmRBbTJETFBEbjJLN3JkVXlTaGFkMURqNThpeUZZ?=
 =?utf-8?B?WFZ4OUExaFNZNW9vZ0xMWnRGQ3JpeEZobWJ2VFVpcmZicC9JNzRrZS9pYzYw?=
 =?utf-8?B?TUo5aXVkcU1HWnp0OEZWZnl3MFBjUHZhb2ovQ2VEb2JVSzhUV3BBMzlrYitl?=
 =?utf-8?B?dUVpcUNibmE2d20zMWh5WUgxWExHRWhtVDVHOVI5Qzk3M2ROa2x6OWJrT25D?=
 =?utf-8?B?U1crTWpoVDlCVW1Nd0RkcXA3aStMY1VoYWlqVUdobk9QS09RN25DanZqTDVO?=
 =?utf-8?B?dHFmaDlJczNMV2ZHUlM3bjFscFlFUGl5ODJyZDl3MVd0QWZlSmZSeFZDK1My?=
 =?utf-8?B?VVRaU28yQXUzZWN4ZGpzZkxPMUdjZ2huS3lpeG1IRnhmcnBuL0JxRzRvQ3hP?=
 =?utf-8?B?K0cvbnhjRS9WY3pSWm9kSEx0UHdnZkpkTmFYQ2F1alVzYXJyZGQ2aE92YkVT?=
 =?utf-8?B?Um5wUEtIQkViSWRkYUtndXdvWVA1SngzTUV1RlBvMU5vYU9qVlZ3ZmJpR0lq?=
 =?utf-8?B?OEtxUnYwZThoMEswcHZBQytpTEZDb01ZSnpSQkxpSHRsd3dZaWpVMVJpTlh1?=
 =?utf-8?B?TVE1Qmd5K0dvUW9oZTZNaGVGYkFZYnBDMWpiNjVWYWJvVGJsTUh5QWh6dkly?=
 =?utf-8?B?YU1vSFM3aDRoN1JMRHJmajZUMlFsdHFWQkRJdDBrcWY2dWFtQmlsSzk1bSsv?=
 =?utf-8?B?VWY1R0xxWG9aa1k3R3hsNWdMMkhKdEc5K2E4WmphRGtkRWljWnMrRTIzcW51?=
 =?utf-8?B?YzlBRWV2TENYeHgvbnU1Y2s5MS92QmprR2dUVmJOT0V1OVNZOTdrczF1VytT?=
 =?utf-8?B?eE9aYjhPRk1UNzdscVU5T290azZkaGN1YWV3Mkd5bFE4bklpa05aeFJVbVJY?=
 =?utf-8?B?NWlXSSt6V2paRWJzQXcrLzdyTXVGakpxeisyaCtTV2l3djVkWDdKYXd1RzVy?=
 =?utf-8?B?VVB2b3pUSVh3bkRIck9Ja3cySjhaZGNIeG81T0daQkpmZ3M5NWIzbzdrSTFU?=
 =?utf-8?B?RkdiaFFyVjZMbFpiYUFyRVVRUldUWHpTdm9xNWtEWEVUdnk1NTdGQTBuY3Z3?=
 =?utf-8?B?UEtwTEJoczllVkdKUlQ4Snd6RTJ6UG5mV2J6aDJCMUZhZEQxTE5pS2dPbUVZ?=
 =?utf-8?B?RlNjSjl5bHhUOU11eUwycDZ0MkcvUVpSY2xYYldiazh1c1ZQbXpsSGxBb3o2?=
 =?utf-8?B?dUU2YVUvSWxzam9Vc0hyOWtwV3JZb2pHYTM2UHdaNkx3cXcyWHg4Vm5wWXlt?=
 =?utf-8?B?bFlMRDZUamI0dVlkdmFFUUVjdTI3YXhKNU0rTGEreFRzdkVjRkVyb0hBVFZS?=
 =?utf-8?B?Z2owbGh1WWU1OEpPSVlHczh1NjEzaDZLbDhYK0p4SGw1TnJtbk1EazhnMWhD?=
 =?utf-8?B?OW9uUWZ0eDBROWdsWWhwZGNjUFJRU1BoL3N5Ri91MFdWOFVzcy9mLzcxaW1h?=
 =?utf-8?B?dG1IRVFzMTNHZXJBRXFEOUJPaWRDUDJ6VmlNUWVFbXl3R2VMaDJDRUFmcTF3?=
 =?utf-8?B?VnlVd2lVN1ZYalhrK2gyNFU0RVVkLzQyS2ZkdDRzbFJ0MUxVRXlIL0ZJYy84?=
 =?utf-8?B?U08zRGZicXA2OUVsRGNETFN1ZWp6dXJkNlJzaXg0c2xjaDUzbXVjaitmdUFH?=
 =?utf-8?B?WUhqM0RYV25iRUVxR0dwUmhmN3BOSmh4RUZ0aExoakFEL05FdGllTExMd0Uv?=
 =?utf-8?B?dlZwVndNcmxvaXZqUXlHNHc0UkFyQmc4MWZURzU1SER5bHZ3aUhEcmxQQ2JR?=
 =?utf-8?B?MHVyY3BlNXNvYWVweHZGQzlrUWxiSlZXMlhsRHNqam96VnhwQ3dWUT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5940538d-5113-4d8f-a093-08dea545dfba
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Apr 2026 16:47:45.7922
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0OwpZ9dcGsR6m5/x8H5glHBgtVLnqHxEJ0lT2leelXS2R7dMkREp9/tcXvQKbI7+OuUmUF9NwMVlwqJjZCi61DIL6foZDP5BwEhoZjFyPBc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB8733
X-Rspamd-Queue-Id: E825E489B36
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-35725-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux-m68k.org,gmail.com];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,bp.renesas.com,vger.kernel.org,microchip.com];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-m68k.org:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,renesas.com:email,bp.renesas.com:dkim,microchip.com:email,TYCPR01MB11332.jpnprd01.prod.outlook.com:mid]

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDI4IEFwcmlsIDIwMjYgMTQ6MTYNCj4gU3ViamVjdDogUmU6IFtQQVRD
SCB2MyAyLzhdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiByZW5lc2FzOiBEb2N1bWVudCBSWi9HM0wg
U29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVHVlLCAxNyBNYXIgMjAyNiBhdCAxMToxNiwg
QmlqdSA8YmlqdS5kYXMuYXVAZ21haWwuY29tPiB3cm90ZToNCj4gPiBGcm9tOiBCaWp1IERhcyA8
YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+ID4NCj4gPiBBZGQgZG9jdW1lbnRhdGlvbiBm
b3IgdGhlIHBpbiBjb250cm9sbGVyIGZvdW5kIG9uIHRoZSBSZW5lc2FzIFJaL0czTA0KPiA+IChS
OUEwOEcwNDYpIFNvQy4gVGhlIFJaL0czTCBQRkMgaXMgc2ltaWxhciB0byB0aGUgUlovRzNTIFNv
QyBidXQgaGFzDQo+ID4gbW9yZSBwaW5zLg0KPiA+DQo+ID4gQWxzbyBhZGQgaGVhZGVyIGZpbGUg
c2ltaWxhciB0byBSWi9HM0UgYW5kIFJaL1YySCBhcyBpdCBoYXMgYWxwaGENCj4gPiBudW1lcmlj
IHBvcnRzLg0KPiA+DQo+ID4gRG9jdW1lbnQgcmVuZXNhcyxjbG9uZWNoIHByb3BlcnR5IGZvciBj
b250cm9sbGluZyBjbG9uZSBjaGFubmVsDQo+ID4gY29udHJvbCByZWdpc3RlciBsb2NhdGVkIG9u
IFNZU0MgSVAgYmxvY2sgb24gUlovRzNMIFNvQy4NCj4gPg0KPiA+IEFja2VkLWJ5OiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEJp
anUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4NCj4gDQo+IFRoYW5rcyBmb3IgeW91
ciBwYXRjaCENCj4gDQo+ID4gLS0tIC9kZXYvbnVsbA0KPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmlu
ZGluZ3MvcGluY3RybC9yZW5lc2FzLHI5YTA4ZzA0Ni1waW5jdHJsLmgNCj4gPiBAQCAtMCwwICsx
LDM5IEBADQo+ID4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9S
IEJTRC0yLUNsYXVzZSkgKi8NCj4gPiArLyoNCj4gPiArICogVGhpcyBoZWFkZXIgcHJvdmlkZXMg
Y29uc3RhbnRzIGZvciBSZW5lc2FzIFJaL0czTCBmYW1pbHkgcGluY3RybCBiaW5kaW5ncy4NCj4g
PiArICoNCj4gPiArICogQ29weXJpZ2h0IChDKSAyMDI2IFJlbmVzYXMgRWxlY3Ryb25pY3MgQ29y
cC4NCj4gPiArICoNCj4gPiArICovDQo+ID4gKw0KPiA+ICsjaWZuZGVmIF9fRFRfQklORElOR1Nf
UElOQ1RSTF9SRU5FU0FTX1I5QTA4RzA0Nl9QSU5DVFJMX0hfXw0KPiA+ICsjZGVmaW5lIF9fRFRf
QklORElOR1NfUElOQ1RSTF9SRU5FU0FTX1I5QTA4RzA0Nl9QSU5DVFJMX0hfXw0KPiA+ICsNCj4g
PiArI2luY2x1ZGUgPGR0LWJpbmRpbmdzL3BpbmN0cmwvcnpnMmwtcGluY3RybC5oPg0KPiA+ICsN
Cj4gPiArLyogUlpHM0xfUHggPSBPZmZzZXQgYWRkcmVzcyBvZiBQRkNfUF9tbiAgLSAweDIyICov
DQo+ID4gKyNkZWZpbmUgUlpHM0xfUDIgICAgICAgMg0KPiA+ICsjZGVmaW5lIFJaRzNMX1AzICAg
ICAgIDMNCj4gPiArI2RlZmluZSBSWkczTF9QNCAgICAgICA0DQo+IA0KPiBHUElPIFA0eCBkbyBu
b3Qgc2VlbSB0byBleGlzdCwgc28gZHJvcCB0aGlzIGxpbmU/DQoNCk9LLCB3aWxsIGRyb3AgdGhp
cyBsaW5lLg0KDQpDaGVlcnMsDQpCaWp1DQo=

