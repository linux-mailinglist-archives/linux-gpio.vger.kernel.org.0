Return-Path: <linux-gpio+bounces-2130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AB5D182AC4F
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 11:43:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBA64B25F96
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Jan 2024 10:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B323614A8A;
	Thu, 11 Jan 2024 10:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cognex.com header.i=@cognex.com header.b="C5srHb9h"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2136.outbound.protection.outlook.com [40.107.243.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3F11549B
	for <linux-gpio@vger.kernel.org>; Thu, 11 Jan 2024 10:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cognex.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cognex.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZuvPY/K/wIPm7i9+jBUluVwZIUnabX7zXfpYAUmxhz31th6q9AjgjT59GeGrIrz1WTv7zHkfTceklo2q10GlR5qdaitoZw6WflW+5+qKFYKFzxVUStPT4lI/tAZ2z5UolYOGxkDNRJoMu/fifasMV1DHxwXe319l9DPXVMmCbupNl3NxK9wBRCQxBLoXNLiMUj7piKiGZlKPYeZhmVzpHoqwpq6gkPPOBIP2dHGEGVfeo0FvqZLieg7JWagCwNnohYUoBiPZP4hAQAe9u7EcC4KWGJ2atoQ3i0d06tvjHeWmvN39WrTJi0sYedKmmBYqFsDJ/X+M5q5I74seR0w95g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uRqXsNxy3CwSF6NtScbi2LWPqboPCgC6UlD+/7QlQ1s=;
 b=CrolsJyGs1NT235qMe3fX5Vf0625P/wGpCRU6enK3PCa1xEIw4a+Br8utc4SPxi59LhDa9Vz8ux0j8W2n7gFZSDrGheogEzrQlh6qOKJ84ZjxGxmnBmnBbp559akXinOxivvbjytI2pkArmfx34AG0opB1PldqveRxC1xMC4uN3P1j+sJgwxbC37IrPAsLmXEqmyDYCF85Oi0c4E07At2hCG/wE15PxFE3CaQjM7pEGZPST+daZwapDWUf4SPKcRhlULcWQzCqPqCwcrUVUK47PHQ4ex496a3SKrVGS/yeAorrbzSlsXDLe0IMBnX/0zXeVSKpOKdbR8wy0wdl5jzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cognex.com; dmarc=pass action=none header.from=cognex.com;
 dkim=pass header.d=cognex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cognex.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uRqXsNxy3CwSF6NtScbi2LWPqboPCgC6UlD+/7QlQ1s=;
 b=C5srHb9hXWRNeMwo0/O1aCVnjt6bBo56rKbk7MABRQ2qfVtKjMx0h7TwWyBftdFgqasrJ5qyzhBsqnETaeLtjhCibRJgpi5y/KpdnWuxhpCUE6B+8mNsUZFVLfRvmZ66UzqIe8MI+soP1LptHYLaeJorMUMLAYOpP3araboMSu0CIC8BDR219qKpDLAjYEj/4tumnmLY7XjHjwwt3SlSSba+cjvdHDULAoKR/UyhmxGgTBxHs7kahpfdLs6s/H9hZbd3iLOzcx7kpuz+mpYpp2QGplICsFXA66LsIxCkgcBvU9hafG9BV/cRZCwyOZXwS1m21yljTgEXwhT/Dp2LVw==
Received: from PH0PR06MB8334.namprd06.prod.outlook.com (2603:10b6:510:bd::7)
 by PH0PR06MB8463.namprd06.prod.outlook.com (2603:10b6:510:ba::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.17; Thu, 11 Jan
 2024 10:42:51 +0000
Received: from PH0PR06MB8334.namprd06.prod.outlook.com
 ([fe80::1b4c:bc4e:65c7:f85d]) by PH0PR06MB8334.namprd06.prod.outlook.com
 ([fe80::1b4c:bc4e:65c7:f85d%7]) with mapi id 15.20.7181.015; Thu, 11 Jan 2024
 10:42:51 +0000
From: "Westermann, Oliver" <Oliver.Westermann@cognex.com>
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Assign line names at runtime
Thread-Topic: Assign line names at runtime
Thread-Index: AQHaRHmJ7YJrCc1jTU6lUanI2yeFWQ==
Date: Thu, 11 Jan 2024 10:42:51 +0000
Message-ID:
 <PH0PR06MB83342EF7DF19F93CF257756786682@PH0PR06MB8334.namprd06.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
 MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_Enabled=True;MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_SiteId=c12007a4-882b-4381-b05a-b783431570c7;MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_SetDate=2024-01-11T10:42:51.113Z;MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_Name=Cognex
 -
 General;MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_ContentBits=0;MSIP_Label_220b05c8-2537-41e8-aff4-fb6c522f9624_Method=Standard;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cognex.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR06MB8334:EE_|PH0PR06MB8463:EE_
x-ms-office365-filtering-correlation-id: dc5bd475-0993-40f0-8e78-08dc12920f78
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 I80hNsCaVefFfcS1H3l2TnUBx1IMYPPMVM0C6lI3bgDBp02dS/2EAhf6jN7kL2JkAa82cLZAZ+4cCgeau3145ILkuLqgUW00LtkE9+QqWGns/zW1RqtCLG6nSBY2W8CIPXAV8ZPPZmAYep7TKn+a72hlzrLNXNQxvDxkCuseK9bIqU3FeaTeB7IYdu68DhAyD19+ST7yd34FdgN8iuY/kUa33QIzr+Gd+V0tak+X9pi0ifCJ5De3V27DoKOPEaciODm1TawOProQnkYR1MB+D9MQUxXe54PcUtwVIa5NBETmXH2CVCCsqNSCvgYidJ5y3Qb0+NxSmMDvMbzAEwHpNa4W/otaaUR7sGWp7Ct2QpcvshXjhMwbeCq+a900LkRgRlEEHRqENRoHBlQ/ajewO69UCy2M9CZnFlJyjEpkV77JKLjpAnvMuvVIbmdQDI5A7X4P9nzZWyWnZZMz4Jy7Da5xZ6vFd0haM1V7ifnwH49QPmsUcIaOWoyg5ZYC7MkkydALUd+Z6imXfc3vdL4haQQXOuYP0yoEysZJa1BlkaRmbtHit22CgstgQpXZt9KSDIYg6vZdQvRqwSnlTNXFG6dzhAyZ61j5C/Qn33iM7im8E4DL6sf6LicN9phNpDfO
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR06MB8334.namprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(376002)(346002)(366004)(136003)(39860400002)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(26005)(71200400001)(38100700002)(52536014)(41300700001)(122000001)(66446008)(66476007)(66556008)(64756008)(316002)(66946007)(4744005)(5660300002)(76116006)(2906002)(8936002)(8676002)(6916009)(6506007)(7696005)(9686003)(478600001)(91956017)(86362001)(38070700009)(33656002)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?IqRde9yQilZb10uBzLDIDwke/6RQuMjdYrQ0cWxV4Xgb6xJSCTOwc6Etbt?=
 =?iso-8859-1?Q?u3YkW7BBPMXPlF6DYsyC8KxWlpLbDaoUjg3xvde08w1WWWV8A/RRkuSNdv?=
 =?iso-8859-1?Q?lP1SUQOEBMyF7W5COZzZsIEyW92DcvsXE72HunCaSBlmaGd6d6Cw98gSm8?=
 =?iso-8859-1?Q?t2TqLvtyiypVHAd3QcgWjN8aJOcT3+akuy6epVlGZryIpuh05vkiA2uvsz?=
 =?iso-8859-1?Q?4fhrJOt2STwLyBMUUx1VagGrzKeimNJcgVooj+rRWTTlWpzCkmh47H1nK4?=
 =?iso-8859-1?Q?8naYOSnhySoGAqe0C1b2sWP0Fq4ndULnBvXd6Q3wqlM/iyfjTmFDF75/p2?=
 =?iso-8859-1?Q?g0B/AqyrSJXPAoHbVLILI5jG7SsFLst4b84LVaGQb6XTxPUkCmRie139uh?=
 =?iso-8859-1?Q?A0xd73gotzhgDYXOS7LC55SuNzm+rqR/nvC68qJdImaNt/PGJzsjKMpJmr?=
 =?iso-8859-1?Q?KNpjU/FEZU+NdpfEj6P06BoiOACz8kzp+kSWnYjnf4CvJ2lHXIi/h1rFl7?=
 =?iso-8859-1?Q?unhfCjOVA6CHFP7OzlkfSzxR1uNWqH182nq5k0oQbMUBZzSq/FKwLshxs8?=
 =?iso-8859-1?Q?kx8HejrMaO9b7mVnnORuv/8cHsIP/owYFTP47vUI1xnmVSGPigekN3/d40?=
 =?iso-8859-1?Q?e2gunL6KUAQ3DY22N0euzUvqP/rUfbrB4fAaVWHwEzWlpimlG5p+2zJupp?=
 =?iso-8859-1?Q?Ch3N4I11WSUXqrjYRx8R1ODhPYITCXOemWNppxIiTjFtM7Yzy+8Ou1n5ht?=
 =?iso-8859-1?Q?OqGZmdPQ5NUmfcY34nNsHOKwvWVAv07F83MKbqGxWxQJh7XIydDL7+nF+g?=
 =?iso-8859-1?Q?nBZmSoYq/rZfnrLEOrBfkXpEzpNG+7+70FAsU7YPCJcj14R1RghtAvmFS0?=
 =?iso-8859-1?Q?L15qUbiCl/vv1m8hAAx6qsb9qMtaqyxot3cnghhqoiHYXbSS8yG7K/gMJG?=
 =?iso-8859-1?Q?D0Qz1Ss+ZXRRSW2VBpBA3OVzM8d91tzB3CH/r5nTWKzQFQr3OexjhxzAU/?=
 =?iso-8859-1?Q?YLMd5NxNacmWdriKk42gTmBS+UNrGPtyRpZigVbY3boywQNVchvvQtSsva?=
 =?iso-8859-1?Q?m1QWv2JFErKbQzpdpVygKTGtT0vEhkldzBrC6u73UvMKcolkSLz1SXs72/?=
 =?iso-8859-1?Q?n4fyYTMB9GP9Z/aXKVb2s2cdqvfZHTHUmq40fPCc+5re/8pvke+KkQKBje?=
 =?iso-8859-1?Q?bpDQo44vbmBGfwegP9Qu9QLJMyja/eCabjT6txbc8HFH7jqIWinWbN58hT?=
 =?iso-8859-1?Q?qcGIaJkof/+RjvIxhWipQUuk/RmkC5XbdJtFQVIyuM8hehIBfTBqf0jAUh?=
 =?iso-8859-1?Q?MP8rnpTy8cXs3dFYiziPkVDQUD1VM7JCOpe6/Fgbt1taCgNrhi7DQRiAZ1?=
 =?iso-8859-1?Q?0bBnj4zbqRwCX3EPBRdEU07RaO7YJzQsMrOiqeC+g/JxAq5HqJXrhT+3x4?=
 =?iso-8859-1?Q?p5NI6jx753gztwHWiYUx/8IukpylMtE5ekec1rCTlDLPXq5out5xmkdLcA?=
 =?iso-8859-1?Q?bkJElQejjTCRpihi8GYswBZWPjkSoOzLuOSu9DU3XN9Ts4+7u3LsP9j0hv?=
 =?iso-8859-1?Q?4SQfJDlaFaVlBZAAuQBT38BivMyf38zaE8iT8tzJoY0ARZyDjipWYAqA9+?=
 =?iso-8859-1?Q?Hfj8SraNYJNUcUtoxzu+wI/QyW3pRSYSU9kpwp3B8PtmttZKRW+X7b1w?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5bd475-0993-40f0-8e78-08dc12920f78
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jan 2024 10:42:51.3383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c12007a4-882b-4381-b05a-b783431570c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tniIxFs9OqTWJN5CnWBK/YjU2+0dVHnN2yp5aDUx485OJLavsoRhj/3q6TCxsclIeiH7iGiNsazwJ/oYsxRZPatiGlJr95zAZgiwFSo/Rpk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR06MB8463

Hey,=0A=
=0A=
I hope that this is the right place to ask a question in regards to gpiod, =
if not, feel free to point me the right way. We're transitioning from using=
 the old sysfs interface to using gpiod and named lines. For most devices, =
we specify line names at boot time using gpio-line-names.=0A=
=0A=
On some devices we have small differences between revisions or hardware var=
iants, which causes lines to be swapped on GPIO expanders or just being use=
d differently for between revisions. We started to handle this by overlays,=
 but that requires to distinguish during the bootloader phase, which is har=
d to service and often unneeded. Especially when we want to rename a single=
 line, the overlay needs to override all entries, which leads to duplicatio=
n of those line name lists.=0A=
=0A=
Is there a way to assign or change the line-name value at runtime?=0A=
If not today, would that be a desired feature (as we're looking for way to =
test contributing back)?=0A=
=0A=
Best regards, Olli=

