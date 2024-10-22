Return-Path: <linux-gpio+bounces-11744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 386799A9C33
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 10:19:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DEF9F281F2B
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2024 08:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4E8172767;
	Tue, 22 Oct 2024 08:19:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01on2093.outbound.protection.outlook.com [40.107.239.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A1C158D7B;
	Tue, 22 Oct 2024 08:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.239.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585168; cv=fail; b=FcdQcXl9MZr7cI2vrK75NqUdmqlczlxwnl7F22h9gw6WbcAOvW2f5l46N0FmQkeR578xGDpnLtrS6eNBEHhYU59iY3aKpgBQFv8ETbRJ09sy/GH2uDw1AKzws/9zPVV6Bx8MZICAE5Cxbca5T+y/PFMiUQAggzptjt66EhfKCBE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585168; c=relaxed/simple;
	bh=MrtZPAjgmdcJQFpbUtLKCOoHWvT9tGIJyXGiJUUPCYM=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=WUCvbYhxOOFiT9148K48wvbK0w2PxBq+hyQ9FWNcs5dikEhmskjNxfCF3RQAa/Hqm0lv5t+2c0d+ueuD2TGmIgVQF7XOlOGWMnPobZitt3OZ4E4VIGOki2E54uDFvvLMFT/NXfJPoDzrVO5Q0DkHyIee2ce3uli61x2fIeB2U9U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; arc=fail smtp.client-ip=40.107.239.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5o2o8Dr9rIA/vpVMS4jGLnYCSj+qDamz3JgvBuffs58Z1PaPGP4apRJk3gCOkie8GBRedGYFyO8deMwCK1RC/KfmI29Bm9SSqgqhrZ55lXtBFllO66W06CM+vqVJOxRyLUoS+GVLC7s/gimBE1G9/bHV1+LXV8ziYUAV65Ggw72+fwNioo4ry9cm9+atVuP/miSmJ3f+Ch1fZVNn/2SKK9ebxSAJmMFcBsrabASI3n6NZjcqqs0KqrSGJ5Mak+9x8NwB4SqWIZNoS7p2cqnzt1loXmmw6iiRDLeFSGXS5xWvQ1ZSwety4KN6gnV+kGYhOSB5rmIvIk9fL8ngS8ryg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MrtZPAjgmdcJQFpbUtLKCOoHWvT9tGIJyXGiJUUPCYM=;
 b=BsQKms6sfoaIHY7En0Tv1qAsOTzzEtZQ+D03+k1ccKp/ovjfPR/BK9j7fjIfZqPUYUcEoEQkmkGJ28/2RfbY/aTGka/ZM7of/9QoV69ZE2sPwtS6p1kL85/Gj1ekiovENOYWEglP7RFw4kKwPP/6xMO9w0FtfdFvPc6en/eILRF5qURFxoVjaupnj8ZDntq9QRoveQN/IbeXya5WwGSKF+X9Eyv0gvZA8dShrLipez5Cj/7CGg+M/EVdoxJL1Lo6xyBKG4Lsbd8kDoRZcLv+CGEpS3qZYB/NGNosDvGzBEHbQwVjvI6HQArrQV/PIt2qAu3MDCC9xjSowbATPGPvVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN2P287MB0522.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:117::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Tue, 22 Oct
 2024 08:19:22 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::368a:445f:b1be:4bd6%6]) with mapi id 15.20.8069.027; Tue, 22 Oct 2024
 08:19:21 +0000
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
Thread-Index: AQHbJEf0KUynUcmP0kuLM4i3mQYwMrKSUAsAgAAX7Bg=
Date: Tue, 22 Oct 2024 08:19:21 +0000
Message-ID:
 <PN0P287MB20192A56CF07E9DFF1BC0F249A4C2@PN0P287MB2019.INDP287.PROD.OUTLOOK.COM>
References: <20241022060157.36372-1-himanshu.bhavani@siliconsignals.io>
 <b69251f7-7827-4f0e-b4fe-184a5cb54ee7@kernel.org>
