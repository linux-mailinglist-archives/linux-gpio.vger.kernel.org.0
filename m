Return-Path: <linux-gpio+bounces-13864-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE19F0E14
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 14:57:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 25FA72835A2
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 13:57:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8BA11E47AD;
	Fri, 13 Dec 2024 13:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Ep/R5qpG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010049.outbound.protection.outlook.com [52.101.228.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3181E4113;
	Fri, 13 Dec 2024 13:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734098099; cv=fail; b=khJ+ZJp1eYgBX9SpBwRkbb9uAeAhy6mVj+MSDCKW3Ua6cQ635GBJnvwMmSjRv2xgX3d9Ou4tPaZm8u0oE7WmKCF4CwblJX2UWjnQrF5q0LD/QhJf7viWDT9qak/n+qOsIcIU8eCu0tkJCO0MwPl6o1XkJx8UklIziQm8qHKSkTU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734098099; c=relaxed/simple;
	bh=+glrUy2dZMhWstG/mOY1i13iLmvu2/OU+3hoU0KgZDs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T3+WVArBuWHleQQvUilbv2mIy02Va0U3fF7xeC9TcarrHRJuji5bXSJN+c/UY2UDtzDpwEBh8qVXWwcjHkYJ/PPG09KfPdw0Ey5VJ1ETBqxcU5IrZgGRPld7oBHl8Qly02lzIyPDxZYU0yr765KbFdWc++62wOYb8SAi/SIC1iA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Ep/R5qpG; arc=fail smtp.client-ip=52.101.228.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m7j2hhk3nr50SYaeu/oXfWDwU2Yab0ngDy4d5NS8Ot3FbJx6QkOyY1QtsEr5lJ0weBltoq6m5+8XaLzLPORgpw5kxnscpzpJoSPWmmUd6myuiMJNagOtSxFKBp1JeKrmL3WzltTQ4U8wwFOsmua/76SAx7zM9UJby4wAyM18ve/WYRgWii3uMaIxlZP+mUynrzAz7+4UFDuY+Rr79X3hUKKIOua95EWhP5e1yvJmd7A53OT6TsZtbkPPbbDkbYJVbc+AIT4y57FD2/bUTW/qFs1hV2kUgn7p0ss8o3tYZGVVRbaxS6fGBzZuI+v/MftouBcIKHU8scyRXX0N9narNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+glrUy2dZMhWstG/mOY1i13iLmvu2/OU+3hoU0KgZDs=;
 b=xz9GzFaa4oEbjdDiidiX+ci9i5pHIqzqS+fyD9pADleGfzessfq6pJFh2tZNKZHVBQ54wXXWx/C3Ty0YQvJr5m/m3KN3bLl40p725lYZmXsxoG7kjrPwq/AnEJUZcDTXIcA6cSMJyM+R7qkw6z9PAQtbywgWN1jBNkuyh1OO3LQqFyv9gSsNACQJYHLKL2GFRChSdsIW4nozV9hX5m5rNmp1GeZARXP+fSgTpTZPuUdH/l+GDpUY2+yYEO9bM7pLmBfOTX3ASoUVATRPCFHAWK00WGzII8RyPMWljKrWLHwXCu9mX1bDQJs4wW0CzesvwI5sENhnQLdoZ2MMaxbw3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+glrUy2dZMhWstG/mOY1i13iLmvu2/OU+3hoU0KgZDs=;
 b=Ep/R5qpGloVDVcMgtsdd0Ik5PxVBQjQFgVLAVwZvgul4kLByO/ph8mp0GNAfmPwZqb+mbSPMYQkdMsZ8zp/iIpK+14F4O+36YlAMb/UFPuDYIdZf60xGrNN4XlXYTGDsBpydVyNzX0KTUYYowHTRHmTW+9To4Gz4av3yKM0NYkw=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TYYPR01MB15116.jpnprd01.prod.outlook.com (2603:1096:405:1a4::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 13 Dec
 2024 13:54:52 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::86ef:ca98:234d:60e1%5]) with mapi id 15.20.8251.015; Fri, 13 Dec 2024
 13:54:45 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, biju.das.au
	<biju.das.au@gmail.com>, Prabhakar Lad <prabhakar.csengg@gmail.com>
