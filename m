Return-Path: <linux-gpio+bounces-25171-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BFAB3B2A6
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 07:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B1FB565E04
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Aug 2025 05:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B24F421CC6A;
	Fri, 29 Aug 2025 05:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="D31EYeEl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022112.outbound.protection.outlook.com [40.107.75.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA8CEACE;
	Fri, 29 Aug 2025 05:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756446295; cv=fail; b=icMfSuPRtx2ojrCKlYx9CGFUftrL3E9Xj1b0Cq8n3Yt/UQmlYgj7LMQ748pPa3loBUPW4vKzxXijfy80PkEkmp8ED3TJPA5gCknOnld4OqorZwLHdKAlSJvgVtS9mUlM7RtHNUSMo+1UjYWykZc9wcnX+hndKir3IJMhwoNceMI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756446295; c=relaxed/simple;
	bh=XcISyDzLA5o+9gm3u/a6hheKVCwUhyhw6ZAT7WB33tc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=OmggQvgotOxmL1ufsqetpY7HQDkXWmFoabYHrHhKFgza2oKI8puAifV36vHdVBtd0k3lpu5tm44zPdyq/EGRe/MrxmY86/b4YalrarrwhxNo1IVRHCKqbhkfSKTuRlR8qQdI6UsBqid220CcU9lINsxLFUbS6KM3ga/oAaz+ROo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=D31EYeEl; arc=fail smtp.client-ip=40.107.75.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TyaI41ooiljdfbLyhSBDPJR3kk+vpYO7h+6pUM9jAKURFoj9ELJfhEG+SjGTt6PnPPMtLm5EbxmFH+ABMlZgMNWI80a6oOue55eJn0KORbpkpPe0Z8VFcQAElzlnW3Vk6k0Ecm/IMFb68AsS9hhJSHgkkhzXC6ZBIauL1eDGj+ju7T6bfOgIysDnazN41ueFkU2libDaM/yLX+MYCcoHmR7SvLtU7nYp722+zsDQy7J1NTt+US0Ta2b7sFK4il1LAo+eSSDVoVTOiFDTYv3syRxjUGThwcsDXYEWs9lCruo/32J70NMNY4dxZDeZykEW6e6hs85DZM8Cwd6MniMgJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XcISyDzLA5o+9gm3u/a6hheKVCwUhyhw6ZAT7WB33tc=;
 b=We6VeE4skWQBlnF/GbPgRhcTaesFmCkryK2JFgrJ2zSsasWVblcwjvAR9aWmR6h4EiFH85m+6KBGKnHoWbE66HbkW4uA7tchTOAF4mhKgk20k2dHwFJDDisGrUE29ododoeOwSJttl6mt9UQ0pFJX/7BTktqhgeHHu0zDNSuNsvALby7DoAnhnlw/gYEQlgNgjPwselfYJcjw8AcMbuDBL1NsEXhtwgAfXrKtcWpS/mJbrY4Jk7Jur+YiZqJB9pI9WUQAlCN9A7RuKd2s4fMX8OemHg3QfSoWbzl2npUGIgpS77ax4CEPkJTgvNeR1i8DtaY9jnLdDiSsZi42Qv7Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcISyDzLA5o+9gm3u/a6hheKVCwUhyhw6ZAT7WB33tc=;
 b=D31EYeElg7EWrhv56hzhkJUH2G7MC+EfiwmcAcCkYHfbK04dfYGJU8IwHsXU8yAzPqG2Yl6vXJBeNd7g3DW0vV9u/s4N43DQoaaCMD+ZNGxWhrmiPfvZfpWE+Ftc72yMwq099K5L3iyNphX05FDkic2JljpsBolV9V3MzY89G3d0Lm+jzGbUQeIxhyhT/ymkJmJXHvgYNvin17K+nAOsgWCvoUE1LsXiKOM3mfaCo7Ae/UdFH2mLlDa/tK89iz7l69M/xaYo1//HmTwniORJDK7dgwrGMHnNlBRyba7G2phMhESoVUPrJ4JCDdD78JQd36lZxTkc9aN9I3XJjt+cEA==
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com (2603:1096:101:5a::12)
 by TYSPR06MB7300.apcprd06.prod.outlook.com (2603:1096:405:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.18; Fri, 29 Aug
 2025 05:44:49 +0000
Received: from SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28]) by SEYPR06MB5134.apcprd06.prod.outlook.com
 ([fe80::6b58:6014:be6e:2f28%7]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 05:44:49 +0000
From: Jacky Chou <jacky_chou@aspeedtech.com>
To: Linus Walleij <linus.walleij@linaro.org>
CC: "bhelgaas@google.com" <bhelgaas@google.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>,
	"mani@kernel.org" <mani@kernel.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "joel@jms.id.au" <joel@jms.id.au>,
	"andrew@codeconstruct.com.au" <andrew@codeconstruct.com.au>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "openbmc@lists.ozlabs.org"
	<openbmc@lists.ozlabs.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "p.zabel@pengutronix.de"
	<p.zabel@pengutronix.de>
Subject: [PATCH v2 07/10] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
Thread-Topic: [PATCH v2 07/10] pinctrl: aspeed-g6: Add PCIe RC PERST pin group
Thread-Index: AQHb9TqkZIPjABfTrEyMyLl2n5mCDrQ/neKAgDZ1WqCAArwTgIAAjOJw
Date: Fri, 29 Aug 2025 05:44:49 +0000
Message-ID:
 <SEYPR06MB51346DEE6FD0A7D3D654759D9D3AA@SEYPR06MB5134.apcprd06.prod.outlook.com>
References: <20250715034320.2553837-1-jacky_chou@aspeedtech.com>
 <20250715034320.2553837-8-jacky_chou@aspeedtech.com>
 <CACRpkdarn16N9637dL=Qo8X8o==7T=wBfHdXPczU=Rv3b270KQ@mail.gmail.com>
 <SEYPR06MB513491FF4398138F8A52A5469D38A@SEYPR06MB5134.apcprd06.prod.outlook.com>
 <CACRpkdbmRpH1+HtW+vbK7rVk6OCEve54BxTAxrUhX631a2KP1w@mail.gmail.com>
In-Reply-To:
 <CACRpkdbmRpH1+HtW+vbK7rVk6OCEve54BxTAxrUhX631a2KP1w@mail.gmail.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SEYPR06MB5134:EE_|TYSPR06MB7300:EE_
x-ms-office365-filtering-correlation-id: f9849961-bb10-4000-89a1-08dde6bf2b1b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Slh5Uk9DbXRTSDl2c1YxYktMY3ZGR0U1a2wydCtYczBEMTdzTUQvMk1xcE5k?=
 =?utf-8?B?QkF6NVdZNkpLQUxHcTN1NlYzUGpjVmJCWmdaMTgxVVFueDlNbUpFemRTOGVR?=
 =?utf-8?B?ZHhiTGt1ejZWL1ZseDlCR0lLNDA0aTVXQ2ZyTnRLV21vUnZQaVdBMXhONDNO?=
 =?utf-8?B?QWJ4Z1lpNk90U1lXeFVWUmplanU2NE0rQksyUXJtbHFiQVlDeEMzVVZxVFp4?=
 =?utf-8?B?R1YxTHc5WHpvZjRmOHFJOTU1N3hOcFZEVmpLOVRhOElqVUU1TWgvOWxyMytQ?=
 =?utf-8?B?ZU1MaGduTlJRSDlOcDlnc2RJWFYvZ09BeHM0OG05NVo0c29OZG9KTFlOcWZ2?=
 =?utf-8?B?L3VHSXIxUzkya3pQRUphOHFBMFJrVHl2Y3h2SDZpdGd3elBBM3BpVVZ1L3BU?=
 =?utf-8?B?MUMxSlJvQjZuaWd1MExRcFptVjNrTThxaW5pQUVBbjYwVXh4RlcvYWJNR1VE?=
 =?utf-8?B?QzAyb1VvYWVidDRzeFE4WXlnTXQrOHZ3elB3WFlpeGxxazQwa1JYa1RKaUhi?=
 =?utf-8?B?SllGM2RYZ0ZPd0tIcVUyUFhHVjRMWFIwN2owakRrRW91V2Y0eUsyVWZEd2J6?=
 =?utf-8?B?UlpmU1hlZktGZnFkZjNxNUlyTGNtM3V2Z0JXWmVnVkZraXlRY2g1SHA5Vnlx?=
 =?utf-8?B?VGVJekdxOEkvYlNKY1FMb1pQaTdhRWw1R0lFcTlyVUcxSzYvMkdDSS9PUHht?=
 =?utf-8?B?UStlZzd6RjdIK2granNvalh1RzhpZEEybkF6SkVUY2ZIUExXYVYzdTd2YUlt?=
 =?utf-8?B?SEdKSThpSzFoTFNKUmUxZXBJV3MrQktQclhvNFdYUGw5RURwWUJjSlhRV1Jn?=
 =?utf-8?B?a3Z1eVlSbldleEJjQUZpMzBGN3dYZzFTQTFsWkJOQTlMTExNY01IaDJGcENM?=
 =?utf-8?B?YnJHSmZUMHZ3dzhmVHFBV054L1FXV2tYWkRzSDlvUUNKZXJmT0w3T05mVFYz?=
 =?utf-8?B?VHFNNHlMN0FtZUlYaW5kRFJwd0ZoUHh6UGhCUXdCNm0rZ04yeDFLeW1CNnlo?=
 =?utf-8?B?WHpMT0ZMeGQyRGdBZFV4UXdDNi9zQU9kS2gxZmFUdXg4R002aXpUSmpDem1i?=
 =?utf-8?B?aXR4c1hnTG1kdmVTZmpRUUpQT2c0OW5udmlZQXV5enpDSDE3bFYzSGhzVFhL?=
 =?utf-8?B?bVFkTzRjNzErekRyVEJQUURqVG1HRW16Q3VZMUxEdUdWWXpQcXNtVWNHaDNt?=
 =?utf-8?B?YmlnUW9rK3NIY2gwUUYwb1V5QnJ1VmR3T2lXcTE4TXVkSnUzZE1WM0JVSlpU?=
 =?utf-8?B?bHRJY29uWmxSVnlmQkk1VHQ4c1JWNFByb2FjaFVVOFJ4c1oxRHU0MXp3MVEv?=
 =?utf-8?B?NW93NExJcTk0ZUtVUFE4MEQzU0hTNHdkNlNQKzBMZDNRZXZscjM3QmQ1ODRG?=
 =?utf-8?B?b3NxMmZmL2lRTVBEQXRqNG1KMU42UmdWSTJUTW9IZEZmaUNlUStQcThIQVBi?=
 =?utf-8?B?QStreG9DMjNZSWE4Tjg3cU55ajZVYi9rVDV0VmYzZXFYSkhLa1ZYejZRd1VO?=
 =?utf-8?B?ZmcrNkRwbWFwSE50bEVxQmlDRnVOMForSUJCeE1hSnJHUjYwSU5BdWFjenh2?=
 =?utf-8?B?QUFFWEt3R1U3cUI3MFJtQXdrVy9OOTFUUmIwTnVhdDl2NXZIa0o1QS9qWnAr?=
 =?utf-8?B?bGx4VGI1b1FyODNXaTNxLzE4VDVES21LdktFbFVrVThCZHZPZVZsS2FZY0pD?=
 =?utf-8?B?eEhCTmtvV1ZvUnBob0g0N2xWMTJTdkxaMFNOYXhKNGdqLzFtUGVmWS8rWFVx?=
 =?utf-8?B?VDN1SVJkNzQzWnJoUWhIdVhLalF6VEZQbmk2OGhPMWlFb2R3K2F5cGszSUMz?=
 =?utf-8?B?MlVIUGdJTnJYb3hQaU80b2tSY0FlamxEaVhaNktOY0JsaUFKQmEwVWIwdHEz?=
 =?utf-8?B?blVFZVEzZHRHTWR5Sk9wYWYyL1ZBSHZUTnQxMys0b3pPcHMrWTd2Z29MYk85?=
 =?utf-8?B?cHc0Mm41RzI5ZVM4V2gxZGlEamtLMWs3ZkcyY3RpN0tOVmNTdnNJVlFjQ3JK?=
 =?utf-8?B?SnZYZlpOaDRRPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEYPR06MB5134.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TTRPc01RMEhPYW9MSjVCcWxoaGZIQ2M3ZDBFYWRBdTQ1UloyVEJEcDlRa0dB?=
 =?utf-8?B?WU1YUEcwUFI5V1JBK3NMYkxTWTZUUHYzMVpGakRVYXB3WnNmVTdQS0FtbVZL?=
 =?utf-8?B?b3QxcHphK0tYeFJzV1g1YVB6bm1CZ1dkSG9sRHRVK1g3Y2E5UGNVTk5QNmd3?=
 =?utf-8?B?MFNyVW5VUUkzL001bk9RREtyYkhBcWZoMG5sV2NCSFpuQWZhak9vckIzenNW?=
 =?utf-8?B?UmVRQUJuS3AvcXBwVUxyOFhQLy9xSGozNlJ5TmhXaUVkN1p2OWthVWZZTk40?=
 =?utf-8?B?T2xjUjdqbDduTTB6dENOaVdVdHlQVVRvU3R5eFVJRWd2QldRZlB1OUJIbGRB?=
 =?utf-8?B?bWowYXloZWpCbE1oakpJbXA1Wld2L1NtVktSMzN5RGU2YU1jNlhKSjBBSFVr?=
 =?utf-8?B?bldQdXVoWmRnNzVNL1hkVHJheVBzT2VkWks3U2dMc3V4c3BDUzdKMW9IMXJr?=
 =?utf-8?B?ZkpwWWRab0M1NDJTcTdCU0JZa1p0RWpIS09RWnRHVUF5SGVRYm03Qml2MHUx?=
 =?utf-8?B?aktMM3Fkb2hMVndicWhiKzFFdWI3Ujl2ZnhYNHZadnY5cWwzMDFyVEVJN1Uy?=
 =?utf-8?B?NW9PZWdiR0hGVjV6TU1xWjZhMnFWQzB3MUs4MVRQVTBiL3laYmR1dk5mbDBx?=
 =?utf-8?B?aDMwcGtUV0M5amhJK1pQUDNqM2RZS29iei8veVNWT2tPWXpmZjY2ZVFmMEtv?=
 =?utf-8?B?eTRpLzRRZlEvOTk1aVlXTUpwN2FvQmtVVUlIc0QrVzZrVkNXd0VjWGVpdjBv?=
 =?utf-8?B?YktBMG9kM05jSzhWdDEwY2lPZnBFNC8wOURvTFZhN3plK1Ewa0J3V0szVDlz?=
 =?utf-8?B?dFdpUTQ1dGJESEloV2JFRFJBRUZaUGZKMWtsd0l4UTJXa1RSZmMwMmR6V0Ux?=
 =?utf-8?B?cmx0TWdESE5Wbzd6TFg2cGZJRTFqTzUveWpXYXJOUEpPWEYzZXpla01EcDVo?=
 =?utf-8?B?TU9yRnExMnExVXFxR04wbklrelE1WUtSM2dUblc1SHBZbzBON2pIdEZid0R5?=
 =?utf-8?B?SWxtbHd6aU5KQWdpU3VueWZ0N1h5SEFMcE14OXVmUlJYbVRUc0VJdUhsaTJn?=
 =?utf-8?B?QkpWamhvaUNEa0J1c1dGSFU3WlVqaXZPd2NrbThEaDN1UG5ORVVZRkt2VGg1?=
 =?utf-8?B?Q0Y1aUIxcmRlU0s4REREdXBhWWJuSFBZOTg3L1o4NXdyTm9vQWp1VnpjZkpu?=
 =?utf-8?B?QVQ3MVNrbHk3NzE3K3BhWXlRMW1HNDJ5OVY4K21qSUNIMHdsMGpxVFBlankr?=
 =?utf-8?B?RjhNMXpxQXh5eG0xZHExb2J3OUlBN2ZSSG1vSW5aTURMMkpMc2JEMjJxN1lW?=
 =?utf-8?B?UUZFb2xPVThjbHQyVTRwUThDb2RtaDEwL0Uza01tSEZxVDhpRUNJUmxGRWd2?=
 =?utf-8?B?RkV3VWRLdkpzejdOSnBOa2M3ZDV3Zy9tNG0reTRWUkZ6bGNQSWxWRDNSdHd3?=
 =?utf-8?B?ODk1cDJxWlFjTmNrdzhSc1VnazIrTkxVeE8rdWV3aWhYZFZjTWMrQmFoMjZq?=
 =?utf-8?B?S1JRNjN6dFUrRmpLaTFJWDd5NXhKMDB3R2QvUFNZa0VKbDdYR1ZLM2s0OU9n?=
 =?utf-8?B?ODVWMnhxRjlDZHNNSjNHaUxQaFdtMlNmMFoxUnFnd2pERlUwNUtiTVJBZTFn?=
 =?utf-8?B?emVuR3Y0dnlFMzVmRmxGckFZZEo3dGJpS3RMemhyZ3dpNko0K2VneXEvQTJq?=
 =?utf-8?B?WGxqYUVSaUQrVFlhRGhITlgrTzNtUjdyWTBDOTZwbDJQeUlJeEpENThBSndO?=
 =?utf-8?B?cjNWNVRTOVZNMXNvODBLMXY0czNuTHl0M1FyOHdDNjQzbkIzOUozbEkvUnlh?=
 =?utf-8?B?QjJodDhjZkZpUDZ2U2RWTm5FNFpwZFQzdmdka3QrVVJZd29RR3NVbkNDUk1x?=
 =?utf-8?B?QzF6bWV4c0h6YVZJU3liVWlpQ1UrNjhVb0RDSTVJNjNvdlZSOEdTbFYzUllO?=
 =?utf-8?B?TTByZWU4QjJoeUQvWm1takZlOWRWVWRIczh2R3JSbzE2aWNISTF2c2ZkK1dl?=
 =?utf-8?B?eWtuVldQMXpCc0RrazVoaXNBNFlUWEpNeWNHc01jMW1jaEtpZEdQTUJrcVR4?=
 =?utf-8?B?NkVTT1dlTk9venp0QVlMM2liU0VNQTNwaW1jeHZvMC9iMlcwT2xmVWpsNGRR?=
 =?utf-8?Q?/tNzYK5YPu3MGwyjnyYaH3Bl9?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SEYPR06MB5134.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9849961-bb10-4000-89a1-08dde6bf2b1b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2025 05:44:49.2441
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /z+I5Am/Ad0HlpbgAjOcYJ0wFwffGs+EpPN8s+4gISL7zrvmEEPJdfDfC0IVUhwmKLogBxgQtplxBkRo3y1WtZ5siJGhgrD37R0AWd1xzy8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7300

SGkgTGludXMNCg0KPiA+IE1heSBJIHJlbW92ZSB0aGlzIHBhdGNoIGluIHRoZSBuZXh0IHZlcnNp
b24gb2YgdGhpcyBzZXJpZXM/DQo+IA0KPiBZZXMsIGFuZCBpbiBmYWN0IGl0IGNvdWxkIGhhdmUg
YmVlbiBzZW50IHNlcGFyYXRlbHkgZnJvbSB0aGUgcmVzdCBhcyB3ZWxsLCBubw0KPiBuZWVkIHRv
IGtlZXAgdGhpbmdzIGluIGEgYmlnIGJ1bmRsZSwgaXQncyBlYXNpZXIgdG8gbWVyZ2UgaW4gc21h
bGwgcGllY2VzLg0KPiANCj4gVGhlIG9ubHkgdXBzaWRlIHdpdGggdGhlIGJpZyBidW5kbGVzIGlz
IHRvIGhlbHAgZGV2ZWxvcGVycyBkZXZlbG9wIGFsbCBpbiBvbmUNCj4gcGxhY2UgYW5kIGhhdmUg
YSAiYmlnIGJyYW5jaCIgdG8gdGVzdC4NCj4gQnV0IGl0IGRvZXNuJ3QgcmVhbGx5IGhlbHAgdGhl
IExpbnV4IHN1YnN5c3RlbSBtYWludGFpbmVycy4NCj4gDQoNClRoYW5rIHlvdS4NCk5leHQgdGlt
ZSBJIHNlbmQgYSBzZXJpZXMgb2YgcGF0Y2hlcywgSSB3aWxsIGNvbnNpZGVyIHdoZXRoZXIgaXQg
Y2FuIGJlIHNwbGl0IGludG8gc21hbGxlciB0b3BpYy4NCg0KVGhhbmtzLA0KSmFja3kNCg0K

