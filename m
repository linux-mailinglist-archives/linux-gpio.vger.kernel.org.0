Return-Path: <linux-gpio+bounces-12140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F37379B1869
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 15:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 13E981C20EF8
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Oct 2024 13:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EEC61D5CC2;
	Sat, 26 Oct 2024 13:11:35 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2116.outbound.protection.outlook.com [40.107.239.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD27B641;
	Sat, 26 Oct 2024 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729948295; cv=fail; b=Q80Y1a0CY8ywQp0rnV29hiLgjvEWqFoQTT+T/YUccyHOQNraq4pvirhKWlCYIM0gwnQS6iaxmFIP1fqbCq6GJAZdGaxIX3/2Mqh5JTMdI3aMC9S1MdjwsQRm+f13UsFn1ELSRbDgsKDFZvEyAYgwZ6+5o97jV3x3+A15OKYg1Q4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729948295; c=relaxed/simple;
	bh=twUwnznaUWAbZboErIya8D564ibpKNwfL1J3zxg2qB4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Vq8q/fvW7ZinkgG+l1LmHhAp7HYpvjysu0HIX4kL2bh3LBeGT+JRnVz3NGS33A3s6usGeAhVoTbfnQfLsAqBDCDaHGfcrHVNZFJb49rpJj7+p0jIvoYUeQ5Hf7CQcYRVK31w0XgJL2cMR2Kp/Cavgt+5o5kms9tSWNTX9k7lysg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLDATvBDxR8rseEJ+8zoLaX+hrqd5PDGEMo2tRca87VBJ29K2hCZvacByconjr7vYiFBC+jSlflqx2h1R+bNwSjoJlqODIgcNpUAjsAtPSyZNT1I5szHu67y4K4Qs/yMghBMJTYMrV9yqTD01k20+CrqoXM35ckwi0ST0LOdSswApsiJ4AvzIghiCy3PptK3L2B7QxrAUFwb/WmF4Io7QcrvXcKP/oP/fSeRU7p4FEs64ydRWZxetDH57Pz2Jg+GMO0Rp57crkwFcFU3Tfxq1FbwuNIlyVvq/+ED+oTpOwI8jSSDmb6N5TxR+u+Owf6AVRzaqh18w0twKbWY6GBviw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMVT8rbO0uC7OeoW9hm7vk56wPS/oXH6HmZr9+Xs+hM=;
 b=odAkP3XjZi3FiRuYHHpAhQdrmjpWfFeZgIq6jaRgxpCcJFhaPvcwOxrHsM4Nhyxd7gbXD2hOe6klEgZM+mDTd4ZcPILUWfzCL1yPzEaGtxZdBtzz6bRDOFs1UUXLE9ylxCoCulFDxsiPh1at9yuXTvu8wR8gVspTMhxqb3dS9RN/QfqBvkvfMUtJ0XnlBCUKgroywFG9SZaaQt55iiFvHK070o3jvylvUJWcBu7IyJ4+05/8NI+HMrEJwP9ALsKrBX2Ot2PdTNE4/avkGA7iW35gF50oMKm4jBcYWsksjbU5TC/hmxBA0puzAfuvlI2co9vkjWJr2HS5O+P4fUTIwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MA0P287MB0878.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:e2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Sat, 26 Oct
 2024 13:11:28 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6%6]) with mapi id 15.20.8093.021; Sat, 26 Oct 2024
 13:11:28 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: Krzysztof Kozlowski <krzk@kernel.org>
CC: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "robh@kernel.org"
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Tarang Raval
	<tarang.raval@siliconsignals.io>, Conor Dooley <conor+dt@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Thread-Topic: [PATCH v2] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Thread-Index: AQHbJhLZu2EJ4zneH0OiYhxVJJUFarKY9kcAgAANyBc=
Date: Sat, 26 Oct 2024 13:11:28 +0000
Message-ID:
 <PN0P287MB20195CAFA249448F66D13B659A482@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20241024124654.26775-1-himanshu.bhavani@siliconsignals.io>
 <usqmeunejf44l6wjw67ocv4idyxfpw5ivt5v4hqkputd7d7xsk@3ies2iwutzsz>
