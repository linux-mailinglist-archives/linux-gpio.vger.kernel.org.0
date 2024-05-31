Return-Path: <linux-gpio+bounces-6997-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9DE8D5D09
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 10:45:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4F4B51C218A1
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 08:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD13315572F;
	Fri, 31 May 2024 08:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="VN5QrlX8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2077.outbound.protection.outlook.com [40.107.249.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6387155732;
	Fri, 31 May 2024 08:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717145129; cv=fail; b=T6DM7jhZAubvlBzZ2Hq4c1oraN3MumHovgX5i2/EsgeUFdjwBuXpua0qKgaFp4cKKay7qaih0IkMbsexZNVaLSjUKUrlkCb0vjvMo6Pn27tePZ+ofercQzgl2xnwKtDTPrDqA7okI3obNckpW3vsxdISkuhygAK0TOJVtl2sOAU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717145129; c=relaxed/simple;
	bh=Y1F0U5M3YjrSgQQ4kqiyEMcUwqkmExIgbYJoAQF9hZo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RMwehTfPlKGIHZzIu1J0YmyKZ5iMXbspGeD6Xh6FlJWC72YC1oOkj8oGx8lBAjaaJWTl3xJmD2u6O/xQXeKRjxoBWzPWXyygQZFLLhGDBgiRBabxbzFtobnG00knpgmfAzqKNOORzyY1huKSeQQZjoKDraj5RyZOl6I+FZLeh4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=VN5QrlX8; arc=fail smtp.client-ip=40.107.249.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SiReTg0bMBhnZCGeBdE25+RjK2I+nqu+hGdxQpBRDvQ3tWodz7DK3PZpy4dosmuNp2zkVDR5MAOudqYQduSZeJ89lgAUAWNUQKBX00XJp+WkAzRiRV/mmD1YB+bVQwKeRjErfqJD5p9nGo4UnvsGa2rzLaIHp592RzxNIV+p/XRqgtFrXQkVUXoJcCqva/ZSYrhQcPYB9I3s3W5++GWFKac9sl7MeQsezl2NnRNk1OccfoyFLxvoF5A8XxlG5sANWEvhEqcT5HzxwjiUOwO3VdL7gWqa7/cXQYfY4qhwqOUSsJiXm9wKCpmmCMPO/c9I/ULrV2PfVrIk20upu0p1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y1F0U5M3YjrSgQQ4kqiyEMcUwqkmExIgbYJoAQF9hZo=;
 b=lEWteX4F35kXRlMLzB5JXdc8In91YGSemI1WN5BmtAh4QN+rOJWf53Y9g5Fpc2dMmQW7SwiZlrQFs7IUdwuAcz78tCaX7x7bGURV8gNqocXTWY6cPaeYU+na2Scxy1b39v4RJSNRzBYJvRxuhVbyTVYZpFuTOQyRpj6KBtx4Ohrjo++9sRrvXCRO5CN0i3SI/GI6glgVPONOuNYJe6Ac3Y0BeIEpB6wM8MHNmFBOi6PJtJFxtMUpCq91kcplJkEe7kkb2i2khSYAC9wCv2tvIrY+WgR5IryhhTfks9xZ/eyMo+6b/E16VFaJKNGcaepgXY5sseYal7RhZDEFt7G2cA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y1F0U5M3YjrSgQQ4kqiyEMcUwqkmExIgbYJoAQF9hZo=;
 b=VN5QrlX8DH7flXOfdUwzh+qZVwSAwLoCV1EeECIn7fU3Go0h9Bh5fGL273jliYB32xL24JYBaNuBWfqMbFm3nXt5Dro+c+F9HY7IfMZK+zAsY2mXpdPSosgg64qJLFK1pJXgTZ3Hld1z0tGzs8z3V0hmrDsYqKizss+BZ+C6Xfk=
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com (2603:10a6:10:356::7)
 by AM9PR04MB8084.eurprd04.prod.outlook.com (2603:10a6:20b:3ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Fri, 31 May
 2024 08:45:24 +0000
Received: from DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::9271:bc93:9fc9:d427]) by DU0PR04MB9299.eurprd04.prod.outlook.com
 ([fe80::9271:bc93:9fc9:d427%4]) with mapi id 15.20.7633.021; Fri, 31 May 2024
 08:45:24 +0000
