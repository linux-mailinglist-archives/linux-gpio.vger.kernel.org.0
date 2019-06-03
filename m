Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11C1432F88
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2019 14:24:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfFCMY4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 3 Jun 2019 08:24:56 -0400
Received: from mail-eopbgr760053.outbound.protection.outlook.com ([40.107.76.53]:58562
        "EHLO NAM02-CY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726137AbfFCMYz (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Jun 2019 08:24:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=longbow.onmicrosoft.com; s=selector1-longbow-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g89eCX9+ojqhsoriVTPL+knGkgoBhNSpnWFDUkc2sVY=;
 b=PkcGk1wsH6tmMRMNCXAm7aHV6wonzF92GWu8XNppfOEl80oG7YCwSUzIT6+w7RfKL4sppn/ADTTa/wGkXNvw2OsAFy0TfsWvWZzJVAWkobWr6X2346zmBMlu5iYVCLv+Hh/RIob4r1JujBTLukNVRy5zeV3Ver/lIYiQiLTuvhA=
Received: from BN7PR13MB2532.namprd13.prod.outlook.com (52.135.254.27) by
 BN7PR13MB2257.namprd13.prod.outlook.com (52.135.247.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Mon, 3 Jun 2019 12:24:52 +0000
Received: from BN7PR13MB2532.namprd13.prod.outlook.com
 ([fe80::d98f:7e48:aa0b:fb49]) by BN7PR13MB2532.namprd13.prod.outlook.com
 ([fe80::d98f:7e48:aa0b:fb49%7]) with mapi id 15.20.1965.011; Mon, 3 Jun 2019
 12:24:52 +0000
From:   Kevin Welsh <kwelsh@welshtechnologies.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [libgpiod]
Thread-Topic: [libgpiod]
Thread-Index: AQHVGbroRy0t0vRlEEaYFCl837L5BKaJ2yBQ
Date:   Mon, 3 Jun 2019 12:24:52 +0000
Message-ID: <BN7PR13MB25322B3D67DFC0E8787E79C6DE140@BN7PR13MB2532.namprd13.prod.outlook.com>
References: <BN7PR13MB2532728B9B6D7E73875DFCF1DE140@BN7PR13MB2532.namprd13.prod.outlook.com>
In-Reply-To: <BN7PR13MB2532728B9B6D7E73875DFCF1DE140@BN7PR13MB2532.namprd13.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=kwelsh@welshtechnologies.com; 
x-originating-ip: [23.116.112.81]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9c0ac383-a40a-403f-8573-08d6e81e7ac8
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(7021145)(8989299)(4534185)(7022145)(4603075)(4627221)(201702281549075)(8990200)(7048125)(7024125)(7027125)(7023125)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);SRVR:BN7PR13MB2257;
x-ms-traffictypediagnostic: BN7PR13MB2257:
x-microsoft-antispam-prvs: <BN7PR13MB225730477A06C14B16B3F20EDE140@BN7PR13MB2257.namprd13.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:5797;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(376002)(39830400003)(396003)(136003)(366004)(346002)(199004)(189003)(86362001)(2501003)(2906002)(316002)(74316002)(6916009)(71190400001)(71200400001)(66066001)(256004)(8676002)(2351001)(446003)(2940100002)(99286004)(11346002)(102836004)(8936002)(81166006)(81156014)(486006)(6506007)(68736007)(6116002)(3846002)(26005)(476003)(186003)(76176011)(305945005)(7736002)(55016002)(7696005)(4744005)(6436002)(66946007)(25786009)(52536014)(5640700003)(66446008)(14454004)(9686003)(66476007)(33656002)(5660300002)(73956011)(53936002)(64756008)(66556008)(76116006)(508600001);DIR:OUT;SFP:1101;SCL:1;SRVR:BN7PR13MB2257;H:BN7PR13MB2532.namprd13.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: welshtechnologies.com does not
 designate permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gy7q/yi/L7UGUflFkezDXXepaM5MgktIBk9EwDCldFqhCa/K8K1gL4NhG05xtceHZ8jLH37gBVn1jm3bwsDNmevnGgTNQe0VfPZIdnEzb42i9+azplnt6sDYa6IEbUVhQw8HzKrEVUW9kSBr6n8Jy+r9V0xIzEaLSt9hFJVNXq/ThH/GFRWO3mkceH7p7tOst2NrV622QEUm5UqN9JVOiZ/jjVB3Kc+ISmlYUm6CDuRn5G304wOEMJ1NZL1d/gGMIMBY3PEWWAkPRKVKLVbHGo0JBuUpk2esAHu7NPQM6oK3tekB8XHv0VBbUT+phdgDvrSFs11cmfd6J/W+xJp094ZzxopUA2WaLNOrQ1Kzlm/fr4TNJFImjPXvzqHEUq/HwAL8yKSmdOW9AOTK3CSNN6apLl/icRMPvBknWiikcr0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: welshtechnologies.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c0ac383-a40a-403f-8573-08d6e81e7ac8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 12:24:52.3410
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5b653874-2b30-4a3c-9ec7-6517aa502373
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kwelsh@welshtechnologies.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR13MB2257
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

I am trying to make gpiomon into a daemon using busybox. (start-stop-daemon=
 -b) Instead of writing a message to stdout, I need it to execute a script.=
 My use case is that I need a button press (gpio) to undo setting a static =
IP.=20

If I set - -format=3D"touch buttton-was-pressed|sh"

Is this a valid command to make into a daemon? If not, can I submit a patch=
 to include a parameter for executing a script?
