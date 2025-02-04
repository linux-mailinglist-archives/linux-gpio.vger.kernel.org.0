Return-Path: <linux-gpio+bounces-15310-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 44551A26AA2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 04:31:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C5EB1167EDE
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 03:31:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DC8D156237;
	Tue,  4 Feb 2025 03:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="hTU4pgov"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D923597D;
	Tue,  4 Feb 2025 03:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738639869; cv=fail; b=lmKbn9olw6GuGJGclUJj69a4beYvKJpiJ+fGoNEDjuRHWXR+7B7SlRzFK2SbcmaPt0Qz6AViy7MU+YQXrHwwUifZv/LMyRubkvynNMD9gjQ9Yenh6NS5ZAU7qLyXeF2i+/54Ht2UwO31vbwXHyVqjW8aEvMC+J8tH1hCHneOEi4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738639869; c=relaxed/simple;
	bh=9fP9/CZLwMf2NWJIcjZuhCem9bPA737nbKxSndNnn+o=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=plekQ4nyIgpMUXdNzsU8BxMWGmC4juuGtgZkb7bXUYPhahAkvyyLJPDIoBRfnQfYDAs02QLUzC/1t6E6zkSRhArtEG9kNJo3o+L4jpolY1q8pf9E23lt0BY02PCUtapHLIb9U8vnt+T3C+sg5owNOp9ugsF5rUecVE8tRrTXPn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=hTU4pgov; arc=fail smtp.client-ip=40.107.21.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I4DDb26G3OhQGuoAHjnrkkZpsy5ulZ0oGD4+rPZ3su+UeKDfg7JRlAJJ+6Mj3ae/WyTF5ZjGlYx2drB/hSCSvTtGflKSzvU1IWp8ZhhxJ/McBDDZz1xxKy501VmtuCdpQ7UPxbOuz+YSc6FvSz4FYjgll/P5T9NsnkxiIOK+FFoh0wJtyO4aYX6uH8PpjDGyY3KeTj4Sy788yQc9/FSZGOnvJQ6kWYyU5PrCgyfVEJY3OS/jzGV570J/o8wgTiTe13+oH/LsF0L9h2PpG/ABbzXDFc1OmVyt2zwfncqDpp/XLsKG0DGolksyaMzAepUhEo5qxM4dXNbXfmzZvJHeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fP9/CZLwMf2NWJIcjZuhCem9bPA737nbKxSndNnn+o=;
 b=YdzzzfLS3W/BsldOn8lDzrGoII4ivJZRBHD5QuqwEdl9E6e85vssQiZLTy9L7UkR2E8gIpjQAoME5qz7YPz8VraoBqrqy0nBvZLNHA/in14idEIdxN+ukZrtmyWu2rhfpvzAE5XjVKHcsojhPuQfWgm1FLRlUTKqTnUIhqWpbTp2lmaur46+6DOGX5jn0EJ0dZfISL/IgAmCFCm44Y/h3nPnmAPBn3//AF5SFxeOsC8Wj9FnlqOEFOkOk4gdChheiDYLdcBqDz/K6jJDAu6lhImXomfmwN4oqJcmbpcOvVz9cIq9rIx1os2OZBbE8CqXkLN1tFtXa6h5eimvhbRWdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fP9/CZLwMf2NWJIcjZuhCem9bPA737nbKxSndNnn+o=;
 b=hTU4pgovxxjqou1A40e7NidtmWp+rmKN9hEgGFgCXsDBi+TAL+X9j6LgSwp7ze4LH2JhqfGYnwDZ0/00M4cNALC+CmdlPEF+KCarjYlCnLCujgsGB8+ArXsJdqDPfDlDJYwMKNU7msdsDTh5SB58yxedl7T4MiHUDWPyy+zHkqXmpWuHOnn8qmXsqpKb/h+kf6i0HwgrlT2f3zqLvVOT3u5xSGZEE6lrwUfBRnLGPkICHiSfDpbkcg4EMFZ5LzJflG50a+32hV0kJ2hIJY1YaHL1hvKCxJ6T+U6oQ2fYB1JtPrchL7Zh+P/9kLjIbOXkz+ulPUmfBhRer6TJX4vpnw==
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DB8PR04MB7145.eurprd04.prod.outlook.com (2603:10a6:10:fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.24; Tue, 4 Feb
 2025 03:31:04 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%3]) with mapi id 15.20.8398.025; Tue, 4 Feb 2025
 03:31:04 +0000
