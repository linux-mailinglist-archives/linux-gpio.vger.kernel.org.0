Return-Path: <linux-gpio+bounces-10305-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E69197D38A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 11:19:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1A48728685A
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Sep 2024 09:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B99C581AC8;
	Fri, 20 Sep 2024 09:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b="dA0zqsDo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com (mail-psaapc01on2097.outbound.protection.outlook.com [40.107.255.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6249C1CD2C;
	Fri, 20 Sep 2024 09:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.255.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726823958; cv=fail; b=vCTX9gjeh+Gh+E+izHlYoBe5Yr15zv7X6af/WT+JOul54Dn9tK09Nxzo3en65FKpVIr/nvmKuZFhbhoPt+rp7k6QiqRPnK2cqWsXhx/nnMQ0M45A+GWZuI/Eap9O87Lx95saaQ0KhQ52VTlDUux08WlMt9JhoJ6EMsobHXzcFWE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726823958; c=relaxed/simple;
	bh=3i64TWwqZYMsoVN07lgFQvhnTjZPSbT5KnKS26F1wdA=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=uMoo6fvasxgKxcirjasA2xdYwmlYHJwMaHx6PRmn7FcWhX5PrxLM31ne4yY5nFz1bIcarsIxMA4ZYCocNsJaIpVW/jI3aosCbAElPtYwrBYChi9fcbmrT9ms+DKyUyG+Jnc0qqR0ExtWGCsNJWohI81zoDVPxZElR4IoVdQWGRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com; spf=pass smtp.mailfrom=aspeedtech.com; dkim=pass (2048-bit key) header.d=aspeedtech.com header.i=@aspeedtech.com header.b=dA0zqsDo; arc=fail smtp.client-ip=40.107.255.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aspeedtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aspeedtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C5RRDKWTeN49wxEvPf5dj7lUKMrDh3gUX865K+5tqzCEOup7TH2AyJn7vDwsWNH2hOlVzI4mxaJRs8UmHsQwmo4vhW4X5s6dCwazMwPEOAONk/YwcTabKswsR0fBRXSrZmND4Rmgg3mh3+PHKv12gacqygjBYneIBuH5ya/vJTIhvBxIURc3jFbtylXgiTEaj6m4hvSnPEuuB7j+xTeav/T4991pRlLxSRlBLtDdW/U3m/tghKnN0UmW/6HHXAhxQOWqgWD4dBEqREYnqaJpD13M3C4MWMsPSbXuha/UGnsiwS2KDgDIoltMOII54Be+fwnUfQFpVCNs7J1MaBkQ0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GBjZ3WfTy9fqb9T/s18YcwBLhPf9WEbbhK/BkrgBpSo=;
 b=MT3C+8VRmx587KQtIhEuTrVVBAZWrAuYMEnaxHXW1OM5l14oZ6SqlSIavTGshn+/CxmpfeNrFjQxHSBwBR7qCrn6qTek3DSjEgRNvNsgIIfiO7gfs3I+UP0ArlTwe2Mx0KYGmvvYMMYEHtUalwXSTy3jvY1DI5/KYYjVvSMbQcDUDGHC75/2kQa5gUc1kuPfkJpwN2QybbwIC3sd6sYUGQF1lL9fnHeGQxMbRZ1zMhpkJkocxmCFXOFOg/C7UptTgnQiBNU1dDNlyo3ROEJ/0b5orvaT+K2woilckTr1v26Udat7RqUe1FlcGN4PLoSj3qJ3u4YCiXttO8okBYRgcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GBjZ3WfTy9fqb9T/s18YcwBLhPf9WEbbhK/BkrgBpSo=;
 b=dA0zqsDocLVy45lgIogA9LWlfOdfsLYaYTBKBzx7HlpR7xLkOfcVnfW91kQYnz11XHTy0w81/lG+18x1apP3739nWwrQFBXKIMQslkHK/VJ51Zg8n1x6dS70/oFYHJ/q/XVMiSEcVcoVZlpDGmXlxCWxAJb3glFR4uRoHUxcUogjAk5yPKy+u9EsvwKf8sLEgiUYaC109iLNQXJ91L3fHmiEk9yxcuGJm7uTTegTxUwARsT03E8Pt38R+wDJkntWqkPph7Ns1mrM4jSlgiLTL/dUMLaw4CHAnJ4/312ZX6WID+6o7gT0rSjVCHJ7zerQVU184FuxhTFQs4upOKuMUw==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by JH0PR06MB7235.apcprd06.prod.outlook.com (2603:1096:990:97::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Fri, 20 Sep
 2024 09:19:08 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%3]) with mapi id 15.20.7982.018; Fri, 20 Sep 2024
 09:19:08 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"joel@jms.id.au" <joel@jms.id.au>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-aspeed@lists.ozlabs.org"
	<linux-aspeed@lists.ozlabs.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>,
	"Peter.Yin@quantatw.com" <Peter.Yin@quantatw.com>, "Jay_Zhang@wiwynn.com"
	<Jay_Zhang@wiwynn.com>