From: Aisheng Dong <aisheng.dong@nxp.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Sudeep Holla
	<sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
	Jacky Bai <ping.bai@nxp.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Peng Fan
	<peng.fan@nxp.com>
Subject: RE: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Topic: [PATCH 0/3] pinctrl: scmi: support i.MX95 OEM extensions with
 fsl,pins property
Thread-Index: AQHaq0Z/KEGcJHMPLkO9ZIHa2wOlLrGxFuwA
Date: Fri, 31 May 2024 08:45:24 +0000
Message-ID:
 <DU0PR04MB9299C792462E5674EFC4F19480FC2@DU0PR04MB9299.eurprd04.prod.outlook.com>
References: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
In-Reply-To: <20240521-pinctrl-scmi-imx95-v1-0-9a1175d735fd@nxp.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR04MB9299:EE_|AM9PR04MB8084:EE_
x-ms-office365-filtering-correlation-id: 97f82ff0-7814-4d79-3bab-08dc814e035a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|7416005|366007|376005|1800799015|38070700009|921011;
x-microsoft-antispam-message-info:
 =?utf-8?B?anNuaURlR0ExZ2IyV1JNVWhuRmRkVWtrRlVpc25QYmhrSXRENGVxVFVROWVZ?=
 =?utf-8?B?clpzV0ZJejNaMEZNQ0FFSmpkUjlvQ2pZVjZOZEhFUGw1U2IweXVHc2FTQStC?=
 =?utf-8?B?VHljSTY5Yy9rQ0R4Ym5MR2JGcVhmWktOVDg5ZjF6bHZablk2V3FNellSbG0r?=
 =?utf-8?B?SnBKYlBWRzJ4SkpjVUZZOVZKbW5naDY1cTRLTGFaQjdCaWR0N2h2bGlhR3oy?=
 =?utf-8?B?Ti90SHp5NE9Td2dzcFhkNElzMDRXNXRqMnZBWGhKU3hST21zTkRINTlRVzNY?=
 =?utf-8?B?MmxOZ0k0RFBlcHFVOWg1aTNHbHhnOWYralFJR3FIZitjajYwRlNNUUZBQlNh?=
 =?utf-8?B?SFVFcmVkczRCaDFaMkFrMHhKTWdqVVFsdnQrSDI2ZGpIQlhpTW5rc2k0VkxE?=
 =?utf-8?B?bjUxQWdLcjNpNms5cCsvcmZEYVdKUUZwM1pBMWthUk00UjJiaTRYbGh1d3lJ?=
 =?utf-8?B?Qzl3c1A3c0dXTThhMEgvOTJOM0trenVFYnZGbGRSVmVJdElVcXhMUlY0bEZU?=
 =?utf-8?B?TnB4WWxjNXExTGhVak0wU1g5V21kamExM3FtWWx4eEZNdm9kYTlYK3c4SFIz?=
 =?utf-8?B?M09rTDFSZUUwNjYrZlJTc0JkQXk4TmtMcUMvM3VNSUNjck02OHozOTNGRkN2?=
 =?utf-8?B?V29CTjZJTC9oVmtFeHlJYTROcXJEVUJqbEQ1VjFDTmg3TllyRUFWWWFkR3hW?=
 =?utf-8?B?OFd1MVZkZTRhR3p3dC9pbmNpdWM4UUdJRmNyd0Y5ZWYyZXFjSkIwOTdrSTlz?=
 =?utf-8?B?ajJjS0hjUmRiODZZemd3MXRCbXNsbzFvTHNBRlJjVjVDYlgwLzBvWkpISi9P?=
 =?utf-8?B?Mjc3U2lZWUtuSk9kT2lBM2hNckVvbFdVY01EU2M2QjYzdlhiZW1FMGI4WE1X?=
 =?utf-8?B?NE9pelBGcm5XNGJmUmhYYVQ2M29mV2JNOFVGdDJHbDJMdmhESTl5OWJzMHVu?=
 =?utf-8?B?YWNRZTJ6dzNFQ2hBNGE1Q0UyOUUyUUtSZ2FnaFFpaHRyYW9aY1k0bjB1aFJo?=
 =?utf-8?B?ZmlJL0xBeGxzdHdnVllvUWR2dFNvVnR4MUdwQ2FQSUp6MkxHMmg3M0pCanlz?=
 =?utf-8?B?cTJhQXZWY0FrK2djaG1tUmNmeUF5STYvMm1GdE1CdVgraGNjY2YvcjFGVzJk?=
 =?utf-8?B?UWNCZ0JpdncvMVgyK2RrTjYrWGJXT09wR2JGbEk0ZlZXbGhoMWh1N0J2TWI3?=
 =?utf-8?B?Z1FzNWNBZndYTlRDbEhzR013YWhIbU1qeE9HYkhPOTZFbUNSemxQRERHRjFY?=
 =?utf-8?B?bHZvQTg2OGdjdDFlQkwzazZWVjRmTVZ3OFgyb1VnenJLYnlmZTNlRG9lSDNo?=
 =?utf-8?B?NFoyV2NBKzIrdldrTmRhcWdPZTBteXkrYjFKSDYvaG42dTZBYkxGZmdkVDdK?=
 =?utf-8?B?alB6ZkduRDJkWm1reThvL1RPaXE1czdDcC9GTUhZOUd0Y2JjRmtacUNPQmF2?=
 =?utf-8?B?eGpqOHo4MzlkZVlIYnA2K2FXd0JnV3Y4NlpKUVk0bTYwUS84NUpNMjk1L1ow?=
 =?utf-8?B?d0ZSclY1Y0R5bXk2elBYYmk5K2N2ZnQ0R2tHck1RUXRQakRKOU9vZjR0dGRX?=
 =?utf-8?B?SFMydlFTTFdpNk9yKzJxeGs0ZnpzdnF3N2JqQVViWFFoK2JSQmdHeEdxWHN2?=
 =?utf-8?B?cHNXYWJPbGpDQkx2c2U5S3BycEd4N3dQTGxnV21wR3R5aklnU3hJV2JVK0pW?=
 =?utf-8?B?VllzNVQzemFISjhjTVdaVlJIN2V3aVh3WmFacTJuak1CaDUvRm42dlJIWGlW?=
 =?utf-8?Q?+4zgyDJZRHKOvww8zY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR04MB9299.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(366007)(376005)(1800799015)(38070700009)(921011);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDhTVjVlMTZaTDNBM2d0amRWWlhTaUtTM1lCNGxNSUl2T01GQWtJMksweWQ2?=
 =?utf-8?B?RUg0V25IWVQ5bmJMblg0NzBjYys3NS8vUmNMZ1p1MDFuSEZTL2ZnQmp6U2Iw?=
 =?utf-8?B?UXRXZ3pyTE9GaFRUR0RwWW53U1BSYlNXNmVVYzdienJZc3lDRzFveS8zV1E3?=
 =?utf-8?B?d2dwb0d3dlRwYk10cWZtazczMjNVU2FHRi9VaWlwSHA4b1JqakQ4cWx4Qnll?=
 =?utf-8?B?VjVxTnlDU05OMkIxRlZUVytBSjhEMS82emFjYzhERkcxOE5rdUxzVXRWRzlx?=
 =?utf-8?B?S0dLMmdDaStJY2ZTOWxtakI4UUNIVm05aGZHa2RzT0EzTmNkM2JIUUZGNmZ2?=
 =?utf-8?B?Q1crUDBoamhrK2J5Y0NlaHA1Tk5iem5KYXFkNU1FRXMvRnN3NWhaT0tIMWF0?=
 =?utf-8?B?RHRPYkhVc1pBTzBiQThaRDVJbnJxUnJwalk5VEtEMXRBOCswcWY1dVlONTQ0?=
 =?utf-8?B?Y0tKREkvMTc5VXJyc0VBNkdNMUdrQjc2empvYU01QXdnb2tTKytpYmovZE1Y?=
 =?utf-8?B?eHk0dStyWmR0QXZXVTM0R09hbWl1ZEo3YTJnSUphWGtxVGUzUERpTmJCNW44?=
 =?utf-8?B?RjdUc0svbnd0Nkd0SUVjcHROOVVjYmF1UWI2TWNCdExuUWZ1VGxEc1B4TEdr?=
 =?utf-8?B?QzFIK1BITDdRS0l5ZGFlZk11QUt5SHp2MjhvN1VmZTJsWUZvcVpRVkR6SGMz?=
 =?utf-8?B?My92VTVHMjkzcklsbzdIZTdrQmFPYllhWktETHhON0FsMDRBakdpVm5VTkdR?=
 =?utf-8?B?VytkUDhDWC9kNEM0a09HQWFtQ0FzQ2hiY2cwU2lMT2tyNGVWM0loOUtlMXFJ?=
 =?utf-8?B?Z0xmNlRVc285Rk9xaVZwM3paTDVJMnNuQ1I4Y2JWSyt4ZTkrRHBXSGdTNS8y?=
 =?utf-8?B?UzZhcW1Cb25WTjdXemdRbG9nRnBvblJPRTI1TUhHNktka0NyRnpNMCs4bkN1?=
 =?utf-8?B?MHhJa2hsTGI3VExLVEUvTW8zaEozNlNKVVYvQ2ttUHZXOXBVa0J2YWFiKzN6?=
 =?utf-8?B?K1Rsek1sb2xTVVJaS2ZGRkdPbFAvMWpKcmZ5aDQrYWJ1Zy9FTVVTOHNWMFA1?=
 =?utf-8?B?eVdxTDgrcEk0SUNSaHNqWWE1Z05LK0dkRnFsYzNjYTRLZG9rcm9tZC8xc2Ro?=
 =?utf-8?B?dU1aYklGYy8yVVBKWVRTY0dmNXM0bEFncUszL0VxWm92TUs4ODFJOUlaWHk5?=
 =?utf-8?B?ejNDenFBazhxbFdJYWg0eXNKdExLNU5LbEliUjJNRzkwWU1wY1JjbnJEeEQ4?=
 =?utf-8?B?L1FRL0NQRVVmUFUwVWxTQklUbWVMQUw4K2Z6MlczNUR1K25HNlhtNlduY1F0?=
 =?utf-8?B?TDdvUzU3SEt2MFNua0V3TTB3VjJIZGRDR3Y4aHdMZld3dUFscG82bTZvQ2Rm?=
 =?utf-8?B?SkpwRERkeXdKNmwvRUpldTk0SXRvSTdDSGx6UTg2S3VSREJwbUpIL0c2STVF?=
 =?utf-8?B?YkNMUzFsL3Fnem5sdkNUYXZFQjlHdlFVTW90OEFIaWlYVVFMK1Jlb1NEZGRi?=
 =?utf-8?B?ZXgzK1lyWElEN25PcFYvQzZVZ05TUlRDTDF2ZU9DbVQyU3NhK0MvcFUxVkk1?=
 =?utf-8?B?YXVTdjNPMEVjUmkxYU56ZDNVbURLbU1scy85VnVGRTk3dzIyUUhxQVVOWExk?=
 =?utf-8?B?MEk3QWthMWgvaThpK3o5RkMycXhzbHZUZitxNFNtbm9PN1NFQThXcStNcFBn?=
 =?utf-8?B?aFd3K3AzV2U5bjlUWDFaM2FOeC90azlMbUh3a04xR1cvYktJaklMQUliVUhu?=
 =?utf-8?B?bDJITlErOUxqdjQ4eFVwUTU1SVJZb2FFT3huY0tDWCsvN3l3VlFqYjl2YlRx?=
 =?utf-8?B?aXlZNU56VkoyWG5mKzRxbURkcmJ0dlY2QS9Na2JTY3hDZUNad2RMaEhnUisy?=
 =?utf-8?B?RDkydGNWVm45SmlqbmlOSlVFa3J3OGVCTWVubDkxTXoxZVZYQlJ6Mlgxa29P?=
 =?utf-8?B?UytJVjZoL3VkQW5NYmI1ekhFK1hmTjJUaGo5TDE1R0t4eE52bDhyb3ZpSEp5?=
 =?utf-8?B?eTBCWjdXYU9JUFRGWUxXdlFJRjRZWGl1Yk5iN2xWeTE2UDdrenFYeENFMlor?=
 =?utf-8?B?Wkg4RFpvOEZ3dys0MENKTGxONHY2NFhoTkJSUkdwKzNaSE4zWEFCRklvMzIx?=
 =?utf-8?Q?MR5w2qEJ+y31duEtxzv4u3LhT?=
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
X-MS-Exchange-CrossTenant-AuthSource: DU0PR04MB9299.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97f82ff0-7814-4d79-3bab-08dc814e035a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 May 2024 08:45:24.2834
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CWG8LEmO4tfllEcd5Px5FFEgB5Q+ZVvg9luvE/bCHhv0SERRC81Zz/m9hVfBPNBXh/fQAas7oCtX1da7trdN/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8084