In-Reply-To: <b69251f7-7827-4f0e-b4fe-184a5cb54ee7@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN0P287MB2019:EE_|PN2P287MB0522:EE_
x-ms-office365-filtering-correlation-id: 8218e584-488d-4eff-819a-08dcf2723b8b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?iI+gxorHidO7vcMpp26jqxCfC4lrmsHMaiYvG6bt2R9wyChA/PYmqS/G2d?=
 =?iso-8859-1?Q?+qkjDE0o4a/a6DMP2Bx57WQ8iv2dE+hThoZPXpyhKIEa2gu5LZarAPFmO4?=
 =?iso-8859-1?Q?8G+hxfDVEU2Ms/3PBzn/K/10kmVGkp19QjkwVqDhiSaABK6XEkgA73bwVJ?=
 =?iso-8859-1?Q?IeYKQdwFG4fXCsx5h1BWbVjWGM+49CVfG4W6HFtvBcw5vf/Zwdc36VcYoe?=
 =?iso-8859-1?Q?nM9a435HFQOZS9w9YivlT1OVEy6YVomrW/dI3LM/KU7OM1ygBixtun163r?=
 =?iso-8859-1?Q?fWq7dyXrIfx4qZBMFNjd8kChI8CvFlK/Nd61iFmvLF/QBq3tQNZhoIRcec?=
 =?iso-8859-1?Q?JLapC/HYQm+k0DhuoUzbFgfnXMdZfb4LiRYCBs+IZ/S7Sk6nsSxuHw94cX?=
 =?iso-8859-1?Q?+b9c8vGQfiBlSdtFVecHnPojCGrA4lABTswPHDy8CvBblJgAFJ7PQS7pXh?=
 =?iso-8859-1?Q?XcsY0Z7gO1PalWWZ3DKI8RG5Xxa1wi5INNEa4ToDTIpSQEiHq9edEzOaXX?=
 =?iso-8859-1?Q?mBf9skXl/BxOFrLXhlk6V2SELAmIETcHNtFUrX1P2PIzDxJUHiLRQAPckP?=
 =?iso-8859-1?Q?HBGvBhJnHpntk/+qDUOD5hyv2quYCaVxkWfu8WbpIf8lzh2AK9GXJPlVkW?=
 =?iso-8859-1?Q?03NBGBpqda0u7LJIY/dn+hi7qjcVHaRryqumKT2AbHi5vF663TzIRSALWd?=
 =?iso-8859-1?Q?vK+kpiHHZvxPkBcz4F3UkNyRt4tWARzT5edgPXNms+Kf0X+KByu5HdfjLf?=
 =?iso-8859-1?Q?ANadm7E/zWI1jMiRCNxk0S23mcmIOnqBGYSpfruDxh2JpVZEOW8Peruae0?=
 =?iso-8859-1?Q?TRe1vsDAPceChSU4I+3RNkACuiH4Dr4oziSEMcTAmq4lGpeMAXnVdxJduB?=
 =?iso-8859-1?Q?0kRb09NPn06c06etmX2DjtgYAm6nl8mxB55hdRYN3Ly/HSNAas3Nn4JRGR?=
 =?iso-8859-1?Q?hce/eqGUt2Lp+/1tfUIK9qlB+BhgQXxOg6fu3ueCxhaIg/pWhqIvN4toZQ?=
 =?iso-8859-1?Q?bsG53cX/G1NasQiSzu1gFDa5r73zoZOFGFEBKw3SyJkWPIShqo1n0FtqjS?=
 =?iso-8859-1?Q?Zam8otNWt9RVrRCCmKS1VVdxPfaVyZRmYXs2LkrQg3mzFPhwiW2pOIMb+u?=
 =?iso-8859-1?Q?CmDg74qae/rR0IqGeSKz211oaHvywKFCzEXAdtn1ZPecl1A3vJGF6dhe8Q?=
 =?iso-8859-1?Q?dwPka97+gl8KCAKH1e5ZVUcyDTuHvPv26n+XhkA7bs7CGaBbIXa4538Iyd?=
 =?iso-8859-1?Q?L+ExMo6yy+cBJmmS4BCc+Cujlvk9jGyiFP0kSFr9AJXnnicmhMLK3HkECT?=
 =?iso-8859-1?Q?esiQ3qyPJ8bDGEMdlAfPIO3wNiQxEO3FAzI4NeNmtn8rvH3HVKi9cRxRF0?=
 =?iso-8859-1?Q?EJEbwrAXiG?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?UCikKR1rQXsyCQyU9SXIbG9w7xV8+4e/mc6iRgE1lGdvpM+PvJOrN4RKze?=
 =?iso-8859-1?Q?sLD7We2amo9qJuoOG5D53kMQxAxJYQi9lgTP+yRB8AwoZoDaFNr38Cobs6?=
 =?iso-8859-1?Q?UGtFx7jCA+w7u8uCfjMAfSowrmshpcIUNREteDEACUqFqQe5bVe/kd2Nlz?=
 =?iso-8859-1?Q?qwd1l1x0fzye+BCPbeMCA3xZN7DdX0seOchDJroEwEncefGIHcEq9KQwaN?=
 =?iso-8859-1?Q?OSkqjnhTaFuIexi42uQhdE+QzXFaEU+NrSPB07zEohqnuDg3waegzecA4e?=
 =?iso-8859-1?Q?XOGFY4PNcxckFdXc5RKnWRY46mDrV9DvQZzgU4YzWBENlFZgwJ/67e5Llo?=
 =?iso-8859-1?Q?9aXqFWNFTdti2kFH1yGlNb1MFreK8/JeC+KR3/9JIgy9LlmfkIi0/fEy9A?=
 =?iso-8859-1?Q?lngEuEyk0siY54KLbXY8VsDwjFH0hbsF8kd8g4unGSJakU4H04EBz0G7VG?=
 =?iso-8859-1?Q?cf3QotzYYpFpzLdBrY2SsQGSoop8D6+v0hYNjT1jR4o0bN71t9ZfYJi06V?=
 =?iso-8859-1?Q?ep3R5MXKzbGEngLNXb0rJmeRGNyF8HbzW3D7t7uK1DkUZP8ROMivBb9awy?=
 =?iso-8859-1?Q?TBOWAi1yllgbEmShmPoYlYe5qZHvqo1I0Nazjcjk2y8SDeedNcHtEl+XRs?=
 =?iso-8859-1?Q?qconAL/W367PY1EKeS2eTcVg6yTdJm3c+OJCjTmHMHa5Tw1GyJSfOGohTt?=
 =?iso-8859-1?Q?3CLHThWQxz1VLb994XUxmGfVHQY88/rlp6o7JyAiREGJdo3z4pDKtxivB5?=
 =?iso-8859-1?Q?OeiAU7VaLRA0NVUgR443E0YJfFiyOKysBuQQIgRPbbbUHDE+0YvdWS6tza?=
 =?iso-8859-1?Q?JGt7OKeXVbdHFO9XmEEwM/kgxajtDihaho7wH4pjljjjHnkY+UUTfwI8cL?=
 =?iso-8859-1?Q?KOM1J1fyRhFF+mtwsryTV0inVBQyMuP48ckVRz7aTAk6hMoBtNNG/oreTR?=
 =?iso-8859-1?Q?vu8CVAF42b1bk3/wMp0yDvPCUlo77t2EZZ/IjVLlAis73E5nLusIHIUVCH?=
 =?iso-8859-1?Q?Zsgrd9/2Ty1twwT9mhFceIItUVHYTRXDN5/IfG6Kt5c73D/SOmZ2jnBzdU?=
 =?iso-8859-1?Q?vzLVUykaV7LFx+ynnF8F865zvBq8yjkysjX9W9A4pWJgqvu7yZpGX5ErLc?=
 =?iso-8859-1?Q?NWX3UmkaAlBLQeNDJ2ujRAyotH/NXsCxj7OAbctLqIWEQAu5kLli2ohB/p?=
 =?iso-8859-1?Q?KD3wf0edVjHbUKP4sJZ7YKbDr9KL7ug34G7GsktG3NflwDfrMwL266RGaf?=
 =?iso-8859-1?Q?NB0ZhyclU0XkT49fdvovaJXzFu2MeukDiPcvzxMu2DMzg2S3XjSQxNilBt?=
 =?iso-8859-1?Q?0fd5ilE86YXMlcWfeAjIPo9FbqQ9iIvISr2kZIwEIvrIsQXGj8+URtYFcy?=
 =?iso-8859-1?Q?1yuJ3wSyIycda4SSAFeI8JRrf5+dazaFUZ/EP6U20SgqtDwgIVIlQgyFp8?=
 =?iso-8859-1?Q?8NQPqr7Mwli22ENMBERD/5TMmiUv9cMeGwmu51mJUrXPEswpaKY2A1UJBn?=
 =?iso-8859-1?Q?H6RlQc0hP643qNHyRoCwLyBaf2IwBYjZrhxnZdCh4y2PKVByxUvjO3thDU?=
 =?iso-8859-1?Q?Xm5kp2Xc3qzEcI7JMZy9RbQUHQxjeBSWewEA6kQBOrR6Ws1JwcH94uRR6I?=
 =?iso-8859-1?Q?VjQ1q5+btdDvhxZjgTTJ5NHZ2b3MkdTCBSioTYN1dLpYG8ZrhV1tYlXe8k?=
 =?iso-8859-1?Q?shug46Lx9zzXtzuTQKM=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8218e584-488d-4eff-819a-08dcf2723b8b
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Oct 2024 08:19:21.8934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7iH4GvQWfBpFTKc+PgBhwFS4tXYcEiWR88rMq+a1F77wVjYyRcg+i6+s4V6uE3DvboKSzBOpVTVFdHcuBlze8V/79G5OKbGxVv9+MyUJP61CMmdNKEX6uV2T7uFX6o8q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2P287MB0522