Subject: RE: [PATCH v2 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E SoC
Thread-Topic: [PATCH v2 1/4] dt-bindings: pinctrl: renesas: Document RZ/G3E
 SoC
Thread-Index: AQHbR8jxyHiCFtkWikypg4nDPYeAkLLi1aUAgAAKVwCAARASgIAASGSg
Date: Fri, 13 Dec 2024 13:54:45 +0000
Message-ID:
 <TY3PR01MB113469E561B328EC873309AA886382@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20241206102327.8737-1-biju.das.jz@bp.renesas.com>
 <20241206102327.8737-2-biju.das.jz@bp.renesas.com>
 <CAMuHMdVWaVscNyhsN3eKC2EqQc_Hp3kALiLso+4AOic6huMAXA@mail.gmail.com>
 <TY3PR01MB11346DBB1BEBA02B8AE3B4A43863F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <CAMuHMdV11F7QGXCzo=wa10AOSdvXBZ_40JCRObxja3xHZoDb_g@mail.gmail.com>
In-Reply-To:
 <CAMuHMdV11F7QGXCzo=wa10AOSdvXBZ_40JCRObxja3xHZoDb_g@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TYYPR01MB15116:EE_
x-ms-office365-filtering-correlation-id: 9d4089b8-e338-4e03-43e9-08dd1b7db3b9
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?b3RNdXpGZlE3QWNmeGM3LytuZzNHd2VtSUx4MURpQWdhR1l6cE55NWM5TWlR?=
 =?utf-8?B?SENTcXd4ZmNSd3Jtb01zUDN2bmJMeC9qcDg1ZkFEVk9JaFhoV3A5blgxeldh?=
 =?utf-8?B?amszUUxaYW5lQ1dTVy9mV0FHN0hyYjhnRm9weDBxdFhia0J0OU5hbDhqRzVa?=
 =?utf-8?B?Y3o4dDBEWFlBdDdaTTBMZlZHemlhTGM3cXZQZjNyOTJPdWdwRi9yeUMrZk5M?=
 =?utf-8?B?NGp6Mi92VVB3cnhjWisxdzNPMWhBMFhMWDl2aENnbU4zdDhjNm1UY2xPZ3NS?=
 =?utf-8?B?NmxCMDJwN2tWZ3NQY09uOXZOOFhxTGt3MlA5R3VwWEtoTXNXS05HUzNzbElq?=
 =?utf-8?B?Z3RLOU94ME5tK2dwZHhmK1VrbWVUQXc2cGd6bktGWS9tKzhlRXZjUnVvN0w0?=
 =?utf-8?B?SHBQenhyMGhkV3A5YkdxN0s1M1ZIYkhnRm83aklhTkl6dUVkK0J0dUpMMlJT?=
 =?utf-8?B?cTREMDVvbGNicXk0RC8zL1hHbldzY3JZOG85aHZReWNSS1hlQnZTdzljTC9Z?=
 =?utf-8?B?bGRNQjhPTVdBR0U0Z01sN01NTjJjOGZaY3daRTdvbDFwQUVTeEJza1prMG95?=
 =?utf-8?B?Ym9pKzRuVnhlMWhiV1ZPZ1V4TDZld1YwVjkvWlVTcTdaZHVibVJoN2NxbzhI?=
 =?utf-8?B?ZXRLb2tVVHk0U2luNzA3L0pzQnFoVENrUlJ3SndGbmZzR3R3WCtEU0ZGUEF0?=
 =?utf-8?B?eXVjdk9wVnhyWmRvNTZncWh6Nlo3Y3I1YXU4SEdudG55QUFORVhIeW9yT2lr?=
 =?utf-8?B?NElJNFZrVXlvN0NFYkUxSHpCMHV1aUE3UjZKY2xlWU0ydk5jOHZSQVlTaTI5?=
 =?utf-8?B?Z2Z1eTNTaDNQN2I4Y3lRcVVkblpqVkNNUjN3VzBWUVlGTXFsQWdjMjVvVnQ4?=
 =?utf-8?B?Snd4NmVqT2orN0txdHJuRXc4TCs2WGxLNFZpQjZkeS9aT0w3S2RldVR0Lys4?=
 =?utf-8?B?SU5ueEtpbjJFdEpxdS9mRzdRdlRrWDlDdTJWcW9IbFBOcUNzbzlxbXZ0b1c1?=
 =?utf-8?B?VHV0UXozaE1sQ3hKeHdKc3MvbW5jaWN0THZrSVBnSVpXNWZxd2NUT3Axa3U0?=
 =?utf-8?B?ZU1nam1oSm1GUUhXRk5ETlh1WHFNclBhTjY0dC81b2pLWW0ySmVCQWVhZzRn?=
 =?utf-8?B?OGxSNzdHUXZpM2ZXY2V1N2RTWkpXZWN1cC9zMjBWZS9rMEQrRTgwMjBJTWd5?=
 =?utf-8?B?a0QzWktCMERyM2lFR2c0US9rK0tHaGxQem1Bek1JVTBMM2tqRjFOVnZyczFs?=
 =?utf-8?B?cmRVNXJhbkdCQVNpZ01sUFBOM2hvSWVFR1NSTU4zdUN3MEtadWE5R0pIa3Zq?=
 =?utf-8?B?WmFzbE94enZObmtSRXJBZlRlRXpMZzhFb25TRlRXR205U1FmOE5seE0vekly?=
 =?utf-8?B?T3lZdy9xNmJGMWUzWHFOditSTDFia3EzTjJFc1lDclRadGpxWE5JVFZxRm5z?=
 =?utf-8?B?R2pjbDlsUDFKaXRHWG92WUNLcGdYUyt5RVVHcU5qd0JPeWJuRUZLOVdWU3M2?=
 =?utf-8?B?d1JqdlpEUEk4aGI2ZmRBRkFIM2h3WEFtdngybDBNMUhEWTJUN1FkcHBjNC9y?=
 =?utf-8?B?bzRlTXFkZDBjay9GSHlTSmE0amZpNk5nRzJ1YythMXp2Zk5JbEEwalBnd3Bo?=
 =?utf-8?B?KytuTE95Qjl0RExBWUg1MVdsVm5aUVYvL2w1cnZnTUFCZ0tyZWdGRHJOWjg2?=
 =?utf-8?B?VFVacWpHc0hTdVFPTkNyWTdkQ0VrR2h1QkcxRjNjdU5LWFRzNUZYb1VDcFdJ?=
 =?utf-8?B?ZTVqT0RqNy9lSlVXcW13bDlKV0JrQ0pEY00vTWc2eXpsMFo0RmJLOGxadjZJ?=
 =?utf-8?B?V0xrdFNuN3VpeXVxSzVISWxvcHRPeVIwQnRmUnM1N3VrVS94ZFdJaXd0NUti?=
 =?utf-8?B?MWNlbnlTaXA5bDVDTjgramNrQTQ0UGo3NktrUWs1S0R1dzRWSHA5Vjh4Z2hF?=
 =?utf-8?Q?J+gJ8lo9GZ4Mx4gOo9Jw1M+BUeV2XcBz?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RU5lOWVJc0FjUEp5S2lGSGF3VUJRYll3U2JCVGRxSU9CSFkyekhXUm1NbVU0?=
 =?utf-8?B?MlRFWTRxUDJhNXd4c0VZOHk5QW1IT09sOUs4UEp6cXZoQTVIb0NyUGNWek5N?=
 =?utf-8?B?OVExbEVNcitlUmdTZjRDejlQU01BOFJna0tXOTFQcXJLQnM2NjROcUpnQ04y?=
 =?utf-8?B?K2hCL2tGZzdtenFlaS8wLzI3enFPS1lzZk01dHlncnVVRXZPM3FsY3hHZDNV?=
 =?utf-8?B?ZzFDRnlYamdtallqS0JxWkRndkZCdmFSVVBaUXVxRDN6elk2YlVHSGtUSUpa?=
 =?utf-8?B?MUZmWnhzQTNoRUZaeWpRTDlIdVJsQnJGbDVTUEY1ejl0NFFnQVVETUwzR0ps?=
 =?utf-8?B?Q2NQQmkwa0p4TUxMeDFmMVNJT1p4dHZiNEF1L3g2SnB5eUorMC9GbkRxd3ZV?=
 =?utf-8?B?VTd2VmNXdU53QXVMYnplMEovUVMwTTBxeGl2bCswcDFZN1UzNGovN29wN2xJ?=
 =?utf-8?B?aVVPVTJxQllnMUlqVTBGLzgyN3NweGZsMDRsNStzdEVBaE15ZUtxQWRXc0Ra?=
 =?utf-8?B?UkUzNU5JWjdxZmZkN0JtRElETk40eWcyZWx1MkcwemZuQ0dhZUdMc2dGU3Jy?=
 =?utf-8?B?THBnYVo1SHFPMUxhdDVMWkEzTFRlSDBFeUFRVnNwbndEWXpNeXhNbVdNSDQ4?=
 =?utf-8?B?ajJNWVlaQ0xKU2xUNjlTOWx0UExSaE1RbGpybzMvVUppQ04vRjRSaUpkaUxh?=
 =?utf-8?B?cHRwMVNDUW5hL2NRbEVFUFNEMEhEWUNJUzRIT0xOSXExNzU4WTJmalRSRklS?=
 =?utf-8?B?L3l5S21iQVlVdG9KUGdLaFhpNkFZdEpuU2NmNmhMK29yemwvZ2I5NFJwN1dJ?=
 =?utf-8?B?djFDY0JQZlA1cXpmMXU4NUtMaXBPZ3RETHEyY3BCbVN1eElURXozVDBqS3Zo?=
 =?utf-8?B?YlZHa2dWb1BIUHpCNENLTUxFdG54bUhLdk9CcmNuS1lkandQTmpUUElUVndj?=
 =?utf-8?B?eCtxWERpaXFMNGFiVEFFSHpRbWNucWdpSmVYRzVENHNxWkxiaFMyTUhraXg3?=
 =?utf-8?B?ZkY0NXd3K2toUzI1VUdkbVE4cG9xZnJsdkc3K0ZHOVk3cXJmenRHMFJCeEl5?=
 =?utf-8?B?R0ltRE1MaEFwN2tSRmFWaVVHT0lSSEl0d3JPemNMLzhKaTc5a2drRWFmU2ky?=
 =?utf-8?B?M1dlSGhDT1dRL0tkUXNrNzd0RytOMW9Da3NwZFA4L3JCR3FnZEQ3NUNnRTcz?=
 =?utf-8?B?bGdvb2FhaE1Jb1hLSDl0R1c4bm1KK2xmaDBWMGFTaXVFMEJ0aEVnRGpqNG84?=
 =?utf-8?B?d1pRQ210OG4xQnBBeXN2UCtEdTNpOWI3RWg5RDZVYkphZFh3UEc3OXRlSkRm?=
 =?utf-8?B?bHFXWEpkQVFZeG5peEtCMUJGdmhka3g2WkhBcFNoMzNJTlRHTWs3cytKWGNY?=
 =?utf-8?B?NWF5MTBSOEI3ZnB3Z1pXbmRwWmZQc3FHNW9MKysvVktiMzNpa0hSSE1aYlJ4?=
 =?utf-8?B?ckc5cS9FZkpEWC9WWXFFaDhqb2dLVmJNeU9hRC9IK2kvZFBRcys0YThZdGtp?=
 =?utf-8?B?SXFWQVFOTm5ORUI3WlNHamZCNlRmVktuZExmc2dLZnRPSzMzZXFlQmlaelpB?=
 =?utf-8?B?azJDOVFkeDR6OUl6WkZCS1MyS3doYzg4aEVicU1FcU9TZFRvL0FQVldSeUJ6?=
 =?utf-8?B?cUVSUEQzMTl2aTk0ekhuQmU3V0Foc1pPZU1pRnkyejZoZy9JMU5Tb3BoL3hX?=
 =?utf-8?B?RVo2WmFRRFZ2MGdHVVh5dFlsbFZ5c01WMGdDYzdLNVpab1hPRUgrWDNpbk0y?=
 =?utf-8?B?U01jVVVwbzIyb1Y3MVdFZUVWYTdxVGVib1lHSWFybE8vbzcyQnpYRUxSUG9F?=
 =?utf-8?B?dlNzd0pLOUx0bThZRWlpMWtmbWQ5TnFRSDVPYklmVDFDaXJaemR4bUF1d0Er?=
 =?utf-8?B?MnMzMzdtMjFDWmZiQmFVcmhrZC9GSm1oUk84bWpvbUtSVjZRQTBvOUhkTnAv?=
 =?utf-8?B?aE03cFZWV211bXVwSUZZT3MwZG5DS1JXY01pb1NoNk42UjM0Y2VKTS93Yk1H?=
 =?utf-8?B?bHJtYkVIYVMzVFRJSXdpZmVBcUl2NnhrTlFEWVBoSDJkUTR0QUt5T0tUL05l?=
 =?utf-8?B?VHpYV3NkS1phUnhNL09CUnJUVTBpSzhkdkZhL0ltdXlqNHBzZE5mWmVCZVlN?=
 =?utf-8?B?WERFcXpXQXVYbTJhMjVVQ2tma01zSFllZlpCa2xHYUlsUnV6dStBdzhJWnJR?=
 =?utf-8?B?S2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d4089b8-e338-4e03-43e9-08dd1b7db3b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2024 13:54:45.6567
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 93Qex+g3/UEtnVKFeua5PHPbFl3L/pu1COBvSBdUFSbP27c6mItH+zuM9Eb194XZ0vE1fJOA5+LWOcGxtrJSgWDrxNKMWJWbla03whJdxFo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB15116

SGkgR2VlcnQsDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNrLg0KDQo+IC0tLS0tT3JpZ2luYWwg
TWVzc2FnZS0tLS0tDQo+IEZyb206IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnRAbGludXgtbTY4
ay5vcmc+DQo+IFNlbnQ6IDEzIERlY2VtYmVyIDIwMjQgMDk6MTcNCj4gU3ViamVjdDogUmU6IFtQ
QVRDSCB2MiAxLzRdIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiByZW5lc2FzOiBEb2N1bWVudCBSWi9H
M0UgU29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gVGh1LCBEZWMgMTIsIDIwMjQgYXQgNjox
NeKAr1BNIEJpanUgRGFzIDxiaWp1LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gPiA+IFNlbnQ6IDEyIERlY2VtYmVyIDIwMjQg
MTY6MjcNCj4gPiA+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjIgMS80XSBkdC1iaW5kaW5nczogcGlu
Y3RybDogcmVuZXNhczogRG9jdW1lbnQNCj4gPiA+IFJaL0czRSBTb0MNCj4gPiA+DQo+ID4gPiBP
biBGcmksIERlYyA2LCAyMDI0IGF0IDExOjIz4oCvQU0gQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJw
LnJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gQWRkIGRvY3VtZW50YXRpb24gZm9yIHRoZSBw
aW4gY29udHJvbGxlciBmb3VuZCBvbiB0aGUgUmVuZXNhcw0KPiA+ID4gPiBSWi9HM0UNCj4gPiA+
ID4gKFI5QTA5RzA0NykgU29DLiBUaGUgUlovRzNFIFBGQyBpcyBzaW1pbGFyIHRvIHRoZSBSWi9W
MkggU29DIGJ1dA0KPiA+ID4gPiBoYXMgbW9yZSBwaW5zKFAwMC1QUzMpLiBUaGUgcG9ydCBudW1i
ZXIgaXMgYWxwaGEtbnVtZXJpYyBjb21wYXJlZA0KPiA+ID4gPiB0byB0aGUgbnVtYmVyIG9uIHRo
ZSBvdGhlciBTb0NzLiBTbyBhZGQgbWFjcm9zIGZvciBhbHBoYS1udW1lcmljIHRvIG51bWJlciBj
b252ZXJzaW9uLg0KPiA+ID4gPg0KPiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCaWp1IERhcyA8Ymlq
dS5kYXMuanpAYnAucmVuZXNhcy5jb20+DQo+IA0KPiA+ID4gPiAtLS0gYS9pbmNsdWRlL2R0LWJp
bmRpbmdzL3BpbmN0cmwvcnpnMmwtcGluY3RybC5oDQo+ID4gPiA+ICsrKyBiL2luY2x1ZGUvZHQt
YmluZGluZ3MvcGluY3RybC9yemcybC1waW5jdHJsLmgNCj4gPiA+ID4gQEAgLTExLDEzICsxMSwz
OCBAQA0KPiA+ID4gPg0KPiA+ID4gPiAgI2RlZmluZSBSWkcyTF9QSU5TX1BFUl9QT1JUICAgIDgN
Cj4gPiA+ID4NCj4gPiA+ID4gKyNkZWZpbmUgUlpHM0VfUDAgICAgICAgICAgICAgICAwDQo+ID4g
PiA+ICsjZGVmaW5lIFJaRzNFX1AxICAgICAgICAgICAgICAgMQ0KPiA+ID4gPiArI2RlZmluZSBS
WkczRV9QMiAgICAgICAgICAgICAgIDINCj4gPiA+ID4gKyNkZWZpbmUgUlpHM0VfUDMgICAgICAg
ICAgICAgICAzDQo+ID4gPiA+ICsjZGVmaW5lIFJaRzNFX1A0ICAgICAgICAgICAgICAgNA0KPiA+
ID4gPiArI2RlZmluZSBSWkczRV9QNSAgICAgICAgICAgICAgIDUNCj4gPiA+ID4gKyNkZWZpbmUg
UlpHM0VfUDYgICAgICAgICAgICAgICA2DQo+ID4gPiA+ICsjZGVmaW5lIFJaRzNFX1A3ICAgICAg
ICAgICAgICAgNw0KPiA+ID4gPiArI2RlZmluZSBSWkczRV9QOCAgICAgICAgICAgICAgIDgNCj4g
PiA+ID4gKyNkZWZpbmUgUlpHM0VfUEEgICAgICAgICAgICAgICA5DQo+ID4gPiA+ICsjZGVmaW5l
IFJaRzNFX1BCICAgICAgICAgICAgICAgMTANCj4gPiA+ID4gKyNkZWZpbmUgUlpHM0VfUEMgICAg
ICAgICAgICAgICAxMQ0KPiA+ID4gPiArI2RlZmluZSBSWkczRV9QRCAgICAgICAgICAgICAgIDEy
DQo+ID4gPiA+ICsjZGVmaW5lIFJaRzNFX1BFICAgICAgICAgICAgICAgMTMNCj4gPiA+ID4gKyNk
ZWZpbmUgUlpHM0VfUEYgICAgICAgICAgICAgICAxNA0KPiA+ID4gPiArI2RlZmluZSBSWkczRV9Q
RyAgICAgICAgICAgICAgIDE1DQo+ID4gPiA+ICsjZGVmaW5lIFJaRzNFX1BIICAgICAgICAgICAg
ICAgMTYNCj4gPiA+ID4gKyNkZWZpbmUgUlpHM0VfUEogICAgICAgICAgICAgICAxNw0KPiA+ID4g
PiArI2RlZmluZSBSWkczRV9QSyAgICAgICAgICAgICAgIDE4DQo+ID4gPiA+ICsjZGVmaW5lIFJa
RzNFX1BMICAgICAgICAgICAgICAgMTkNCj4gPiA+ID4gKyNkZWZpbmUgUlpHM0VfUE0gICAgICAg
ICAgICAgICAyMA0KPiA+ID4gPiArI2RlZmluZSBSWkczRV9QUyAgICAgICAgICAgICAgIDIxDQo+
ID4gPg0KPiA+ID4gVGhpcyBtYXBzIHRoZSBkaXNjb250aWd1b3VzIGFscGhhLW51bWVyaWNhbCBw
b3J0IG5hbWUgcmFuZ2UgdG8gYSBjb250aWd1b3VzIG51bWVyaWNhbCByYW5nZS4NCj4gPiA+IEFz
IHRoZXJlIGFyZSBjb3JyZXNwb25kaW5nIGhvbGVzIGluIHRoZSByZWdpc3RlciBsYXlvdXQsIEkg
YW0gbm90IHN1cmUgc3VjaCBhIG1hcHBpbmcgaXMgYSBnb29kDQo+IGlkZWEuDQo+ID4NCj4gPiBJ
ZiBJIG1ha2UgY29udGlndW91cyBhbHBoYS1udW1lcmljYWwgcG9ydCBuYW1lIHJhbmdlIHRvIGEg
Y29udGlndW91cyBudW1lcmljYWwgcmFuZ2UuDQo+ID4gR1BJTyByYW5nZXMgaW5jcmVhc2VzIGZy
b20gMTcyLT4yMzIuIHRoYXQgaXMgdGhlIHJlYXNvbiBmb3IgbWFraW5nDQo+ID4gZXhhY3RseSBw
b3J0cyBkZWZpbmVkIGluIGhhcmR3YXJlIG1hbnVhbCB0byBjb250aWd1b3VzIG51bWVyaWNhbCBy
YW5nZS4NCj4gDQo+IFRydWUuIFdlIGRvIGhhdmUgKHNtYWxsZXIpIGdhcHMgYWxyZWFkeSwgYXMg
bm90IGFsbCBwb3J0cyBoYXZlIDggR1BJT3MuDQoNCk9rLg0KDQo+IA0KPiA+ID4gV2hhdCBpZiBh
IGZ1dHVyZSB2YXJpYW50IChvciBhIGZ1dHVyZSBkb2N1bWVudGF0aW9uIHVwZGF0ZSkgZXhwb3Nl
cyB0aGUgcG9ydHMgaW4gYmV0d2Vlbj8NCj4gPg0KPiA+IElmIGEgZnV0dXJlIHZhcmlhbnQgb3Ig
dG8gYWNjb21tb2RhdGUgUlovVjJILCBjb250aWd1b3VzDQo+ID4gYWxwaGEtbnVtZXJpY2FsIHBv
cnQgbmFtZSByYW5nZSB0byBhIGNvbnRpZ3VvdXMgbnVtZXJpY2FsIHJhbmdlIHdpbGwNCj4gPiBi
ZSBiZXR0ZXIsIGlmIHdlIHBsYW4gdG8gc3VwcG9ydCBwb3J0cyBhcyBhbHBoYSBudW1lcmljIGFz
IG1lbnRpb25lZCBpbiB0aGUgaGFyZHdhcmUgbWFudWFsLg0KPiA+DQo+ID4gT3RoZXIgb3B0aW9u
IGlzIGp1c3QgdXNpbmcgbnVtYmVycy4NCj4gPg0KPiA+IFBsZWFzZSBsZXQgbWUga25vdyB5b3Vy
IHByZWZlcmVuY2UNCj4gPg0KPiA+IDEpIGRpc2NvbnRpbnVvdXMgYWxwaGEtbnVtZXJpY2FsIHBv
cnQgbmFtZSByYW5nZSB0byBhIGNvbnRpZ3VvdXMgbnVtZXJpY2FsIHJhbmdlLg0KPiA+IDIpIGNv
bnRpZ3VvdXMgYWxwaGEtbnVtZXJpY2FsIHBvcnQgbmFtZSByYW5nZSB0byBhIGNvbnRpZ3VvdXMg
bnVtZXJpY2FsIHJhbmdlLg0KPiA+IDMpIEp1c3QgdXNlIG51bWJlcnMgbGlrZSB0aGUgb25lIHVz
ZWQgaW4gUlovVjJIIE9yIDQpQW55IG90aGVyIHNtYXJ0DQo+ID4gd2F5IG9mIGhhbmRsaW5nIHRo
aXMuDQo+IA0KPiBBdCB0aGUgbG93ZXN0IGxldmVsLCAyIGFuZCAzIGFyZSB0aGUgc2FtZSBzb2x1
dGlvbi4NCj4gSSB0aGluayB1c2luZyB0aGUgbnVtYmVycyBmcm9tIHRoZSBoYXJkd2FyZSBtYW51
YWwgKHdoaWNoIG1hdGNoIHRoZSBoYXJkd2FyZSByZWdpc3RlcnMgaW5kaWNlcykgaXMgdGhlDQo+
IHNhZmVzdCBzb2x1dGlvbi4NCj4gQW5kIHRoZSBSWkczRV97UE9SVF9QSU5NVVgsR1BJT30oKSBt
YWNyb3MgYmVsb3cgaW1wcm92ZSB0aGUgdXNlciBleHBlcmllbmNlLCBieSByZXRhaW5pbmcgdGhl
IGFjdHVhbA0KPiBhbHBoYS1udW1lcmljYWwgbmFtZXMuDQo+IA0KPiBCVFcsIGhhdmUgeW91IGNo
ZWNrZWQgdGhlIG5vbi1kb2N1bWVudGVkIHJlZ2lzdGVycyBpbiB0aGUgZ2FwcywgaS5lLg0KPiBk
byB0aGVpciB2YWx1ZXMgbG9vayBsaWtlIHRoZXkgYXJlIGJhY2tlZCBieSBoYXJkd2FyZSBibG9j
a3M/DQoNCkZvciBSWi9HM0U6DQpBcyBwZXIgVGFibGUgNC4yLTYgQ29ycmVzcG9uZGluZyBQaW5z
IGFuZCBPZmZzZXQgQWRkcmVzc2VzIG9mIFBGQ19QX21uDQp4PSBwaW5zIGZyb20gMC4uNw0KDQow
eDIwLTB4MjggLS0+IFAweCAtIFA4eA0KMHgyQS0weDJGIC0tPiBQYXggLSBQRngNCjB4M0EtMHgz
MSAtLT4gUEd4IC0gUEh4DQpHYXAoUG9zc2libHkgUEl4KQ0KMHgzMy0weDM2IC0tPiBQSnggLSBQ
TXgNCkdhcCAoUG9zc2libHkgUE54LCBQT3gsIFBQeCwgUFF4LCBQUngpDQoweDNDIC0tPiBQU3gN
Cg0KRm9yIFJaL1YySDoNCjB4MjAtMHgyQiAtLT4gUDB4LVBCeA0KDQpSZWdpc3RlciBvZmZzZXQg
PSAweDIwICsgQWxwaGEtbnVtZXJpYyAoMC4uOSwgQS4uWn0NCg0KT0ssIGFzIHlvdSBzdWdnZXN0
ZWQsIHdpbGwgdXNlIHRoZSBudW1iZXJzIGZyb20gaGFyZHdhcmUgbWFudWFsIGFuZCBSWkczRV97
UE9SVF9QSU5NVVgsR1BJT30oKSBtYWNyb3MuDQoNCg0KPiBJIHdvdWxkbid0IGJlIHN1cnByaXNl
ZCBpZiB0aGV5IGRvIGV4aXN0LCBhbmQgYXJlIHJlc2VydmVkIGZvciB1c2UgYnkgdGhlIENNMzMs
IE5QVSwgb3Igc29tZSBvdGhlcg0KPiBub24tZGlzY2xvc2VkIHByb2Nlc3NpbmcgY29yZS4NCj4g
T3IgcGVyaGFwcyB0aGVyZSBpcyBhIG5vbi1wdWJsaWMgdmFyaWFudCBpbiBhIHBhY2thZ2Ugd2l0
aCBtb3JlIHBpbnM/DQoNClBpbnMgYXJlIGZpeGVkIGFzIHBlciB0aGUgZXhjZWwgc2hlZXQuDQoN
Cj4gDQo+IEJUVywgdGhlIHNlbnRlbmNlIGFib3V0IElSUTAgcGlubXV4aW5nIG9uIHBhZ2UgMzEy
IHJlZmVycyB0byBQOTAsIHdoaWNoIGRvZXMgbm90IGV4aXN0LiBJbiBmYWN0IG5vbmUNCj4gb2Yg
dGhlIHJlZmVycmVkIHBpbnMgY2FuIGJlIG11eGVkIHRvIElSUTAgb24gUlovRzNFLg0KDQpJIGd1
ZXNzIGl0IGlzIGN1dCArIHBhc3RlIGVycm9yIGZyb20gUlovVjJILiBUaGFua3MgZm9yIHBvaW50
aW5nIG91dCwgd2lsbCBjcmVhdGUgYSB0aWNrZXQNCndpdGggUkVMIGZvciBmaXhpbmcgdGhpcyBp
c3N1ZS4NCg0KQ2hlZXJzLA0KQmlqdQ0K