Subject: Re: [PATCH v4 3/6] gpio: aspeed: Create llops to handle hardware
 access
Thread-Topic: [PATCH v4 3/6] gpio: aspeed: Create llops to handle hardware
 access
Thread-Index: AQHbCnhtD5uArDhUb0WlW3pTFKO6W7Jf/HsAgABklZs=
Date: Fri, 20 Sep 2024 09:19:08 +0000
Message-ID:
 <OSQPR06MB7252FDD739DCE7D4A44F63248B6C2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240919094339.2407641-1-billy_tsai@aspeedtech.com>
	 <20240919094339.2407641-4-billy_tsai@aspeedtech.com>
 <7aaed8cf171b67300aa5b7e861628278de948a27.camel@codeconstruct.com.au>
In-Reply-To:
 <7aaed8cf171b67300aa5b7e861628278de948a27.camel@codeconstruct.com.au>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|JH0PR06MB7235:EE_
x-ms-office365-filtering-correlation-id: 1cc6005b-1b07-4ade-fd87-08dcd95547fb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|7416014|921020|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?X/nUhugXxGteM0a7Vm8RPiZK1kCAgGj5RLyWWwpMPwb95T7fDxgrAsd74h?=
 =?iso-8859-1?Q?EE9VkcA8ciaGTnJB0WyT4+B+AiFGjCKy1Fwb+ncZmf9Lzix0pU/qY4+a9b?=
 =?iso-8859-1?Q?pUria4auS3zcUFyJ1K9VlUZbMgtu3p9Ap3mUinj94H6N9Rdi7BxbI1zbkD?=
 =?iso-8859-1?Q?Y/sGBBZ/Q4a2KnXdQxwFdSjUK8IGw9ilmMwDeH6r7wT2QOtUGhJK97BQsN?=
 =?iso-8859-1?Q?ZidXJkWoYu6u3MukNss3bHiteX+XKN/WE1kT57xwUWXVIaDBxFeWldkBPl?=
 =?iso-8859-1?Q?ngQ2b8XWlckAEe1nql1VmyZCPBAtBFvruBaoUXwruXEbCUwv97hshrUmbO?=
 =?iso-8859-1?Q?Um5njEwwWnNdjoaqwnPUs5LUOT6e/a1PhQeySA4LdPZxO/OtL3qylJj6TW?=
 =?iso-8859-1?Q?Eog5HaAHV+3TFMp7jcsdNRAzdo1qzz5jTASLiu1U6U+LsVHaTNr6mmJlyi?=
 =?iso-8859-1?Q?IH4fW5aQmng8OJZWfLocFByh9N8Nyh+rH5YGALfhjLEpKY6EDLee92n0QY?=
 =?iso-8859-1?Q?9fYMAZLRAuevHDoB540RXfbfJz1MViste6wcUe5LcITRpDafso8SCHxBWm?=
 =?iso-8859-1?Q?M2eCqSICRvS/qAqgs/NVEt5eBuby16hZFBGe+qnBuWpwhXFH7Tv+LwtKpF?=
 =?iso-8859-1?Q?udReL5WPt8C+ye8WsKi1ZxdgOJvXOOl2g+KOgdZEvrR8zgOzx5HT7Ux94V?=
 =?iso-8859-1?Q?Y7IjMXGC7ucUx9C2dpF5bSxWvUB3bwCznsASrEnOr7vB9xEDuEgCcBxBjA?=
 =?iso-8859-1?Q?jth0dL32rw0iLlR2NGBCs1YPy7fQ3SDqS2VL+tRvSM0vu9U42CG9Pe5Y+u?=
 =?iso-8859-1?Q?N/P1R8McBw3Kv7h1gIChPK45mkHQHPEaxmKYUsmoOvkWJWlD8ujs+B67a6?=
 =?iso-8859-1?Q?WO5N0DeV91JHz8OOxgAigerjnJJEoQI3rMCFD67FGToCuzyiZZj5UXMqMZ?=
 =?iso-8859-1?Q?972V5NOhA8S6cTXK2jz97c8letnWMZeq65QLgmmgjDIL6xIe5Q78ShmBC/?=
 =?iso-8859-1?Q?hZveg4yFApL4jaMQu7B9lfyPBtoZmof5ZuPpxYySPNIgy2xRw6IzS6m6Av?=
 =?iso-8859-1?Q?hTPGuchu5flKfPONludiDC3YWeq+lGc2ixQVDeO8pC9DPZeAL96Kwes0mu?=
 =?iso-8859-1?Q?CDLe73tcWligjPLKOEcZs2tMri/1IFrQFg/MkCWR97EEvKEa+q6BKexFFE?=
 =?iso-8859-1?Q?Y/MjVPCr6CHxpl0Tps7B3I1xl6s1LTuR7HrEefoBzARs9KG24NNVhFKsM0?=
 =?iso-8859-1?Q?WgusWfNwu7h1nI7FQGx2h8CUWyA3h0WRLc2PWG/C8KDfyDCo4YTp1gulzP?=
 =?iso-8859-1?Q?E4ufKAAqWv655kg9s3SbpA2b3sobZMOoHDKEnDfWW8/KVuQFiAQGCJJRAn?=
 =?iso-8859-1?Q?EIQtV8EsKziK7GdsIt0ojitFBNRKexj4w3ov0g1C6axWW3IVEOm9LL4f1t?=
 =?iso-8859-1?Q?r3FtjAlepzpSLHZLejztDEIsWGUBxiigSzsbt8ofrCbH6QGQV1ZyxEEaGY?=
 =?iso-8859-1?Q?4=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7416014)(921020)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?9mZp3HquXGwB1W2KEbZIne/BsCqTnf8Zkx/jQ2xE2NAbAOuf1Yn3YtLPWz?=
 =?iso-8859-1?Q?dL6FXhLSKT7+dEoithF8t7bOlWK6sJTA4Wz5el7Gddk/eo5FrjqCGqGADz?=
 =?iso-8859-1?Q?uXGgIUe7OBt5eVMXbDv7Dv7JgzRM8qc/8jUG18XPC5+BUMXXlWNZpaELZ+?=
 =?iso-8859-1?Q?tnh1UKcrb4vfBaaGzABBd/36Pe97DC6fbPIFibufxhI+Dy69WgVOA2wuyr?=
 =?iso-8859-1?Q?JmgFRbIYoAgIYaYmDXnibNqz0Ptfp/PjNRl3AZV9RQswixfbiHDNB8ay7S?=
 =?iso-8859-1?Q?8bThycgH8GZFKjehz8JYfrxJ8v3KbTAgptupCyEX0rB+w0QFgcVXM8TNXp?=
 =?iso-8859-1?Q?Vh33XAF0grKgJm0kSHLCalSfShaKLQHSXqHHJmAu9eErBFnxpck+qaO3u+?=
 =?iso-8859-1?Q?eKBhIzygPQRTW31bzaiOltoCl3h5Qr+PdY5yIr3yKuiM/vjp9UlH1h31wA?=
 =?iso-8859-1?Q?jVumZUfCdEfnYWGElMklV89BrfU2Yp3yc+2Ai+GsuJTnpYr/xNFJkkXe/M?=
 =?iso-8859-1?Q?aWq/fwV6RmofuGemKNrJZjsvabfZ6D7+17lwo4qwOH+C1MZaNSO0dfJmET?=
 =?iso-8859-1?Q?Tti2N4pQ1UCxx7MGXaT+k/i2SjolPNK3D5jiNu6gAS2aYakMSRpPv/njnq?=
 =?iso-8859-1?Q?ICNYcm7zb865IMpAZWW/wf8P6YkP5xhugtKYC+3NavCaFGNlxnhOZkKhQt?=
 =?iso-8859-1?Q?AhE2kf6ZsRUJ9o3HwHdR4b28lAVBfe9hdNX+hqqrB+y2qJwCY0Cbe4nnYo?=
 =?iso-8859-1?Q?ufnjnsQak91oEyZ6bEOUVRLW6yQMsvml3EXIjyYQebIi7iTThbeLifmbNn?=
 =?iso-8859-1?Q?wF1IYEUCkQdnRR+8GtDBSHzstu7u/zk+jgufibwHFga0g1Yr1hTtPBsrRd?=
 =?iso-8859-1?Q?gqY+Ban8/96+h4dwiFU3w0Cp/nwMwtu5QbqQofyIjti2eBU6ifVICLL1/5?=
 =?iso-8859-1?Q?Y5zt1Nd2cH4q6Y8F+Av/478VQHIIKKA3mbfttddsMoK9QFX9mnxxl4Pjw2?=
 =?iso-8859-1?Q?c2JLHbgpG2mOkiOUX2iLLJCMW/QYvCMsnHNa+CZmZNl7HDKtl06B6JETPv?=
 =?iso-8859-1?Q?TkmAoQ53zU2O/RboqdMDbyo9b6Onbh0QPu1oune9AnfRVBSgn8h+nXst/u?=
 =?iso-8859-1?Q?ZUd+4sn8vOpp9naB8H0DvhEEwHsAVZnZ5mlMD5n8cnPdB+Q1mhnNFTbzxi?=
 =?iso-8859-1?Q?kK7Bp1H07wAEUME6AuVv+joniXNQ3lxvaRrBOKnCpErP6c4GeCUKC41xsI?=
 =?iso-8859-1?Q?8lEOtXOUz2IQ1QKn61cyAnJRjW0vbo3xLZ6smAvH2GewkjFugPiltkUhtw?=
 =?iso-8859-1?Q?lkk7nY1kGE/BUNi4hJTj6dCwCJl7GeD3OQ3bQgfCDyRHUcOU5C2yeVx7/L?=
 =?iso-8859-1?Q?UBYqRtpbu8mfZ2uEKcMZr+zPm6jt1Smd5e7CPgr7+QameH0OtGrEfkObgV?=
 =?iso-8859-1?Q?FWtspysGj94RMcpb0Rv0r1B3Ns6JndM7fGKbCToW3EaGOOz0k997u9CNKw?=
 =?iso-8859-1?Q?k/RP599wSIffZ0JTXeWrNmtr/Hcyo0BdAPmCa6XFox9WM7FllsmYdrt8EL?=
 =?iso-8859-1?Q?es6u74vpzhMQkEY6r5eSgCG634QtqaJbDKOKkVCI6lIYPTQ9gj+7faPDjO?=
 =?iso-8859-1?Q?OCq/lSRsBefAWIF8JODb3fJ9skXHGN3X53?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cc6005b-1b07-4ade-fd87-08dcd95547fb
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Sep 2024 09:19:08.2776
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ITZ7viNFqDjvjxgg6I8autqATC1qjxD1Z9FJ7ynM8Jo2Od1BdekeEGzn1G+rA6G794sd6X5Y+NIelNvZkHCoFI4sGigEOX1O7O+dQ8PmL3Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7235