Hi Krzysztof,=0A=
=0A=
>> Convert the text bindings of pinctrl-mcp23s08 to YAML so it could be use=
d to=0A=
>> validate the DTS.=0A=
>>=0A=
>=0A=
>You silently dropped several compatibles. Document clearly what and why=0A=
>you changed from original binding during conversion.=0A=
=0A=
Sure, will do it =0A=
=0A=
>> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
>> ---=0A=
>>=A0 .../bindings/pinctrl/pinctrl-mcp23s08.txt=A0=A0=A0=A0 | 148 ---------=
--------=0A=
>>=A0 .../bindings/pinctrl/pinctrl-mcp23s08.yaml=A0=A0=A0 | 153 +++++++++++=
+++++++=0A=
>=0A=
>Filename based on compatible, so microchip,mcp23s08.yaml.=0A=
=0A=
ok I will change.=0A=
=0A=
>>=A0 2 files changed, 153 insertions(+), 148 deletions(-)=0A=
>>=A0 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-=
mcp23s08.txt=0A=
>>=A0 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-=
mcp23s08.yaml=0A=
=0A=
...=0A=
=0A=
>> -};=0A=
>> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.=
yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml=0A=
>> new file mode 100644=0A=
>> index 000000000000..3904b8adba44=0A=
>> --- /dev/null=0A=
>> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml=0A=
>> @@ -0,0 +1,153 @@=0A=
>> +# SPDX-License-Identifier: GPL-2.0-only=0A=
>> +# Copyright 2024 Silicon Signals Pvt. Ltd.=0A=
>=0A=
>I don't see how Silicon signals contributed to original binding in=0A=
>a157789b78f4e95f5d66f8b564356e396716f67e and I feel above suggests it is=
=0A=
>a new work, not derivative. And if you claim this is not derivative=0A=
>work, then why not licensed as checkpatch asks? IOW, I suggest dropping=0A=
>copyright statement.=0A=
=0A=
sure, I will drop it.=0A=
=0A=
>> +%YAML 1.2=0A=
>> +---=0A=
>> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mcp23s08.yaml#=0A=
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
>> +=0A=
>> +title: Microchip I/O expander with serial interface (I2C/SPI)=0A=
>> +=0A=
>> +maintainers:=0A=
>> +=A0 - Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
>> +=0A=
>> +description: |=0A=
>=0A=
>Do not need '|' unless you need to preserve formatting.=0A=
=0A=
okay.=0A=
=0A=
>> +=A0 Microchip MCP23008, MCP23017, MCP23S08, MCP23S17, MCP23S18 GPIO exp=
ander=0A=
>> +=A0 chips.These chips provide 8 or 16 GPIO pins with either I2C or SPI =
interface.=0A=
>> +=0A=
>> +properties:=0A=
>> +=A0 compatible:=0A=
>> +=A0=A0=A0 enum:=0A=
>> +=A0=A0=A0=A0=A0 - microchip,mcp23s08=0A=
>> +=A0=A0=A0=A0=A0 - microchip,mcp23s17=0A=
>> +=A0=A0=A0=A0=A0 - microchip,mcp23s18=0A=
>> +=A0=A0=A0=A0=A0 - microchip,mcp23008=0A=
>> +=A0=A0=A0=A0=A0 - microchip,mcp23017=0A=
>> +=A0=A0=A0=A0=A0 - microchip,mcp23018=0A=
>> +=0A=
>> +=A0 reg:=0A=
>> +=A0=A0=A0 maxItems: 1=0A=
> >+=0A=
> >+=A0 gpio-controller: true=0A=
> >+=0A=
> >+=A0 '#gpio-cells':=0A=
> >+=A0=A0=A0 const: 2=0A=
> >+=0A=
> >+=A0 interrupt-controller: true=0A=
> >+=0A=
> >+=A0 '#interrupt-cells':=0A=
> >+=A0=A0=A0 const: 2=0A=
> >+=0A=
> >+=A0 interrupts:=0A=
> >+=A0=A0=A0 maxItems: 1=0A=
> >+=0A=
> >+=A0 reset-gpios:=0A=
> >+=A0=A0=A0 description: GPIO specifier for active-low reset pin.=0A=
> >+=A0=A0=A0 maxItems: 1=0A=
> >+=0A=
> >+=A0 spi-max-frequency:=0A=
> >+=A0=A0=A0 description: Maximum frequency for SPI devices.=0A=
>=0A=
>Drop, not needed. Is this a device on SPI bus? Then you miss ref to=0A=
>spi-peripheral-props.=0A=
=0A=
yes device is on SPI bus. I will add reference=0A=
=0A=
>> +=0A=
>> +=A0 microchip,spi-present-mask:=0A=
>> +=A0=A0=A0 description: |=0A=
>=0A=
>Do not need '|' unless you need to preserve formatting.=0A=
=0A=
sure,=0A=
=0A=
>> +=A0=A0=A0=A0=A0 SPI present mask. Specifies which chips are present on =
the shared SPI=0A=
>> +=A0=A0=A0=A0=A0 chipselect. Each bit in the mask represents one SPI add=
ress.=0A=
>> +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/uint8=0A=
>=0A=
>Where is the entire description from old binding?=0A=
=0A=
Okay I will add whole description=0A=
=0A=
>> +=0A=
>> +=A0 microchip,irq-mirror:=0A=
>> +=A0=A0=A0 type: boolean=0A=
>> +=A0=A0=A0 description: |=0A=
> >+=A0=A0=A0=A0=A0 Sets the mirror flag in the IOCON register. Devices wit=
h two interrupt=0A=
> >+=A0=A0=A0=A0=A0 outputs (these are the devices ending with 17 and those=
 that have 16 IOs)=0A=
