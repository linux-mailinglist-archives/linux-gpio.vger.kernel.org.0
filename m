Return-Path: <linux-gpio+bounces-1397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D63E0811A0C
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 17:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 90D962828FB
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Dec 2023 16:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F4E539FD7;
	Wed, 13 Dec 2023 16:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=FII-NA.com header.i=@FII-NA.com header.b="VhGieWTq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09BF48E
	for <linux-gpio@vger.kernel.org>; Wed, 13 Dec 2023 08:50:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V9I6aqVmagTej/BvadLbxBxThHzIh6VmcjEhaOh5wsMJl3AzwvIArOQaYyK8Xu6jx0AtZ9qQoAya48c3zRawm7oaPLZ4TNlQ+Anha/Kh8PC/pVj1vnE8yPwx4JaSSeSflT8RiKO4WA1vAQ9JydTeFdBumHAsdq+sj52N8sDMVFz/G2vy90i/E8ZJ9c4iJiPBxh/bT/9yArvGrH+d2LtCmJsxzwb4Ik+egl9VismxvB/MkToi0WwnT26rv7WJjzKiWgUs879UR7wa2tYr8y+YVmLUoeYWCnIhIxF7Ud/LyTYaXlb4/h4koe0XFkzy9uqpwd2Lwr1gwW6WHi80gSDruA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9aFl3ATUl72avNGEAvWL6uo84MPwSnTLiI5CGSaSmoo=;
 b=LJTZir351YFqd93+ncNmQQL6O5ZgxuEN6plfAI0l2ztUWjbBPoUR3uGl+cRHiOwbdbEeX7HhNlY4oRAP7eRssurX5GYbH2mXwpmg3prR/QltFs7W3B0DF9BufDfJ4NpwaxAm+vbtxU8RfhyswRX43cMUMOb43eg3mVoFiw7OUdiUeft3sOy1kYDp7QFDmEG7De1tfYhL/TjRXn0Pd57DBynJVsZNjcsdtJb+Wbd0rNc7w1MkyOb3zlZhDDjyh/FGzaEuXK96PYMjD3UrbMjjc8z6q4Fjm0CSNbyMC7tsTp2t7qeN7U0BUNZORxztp4FOQp9SHDsoso4R+v/f5KbUHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fii-na.com; dmarc=pass action=none header.from=fii-na.com;
 dkim=pass header.d=fii-na.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=FII-NA.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9aFl3ATUl72avNGEAvWL6uo84MPwSnTLiI5CGSaSmoo=;
 b=VhGieWTq/AuW2yPD/UmCZ2iGNPljWY5V8CQaUCBQNgfihZDprKv4+1haJ/EC48wy4VH8xh4t1Ne3QaTrkcirM8xlaHWTY35nYrdVgVRZBw/jfBwbqMxLzY/iry1T065aCHDhK4i2Y9V2MJ9AYsDrcwYgHkb9Btk9W1i6dq5xFmK4/A8HVUU/7dMgZc/pAtjkwnKPgEH0lZKWnIaQrc8+KFm9Nb78w8/g2yW+GFw/uW8YXoIGf3XuIV2Ta3oCLPIuLgvFZs8AFa9Ueloir/wgmZvWt0IEJb47XLgANlHc2dnhCFfh6/sjBrF7OWbKuGeV4XUzWoKTAQbq1mYgftlp8A==
