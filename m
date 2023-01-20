Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 095F0675654
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jan 2023 15:06:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbjATOGk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 20 Jan 2023 09:06:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjATOGj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Jan 2023 09:06:39 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B11C310F4
        for <linux-gpio@vger.kernel.org>; Fri, 20 Jan 2023 06:06:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L23M6+x5JmSy3tRejdD9fukJy9YWZWDmapjKftvbFLgCorNyrOCoPRD32/u3qNZ1+Zdbr1wUqEPjYrfzjXbXq0aV8cdhf+9V/Fay92wr9oU8jSJa/Dv3ASgy4K3DCcwDR8uGVP4dSj58U4hj8FfgQWZvrV4zxs5OYiwWQTXrThSuHrSpKT/5S2E8zR6/OMdwVbmy7yO31dKOg9Ao4TUPrW66OzQOdlYTbscNhXTsMfcSBp+C/lftasYe1nuqyW3AJS9Sn74c/TYjB2yXfd1A+OCgjdaQobGbgv9JGTlt2UEGutBcfo9n3WB7367uMmUUzUpVlbQAaCSC1ECfFUPsGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8G+QqEd411y9PbLA8J6p9HYmDm8NB2erRMBjZdqwlpU=;
 b=Yz6PXtB6P6NMU4ohydyklElMYok9QQFQckSs2YesR32G1fQ5iXzaPfbgFJhHedSUIPF7ZNfsxvGdycoWP4ITPSvFddTaahCqy4x+HxvCY1UNY86J/3ZPxdfsrYr8kxTCL6dX2bb8u3aD7MR9k988hl+9E6XwKcWXre7XTQHWfriykz07TAW7YL4+ZhugJPvNnc+Hb3z0v4YhBT21Bq2VMTrHMEwYdzmFYv0IFfKNje/FzEjoXg9anaYqXpoY1qTent6IpDylNg1OSQOO4ChM4y3/ycaKoa5b0QfE06F684R4TAVmWaJ+tQJ/kY2aDNQgcJZImPkxVquZYT61blxNPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hidglobal.com; dmarc=pass action=none
 header.from=hidglobal.com; dkim=pass header.d=hidglobal.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hidglobal.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8G+QqEd411y9PbLA8J6p9HYmDm8NB2erRMBjZdqwlpU=;
 b=Y9ldBjbibBfEOfpAkCM9jaWVuuP5QsKvm33WBjXKh3D+gfL5o/79YBUCMTEvSkxwl6NvmtB6H3RpuDIO62WMAKmiwZuwcMUi8ytpYE4ufd7ZJJ7bLXyOk8zshZLxkD9mRbWmfnOmSLeyQ/+1FBXOPUa4VVPlVIVk59L0hHmwfkiMBs+gtBWkObVqQUTxNDqnb+yyVZuK4C2JMhHkjMB3fU/cp9taoYDLjPzlvqJXEXw7EwJlosxQ/9WQW3egMWTJ6YbebWoNFU29YIr1fft960Q8IpOtPgaYkSHn2+tvWnwZRseUG9lriG/r4WV6nSXsb2iQqBHuKm1tLN609cA2MA==
