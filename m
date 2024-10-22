Return-Path: <linux-gpio+bounces-11747-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6BA9A9E60
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 11:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C08F3280E74
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 09:23:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16DFA197A72;
	Tue, 22 Oct 2024 09:22:59 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-MAX-obe.outbound.protection.outlook.com (mail-maxind01on2126.outbound.protection.outlook.com [40.107.222.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6DC1494CA;
	Tue, 22 Oct 2024 09:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.222.126
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729588978; cv=fail; b=t5etH52hoGZPVhBV6GLCu47Qcc0iqTR9+ns0uWw7XiYr3aF186CBORaXozVIT4KFHezS8TR+TfgLfUQ3CExAgCmdhfIM1JF54seSXwS99Kd4/nigdRyuaDxaTFp0OTTuEhRrBYJoMPq8lyFOIDsJFshqUIh7Fr3e0IbaPRO9374=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729588978; c=relaxed/simple;
	bh=l8xC4KiR2CulR0Ou3BQg9dZtckBaZ2DG8Yr3s1bysAo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dnNZ/ncb8y9ixezth9tGCkAs7ciFPcyDriv5oimfV1QhIkmdD6fC1Wn3UAWFGezdx2cU208j1jw71ZUykWes8A53/4VGEPoF5M1YhlXz3+qEcCNXMf3CRXK/SkkeEhSa+y8me2CXAU5/j8VahTaeAHEpLBOG6+4+/XbFvVyXB6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.222.126
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=agVLB/6BuT31VeLC7+R5I4YLhm6EIbi1OowQmzlbKZgENb4zYavs0Vo7ZOXBVkz0Uw4geX1i4V+o2u0X9dcTsskv6nvlVjvBlIVC//yTO1tI4VFLzC9v9Ne4lg+heczp3MLSglA2M2xFwtN5sEOtyH+uRA9GvAcoFItbHL6fLwd33oB0ztBf4YbBuXTcFXq/65mbxbBwrKHx7DIrMrG5Yw6nmeii5ssZcBRFjvLMEo9a+AhU+nlEgYY2QI5VgTEcJdEtrhyT6Aei6nGHDAoeRB2XwlaRtN80qEkQIMKn3No6P9+4iqomXPm42YgfTJWemqREDhYlY5BckbcGJ/vNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a/BiicA8b6CPZgD45xbChhLbEGOIZ91dpyVNbSiuxVA=;
 b=vX/NIy5DUAsabR7LBOgWvEDYBZ4Pds+gaOwhW6i7J9bmUC8EmCz84mIGy9H82YerTO+o/EEhCI1H0FWjxsfSHQWlmfTHaimj/KQ6ImzMABOU2SSLi9Tz7kev4VP/d29lJi6vo845tFGHTbscxUT3n7+b03iHKFweSTLF9Qy9DI4VmeqdFNYi5G4zYhmwqMdv4N6EuYy83l9ffIzl53Xkt8u2N5Aim0fs2c7Z+pOOMnAOOm0fdr8IPrG/GVAtKNQ1LQ2tOQ4mejGVvRMs958bLBlCf+5SGUjIBCKRTOI6EtJ/gxoaEJ2LKoIYsPUaPUZRBuG7e8wMLj2SeVsLxxsV8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN0P287MB0682.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:167::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 09:22:52 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 09:22:52 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: "Rob Herring (Arm)" <robh@kernel.org>
CC: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linus.walleij@linaro.org"
	<linus.walleij@linaro.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Thread-Topic: [PATCH] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt to
 yaml format
Thread-Index: AQHbJEf0KUynUcmP0kuLM4i3mQYwMrKSXnQAgAAggEs=
Date: Tue, 22 Oct 2024 09:22:52 +0000
Message-ID:
 <PN0P287MB201901C383FDC879CA7A61A89A4C2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20241022060157.36372-1-himanshu.bhavani@siliconsignals.io>
 <172958190288.3294457.18338479078694309889.robh@kernel.org>
In-Reply-To: <172958190288.3294457.18338479078694309889.robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN0P287MB0682:EE_
x-ms-office365-filtering-correlation-id: fa065276-3ff2-4d53-ec87-08dcf27b1aad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?FH1PmG2DJYCvRsna95kA8ovxUMmhS1SZn1BPHJ8dSDD1YYXPktQ+IOnhls?=
 =?iso-8859-1?Q?m+JvSYg83DFcakRZM319b2MF5S43pVl8PVON+VI4L/XZ83woN4aSR7ewJO?=
 =?iso-8859-1?Q?xCGURVJVfnnAurv3iC+qEW2rxWg7DVTiebAP5/N2G8hwdx+f8QV3bV6y/M?=
 =?iso-8859-1?Q?sT5GLx9Vm0+Ptlhl0Jgvkc5fTDKk/PLPMt29E7hP3cFTruXiG0mg+IWd6z?=
 =?iso-8859-1?Q?5BsmuuQXaYwdId03LClL1kltb38ewckqvgELAvGLhQ+AWEiw3B3WHPW3Yx?=
 =?iso-8859-1?Q?BFKIKb4k94GgIEaLAXlz1l/r6+TfO3vSjTGtJBwz+C33H6/gqxzFOS2FMK?=
 =?iso-8859-1?Q?BCJnf8YEMCFWlHSP0Si36i5gBWop6XGOkB6hPDAjo/0dOxyIHRw+n3fbgJ?=
 =?iso-8859-1?Q?Hv1twZ30aneimkF8IEhCA7B5TgBeL5WgQSzt3O93IYa0x+5Oi/rdmzWE/F?=
 =?iso-8859-1?Q?OT9Z40tn4BtR8T6Yl/+GgB2j6qwdmXKhgTATqZXDL3cOfGgDovpBs+D8Wd?=
 =?iso-8859-1?Q?QOMUvmhGfes0oPfsH72qMfqtMGN35OxvpiWy7oFLtz/rzlK3CqdS+gcuoa?=
 =?iso-8859-1?Q?zdaIPl51rCxomBvpPhF32J1Xr0ehUJReqTDrpyH86UQQcCQQfcAhsndCzr?=
 =?iso-8859-1?Q?V7nlkpQi1aBoPErmxEY6yGisn4bBsCivD78xsbWj0gxGkV40oJsCgH3SVt?=
 =?iso-8859-1?Q?QuoDhSse3sIFASVGba4ul1H+5I5pfFbjQXx/0EfYOOpQQhXu3TF9rAxekC?=
 =?iso-8859-1?Q?E2ThK2eFZgaic+R7Qg+5CFCDW5bpfFJsusnYOeEVdU8mEA9UlZNOHIbWz1?=
 =?iso-8859-1?Q?+jHQgGKQWfOaO8+FQHjwBhFNxySrFVDLgkC1yZNgoiO06iPNuOhSK4of3C?=
 =?iso-8859-1?Q?JL8I1CfRKtOvBRwLamRzfd8/CqWuoYwfXBao6lxJazB2GW6XJdYNENXhJd?=
 =?iso-8859-1?Q?9g46ScGSZV7HzLWJTim8fXqBd0VAizSOIxHeHHsImX+JMwPmpDYR5i0qDI?=
 =?iso-8859-1?Q?3Srrd9h+K8qhgnblhqoz2q5zdBV082orxSU7Yx83fQ8vHqsgm3GoEIpros?=
 =?iso-8859-1?Q?PlO5Fx080tqTITqOJTcg0mNUBtLPPT/8MtG0fhvKrs+jZeoP+sqv0KjHWR?=
 =?iso-8859-1?Q?JGMiwfHPwMZEue+uNhh1EcThjoIeioObj8Np3R9wDKzLATqt5ufNHtMlKW?=
 =?iso-8859-1?Q?c6ad+5XmXGx8QDCmFNmXgVAn3DYU8Yl11WOe8+mjxZzeL4SgjQVCzDPtbo?=
 =?iso-8859-1?Q?42opr+Yii4u/MQHmzgj5IbgRlvXC9gNcWFg0Zy+mzIWhagTgHMd03KK7eZ?=
 =?iso-8859-1?Q?nV4wmEYOVE0jTf19Nye7lZhVbvCird0/uotUvnrA0VVUgg2JJti1QdBx+D?=
 =?iso-8859-1?Q?bIJy/VawNKTk5S9Or/gxUeFu+MYo5DYVdUMvh7UHMm1uURBGe4j7n66olk?=
 =?iso-8859-1?Q?5OR79C+Y+7WBaqO+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?qW+HDZEnqMEVaWbCEyaKVCnLFyzrUL4EMxoXct4APRcz4IirTTZmwwygCz?=
 =?iso-8859-1?Q?zHBewWlOZbksn8CFXmsVYhkhgaYdJMPaB2DR7uBMpn40mKnnj0UTc+Tbym?=
 =?iso-8859-1?Q?JH62xUAjJCjPLrevPy7ZAMz7RVDI2JFq8avh4cBb7fNWI2gIcUb5iQQsA3?=
 =?iso-8859-1?Q?n277/gQogUrW86e7icl9o9wwXaMNc3WdqHPnWnHX2JiEjOM6ZhtVL19tsB?=
 =?iso-8859-1?Q?63Yj3UxOzp+4lOtSCKaTt9CQQcBGeGjSI3zw9eF2oM1JFDRfumjCwSMmNm?=
 =?iso-8859-1?Q?g4aSEH7bgWBCWQfUXfvBqnS7x6XwhNf97e/xVZqmQzKc7cflOyCvK28TND?=
 =?iso-8859-1?Q?Z7J//JIYK++Id34EHsUTE/OCJcX3ZB4Y9o89CQnUka/YwastpMnGBTDTjQ?=
 =?iso-8859-1?Q?K1SQ0/AoSijR8S93drwxug/Y67zRLyQu1k8t/d66e1DBlFlG/bYJ4+K2Sk?=
 =?iso-8859-1?Q?jcg9SUqo3KOZeAuH0xhuuNilyddShF1eFac0MAjCU15UzAqQ13F/mKNNxz?=
 =?iso-8859-1?Q?0ktfpzhJ86U6Q/EqSSQfEAHfN0yJ7ciq20LAPzruRe9+77FABnfGQwHBLi?=
 =?iso-8859-1?Q?poqu9i4t1Lu7nb324G89MHv/a1qrmRfk4Q3UNqO8PLWwdbXsk51Lur2PeJ?=
 =?iso-8859-1?Q?OE3V9QEmcG2HJmTKJ5VIA+fYUcnN7FgObtb1RFYwKDLFP6NOhVklbLwQm3?=
 =?iso-8859-1?Q?3X6n1pIL9P2ZC/FBKdk5bdWgYFJCTP8OlwsZSQDZ4P/89o3ZzgwTb8XYOU?=
 =?iso-8859-1?Q?BlFqi/qm2OfuzVvfc1hC3DmQ6D9oi0v7y1f9aCaAB0i4ZRsCu6WVlKA56I?=
 =?iso-8859-1?Q?hZ1Zl+p26JF2ynD6FCpLguNjBcIy+FkizbIgZYdF4P0TtEbSRN6SztbH/8?=
 =?iso-8859-1?Q?JQlhiZnE8m3eD6oIsG8o17M1jiWFS9tO3yg35TrwShVks2k3MsWNHmxoyq?=
 =?iso-8859-1?Q?ieNVTHZRhbnpIRP6QWMxCVzS9IMqscapMZRN3V5Pu+4S8SHH71pEVmDBsW?=
 =?iso-8859-1?Q?ioDs73Bifd0XR4t2ZiqAPlw5TOKg3SbLukCHq1GZQ7Xl3FEe23lMlgtiwe?=
 =?iso-8859-1?Q?2jslaNGwf++3UfPywkouVPBKmeGKCrPQZOb3zDXUd0A0lqru2lOLlQMm38?=
 =?iso-8859-1?Q?c8qVZH9g1GNwmxZglkllr1FZ34hRCuA4WzFt4sW5V773SaNjhtmIEfdrLA?=
 =?iso-8859-1?Q?2zAC3M1ocUN6QGr78i1EYKXswRtsPdVqaHNpJvpCGLoz4hoKTJ6QjlXHRo?=
 =?iso-8859-1?Q?e8b3xFQNcaJ0btrG5pcMctlOia1CarQX6D1myZ1uJHVlmvW7jX6uNqtxOu?=
 =?iso-8859-1?Q?HbOuqAXAau2P2DOHLDXXYwKIC57JnnEN8pYptEvfcrXrWDwXFUXmssx+Jf?=
 =?iso-8859-1?Q?osz9T0zMAFdRKSZDH3l1AN8pLvs1Ve6ioKjdzOPY/xR8TwmciWtuXqWlTb?=
 =?iso-8859-1?Q?uoTabjV3PW7q4ir40zqtR/2UzdPTAMvEVParBTV7WdFnM2IdwaXaIjpvcS?=
 =?iso-8859-1?Q?x/ZkH+lxggqXanWKMcIXAwFnLYpF924ILC/YA5c5mwGQ1LEIhjes/lkIV/?=
 =?iso-8859-1?Q?Wdv/KntYJMZU9xYT1B/VRb1ojRTBNOHz7Biy09Jp6pamN3GYs4oZaKgXvD?=
 =?iso-8859-1?Q?81EJaxwv1cp3wY9oZBY/ajchv9oxoZmn0vBJoR97JRjVDAAmJ8oa2ueqCr?=
 =?iso-8859-1?Q?LgF4RVhhGIWhc2evZmY=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fa065276-3ff2-4d53-ec87-08dcf27b1aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 09:22:52.2116
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jgUJUaiN/agg5nXyszUV0md1sZGRjc/ZDJRNSvCKf4EuLij3Ou7mMI4uvyAjqZwdzYZP/UCavLVXbFFotL9V0R7TjSTmwyDnu80xL0An8bW2QuMCFMFuYNJDkizS1yH2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0P287MB0682

Hi Rob,=0A=
=0A=
Command  :  =0A=
                 make dt_binding_check DT_SCHEMA_FILES=3DDocumentation/devi=
cetree/bindings/pinctrl/pinctrl-mcp23s08.yaml=0A=
 =0A=
Output : =0A=
                 DTEX    Documentation/devicetree/bindings/pinctrl/pinctrl-=
mcp23s08.example.dts=0A=
                 DTC [C] Documentation/devicetree/bindings/pinctrl/pinctrl-=
mcp23s08.example.dtb=0A=
 =0A=
I am not getting any error or warnings =0A=
 =0A=
I checked dtschema is up to date =0A=
dtschema Version: 2024.5=0A=
yamllint 1.33.0=0A=
=0A=
Regards,=0A=
Himanshu=0A=
________________________________________=0A=
From:=A0Rob Herring (Arm) <robh@kernel.org>=0A=
Sent:=A022 October 2024 12:55=0A=
To:=A0Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
Cc:=A0devicetree@vger.kernel.org <devicetree@vger.kernel.org>; krzk+dt@kern=
el.org <krzk+dt@kernel.org>; linux-gpio@vger.kernel.org <linux-gpio@vger.ke=
rnel.org>; linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; lin=
us.walleij@linaro.org <linus.walleij@linaro.org>; conor+dt@kernel.org <cono=
r+dt@kernel.org>=0A=
Subject:=A0Re: [PATCH] dt-bindings: pinctrl: convert pinctrl-mcp23s08.txt t=
o yaml format=0A=
=A0=0A=
CAUTION: This email originated from outside the organization. Do not click =
links or open attachments unless you recognize the sender and know the cont=
ent is safe.=0A=
=0A=
On Tue, 22 Oct 2024 11:31:27 +0530, Himanshu Bhavani wrote:=0A=
> Convert the text bindings of pinctrl-mcp23s08 to YAML so it could be used=
 to=0A=
> validate the DTS.=0A=
>=0A=
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> ---=0A=
>=A0 .../bindings/pinctrl/pinctrl-mcp23s08.txt=A0=A0=A0=A0 | 148 ----------=
-------=0A=
>=A0 .../bindings/pinctrl/pinctrl-mcp23s08.yaml=A0=A0=A0 | 153 ++++++++++++=
++++++=0A=
>=A0 2 files changed, 153 insertions(+), 148 deletions(-)=0A=
>=A0 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-m=
cp23s08.txt=0A=
>=A0 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-m=
cp23s08.yaml=0A=
>=0A=
=0A=
My bot found errors running 'make dt_binding_check' on your patch:=0A=
=0A=
yamllint warnings/errors:=0A=
=0A=
dtschema/dtc warnings/errors:=0A=
Error: Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.example.d=
ts:85.3-86.1 syntax error=0A=
FATAL ERROR: Unable to parse input tree=0A=
make[2]: *** [scripts/Makefile.dtbs:129: Documentation/devicetree/bindings/=
pinctrl/pinctrl-mcp23s08.example.dtb] Error 1=0A=
make[2]: *** Waiting for unfinished jobs....=0A=
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1442: dt_bindi=
ng_check] Error 2=0A=
make: *** [Makefile:224: __sub-make] Error 2=0A=
=0A=
doc reference errors (make refcheckdocs):=0A=
=0A=
See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241022=
060157.36372-1-himanshu.bhavani@siliconsignals.io=0A=
=0A=
The base for the series is generally the latest rc1. A different dependency=
=0A=
should be noted in *this* patch.=0A=
=0A=
If you already ran 'make dt_binding_check' and didn't see the above=0A=
error(s), then make sure 'yamllint' is installed and dt-schema is up to=0A=
date:=0A=
=0A=
pip3 install dtschema --upgrade=0A=
=0A=
Please check and re-submit after running the above command yourself. Note=
=0A=
that DT_SCHEMA_FILES can be set to your schema file to speed up checking=0A=
your schema. However, it must be unset to test all examples with your schem=
a.=0A=

