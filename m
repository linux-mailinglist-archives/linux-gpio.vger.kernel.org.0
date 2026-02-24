Return-Path: <linux-gpio+bounces-32156-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJtVKMQVnmmcTQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32156-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 22:19:00 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2C118CA7B
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 22:19:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6178730420A1
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 21:18:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6529633CEAA;
	Tue, 24 Feb 2026 21:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="jUXi+8vt"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013007.outbound.protection.outlook.com [40.107.159.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71EC33C199;
	Tue, 24 Feb 2026 21:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771967930; cv=fail; b=E3R6/l9PpVPE0Jb30nBLbkr4i+SclADQ8tZEpTTuO8JLneXI+hAhpel/hLzYnSCyOWQAstucCRCoOPSA+TKhNST5CsAdMykyQ/BAgZF5jkGXbYVcepUkpNaGwaiGNPajloPCrTSuaf8tq8jC9SZwwo3Z6lAgX3yc1e6mzLe5P3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771967930; c=relaxed/simple;
	bh=jJSfCuJcFwdGwyLp2tPo2U7s4mIHN7freK8TEM9vTww=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=SJsPawUCvfQOCuauOre8ja/w8uP4O6HM77c+bcrV6O7pK2xw4EpK1jFzszogaNz//I8/w9pHTyrXlAqJ4R2gj7JVme/XZlGVFmzXKfAR63nSzNNc64Ezy1KuMIOI7N4kb+nWUJX5ABG8OSHJkx/n0AAuJ81ALk0PVsiOpJliggA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=jUXi+8vt; arc=fail smtp.client-ip=40.107.159.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ISIDUKcMcDpC8IfipRjwORWKZa3ZCu8XAyyLTJ2zdPoCIyQR5yuIby8bzJ8FUDXSBEXV7F88ZhSZCQBa1LClK7cRcImeUuVRrQqpaGbaGxjqcRY2O5HdrM3Ynxhs0DcvlhkUKNdSOaqX1OWjoKiqkX7OkkWS2MraPUYm3McUlNOGfSa7Ed369JkTNsD48OWyEmtiRrG4fZZLpv/vAqpsRpoAP2R7Tztb7Uwk//Il5P9N+AAacvRXermoDnjiKHZxOQl1INwH+8ktZEj9MEvgKDv2bKR9IX3yTVyeSs3T9i2LwK5FBGKRwXzN4ONph/4nqGk0JdhHB5Rx6jMl38xn8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+JRdnnLxbCYX5mKT3xJydokzuJurWE0z2qetdHwGt0Q=;
 b=Yd+sgM7EKDhQwLpC22GdsBkjzGtFXRsBqEi2jeNi6R9frL6uObsrAUykthJMjNEmDonJnDvyQ4tnkrFAQ7M1qwN3J+8XQpeLW12mJpQ+JVmMTugPRUTvdkzzpUh/q/TH//pHmBEdbmnpSb7TA3W+vJ6gPqTVFK9JCMxnbOk2ItdWJD8JE12/ylcTKyOqPIYYVUu0h1U9+/+C6fxD9/aKSdIF90Bf5q+64//E18ee/ASfAOCtB28zpHEfplb0NoLa0UHmy8O66l+k9e4NKYsYdHCCJMF1J1WgNeeik2IIH5WrzlQpDcCI0sq12km+pdUKbF2zsM6H9j8i55Jjdc1Nig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+JRdnnLxbCYX5mKT3xJydokzuJurWE0z2qetdHwGt0Q=;
 b=jUXi+8vtv365GwCnbdJ5g5bXPurpwaRQThq06+PqhJ6mYg+jvk1rNEPw5EXY13E8AqnMJesFVRWFXWf3wwfbDBIRLPnJF2t4BMppDAhqyDJesYzxrqhNGk/Egu1eIasap6/UcrBqgC5D1/KmDJ4hJl5Vnx3dolBVdIATOtD5SyYDrfTrPRzQ/Bj87iFV3AufCBFGexFK+inwGXdx1hlaPRTMvp8Rc+2tfYf/Zj0KW1k360zK4LULI2EzHD6Jq+4etHdEb8RZ8dFVoRRaMJr9L0qQ30DO83Fu3wMS4GzlLgcNULgRXqpoG4kV6/vsznd0yMTmFCWYJWxTK7QLKscf1w==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by PA4PR04MB9293.eurprd04.prod.outlook.com (2603:10a6:102:2a4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.23; Tue, 24 Feb
 2026 21:18:43 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 21:18:42 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Andrew Lunn <andrew@lunn.ch>
CC: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson
	<andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, Frank
 Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
	<skhan@linuxfoundation.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan
	<peng.fan@nxp.com>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-remoteproc@vger.kernel.org"
	<linux-remoteproc@vger.kernel.org>, "imx@lists.linux.dev"
	<imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, dl-linux-imx <linux-imx@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: RE: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO
 driver
Thread-Topic: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO
 driver
Thread-Index: AQHcpcbqyuKnLu7nVEOA8R+860c+KrWSVdGAgAAED2A=
Date: Tue, 24 Feb 2026 21:18:42 +0000
Message-ID:
 <PAXPR04MB918509F265757E6028B45DDC8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References:
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <PAXPR04MB91859B642802813F908B03DA8977A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <64ef5dbf-6264-4758-a5d8-d8c52c359fcc@foss.st.com>
 <PAXPR04MB9185934EB640E8B21905FF878974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <79eb8bb8-83cb-4b24-8e56-42a53c710055@lunn.ch>
 <PAXPR04MB9185F1A67384E4886282227A8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <91701822-df30-4feb-9e9a-4ee82e2a5d23@lunn.ch>
 <PAXPR04MB9185FD3EEC313CC2408E157F8974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <0b42e303-a2ed-4983-bee5-a4eafd6c7f36@lunn.ch>
In-Reply-To: <0b42e303-a2ed-4983-bee5-a4eafd6c7f36@lunn.ch>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|PA4PR04MB9293:EE_
x-ms-office365-filtering-correlation-id: 230226b3-52bd-4453-984e-08de73ea49ae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FbhrwYelo/shdDPm2/Rg5GSFveB5QSTZzVFl6/DY+6+37/qBwx6kRgh7t0oU?=
 =?us-ascii?Q?OVaVTXLyG69emiMIGlKjcnBvsHnxn8T6ddTOiGOXxaNLo4q0Eu0ahsCFALPE?=
 =?us-ascii?Q?lTS0etkaemK9QF6a2YZL4ohX6xR0YuModA4+yHJfXhl+tFlYNRShfxyV+JUB?=
 =?us-ascii?Q?TAN7bpjkr7wd+NSMPBYANO5GtONBSLFlWnbWRQl4U2bOYVQCx27RC9Rqwv2K?=
 =?us-ascii?Q?CQ9yxK22PTkR0n80cU4+k6aOByzTUtQXk2j+aR4ZvV5RM59Q4iqkF3ZQmm0q?=
 =?us-ascii?Q?T96RgSRrKMZw4o7gqFXS/rmY5Yqow0SGkMeyzXpMF8Vur+5l7vOa5QJdT0a4?=
 =?us-ascii?Q?R6po8xIjgzXhxVgJYVhE8n58/RFQmK93yfC7aMhjCntjhec5K/AvLQMnrf3A?=
 =?us-ascii?Q?QtowcEsltNuCmwmlACYW2cyZFtT8m7k7ROo8CWDFqsTpImP6KRSYCp+gDaIB?=
 =?us-ascii?Q?8xTg0HAlnd3l7MKWHfb7Um0wujvuBRCqwG5hbwBVJXeCpNneKqde7ATTJ6W4?=
 =?us-ascii?Q?/J56WQSV41GAM2JHjA55FVFrYPNxBy7hXB3hsoDc5eyacHeizVyZJoGuZyaA?=
 =?us-ascii?Q?Z8kcIZbGmAkiA+eh/2vb6w0PaiM9HuqqJOCo0Itn7Q6+A2ugOkW0HCGWk2ge?=
 =?us-ascii?Q?EPeki+6wxyYemcYKFm37iy9yl/D/Y4YtKK2Fi0A+gsi8EfASup3wr++2NFmr?=
 =?us-ascii?Q?YTZkiRwPEGU7NRlD0T+vfT6HWTijDguaJGptX0zJ+kaTi1o4/3V1qGAhECP7?=
 =?us-ascii?Q?g4dymxi/swNnkkrtqaKW1yW6GpyoUgYzmqmbH+MurqDM1qf9rRNEUd5Y87jx?=
 =?us-ascii?Q?lRXgtQOkolQH14J3FH3tZWbXZpM0TCaS6K3FAkotFh6r+MVvONuQHJfCncap?=
 =?us-ascii?Q?sOKUf55e6HVfn9pJGrQkf2kQBstLN90chbLl7zZG50u/nSvaGawn6gyeKli7?=
 =?us-ascii?Q?GoPhQGUzMFamPwM1JgDvEsG7kYK2/Z3ItA9YLtCATQSAbTIsBE4mTnWJbOlS?=
 =?us-ascii?Q?pPpCNP2Rr2rnahOzfczrK9g6oktTA6aWmoiHG2hCn2pAtMQTY+ZpNDph9KtW?=
 =?us-ascii?Q?0cage+j3uE6jHhWbO2f2LuMHQL9QeGCD6JyyfdfKgrgMrCsQ0/swS21ZSTny?=
 =?us-ascii?Q?qGBSOn9Yp73MB7wCvsVmc24EtyVonVc66+nfODiSRXpM0WzarG+sRg4cOtya?=
 =?us-ascii?Q?i1jMeqXmKNzfMeEqNJR0csiXv0aeELVkt0PbY3QM0bjyJhkGismJZklF/hPg?=
 =?us-ascii?Q?o80xmU53GIIj1eP1tEIOaIPYNglP+JLvgHKZZOXWnaHErsT1RsA8gqDg+MK1?=
 =?us-ascii?Q?ZIoeDcFe6ys37YXZJ2FJ3do4MOCbp7Po8VZfXd+voR6U54rXK+UnO0RpFgOl?=
 =?us-ascii?Q?FqUe3lXV0WzMVrKUKIcA+WZx9RfF24pi9ZM3/FzNBbro/KEJ0upRbW3it83R?=
 =?us-ascii?Q?djSaA1FZIt65B+iCANRcd7cg5wEBmCN+xnP9ynuXc8meTgmiV5toZ4czNMps?=
 =?us-ascii?Q?3FPGx5l8Jn32ZlcMRssyuzN7z+5wdPB8S4x6we6KMFmskDNJxUo67WBu97pa?=
 =?us-ascii?Q?jehTriaNiaGVjEYoApNtX1pLgy+3bB6ZUvfTSyL/9yrgvB56+U7hMCpmrkPA?=
 =?us-ascii?Q?HRKoPXXpjYITlEFtj3Rn8MI=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?N5lBfnbgbzwHiTzau59ro7XnROuW9jaHYc8yU1R4XJ1WrOTtmhVtM9khtDPK?=
 =?us-ascii?Q?sDYKsmmybl/s3qQvfKRGIhHTiXtECdQYN9L8gjytTPAuvBQ06m0EYcj6h4jd?=
 =?us-ascii?Q?JRd1DfKU/1lLhL0iwJEigKayruNzBjyzONVTDbU03LieBqcOp3om4oYNrqnP?=
 =?us-ascii?Q?l2yQW0s6pOSihFeLxY0Wj/TTz518vOqy5l62lRJYAkWVl0tc+RXpeg8xHd+3?=
 =?us-ascii?Q?R/yExcqWfbFI5AhIEDPXedoGXvlJFF7/SS0FLduSnBNzaFHjS0NFljVnS5bX?=
 =?us-ascii?Q?tbSqh84koGA/R1iiEn5IKXNbmp7+J/E0kObeozr7h0ps/zgwfKPAOOJolUyu?=
 =?us-ascii?Q?0lsMnNVnN7ocEx4DOivknr5KX9snW0RuMCW+AlxXaKOPmrws056GPHvgmqwP?=
 =?us-ascii?Q?GdrgTcIGpm/+4YI5aI2PstXObywBQ9DDZyg6BaZxmF0co36hEGzLkfVTIqZY?=
 =?us-ascii?Q?2VVNPsamdCaXU51akpg6Jv1U3hWL5tiAzLqZ6f0otwe0KKlrbceMd89GScE3?=
 =?us-ascii?Q?Y88xfFcM5cDUSqU7wpznI6fPsFnxkBfn5dtVldZxCeVo0W7/WdMAwfS+A1fa?=
 =?us-ascii?Q?bP2FGxSUeiOzJYX7E/U/yksCl+PgpnPa/TYDe2Vpco6Bc8AXjQCAIXQ+OMof?=
 =?us-ascii?Q?f6K8OpRFsxJFojKMfnot7kg8b5Z8M96ylcesQpd/38IbUlO2I5zxGExiwwL7?=
 =?us-ascii?Q?9QhFBMIFAVcKJzcUpV0o7MH12uSx67yt8QFOVMLdij+8WSfI3U23Hw5jqR0a?=
 =?us-ascii?Q?uQSyCEI2OOCozw7nj9sk++btNu0KwbHVY+J3Mo9gNXnMxEyDV+5qZTvladjL?=
 =?us-ascii?Q?/fsIpyOZPMnr678WNueVobyiWHt6zb8obr/V5M3AGOfwwS0KMy0RVerE78nS?=
 =?us-ascii?Q?ql8EiIO2lH2jGCAAgICFgXjR94+xdy0lcGJOwji/i/unv6FynwPSvLLN5gYW?=
 =?us-ascii?Q?ZQjpIcP4M/1uYg+IbaRdcocft47jZv+adbO2ZxORyeUmS5kjShUP80OgLu4J?=
 =?us-ascii?Q?j7C6PF0xRjFQlc0gUNgEaccxBmufv8E3RQPhIml91c49aqS/oaQWe+ID8aSi?=
 =?us-ascii?Q?npgGmRm2mC/1RffSKn3pY7yKNDSSqAJYaFUVB5v++p+xzQ8KHGdtRHfKiShr?=
 =?us-ascii?Q?+7VXYqRTYkmvNiGrAuccxT6cRqU2BEXi42yZTbJ7bwDgzBX7OjQBfXEK0Bio?=
 =?us-ascii?Q?AF94oP6FMTi+TNw9JZzmswIEKHrsOY/7dWg3gjGuBoZrpA3tVkgiaWxXCOdP?=
 =?us-ascii?Q?+MhtM6BCM4A9hx+SSzTVlyE6I7dbUHAEbZX47N0+wD7jw22UrPg8dJcWp+Pw?=
 =?us-ascii?Q?BEE8NPaLSC512P8s6yioBJVjlB6ocfAS1EWutH0NSiTl2oPHyEdCvSFdZv0X?=
 =?us-ascii?Q?HOTLna0y0mA65FmhHHO0/RGmrJ+BsywcGYuiePVspuwt7uoLuDx1+WaM8u6q?=
 =?us-ascii?Q?JC5dYNApdh6L68fOUz9yk8QDnR0n6ouJtYFxNr/qKHBLuE+0XqdsjJ+3cgFE?=
 =?us-ascii?Q?zDyRnpx4Ben4kdG+ehPC8LUQN4YrpXTlI7krdP4y7BTW76a/i26oS9Swl3L2?=
 =?us-ascii?Q?nDtVhO+ot6K0E3XaZeKPUied/eH3w87eqbwNoHNumdLyCnGBwlmn0o5ohFfM?=
 =?us-ascii?Q?x47qv5Dnm2cHVIijmhawhTD1Cz3BFPvTunzjW2/RRVvSscIkCAD5yH6L4hXZ?=
 =?us-ascii?Q?ZfqlXMaixEZGJyQzE56TvsMieF6UvjbshAeGY9UYDUfxrVsYdVLkIYQT4pg3?=
 =?us-ascii?Q?VbeDQwsnHQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 230226b3-52bd-4453-984e-08de73ea49ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 21:18:42.8420
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1dqWLaxYI/zagoDc2AIM5WMmHqgt9wRGdwl8PwonfcT1C9yZqyBfhIkQclXWjZOzd0SzkX7henfkBuPLcF+HSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB9293
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-32156-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[foss.st.com,kernel.org,lwn.net,linaro.org,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.994];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0B2C118CA7B
X-Rspamd-Action: no action



> -----Original Message-----
> From: Andrew Lunn <andrew@lunn.ch>
> Sent: Tuesday, February 24, 2026 3:01 PM
> To: Shenwei Wang <shenwei.wang@nxp.com>
> Cc: Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>; Linus Walleij
> <linusw@kernel.org>; Bartosz Golaszewski <brgl@kernel.org>; Jonathan Corb=
et
> <corbet@lwn.net>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Bjorn Andersson
> <andersson@kernel.org>; Mathieu Poirier <mathieu.poirier@linaro.org>; Fra=
nk Li
> <frank.li@nxp.com>; Sascha Hauer <s.hauer@pengutronix.de>; Shuah Khan
> <skhan@linuxfoundation.org>; linux-gpio@vger.kernel.org; linux-
> doc@vger.kernel.org; linux-kernel@vger.kernel.org; Pengutronix Kernel Tea=
m
> <kernel@pengutronix.de>; Fabio Estevam <festevam@gmail.com>; Peng Fan
> <peng.fan@nxp.com>; devicetree@vger.kernel.org; linux-
> remoteproc@vger.kernel.org; imx@lists.linux.dev; linux-arm-
> kernel@lists.infradead.org; dl-linux-imx <linux-imx@nxp.com>; Bartosz
> Golaszewski <brgl@bgdev.pl>
> Subject: [EXT] Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO dri=
ver
> > > How does port_idx fit into this?
> >
> > I think you were assuming there is only one remoteproc in the system?
> > In practice, the setup can look more like this:
> >
> > + remote_cm33{
> > +     rpmsg {
> > +        rpmsg-io-channel {
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <0>;
> > +
> > +          gpio@0 {
> > +            compatible =3D "rpmsg-gpio";
> > +            reg =3D <0>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <2>;
> > +            #interrupt-cells =3D <2>;
> > +            interrupt-controller;
> > +          };
> > +          gpio@1 {
> > +            compatible =3D "rpmsg-gpio";
> > +            reg =3D <1>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <2>;
> > +            #interrupt-cells =3D <2>;
> > +            interrupt-controller;
> > +          };
> > +  ...
> > +        };
> > +      };
> > +};
> > +
> > + remote_dsp {
> > +     rpmsg {
> > +        rpmsg-io-channel {
> > +          #address-cells =3D <1>;
> > +          #size-cells =3D <0>;
> > +
> > +          gpio@0 {
> > +            compatible =3D "rpmsg-gpio";
> > +            reg =3D <0>;
> > +            gpio-controller;
> > +            #gpio-cells =3D <2>;
> > +            #interrupt-cells =3D <2>;
> > +            interrupt-controller;
> > +          };
> > +  ...
> > +        };
> > +      };
> > +};
>=20
> And why would this require a port_idx? If they are different rpmsg instan=
ces, the
> channel numbers are in different address spaces.
>=20

Then how would you distinguish gpio@0 from gpio@1 on the CM33 RPMSG bus in =
the example above?
They are running on the same transport.

Thanks,
Shenwei

>         Andrew