> >+=A0=A0=A0=A0=A0 have two IO banks IO 0-7 form bank 1 and IO 8-15 are ba=
nk 2. These chips=0A=
> >+=A0=A0=A0=A0=A0 have two different interrupt outputs One for bank 1 and=
 another for=0A=
>> +=A0=A0=A0=A0=A0 bank 2. If irq-mirror is set, both interrupts are gener=
ated regardless of=0A=
>> +=A0=A0=A0=A0=A0 the bank that an input change occurred on. If it is not=
 set,the interrupt=0A=
>> +=A0=A0=A0=A0=A0 are only generated for the bank they belong to.=0A=
> >+=0A=
> >+=A0 microchip,irq-active-high:=0A=
> >+=A0=A0=A0 type: boolean=0A=
> >+=A0=A0=A0 description: |=0A=
> >+=A0=A0=A0=A0=A0 Sets the INTPOL flag in the IOCON register.This configu=
res the IRQ output=0A=
> >+=A0=A0=A0=A0=A0 polarity as active high.=0A=
> >+=0A=
> >+=A0 drive-open-drain:=0A=
> >+=A0=A0=A0 type: boolean=0A=
> >+=A0=A0=A0 description: |=0A=
> >+=A0=A0=A0=A0=A0 Sets the ODR flag in the IOCON register. This configure=
s the IRQ output as=0A=
> >+=A0=A0=A0=A0=A0 open drain active low.=0A=
> >+=0A=
> >+=A0 pinmux:=0A=
> >+=A0=A0=A0 type: object=0A=
> >+=A0=A0=A0 properties:=0A=
> >+=A0=A0=A0=A0=A0 pins:=0A=
> >+=A0=A0=A0=A0=A0=A0=A0 description: |=0A=
> >+=A0=A0=A0=A0=A0=A0=A0=A0=A0 The list of GPIO pins controlled by this no=
de. Each pin name corresponds=0A=
> >+=A0=A0=A0=A0=A0=A0=A0=A0=A0 to a physical pin on the GPIO expander.=0A=
> >+=A0=A0=A0=A0=A0=A0=A0 items:=0A=
> >+=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern: "^gpio([0-9]|[1][0-5])$"=0A=
> >+=A0=A0=A0=A0=A0=A0=A0 maxItems: 16=0A=
> >+=0A=
> >+=A0=A0=A0=A0=A0 bias-pull-up:=0A=
> >+=A0=A0=A0=A0=A0=A0=A0 type: boolean=0A=
> >+=A0=A0=A0=A0=A0=A0=A0 description: Configures pull-up resistors for the=
 GPIO pins.=0A=
