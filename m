Return-Path: <linux-gpio+bounces-11743-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BFE9A9BB2
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 09:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593D81F2292F
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 07:59:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46E61155726;
	Tue, 22 Oct 2024 07:59:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2119.outbound.protection.outlook.com [40.107.239.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F37C1714BA;
	Tue, 22 Oct 2024 07:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.119
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729583940; cv=fail; b=NJE8stHZAG4vbRx+WL87x7bYekMNsezblXilaki2gJ4FO1NVW5arsJPzBTCJJQE91RJTDI54RBtOcWDmVaibc0ITklONI1Z51uist9/95LQjTkWYzw3QBlatUrSeOEcrDLsWwHvF1K97nNVOPwDLYu9Kr7qOGpdmHYyATgPoZSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729583940; c=relaxed/simple;
	bh=JlwbKG5I1YLlb81LZHjJUf73z+/yPsRDd1Ma5HEPpZA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=e2fFFxDKC51NmFn0DLbW6B49sMo19yhWXlwOvFgoyuxbOu2IazaUg6XFXihnCOpChVSy16kRNbJXTrOqfwXQdEMTN56AVW1XNBkkyri18d5fE+Akpg/guXMKZU6Gav3/ROomEHPcLa0gLbvzqh1PbYS3ldVmGCyR1eB+IMfjTWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OHbIkli6ZnEguo5N9H86caFvodG8jiyDR88YUuSMLSvm8uf3Cg7N/Mdc5kjraMrWNyf3eINJx0/JYxbXySvgfgrz0KPdE2xN4bd9V1RYrUbMiRXRtUztRwuRDCuevZrnxMcz4DzmbWr0JNFLOZamF65yjdfQuLKRJjCilSkdlWYY0ZJVRHJL+AXnHA4ccu2g8fJHF08F2KAf/2mHt5P38iqx1QnPgRGj3hCOd+pHg9sg3UxxL+RdEq7y2Gh/hdwu19c7WoJkOvGjTyGNyYnW1SqiqRO0Ru5v7YUrnOUGBTOhFy5cAJj3Bcw9UP1iVXJkPP+IdbMI/towsx10PDHq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hIKgInFdR1vf5TlUDKk1CaPmCJMxS1cPUskQdwlaJRM=;
 b=F9qEhxkShMpnWA6BcFJex4I82BMzNKnTtFYQ3wZZUFl/6cyenv/dvQbaQW8ML0HxY89Nq6Guk+T3dRnxTJhz6WUoOL5yQ9KhqlBQCo76VUgj5M6ByOROpTdCQDbYb4FeN1Fst5jdKmbstce+Ju1dZ4XaqFLwXyx6IpS/ogbCKYKPX9NojXWw/Thd16GRLoiKyY8g5vcv+bYfeH+VdCDctSVXgoYWrlOi8DjEcZtj8KycFiqs3mjgAAO/xGo+fsZITa9AlJ2PVhKIpjIrmKKyWSxvBZH/G87Ody44PaXp7VVzyo6uV2+KUKQp5aW70Q9e3zmX/eguXe691oUMSGEIcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN3PPF85DF810EA.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::bd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Tue, 22 Oct
 2024 07:58:52 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 07:58:52 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "robh@kernel.org" <robh@kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Thread-Topic: [PATCH] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Thread-Index: AQHbJEf0KUynUcmP0kuLM4i3mQYwMrKSX00AgAAHU64=
Date: Tue, 22 Oct 2024 07:58:52 +0000
Message-ID:
 <PN0P287MB2019B059042FCFEADB7A8A619A4C2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20241022060157.36372-1-himanshu.bhavani@siliconsignals.io>
 <e766b50c-818c-421a-a71d-e2529b56bd24@kernel.org>
In-Reply-To: <e766b50c-818c-421a-a71d-e2529b56bd24@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN3PPF85DF810EA:EE_
x-ms-office365-filtering-correlation-id: a8e4cbbe-616f-4811-00af-08dcf26f5edd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?pv0e7S9G/eHm3WnuYJxdsrYOxxkMMdIHP+/uZV6Z53XIAA5V1fztfsk+SB?=
 =?iso-8859-1?Q?F6F9NtO5VWj/gG2kT4irhgPh9QTJoUN5ZswncVbY24LkR6/d244P0HuBi1?=
 =?iso-8859-1?Q?++OEpS7148FklWtBEF56vsC7dQhwwG/lqR/zc61HS3b9rlTqf4XfTPrsMW?=
 =?iso-8859-1?Q?ScWxHwyHtARYdVT1a2XVodZ1KwMzXalMWcsoOQVo3ms+DO/3elPUlYWjoN?=
 =?iso-8859-1?Q?weQI3K41aBxqTc4YD0an+dAHaj1BbhUzy+j9CF4YZ/UwSIylDQXFG4EH1B?=
 =?iso-8859-1?Q?3j7CkY0gOfbk03rcH8wLmNMX0nIhWsmTM9dXJRsZoCAdQaDGgZB/lujind?=
 =?iso-8859-1?Q?IoLTJPwnffN4OYfBALKenDoRqsBBTW+o7XApKFs7JdwYwVwtEty4zuomhU?=
 =?iso-8859-1?Q?jncuzmCo+2rjKlvGyXyZayNUierJXmv1eyYMxEaVBA5Qd9PLJ6kOkWCVWt?=
 =?iso-8859-1?Q?PyYtmZner+qfFAn//XX3iwA9V78ifpyawdkgOR3p5fNqhVYQisoMgwC7nX?=
 =?iso-8859-1?Q?YffshUblLXxYhsfJbHiW9203DAIVLpXydUsRut7Wa18bhTfJQUjl9Ji7aI?=
 =?iso-8859-1?Q?wRccKZKCWPOC8ysCFjpZcBku34+o8vkOPWOg20GRbKN8uf/oxoa0Y9pjbi?=
 =?iso-8859-1?Q?W0IEvj4Dw8zr7lXTrRqz23LpjoP8t+USHCTi6D1ctkoUq31m+QKUe9X/Ay?=
 =?iso-8859-1?Q?w+WM6bncG69qBFontKecr/rojsY+UOgKMx8gAwueik3R/BgQCx8ohC5PYL?=
 =?iso-8859-1?Q?MqdODU8CYxgn5ojtSoZuYQYP3DTwBortst/eSq7IKi7NoV+Z7JQr2wxOl7?=
 =?iso-8859-1?Q?TGuw7Kknklg6DnloHGBJQ0GFAx1oasBfdGJExq2dbJyO6h/x9Cz426p0Ux?=
 =?iso-8859-1?Q?3LYxw56uEG8tJwSs8OGRotrAzqA4Wx3Wn6zDHY6MrxPLgLlO5aWx47vQY5?=
 =?iso-8859-1?Q?eh5yNDc0jCpSxYF+ceFr2gAJl5rTUeNKqRGDe9+QvIlEXeZoQU0tvFuE1p?=
 =?iso-8859-1?Q?MCgHOL0rn0kymnMk8U7aTqM4hmBJbKT471tFUx2cKfNhuPHetfkpc1CV5T?=
 =?iso-8859-1?Q?tfVOrLqHDqd5a51Sx6b1PTWchUGrQG1Ro68yeQEJF8JNOvJnG57sEIf1/x?=
 =?iso-8859-1?Q?6qSNdzpUr3RvKWXgEJPvDyQ5wIOnNH6Srx9VFdZmMH3BjWBKUM5dfFpCmT?=
 =?iso-8859-1?Q?axgKozDQQfGFMfbtxXmMXaasYlImsrONnc0XrGbES7jHbx07KwHIC1XgpA?=
 =?iso-8859-1?Q?igTXVdYhfM2bHp/Xe08vfPg5rsBHr/g+RjQFzX4TX4gHUTw6R2li0izVUB?=
 =?iso-8859-1?Q?ZxqgdtagJZwI1av8EXJj/TYe91+gRJzb9UjhpBOkD2prQDaTe15viYluwe?=
 =?iso-8859-1?Q?TEp+tcr1UG/ki79RvhIMIlOOKmpia5wfMBQUKwE9EZhPwg6XZ4pc0=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ruMDADlM8Ee34CHNcwc6Rx6dy4qKeVSbQlDkklZB1/Dv08iRhCWMj/Kz0r?=
 =?iso-8859-1?Q?EoUhsy6Vh590mOM4E4oCHeB4BGVhVbrjDDTQY3hWErtQfHCBK0a3VII1CB?=
 =?iso-8859-1?Q?ByDDucx4YyWdz6iFM7TMS8EtyrRRiuFhgQfOHoeVNi14LQYDES0TcParjq?=
 =?iso-8859-1?Q?0XHSnyv3z7oH3mszuOZUw69aLW4iBpINUgwZ8NL2f7vApCkhJ6d99vhVDY?=
 =?iso-8859-1?Q?NwhNXc34g4yNlbMKUGEMoP0a+Zd3qq/YUJWfSZTsZLDCTPM38EUL+X5akG?=
 =?iso-8859-1?Q?iKImb4OG+TWigwNYdGdGg4Wpwsri3Ch2Q2Lcskgfb9M8mOkMNHM6u5j7j8?=
 =?iso-8859-1?Q?zWcMZF74P+T1+7tDdeDOKqF+ak00ixO0DpNhY8VIurqKHAFMRDngnHkCFa?=
 =?iso-8859-1?Q?NQJ90H8WxYn/5+ZWvZlaHn0Hh0jFMZ3hz2CwMxUdTijlMBkBIXvAiDE2vW?=
 =?iso-8859-1?Q?pz6N3z+qtGzPrWcvmJYCwQgEpPI+yuVhh2tL8Q24kOr75/5pBWVQ7xvOag?=
 =?iso-8859-1?Q?ZyDKWJEkID+5swQgBhXPjSaFemVGkQ51Ab3Q47mU4RXAKDpQsXnkrX7m8N?=
 =?iso-8859-1?Q?juxIs+VRB7ZfjGvIBpo8kcLp/oD2WHlr98cQV0m+RhkqmT4uw0hFCv3DOZ?=
 =?iso-8859-1?Q?w0Dm7Qm8xFRvdBaSpvCfES/wd+NKjn0wBDd8sH584w5C84T3Ev56fochLO?=
 =?iso-8859-1?Q?8GsDWYmfC/5cK/MT4Fq3LvQiaxgrm6izrQxNWCvscsY5W4q5jn5ywND8HD?=
 =?iso-8859-1?Q?9Fv5sRibWkT/GIZgkxwQZH/MfxIUm1sRYvwH0v75XjeKEhHR6/JoOVPxMq?=
 =?iso-8859-1?Q?kPmJVQtDAPwJH7eoi3s5Dy7I1F7ea4gVIskCugGOHRq4z4yua0ZDxs/S7A?=
 =?iso-8859-1?Q?NxCTLcMFHPJOA7WtvWaGJY3XCcaTaPu3kls8hRwo6L4fXIVJFJaXImDm3x?=
 =?iso-8859-1?Q?hzN2P4rCNmBduB2Q9pO2on7Q+lqKD1CVHaQKNjYhtaL8ugR3Ae5yIQvJEx?=
 =?iso-8859-1?Q?Fv69gsbnroclQy+a1azIzfAxjav5vuMoftRaNqBm3MkEPrlyW1TDgq6yR3?=
 =?iso-8859-1?Q?AKmWw/dysldfyXOrqFZauDYZWc7NV6k+k734kFzB9gXKVfpnZbbb4z3fN4?=
 =?iso-8859-1?Q?hPUa2mu5QHjiX3rq85jIRHEN4l/v9eMbE6Xe91TBp/fWbzGCYI/6bu7kI4?=
 =?iso-8859-1?Q?YNDiPOeu8iQATGOmQm1EacgauLRh8bvYGwzs4lxp0+AXdnSsRU4wPwTOF0?=
 =?iso-8859-1?Q?/Mg9ZgihKsqM4PzNIE/1Gj9ilIv2zmjrYpmLr8zOCuBivgxI0i1zTb57sI?=
 =?iso-8859-1?Q?siH5Xfj08uB4DGdggsthtr5s/WJOdRylHRTDYgxJ5zucD//Py33sjqqy4i?=
 =?iso-8859-1?Q?tXOcN5wXgmyoJ99nJm24uP8cZ29kYs6cKsD/Y3mmW2nRkO8Trc6Gji/7xW?=
 =?iso-8859-1?Q?WKD3gw0w6R0r+Q52sF9jMd+z9ekGmPsH2d0Hwyj8U+roGnVEGAp3cHgQpz?=
 =?iso-8859-1?Q?TCOxuYVb7f7Y/MkHre0mA2bIP4Kao83KAUW0HyVLwJxlg6Xz/OpWY3BKy5?=
 =?iso-8859-1?Q?RnAslfVewsselM1eEEUXwPpyVLuxZYY4HYb84FHpTTt3twwWR6+Loy7tj/?=
 =?iso-8859-1?Q?nMlwJl0Eo1RDVUc24+VWwBWUp0E7tpq1Bka3URCbE9WK779G3uB7ACxdCE?=
 =?iso-8859-1?Q?F45b8uGsOSioKSqpt3Y=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e4cbbe-616f-4811-00af-08dcf26f5edd
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 07:58:52.6359
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fn7Qcf1fkfU6tNbwDCNqAJI2e0AZe7JIEMSy5MGaoz1ThRzCNfbg+WclR/foGjL/lSwrhF5Vkf94XxuaLvrGIKbZoGZzdWyJQ//9JgfGsNn+E8f6inZqoQyKUOMJnMk1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF85DF810EA

Hi Krzysztof,=0A=
=0A=
>Hm? Left-over?=0A=
=0A=
>BTW, did you test this before sending?=0A=
=0A=
Yes, I have tested. Below are the logs for the reference.=0A=
But I guess I have to upgrade dtschema=0A=
=0A=
SCHEMA  Documentation/devicetree/bindings/processed-schema.json=0A=
/data/opensourcenxp/tarang/mainline_kernel/Documentation/devicetree/binding=
s/net/snps,dwmac.yaml: mac-mode: missing type definition=0A=
  CHKDT   ../Documentation/devicetree/bindings=0A=
  LINT    ../Documentation/devicetree/bindings=0A=
  DTEX    Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.exampl=
e.dts=0A=
  DTC [C] Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.exampl=
e.dtb=0A=
=0A=
Best Regards,=0A=
Himanshu=0A=
________________________________________=0A=
From:=A0Krzysztof Kozlowski <krzk@kernel.org>=0A=
Sent:=A022 October 2024 12:58=0A=
To:=A0Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>; linus.walleij@=
linaro.org <linus.walleij@linaro.org>; robh@kernel.org <robh@kernel.org>; k=
rzk+dt@kernel.org <krzk+dt@kernel.org>; conor+dt@kernel.org <conor+dt@kerne=
l.org>=0A=
Cc:=A0linux-gpio@vger.kernel.org <linux-gpio@vger.kernel.org>; devicetree@v=
ger.kernel.org <devicetree@vger.kernel.org>; linux-kernel@vger.kernel.org <=
linux-kernel@vger.kernel.org>=0A=
Subject:=A0Re: [PATCH] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt t=
o yaml format=0A=
=A0=0A=
CAUTION: This email originated from outside the organization. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.=0A=
=0A=
On 22/10/2024 08:01, Himanshu Bhavani wrote:=0A=
> +=0A=
> +examples:=0A=
> +=A0 - |=0A=
> +=A0=A0=A0 #include <dt-bindings/interrupt-controller/irq.h>=0A=
> +=A0=A0=A0 #include <dt-bindings/gpio/gpio.h>=0A=
> +=0A=
> +=A0=A0=A0 i2c {=0A=
> +=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <1>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0 mcp23017: gpio@20 {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "microchip,mcp23017";=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x20>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gpio-controller;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #gpio-cells =3D <2>;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupt-parent =3D <&gpio1>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>=
; // Check this line=0A=
=0A=
Hm? Left-over?=0A=
=0A=
BTW, did you test this before sending?=0A=
=0A=
Best regards,=0A=
Krzysztof=0A=