PiBGcm9tOiBQZW5nIEZhbiAoT1NTKSA8cGVuZy5mYW5Ab3NzLm54cC5jb20+DQo+IFNlbnQ6IDIw
MjTlubQ15pyIMjHml6UgMTQ6MjYNCj4gDQo+IEFsbDoNCj4gIFRoZXJlIHdhcyBhIHY2IHRoYXQg
dXNlIGdlbmVyaWMgcHJvcGVydGllcywgYnV0IGF0IGEgbGF0ZSBzdGFnZSwgTlhQICBpbnRlcm5h
bHMNCj4gZGVjaWRlcyB0byBzd2l0Y2ggdG8gZnNsLHBpbnMgcHJvcGVydHkgdG8gYWxpZ24gd2l0
aCBvdGhlciAgaS5NWHMuIFNpbmNlIG5ldw0KPiBwcm9wZXJ0aWVzLCBkcml2ZXJzIHJld3JpdGUs
IEkgc3RhcnQgdGhpcyBwYXRjaHNldCAgZnJvbSB2MSB3aXRoIGEgbmV3IHBhdGNoIHRpdGxlLg0K
PiBBIFJGQyBwYXRjaCBmb3IgYmluZGluZyB3YXMgcG9zdGVkLCAgc2luY2UgUm9iIHNhaWQgaGUg
aXMgZmluZSwgc28gcG9zdCB0aGlzDQo+IHBhdGNoc2V0IG91dC4NCj4gDQo+ICBXaGV0aGVyIHY2
IG9yIHRoaXMgcGF0Y2hzZXQsIHBhdGNoIDIgaXMgYSBtdXN0IGFuZCB3YXMgbm90IGNoYW5nZWQg
ZnJvbQ0KPiB2Ni4NCj4gDQo+ICBUaGUgcGluY3RybCBzdHVmZiBoYXMgYmVlbiBwZW5kaW5nIGZv
ciBxdWl0ZSBzb21ldGltZSwgSSB3b3VsZCBiZQ0KPiBhcHByZWNhaXRlZCBpZiBhbnkgcXVpY2sg
Y29tbWVudHMuDQo+IA0KPiB2NjoNCj4gDQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDI0MDUxMy1waW5jdHJsLXNjbWktb2VtLXYzLXY2LTAtOTA0OTc1Yzk5Y2M0DQo+IEBueHAuY29t
Lw0KPiBSRkM6DQo+ICBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNDA1MjAxOTQ5NDIu
R0ExMzc0NzA1LXJvYmhAa2VybmVsLm9yZy8NCj4gDQo+IFRoYW5rcywNCj4gUGVuZy4NCj4gDQo+
IEFSTSBTQ01JIHYzLjIgVGFibGUgMjQgUGluIENvbmZpZ3VyYXRpb24gVHlwZSBhbmQgRW51bWVy
YXRpb25zOg0KPiAnMTkyIC0yNTUgT0VNIHNwZWNpZmljIHVuaXRzJy4NCj4gDQo+IGkuTVg5NSBT
eXN0ZW0gTWFuYWdlciBGVyBzdXBwb3J0cyBTQ01JIFBJTkNUUkwgcHJvdG9jb2wsIGJ1dCBpdCBo
YXMgemVybw0KPiBmdW5jdGlvbnMsIGdyb3Vwcy4gU28gcGluY3RybC1zY21pLmMgY291bGQgbm90
IGJlIHJldXNlZCBmb3IgaS5NWDk1Lg0KPiBCZWNhdXNlIG54cCxwaW4tZnVuYywgbnhwLHBpbi1j
b25mIHByb3BlcnRpZXMgYXJlIHJlamVjdGVkIGJ5IGR0IG1haW50YWluZXJzLA0KPiBzbyB1c2Ug
J2ZzbCxwaW5zJyB3aGljaCByZXF1aXJlcyBhIG5ldyBkcml2ZXIgcGluY3RybC1pbXgtc2NtaS5j
DQo+IA0KPiBUaGUgbm9kZSB3aWxsIGJlIGFzIGJlbG93Og0KPiBwaW5jdHJsX3VzZGhjMTogdXNk
aGMxZ3JwIHsNCj4gCWZzbCxwaW5zID0gPA0KPiAJCUlNWDk1X1BBRF9TRDFfQ0xLX19VU0RIQzFf
Q0xLCQkJCTB4MTU4ZQ0KPiAJCUlNWDk1X1BBRF9TRDFfQ01EX19VU0RIQzFfQ01ECQkJCTB4MTM4
ZQ0KPiAJCUlNWDk1X1BBRF9TRDFfREFUQTBfX1VTREhDMV9EQVRBMAkJCTB4MTM4ZQ0KPiAJCUlN
WDk1X1BBRF9TRDFfREFUQTFfX1VTREhDMV9EQVRBMQkJCTB4MTM4ZQ0KPiAJCUlNWDk1X1BBRF9T
RDFfREFUQTJfX1VTREhDMV9EQVRBMgkJCTB4MTM4ZQ0KPiAJCUlNWDk1X1BBRF9TRDFfREFUQTNf
X1VTREhDMV9EQVRBMwkJCTB4MTM4ZQ0KPiAJCUlNWDk1X1BBRF9TRDFfREFUQTRfX1VTREhDMV9E
QVRBNAkJCTB4MTM4ZQ0KPiAJCUlNWDk1X1BBRF9TRDFfREFUQTVfX1VTREhDMV9EQVRBNQkJCTB4
MTM4ZQ0KPiAJCUlNWDk1X1BBRF9TRDFfREFUQTZfX1VTREhDMV9EQVRBNgkJCTB4MTM4ZQ0KPiAJ
CUlNWDk1X1BBRF9TRDFfREFUQTdfX1VTREhDMV9EQVRBNwkJCTB4MTM4ZQ0KPiAJCUlNWDk1X1BB
RF9TRDFfU1RST0JFX19VU0RIQzFfU1RST0JFCQkJMHgxNThlDQo+IAk+Ow0KPiB9Ow0KPiANCj4g
U2lnbmVkLW9mZi1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+DQoNCkZvciB0aGUgc2Vy
aWVzOg0KUmV2aWV3ZWQtYnk6IERvbmcgQWlzaGVuZyA8YWlzaGVuZy5kb25nQG54cC5jb20+DQoN
ClJlZ2FyZHMNCkFpc2hlbmcNCg==