> >+=0A=
> >+=A0=A0=A0 required:=0A=
> >+=A0=A0=A0=A0=A0 - pins=0A=
> >+=A0=A0=A0=A0=A0 - bias-pull-up=0A=
>=0A=
>This does not make much sense, why pull up is always required?=0A=
=0A=
Not always but you can configure as pull-up.=0A=
=0A=
If you suggest then I will give two different example in i2c, with or witho=
ut pull-up as old bindings had.=0A=
=0A=
and in pinmux I will add description for pull-up .=0A=
=0A=
=0A=
Best regards,=0A=
Himanshu=0A=
=0A=
> +=0A=
> +=A0=A0=A0 additionalProperties: false=0A=
> +=0A=
> +required:=0A=
> +=A0 - compatible=0A=
> +=A0 - reg=0A=
> +=A0 - gpio-controller=0A=
> +=A0 - '#gpio-cells'=0A=
> +=0A=
> +additionalProperties: false=0A=
=0A=
________________________________________=0A=
From:=A0Krzysztof Kozlowski <krzk@kernel.org>=0A=
Sent:=A022 October 2024 12:03=0A=
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
> Convert the text bindings of pinctrl-mcp23s08 to YAML so it could be used=
 to=0A=
> validate the DTS.=0A=
>=0A=
=0A=
You silently dropped several compatibles. Document clearly what and why=0A=
you changed from original binding during conversion.=0A=
=0A=
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> ---=0A=
>=A0 .../bindings/pinctrl/pinctrl-mcp23s08.txt=A0=A0=A0=A0 | 148 ----------=
-------=0A=
>=A0 .../bindings/pinctrl/pinctrl-mcp23s08.yaml=A0=A0=A0 | 153 ++++++++++++=
++++++=0A=
=0A=
Filename based on compatible, so microchip,mcp23s08.yaml.=0A=
=0A=
=0A=
>=A0 2 files changed, 153 insertions(+), 148 deletions(-)=0A=
>=A0 delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-m=
cp23s08.txt=0A=
>=A0 create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-m=
cp23s08.yaml=0A=
=0A=
...=0A=
=0A=
> -};=0A=
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.y=
aml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml=0A=
> new file mode 100644=0A=
> index 000000000000..3904b8adba44=0A=
> --- /dev/null=0A=
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mcp23s08.yaml=0A=
> @@ -0,0 +1,153 @@=0A=
> +# SPDX-License-Identifier: GPL-2.0-only=0A=
> +# Copyright 2024 Silicon Signals Pvt. Ltd.=0A=
=0A=
I don't see how Silicon signals contributed to original binding in=0A=
a157789b78f4e95f5d66f8b564356e396716f67e and I feel above suggests it is=0A=
a new work, not derivative. And if you claim this is not derivative=0A=
work, then why not licensed as checkpatch asks? IOW, I suggest dropping=0A=
copyright statement.=0A=
=0A=
> +%YAML 1.2=0A=
> +---=0A=
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mcp23s08.yaml#=0A=
> +$schema: http://devicetree.org/meta-schemas/core.yaml#=0A=
> +=0A=
> +title: Microchip I/O expander with serial interface (I2C/SPI)=0A=
> +=0A=
> +maintainers:=0A=
> +=A0 - Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>=0A=
> +=0A=
> +description: |=0A=
=0A=
Do not need '|' unless you need to preserve formatting.=0A=
=0A=
> +=A0 Microchip MCP23008, MCP23017, MCP23S08, MCP23S17, MCP23S18 GPIO expa=
nder=0A=
> +=A0 chips.These chips provide 8 or 16 GPIO pins with either I2C or SPI i=
nterface.=0A=
> +=0A=
> +properties:=0A=
> +=A0 compatible:=0A=
> +=A0=A0=A0 enum:=0A=
> +=A0=A0=A0=A0=A0 - microchip,mcp23s08=0A=
> +=A0=A0=A0=A0=A0 - microchip,mcp23s17=0A=
> +=A0=A0=A0=A0=A0 - microchip,mcp23s18=0A=
> +=A0=A0=A0=A0=A0 - microchip,mcp23008=0A=
> +=A0=A0=A0=A0=A0 - microchip,mcp23017=0A=
> +=A0=A0=A0=A0=A0 - microchip,mcp23018=0A=
> +=0A=
> +=A0 reg:=0A=
> +=A0=A0=A0 maxItems: 1=0A=
> +=0A=
> +=A0 gpio-controller: true=0A=
> +=0A=
> +=A0 '#gpio-cells':=0A=
> +=A0=A0=A0 const: 2=0A=
> +=0A=
> +=A0 interrupt-controller: true=0A=
> +=0A=
> +=A0 '#interrupt-cells':=0A=
> +=A0=A0=A0 const: 2=0A=
> +=0A=
> +=A0 interrupts:=0A=
> +=A0=A0=A0 maxItems: 1=0A=
> +=0A=
> +=A0 reset-gpios:=0A=
> +=A0=A0=A0 description: GPIO specifier for active-low reset pin.=0A=
> +=A0=A0=A0 maxItems: 1=0A=
> +=0A=
> +=A0 spi-max-frequency:=0A=
> +=A0=A0=A0 description: Maximum frequency for SPI devices.=0A=
=0A=
Drop, not needed. Is this a device on SPI bus? Then you miss ref to=0A=
spi-peripheral-props.=0A=
=0A=
=0A=
> +=0A=
> +=A0 microchip,spi-present-mask:=0A=
> +=A0=A0=A0 description: |=0A=
=0A=
Do not need '|' unless you need to preserve formatting.=0A=
=0A=
> +=A0=A0=A0=A0=A0 SPI present mask. Specifies which chips are present on t=
he shared SPI=0A=
> +=A0=A0=A0=A0=A0 chipselect. Each bit in the mask represents one SPI addr=
ess.=0A=
> +=A0=A0=A0 $ref: /schemas/types.yaml#/definitions/uint8=0A=
=0A=
Where is the entire description from old binding?=0A=
=0A=
> +=0A=
> +=A0 microchip,irq-mirror:=0A=
> +=A0=A0=A0 type: boolean=0A=
> +=A0=A0=A0 description: |=0A=
> +=A0=A0=A0=A0=A0 Sets the mirror flag in the IOCON register. Devices with=
 two interrupt=0A=