From: Peng Fan <peng.fan@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Saravana
 Kannan <saravanak@google.com>, Linus Walleij <linus.walleij@linaro.org>,
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>
CC: "arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: RE: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce allow/block
 list to address devlink issue
Thread-Topic: [PATCH v2 0/4] scmi: Bypass set fwnode and introduce allow/block
 list to address devlink issue
Thread-Index: AQHbawrvJl1naB6HjUG3HU+URXLwBLM2lDKg
Date: Tue, 4 Feb 2025 03:31:04 +0000
Message-ID:
 <PAXPR04MB845925677F9AB860552A421988F42@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
In-Reply-To: <20250120-scmi-fwdevlink-v2-0-3af2fa37dbac@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8459:EE_|DB8PR04MB7145:EE_
x-ms-office365-filtering-correlation-id: f0d355c5-3a30-4b9b-861b-08dd44cc5ac3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700018|921020;
x-microsoft-antispam-message-info:
 =?utf-8?B?aXZRT08xZzhUV25nUmM2QlJKZDlrV1l6elZmbng3SHJYYStpVzF4TUFNM3hk?=
 =?utf-8?B?eGpDM2Ivb3I1cE1Da2d3d0tFTjQzRkxxZ21oQU1tTUVvS0tOWUF0T2RRMlVM?=
 =?utf-8?B?ZG1NM1M0dStKbnJFTzBwbEQ1QkZTTzZBdjFsZTJDakY4WmdncGFsdCs2WjdN?=
 =?utf-8?B?NXVpdmh3RWFMOHpzeG9xWm5mN2dpQVpIcXRhYjVFbW1FRmE1eS9rUzV2N1RE?=
 =?utf-8?B?OGIyVE5iUktwbHJ0RUt3ZmVvZUtscHdBSlpQNTcwMnFxRjJtaThGMHlQS3Z4?=
 =?utf-8?B?eFl0SVlqSmNaa1BOdzN4Z2R2OFBGYkdqK0FPcGF5ZlFiditsYktBSVc2c0dB?=
 =?utf-8?B?ODB0RUd1U1V1SUdaR0RXNEZNMU56OGFVUDQ0SlpUZ3FaTWFxMlowbHNaY1NV?=
 =?utf-8?B?VXIxV2VXSmNCZlA1blN5cVcyb2p2L2hBSUdPY0UxYlUxZi85L0lLc1NUTDNQ?=
 =?utf-8?B?Nkpvb3NOT1RZMXQxZlk2cEJXWjNsaW5rcFg5aTZVV2ZaL2VJZXBYb3hXL2tS?=
 =?utf-8?B?ZGRNeUEybm1pUUhjRmtDcnVhMm54bEcrUHpqR2g4V091V3JjZld3ck5hZVR6?=
 =?utf-8?B?ZE55OThFOGF0Z0dqUEpRZmJCOUlFVVNkQ0dwODhJL2Z4S0hVbk1OMHJ6c0JT?=
 =?utf-8?B?azYwMm1HZ3RpNWRpcFVveENkQ2VlQTdXK2NQeGRNZ3g5RFNPNG9oRW5QRWJN?=
 =?utf-8?B?dUx1eXQzN3pXeGlkcSswVVR1d1h2T2NPZTVWdEQ4di9wMyt1RUgreWpOWEF4?=
 =?utf-8?B?aENpWFlYU2RxQmF0NkIreDZYM3BoQ1FOVVNnQVhNYXZUanIreDUyc1pTcmlX?=
 =?utf-8?B?TW9WdnRjU2lKUHRYN2hmQldEWUxRTnUyejNnWDkwVWNjOVFkd3Q1d3V6WU1l?=
 =?utf-8?B?OTNXV04rUHdrRFE3bkpOZGlrc0taQnR0a0pDMmlLUUUrWkNvQzZZSWNmWmRa?=
 =?utf-8?B?dm5sdlpVM3ZZakhvRkNaeG1wMUxXRmpDSHhUbGpVRDFTS1UvRnBITHFWV0wz?=
 =?utf-8?B?ZjFLeklJclRNTHkrUEw0N2U2SUwreUxMdWpCeWhQdmR4aDJMWmQzYllVMHE4?=
 =?utf-8?B?ZHF6N1A1V2tFVmVycDBadzhydXJubSs5WWZWb2YyL0owRC9uZjM0d0FPTUE4?=
 =?utf-8?B?Vml3OVcva1I1ZkpEWGx6TEthT01UN041U2NtOWh0NFRuV1kwOHVQdHdPTTEz?=
 =?utf-8?B?dGJwZHVYVWZTMkFrNGFzVDdNQUpQZ3FBUFNyMk40OEpqQ2lOYkpmNEtDN0Rx?=
 =?utf-8?B?cklrTTJDdldNa09BY0hLRzgyZXhyZnpqSnpwSVZMZTNWcjNHUFBZNURTRzN1?=
 =?utf-8?B?ZE5QblovZFZSSzhYZlJJRm9sSHJnWGs1TFBrWENpbmJZYnloZFIwTEF6Qmdi?=
 =?utf-8?B?WlhCclUrNk1PaHRlcU43eTZaakF5a2Z6K0lqZVdtUCtCRHlMR1hjalBKcGt5?=
 =?utf-8?B?QzRnb3NXZTF4d1RCTk5zQldmclBibm01aUl4QUlaeVhMVEg5OURROUJrRzhi?=
 =?utf-8?B?QTRjbXVlYXhRcTgvemYwazZYaUhRejB4a0hOWVJkZ1VqWVVnZEJqL2FmeklV?=
 =?utf-8?B?dzZRakU4VTcvTjVrOG4xb012YzFSaWFQTEpSbGh2U0hFRTdKV3ZGbXdZY0JT?=
 =?utf-8?B?ZkNjV2xkckNJeWh4bjlrcVorSVNUVzU1R09hSzVXelE1R2tmWTU0M1I0Zm02?=
 =?utf-8?B?TlNHaFRYNjNhb1hvMGRtd2t1Q3JVRVBJbUNYOFNXL0pycGtSTFd4cE0zenoz?=
 =?utf-8?B?R3ROcUR1NGlhNjFyT25VNUpYRmx1REJTY3ZudXBUWnN4Q1BZR1RIRy9KOERT?=
 =?utf-8?B?cVhFcHpjTmljcWJRQ2FjUHFPNEg1MkFSWXBsUXV0RWtTZHRNb0xHVTc2QkN4?=
 =?utf-8?B?ZkhHN3g4d1ZzckFYSHZ2SUY0MHY1NVNMa0ticlBSdUJPM0krVTQ1MkNUOHRz?=
 =?utf-8?B?Z1RCYWJvdkRjSHVuTUR2UTZVTWs5SU9ydldMMkt4cHdyZ1k3cjVxcGVrOWV1?=
 =?utf-8?B?SEZTOEJnRUxnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700018)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MTROYWZldzlkM1NJSGVPUTNUYVJoa3cyWlBKekxtV29HbysySmhPN1l5bnNL?=
 =?utf-8?B?aTd2UVRPWVlsRnFneFdwUlBBY0lGbERyRlhaZkRlRzFPQVhkbE1JMHEzVzZI?=
 =?utf-8?B?NHMvb3FOZ2UyV2d6aXVUL3ZraDhIbncvV0hZdmZOTXNYeVIrOU0vZm9mZy9h?=
 =?utf-8?B?RmlYZ3hET291b2dCazRYUW92VlBEL0dSb01CakxJOHBzR1BZS2QrcTQrQVJi?=
 =?utf-8?B?d0lxcGdSU0o3YmJKNGZ4ZzRQbXZSNDdpSzBhVkovZFJEOFhTNStEZVVqb2hw?=
 =?utf-8?B?MzJjM0FlOFJwZDgvVGo4VW5yUkxNbDRGZS9jTDVLdDZ1emtUSVFYbzAvSjFv?=
 =?utf-8?B?Tml1bGs3ekgzUjdMd0VTRkg4ay9vYkRCOXo4aU1LaEh2NTFTMWE0ZVNXS1Vs?=
 =?utf-8?B?a0F5Z0NuQ28vbGJlNVoycXE2WVYxQTk5ZnJPNmZzZjFPdHVzZWd3Yld0OEVn?=
 =?utf-8?B?dG9zcmQrNlppTUUwU1hKWklaMFRiZHpSckxCdVFJK0FzV2hJRFJTUEdhSWMy?=
 =?utf-8?B?SXEvVklPd05KUVlOeXdnSk1nbkMyaGpWQytqVXgyaU1DQjN0L0dzUXVkRGp0?=
 =?utf-8?B?MitSVk1LUkJzNWlkMWpSbjFmekNCMmNNZ3ozck5ReHQyMzh5U283bGFvaDdx?=
 =?utf-8?B?bUVtVDQxc3BwM0IyaHk5SmlJL0k4Rnh5SkZvcHBBTC9xRmU1ZWtqVi9HRTV1?=
 =?utf-8?B?RmpGeldkVkJiK016YVhKVnNrREI0Rks0cTEveE1JYTNqRlpXVWNKZE9wRzhr?=
 =?utf-8?B?amtXOEgvdzNieXhBWU9IMjFqdG84L24xTFBrNmJaZkFOWDNIa1poK3k2bnM3?=
 =?utf-8?B?UEk0SWJwK2szdEFtL1RQc2RsQTRNeTJPbnlZTHNyVE51akFqSGxMcWdYZEE4?=
 =?utf-8?B?NVVxK2tKb04zVnRZTk5ZZTQ0YXlEWDJ5K3VDbDJnL3pkeE5nSUI4VVVtZ2U5?=
 =?utf-8?B?MVBPU21YeG9WaG0ya1VNcVVVd0s5bGlKOXk4QU4zbGFOV2orbHZ6V0dua1d4?=
 =?utf-8?B?ZWNlL3JGN1JCVmNreWIvd0Y2dXFzOEl0dkxtWUw2NFE4SDdjdjJjcVFDNElj?=
 =?utf-8?B?YjNrT0tjb1I4cDFrbjZ1TG81ZGxhYld0cnhab0M5L1gwS3JLdEpjb1QyNjM4?=
 =?utf-8?B?MWtrcS9MY1dsTXdFSjBtS0txNjk5TnQyNUd5bFlLSGgxTmx0TlI4RHQvd1Yr?=
 =?utf-8?B?SGdHMEJhQkNjaEJzZGxaWG5DR0svbFBKZTQ0ZmVxSGhDY2lmbWYwSk1aM21h?=
 =?utf-8?B?bExjeFVjUXJsUVAvdmhEUUFYTS9qMUFCK2F3OCtvVDY3c2F3N2lnRHRMa2hH?=
 =?utf-8?B?RWJmMVk2L2FqWGR3NndNcjVvVStUZ0FiQ0NodHR3U1QxazNDWjdmQ3kzQ3po?=
 =?utf-8?B?VDFwL1NUYWsxSXd5SGxSeXRrUEcxd0VuaVFvV01RQ01RdVZiWGpiOTh1b3l1?=
 =?utf-8?B?OVZrL2JDMGVaUkNmSk9IVEdiSkhCNGhNdy9wSU8xa3p2Qy9UQ1BwbzlFb1ZS?=
 =?utf-8?B?NlN0c3BWMDVRbmZLdkJaeDRsbnBkN0hoeGcxVkllVGJmNXkvWFR0bFZIU044?=
 =?utf-8?B?eE0yZi8rZ1lXSm15d2NxcUZFcHJkUHBNUVdQUXgzb0JJankzSVFzcXpnMUIy?=
 =?utf-8?B?MThBd0w3Wm1ERnd1clo0NzdwZGJzR2E1Rys5L3ZFeE5FdWt2QmI2bnpsenc5?=
 =?utf-8?B?SXNZR1RETWhKaml4ZWtDS255T0FGbEY1WGsyQW1SQkZmaFkwZVJpSUhvNUoy?=
 =?utf-8?B?Vm5TQXRIdFBid3M3VEQvSDNPM2p1N1pxYWhPdjVVRzBtNWU1TUhKR292MGkr?=
 =?utf-8?B?VnRZbDJaQnhVMnVhNC9kZlFyUFZMR1hWWTlOcU9TQ01SMVoyNzluOUtqWkxV?=
 =?utf-8?B?R0ZMSWY0aEEvMUk5QjVXeDhLWjJPcG9DTFZRUnpOdGpNNFFrSldvcjhHT0pa?=
 =?utf-8?B?VUI0Z1dkM2hYeHpicWVlVUd1dEF5UjBySjM5NG1ISU9XYlB3Ykx4N2UwZlky?=
 =?utf-8?B?Z2w2OFJjSGJvS0tRYTA4ckNVR0dYaExkdmpENE81UTBwQlE0cjcxVnB1eWNl?=
 =?utf-8?B?MUs1TXFwVVdXWDY4TmlXelRPaVRmNjdydFpRSndoWEx1WXFlL3BRNklYanJL?=
 =?utf-8?Q?f5IQ=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0d355c5-3a30-4b9b-861b-08dd44cc5ac3
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 03:31:04.2730
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2Q1fmAk9SSGW87N/DKCghSsv0D9baA2mCrZULAipXheqI57Poys9cGtI7DM91QC1K2b4fYBWF+PyHA8PNBJnw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7145