In-Reply-To: <usqmeunejf44l6wjw67ocv4idyxfpw5ivt5v4hqkputd7d7xsk@3ies2iwutzsz>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|MA0P287MB0878:EE_
x-ms-office365-filtering-correlation-id: b67b9789-2037-4db6-6ccc-08dcf5bfb3a0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?Windows-1252?Q?D8YcCgcX94lgAUTsYcUoTuaDE9UkuTBMQjJXl2yYArA4dr8nvscjp9XU?=
 =?Windows-1252?Q?QVe4L9ScjSrSWdZ2aJ88+yTaiIZBT7AeznortDSU4zjRXy8ZTmfxP7DP?=
 =?Windows-1252?Q?/XParWz5rpoV3WRROYkaDSTg8dloD0/J4a5nqPNZDpNsawUt4x4YXB3M?=
 =?Windows-1252?Q?y+NioyOicmHiGbx8ItALwefKKOhu8cr5BduROOEIrPzusYBHWUIbpR+u?=
 =?Windows-1252?Q?8rPJuDGO+MgVaoxQIG5uU8Pu/3LXHKJ9V4STSf7lCpTCX2TL5Fc5bUG/?=
 =?Windows-1252?Q?EXUBNyiXd8b5VeEwDxgFCOXwPrpvxa4aqrrjPp4xZeKkB8qG1Ib6dblk?=
 =?Windows-1252?Q?d7xm2RuWL5A1ALJNJB1YSnhhs3MlkwnXd5US0VB1ZKMmWZ+nnacUzgQ6?=
 =?Windows-1252?Q?O08rFAIPoveYD/VSxy8abhr5fTwdK+v5008NgGAHjs1YRGgJaDBTd1Yl?=
 =?Windows-1252?Q?GzxseG1SR/E4cZvtNbCMT3v1YDT+LnVufMyW+psLE7fTQ8XB3/Gqk9Be?=
 =?Windows-1252?Q?XwRIIRGL4fgDeM2ki8TqHs855AlBPAoEkqhV7YUzvmtYsipyuONq/xhx?=
 =?Windows-1252?Q?cbS7FacDMwlXrOjbfuLFUB3uroEJXJeLYa3hy97X6mT+0NCbufWBxvXZ?=
 =?Windows-1252?Q?i04TNEeZNgsULKGt/YWysQ43c/Wm1q9YSgYcGKqmAq0ssF3I7oLTqhGV?=
 =?Windows-1252?Q?DuIxXSddIYyNfRz40IWoBuwsRrJLM7r9TPzzXQY3i1WvjJEGr7AZsQXr?=
 =?Windows-1252?Q?BMfufNl+KG9pqguZqliE8VTkz+FiJw8+3PkC8GnFVjqHpGKgmXBmlIZS?=
 =?Windows-1252?Q?GU6O7V2gSb6oUaP4GS2qCi717m+r7UhIzo5zEblvEQcoUpEbV+ua/FMZ?=
 =?Windows-1252?Q?xOQoEZ4/Rx1kDQrGOQl1BvTy/qGRV/JmRQUYNEtDSq+U7W1VccG+yZRw?=
 =?Windows-1252?Q?wpfx8SI2nuK06npDV7imuHoA2rqzn/fdC2MPw1u6QZuHBrBeuGx2wE8i?=
 =?Windows-1252?Q?dZjtA1gKr/pREwAMVggZSd793nszfbVahTuG/uU6hBJAsXPrXKqRQIuV?=
 =?Windows-1252?Q?T+CUUR+lBHZr/wtV6YMaA+WkQRaRcvbdN0adPJe0NI6bnW0PqWS0ICKg?=
 =?Windows-1252?Q?NIv6YSZzUl1uwfY5zv14FSNPOCAyLJPsiJvyahgR4qDbCvGP4brvmoak?=
 =?Windows-1252?Q?37h+X4sMlNKCKws9kf5d6RIUWxXxBMd1EaLvftLlfo48ajdxl+2TND0h?=
 =?Windows-1252?Q?M2XvOlmkQn5iqprwYLMR67GzNppcgAiEXstyLOw18zOUSlcH6sip8cOZ?=
 =?Windows-1252?Q?rH5/CRpGUDvzWS3oqNGEp3T2T5c6HIr2PN0QUMj4BVxETkeMakZSBQVz?=
 =?Windows-1252?Q?T2IqyGsx6VdNzRRxQoJLh/3ZE9pL/HDRcB24p+ZS5zNcmaOd+4Ot6kjP?=
 =?Windows-1252?Q?7JiI3O/DgkAB5et3QhVsa/vZ4WZm4StsiJ9C1ZRsFfk=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?Windows-1252?Q?URIQChkfWVYulnnTMPhN3WExOHKMAN3m4dmJcI7tm7C37ayKVjliv8U7?=
 =?Windows-1252?Q?gMOfzQJXdoBbIN18ZBkcc10nUfKgomzlX3/4zZ4eG59dGNB+wq0L6H2W?=
 =?Windows-1252?Q?HfN+RqWEF8rOij8eTw8q+o7x3vZuJdJuO0rIDT3Jx4H8+11F1ylRXVB0?=
 =?Windows-1252?Q?046W+6BMNEQyoB6Beg6UxO4sQI1jt1E58XdcoPABIgJE9fyrCaak/8zw?=
 =?Windows-1252?Q?xIRTgy41b/PnOteoI88f6FH6awHJWv0Km8UyLe1Umic+THxj+7rHOTc0?=
 =?Windows-1252?Q?rdQU1p6LkF2OHERVAoO79Uhf5iHQwkvAVz1Did+vDk1Hnizw3/0L8lA/?=
 =?Windows-1252?Q?2ugRmRbvE/QzmmBRMVZ4l4fGetdL/Sc9x+JeGIx7N65MlVEgqikO/I+b?=
 =?Windows-1252?Q?PESvQQlElyZs9bbUcAy+Iz7cOYODd8gPcK72+z6jLOeQ1m2AmpNamJo/?=
 =?Windows-1252?Q?rXnpLxoM85Kn1soWkhhXlNkxBMvyhMMGCJNp0aOCnr8Q0tQMmTe9ElnU?=
 =?Windows-1252?Q?IoTdzNHU0OBhQyyGTfDK203dxgVhIXuL10bTOwFhUbbPdiyLFNWX8OCI?=
 =?Windows-1252?Q?G9bfJ2QHTqwrlxZNqooUm/I8TqP2Z0CHz1i+R2ySSJwOkUY29zhl5hGq?=
 =?Windows-1252?Q?BhasIWCyYEYy2beDpmjWt7zrJueBpfVuK+pMjK1fL7AYSJcC+lNRHJw+?=
 =?Windows-1252?Q?WJgYNTwXCmLWuskm/96okq94tfDzZWjR4IuVvVek7XZYWlu5OT58WAuC?=
 =?Windows-1252?Q?YSCiv3tZiZaN6MHKfX/f8w05YEIwg7nSyX0zy6wjfxs03/JjqYdKsRxp?=
 =?Windows-1252?Q?q/59VbSLqyUtbP1d3KpCP7krywcJy9j+06aK8im2i8oR3HkzNg0GR84P?=
 =?Windows-1252?Q?zRRG2IIdrBSlqFhvW5bcVGgMMQRVeufxKCaoSQKvcoyjORDny6Kic4xC?=
 =?Windows-1252?Q?q0VVAR/6Txx+KHHCTEVtPY4zIuSlNiHpZuWEzK2cETSIP2TUpTSklA+E?=
 =?Windows-1252?Q?jygwM4W5Cd65SiNypfSj1yJwlPMk+96LJ7cjVGfx8KoxQfrOR2TbQ0tg?=
 =?Windows-1252?Q?WP5MJuzmDZtjZL7pTJSHElKXbr88Lcvt+ppBfvzRJqJOs0EgtH24xLmG?=
 =?Windows-1252?Q?VWThaYMC4bMHOjxk1Vyi7dzl6Um0OeNLKYaj68SVI1ajQ+tFiFLxnIAd?=
 =?Windows-1252?Q?LHlRtBXku+NCESOLwm6vjCg/DvlcRwIHKNJS6LV0hsDYUa8EiptlbIzc?=
 =?Windows-1252?Q?Hqn7L0IuOonBOPa7sMjz7SA46ZV2Fodqqwy816RxCLJ7nwrDiLQfAO6p?=
 =?Windows-1252?Q?PxlwAnSAyrgZaKt+1wU2uBUMFULQjxlxNHLuxubad/LcRyqJGwgA454A?=
 =?Windows-1252?Q?IFu4RCCm8yiPB29mc3pwFEQFmZJgqhC79paXe0ylrQDCrZV14Y+kjI95?=
 =?Windows-1252?Q?U3lnmEsVmLyWgINCvCED8WgJeiLlJ9cb9vdP4dUgCGXW7x3DKY4PieRN?=
 =?Windows-1252?Q?C62inDIGETV6kWI5Yvq2epafJu7j1aL9K9aRJYt3ftILkSN/paxuRcnh?=
 =?Windows-1252?Q?fUzuzj2mc6NM3Oth9/EeZ0hUP+ddYODWUQP+miDRGbrVCO5061neXh7K?=
 =?Windows-1252?Q?Z+o1NQx0cV992VcyF5OMK8tmC6XbKZJ4vRgiF8LQkx29J/1y0B2Zb4U6?=
 =?Windows-1252?Q?CPtDu2U/cOnlMEtg2LQHy0Ea/o34psvspEKCkzJxbLu/o1X+goTLPw?=
 =?Windows-1252?Q?=3D=3D?=