> +=A0=A0=A0=A0=A0 outputs (these are the devices ending with 17 and those =
that have 16 IOs)=0A=
> +=A0=A0=A0=A0=A0 have two IO banks IO 0-7 form bank 1 and IO 8-15 are ban=
k 2. These chips=0A=
> +=A0=A0=A0=A0=A0 have two different interrupt outputs One for bank 1 and =
another for=0A=
> +=A0=A0=A0=A0=A0 bank 2. If irq-mirror is set, both interrupts are genera=
ted regardless of=0A=
> +=A0=A0=A0=A0=A0 the bank that an input change occurred on. If it is not =
set,the interrupt=0A=
> +=A0=A0=A0=A0=A0 are only generated for the bank they belong to.=0A=
> +=0A=
> +=A0 microchip,irq-active-high:=0A=
> +=A0=A0=A0 type: boolean=0A=
> +=A0=A0=A0 description: |=0A=
> +=A0=A0=A0=A0=A0 Sets the INTPOL flag in the IOCON register.This configur=
es the IRQ output=0A=
> +=A0=A0=A0=A0=A0 polarity as active high.=0A=
> +=0A=
> +=A0 drive-open-drain:=0A=
> +=A0=A0=A0 type: boolean=0A=
> +=A0=A0=A0 description: |=0A=
> +=A0=A0=A0=A0=A0 Sets the ODR flag in the IOCON register. This configures=
 the IRQ output as=0A=