PiBTdWJqZWN0OiBbUEFUQ0ggdjIgMC80XSBzY21pOiBCeXBhc3Mgc2V0IGZ3bm9kZSBhbmQgaW50
cm9kdWNlDQo+IGFsbG93L2Jsb2NrIGxpc3QgdG8gYWRkcmVzcyBkZXZsaW5rIGlzc3VlDQoNCkFu
eSBjb21tZW50cyBvbiB0aGlzIHBhdGNoc2V0Pw0KDQpUaGFua3MsDQpQZW5nLg0KDQo+IA0KPiBD
dXJyZW50IHNjbWkgZHJpdmVycyBub3Qgd29yayB3ZWxsIHdpdGggZGV2bGluay4gVGhpcyBwYXRj
aHNldCBpcyBhIHJldHJ5DQo+IHRvIGFkZHJlc3MgdGhlIGlzc3VlIGluIFsxXSB3aGljaCB3YXMg
YSBmZXcgbW9udGhzIGFnby4NCj4gDQo+IEN1cnJlbnQgc2NtaSBkZXZpY2VzIGFyZSBub3QgY3Jl
YXRlZCBmcm9tIGRldmljZSB0cmVlLCB0aGV5IGFyZSBjcmVhdGVkDQo+IGZyb20gYSBzY21pX2Rl
dmljZV9pZCBlbnRyeSBvZiBlYWNoIGRyaXZlciB3aXRoIHRoZSBwcm90b2NvbCBtYXRjaGVzDQo+
IHdpdGggdGhlIGZ3bm9kZSByZWcgdmFsdWUsIHRoaXMgbWVhbnMgdGhlcmUgY291bGQgYmUgbXVs
dGlwbGUgZGV2aWNlcw0KPiBjcmVhdGVkIGZvciBvbmUgZndub2RlLCBidXQgdGhlIGZ3bm9kZSBv
bmx5IGhhcyBvbmUgZGV2aWNlIHBvaW50ZXIuDQo+IA0KPiBUaGlzIHBhdGNoc2V0IGlzIHRvIGRv
IG1vcmUgY2hlY2tpbmcgYmVmb3JlIHNldHRpbmcgdGhlIGRldmljZSBmd25vZGUuDQo+IEFuZCBJ
bnRyb2R1Y2UgbWFjaGluZV9hbGxvd2xpc3QgYW5kIG1hY2hpbmVfYmxvY2tsaXN0Lg0KPiANCj4g
VGhlIHJlYXNvbiB0byBpbnRyb2R1Y2UgbWFjaGluZV9ibG9ja2xpc3QgaXMgZm9yIGNhc2UgdGhh
dCBpZiBwaW5jdHJsLQ0KPiBzY21pLmMgcHJvYmVzIGJlZm9yZSBwaW5jdHJsLWlteC1zY21pLmMg
cHJvYmVzIG9uIGkuTVggcGxhdGZvcm0uDQo+IE5lZWQgdG8gYmxvY2sgcGluY3RybC1zY21pLmMg
b24gaS5NWCBwbGF0Zm9ybS4NCj4gDQo+IFRoaXMgbWF5IGxvb2tzIGxpa2UgaGFjaywgYnV0IHNl
ZW1zIG5vIGJldHRlciB3YXkgdG8gbWFrZSBzY21pIHdvcmtzDQo+IHdlbGwgd2l0aCBkZXZsaW5r
Lg0KPiANCj4gWzFdOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hcm0tc2NtaS9DQUdFVGN4OG00
OGN5LQ0KPiBFelA2X3VvR043S1dzUXc9Q2ZaV1EtaE5VenpfN0xaMHZvRzhBQG1haWwuZ21haWwu
Y29tLw0KPiANCj4gU2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQo+
IC0tLQ0KPiBDaGFuZ2VzIGluIHYyOg0KPiAtIEludHJvZHVjZSBtYWNoaW5lX2FsbG93bGlzdCBh
bmQgbWFjaGluZV9ibG9ja2xpc3QNCj4gLSBLZWVwIG9mX25vZGUgZm9yIGNwdWZyZXEgZGV2aWNl
IHBlciBDcmlzdGlhbg0KPiAtIFBhdGNoIDIgaXMgYW4gb3B0aW1pemF0aW9uIHBhdGNoIHdoZW4g
Zml4aW5nIHRoZSBkZXZsaW5rIGlzc3VlDQo+IC0gTGluayB0byB2MTogaHR0cHM6Ly9sb3JlLmtl
cm5lbC5vcmcvci8yMDI0MTIyNS1zY21pLWZ3ZGV2bGluay12MS0wLQ0KPiBlOWEzYTUzNDEzNjJA
bnhwLmNvbQ0KPiANCj4gLS0tDQo+IFBlbmcgRmFuICg0KToNCj4gICAgICAgZmlybXdhcmU6IGFy
bV9zY21pOiBCeXBhc3Mgc2V0dGluZyBmd25vZGUgZm9yIHNjbWkgY3B1ZnJlcQ0KPiAgICAgICBm
aXJtd2FyZTogYXJtX3NjbWk6IEFkZCBtYWNoaW5lX2FsbG93bGlzdCBhbmQgbWFjaGluZV9ibG9j
a2xpc3QNCj4gICAgICAgcGluY3RybDogZnJlZXNjYWxlOiBzY21pOiBTd2l0Y2ggdG8gdXNlIG1h
Y2hpbmVfYWxsb3dsaXN0DQo+ICAgICAgIHBpbmN0cmw6IHNjbWk6IFN3aXRjaCB0byB1c2UgbWFj
aGluZV9ibG9ja2xpc3QNCj4gDQo+ICBkcml2ZXJzL2Zpcm13YXJlL2FybV9zY21pL2J1cy5jICAg
ICAgICAgICAgICB8IDMxDQo+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0NCj4gIGRyaXZl
cnMvcGluY3RybC9mcmVlc2NhbGUvcGluY3RybC1pbXgtc2NtaS5jIHwgMTUgKysrKysrLS0tLS0t
LS0NCj4gIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXNjbWkuYyAgICAgICAgICAgICAgIHwgMTUg
KysrKysrLS0tLS0tLS0NCj4gIGluY2x1ZGUvbGludXgvc2NtaV9wcm90b2NvbC5oICAgICAgICAg
ICAgICAgIHwgIDMgKysrDQo+ICA0IGZpbGVzIGNoYW5nZWQsIDQ1IGluc2VydGlvbnMoKyksIDE5
IGRlbGV0aW9ucygtKQ0KPiAtLS0NCj4gYmFzZS1jb21taXQ6IDlkZmY3YmJkZDM1OWM3M2YxYjQ0
YWI1OTJiYmIxN2UxYzE3NGZlNDMNCj4gY2hhbmdlLWlkOiAyMDI0MTIyNS1zY21pLWZ3ZGV2bGlu
ay1hZmI1MTMxZjE5ZWENCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gLS0NCj4gUGVuZyBGYW4gPHBl
bmcuZmFuQG54cC5jb20+DQoNCg==

