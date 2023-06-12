Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ACE972B518
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jun 2023 03:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjFLBau (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 11 Jun 2023 21:30:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjFLBat (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 11 Jun 2023 21:30:49 -0400
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2048.outbound.protection.outlook.com [40.107.237.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9FEEC7
        for <linux-gpio@vger.kernel.org>; Sun, 11 Jun 2023 18:30:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LV5bvmFnx5+PpIibdF1WPZl6LQfRttqxwSdpTeq+6VNJDKTXlHVQSl1+/zRJMCpA6thb3spTsmlpJf3OkACkXYPLeAlzYF309aXr3qT1dsVixQyLOZVdf4hBaUYxJZWqMNYlnvWy1Rx8a+tvu4WG+eaRYgPkJ0wzqhppeIBUEC2UiJNdUpvKV1lhJ8hkeq6L1TAW3AjuUnGtu5q+q33vb2Mzd24BWCkp/7AT2fsznZ5OvM3i/oiiLYYJr+yHKEDIW3T4BYeVOC+RDHbsHMD2WYzApobqZhl/iFrgTnIXS0m7jgQOishaw84CmrllJGY18BhyeWnlCZCeLIQx9byCUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bGvVYWDSC+iwPVP83MLlPYPwWaUJtBVKRkSaPIjD58=;
 b=CnEJTbIyT7lXAVdziILxVQ7qWdYMZ4eEaNofc9wCLxWLxLgc3I+4Tg9AcpEFeVsOeMscJ0Aja0xMeyt4c0sHgtbb5BQcq7enxl1DzR30tk4ymsMXqTwPZY8vxlmTYAUid7l4WyqzIhACLAeQ2HewZpQyjWK2tbrykSrGVapYY8vaqdbaVvNQuISgM8ObDeen4ShSHvX+IISHh9Gva1Ec8Qyxqe2xR9PQ7kzGz/5QaM3BV8wE6dKjLuhqCM+We8/u5hOiWLcilYo1YPD8orNK3SDO9u+aTTjc5sUfUVpGq4/IBTr0q2DSyBFN1Z1RyfaNeKx2LXEjh/xYzDXSucH56Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=exfo.com; dmarc=pass action=none header.from=exfo.com;
 dkim=pass header.d=exfo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=EXFO.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bGvVYWDSC+iwPVP83MLlPYPwWaUJtBVKRkSaPIjD58=;
 b=hhlrG1vRyJ8hEt7nL5it5sYITbg5kQGXQPtP9lUlWjZdQsiimNsLoPhsvkrzKmx6r/4wsZJSbS8Nzu09Eh7ZYS9Ha+qKOwXiEWgTzyds17pStQ0ZSHqG4W9rCNkgVtlMW68T9jvSxkU9yilDL5apb5BglFQsMDC3TdEh4L3k1EhZF0uY3nljLv/ase+JBXAl9/8xnDzP4FMLr8yU7ijKV9GmMRmrJ8zp1zEqdczS3eL4sSnvCI8Yk5fAvaVRg4QY14p79kRtCj1AqUCbDVnkJI6I8w5tfYo2t7WhRIKnzy6lBYeA+9t5SES8U9IdLCuaOBApFWCi0C0u8bVTKP+Pbg==
Received: from PH8PR11MB7142.namprd11.prod.outlook.com (2603:10b6:510:22e::22)
 by IA1PR11MB6516.namprd11.prod.outlook.com (2603:10b6:208:3a0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.38; Mon, 12 Jun
 2023 01:30:42 +0000
Received: from PH8PR11MB7142.namprd11.prod.outlook.com
 ([fe80::669b:f64b:f8af:3d1c]) by PH8PR11MB7142.namprd11.prod.outlook.com
 ([fe80::669b:f64b:f8af:3d1c%6]) with mapi id 15.20.6477.028; Mon, 12 Jun 2023
 01:30:42 +0000
From:   Gabriel Matni <gabriel.matni@exfo.com>
To:     Kent Gibson <warthog618@gmail.com>
CC:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: RE: [E!] : Re: [libgpiod][PATCH V3] tools: gpiomon/gpionotify: add
 idle-timeout option
Thread-Topic: [E!] : Re: [libgpiod][PATCH V3] tools: gpiomon/gpionotify: add
 idle-timeout option
Thread-Index: AdmYFHtBprVgGok5QdicC3e7gPxKegACUmyAASvDk1A=
Date:   Mon, 12 Jun 2023 01:30:42 +0000
Message-ID: <PH8PR11MB7142235C01A2C0B811861BCF8654A@PH8PR11MB7142.namprd11.prod.outlook.com>
References: <PH8PR11MB7142857DBF772D017D8148778652A@PH8PR11MB7142.namprd11.prod.outlook.com>
 <ZH6YcW4zp6YDizg5@sol>
In-Reply-To: <ZH6YcW4zp6YDizg5@sol>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=exfo.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB7142:EE_|IA1PR11MB6516:EE_
x-ms-office365-filtering-correlation-id: 352c3524-8773-44ad-2aa4-08db6ae4a300
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: y4KOiOXVt/bt4JRebRbwuP11MquC+HsT5BK62WyipPP2ANyuFgTnD4QhuE+97XxV9N+sYltsHoJ2NevqluvKpLYdNu23HFaOu27Rr+b0T9zfDcsFujtsTJOoyptwAJcBlRc4hUkORseQoZ36lIto2eO8J8Jf3Q8wKkZ4IM49sJL/lW5E5itl6Z6uWwjDltn7/XsIdomwcxiDiEmJTPFaHIMVdW7fKKVYraAt9hu7anGcYMrnIW9jEebFeQ1pikODGvdv+IHoLOw9cEw34LKx9r/zkuD8hsi0VkAWL9ZHzjBsI/4SFQTyUCrk0P6xi8QuZhNkiuzuwZiUyxjHrK3vn7o2WVVBga0K6CXWOJCD6MSRUmDLsSYg6tbCITavL14P94+t0f90U5xnGE+H5AhAzoHYZ2S3FZniZOzJV2O+lpNteX0Q81qumFsS7HH2Ev9rPPyR4v050RU2X7sVwNyxAYyFmlWQr1L4qBPg8TcW8/iIdJ0Klj8dM27aQqiiZQnhneXf12J0eCsfrFcESOuC6LyurohOE/ZmhvQ2L5r4QQtn2qM7l5Ou445CE/1cPTh/YJfOx5cyDJ7jSAhvHr9eeFm76OWff7nFMgIUiCVlC6g=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR11MB7142.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(366004)(376002)(39850400004)(396003)(451199021)(33656002)(38070700005)(6916009)(478600001)(4326008)(54906003)(66556008)(86362001)(71200400001)(66476007)(66946007)(316002)(966005)(64756008)(76116006)(66446008)(45080400002)(55016003)(7696005)(5660300002)(52536014)(41300700001)(44832011)(2906002)(8676002)(8936002)(122000001)(38100700002)(6506007)(9686003)(186003)(53546011)(26005)(83380400001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?cASmRVYCpHRXVVtKQ1wNTF0GHllh8mXHMgEID7b2RJ9AJwivqxvimH5MTeRf?=
 =?us-ascii?Q?j4tVsDoje50C+i/ZMB5CogLfrXtpxxjGDPNwORtjKhkMoSL82yTuSaVC2qHP?=
 =?us-ascii?Q?cRQQULVY+tGZrmr9ok92oiq1ekqstbtwwKXxkgsEXpcQ4pwklYWFxyx4Oh0J?=
 =?us-ascii?Q?pL1cOlbpGQ9kURSfhxQQoj8w/os+DWi21NSqhLJZQudfaYGncisV/LGYeq1U?=
 =?us-ascii?Q?F+GLwnqxfOL91qOJNbib35L0vouruQjEn/Pt8IGPx9xq0jfNCPBy+/AnCY38?=
 =?us-ascii?Q?lpwayVnLD4n8LJvdf3mOJ1WJWBIxuFLttjHHcIbZdcF0TcTdZv1vUyV5qJ9V?=
 =?us-ascii?Q?VXrxwPlUovOEJIuFxcp+DVHVzy4yJlclBFktmPueMQtHLUOE/U8ZAlGtX54v?=
 =?us-ascii?Q?Pkf3EtcyaZ/giwhjqTviL/Su/bS8R6ro+akZ10KvQFlwo4NygNgxs8P065XI?=
 =?us-ascii?Q?yne5JwCjDE1pVhe9cPtUDDUDR5kcr6I6JBobIt+3qyWuSAGOzPyXebD+H+tP?=
 =?us-ascii?Q?ROphcURqP7xkVd3oxs4aUFGCwltWB84iWEf+hA4psySWFRXlPFsDuEjAZ1Z5?=
 =?us-ascii?Q?3mBsKNSWZyOZ96VYWkJUzX3m+1x6ggWkuPKWKEJS5jeG4IRzr+SlzOsU4KRx?=
 =?us-ascii?Q?ROQwYFxUUSrOxkWKV+eKEW2QwkrUoMUI9OVMAQTSVYgFa0rYB9LLPQLz9zeo?=
 =?us-ascii?Q?vE5HlYRFiulOjd9nkU1tLLHwGN1nj4I5nmILQM9ZmVoWy3bXVHtTIPxvvjBg?=
 =?us-ascii?Q?jKqYS69C5PaEnWQnvKjkNY0cFvfNbVSK8Py7aP4fJ8/GJmgVgE3gETJnKrjo?=
 =?us-ascii?Q?sSFyffzEd3iqw5z0YjcZD9xxnPk7vb3OD3DEqpPBiH+3ITD2jykHuCIEEtJE?=
 =?us-ascii?Q?98Sf7v53757xo6mL0U5V+5n3Fu4o1vYE4ctrlF9/My+D3dIPY1GsCHfiMf5z?=
 =?us-ascii?Q?zmcMEvmvFIA8xQKDom4jT+H4SuqaVqh3x9kYNXndzf5+oOwVZ+VZnLA1RJkk?=
 =?us-ascii?Q?PDvB/ntH3hqdGy8mGBbl6s1vqj0qvduJU6qc/uUZL2u1VVUmrTSCMDNeJn/O?=
 =?us-ascii?Q?h/EBPlHYo1TbjuVcQqdrQbcr/U3Qrg69WVokK2+/cwR6+4Uf6/0zPgoKf7Yy?=
 =?us-ascii?Q?kWiS/s23OBWJY51L2GtY2nsSoqYtjzF1+J2TvGFN3T3FQbTB9e0ltK50QiDT?=
 =?us-ascii?Q?TGu7DgY0ZJRyZf1IqpW1nnGsKro6VtwReX7ZVO39M3uPnH3Hpfg8uok6DDhm?=
 =?us-ascii?Q?FE/TvVkB9Sqq3Nyxe51Alo2rppDqg9gexl26drWiSl9NpTmZUiFtYIYDoOSX?=
 =?us-ascii?Q?o12qM+cX2/1D2iMnNRaC/ncOQBOCCmWwDxpq450+Z3gapn9L5JR/N4TFOn6p?=
 =?us-ascii?Q?MI0RXvZXtpNXkr1bteufPL7ycuvArpHOoeUc7lAiKRRhZv9IrntW6J0a351f?=
 =?us-ascii?Q?AdhSTbKSrO5p1wxTBBsOBLI+17sWdHJxe7oHF6yYDPPP0Jy8H4eutky3YWJL?=
 =?us-ascii?Q?PxmdfeHlQW0I8DCOVZKPqRCByn9tNSYbRFL9afuodicWyrCIIpOE/ZHMtQsE?=
 =?us-ascii?Q?LIhvIl/BC5VgPHqjVKXAiyVmDkqGNQ4i9d2tDRLQ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: EXFO.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB7142.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 352c3524-8773-44ad-2aa4-08db6ae4a300
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2023 01:30:42.2379
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 1c75be0f-2569-4bcc-95f7-3ad9d904f42a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fgxrSuVaWNSYjdAhTeoeYiEcR6Pfj5xWc4zuVWsC6ZiMPowv9UnlL34ZJz4xGIjuCMxYLvOTD+b4c5Ww38qCAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6516
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Kent,
Yes, I will resend it shortly from my gmail account.
Thank you,
Gabriel

-----Original Message-----
From: Kent Gibson <warthog618@gmail.com>
Sent: Monday, June 5, 2023 10:23 PM
To: Gabriel Matni <gabriel.matni@exfo.com>
Cc: linux-gpio@vger.kernel.org; Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [E!] : Re: [libgpiod][PATCH V3] tools: gpiomon/gpionotify: add idl=
e-timeout option

On Tue, Jun 06, 2023 at 01:32:26AM +0000, Gabriel Matni wrote:
> From: Gabriel Matni <gabriel.matni@exfo.com>
>
> Add an idle timeout option to gpiomon and gpionotify to exit
> gracefully when no event has been detected for a given period.
>
> Signed-off-by: Gabriel Matni <gabriel.matni@exfo.com>

The text looks good, but I can't apply it as your mailer has line wrapped i=
t, and done other fun things.

Can you resend it with "git send-email", or tell your mail client to send u=
ntouched text[1]?

Thanks,
Kent.
[1] https://www.kernel.org/doc/html/latest/process/email-clients.html