> +=A0=A0=A0=A0=A0 open drain active low.=0A=
> +=0A=
> +=A0 pinmux:=0A=
> +=A0=A0=A0 type: object=0A=
> +=A0=A0=A0 properties:=0A=
> +=A0=A0=A0=A0=A0 pins:=0A=
> +=A0=A0=A0=A0=A0=A0=A0 description: |=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 The list of GPIO pins controlled by this nod=
e. Each pin name corresponds=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 to a physical pin on the GPIO expander.=0A=
> +=A0=A0=A0=A0=A0=A0=A0 items:=0A=
> +=A0=A0=A0=A0=A0=A0=A0=A0=A0 pattern: "^gpio([0-9]|[1][0-5])$"=0A=
> +=A0=A0=A0=A0=A0=A0=A0 maxItems: 16=0A=
> +=0A=
> +=A0=A0=A0=A0=A0 bias-pull-up:=0A=
> +=A0=A0=A0=A0=A0=A0=A0 type: boolean=0A=
> +=A0=A0=A0=A0=A0=A0=A0 description: Configures pull-up resistors for the =
GPIO pins.=0A=
> +=0A=
> +=A0=A0=A0 required:=0A=
> +=A0=A0=A0=A0=A0 - pins=0A=
> +=A0=A0=A0=A0=A0 - bias-pull-up=0A=
=0A=
This does not make much sense, why pull up is always required?=0A=
=0A=
> +=0A=
> +=A0=A0=A0 additionalProperties: false=0A=
> +=0A=
> +required:=0A=
> +=A0 - compatible=0A=
> +=A0 - reg=0A=
> +=A0 - gpio-controller=0A=
> +=A0 - '#gpio-cells'=0A=
> +=0A=
> +additionalProperties: false=0A=
=0A=
=0A=
=0A=
Best regards,=0A=
Krzysztof=0A=

