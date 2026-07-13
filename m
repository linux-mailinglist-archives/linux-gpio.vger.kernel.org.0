Return-Path: <linux-gpio+bounces-39987-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9hblKwDwVGpWhgAAu9opvQ
	(envelope-from <linux-gpio+bounces-39987-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 16:02:40 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4574174C0CE
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 16:02:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=bp.renesas.com header.s=selector1 header.b=wP9KHEZF;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39987-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39987-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=renesas.com;
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0912230B4445
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 13:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F65F437127;
	Mon, 13 Jul 2026 13:56:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010024.outbound.protection.outlook.com [52.101.229.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1659437134;
	Mon, 13 Jul 2026 13:56:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783951011; cv=fail; b=n1kcJ/UEOxMfiyhJZJ71aiafC9pX7pKFHw493XND91zYAYqmf779BMxl5AHDt1kr+ADDjRqbQRCECdtAFuDMTpjxI7WR5O3EgcWKDQZea9eJzTds0Dp7f1AUi3OikF97hBwomewAHM2s5yhbAXFG+twbWNSUrh0wc6YkejVsJvs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783951011; c=relaxed/simple;
	bh=k1hkSbFT9yUOFdDvIX1zc0p6EYbwjGdiIWAtnNMViXY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LsxogU5/c1yOKtbWjxG8SOZ0zyRPe1z0xc83Hzz1ACqIKbF0LIeC310bUOqnz4JgWxSCCBGGT7j7yQ70IGvzQXWjuMzk4W1SC1I1MzrkuT0+7W253/RNQPPWFtsd6m63ZAk33vjGI6pLH1XMM3AG2A6BvU6rD8xkX4noekhbU7g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=wP9KHEZF; arc=fail smtp.client-ip=52.101.229.24
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmjxugWLc1WYaaaaB8rll0la2wCCkDc3tF5unoEeFaoHGJ2D2dYwUXy/Ec9VA2onciOsAyWKe3ptu/tPMjOg1w25Na26JYF4QVKY8YTX4iBgNLBj1VQfSkjXvk4NY7UokbJ3X4WlpoqRPPCt5/Tg17guI19rrzgg00CUqN2zJV4hmrZYoeFWrQt8YmjuqGkQjRMLWWjWjD+lp8j5sCLGfLMVt4W3DmQhxcQYHKu/a+7i+hnuGmJuGEFRL7g9QffaCDMasjIz5ibCjAOtvJJS4LPXZS+NqLuRqWdWCjKU1pybwJ1EklLun5CIGEnW/by2bWm+cMOOQk0Uw6O0BxbRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k1hkSbFT9yUOFdDvIX1zc0p6EYbwjGdiIWAtnNMViXY=;
 b=wlCOljArh+EtoO+yFDHPZ6XLFFOVD0B5U07OSmw/MneIXiR39qM3iI0tIIFDRf3BT72CKuH3EHkIvNtmxnSbaIXrvyIs93GFvLCHpPb4cVYBVbBzk4UZxYV5uk8BQnjxA9UkuOQWcxEMsz5pNbYfClCSWQPNwCpt3hvKVOJGBEJCVDa06lEYGL0XENQIgd783/CwQR5AlO30JVVR/FQp07S6oKyu5OrkmWsmzfl8oMqevZfmEXSd0ne/zif7C8kJ4uXAxAfpUrsHQ0Z2kI40mnt7ZMXZHhWIjS/ruQar4ryMqB9YXvB5ujKxN9HKeUmmAOj0deOtxwpBxiclFXj49w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k1hkSbFT9yUOFdDvIX1zc0p6EYbwjGdiIWAtnNMViXY=;
 b=wP9KHEZFqGoNnE8pB64by2UwEH6kCcDpGXRXeyXWS2hCCsPCN3NOP+SSPONoLS+StENrwpfPPekjnNU1RP7IPnhMMlhCEtUDNEiEZqxdzBLs/Kq1m05hjmI/br+cDM4Jcy3BxJ9iQWZOS2jo9RPkyZdySbI5LxyRvSidOCvQYy0=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYCPR01MB7266.jpnprd01.prod.outlook.com (2603:1096:400:e5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.202.19; Mon, 13 Jul
 2026 13:56:44 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%4]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 13:56:35 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Claudiu.Beznea <claudiu.beznea@tuxon.dev>, Claudiu Beznea
	<claudiu.beznea+renesas@tuxon.dev>, "geert+renesas@glider.be"
	<geert+renesas@glider.be>, "linusw@kernel.org" <linusw@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	magnus.damm <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Claudiu Beznea
	<claudiu.beznea.uj@bp.renesas.com>, wsa+renesas
	<wsa+renesas@sang-engineering.com>
Subject: RE: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Thread-Topic: [PATCH v4 4/5] pinctrl: renesas: rzg2l: Add RZ/G3S support for
 selecting the I3C power source
Thread-Index: AQHdEGCEtP5P1ZXBFUyNMEvPaGr4CbZp+qIQgAF5EwCAAAjeQA==
Date: Mon, 13 Jul 2026 13:56:34 +0000
Message-ID:
 <TY3PR01MB113468890DC8B12E1E43A54A986FA2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260710113637.1328000-1-claudiu.beznea+renesas@tuxon.dev>
 <20260710113637.1328000-5-claudiu.beznea+renesas@tuxon.dev>
 <TY3PR01MB113469434A4393A02DAA45DDF86FB2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev>
In-Reply-To: <f5b7441a-d72a-41c1-b67d-5225d8e9ced0@tuxon.dev>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYCPR01MB7266:EE_
x-ms-office365-filtering-correlation-id: 5adb70eb-f394-400c-713b-08dee0e68d4a
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|366016|1800799024|23010399003|38070700021|22082099003|18002099003|11063799006|4143699003|56012099006;
x-microsoft-antispam-message-info:
 HvdTWauEcaYPmQAU0x3XnlYFlL7m6zZcFjE0yIO3VnNXo113lJhDxx2LnYTGPjs3FLqI2dVymoOsAtMCSDCxS9Vips4ZdgAiMYKM8L31vJdXBRAzuX9xJq5po6a7k0P/JaOXuhNBCzwHUqgeqFffyW+W8JSt3BXSvgUyrrpMWFVRoz7MlE6Ii3+6Y/uDv+DHlMKsdEO+DcDh9Nc2JEb0nNlvoYQTBmY1qWX45nyyHQp4Nu0yxkErdqaMH2rmssJqJyHKb6GN8YZ5qCSYHmcegMMEf6tly56petrYS+ygPIf/dNWtCE68S6NeiVl1pmJG1rcPZNu2t3hgFcQZHNzIEMTyFUHjq0B4DntV0DL30xXyDdE5I+ZuXR+mDzfI7AiWiScR4xXzggriy7Gdl61TCbHvePHpVzCBy1yp2E9V+2LXU1vy7xhfJ9kijuPSaZCLWWcXz6toUisu11jQmo3vNIKbvTX/AnJo/jD+wJxCKBUI1O7LUFCFmfP30371282tKpHrrTOp6h7A1vwq4CZ3SHvWoyL7+vcd44HiX5AEaPsfTrcUcnzxJhvvlct3x8KVDhXZPyRCbj7+7hG2BitP7M9rz+zf2AVUSn2eJQ4ifBg8GZjOud8oCRb4+hlwuPL5DuuS7dalI4McX30u43ioZOzDG8OhSyKBQHqxYKN8BtJAqA6sN0oN407Ku83+uWXf7gY5rsRN0qepDbrnn2MOjD90p9w+VrODFmspGHdbnww=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(23010399003)(38070700021)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTBmait4aEdObjFsMjVhQjd6NzVwVE9CcnZ3eGYzMHAvcE0zTUFLakQwejBV?=
 =?utf-8?B?aFJrbHp4NWN6bjNNSE5vQUJROVVpRjhseHV6T216UXdaTFpZYUJiOVkwaENk?=
 =?utf-8?B?VnV2c3RKRmdNSURzWVkwaHVVem1XNEo0RjlnUjY0RlNjNEptaXF0M1o2ME5I?=
 =?utf-8?B?UjQwMHVJak84OFFHakY0QXQ5K1l4czdjellpbTNRN0NVOEpaWjhmOWE5c0E4?=
 =?utf-8?B?WUx2TEdwWFU4S3piM0dKbmlGeERkVmJlT1R6MWQ5SlhDNVBVZnBoaDBBbWpj?=
 =?utf-8?B?eTFHdzRVa09tVDNMS2N4Mi9xcDhBNVRoOWx3Y2I0R084dGE2L2xpTVIzV0w1?=
 =?utf-8?B?d3dlR3N4T0JlS1BVZ3VDem5kUFR2dGoxV1Z5cncyS3N0TTdZaUxqamxxRG83?=
 =?utf-8?B?aVNmWFJKaTY0U0I5ZEhma0JvOGFobTZQTXVVczNXbjVvT1VpU2NKRGZkR0JG?=
 =?utf-8?B?Uk1uMmNPWWNiY3dFQUVKa1V3MzVVSCtMa0h6MktpZDRTa203SE9SWGlTL1ov?=
 =?utf-8?B?bEZtYUNTaE5lMnB2RlZWYWJaT1BsRkxMcGNVaUhBa202MlV6Tnh6UGhxcGh3?=
 =?utf-8?B?TGFsbS9VMVF0aWYxYWp5VmZ0U3FiTVZtTTl6RlMwVjRqWjMwSjRKS2dxUmJU?=
 =?utf-8?B?VVhITVphZjdmVVpDcnpGYUNaS0szUFlQQ1dXbnJKMzZqdUh2N0hydGlWQWZE?=
 =?utf-8?B?S0pOTlYrc3VXQytteTBKRGJGSFRPTnhmRUVWZmxZOGRxWG1HbEFHLzNXYjJp?=
 =?utf-8?B?Y1I0QUQyb1J5OUJEb0xYN1dtNzg5RzlwcjhHVzFFQnRQeGxLVjNZN1FPUW1L?=
 =?utf-8?B?aHcwbTZycXhPc0xYMGVVemo5bzc2NC9YSzdLMXVsc3RLc3ordGxKSC9ScHV6?=
 =?utf-8?B?Rk55RjEzSG5LUFpLVjRKQitsTE9iWXdGb3FnNFBNMnZEUjhnMURRZFlQNWMv?=
 =?utf-8?B?SjMrWGt6TE11VDJHVkNzQjlRSTZsdHEvL1JuUDhIdmtualNDdWtjWW5yQjBs?=
 =?utf-8?B?OEc5bnMvTXVCNkxOZURKN01lY3l2ZnhLQTNhSzlYRUhiWWhzcURPMzlDc2lx?=
 =?utf-8?B?cDIrUFltR0orRTZNZ2I2UlowSVAyZWs4MzBIbWMrWGwrbk1za3BwMGZ4WUpY?=
 =?utf-8?B?T2VsRzhmcndhOElxK2Nnd0J2QzErWDNDWWpGeXI2OXk2c3pYVWU5SEpWRHNl?=
 =?utf-8?B?aWlsQjN2Ulhsb1RhUTkyT0tXOXdEQnlPTXZSbmsyK3VhZUhWYmw5N2pyTkZ4?=
 =?utf-8?B?cUwrZ2tMUUlSajdCWlpuWlFJRTBQQThKVzJnZTNEUHdFcUtGYmQwK1lTSkVj?=
 =?utf-8?B?YXA5a2VWdWNQYmVBZG13N1JpOHAvNGRTUDVrWjNZN0RoR3ArMGt0ZWk3RSsx?=
 =?utf-8?B?cE9HbUtLSEZHMW9IaFJxQWNOdzViZXgyRHlHN1hFMUNEQmEvcXByeWg0WFg2?=
 =?utf-8?B?SnBWREttN21NUkxwN1B2eFF5eGVWUkd4dVVPT0RDM0dNOEd2Nm9GSFdnT2Ni?=
 =?utf-8?B?WGtRUlZKZFdOR2E1NFpVbW1IU2tHU0VtTUZDMWExQkkwTE9uU0Q0cmxoMVFx?=
 =?utf-8?B?NEV5N3NyVVhPYWw3d3dwR2szemYxcXNXdVovVDFYTkppYjhPNmZJVGZETHpV?=
 =?utf-8?B?MHNBZ1g5N0JJbkJmODlWOHpBZ0RLVTNEbmlsNitrTTdFd0drN1N6ekJhRzdZ?=
 =?utf-8?B?ZlowZm44cmVkUUZoWThpc2pLRE9tZWhTZFF0Q3dXbStyMkpTcFRFMUwvSm5C?=
 =?utf-8?B?VXkvcTRIRlA1SWhOWG5qQ3lxeEdjVCt1RzhRRnUzR3BxYzBJeXNIRjgzU1d6?=
 =?utf-8?B?VXcwTEhtNno5bUZ4b1pKTnM5V2hZdG1QbEN2RUl3VFpvT1NPTU1JYUFQeVpG?=
 =?utf-8?B?cGo2MTlFckVETTJhNG1wOVFHVStWNWp3azd6OGdqMWx5MW5LQ3lvNy9RODda?=
 =?utf-8?B?bCtFUVdraC9CSmxWc3dKaXVINnplQW5lbitrMS9hbkNDYTVtbm9wMU1RdmNp?=
 =?utf-8?B?cko4N3N2eEVISFpyT1hrdkVtL2FWMng1b045OEI5NmNlSG8yVmxqdG9ZZEs3?=
 =?utf-8?B?SDlSbkpIamxQNUZqZzJ4bm9nMXZBRGt1V2dGV25GMHJ0cVB6OHo1eHJUMU9T?=
 =?utf-8?B?aG41WmwwUmJKaTBJS2ZZREpoRUFveUxkb1RpWjZ6RzZQb1JDL3pjNS9EcFR1?=
 =?utf-8?B?dU9MeEFYbnBuRXlITlNJV0lZdlRVWEpncXZJSUxsRFhObThZZndQNE1iL1pX?=
 =?utf-8?B?R25kWWRZeVRVcU1RV2oxMEVuM3ZZZUNmTXhLSGgvcGJPZDliOXV3c1hoMEhN?=
 =?utf-8?B?RTA3S2UxT25VQXpEaTNYZjF1Kzc3NktpSFFKYldUVzNWYTlNKzVXQT09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5adb70eb-f394-400c-713b-08dee0e68d4a
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Jul 2026 13:56:35.0042
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IlDtxfW3tTuET+a+uOXaQIyu9iueV3s/dJoeIqx8ocssSbG9teqUDaF/cIq5q2huwcoOAoOIstPofTj2ykQ8zOtSu8tCzdeiW9uYqujP01A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB7266
X-Rspamd-Action: no action
X-Spamd-Result: default: False [2.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[renesas.com,none];
	R_DKIM_ALLOW(-0.20)[bp.renesas.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39987-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[tuxon.dev,glider.be,kernel.org,gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[tuxon.dev:query timed out,bp.renesas.com:query timed out,renesas.com:query timed out,ty3pr01mb11346.jpnprd01.prod.outlook.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:claudiu.beznea@tuxon.dev,m:claudiu.beznea+renesas@tuxon.dev,m:geert+renesas@glider.be,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:magnus.damm@gmail.com,m:linux-renesas-soc@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:claudiu.beznea.uj@bp.renesas.com,m:wsa+renesas@sang-engineering.com,m:geert@glider.be,m:krzk@kernel.org,m:conor@kernel.org,m:magnusdamm@gmail.com,m:wsa@sang-engineering.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[bp.renesas.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[biju.das.jz@bp.renesas.com,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,renesas,dt];
	RSPAMD_EMAILBL_FAIL(0.00)[claudiu.beznea.uj.bp.renesas.com:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,TY3PR01MB11346.jpnprd01.prod.outlook.com:mid,renesas.com:email,sang-engineering.com:email,vger.kernel.org:from_smtp,bp.renesas.com:from_mime,bp.renesas.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4574174C0CE

SGkgQ2xhdWRpdSwNCg0KPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBjbGF1
ZGl1IGJlem5lYSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2Pg0KPiBTZW50OiAxMyBKdWx5IDIw
MjYgMTQ6MTkNCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NCA0LzVdIHBpbmN0cmw6IHJlbmVzYXM6
IHJ6ZzJsOiBBZGQgUlovRzNTIHN1cHBvcnQgZm9yIHNlbGVjdGluZyB0aGUgSTNDIHBvd2VyDQo+
IHNvdXJjZQ0KPiANCj4gSGksIEJpanUsDQo+IA0KPiBPbiA3LzEyLzI2IDE3OjU1LCBCaWp1IERh
cyB3cm90ZToNCj4gPiBIaSBDbGF1ZGl1LA0KPiA+DQo+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2gu
DQo+ID4NCj4gPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQ2xhdWRp
dSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhK3JlbmVzYXNAdHV4b24uZGV2Pg0KPiA+PiBTZW50OiAx
MCBKdWx5IDIwMjYgMTI6MzcNCj4gPj4gU3ViamVjdDogW1BBVENIIHY0IDQvNV0gcGluY3RybDog
cmVuZXNhczogcnpnMmw6IEFkZCBSWi9HM1Mgc3VwcG9ydA0KPiA+PiBmb3Igc2VsZWN0aW5nIHRo
ZSBJM0MgcG93ZXIgc291cmNlDQo+ID4+DQo+ID4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1
ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4NCj4gPj4NCj4gPj4gVGhlIFJlbmVzYXMgUlov
RzNTIEkzQyBwaW5zIGNhbiBiZSBwb3dlcmVkIGF0IGVpdGhlciAxLjhWIG9yIDEuMlYuDQo+ID4+
IFRoZSBwaW4gY29udHJvbGxlciBwcm92aWRlcyBhIHJlZ2lzdGVyIHRvIHNlbGVjdCBiZXR3ZWVu
IHRoZXNlIHR3byBvcHRpb25zLg0KPiA+PiBVcGRhdGUgdGhlIFJlbmVzYXMgUlovRzJMIHBpbiBj
b250cm9sbGVyIGRyaXZlciB0byBhbGxvdyBzZWxlY3RpbmcgdGhlIEkzQyBwb3dlciBzb3VyY2Ug
b24gUlovRzNTIFNvQy4NCj4gPj4NCj4gPj4gUmV2aWV3ZWQtYnk6IFdvbGZyYW0gU2FuZyA8d3Nh
K3JlbmVzYXNAc2FuZy1lbmdpbmVlcmluZy5jb20+DQo+ID4+IFRlc3RlZC1ieTogV29sZnJhbSBT
YW5nIDx3c2ErcmVuZXNhc0BzYW5nLWVuZ2luZWVyaW5nLmNvbT4NCj4gPj4gU2lnbmVkLW9mZi1i
eTogQ2xhdWRpdSBCZXpuZWEgPGNsYXVkaXUuYmV6bmVhLnVqQGJwLnJlbmVzYXMuY29tPg0KPiA+
PiAtLS0NCj4gPj4NCj4gPj4gQ2hhbmdlcyBpbiB2NDoNCj4gPj4gLSBub25lDQo+ID4+DQo+ID4+
IENoYW5nZXMgaW4gdjM6DQo+ID4+IC0gY29sbGVjdGVkIHRhZ3MNCj4gPj4NCj4gPj4gQ2hhbmdl
cyBpbiB2MjoNCj4gPj4gLSBub25lDQo+ID4+DQo+ID4+ICAgZHJpdmVycy9waW5jdHJsL3JlbmVz
YXMvcGluY3RybC1yemcybC5jIHwgNzMgKysrKysrKysrKysrKysrKysrKysrKystLQ0KPiA+PiAg
IDEgZmlsZSBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQ0KPiA+Pg0K
PiA+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5j
DQo+ID4+IGIvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4+IGlu
ZGV4IGI1MmE4NTA2NmY2My4uOWEwNzA2ZmVhMjIwIDEwMDY0NA0KPiA+PiAtLS0gYS9kcml2ZXJz
L3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMNCj4gPj4gKysrIGIvZHJpdmVycy9waW5j
dHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jDQo+ID4+IEBAIC02OSw2ICs2OSw3IEBADQo+ID4+
ICAgI2RlZmluZSBQSU5fQ0ZHX1BWREQxODMzX09USF9BV09fUE9DCUJJVCgxOSkgLyoga25vd24g
b24gUlovRzNMIG9ubHkgKi8NCj4gPj4gICAjZGVmaW5lIFBJTl9DRkdfUFZERDE4MzNfT1RIX0lT
T19QT0MJQklUKDIwKSAvKiBrbm93biBvbiBSWi9HM0wgb25seSAqLw0KPiA+PiAgICNkZWZpbmUg
UElOX0NGR19XRFRPVkZfTl9QT0MJCUJJVCgyMSkgLyoga25vd24gb24gUlovRzNMIG9ubHkgKi8N
Cj4gPj4gKyNkZWZpbmUgUElOX0NGR19JT19WTUNfSTNDCQlCSVQoMjIpDQo+ID4+DQo+ID4+ICAg
I2RlZmluZSBSWkcyTF9TSU5HTEVfUElOCQlCSVRfVUxMKDYzKQkvKiBEZWRpY2F0ZWQgcGluICov
DQo+ID4+ICAgI2RlZmluZSBSWkcyTF9WQVJJQUJMRV9DRkcJCUJJVF9VTEwoNjIpCS8qIFZhcmlh
YmxlIGNmZyBmb3IgcG9ydCBwaW5zICovDQo+ID4+IEBAIC0xODYsNiArMTg3LDkgQEANCj4gPj4g
ICAjZGVmaW5lIFBWRERfMzMwMAkJMAkvKiBJL08gZG9tYWluIHZvbHRhZ2UgPj0gMy4zViAqLw0K
PiA+PiAgICNkZWZpbmUgUFZERF9NQVNLCQkweDMNCj4gPj4NCj4gPj4gKyNkZWZpbmUgUFZERF9J
M0NfMTIwMAkJMQkvKiBJM0MgSS9PIGRvbWFpbiB2b2x0YWdlIDEuMlYgKi8NCj4gPj4gKyNkZWZp
bmUgUFZERF9JM0NfMTgwMAkJMAkvKiBJM0MgSS9PIGRvbWFpbiB2b2x0YWdlIDEuOFYgKi8NCj4g
Pj4gKw0KPiA+PiAgICNkZWZpbmUgUFdQUl9CMFdJCQlCSVQoNykJLyogQml0IFdyaXRlIERpc2Fi
bGUgKi8NCj4gPj4gICAjZGVmaW5lIFBXUFJfUEZDV0UJCUJJVCg2KQkvKiBQRkMgUmVnaXN0ZXIg
V3JpdGUgRW5hYmxlICovDQo+ID4+ICAgI2RlZmluZSBQV1BSX1JFR1dFX0EJCUJJVCg2KQkvKiBQ
RkMgYW5kIFBNQyBSZWdpc3RlciBXcml0ZSBFbmFibGUgb24gUlovVjJIKFApICovDQo+ID4+IEBA
IC0yNTcsNiArMjYxLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBwaW5fY29uZmlnX2l0ZW0gcmVu
ZXNhc19yenYyaF9jb25mX2l0ZW1zW10gPSB7DQo+ID4+ICAgICogQG9lbjogT0VOIHJlZ2lzdGVy
IG9mZnNldA0KPiA+PiAgICAqIEBxc3BpOiBRU1BJIHJlZ2lzdGVyIG9mZnNldA0KPiA+PiAgICAq
IEBvdGhlcl9wb2M6IE9USEVSX1BPQyByZWdpc3RlciBvZmZzZXQNCj4gPj4gKyAqIEBpM2Nfc2V0
OiBJM0NfU0VUIHJlZ2lzdGVyIG9mZnNldA0KPiA+PiAgICAqLw0KPiA+PiAgIHN0cnVjdCByemcy
bF9yZWdpc3Rlcl9vZmZzZXRzIHsNCj4gPj4gICAJdTE2IHB3cHI7DQo+ID4+IEBAIC0yNjUsNiAr
MjcwLDcgQEAgc3RydWN0IHJ6ZzJsX3JlZ2lzdGVyX29mZnNldHMgew0KPiA+PiAgIAl1MTYgb2Vu
Ow0KPiA+PiAgIAl1MTYgcXNwaTsNCj4gPj4gICAJdTE2IG90aGVyX3BvYzsNCj4gPj4gKwl1MTYg
aTNjX3NldDsNCj4gPg0KPiA+DQo+ID4+ICAgfTsNCj4gPj4NCj4gPj4gICAvKioNCj4gPj4gQEAg
LTI3Miw2ICsyNzgsNyBAQCBzdHJ1Y3QgcnpnMmxfcmVnaXN0ZXJfb2Zmc2V0cyB7DQo+ID4+ICAg
ICogQG90aGVyX3BvY19wdmRkMTgzM19vdGhfYXdvX3BvYzogUFZERDE4MzNfT1RIX0FXT19QT0Mg
bWFzaw0KPiA+PiAgICAqIEBvdGhlcl9wb2NfcHZkZDE4MzNfb3RoX2lzb19wb2M6IFBWREQxODMz
X09USF9JU09fUE9DIG1hc2sNCj4gPj4gICAgKiBAb3RoZXJfcG9jX3dkdG92Zl9uX3BvYzogV0RU
T1ZGX05fUE9DIG1hc2sNCj4gPj4gKyAqIEBpM2Nfc2V0X3BvYzogSTNDX1NFVF9QT0MgbWFzaw0K
PiA+PiAgICAqLw0KPiA+PiAgIHN0cnVjdCByemcybF9yZWdpc3Rlcl9tYXNrcyB7DQo+ID4+ICAg
CXVuaW9uIHsNCj4gPj4gQEAgLTI4MSw2ICsyODgsMTEgQEAgc3RydWN0IHJ6ZzJsX3JlZ2lzdGVy
X21hc2tzIHsNCj4gPj4gICAJCQl1OCBvdGhlcl9wb2NfcHZkZDE4MzNfb3RoX2lzb19wb2M7DQo+
ID4+ICAgCQkJdTggb3RoZXJfcG9jX3dkdG92Zl9uX3BvYzsNCj4gPj4gICAJCX07DQo+ID4+ICsN
Cj4gPj4gKwkJLyogUlovRzNTIG1hc2tzICovDQo+ID4+ICsJCXN0cnVjdCB7DQo+ID4+ICsJCQl1
OCBpM2Nfc2V0X3BvYzsNCj4gPg0KPiA+IEhvdyB0aGlzIFBPQyBpcyBkaWZmZXJlbnQgZnJvbSBF
dGhlcm5ldCwgU0RISSBhbmQgWFNQSSBQT0M/DQo+IA0KPiBEaWZmZXJlbnQgYml0IG1hc2sgYW5k
IG9mZnNldCBmb3IgSTNDIFNFVF9QT0MgY29tcGFyZWQgd2l0aCBFVEgsIFNESEksIFhTUEkuDQoN
ClJaL0czTCBoYXMgaTNjX3NldF9wb2MsIHdoaWNoIGhhcyBzYW1lIGJpdG1hc2sgYXMgb3RoZXJf
cG9jX3dkdG92Zl9uX3BvYy4NCk1heWJlIGNyZWF0ZSByZWdpc3RlciBzcGVjaWZpYyBtYXNrcz8/
DQoNCnN0cnVjdCBvdGhlcl9wb2MgYW5kIHN0cnVjdCBpM2Nfc2V0IGluc3RlYWQgb2YgdW5pb24u
IFNvIHRoYXQgYm90aCBSWi9HM0wgYW5kDQpSWi9HM1MgY2FuIHNoYXJlIHRoZSBzYW1lIHN0cnVj
dCBmb3IgaTNjLg0KDQpDaGVlcnMsDQpCaWp1DQo=

