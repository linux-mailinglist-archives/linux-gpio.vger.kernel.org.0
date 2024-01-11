Return-Path: <linux-gpio+bounces-2141-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDF782B357
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 17:52:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7C3E928B4E4
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 16:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1041E50274;
	Thu, 11 Jan 2024 16:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cognex.com header.i=@cognex.com header.b="gmaK+74w"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2096.outbound.protection.outlook.com [40.107.94.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE9C550267
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 16:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cognex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cognex.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ad7B/GLgMU6woKHCD5Yzh6qy9/T0AW60dkoIFcADKtP7vLf6afEItMAhKoJCWT7wfJ2OnE/1+8ugAOWxuo3OGS9L0USx3x/ke/FJvRtbpkpC5mfMVnbCHnB1O4Nws6qkKQ0+WZNzRJLxdXIcwk6wnkGIWZUn36nosndoEnvsq5e7q+11KdeylqwdqNhLW1Vls67P2qy43dZjWQ7SCJtvMD1atdtOUMx92E+ymUc1aqhpElHgohfo/awuzg/JoNpDDgriPUBLNcQzWpUQ5NafnA/pSst6mB6uNO5xWO6oquC3EhyIkIIqSWQTmELND/cOCA+VaRhjtcP2m8xG6JpxbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjG8d3X2YutNh+p0EUh43c53m3S7AcNZ1IEANC9t1sw=;
 b=EmehmODptWPaDtEyvXAcQLqm79BgSchmj1cCgs7agD0srPccUq61dMNnPGAvYHjT1sNMMpystxj6Lfh49mUkOiSM8U2YK30EVP+PtEYoXHamSCLQKvjgtMyBWscNRHEIm2F5FtcBjBGbIdw3+Q9XeAmrFIGT+WIlmKgW8e4RSuNCkxfk6gwHiKYmGSRlh8CubrHfPHj9JHqYC18Po2fY+tLYInr4nKOR0bxyD3n+kOjTsjEOPBkmTpF4F9cgMjzbRAUf8aKq/mc2keepVFo2d6bRirKbvewJVnoNYQ1L+xJrEjOIbdhDXUJbMam9P5T+qKz+awSEDltoQnSwekBlMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cognex.com; dmarc=pass action=none header.from=cognex.com;
 dkim=pass header.d=cognex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cognex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjG8d3X2YutNh+p0EUh43c53m3S7AcNZ1IEANC9t1sw=;
 b=gmaK+74wDsk/5dIqgbPE/e1I31QrjXGS8+lfA2KiQt8W5mwW5HBSrCILoFH1aIgUOgvlR8fdedtWkmJa3bfl9IMEKtEQjkawQgAPL8eDmFQKZepDDlhZ95yajsHvhLGAuzpAwN1z/I1aqtqcLXbpmy/+3akdX+JI+eEW3RszS5XhIiDMKRCGi0FIehfPHCjPTGFbELdEIdCu6BhnikwshZ2ERxyAVkQ8aDry6llP7oTmY6KpI7lsHFiO3rXT3YD/SwygC5FbsMCY8hRhPCuLTAybZmXiE8JArLzHGaA5MfSuK2+T6FWMcgQtybC3Q18jdl6vWyr/Rti+xtDTvMI0fQ==
Received: from PH0PR06MB8334.namprd06.prod.outlook.com (2603:10b6:510:bd::7)
 by SA0PR06MB7018.namprd06.prod.outlook.com (2603:10b6:806:b5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.19; Thu, 11 Jan
 2024 16:52:24 +0000
Received: from PH0PR06MB8334.namprd06.prod.outlook.com
 ([fe80::1b4c:bc4e:65c7:f85d]) by PH0PR06MB8334.namprd06.prod.outlook.com
 ([fe80::1b4c:bc4e:65c7:f85d%7]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 16:52:24 +0000
From: "Westermann, Oliver" <Oliver.Westermann@cognex.com>
To: "warthog618@gmail.com" <warthog618@gmail.com>
CC: "Westermann, Oliver" <Oliver.Westermann@cognex.com>, "brgl@bgdev.pl"
	<brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: Assign line names at runtime
Thread-Topic: Assign line names at runtime
Thread-Index: AQHaRK58ymWhpJaqtE+wcoPIMc58Zg==
Date: Thu, 11 Jan 2024 16:52:24 +0000
Message-ID:
 <PH0PR06MB833416FBBC8543802D72FA4D86682@PH0PR06MB8334.namprd06.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_Enabled=True;MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_SiteId=c12007a4-882b-4381-b05a-b783431570c7;MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_SetDate=2024-01-11T16:52:23.732Z;MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_Name=Cognex
 -
 General;MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_ContentBits=0;MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cognex.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR06MB8334:EE_|SA0PR06MB7018:EE_
x-ms-office365-filtering-correlation-id: c8a6a97f-de25-43ca-c6bf-08dc12c5af6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 p51Z7EV/H8nvNv93M4wg/9uC53BkhsNpH9SR2ynIalrv4EXpa0dWbUoM8vmRYEPvGL/GMCmsIaa3L6zwMLX4EnI9JDNMAxai0tVYvAERZ20JDF97aCgjVQ9IekoBuQgR3GBomb3tmJKwsCHoqLarPM5Rk/iW4fD2nQGSr4DfvvPXtORkiEMS77HdP8Ijh1Olc6+efttOMV9Q6vHYWeeKmzR/vgKyBIttAwH6Y/wiRD5npnoCED1MJOnokISh0ijja/6sBhDiVE/HOsU9bLAHJ5LKk+WCfTk66uKDK+7CUpwgfRs4VSwTRFzEVFGQOInWBo32kukONJSXmP8o3x5i7kgXASmT8g8SFzt5Yu2AFC5N7cPLkJXtFL8bcNaMQw4Lqjwfuou0goMVTEVBE6f6kL28zKUN5jEWnlkG7mKdFg6Szsw6hbokOeKnczNp5DcOt0Gxqs/3JqIh6zVhEij0m7PqrYB6s4CES43hsAzKQwLSTPBW0JkHP/lGv2c/nKp78fZp+/7Omc+PBG3SAewwyyn7/wML2c864TBiaBbCPx3A6GbCezSiDkJPa67NloX1LemPIK0pc5yQUuYE8xQIZYOvdCwveD0e30mRW0MKVAbyLT/WXozs9rkRk2sCGbvA
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR06MB8334.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(136003)(346002)(366004)(39860400002)(230922051799003)(64100799003)(186009)(1800799012)(451199024)(38100700002)(122000001)(52536014)(38070700009)(86362001)(4326008)(71200400001)(478600001)(33656002)(66946007)(76116006)(6916009)(66446008)(66476007)(316002)(91956017)(66556008)(64756008)(8676002)(8936002)(54906003)(41300700001)(26005)(5660300002)(6506007)(7696005)(9686003)(2906002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?ea5bYljyXBulDjXbsJv/rmM5s8GaZRN5veQiPZOsNcXJyoHvDTCtweEMsI?=
 =?iso-8859-1?Q?PxQcyjF/VPGYXNF/NIJQ6R0fBaKzYW/+5PQqGyK1Il1ZPX9zCHo1j8CDv+?=
 =?iso-8859-1?Q?A46H+Neo2QcnetxnVH6xeq/nN95+aV+UkAMnTrHp31m8Y8fOvIIdJLNohL?=
 =?iso-8859-1?Q?xFFF03DODLFWIC//l4cPCWCjy+TDo8/cdgQcUWXy35P5lgIAhP61nPK7YX?=
 =?iso-8859-1?Q?pQki2jaLgdUCXMc4BBlWVkmRspCe3WUzbVhkv/DPtl6F+4moiAebk3XkY/?=
 =?iso-8859-1?Q?CS8UF1I1Y8YnX3fdza8TLpPqnsUfujNpIPCGcZc02zcleaJtqu9oTAMYEO?=
 =?iso-8859-1?Q?k9MUdMsLGJnMb9L+gML5CWLNJ3NtqhkYDQs+yBYHoenbW3Bm6S19hHvs3+?=
 =?iso-8859-1?Q?CgWB9bQpx7+GjmJ79rPCHwIsiDN2o4FrWz2uG4xd2xK/CI8+0kyGOQdODM?=
 =?iso-8859-1?Q?L234NauQnWeS+H9qFYIvrPTs3GetK3eBnu3rdwvZYc3+Xuif2kkJ7i01cI?=
 =?iso-8859-1?Q?q+GQd7KmsfNDlLIwULkuPclbtPtd1EyxvLNn1wN9tnrc2dc+LHjcEjR5n4?=
 =?iso-8859-1?Q?aYM7z344ILtwEFnPyRWOB5uVQu86u/gAo6VHGl+ZgxazAgqw+YFuc29Z3S?=
 =?iso-8859-1?Q?+MUsVUlp4FHf0PmQcQAIm3yKwcvcYJSAjqj6sjX9aq2dwGX37ek3gX+OKp?=
 =?iso-8859-1?Q?bz9zTWo6MTcOD2Wiz5oeK/GLGna4To73BnpWuBOQFw+HDfF84kjB1CkQlN?=
 =?iso-8859-1?Q?wEjwSUZcqsF/rV8xP/oFl9jEEMlIJRl4x2Fhh/vnbn4VB8zqu9PTUykwpZ?=
 =?iso-8859-1?Q?VgprxsvEHyQlwKESekPS0Oa2BuYMfWsmVp0YhvXq5bDhE9UZriZZ38mXnK?=
 =?iso-8859-1?Q?JWYjA77Dd+g3nm2hWt1J5YMudgvdKVKgVLnEnFcA5xoonUcfJhgbpieG6Q?=
 =?iso-8859-1?Q?fABzRNh1GmvrsUmBs3uFzZd8xy2ooSz5M/JvgZwlo0yWjY/iS8qjIzlQ3b?=
 =?iso-8859-1?Q?BXjfbmpoPOtBHmMmj3BvDPuVRy5VdnzPKCXqrG5PEmnFW532ZSYZThH47r?=
 =?iso-8859-1?Q?0CwhIDIObivQVsjlx0dCzBpSgea3yNKlAi/jv/8GbZHHZjZqp4CJmbXmtI?=
 =?iso-8859-1?Q?topNSMbFLpNvLjUbNJdsY17i/Sb44FxUJBRvYGPxhoCD3w6ILQQVjclcbn?=
 =?iso-8859-1?Q?k0Z2tIWgxtQw+ELqMJj+mMHxsk5A+tXzeA5MKg3AWEmVh9H0t+porYvsw1?=
 =?iso-8859-1?Q?UJvFRX/n4LeHwE3RdzlICV1XJf5EZrNTOzDSFl8GGN+pWqpWsqSyEsQwsy?=
 =?iso-8859-1?Q?+CpxLbT2dHzcIKvezCqK5PSMY9cpmkICalu4zKYIYaVvA77N4d5hZXl6S6?=
 =?iso-8859-1?Q?O9KEtVYIVRMX80DYp/YWAzZ5iARskD6ifni1T8Xo2z2tXsIqVJZV3N/5tj?=
 =?iso-8859-1?Q?WxOjABN0AmG3IJejGFvqtB0LuPJuiz5rzzOXe2VgNnCCDRg8iWBVrHWEbq?=
 =?iso-8859-1?Q?ESIt2kdl7lzATYjEEUvR/V5N1TweYvw7PRLOQHRO9wXydyBp/1LihbdlKL?=
 =?iso-8859-1?Q?/3wCzuovwblX5CKqV4AMtoHxYifByCMfLpBoRvGLywvKXIoWIwlhxXS0Wf?=
 =?iso-8859-1?Q?vx2q2FiyVsMDUMZn0SNYtBYI9XuDiQD0JjzJajSX/uBnk/az4+8Ai+Iw?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: cognex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR06MB8334.namprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8a6a97f-de25-43ca-c6bf-08dc12c5af6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 16:52:24.0354
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c12007a4-882b-4381-b05a-b783431570c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A+rcJdrBeaUnNY5TqBIY3nr5ycH+LN02/oCsWPFqBdlUFczNhv7KAmSfdbCd+n0YTXk8gONHgJBUm1nRV+klJ7MMi11pJD7ObxLnC1D2Y+I=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR06MB7018

Hey and thanks for your responses, those are actually quite insightful.=0A=
=0A=
What I read from that is that changing line names really has a lot of impli=
cations.=0A=
=0A=
Kent Gibson wrote:=0A=
> Alternatively, are named lines the right solution to your problem?=0A=
> Is it important to you that the lines are correctly named, or are you=0A=
> just using the name for the chip/offset lookup? =0A=
=0A=
We would really like to use named lines as they are really convinient, but =
your question actually made me rethink my initial question. We do actually =
not want to change line names, they are constant throughout the runtime of =
a device.=0A=
=0A=
> If the latter perhaps roll your own pinout lookup based on the platform c=
onfiguration?=0A=
=0A=
The truth might lay in between: We would prefer to use existing features an=
d standard interfaces instead of rolling out our own layer. But maybe it's =
just the initial naming that we want to move. A better solution might be to=
 add another option to define and probe the GPIO driver at runtime: Instead=
 of being required to set all information in the dtb (and therefore from a =
very low level), we might trigger the probing through modprobe and provide =
the GPIO line names from userspace. I'm not sure if such an option exists c=
urrently?=0A=
=0A=
Best regards and sorry for the quoting style, our mailservers mess with you=
r mails.=0A=
=0A=
- Olli=