Received: from DM6PR08MB5322.namprd08.prod.outlook.com (2603:10b6:5:14::30) by
 IA1PR08MB8744.namprd08.prod.outlook.com (2603:10b6:208:454::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Wed, 13 Dec
 2023 16:50:12 +0000
Received: from DM6PR08MB5322.namprd08.prod.outlook.com
 ([fe80::c768:b08d:3b37:fdf3]) by DM6PR08MB5322.namprd08.prod.outlook.com
 ([fe80::c768:b08d:3b37:fdf3%7]) with mapi id 15.20.7091.022; Wed, 13 Dec 2023
 16:50:11 +0000
From: Kyle Nieman <Kyle.Nieman@FII-NA.com>
To: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [libgpiod] Simplify GPIO monitoring
Thread-Topic: [libgpiod] Simplify GPIO monitoring
Thread-Index: Adot202IHyhmBq+ySJy3Wd56KKERiQ==
Date: Wed, 13 Dec 2023 16:50:11 +0000
Message-ID:
 <DM6PR08MB5322659E14BB25DBAF6CD3CCC48DA@DM6PR08MB5322.namprd08.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=FII-NA.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR08MB5322:EE_|IA1PR08MB8744:EE_
x-ms-office365-filtering-correlation-id: 52fa8231-12dc-4f9e-9f5d-08dbfbfb927c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 kaFTX4OaTuf8bVcMpiI30UlsY9IAH9P+e48pdLrkk+tVBrNbkTNbn5jmphmbZHo+88bJUqUPSv31e0ofvsKvqjOuMb7UUX+rLtohZ+F7mbBRNc4cYkwYZ4pSs0/Bgtq9zEMeowa0qu5KvUGPCcVtak6Lq/uZAN8XQO1te7+yobYl/aMzwQ0T9DouWu3Z1ra6KJ536SHYU8SCOCqQ/3/EaIqiExZTHokxkaEwqmGVyC4xTPN3j7puDzgNH50ET37Rbr8ASzYMSZE5JyimyipB9i02qx8xHpeE8eruvYXlUmy0O3IchhGV1VPecAhQENp2VM2Rzksme6myGWbaaKlBUra1N/NSqkUWIQpMyk8BwzuvfsQj9m6lNsN/W91uqaZ9hNRh8XEVCoBt6H6WO095hu2X5DZEQsiMAx1IJZERcIk2v39xusm0erw+XWWWlNzIQuQjlX6Bl9dJx70aunVm7zo9DAMSbe1Jm+922HCaAFa0IMwGh+Tw5EUYx8YB7YVOARnqg3HPYZmlLMvElFwAkXlI2jnSrkqvfQzsVpoFxRsu0u/mmVuhkq/huNIn2e3EzIzpU55MBlsfcN9LtpHSgJ/MUnt3EiRnoLxIW89XmwY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR08MB5322.namprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(396003)(376002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(64756008)(66446008)(66476007)(76116006)(66946007)(66556008)(9686003)(6506007)(7696005)(71200400001)(26005)(38070700009)(122000001)(86362001)(38100700002)(33656002)(966005)(41300700001)(478600001)(52536014)(8936002)(8676002)(2906002)(55016003)(5660300002)(6916009)(316002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?txSWGyBQGFYrsxoKrC/BfKCdaTW1zA0rswWgxHY9wntYgAjF/3BMG3lrYJNs?=
 =?us-ascii?Q?t72lFvKZIEo0W2qaM6XJPfKO4QyurA7woV1amSPUQhvBAZenF1BwklOo8Wtb?=
 =?us-ascii?Q?HenD8vAw9SNqlFMy+Jakzl5ZwnwG55hXRmChmahxol33m14ZUG3XrQuCubIb?=
 =?us-ascii?Q?kXNk4H7fCwHxVm8KiIB3PWCkjz5h/bfykUVezfTft5ponOXrRf4bOafQK3y4?=
 =?us-ascii?Q?OheZcPyZqwoBM1qk3MRJWv6pq5dBcKEv4o8VurDrWkpcQyXXmA7R5Wy0Emmq?=
 =?us-ascii?Q?BeaYeWgRCLoUV8Gu7jZZMTFsr6T3kRu6JK6XJChFrmDrDhdnxLzU6j++o53V?=
 =?us-ascii?Q?NGhcXqif5YmeCjEhGTRn1L31zwYRNdPYLfXwxnCS2IEzSbsPbW0zoPBIoqcF?=
 =?us-ascii?Q?g0DnSwu7DGdWNzMcGAad11/DXBXjutdS2nEJZ2XGI2dPdyW1S91jKvabsbuA?=
 =?us-ascii?Q?LZlZZJ2flM5ajPl8ruKgCf3E7RT60f4LHGN4rG1EHLlTZ7Ic3ShCyJw5h62r?=
 =?us-ascii?Q?iNnU3ZFIH3RrMkMCTBbK6+DhBNSy07e2Vooh3C7xSF0I1msJ0WzE7cMKTPJP?=
 =?us-ascii?Q?ZdckbpyDhVjR6UbXQFogK7w7lE9SfiV3eH4eYAXN/LYKn6voF9QZrh8XpemZ?=
 =?us-ascii?Q?JmMbQGpLAktj0b3qnkrqeE+YsfFX8Mg/X+MlAGWRhevdHDk4rSENHqkt3vuO?=
 =?us-ascii?Q?wLZnme1eFmMssA19L85yeIWKZdUWcWeXiba011Q33+uIb/T9XsHeHjJplH/z?=
 =?us-ascii?Q?2iOGCFuyU6m1hpbN7kuJ+mnNW4aeosLtRJLeZXmScWdCi1K+VqKVBltSpV5I?=
 =?us-ascii?Q?CFzolupegV88hvMFmZuQLVV553eADNYb3mlG3WV3PyYt5HOyK3PLMMUhw3RH?=
 =?us-ascii?Q?dya9hjfPYxYtigpkX4jgCOvUNC2qIQotlkU+MPYi+TlecQj6lr8txadeAfpb?=
 =?us-ascii?Q?KkPfVdSp9NxnTTM8xpAPT/kaRAG7vCtJsNtDI6ohoPc9GRhjFVmOeyXsLhUW?=
 =?us-ascii?Q?2jAfnfzru1A7mtjmFt/+rKyokvDiXnjIu0lZaKmJtUrgtlaSmEsMg9jVyZeE?=
 =?us-ascii?Q?E3yUza37x2EGBaHZTNZR2iwT6muQgsM8oNoanCSB3kN0RlPhzbMNDFwPlPE1?=
 =?us-ascii?Q?1f61e86ipAg3pfUv7K0O/xa2LntzuVW7EcoLPg8dYftruhoQGjmgVA46Fk7V?=
 =?us-ascii?Q?NJ6aOCJFXLZKNrOQI3qPXEUg3dgJycnMNkQ+jQHQLw7T6DzXx2ua225wPDr1?=
 =?us-ascii?Q?kIEx0ZRrZJucMOsQT+eJtKzpR50VLqgxn91dbMvmQJBxzGFwg4AXap0MSHNn?=
 =?us-ascii?Q?3gG4obX1HlP5D3uSa+GmpmdGScDDuzQwqB4+U9+ap65i0SuE6UhMbRY5rsJf?=
 =?us-ascii?Q?KamEFkNUfl4IspZLWZvKCzD4EHi/ih6kZUEk6rnzzsukzaAOwBvxFc3XdzY8?=
 =?us-ascii?Q?DFERSiSEx5stqUl0MA1AO1E122Zl0eyu6lG0s9yjFkRpDODopZTCok0qFnQU?=
 =?us-ascii?Q?vDQKFQwndRXcxWrhXYX1znowZtgJJlQpJsdSVqNynrZTmJ9p3RbHnHCkBSMg?=
 =?us-ascii?Q?4GTbV1Ft7L/bGYk8S8GUCWU5AEn9vk/+ygoRfKbV?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: FII-NA.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR08MB5322.namprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 52fa8231-12dc-4f9e-9f5d-08dbfbfb927c
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 16:50:11.5757
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2f78a81d-6abb-4840-a061-3fe5396c72f2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lKnr7rYltgBauhC0JKfWHV0glN1vEANtFzHkDNu+L9YJwN0/QKtjtZE1E7AAeK32BM4oR8IRwluIkNXXDaxttA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR08MB8744

Hello,

In embedded linux systems, GPIO monitoring for edge-events is common.
For example, OpenBMC has several applications/packages that monitor GPIOs f=
or an
extended period of time.

phosphor-gpio-monitor:
        1. Starts a systemd service on GPIO events
        2. Sets a dbus property based upon initial state and on GPIO events
https://github.com/openbmc/phosphor-gpio-monitor

x86-power-control:
        1. Controls system power based on different button presses
https://github.com/openbmc/x86-power-control

However, there seems to be a lot of duplicate code between these applicatio=
ns
related to monitoring in general that looks like it could be reduced.

GPIO monitoring tends to have the following steps:
1. Configure/set up the GPIO line for monitoring
2. Read the initial value of GPIO line
3. Take action based upon initial value
4. Wait for event by monitoring fd
5. Take action on event, then continue monitoring or cleanup

A function could internally complete the common steps regardless of what GP=
IO
line is being monitored such as steps 1, 2, and 4. The other steps unique t=
o the
GPIO being monitored could be handled by callbacks. The
gpiod_ctxless_event_monitor functions seemed to do this partially, but were
removed along with the rest of the ctxless functions in commit
9b6e6d268671ef2dd00d9a9abe7ba43d14e7a84b
(ctxless: drop all context-less interfaces).
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?id=3D9b6e=
6d268671ef2dd00d9a9abe7ba43d14e7a84b

Would there be an issue with adding a higher level abstraction to simplify =
GPIO
monitoring?

Thanks,
Kyle

