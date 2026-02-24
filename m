Return-Path: <linux-gpio+bounces-32155-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +HZRIUoUnml+TQQAu9opvQ
	(envelope-from <linux-gpio+bounces-32155-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 22:12:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A253818CA0E
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 22:12:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0DEDE300E688
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Feb 2026 21:12:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2564033C511;
	Tue, 24 Feb 2026 21:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="aXK97yB7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010047.outbound.protection.outlook.com [52.101.69.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34FE133BBC6;
	Tue, 24 Feb 2026 21:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771967556; cv=fail; b=Gh+aJ9fLJ/vw6V2dXwBkJTBylO0dlAuaCQPvfnskYuATVGibmvUT4V3PMUrwT9MEv+1LpO5shdvjug0YuvcyyUnYhDJ1a/o5SsInMZZmwaioQumlyNE8u6+u7R/HcFZw5BZXMMgr8h2mFNvaFRW7M3eykrNmSg78d5BLI3YJ3kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771967556; c=relaxed/simple;
	bh=Q7uR7h5rcdqikaEi1JLqUQ5gFTL7zN90mh6xUmb1diw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=F/mSST3LzLNOHyGu8JfN/H14cjaqJXupMGcEddT0bvbwxP1qXs5X490KhFx1grS5cLAAA25UP5gqFsBS0NJuCoM5SLTIxj47iNpEZLe2idz0eKF7v6UIIofR7nzIPerpzb+SlppbqsDG9tDKt6w1VZXTOR3+bxibnYZRnHseKYI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=aXK97yB7; arc=fail smtp.client-ip=52.101.69.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=It3eWiHYCDrwOllb7VJC/am6vy+kGe5mivCa7mJxbBwfPk3wGvxR8NbJ9SyZ70UOJiPS7/YCaBOVohF0nAhbEM4+tgTcALbPqYDdhnyk/F6dWGEoaIHoUTmYH0eb+aNvJuAg4iODMjW7+vXvD/9P2E7jIXHvkaYKLs1q3RNo2kUCxVjfHIp7eJ2zVf94aNsT1wfYiJX0HANh929ntwIyeTXZV1PHm6WITYzXECxPw7xlVzB7hLYy2WB8j2d1INzb3+PzmZP49ez1bLpYTaF+Tum9/Osy/dvsPFAW8RaYJzTiHvsT1D1TA8RpmEdu/NWq3pPB3odOrYGJhOBYAmMu2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q7uR7h5rcdqikaEi1JLqUQ5gFTL7zN90mh6xUmb1diw=;
 b=scYrHjxPB15d0MWK0C4HSaz/XrLpDcnceKZ3YjbNppiooYnQDT4sjRb43AmIXyjazNbKaX9AVCQVwOar/E8yNrBNKrfrK/Nll7g1JvxK2PiaBpG6iz4bU/gyH+tXUx2Dc1fSiD49N/Fogyg0SORb8Bg95wqh6WUuIgjFqJhgkV7fyqvksOWv+s4JvvXdjHv1LW9S6szZsAh+oIjLkEbX0oCoqcz+t79ikbWO5/+iK0Q/OhOPc3sKhMI/5P+Nj6v6AmVj2Gx4g8GxO8YRP3gtyyXNczo/5KGLuZAlzY8Gwvcdymyda9dORSfeyw2Uec3AIkhqvCHmRW1kgiboXJhF0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q7uR7h5rcdqikaEi1JLqUQ5gFTL7zN90mh6xUmb1diw=;
 b=aXK97yB7al3RCLPDF93w6JkhyaOQ+eun8lsOrWZHwNwnOk2waJd87xFlhS32TnZi8fqrJCjBRdpIGhjEnlIv/n7dF7qJ0RjUZnbqn/5VHnEh0M9FC/UwxbQ7fuoIYoRdonP4TRWJmv8JuC6ubfnaFGWkRbau+ZC9lZUjDl96egX+YhPfE3UWFT+Wln873h+lkDG+lbKF+/Yjjd4tK4tI856I5ORyGq5MIMawD3COTjxTT+jdiBn9GJX0FGbVdwONQOFnyNNjalcEcL64kRWnpvPG1oTi5s0rc39vj8by5i4Q1cq3zSyRv8NR0C8V/T6+LMvri8P5hxxM8e/jngks3Q==
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com (2603:10a6:102:231::11)
 by GV1PR04MB9150.eurprd04.prod.outlook.com (2603:10a6:150:25::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 21:12:29 +0000
Received: from PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb]) by PAXPR04MB9185.eurprd04.prod.outlook.com
 ([fe80::b4c0:6119:2228:2ceb%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 21:12:29 +0000
From: Shenwei Wang <shenwei.wang@nxp.com>
To: Mathieu Poirier <mathieu.poirier@linaro.org>
CC: Bjorn Andersson <andersson@kernel.org>, Arnaud POULIQUEN
	<arnaud.pouliquen@foss.st.com>, Linus Walleij <linusw@kernel.org>, Andrew
 Lunn <andrew@lunn.ch>, Bartosz Golaszewski <brgl@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li
	<frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, Shuah Khan
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
Subject: Re: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Topic: [PATCH v8 3/4] gpio: rpmsg: add generic rpmsg GPIO driver
Thread-Index: AQHcpdJIeSauJHd1rk2LH2AxtTLZTw==
Date: Tue, 24 Feb 2026 21:12:29 +0000
Message-ID:
 <PAXPR04MB9185B68BC640D940534E44098974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
References: <20260212213656.662437-4-shenwei.wang@nxp.com>
 <aae7c851-a93b-4d57-a118-43c6e68c4790@foss.st.com>
 <13f9d767-61d6-4e29-b36e-6dcc860ccb11@lunn.ch>
 <fd257c80-d97f-45b0-a12f-3a1888ba81db@foss.st.com>
 <396819f2-dd00-4c09-8bc7-c035a5282a56@lunn.ch>
 <PAXPR04MB9185A908F5090F0CA4FF05F78968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <b21b9ee5-d84e-47f8-86b5-c111ecc3d43d@lunn.ch>
 <PAXPR04MB918576D67A268E59242964A08968A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CAD++jLkUVFckLTq=SoivNFoFymhJo4KM=qGmajFcv9T9+7tPmg@mail.gmail.com>
 <b4c422ce-3538-40aa-8bfa-b70f02774b5d@foss.st.com>
 <nbzdtngifwrx2kyu4tsiwwua5v4i5cjtaotemq5hubaets3bcn@fk25twf5rv6x>
 <PAXPR04MB9185588C1DB71B1FEFA1DEE38974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkxAwgG1WkMRr8EJZuSUnN_jKVnsWhWTakVqhvtMBO365A@mail.gmail.com>
 <PAXPR04MB91851D3DA6A92669CB5926A18974A@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
In-Reply-To:
 <CANLsYkw-8ERXy3v8Sv55Cpq=+41Toez3EjLMbENAkavvr8STeQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9185:EE_|GV1PR04MB9150:EE_
x-ms-office365-filtering-correlation-id: 2ccb3ef8-4bcf-491b-1793-08de73e96b36
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|19092799006|1800799024|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?LzdLbWdoc0RVNEsyOWsvTWc0UEh5V01RYm1hcVhqbkx5WFh3UDdBZ0o3ZjRP?=
 =?utf-8?B?ZkFNSUV0c2J6bTAxNU01ZVZ6Z3lhR3pqTExBRVhaalVGV21xUDJiVDR4SVhN?=
 =?utf-8?B?ZXFlNUFvWllVTk01SEZqV1ZIZkZNSHIvc29rWVg0YWZyQ1hQcjVjeXVVT0po?=
 =?utf-8?B?ejcvSDNza01TUSs5ZFJRK0cxY3VzTlFJclREcTU5WHpSSzM5RWs3L2JZWSt2?=
 =?utf-8?B?c3hKWmk2dklMR1gxaVRNK2QvTnpLclMrbVJkSWRMbTVETUpRWWZUM2dQemVT?=
 =?utf-8?B?SlZOSXVsZ2NDVG9SL09vUVJZM1hzaG5tVXJYL2c3Y1lDejI4V1h1Q29nSGw5?=
 =?utf-8?B?bHZRekdESjFvKzBBVHpPNU5lcEhQQlBxZXFXaGs5RHRPeVpnNXZETkV0U3l4?=
 =?utf-8?B?emNnRWJoQnU4VmpFVUZ3SVhWb1A2dmlhVGcyS3ZFQ2J1NGpsd0ROS1dCanFG?=
 =?utf-8?B?ZlBSMk9OVG1BV3NHcnZrVHh4R3BZSjNEY0REOWx5UmF6aWY2ZklDUnpGZXR3?=
 =?utf-8?B?aHdtWDdFQnpVWThNa2VQa1BJc1ZvaFBaMVpjVlpmRG83ZkgxamNldHY5UHhG?=
 =?utf-8?B?Z2Q0S0dIcmhUZzRCWGozSE5hWGlNa2VFSEd4QStKckFOVHZxdkkzRnByRUQz?=
 =?utf-8?B?QVd4Rm4yR2ZPQi9wN1V0MU9Fd0U3T1pKOEc4Sm1Hc1NicTJLMlBMek1FcGs0?=
 =?utf-8?B?RGVUZDd2RmxjeG15Zzllem8vYmE5K2lkTWJjVXUzbGJzV0JzRzh3UlJoZ2Q4?=
 =?utf-8?B?Y0c0V3F4TW9qV0IwRGErZ1NYUFpFRTlsV3ZNZUR5b2pxam5XM09zNngwaXlQ?=
 =?utf-8?B?ZFA4WVBCdFFIMmpsR1BuSExPUlkwVkVUZmxhQTJVendRaXZNQmdmeU5Rc2Vj?=
 =?utf-8?B?OVZ0NTNFUEMrdktVVE8wcVhNVXh5Z0M3REhhd3l2Y2tHWU13NUI4QkpoWGd3?=
 =?utf-8?B?cFBCVFhqRUtjWWp6b3F2VXBMSkc0WEpjVWxRNHRmZ1BhbFhqZGV1QzkxNC84?=
 =?utf-8?B?UjhielNOeUEyWjJiQm95N0kwQ0p6MW1mSGtGNktHWE15V0tnZnZlVkFSOExz?=
 =?utf-8?B?eDAvZC9YRHhWTkNQZGxVejdLZlNzL2RqWjc1Ykw0UFYyNkpKTmtXRmpvL1JQ?=
 =?utf-8?B?ZWRnc0pDMEpzMGkwZUZTT0orYmFPU3kwd0RGRjUwM09VbWROS1NVUjIxcFBS?=
 =?utf-8?B?cUZURXMvOUlWcUJvTXVBVkpPRHdNbXRJY1RNeGw2ajJKUzZNNUVZaS93SUNj?=
 =?utf-8?B?VTBLQU9haG5acDQ5OG4wekJSeFl0c2liemMyWFJYN2w4Z2ozbFpwUlJtNU5w?=
 =?utf-8?B?SnM5NmVoaXlvdWRHS3kzVTZSL0dLT2xQTGRoeUxDa1A3eTM0VlNpMENzZVlY?=
 =?utf-8?B?U1cvVW44TGYvbis4bk1SMlpZVmNjYk5tcUp2OG1CTjNYZG1LVVg4RmJjOHlz?=
 =?utf-8?B?cXNrdnhWbFVuUlQ1bm9PWi8vOTlBNk9aaGNEd0d1aUxkMytYL0NQMkRtM0pF?=
 =?utf-8?B?cFJvbG1qMTZKUWRkdlNKdzJnMFF2a1FrWmJhY0VYQ0lSQWw4RXJ3RXk4Nzht?=
 =?utf-8?B?bVhzSnRIRHgrQ0pXWFJYeFdqcjdXUnBVMWw5VHRwTHhjc0EwYmVzSkJRMzJ5?=
 =?utf-8?B?KzJ2aGtlK2tSR2x3SmZtNWtVbU4rMC82THY2ZmFtakl5Rm5kbndYT0hVMm5C?=
 =?utf-8?B?ZGdkTFJxNmFoMEd5eHVsOGo4bTE2VEt1b1dPSXhqTDlaS0p4NDJxaGxlU0xn?=
 =?utf-8?B?R3lSajJqQlEyUFQ0NjJzcFk2Vy84SlhGbnUxUys3VGhPS1B5RGF4RUk1RXhD?=
 =?utf-8?B?VjRwTFppN3FNejltTFR6bFBpN1RSTVJzcE1aOXNkWGQwZkQ0LzRzZ1VvM1g2?=
 =?utf-8?B?cnJIOXlTekZFNlZFUFlyYmlYdk9sRER2ZlVtem52ZEM1NGUzUVRVRlVmV0dj?=
 =?utf-8?B?cENwTVpqL0o1Z2x0c0FpV01ubUU2OHU5OW5BWlFmclhkanhlTXFnd211ODhv?=
 =?utf-8?B?MEthVDBZdDlqZjlVWWorTGZuaUlGUmN3SnNlY2prM202MzBOWE5SR1FxdklS?=
 =?utf-8?B?REM0MFVxZEpvTE5ZWlJmSHBDU1NWMXhQZ3hJSEFCd1lDNlNwLyt2TDZzK01x?=
 =?utf-8?B?ODgyRXcwa0VJSENsK0NUWHpXQW9xUVNOQ20vbllIV2V5WXczRWV3Nm9LZE9L?=
 =?utf-8?Q?uBz4NYXSJKmbkQ79pB7n/TQ=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9185.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(19092799006)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NjZMTXJQNG45RUtiR20zazdybDFzWUN4bFRJc3JZaTFDb3JCVDRhNHhQSG9n?=
 =?utf-8?B?azd6cEc5T0VhcnVUdC9WUExRSEZ6dzdTMzVEM3Y4YXMreTI1VjQyQnd2K1Zz?=
 =?utf-8?B?VHRGQm8rSlRoRFIrSnI4cktRcEJrbmNabUhGUDZxazRhdGNSMmd2TEZodzdN?=
 =?utf-8?B?aVBuNjNwUkpEMlgwcFpWSHhiY1FKUWZFRW9XYldKOUYyOE16R1lsS3FnbXRh?=
 =?utf-8?B?UFFrcWtOOHJHWTR5OCtjZXM0WHRnajM5WU5iR1h6dWhCSDRwU0hMZmpTVG03?=
 =?utf-8?B?a082TkJmOWJwaURDWTVnbWllUzRaVThRQXBNMmZsbkFkbU9BNDB0d3l2R2Yy?=
 =?utf-8?B?Q3lMem5MOWQwVDd1VUJMcVpVS3VDajNZRkdGQ3MxTVdIbmZnSDUvNFJOUzRt?=
 =?utf-8?B?bnUxZFZRYlJFNGhpS1FGb0JUb1pvclU3WHhmYTVJWVdLOXBkV3dYd1QvanNO?=
 =?utf-8?B?VU1SeGExWm8zd1drdzBhV0lobkpiKzh5cTd3V1RFSEQxQUVKeG5ZdWtibzlj?=
 =?utf-8?B?bWlLUCtacEVhSDVjWlprM2o5S2txNk5tYUl1a0p3YTJjcU9VdTNVNmxGWFh2?=
 =?utf-8?B?citjSDdJZFltYXZIWTlreVNIdkFKdWk2V1ppKytDWjRMYjN2amhnVHQyc09r?=
 =?utf-8?B?bEN1WGxmcjlkNGJ1Z1NNcGNEN2c5dFI1WlFuNkxaSHhQMEt5RzQrcmQ2QTl1?=
 =?utf-8?B?VUFuUkRRMDNEdVNDVUlQYlhTblBzSlBuRWxlUkQyRlNXaVFYMzZZbGlDME5j?=
 =?utf-8?B?aTljY241YjJsTXVJdXh4bkN1ZlcxRWdSZm02KzRiYzFiMUtJQ2x3UGMyTW9J?=
 =?utf-8?B?L0lKNXBZQ0xrQXBzVWVVVHkwSGJVYmM1Mm1VNmtHNDVTUWlhaGMwbDlWclh0?=
 =?utf-8?B?d0tJZ0c4dnNxbGNDSWF1akpoMnVUdjJqZldGVnZvWUZETWkrNTdvWHVkR2hz?=
 =?utf-8?B?MXQvS3gzT21iZzBTWU9XQ2ZPOXpMU0dMMEV5L0RnVUtBWnpYWTNaeUZGQS9I?=
 =?utf-8?B?dVNpMFZyU1RYaTBhRmlOS1pmcmlWRUJuNE5PMm1GNGxCeTJ5NWN5MjVzMlJt?=
 =?utf-8?B?bHB5NEMwQ3dkWXdaMkYwOEtJTTVtVHFQM29KMWlHZWxWL3hCcDY2UnVLTUVK?=
 =?utf-8?B?Y0xVcGljQnJoeitObVJRcUZHbHo0VzVqNHRrNHlsR1RJek0zM2VWbEd4bTMz?=
 =?utf-8?B?Z2srblJKK01sZS9hWUtOVXVPZStiOExMT0NVMDhKWm43UnRMYVJDQWw4OVlQ?=
 =?utf-8?B?ZXBEeDNwOEhibElKQkxZd2J6bUhKTjlBRUhXUU1Tbk1pYklKL2hoSWdKSzdS?=
 =?utf-8?B?VzBDY3F0RnhzM0tPbDZXTVhpTlRkVUowZS9XOEtod2RReDlkUUJhZnZsZm9J?=
 =?utf-8?B?NEVTK2djL1UyVno0YUIwRjlsSk5lRG13eU5JQXVKQzdqVk1rOGhrZ3BZMEJK?=
 =?utf-8?B?WWJ5akFNMXFndVE5YUEvVDhRZHBBRnJLUkxvemNLWXRCRHgwaUlTdTZVd1NU?=
 =?utf-8?B?MHhUa0lWZEtIUGZ4dWhWMUNBOUx2VGJoaWNxNlNDaHlpRUlvNitnRThudDBR?=
 =?utf-8?B?TGVVekhrUTE5aVU3UTJybS9Cbm1EdkxwQUt1ZGVaRTRsQ3RKNnN5dkdQVWdD?=
 =?utf-8?B?ckNPYmliRTlvaDIxaWJLWXVQZXVyYnExRjM0a1ZNcmsrdy9oZU5rK0ljTVhP?=
 =?utf-8?B?K010a29sZVlpREEvUmU2TzNVdTdXNjNJTnByNTVWZkx5RjFvRGp3cDZDVVNy?=
 =?utf-8?B?RklLRFl0SHVmMzNJZlh1RDMweHVKVDJML1BFTnppczlOa2hPZjRMY1VoNHhQ?=
 =?utf-8?B?VlhpaktublVUN1JVNzBnb3huNkQ2dHlhd3Vid1lCSmo1cjkxczVjY2V0Q2Q3?=
 =?utf-8?B?bmsvb3luK2tabzhYd2F1ZjhaOGxQRmVIem9RWjNtWi9YdmJaWEE4VWV3RUtT?=
 =?utf-8?B?U21UeGE5aElydXRkeGxrSUFEa0Roak8rc3N5Q2tlMnNudE1OTytBVThIdEYw?=
 =?utf-8?B?K005RjRIZVh0MlYxNGdkaFVuZ211ZHZENlhEVCszMThrMU5EZ0swemxPUjFF?=
 =?utf-8?B?c0c3eEVMTWlYUEZhckhIVGRDZUtDYVRGeUtMMzY3VzRnUHFicWZRcWtDalZW?=
 =?utf-8?B?YWZiUVpkeEpheEppSHFQWHBjZWNtd29MN0RIVDVqcEN4OHI2T0hPRlM4UEZy?=
 =?utf-8?B?NStGOWlJN1VPQldRMzd2NkpKMGIyWXBRUE5kc3BsQUhpMkY3eFRGV0tDMGFr?=
 =?utf-8?B?a1o2aEVvQm81dmVnVC9ISjlwbVpnSVZyT0ZSTkhSWDFWSGhtMjhJRlZoaFNH?=
 =?utf-8?B?QzhwUFNrb1k3TTFibm13aitnaXpydi9RSTVXMG11T215dHZKdWh6QT09?=
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
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9185.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ccb3ef8-4bcf-491b-1793-08de73e96b36
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2026 21:12:29.5852
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: H4z7gJ3mzoqmVRMyVei70QCiyjb9OzqdQ89Scssxpv8Fun8B7cCIef8SggPq5b9UY+EwMhN5qkdbJcfKfO26jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9150
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.44 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32155-lists,linux-gpio=lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,foss.st.com,lunn.ch,lwn.net,nxp.com,pengutronix.de,linuxfoundation.org,vger.kernel.org,gmail.com,lists.linux.dev,lists.infradead.org,bgdev.pl];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shenwei.wang@nxp.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-0.965];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A253818CA0E
X-Rspamd-Action: no action

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogTWF0aGlldSBQb2lyaWVy
IDxtYXRoaWV1LnBvaXJpZXJAbGluYXJvLm9yZz4NCj4gU2VudDogVHVlc2RheSwgRmVicnVhcnkg
MjQsIDIwMjYgMjo0MSBQTQ0KPiBUbzogU2hlbndlaSBXYW5nIDxzaGVud2VpLndhbmdAbnhwLmNv
bT4NCj4gQ2M6IEJqb3JuIEFuZGVyc3NvbiA8YW5kZXJzc29uQGtlcm5lbC5vcmc+OyBBcm5hdWQg
UE9VTElRVUVODQo+IDxhcm5hdWQucG91bGlxdWVuQGZvc3Muc3QuY29tPjsgTGludXMgV2FsbGVp
aiA8bGludXN3QGtlcm5lbC5vcmc+OyBBbmRyZXcNCj4gTHVubiA8YW5kcmV3QGx1bm4uY2g+OyBC
YXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGtlcm5lbC5vcmc+OyBKb25hdGhhbg0KPiBDb3JiZXQg
PGNvcmJldEBsd24ubmV0PjsgUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz47IEtyenlzenRv
ZiBLb3psb3dza2kNCj4gPGtyemsrZHRAa2VybmVsLm9yZz47IENvbm9yIERvb2xleSA8Y29ub3Ir
ZHRAa2VybmVsLm9yZz47IEZyYW5rIExpDQo+IDxmcmFuay5saUBueHAuY29tPjsgU2FzY2hhIEhh
dWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPjsgU2h1YWggS2hhbg0KPiA8c2toYW5AbGludXhm
b3VuZGF0aW9uLm9yZz47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gZG9j
QHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgUGVuZ3V0cm9u
aXggS2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0g
PGZlc3RldmFtQGdtYWlsLmNvbT47IFBlbmcgRmFuDQo+IDxwZW5nLmZhbkBueHAuY29tPjsgZGV2
aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LQ0KPiByZW1vdGVwcm9jQHZnZXIua2VybmVs
Lm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxAbGlzdHMuaW5m
cmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47IEJhcnRvc3oNCj4g
R29sYXN6ZXdza2kgPGJyZ2xAYmdkZXYucGw+DQo+IFN1YmplY3Q6IFtFWFRdIFJlOiBbUEFUQ0gg
djggMy80XSBncGlvOiBycG1zZzogYWRkIGdlbmVyaWMgcnBtc2cgR1BJTyBkcml2ZXINCj4gPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gPiBGcm9tOiBNYXRoaWV1IFBvaXJpZXIg
PG1hdGhpZXUucG9pcmllckBsaW5hcm8ub3JnPg0KPiA+ID4gU2VudDogVHVlc2RheSwgRmVicnVh
cnkgMjQsIDIwMjYgMTI6MTAgUE0NCj4gPiA+IFRvOiBTaGVud2VpIFdhbmcgPHNoZW53ZWkud2Fu
Z0BueHAuY29tPg0KPiA+ID4gQ2M6IEJqb3JuIEFuZGVyc3NvbiA8YW5kZXJzc29uQGtlcm5lbC5v
cmc+OyBBcm5hdWQgUE9VTElRVUVODQo+ID4gPiA8YXJuYXVkLnBvdWxpcXVlbkBmb3NzLnN0LmNv
bT47IExpbnVzIFdhbGxlaWogPGxpbnVzd0BrZXJuZWwub3JnPjsNCj4gPiA+IEFuZHJldyBMdW5u
IDxhbmRyZXdAbHVubi5jaD47IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJyZ2xAa2VybmVsLm9yZz47
DQo+ID4gPiBKb25hdGhhbiBDb3JiZXQgPGNvcmJldEBsd24ubmV0PjsgUm9iIEhlcnJpbmcgPHJv
YmhAa2VybmVsLm9yZz47DQo+ID4gPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0QGtlcm5l
bC5vcmc+OyBDb25vciBEb29sZXkNCj4gPiA+IDxjb25vcitkdEBrZXJuZWwub3JnPjsgRnJhbmsg
TGkgPGZyYW5rLmxpQG54cC5jb20+OyBTYXNjaGEgSGF1ZXINCj4gPiA+IDxzLmhhdWVyQHBlbmd1
dHJvbml4LmRlPjsgU2h1YWggS2hhbiA8c2toYW5AbGludXhmb3VuZGF0aW9uLm9yZz47DQo+ID4g
PiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgbGludXgtIGRvY0B2Z2VyLmtlcm5lbC5vcmc7
DQo+ID4gPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBQZW5ndXRyb25peCBLZXJuZWwg
VGVhbQ0KPiA+ID4gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47IEZhYmlvIEVzdGV2YW0gPGZlc3Rl
dmFtQGdtYWlsLmNvbT47IFBlbmcNCj4gPiA+IEZhbiA8cGVuZy5mYW5AbnhwLmNvbT47IGRldmlj
ZXRyZWVAdmdlci5rZXJuZWwub3JnOyBsaW51eC0NCj4gPiA+IHJlbW90ZXByb2NAdmdlci5rZXJu
ZWwub3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC1hcm0tDQo+ID4gPiBrZXJuZWxAbGlz
dHMuaW5mcmFkZWFkLm9yZzsgZGwtbGludXgtaW14IDxsaW51eC1pbXhAbnhwLmNvbT47DQo+ID4g
PiBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPg0KPiA+ID4gU3ViamVjdDogW0VY
VF0gUmU6IFtQQVRDSCB2OCAzLzRdIGdwaW86IHJwbXNnOiBhZGQgZ2VuZXJpYyBycG1zZw0KPiA+
ID4gR1BJTyBkcml2ZXIgT24gVHVlLCAyNCBGZWIgMjAyNiBhdCAwODo1NiwgU2hlbndlaSBXYW5n
DQo+IDxzaGVud2VpLndhbmdAbnhwLmNvbT4gd3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+DQo+ID4g
PiA+DQo+ID4gSSB0aGluayB0aGlzIGhpZ2hsaWdodHMgd2h5IHNvbWUgY3VzdG9tZXJzIHByZWZl
ciBSUE1TRyBvdmVyIHVzaW5nDQo+ID4gdmlydGlvIGRpcmVjdGx5LiBMaW1pdGVkIHN5c3RlbSBy
ZXNvdXJjZXMgYW5kIGRldmVsb3BtZW50IGVmZmljaWVuY3kNCj4gPiBhcmUgdGhlIHR3byBtYWlu
IHJlYXNvbnMgdGhhdCBtYWtlIFJQTVNHIGEgYmV0dGVyIGZpdCBmb3IgY2VydGFpbg0KPiBlbnZp
cm9ubWVudHMuDQo+ID4NCj4gPiA+IHByb3RvY29sIHNob3VsZCBiZSBkZXJpdmVkIGZyb20gZ3Bp
by12aXJ0aW8gdGhhdCB3b3VsZCBvbmx5IGRlYWwNCj4gPiA+IHdpdGggYnJlYWtpbmcgZG93biB0
aGUgc3RhbmRhcmQgZ3Bpby12aXJ0aW8gcHJvdG9jb2wgaW50byBzb21ldGhpbmcNCj4gPiA+IGRp
Z2VzdGlibGUgYnkgUlBNU0cuICBUaGF0IHdhcyBCam9ybidzIHBvaW50IGluIGFuIGVhcmxpZXIg
bWVzc2FnZS4NCj4gPiA+IFRoaXMgd2lsbCBhbGxvdyB0byB1c2UgdGhlIHNhbWUgaW50ZXJmYWNl
IGFuZCBiZSBmbGV4aWJsZSBpbiBob3cgd2UNCj4gPiA+IHdhbnQgdG8gdGFsayB0byB0aGUgdHJh
bnNwb3J0IG1lZGl1bSwgaS5lIHB1cmUgZ3Bpby0gdmlydGlvIG9yIHJwbXNnLWdwaW8uDQo+ID4g
Pg0KPiA+DQo+ID4gT25jZSB0aGUgcmVtb3RlcHJvYyBjaG9vc2VzIHRvIGV4cG9zZSBkZXZpY2Vz
IHRocm91Z2ggYW4gUlBNU0figJFiYXNlZA0KPiA+IHByb3RvY29sLCBkZXJpdmluZyBhbm90aGVy
IGRyaXZlciBmcm9tIGdwaW/igJF2aXJ0aW8gZG9lc27igJl0IHJlYWxseSBtYWtlDQo+ID4gc2Vu
c2UuIFRoYXQgd291bGQgZXNzZW50aWFsbHkgbWVhbiByZeKAkWltcGxlbWVudGluZyBwYXJ0cyBv
ZiBSUE1TRyB5b3Vyc2VsZg0KPiBpbnN0ZWFkIG9mIHVzaW5nIGV4aXN0aW5nIG9uZS4NCj4gPg0K
PiANCj4gV2UgY2xlYXJseSBkbyBub3QgdW5kZXJzdGFuZCBlYWNoIG90aGVyLg0KPiANCg0KVGhl
IGN1cnJlbnQgUlBNU0cgc29sdXRpb246DQoNCiAgICAgT24gUmVtb3RlcHJjICAgICAgICAgICAg
ICAgICAgICAgIE9uIExpbnV4DQpHUElPcyAtPiBSUE1TRyAtPiBWSVJUSU8gPT0gVklSVElPIC0+
IFJQTVNHIC0+IEdQSU8tUlBNU0cgZHJpdmVycw0KDQpUaGUgVklSVElPIHNvbHV0aW9uOg0KDQog
ICAgIE9uIFJlbW90ZXByYyAgICAgICAgICAgICAgICAgICAgIE9uIExpbnV4DQogICAgICAgICAg
R1BJTyAtPiBWSVJUSU8gPT0gVklSVElPIC0+IEdQSU8tVklSVElPIGRyaXZlcg0KDQpZb3VyIHBy
b3Bvc2FsOg0KICAgICBPbiBSZW1vdGVwcmMgICAgICAgICAgICAgICAgICAgICBPbiBMaW51eA0K
R1BJT3MgLT4gUlBNU0cgLT4gVklSVElPID09IFZJUlRJTyAtPiA/Pz8NCg0KVGhpcyBpcyB5b3Vy
IGNvbW1lbnRzOiAgIkZvciB0aG9zZSBjYXNlcyBhIGdlbmVyaWMgcnBtc2ctZ3BpbyBwcm90b2Nv
bCBzaG91bGQgDQpiZSBkZXJpdmVkIGZyb20gZ3Bpby12aXJ0aW8iDQoNClBsZWFzZSBleHBsYWlu
IGhvdyB5b3Ugd291bGQgZGVzaWduIHlvdXIgZ2VuZXJpYyBycG1zZy1ncGlvIGRyaXZlciB3aGlj
aCBpcyBkZXJpdmVkDQpGcm9tIGdwaW8tdmlydGlvPw0KDQpUaGFua3MsDQpTaGVud2VpDQoNCj4g
PiA+IEZvcnR1bmF0ZWx5IFJQTVNHIGFscmVhZHkgdXNlcyBjaGFubmVscyB0byBkaWZmZXJlbnRp
YXRlIGJldHdlZW4NCj4gPiA+IHRyYWZmaWMsIG5vIG5lZWQgdG8gbXVsdGlwbGV4IGV2ZXJ5dGhp
bmcgb24gdGhlIHNhbWUgY2hhbm5lbC4gIFRoYXQgdG9vIG5lZWRzDQo+IHRvIGdvLg0KPiA+ID4N
Cj4gPiA+ID4gQXMgdGhlIGNoaXAgdmVuZG9yLCBOWFDigJlzIHJvbGUgaXMgdG8gcHJvdmlkZSBh
bGwgcG9zc2libGUgb3B0aW9ucw0KPiA+ID4gPiBhbmQgbGV0IGN1c3RvbWVycyBjaG9vc2UgdGhl
IGFwcHJvYWNoIHRoYXQgYmVzdCBmaXRzIHRoZWlyIG5lZWRzOw0KPiA+ID4gPiB3ZSBkb27igJl0
IG1ha2UNCj4gPiA+IHRoYXQgZGVjaXNpb24gZm9yIHRoZW0uDQo+ID4gPg0KPiA+ID4gQXMga2Vy
bmVsIG1haW50YWluZXJzLCBvdXIgcm9sZSBpcyB0byBhZHZpc2Ugb24gZGVzaWducyB0aGF0IGFy
ZQ0KPiA+ID4gZ2VuZXJpYywgc2ltcGxlLCBtYWludGFpbmFibGUgYW5kIHN0YW5kIHRoZSB0ZXN0
IG9mIHRpbWUuDQo+ID4gPg0KPiA+DQo+ID4gVGhlc2UgYWRqZWN0aXZlcyBvbmx5IG1ha2Ugc2Vu
c2Ugd2l0aGluIHRoZSBjb250ZXh0IG9mIGEgc3BlY2lmaWMgdXNlDQo+ID4gY2FzZS4gRGlmZmVy
ZW50ICBzeXN0ZW1zIGhhdmUgZGlmZmVyZW50IGNvbnN0cmFpbnRzLCBhbmQgcGVvcGxlIGNob29z
ZQ0KPiA+IGEgcGFydGljdWxhciBzb2x1dGlvbiBmb3IgdmFsaWQgcmVhc29ucyBiYXNlZCBvbiB0
aGVpciByZXF1aXJlbWVudHMuDQo+ID4NCj4gDQo+IFlvdSBjYW4gY2hvb3NlIHdoYXRldmVyIHNv
bHV0aW9uIHlvdSB3YW50LCB0aGF0IGlzIGVudGlyZWx5IHVwIHRvIHlvdS4NCj4gTWFpbnRhaW5l
cnMgY2FuIGFsc28gY2hvb3NlIHRvIHJlamVjdCB0aGF0IHNvbHV0aW9uIGZvciBtYWlubGluZSBM
aW51eCwgd2hpY2ggaXMNCj4gZXhhY3RseSB3aGF0IHdlIGFyZSBkb2luZy4NCj4gDQo+ID4gUGxl
YXNlIHJlc3BlY3QgdGhlaXIgZWZmb3J0cy4NCj4gPg0KPiA+IFRoYW5rcywNCj4gPiBTaGVud2Vp
DQo+ID4NCj4gPiA+ID4NCj4gPiA+ID4gVGhhbmtzLA0KPiA+ID4gPiBTaGVud2VpDQo+ID4gPiA+
DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBJZiBub3QsIGl0IHdvdWxkIGJlIGdvb2QgdG8gZGVyaXZl
IGEgZ2VuZXJpYyBycG1zZy1ncGlvIHByb3RvY29sDQo+ID4gPiA+ID4gZnJvbSB0aGUgdmlydGlv
IHByb3RvY29sLCBhbmQgbGFuZCBpbXBsZW1lbnRhdGlvbnMgb2YgdGhpcyBpbiBlLmcuDQo+ID4g
PiA+ID4gTGludXggYW5kIFplcGh5ciB0byBlc3RhYmxpc2ggdGhhdCBvcHRpb24uDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBSZWdhcmRzLA0KPiA+ID4gPiA+IEJqb3JuDQo+ID4gPiA+ID4NCj4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiBJbiB0aGUgZW5kLCBJIGFtIGp1c3QgdHJ5aW5nIHRvIGluZmx1
ZW5jZSB0aGUgZGlyZWN0aW9uIGZvcg0KPiA+ID4gPiA+ID4gUlBNc2csIGJ1dCBiYXNlZCBvbiB0
aGUgZGlzY3Vzc2lvbnMgaW4gdGhpcyB0aHJlYWQsIGl0IHNlZW1zDQo+ID4gPiA+ID4gPiBvdGhl
cnMgc2hhcmUgc2ltaWxhciBleHBlY3RhdGlvbnMsIHdoaWNoIHNob3VsZCBwcm9iYWJseSBiZSB0
YWtlbiBpbnRvDQo+IGFjY291bnQgYXMgd2VsbC4NCj4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiBU
aGFua3MgYW5kIFJlZ2FyZHMsDQo+ID4gPiA+ID4gPiBBcm5hdWQNCj4gPiA+ID4gPiA+DQo+ID4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gSSBqdXN0IHdhbnQgdG8NCj4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFlvdXJzLA0KPiA+ID4gPiA+ID4gPiBMaW51cyBXYWxsZWlq
DQo+ID4gPiA+ID4gPg0K

