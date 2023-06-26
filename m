Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4A51D73D70F
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Jun 2023 07:09:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjFZFJ4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Jun 2023 01:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229566AbjFZFJy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Jun 2023 01:09:54 -0400
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2068.outbound.protection.outlook.com [40.107.21.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2C4BFF
        for <linux-gpio@vger.kernel.org>; Sun, 25 Jun 2023 22:09:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RDQelS2Xp1DlShKY851tsohwy28CfsNFA0rna50kvg6QyK29zuOHr+skCuRBDLpEE1JJMiYskncts7/nOfDISfRul8pBybR5Ia6ejafW4n6z3hqRf4MdRa+7tPZkqgTJ1qQE2ERc2JgwdaTmpnx/IJWuTckHlo/i2kkpijQwV1v4QVxzfY7ir0GfbDB+AYNF12TnsMkxZ928z2a1spqjKSHkdz/JZUvEcRx2E3J6fVkmdB2BsZG4FLBOcWttjLZ4dc7k/3HbX71a/k//rmKalRm3hzcnOgwl5WZrbur0S59CcEq5LiwJBVUEJplT8cxpXe6m8pt4bB/hNfTgyHiFVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zob9Xh83k/Nsmptfl/UsT1Sd4VemHPAg47eYHj6nlGE=;
 b=g/t8u0ifACQtDA4e0yLYxHh4zUuXaSnJNXEdEN+imvkzS8Q/DourNe+IekMJxOC7HtaCKyQeO+fi88y3nx6mxrYJzPBhT/0ZjiR963ru9qT40zDvogRjg8AM2cTIAjR17co5cqeVyItfR/7vqyBRsnyqcQ9Q9Kr+/PVWUX/+zmvrb6wmKghyxvIsMOtWqtqXISSYpOQIlfrXUm2YOmhwqKYYPO42JyNpioH9GXT6h7fPBmzPqnfgCGMUuSXqdeShEZRG3Y0t8jUWj/O9mQ+Iq/7AqUSECI149uQMPXOY2FZJjXvj7x5F7tWNIRMNhZPpG/j3Topc46jDx4Z8euFFTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=sg.bosch.com; dmarc=pass action=none header.from=sg.bosch.com;
 dkim=pass header.d=sg.bosch.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sg.bosch.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zob9Xh83k/Nsmptfl/UsT1Sd4VemHPAg47eYHj6nlGE=;
 b=VUkard3+3AE19QXA5alHQitQwbwnepuYNeyMq8l2Hd2mhNu4V+j4CJAiQlUC3ahmRwSFadG8Qvf+LuQNXjiuWWwFwdlXySI92Sehy+gA9Ai7wOYMtXXxCItN0/jcQfeI54Bx4tCneSDRKLJ2s6qMpeJeP/aGw4i0FEpnZkA7G1dZN7NnOIzu4Jj3cSgLvTg9lVzCevOmDzdC5/KkZCp/MvUHAnArxhhDCSDRyBUWVh5sWxCigYEDeknKGoX5Kft1KEbSRZv4C5+KkLpDB1n/fZABMG+qHawt7XgfyKgWn5NdYRXk8hLPcjuyFglc7gOcpafaES3G3RDGv/JvzcOrng==
Received: from DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3e2::6)
 by PAWPR10MB7868.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:35a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Mon, 26 Jun
 2023 05:09:50 +0000
