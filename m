Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D98863C162
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Nov 2022 14:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234624AbiK2Noj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 29 Nov 2022 08:44:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234640AbiK2NoO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Nov 2022 08:44:14 -0500
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2070.outbound.protection.outlook.com [40.107.20.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D91B764A30
        for <linux-gpio@vger.kernel.org>; Tue, 29 Nov 2022 05:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qg0o5Wa4Zw34FSPQVCvomgOcitsi1569Nzw0Wo/pBah9/M40xUjymrGbmTISCLazJBKkpzRdvVreJXWUYe96GEpWIDAZ4ZUYsCFUJyZns6w20OGm2eYCQhKr3f7P0fhXG9sRAlai2uxD0eLH1l0lVzxx6qOtUIcaQA8FD7jadvgA9UaU20GcyEIvxwJhTIT2LvAiMDVIvhk+uQelUdMVg+skIDiwfxf2VTMpraQfpSA9qDfphmRTs2lVgmEN7qOFbFpANFsVH9D/NIxQPq6QTHCZ6ERYiFk6199vQVDuC45XgMTLqp5vGnGoLUyJJutkqLMosexBNfn9fpFflMsVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dDmC7ta9yS1mu//BtKRlje2fX52bcbJopDI2RJZTNtQ=;
 b=ULy8EX/mjHRQe9dwrVbzT68G6hyZ6o6zAO2YaCg2oOUcc0FBpopp+TzRKwGn7DnbWk816wT8mK2Eespd9CKXm6Covs8/GUispi3T3YzN2Ah9LtST3cnxJwyUbg3bodxci1RgaaUZFDlkrhO7Hq57eVzNKxtxHjU/a0sra0vqZXI7m+7mMHmIvPYNwlGmgniuxO7n8hRkqqDfoQmU8LZCX+mUnmBhOz9dveY1FDsZSVWTVmqn6XvtNTTYy0+ub5gKlmjoj6jhBLcCJHiCBjHhAtD1G+MMPiSOMb90a/Cro6ZbxcjU4aq8xakduxINLI004lDh1IxoUIT6dWXuwRRnIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dDmC7ta9yS1mu//BtKRlje2fX52bcbJopDI2RJZTNtQ=;
 b=PJyskQQZdUhNgZ/PIUHJbDb+rTB7dQt990lC/qvd9qP2CZ6ARD/MZdebUvHNQrTln5lsDiSTKLU1CBFf+Mr3f90SjdKdHLdoDjqt9e9LnVwjnEKTy5USI7gFgK2s0pt3WJoD9A2gG1V8Ai2Pj5797Up4GoIm1RmRTBbjHb3dbRc=
Received: from VI1PR08MB2847.eurprd08.prod.outlook.com (2603:10a6:802:19::31)
 by DB9PR08MB6523.eurprd08.prod.outlook.com (2603:10a6:10:256::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Tue, 29 Nov
 2022 13:43:49 +0000
Received: from VI1PR08MB2847.eurprd08.prod.outlook.com
 ([fe80::6ceb:7a1:fbed:efaa]) by VI1PR08MB2847.eurprd08.prod.outlook.com
 ([fe80::6ceb:7a1:fbed:efaa%3]) with mapi id 15.20.5880.008; Tue, 29 Nov 2022
 13:43:48 +0000
From:   Guillaume Gardet <Guillaume.Gardet@arm.com>
To:     "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
CC:     nd <nd@arm.com>
Subject: [libgpiod] libgpiod tests fail to build with Catch2 3.x
Thread-Topic: [libgpiod] libgpiod tests fail to build with Catch2 3.x
Thread-Index: AdjZXLZ/iAvn0aFQSqy8+uiZcKai/w==
Date:   Tue, 29 Nov 2022 13:43:48 +0000
Message-ID: <VI1PR08MB28477099949351300914D77683129@VI1PR08MB2847.eurprd08.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 609E86896CEFEA44BF478F657E3AF543.0
x-checkrecipientchecked: true
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: VI1PR08MB2847:EE_|DB9PR08MB6523:EE_
x-ms-office365-filtering-correlation-id: 7b012d89-bfdb-40b9-6be2-08dad20fbe5b
nodisclaimer: true
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ISI0fbz7E+HHpAW5mrm6AHyiEMkcu3WNlXt9yJlRHb4ZqerlPKq32sd0MEKjevs/2yCHZ6xzrInUjEbmL9uZaxYUgnL9kOOmyqu1lDR+7N7zZaqt/3kkkjLslj4jSCdq6LKjrH17fNVggPIlMymDWnuB9doYQKjtWDdA+TSyfzx2brL4gPYInphjYx+oP8qCeIRhLFlitWFTG/kx86T52AqmXub4tEzSCLOFYhyJ1Y1sKLTqHBJkB3i+5RTZTNNy2B2zIVk67DN9QT6YGN8XL21UZOrxTir46iZtOWeWstsqGNG4TQO9Z+wB4CbdqQw4BeliXW3jt4abiAtznBil0SvyqyAtFwlyDlZh+RapPDmkTVZVPbCg3QwE2kvoE7sLksfAnADxkrXVwnlBkCL+ePRGL7IYioT0gd+AIwl69A5I9kr7ZFyCIKJI3oksGDJGBiBaSjEkXbrIo3LWj/znTzLmPfkNJ5CEfwIm47qqo6KE89vrObIhgiiomJMXIqoICK6mJ1BXWDcjA3lUSj4ILsvVbZw1oOdAmeI4zLGOahzoat4Fjt0AZ5Kj3NaggEM0rVDmQR4Hg8ON9cjxO4RfQ5lgMPhYoefLFhn0INp8NaxzjpnYQDH9W/hX8q5bo/tobBbyzyZsXdZ7u6kmzC0uhm647bmTRvjeBbUypq4tFx16HK/QbFDrhEA+Z25ntmMIRocZbSG+DPfDXiVFTOrSM+9GArA3tGop8LLx68obzsk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB2847.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(366004)(346002)(39860400002)(136003)(451199015)(2906002)(38100700002)(33656002)(76116006)(66476007)(66446008)(8676002)(66946007)(41300700001)(64756008)(66556008)(71200400001)(122000001)(478600001)(9686003)(966005)(6506007)(7696005)(186003)(5660300002)(8936002)(4326008)(86362001)(55016003)(38070700005)(52536014)(316002)(6916009)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uZBhScaXBOgD6WI4Bnob46dpfHc+JPiBVhsLVppaBnUDP+zb/FEeLGc/u6uu?=
 =?us-ascii?Q?10QN+aIktxAItS+XyBZVp8sk9uY0LIiMbDC5P2VMHTuBjwxzVFjsgT/8QJki?=
 =?us-ascii?Q?xW7OPN1LsWjTIzmxqbtUdyEevtFiRl9gSF1Z9DQq5z8HeZGnPfkHYOq22QTM?=
 =?us-ascii?Q?g6MPgEAUflM2zwH1kxF9RYnuQzXms9Zvb6+kT+li8n84NWhtoASkxn6Bliq+?=
 =?us-ascii?Q?veK5fXyVxBIf6kg2ZE3Zdt1iMwCiKBxBohTPAn+YhUPrz01uEPwbgla2mb12?=
 =?us-ascii?Q?SSvsPS9NCxOCfURoIp9Q+/Xz09NxPDqshfY2zXjaJLnuUde4kOiFbjnzdXHB?=
 =?us-ascii?Q?dGGty8wr6vYLppU3JeEOrDAoopfXJUfk8WbsYGWXBBLgfe87iLDB9YlGuw+/?=
 =?us-ascii?Q?VFvwRpnh/fQHGtQjVeIl/iOIaeElww+EdSdPK2NDAjSSWpzI4QbTkp/HIlRa?=
 =?us-ascii?Q?Qlsful5ocbLPCQGxwqNwB3pd1NcTdaB0w930PK/r65ZS1rR0zN4PbKdcIbLs?=
 =?us-ascii?Q?gW9eB3g5E70DrG9nhTeTob362IakK9x6KbrWv1HmLj6pdRXpSeF06HJP3Dg2?=
 =?us-ascii?Q?hjcsh3MSdT6+WhilvLts/Ms/N1xmk+Qmtvj0qiGLpjDbLO3gyNU/XntqhU+D?=
 =?us-ascii?Q?ufdPGIUsxBdb0sTgqWywU1wkVmpk9Ms9WWQQXTgnt8t3aWb+UVgVBILBVHAv?=
 =?us-ascii?Q?SbQGgivAtQUoUt/6rd79wYDWlWFinPiZ5rWUdQBa4/AL0zi2b0LafJ/G/3bL?=
 =?us-ascii?Q?WoE6HnsSFEAghhBS7uOf6zO2f2em9cV+faga17xSFZtoN1Pw2h1B+p1x07md?=
 =?us-ascii?Q?IV1tXb1W4G6Gb4UjofPUhDLPQfdP2lVdTMAj+Zg9MJdeMizQFT1Om0Olavbg?=
 =?us-ascii?Q?KphBbhsu3QVAsI2WRN3aIr9gmLpMyYSVrJkaCbN+A0dsZvKRopBw7R5agMjT?=
 =?us-ascii?Q?d4+9adWTa0XsZo68VbnRFnVmKU7M+9cK8Ar5XKDGbC13XRnKIUWW9VHeA2HM?=
 =?us-ascii?Q?pVRyGk0CYO5HBpSsuQZfYt8Dmky9OiEO0TstZhWVPTn6I9SosC01RZXR97oi?=
 =?us-ascii?Q?0tjOB4sNbz63TEeqEgrdKBb1vBmRZU8nNJx5vO3Z4UnpaaEpWsCUdk9vxBYm?=
 =?us-ascii?Q?ckBoL6tL/hpFytt+WycmE/23/TKe/BUhQBtIgadtqxWyOPdW4ji7/zcqsAlc?=
 =?us-ascii?Q?yi/Gf5CsSRmBVWqJhqAC1Mv46ZjdaVmitD9e74AAsaVhaZSerBV0ngmef2rF?=
 =?us-ascii?Q?eNT3etxuPys/KzGn7oZ4JVZseQbV8bMWAl+z1dsblCUGyj6cyk1GS1iOYGC9?=
 =?us-ascii?Q?wJqPm+hWdrrvAZeQaxjSnBbgYXn9wdTioH+5yyJOpNNwCsg9ynhT8rp8oilj?=
 =?us-ascii?Q?oAM3IgHL5U05ISToySBquLQcDWlHELPCiXDJQqCjJhz+6NQ7jl+48Ueo8hls?=
 =?us-ascii?Q?tbn+fU3GXyLuW4IhhEHuc3RZZJZg29gxPwxUh8Nk+khoVp2UXcmk/w8vbREm?=
 =?us-ascii?Q?EiN0JKtFvqqs7FYIPJy0uC89wMHCIBDdvlxMlshwDVX61aayW6wZulOsudQw?=
 =?us-ascii?Q?n6rgiS5JzbQXKXU5OY28421owarJxIopNrbsat2vbn6uBy+RXFn6q66QUlXF?=
 =?us-ascii?Q?x4l7CM8TpWR8PAUOMcSvGKcO26b6Y/yKEYfNpK77NLu7?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: VI1PR08MB2847.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b012d89-bfdb-40b9-6be2-08dad20fbe5b
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2022 13:43:48.6038
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8N+45A1wa1irUj4AJD5psxVsGmf3dLJvPMqL7+I0TvShzPOnSU6uaxrA2YC5hIcUhkambJCoSSgt3et4vCcyqQsRMe+xCxIE7SDWFScwXjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6523
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,FORGED_SPF_HELO,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_NONE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

libgpiod 1.6.3 only supports Catch2 2.x and fails to build against 3.x with=
 the following error log:
[   70s] gpiod-cxx-test-main.cpp:9:10: fatal error: catch2/catch.hpp: No su=
ch file or directory
[   70s]     9 | #include <catch2/catch.hpp>
[   70s]       |          ^~~~~~~~~~~~~~~~~~
[   70s] compilation terminated.
[   70s] make[4]: *** [Makefile:494: gpiod-cxx-test-main.o] Error 1
[   70s] make[4]: *** Waiting for unfinished jobs....
[   70s] tests-chip.cpp:8:10: fatal error: catch2/catch.hpp: No such file o=
r directory
[   70s]     8 | #include <catch2/catch.hpp>
[   70s]       |          ^~~~~~~~~~~~~~~~~~
[   70s] compilation terminated.

Catch2 did some breaking changes between 2.x and 3.x versions. See: https:/=
/github.com/catchorg/Catch2/blob/v3.0.1/docs/migrate-v2-to-v3.md#top

I have a patch for 1.6.x branch _only_ due to licensing issues on libgpiod =
2.x. This patch make the switch from Catch2 2.x to 3.x but is not backward =
compatible, so once applied, you cannot build against Catch2 2.x anymore.
Are you interested in this patch?

Regards,
Guillaume