Content-Type: text/plain; charset="Windows-1252"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b67b9789-2037-4db6-6ccc-08dcf5bfb3a0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Oct 2024 13:11:28.0723
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7EUO0kXj/dckv9tc4WiEjziIsO2iFFGgz21k119dqp0WjxPxdAJTTtW0TCccPb4hvR09s3GvHgmRjL+Wty2fNyLJdNCR/3biTyq3VPRjTFj1o0FpF4GvB5BhK2ueiybE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0878

Hi Krzysztof,=0A=
 =0A=
Thanks for your suggetions=0A=
 =0A=
>> +          corresponds to a physical pin on the GPIO expander.=0A=
>> +        items:=0A=
>> +          pattern: "^gpio([0-9]|[1][0-5])$"=0A=
>=0A=
>Since I expect resend, correct also quotes - use consistently either '=0A=
>or ".=0A=
 =0A=
Yes, I will change=0A=
 =0A=
>> +=0A=
>> +    i2c {=0A=
>=0A=
>Keep one complete example for i2c and one for spi. This was not in=0A=
>previous patch and change log does not explain why you need three=0A=
>examples.=0A=
 =0A=
Okay, I will drop one example of I2C=0A=
 =0A=
>> +        #address-cells =3D <1>;=0A=
>> +        #size-cells =3D <0>;=0A=
>> +=0A=
>> +        mcp23017: gpio@21 {=0A=
>=0A=
>Drop unused label=0A=
 =0A=
May I know how its unused, AFAIK, Since it's an I/O expanded, it=92s refere=
nced elsewhere, so keeping it is necessary for functionality.=0A=
 =0A=
Regards,=0A=
Himanshu=0A=
________________________________________=0A=
From:=A0Krzysztof Kozlowski <krzk@kernel.org>=0A=
Sent:=A026 October 2024 17:48=0A=
To:=A0Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
Cc:=A0linus.walleij@linaro.org <linus.walleij@linaro.org>; robh@kernel.org =
<robh@kernel.org>; krzk+dt@kernel.org <krzk+dt@kernel.org>; Tarang Raval <t=
arang.raval@siliconsignals.io>; Conor Dooley <conor+dt@kernel.org>; linux-g=
pio@vger.kernel.org <linux-gpio@vger.kernel.org>; devicetree@vger.kernel.or=
g <devicetree@vger.kernel.org>; linux-kernel@vger.kernel.org <linux-kernel@=
vger.kernel.org>=0A=
Subject:=A0Re: [PATCH v2] dt-bindings: pinctrl: convert pinctrl-mcp23s08.tx=
t to yaml format=0A=
=A0=0A=
CAUTION: This email originated from outside the organization. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.=0A=
=0A=
On Thu, Oct 24, 2024 at 06:16:18PM +0530, Himanshu Bhavani wrote:=0A=
> +=A0 pinmux:=0A=
> +=A0=A0=A0 type: object=0A=
> +=A0=A0=A0 properties:=0A=
> +=A0=A0=A0=A0=A0 pins:=0A=
> +=A0=A0=A0=A0=A0=A0=A0 description:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 The list of GPIO pins controlled by this nod=
e. Each pin name=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 corresponds to a physical pin on the GPIO ex=
pander.=0A=
> +=A0=A0=A0=A0=A0=A0=A0 items:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern: "^gpio([0-9]|[1][0-5])$"=0A=
=0A=
Since I expect resend, correct also quotes - use consistently either '=0A=
or ".=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0 maxItems: 16=0A=
> +=0A=
> +=A0=A0=A0=A0=A0 bias-pull-up:=0A=
> +=A0=A0=A0=A0=A0=A0=A0 type: boolean=0A=
> +=A0=A0=A0=A0=A0=A0=A0 description:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 Configures pull-up resistors for the GPIO pi=
ns. Absence of this=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 property will leave the configuration in its=
 default state.=0A=
> +=0A=
> +=A0=A0=A0 required:=0A=
> +=A0=A0=A0=A0=A0 - pins=0A=
> +=0A=
> +=A0=A0=A0 additionalProperties: false=0A=
> +=0A=
> +required:=0A=
> +=A0 - compatible=0A=
> +=A0 - reg=0A=
> +=A0 - gpio-controller=0A=
> +=A0 - '#gpio-cells'=0A=
> +=0A=
> +unevaluatedProperties: false=0A=
> +=0A=
> +examples:=0A=
> +=A0 - |=0A=
> +=A0=A0=A0 #include <dt-bindings/interrupt-controller/irq.h>=0A=
> +=0A=
> +=A0=A0=A0 i2c {=0A=
> +=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <1>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0 mcp23018: gpio@20 {=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "microchip,mcp23018";=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0x20>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gpio-controller;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #gpio-cells =3D <2>;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupt-parent =3D <&gpio1>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupts =3D <17 IRQ_TYPE_LEVEL_LOW>=
;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 interrupt-controller;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #interrupt-cells =3D <2>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 microchip,irq-mirror;=0A=
> +=A0=A0=A0=A0=A0=A0=A0 };=0A=
> +=A0=A0=A0 };=0A=
=0A=
Drop this example.=0A=
=0A=
> +=0A=
> +=A0 - |=0A=
> +=A0=A0=A0 spi {=0A=
> +=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <1>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0 mcp23s17: gpio@0 {=0A=
=0A=
Drop unused label=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 compatible =3D "microchip,mcp23s17";=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 reg =3D <0>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 gpio-controller;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 #gpio-cells =3D <2>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spi-max-frequency =3D <1000000>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 microchip,spi-present-mask =3D /bits/ =
8 <0x01>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0 };=0A=
> +=A0=A0=A0 };=0A=
> +=0A=
> +=A0 - |=0A=
> +=A0=A0=A0 #include <dt-bindings/interrupt-controller/irq.h>=0A=
> +=A0=A0=A0 #include <dt-bindings/gpio/gpio.h>=0A=
> +=0A=
> +=A0=A0=A0 i2c {=0A=
=0A=
Keep one complete example for i2c and one for spi. This was not in=0A=
previous patch and changelog does not explain why you need three=0A=
examples.=0A=
=0A=
> +=A0=A0=A0=A0=A0=A0=A0 #address-cells =3D <1>;=0A=
> +=A0=A0=A0=A0=A0=A0=A0 #size-cells =3D <0>;=0A=
> +=0A=
> +=A0=A0=A0=A0=A0=A0=A0 mcp23017: gpio@21 {=0A=
=0A=
Drop unused label=0A=
=0A=
Best regards,=0A=
Krzysztof=0A=