> > Add low-level operations (llops) to abstract the register access for GP=
IO=0A=
> > registers and the coprocessor request/release. With this abstraction=0A=
> > layer, the driver can separate the hardware and software logic, making =
it=0A=
> > easier to extend the driver to support different hardware register=0A=
> > layouts.=0A=
> >=0A=
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>=0A=
> > ---=0A=
> >  drivers/gpio/gpio-aspeed.c | 429 +++++++++++++++++++------------------=
=0A=
> >  1 file changed, 220 insertions(+), 209 deletions(-)=0A=
> >=0A=
> > diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c=0A=
> > index d20e15b2079d..8b334ce7b60a 100644=0A=
> > --- a/drivers/gpio/gpio-aspeed.c=0A=
> > +++ b/drivers/gpio/gpio-aspeed.c=0A=
> > @@ -39,6 +39,10 @@ struct aspeed_bank_props {=0A=
> >  struct aspeed_gpio_config {=0A=
> >       unsigned int nr_gpios;=0A=
> >       const struct aspeed_bank_props *props;=0A=
> > +     const struct aspeed_gpio_llops *llops;=0A=
> > +     const int *debounce_timers_array;=0A=
> > +     int debounce_timers_num;=0A=
> > +     bool dcache_require;=0A=
=0A=
> Bit of a nitpick, but if we must have it I'd prefer we call this=0A=
> `require_dcache`.=0A=
=0A=
Okay.=0A=
=0A=
> >=0A=
> > +static void aspeed_g4_reg_bit_set(struct aspeed_gpio *gpio, unsigned i=
nt offset,=0A=
> > +                               const enum aspeed_gpio_reg reg, bool va=
l)=0A=
> > +{=0A=
> > +     const struct aspeed_gpio_bank *bank =3D to_bank(offset);=0A=
> > +     void __iomem *addr =3D bank_reg(gpio, bank, reg);=0A=
> > +     u32 temp;=0A=
> > +=0A=
> > +     if (reg =3D=3D reg_val && gpio->config->dcache_require)=0A=
=0A=
> We know gpio->config->dcache_require will be true, because this is the=0A=
> g4 handler, right?=0A=
=0A=
Yes. I will remove this unnecessary check.=0A=
=0A=
> > +             temp =3D gpio->dcache[GPIO_BANK(offset)];=0A=
> > +     else=0A=
> > +             temp =3D ioread32(addr);=0A=
> > +=0A=
> > +     if (val)=0A=
> > +             temp |=3D GPIO_BIT(offset);=0A=
> > +     else=0A=
> > +             temp &=3D ~GPIO_BIT(offset);=0A=
> > +=0A=
> > +     if (reg =3D=3D reg_val && gpio->config->dcache_require)=0A=
> > +             gpio->dcache[GPIO_BANK(offset)] =3D temp;=0A=
> > +     iowrite32(temp, addr);=0A=
> > +}=0A=
> > +=0A=
> > +static u32 aspeed_g4_reg_bits_get(struct aspeed_gpio *gpio, unsigned i=
nt offset,=0A=
> > +                               const enum aspeed_gpio_reg reg)=0A=
> > +{=0A=
> > +     const struct aspeed_gpio_bank *bank =3D to_bank(offset);=0A=
> > +     void __iomem *addr =3D bank_reg(gpio, bank, reg);=0A=
> > +=0A=
> > +     if (reg =3D=3D reg_rdata || reg =3D=3D reg_irq_status)=0A=
> > +             return ioread32(addr);=0A=
> > +     return !!(ioread32(addr) & GPIO_BIT(offset));=0A=
=0A=
> Okay, the semantics here feel a bit concerning. I think we need one=0A=
> behaviour or the other, not both.=0A=
=0A=
> Perhaps we have two callbacks:=0A=
=0A=
> 1. get_bit()=0A=
> 2. get_bank()=0A=
=0A=
> where get_bank() is only defined for reg_rdata and reg_irq_status, and=0A=
> get_bit() for all registers.=0A=
=0A=
Okay, I will add get_bank() callback for this.=0A=
=0A=
> > +}=0A=
> > +=0A=
> > +static bool aspeed_g4_copro_request(struct aspeed_gpio *gpio, unsigned=
 int offset)=0A=
> > +{=0A=
> > +     if (!copro_ops || !gpio->cf_copro_bankmap)=0A=
> > +             return false;=0A=
> > +     if (!gpio->cf_copro_bankmap[offset >> 3])=0A=
> > +             return false;=0A=
> > +     if (!copro_ops->request_access)=0A=
> > +             return false;=0A=
> > +=0A=
> > +     /* Pause the coprocessor */=0A=
> > +     copro_ops->request_access(copro_data);=0A=
> > +=0A=
> > +     /* Change command source back to ARM */=0A=
> > +     aspeed_gpio_change_cmd_source(gpio, offset, GPIO_CMDSRC_ARM);=0A=
=0A=
> I don't think we need the indirection here, this is already a g4-=0A=
> specific callback implementation, we can directly call=0A=
> aspeed_g4_privilege_ctrl().=0A=
=0A=
Okay, I will replace them to aspeed_g4_privilege_ctrl.=0A=
=0A=
> > +=0A=
> > +     if (gpio->config->dcache_require)=0A=
> > +             /* Update cache */=0A=
> > +             gpio->dcache[GPIO_BANK(offset)] =3D=0A=
> > +                     gpio->config->llops->reg_bits_get(gpio, offset, r=
eg_rdata);=0A=
> > +=0A=
> > +     return true;=0A=
> > +}=0A=
> > +=0A=
> > +static void aspeed_g4_copro_release(struct aspeed_gpio *gpio, unsigned=
 int offset)=0A=
> > +{=0A=
> > +     if (!copro_ops || !gpio->cf_copro_bankmap)=0A=
> > +             return;=0A=
> > +     if (!gpio->cf_copro_bankmap[offset >> 3])=0A=
> > +             return;=0A=
> > +     if (!copro_ops->release_access)=0A=
> > +             return;=0A=
> > +=0A=
> > +     /* Change command source back to ColdFire */=0A=
> > +     aspeed_gpio_change_cmd_source(gpio, offset, GPIO_CMDSRC_COLDFIRE)=
;=0A=
=0A=
> As above for the request implementation, we can call=0A=
> aspeed_g4_privilege_ctrl() directly here.=0A=
=0A=
Okay.=0A=
=0A=
> > +=0A=
> > +     /* Restart the coprocessor */=0A=
> > +     copro_ops->release_access(copro_data);=0A=
> > +}=0A=
> > +=0A=
> > +static void aspeed_g4_privilege_ctrl(struct aspeed_gpio *gpio, unsigne=
d int offset, int cmdsrc)=0A=
> > +{=0A=
> > +     /*=0A=
> > +      * The command source register is only valid in bits 0, 8, 16, an=
d 24, so we use=0A=
> > +      * (offset & ~(0x7)) to ensure that reg_bits_set always targets a=
 valid bit.=0A=
> > +      */=0A=
> > +     /* Source 1 first to avoid illegal 11 combination */=0A=
> > +     gpio->config->llops->reg_bit_set(gpio, offset & ~(0x7), reg_cmdsr=
c1, !!(cmdsrc & BIT(1)));=0A=
> > +     /* Then Source 0 */=0A=
> > +     gpio->config->llops->reg_bit_set(gpio, offset & ~(0x7), reg_cmdsr=
c0, !!(cmdsrc & BIT(0)));=0A=
=0A=
> Both of these can be direct calls to aspeed_g4_reg_bit_set().=0A=
=0A=
Okay=0A=
=0A=
> > +}=0A=
> > +=0A=
> > +static void aspeed_g4_privilege_init(struct aspeed_gpio *gpio)=0A=
> > +{=0A=
> > +     u32 i;=0A=
> > +=0A=
> > +     /* Switch all command sources to the ARM by default */=0A=
> > +     for (i =3D 0; i < DIV_ROUND_UP(gpio->chip.ngpio, 32); i++) {=0A=
> > +             aspeed_gpio_change_cmd_source(gpio, (i << 5) + 0, GPIO_CM=
DSRC_ARM);=0A=
> > +             aspeed_gpio_change_cmd_source(gpio, (i << 5) + 8, GPIO_CM=
DSRC_ARM);=0A=
> > +             aspeed_gpio_change_cmd_source(gpio, (i << 5) + 16, GPIO_C=
MDSRC_ARM);=0A=
> > +             aspeed_gpio_change_cmd_source(gpio, (i << 5) + 24, GPIO_C=
MDSRC_ARM);=0A=
=0A=
> Again as this is a g4-specific callback we can directly call=0A=
> aspeed_g4_privilege_ctrl().=0A=
=0A=
Okay.=0A=
=0A=
> > +     }=0A=
> > +}=0A=
> > +=0A=
> > +static const struct aspeed_gpio_llops aspeed_g4_llops =3D {=0A=
> > +     .copro_request =3D aspeed_g4_copro_request,=0A=
> > +     .copro_release =3D aspeed_g4_copro_release,=0A=
> > +     .reg_bit_set =3D aspeed_g4_reg_bit_set,=0A=
> > +     .reg_bits_get =3D aspeed_g4_reg_bits_get,=0A=
> > +     .privilege_ctrl =3D aspeed_g4_privilege_ctrl,=0A=
> > +     .privilege_init =3D aspeed_g4_privilege_init,=0A=
> > +};=0A=
> >  /*=0A=
> >   * Any banks not specified in a struct aspeed_bank_props array are ass=
umed to=0A=
> >   * have the properties:=0A=
> > @@ -1120,7 +1111,14 @@ static const struct aspeed_bank_props ast2400_ba=
nk_props[] =3D {=0A=
> >=0A=
> >  static const struct aspeed_gpio_config ast2400_config =3D=0A=
> >       /* 220 for simplicity, really 216 with two 4-GPIO holes, four at =
end */=0A=
> > -     { .nr_gpios =3D 220, .props =3D ast2400_bank_props, };=0A=
> > +     {=0A=
> > +             .nr_gpios =3D 220,=0A=
> > +             .props =3D ast2400_bank_props,=0A=
> > +             .llops =3D &aspeed_g4_llops,=0A=
> > +             .debounce_timers_array =3D debounce_timers,=0A=
> > +             .debounce_timers_num =3D ARRAY_SIZE(debounce_timers),=0A=
> > +             .dcache_require =3D true,=0A=
> > +     };=0A=
> >=0A=
> >  static const struct aspeed_bank_props ast2500_bank_props[] =3D {=0A=
> >       /*     input      output   */=0A=
> > @@ -1132,7 +1130,14 @@ static const struct aspeed_bank_props ast2500_ba=
nk_props[] =3D {=0A=
> >=0A=
> >  static const struct aspeed_gpio_config ast2500_config =3D=0A=
> >       /* 232 for simplicity, actual number is 228 (4-GPIO hole in GPIOA=
B) */=0A=
> > -     { .nr_gpios =3D 232, .props =3D ast2500_bank_props, };=0A=
> > +     {=0A=
> > +             .nr_gpios =3D 232,=0A=
> > +             .props =3D ast2500_bank_props,=0A=
> > +             .llops =3D &aspeed_g4_llops,=0A=
> > +             .debounce_timers_array =3D debounce_timers,=0A=
> > +             .debounce_timers_num =3D ARRAY_SIZE(debounce_timers),=0A=
> > +             .dcache_require =3D true,=0A=
> > +     };=0A=
> >=0A=
> >  static const struct aspeed_bank_props ast2600_bank_props[] =3D {=0A=
> >       /*     input      output   */=0A=
> > @@ -1148,7 +1153,14 @@ static const struct aspeed_gpio_config ast2600_c=
onfig =3D=0A=
> >        * We expect ngpio being set in the device tree and this is a fal=
lback=0A=
> >        * option.=0A=
> >        */=0A=
> > -     { .nr_gpios =3D 208, .props =3D ast2600_bank_props, };=0A=
> > +     {=0A=
> > +             .nr_gpios =3D 208,=0A=
> > +             .props =3D ast2600_bank_props,=0A=
> > +             .llops =3D &aspeed_g4_llops,=0A=
> > +             .debounce_timers_array =3D debounce_timers,=0A=
> > +             .debounce_timers_num =3D ARRAY_SIZE(debounce_timers),=0A=
> > +             .dcache_require =3D true,=0A=
> > +     };=0A=
> >=0A=
> >  static const struct of_device_id aspeed_gpio_of_table[] =3D {=0A=
> >       { .compatible =3D "aspeed,ast2400-gpio", .data =3D &ast2400_confi=
g, },=0A=
> > @@ -1191,6 +1203,9 @@ static int __init aspeed_gpio_probe(struct platfo=
rm_device *pdev)=0A=
> >=0A=
> >       gpio->config =3D gpio_id->data;=0A=
> >=0A=
> > +     if (!gpio->config->llops->reg_bit_set || !gpio->config->llops->re=
g_bits_get)=0A=
> > +             return -EINVAL;=0A=
> > +=0A=
=0A=
> This will need to clean up gpio->clk. Perhaps you could move it above=0A=
> the of_clk_get() call instead?=0A=
=0A=
How about change the `of_clk_get` to `devm_clk_get(&pdev->dev, 0);`?=0A=
=0A=
> However, looking through the rest it seems we have a few issues with=0A=
> this leak :/=0A=
=0A=
This gpio driver doesn't have the reset, is it?=0A=
=0A=
>       gpio->chip.parent =3D &pdev->dev;=0A=
>       err =3D of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);=
=0A=
>       gpio->chip.ngpio =3D (u16) ngpio;=0A=
> @@ -1207,27 +1222,23 @@ static int __init aspeed_gpio_probe(struct platfo=
rm_device *pdev)=0A=
>       gpio->chip.label =3D dev_name(&pdev->dev);=0A=
>       gpio->chip.base =3D -1;=0A=
>=0A=
> -     /* Allocate a cache of the output registers */=0A=
> -     banks =3D DIV_ROUND_UP(gpio->chip.ngpio, 32);=0A=
> -     gpio->dcache =3D devm_kcalloc(&pdev->dev,=0A=
> -                                 banks, sizeof(u32), GFP_KERNEL);=0A=
> -     if (!gpio->dcache)=0A=
> -             return -ENOMEM;=0A=
> -=0A=
> -     /*=0A=
> -      * Populate it with initial values read from the HW and switch=0A=
> -      * all command sources to the ARM by default=0A=
> -      */=0A=
> -     for (i =3D 0; i < banks; i++) {=0A=
> -             const struct aspeed_gpio_bank *bank =3D &aspeed_gpio_banks[=
i];=0A=
> -             void __iomem *addr =3D bank_reg(gpio, bank, reg_rdata);=0A=
> -             gpio->dcache[i] =3D ioread32(addr);=0A=
> -             aspeed_gpio_change_cmd_source(gpio, bank, 0, GPIO_CMDSRC_AR=
M);=0A=
> -             aspeed_gpio_change_cmd_source(gpio, bank, 1, GPIO_CMDSRC_AR=
M);=0A=
> -             aspeed_gpio_change_cmd_source(gpio, bank, 2, GPIO_CMDSRC_AR=
M);=0A=
> -             aspeed_gpio_change_cmd_source(gpio, bank, 3, GPIO_CMDSRC_AR=
M);=0A=
> +     if (gpio->config->dcache_require) {=0A=
> +             /* Allocate a cache of the output registers */=0A=
> +             banks =3D DIV_ROUND_UP(gpio->chip.ngpio, 32);=0A=
> +             gpio->dcache =3D devm_kcalloc(&pdev->dev, banks, sizeof(u32=
), GFP_KERNEL);=0A=
> +             if (!gpio->dcache)=0A=
> +                     return -ENOMEM;=0A=
=0A=
> This should also clean up gpio->clk. I don't think you can move it to=0A=
> avoid that.=0A=
=0A=
I think using devm_clk_get() will also solve this problem.=0A=
=0A=
Billy Tsai=0A=
=0A=
> +             /*=0A=
> +              * Populate it with initial values read from the HW=0A=
> +              */=0A=
> +             for (i =3D 0; i < banks; i++)=0A=
> +                     gpio->dcache[i] =3D=0A=
> +                             gpio->config->llops->reg_bits_get(gpio, (i =
<< 5), reg_rdata);=0A=
>       }=0A=
>=0A=
> +     if (gpio->config->llops->privilege_init)=0A=
> +             gpio->config->llops->privilege_init(gpio);=0A=
> +=0A=
>       /* Set up an irqchip */=0A=
>       irq =3D platform_get_irq(pdev, 0);=0A=
>       if (irq < 0)=