Received: from DM6PR10MB2908.namprd10.prod.outlook.com (2603:10b6:5:6e::25) by
 PH7PR10MB6106.namprd10.prod.outlook.com (2603:10b6:510:1fa::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.7; Fri, 20 Jan 2023 14:06:36 +0000
Received: from DM6PR10MB2908.namprd10.prod.outlook.com
 ([fe80::a048:cf0f:6c5e:7895]) by DM6PR10MB2908.namprd10.prod.outlook.com
 ([fe80::a048:cf0f:6c5e:7895%4]) with mapi id 15.20.6002.013; Fri, 20 Jan 2023
 14:06:36 +0000
From:   "Naidoo, Vernon" <Vernon.Naidoo@hidglobal.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: libgpiod multichip bulk event wait 
Thread-Topic: libgpiod multichip bulk event wait 
Thread-Index: Adks2GWEgUfn5iyVSjqA9FnOpAtKwA==
Date:   Fri, 20 Jan 2023 14:06:35 +0000
Message-ID: <DM6PR10MB2908B13E4387EAA786CF5F0FF9C59@DM6PR10MB2908.namprd10.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=hidglobal.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR10MB2908:EE_|PH7PR10MB6106:EE_
x-ms-office365-filtering-correlation-id: 12b0c39b-111a-4727-8af0-08dafaef8acd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Mq03XPm8avfP1ID3bI20nonbzGbW4vAwB5lziyQH4mXKW2MrVvBel1ib7P46m9lQaRTsJ0foL5/B0Whjg1shIxFFvHNo0mVbkJ7cjouGP7sN8YXk/QbhJSXY1bmp7+kcV8OX489pJOgvvTiEwWOYYspZKeln2ZzG+Et4g5K5/YGWUPLZav9Pbu3P2P2AFLnjtZk8gNKW9GpW61Hlegw/JPMU+OQdu8flUl//0R7BcZ333iMdub2zwzWabVfL8dKyN5ksRn0Vbo7FA/i73MXpU13s2auoZJHfCmqh75rkm56JP1yw0quRPszmi8zh+WAJFpyCKW9H9CgACOzJkCCwcakLok25anYQ2bhssd/TewCxFEbjpKSuWMUJtRlKPHw5kS9E2KbUav1hnOIi4d9jFZbDapPDCZIhY2yZoRJLhAdzJFOq/ttGqfygF4bHbb9yc9lUXiwPxnNslJmnjOmPp0++4UKDlMddtzdaEc3Wf7JydG2D5BYw2w/xnQ/BznJynyiWqkptq8QlVUVKB3wr+zLQpZyG/5FcoxbUu6vixmBNnRB83Wn6a+q64PYYLFu7/aEsnh2M0bjpKQH2sJvYE3aa+PBq0gTyZyJBWcSudqmRCrvgpWcFidG0zJPZ9cUyktjH++p6nBfwz0kyM9nMm1YEEQtZ6LNUtQYHzNIf3wqUxIjvRAtJ7fL7t4sxASigCkn53IPmLR7++OG6ACmL0w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR10MB2908.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(451199015)(5660300002)(8936002)(66556008)(66476007)(8676002)(66446008)(64756008)(6916009)(66946007)(52536014)(76116006)(71200400001)(38100700002)(122000001)(186003)(6506007)(9686003)(4743002)(2906002)(316002)(7696005)(478600001)(41300700001)(38070700005)(55016003)(86362001)(558084003)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1ZtrdU4q5twWi2FQuQwtyIyFl7HiKtFc0Y29xV2uz0j8SEh6m0BjNYwbCIbi?=
 =?us-ascii?Q?801s5NvIvBMYXPKVAB3qExZSroyfzDWlv3q7Y80453yc0l/nfyMi91+U4q1n?=
 =?us-ascii?Q?kGb67Bk7ijSPLBlMQyozpPjz9oezvyLqyV2aWSN9t7/27fGQvNK9iVVZ+SED?=
 =?us-ascii?Q?nWBsDQTH+PAr/0yFtF+yoy9VYbmqgM2Es8bnwp7sUsp1XKt6Cx1QvTDTThmu?=
 =?us-ascii?Q?6SG1qgdB/tVL0ccByC702crQhkzYIsva7tQZqLlUAvCnekPkR0RuQ6Qxe2GC?=
 =?us-ascii?Q?UrxoMxgYrrCvrQneN4osH3hYPh/Xgo8KDSl2gm8nWAz/TY0zIkNCU6znLQd7?=
 =?us-ascii?Q?KmtlGk7W4UbtSyuUyKBeNA0XiNnNVdEkv2wiOYhUwdxaWJRvdHEa6WaJe2tG?=
 =?us-ascii?Q?8nv0wsuPGuhHaiICChExAfG2rMNwXCXjrThk+MP95vh+kWWYuIij9XuDJ1yt?=
 =?us-ascii?Q?xvXv/IdVoDFDkVZjL6YIGy8Db60n747imOqiP7Q8AGuNlhCVFOZwDPKCajNN?=
 =?us-ascii?Q?oxA3Zvjm1scH9m9z5cVMyqTnHbRM/VwK/ViTeb3unN7ncRv3JRxi1zz7CmsP?=
 =?us-ascii?Q?vGwNauDAd+f4Nk6j6Wn3iaTmjqfDZTjMutJZUuzw82kkQTpxK8ai+7ZOWqd6?=
 =?us-ascii?Q?9LPWitXZUUE9yvQi7AZmJUFon9+6yvc+ztHML3GlllyxnhsKs/r9y90CFqMq?=
 =?us-ascii?Q?aLS+wluqGJBYMvEJCO4dCUtWkf5NIXAcm9FXvodlcIJIU1bFkQUHijD1hlYI?=
 =?us-ascii?Q?Oph27e+kJww18h9gJ+/aMcM3IP5A5qM+RPwvjaE974dXYVZ2dt0jQTtWXpyY?=
 =?us-ascii?Q?uwEfhmvbP8fTasYawJNsaCy3NQRM9Lah8v/8YOBre+oXbNRCWw8Fs1txk+UL?=
 =?us-ascii?Q?ZzOmCbpu0D5lzkfAdSMokpcSvvCX2/QeneRfkDpN1hcEq9pQY9QhpGYEoAFO?=
 =?us-ascii?Q?ZiIATAN+/MyukRpngfy33RiraiODK59jkf3M7EK2tUp7sR7A8k80cHLxueND?=
 =?us-ascii?Q?g2MzxY52qjBJlfiHTZYa+MAr2ULPAYxH0V2VPVNv6ZLOBD2ziBUVZsMX2ITH?=
 =?us-ascii?Q?PKZzQ3gfv0KAC6csOMYrdb98/1wrWRlL9tmT/AuU44Dt2SYoBw6qr4lW+FIx?=
 =?us-ascii?Q?j44S9VjIh21Cez+FX3GGRdEahcMUI7zwgrB818Kt/DPmroK45cM37W/UF/WB?=
 =?us-ascii?Q?FssIdqTNCe6LJQfxqbUGsNUSMxZT8w15k4qCu7ga4tHaBOXrNBPYNpTB+mlA?=
 =?us-ascii?Q?L+ms8kqT/NcX0+zdmo7ZJRLwgutP/csmH0j3PEfvE5Xd9LMvZMmdseztq5TL?=
 =?us-ascii?Q?fGJLOr5rYV3GKNoCCJwALt9oH5WWgBrrvkdv8UqF4f0+dnG8s2p1/TqGNED/?=
 =?us-ascii?Q?zLQRhW8zHZNeiYbJtaR2Y5ENhuxaJ3OD8vfOdRmHDb4iBKdjPMkg+NLbNObc?=
 =?us-ascii?Q?HPA2RivhVPAY+iyiQQvM/59dwBOhCNzy2M/OOJKl6zcEZC+AhPTIbz6CBq6M?=
 =?us-ascii?Q?hBjC1xPZbfvJ2kuB2dr7eOcic5r5qw0Fru0KeSr+/3wA1SC9bvc/kOC8cODa?=
 =?us-ascii?Q?I7U8EbSg9IiWxdgt+Dv/K5DV+9WswfPSWIFhjQAusbcIXOs1YCJ0h8jcpt9+?=
 =?us-ascii?Q?qV/UkQeWI18gBnUsRxuphkt8lwBl/RB7U4j6tTBzvaUa4SNFc1hRn+8C2yJZ?=
 =?us-ascii?Q?qOBlYA=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: hidglobal.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR10MB2908.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12b0c39b-111a-4727-8af0-08dafaef8acd
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jan 2023 14:06:35.8575
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f0bdc1c9-5148-4f86-ac40-edd976e1814c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hx7GVZhbjKtyS61Zgf2IuO9C18JEIqgHJryg5EypAC8pEXtzwyJTKcb+0hSpV6XGAZwDO2IztMUz9bXvYXQxsi4zJSdUlhzWEZvz/3/RfBs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6106
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FORGED_SPF_HELO,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_NONE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Good day,

I'm porting some code that currently uses the gpiod_line_event_wait_bulk co=
mmand, however, the new platform has the gpio spread out across multiple gp=
iochips. Is there a way to achieve the same functionality when waiting for =
events on multiple gpiochips?

Best Regards,
Vernon Naidoo