Received: from DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::78ee:8389:1731:4b76]) by DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::78ee:8389:1731:4b76%2]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 05:09:50 +0000
From:   "Tay Ivan (AquaEasy)" <Ivan.Tay@sg.bosch.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Accessing Intel J4125 GPIO Pins
Thread-Topic: Accessing Intel J4125 GPIO Pins
Thread-Index: Admn6416cGHcrpPhSBO+DBPe5D20JgAANQsg
Date:   Mon, 26 Jun 2023 05:09:50 +0000
Message-ID: <DU0PR10MB6083CF3B3E4B6495BA540BE0A826A@DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM>
References: <DU0PR10MB608373C134CD9CE8C7290DF8A826A@DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <DU0PR10MB608373C134CD9CE8C7290DF8A826A@DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=sg.bosch.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DU0PR10MB6083:EE_|PAWPR10MB7868:EE_
x-ms-office365-filtering-correlation-id: 7381fae1-c153-4e99-87d3-08db76039197
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Qmy5ckf+YKUgcM4BaH9l8/Kp3zYE2PSirbjtuZGvurQrP2frs6XP6iQOFUSsOHtD2fOF0auokUF/+IV27leLQztg730wxyxSaNphXNEzY1IB2Co/YEWyOVEWpAmi5WNJabOH7P8gBNzu6cCrbwgDWAzx9kc6oZHfj+AScDlopZtYyDswiwCX1eNtzU1kdgzgjoTfERIKbbKDM+Woin7NRAaq2epMwu1uNgAZlj1CzEN93G1dltpZGOdDAk/kW2FAFU0gqAcwHKSzYWSa0Sboh7bIcj7XedVSXcQJpazSkOSAZA+Rju8mJX/PIJYq19cG9QgqNqMvxuafixaSavuUylaH7n92Dx4gqoIUgsaYVWiTSjX1ZFR9RsH+A+mbHfG+CYxKqxL+/774MTD4shw7sjSdGN5lAt7oqVxlWUTj0NkCWPx0F2WSGQ0uQSdzhtEG0WxU4tIKOG/PY4Q5+max3Ut2+vseAZsmKwARevFZVrSdxHpDEq9g8nBZIYKw+jdgGm9ER7xksKFeFCx7hjq0LdO7tFnQYOec6YIBIVNLdZidvJ/2ZEg/WkHuUyaTnUVNN14gV4nIK8HxvLWpgo4Kg+PLOVbSe5h0Dcp/wjm7fB6y7OZC4C6X5CPASAq08nYg
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(366004)(39860400002)(136003)(376002)(346002)(451199021)(5660300002)(52536014)(76116006)(66556008)(66476007)(64756008)(66946007)(66446008)(6916009)(33656002)(478600001)(316002)(8676002)(8936002)(6506007)(4744005)(2906002)(55016003)(38070700005)(86362001)(41300700001)(7696005)(186003)(9686003)(26005)(2940100002)(38100700002)(122000001)(71200400001)(83380400001)(82960400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?A6ikWFJkS7e423ysp82LfK6tdkC2al5LTqUv64ArvyzFx7lf4xJcoXiI5m?=
 =?iso-8859-1?Q?X3Rw+iSJwf1VH+X8dWxwVqVbBZm1xzEqd/T/Us5nuvRD84ep4/jFD8A9JL?=
 =?iso-8859-1?Q?s4X+eKbCmU7R+kXLLoU0vruzGuxvN8ll0WX8Ek2wejezrDiylCHc6x6gU7?=
 =?iso-8859-1?Q?3lIMCQdFeIqtNUYDLTaXPpc2UZNTGG1O7uRxMIr7O0zcCMKSLGVPb/V07z?=
 =?iso-8859-1?Q?iu9oZHgXnjFubGYrobLSFJCMfwnYiTA14XxqaCYIV+TbZEEgP7qpCTlxau?=
 =?iso-8859-1?Q?4JhtQn+2azjiAGnKgYCN97xlKPQPIRpdfjI0zvboEwd6H+Gc1zpKOpHvTK?=
 =?iso-8859-1?Q?i9AKwTR2Lj0TqV7jdAMcC2PfNs048i79ftwnexCLb8pU0Cot2QLLtm5nKV?=
 =?iso-8859-1?Q?S30hl9eBGlj5c9hBGkBj8DZlS1vbqKEwvdga3asiy3WwIkXp/baWSbXKZl?=
 =?iso-8859-1?Q?oU8TCJAduyfMRw2+eWTPn36tdChdMy0ERpoE8nT/4CLBQs4sQzx4DkOuBK?=
 =?iso-8859-1?Q?m4isPAy7qklFvJXHXtIQGOCgTsirRekmArrEhIb6dCZZQIR+KcOpcj0ozz?=
 =?iso-8859-1?Q?NzSpVosRJdFfiXx1aS/rRfZ+4h1Eax6KX67a6bd7VGcnq2h3HqTHe/cf/P?=
 =?iso-8859-1?Q?GzC6c+z9z/prRz/NQAvwkp3IGb/eqFyXLn/hDsLrSjJmFccosKZAIUT4w2?=
 =?iso-8859-1?Q?326nRiC578UNatYKQuszZVzRTM3euZ2V5rNWx9yJcga9V9wA3tLkYGg79I?=
 =?iso-8859-1?Q?e/CPE1+vpAOss9UPCuhqQDT+VcGPA2zj4fNS47abJ8Q3oY3wnNRzs3Ag5K?=
 =?iso-8859-1?Q?QFP3qut1V8WFPLiFrC6AARGY3mZh/2bFWHeSr4glpXXsqEs6JRtRL6+wK2?=
 =?iso-8859-1?Q?iKkZxDY3GRqBmdwm0gc/CW3lPfztmD2nNxeu0qkYBZdy9eVE101GKO0Ati?=
 =?iso-8859-1?Q?lwW26NtAcZaVyOLt39w87uLOv60KwwIhHiRJPWkz1TPiFJJUu4dB291Fx5?=
 =?iso-8859-1?Q?SvEnMyLSC2WDIvq9Xjc7Ca1AFMZfw/CuG9O2XUj7ssO7RNcGjissK2a1oZ?=
 =?iso-8859-1?Q?lbeAF/w3XI4UdSDGL8N2Oy+7DLtHip7mhPzQ0TfTF4wZXyv2S0Cv53haHz?=
 =?iso-8859-1?Q?EbbsWbfVzhDqJjXmNESTG/SiAPXJfFWebU2lcPlHgOVjYJzOK1xio/LP6z?=
 =?iso-8859-1?Q?yYnnIk5BMN/ZCh+BD8LzpNHm+WPzGhgI823AP5oRgQFrxupcc46/LgpJ7A?=
 =?iso-8859-1?Q?t4nVfd9sn+tSQCJmerDMFohDfmwgJ4fsi4X+K4ycErr0CNhqXsDImMTPQ0?=
 =?iso-8859-1?Q?IHPm0CY7vSP9qw65diD/alkc03q4GEV2jRWD9joXJqwVQcXZHnhxirLb/t?=
 =?iso-8859-1?Q?NM7NFJ9FMQrVysvra96N+OTDfWt+Sc+tXViAIxkkJvd/YxwQgLx3MXBpuo?=
 =?iso-8859-1?Q?LcHFuP5ZsylaBc+fqTYvja9doYMlZlKhL7toGQHQrkU7wzlE9fPKxdGqBs?=
 =?iso-8859-1?Q?Ofp1BoUP/wRfZDfWTRR5+zvwxAlG9I9SeQZ4LXV5tKnIjIjH3VwDtZi7aO?=
 =?iso-8859-1?Q?JVoHdZltKVOoZpR/5ACiQi/2sjsksoZmRDgAsnt47qnW6cM5P56UrfKGqt?=
 =?iso-8859-1?Q?+xV3H9hKOn8Lo=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: sg.bosch.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DU0PR10MB6083.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7381fae1-c153-4e99-87d3-08db76039197
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jun 2023 05:09:50.2565
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0ae51e19-07c8-4e4b-bb6d-648ee58410f4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MB7GVD1Qu5Fpk3unEMEjCGi67qOXMyXUhCTG5vbBWwkBGMMoNfMHKncDxJOuEbZkV0Us/VRG+j1H1qUg6FEs2A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7868
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

Does anyone knows how to access and write to the Intel J4125 board GPIO? I =
have tried using the raspberrypi GPIO tools and it cannot detect the hardwa=
re pins. I have tired to load the gpio-it87 module and the gpiochip0 shows =
up (using gpiodetect) but I am unable to change the pin values, meaning usi=
ng gpioset (gpioset 0 0=3D0 or gpioset 0 0=3D1) writing a 1 or 0 changes no=
thing because the read (gpioget 0 0) always return 1. I have also tried to =
load all the other gpio-* modules using modprode but only gpio-it87 creates=
 a gpiochip960 directory under /sys/class/gpio. I am running ubuntu 20.04 a=
nd I also tried 22.04.2 LTS.

Regards

=A0


