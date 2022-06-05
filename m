Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 961E953DEFB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jun 2022 01:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348021AbiFEXhJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 5 Jun 2022 19:37:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348623AbiFEXhH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 5 Jun 2022 19:37:07 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2119.outbound.protection.outlook.com [40.107.113.119])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B148E29;
        Sun,  5 Jun 2022 16:37:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RWBr1LLtBkfOJMwsfvLC3U4GoW5Wb379ssbl0WHXHdFlYpHqvWAvRIvVb0T2i8alEUhxc6GIBkPxODQQvMtXGSlq2sIJsh2upZhdgMk8gt1To3fv+Y6f2g6EQtR6cbeHMPDn3Vjg5KQgh902BIUpdxZj/PuDZsiIuyiBprYo3be6V3HhUPwZMLEkpzRlyRoglw0Pmy/srXrmZK5n+fa2NVLOHYSuRoT1xaH4m1Szd8NrBjYg5naI/ldbobY47uzntgqCAKq/cUanEIqD0ql4m0y28vrF7K1VN/jtROgsQBpWmFyAIjs/Z2nKLe82yqP60sawCav4gozlEIiND0l5nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR78PfFcQ3/jdZtBnWO/Z2ZTFvGx4KGFIOs+gqAXexk=;
 b=iau1Qxfj+ZVt26IPitC0HAKSzPZQL1qdNVHxDWo9jg4dO0Er4L9BcTP8wg7L6+E2SD4AYimOZQGjhTCNEz4fN+BeP8K0RbkILHY8xdHAUKmTDRqjKqzZi9Pjuq/ujuyIPf6L5awuvMTRAaw2ZBR5ReNTM9LQGKJ6PdHYQ8bgOiM+1NHeP9Bu/LwYNjUz4TstqezepiooPWe6lgTpKAXIbklqJ8zEqPdTRhgxmyP7u6HS7npNvNIr0WmgQgfc1976gbmVZtjELy5WozKV20jnD/DnZDaaXgsBLMuubElMxAfBdz+uf48GIxle6ZUTu5n+aRnihLyXJlFV1OhAlacE7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SR78PfFcQ3/jdZtBnWO/Z2ZTFvGx4KGFIOs+gqAXexk=;
 b=hK6csQIIZAfPFXJTIdmHPjZkiRYIiIWu1vSBkWsYffnBv24R3wt02CSiwQf+OPCugFfW1H+2xzkOpopOBqNMsUkor9ArNxYilop/KmBedeku5cxAJ65LHTM2RZTFVUW2b+rrAc+5dJfD9YGotozS0e+9gFgMrkLsCFw+e3r6YJI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com (2603:1096:400:15d::5)
 by OSZPR01MB6326.jpnprd01.prod.outlook.com (2603:1096:604:ec::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Sun, 5 Jun
 2022 23:37:00 +0000
Received: from TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::94e9:468f:5c09:5f74]) by TYCPR01MB8440.jpnprd01.prod.outlook.com
 ([fe80::94e9:468f:5c09:5f74%7]) with mapi id 15.20.5314.019; Sun, 5 Jun 2022
 23:37:00 +0000
Message-ID: <87r1423co4.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 0/3] pinctrl: renesas: r8a779g0: Add pins, groups and functions
In-Reply-To: <CAMuHMdUWCjFRnjVDzrjDh4ODDyh5hV5zdM9o4i20c4mLXhNpHg@mail.gmail.com>
References: <87mteu49tm.wl-kuninori.morimoto.gx@renesas.com>
        <CAMuHMdUWCjFRnjVDzrjDh4ODDyh5hV5zdM9o4i20c4mLXhNpHg@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date:   Sun, 5 Jun 2022 23:37:00 +0000
X-ClientProxiedBy: TY2PR02CA0041.apcprd02.prod.outlook.com
 (2603:1096:404:a6::29) To TYCPR01MB8440.jpnprd01.prod.outlook.com
 (2603:1096:400:15d::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe0c4af1-6393-4ccd-fd43-08da474c4979
X-MS-TrafficTypeDiagnostic: OSZPR01MB6326:EE_
X-Microsoft-Antispam-PRVS: <OSZPR01MB6326F5703FE1BAF1DA5D6EA8D4A39@OSZPR01MB6326.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fcvzm6vZf52ROdEFS+EhMGN5w64XZah0UllrpvuVHXWHbAQPOjkvj1tJ2cZNBA+i2wW/qJsmI8c37sYs3CAG6OK4lEpruCHyyBQiRrnIlZ1WtRwkL/fzpOUVLMMLVvLuMoEJGAHH6C30ep1MZy4RbR97Bo1kv11tMcKm4Mmo+zx6pYIc2fDpE10b7qff3uy0R9ndxH9+8m9KA1lI9KtVNwDeXb99St1qXrv/wq4KoaQt5zLKlCFTd1akNUthXhT0uIBRLqLnPqi3CHsYXM3aacHFrKw6r9UOdIfpxdNrAgDS/L0m58xu3EW8i9mArz6i9QaqoLD/hSNvH2W4OPoy4aKYDPOSPgG/WlTrOq80uWSUZY9AI1ZkCjS447wAp3MkdZ+9Xz4csy+tQJFZxKggq3RlXSlXD5wzGdK2cmrRgJWbpH8EUF4K6vs+is8s2Fgt7rhbv9dREoqXFC6mCGtwCoHEZiouGcUU4XhfzzceyWusFnGSWAppGNwp6d3EEXH4++khoWFaKoiuAYDdOLxUIYK+vtkcBQC8dvzoSb+HUblG5j4V2+hWrcNzZtupVnjsnJptEZi/NIg+w+V306ZUjq27Ys48DK8xn51+zYq7p631ccUzOyGe6t49z4QgIjBxmKCbgdmHDN1zx8G8ZFOPKZB82G/AvRhIlsH0Qccf/IXVpTy+V6YxqfbrJju8qxIiB3sIjRK/m4E6ZRB8eEpf+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB8440.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(186003)(52116002)(316002)(26005)(54906003)(6916009)(6512007)(2906002)(508600001)(36756003)(2616005)(6486002)(86362001)(8936002)(38100700002)(38350700002)(4744005)(6506007)(5660300002)(8676002)(4326008)(66946007)(66556008)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GP4vmPNe1zd/7/4Ux22GZ3ucI+tSw+uWbnXBYeiBjbCiz7q++lRlGsPJZzEY?=
 =?us-ascii?Q?TzqhY8pLL4LZBxISHdWOt9++nDj2ziHpE6EtC8MODIb4kDIaRszxo4nsjCCr?=
 =?us-ascii?Q?P4KNwKigZ6G3+5o0Wiotlgpeqb2vu6v8dDjM0DpQOD1z6A6Y7F2ay9vLsce0?=
 =?us-ascii?Q?zzXy2C09eyI3+9QN7PZdTHCPaYrHyK/0k3GhsY/jl8WwFRlET0SNQq8iGxVa?=
 =?us-ascii?Q?52DHJ9dMDVWqJ2CI1qM2TLq2jBH5ubzyLASZEOF1cXwxCT+awz36L3y70Be3?=
 =?us-ascii?Q?a0pd420pIZJ18xrHNHUsfcTrS5VVQnh71gkoiCAw1zjPOh1jqZ9QYNaZ2fwt?=
 =?us-ascii?Q?WWKeTd6R/o30zgIXu4niiBxuTGJeu7JNGpFbCTUe5tHJ7oKw9SkhLFyUFTMr?=
 =?us-ascii?Q?EZ/K6vgQvWrYYMQbQLF9qxdv2cduh9t76lxK6XKoZOVBevdhiRTQ1psc5K8G?=
 =?us-ascii?Q?1hF/i5KK346w4PkP5yNESB1bI1J8i1TLGt3SE5NNNR6xlkjadLpz747WhdKq?=
 =?us-ascii?Q?EX2w2c74KrgV07yheYbeOnI/TOHj0RyfBgcK/K36aPlhpiKu8ilr5qodyX7g?=
 =?us-ascii?Q?JascPr7D580IkPy+Ue0kLxTd+weaGDlA09/vJrz5NOENpuwY5D4xiqmMhIz/?=
 =?us-ascii?Q?iik+tjuMCMTUEa7Z5nidOiYN+gUtQKCVAUcxRNZh4+YMuVEQTxNf492ortcl?=
 =?us-ascii?Q?TE7SLPBFP3shnWy9cJzrHKFVa69HrlXpcm0DoQcDO8r/KVh3QTROy7GFIu3o?=
 =?us-ascii?Q?+0mcjF5cEbTdcNLFRWMHMXcu7ttfCwApDBPRw8Hk0rra43wiy4V17JtkmS7N?=
 =?us-ascii?Q?OtnMAq6eKAFbXKBicvPCCsPDvrAPdbWcRCBNo/irwhPsjGsRX5beweLFeuB8?=
 =?us-ascii?Q?EZDnm1xzW3P7RaR/VkH9Zwxxjkac9Yg3JkJ5AxQkrtqwOfAC7jCkduQN9pmE?=
 =?us-ascii?Q?Q2AfXcam9u6WtJpLKsrz7eu8KOGREWB/zMg6M3j0x20siiEvddBPg5L4iE5C?=
 =?us-ascii?Q?faPaxQGodVqi8u+NM64K675/WwecL4jnbG0W/gspd276LnVKLThsT80kqaKP?=
 =?us-ascii?Q?tqqqL9uE6+yLT3qIOBe2PUlql9MSGh+tCbpMkDEBViq8x3JP9wtedGpoi7ad?=
 =?us-ascii?Q?H7UKGOxugViB4TBWhvDvLmrq6DGLLOoUskTB4JsAAkXOPJGGYYGpPXDv8hjE?=
 =?us-ascii?Q?RqhNU8FUjpbjGMsFid+0y/01Ba8Z+jUmcc9eNOAG+maaMRvq8DQ7elfbDWQ7?=
 =?us-ascii?Q?RfUZoZiSxzJPd56mc3FTmflAWbvfB+mqWyFdl0N+6juNiOKbulwAM04xSluH?=
 =?us-ascii?Q?ycjBAdu0SBnjxYLyjWFoQzjLSzkNqpv30F9vgP6SQC0BWVlqPpKCSJOU6ANh?=
 =?us-ascii?Q?+WeBfla2Os7vnyCGK5jUCrlpZVJN+Vdk6WBBn392i7nKc37itbawm99nMKph?=
 =?us-ascii?Q?J/ysspeEe6+eCRR2+INfoUSg+WOCWEJ36FfkJa/WGtmdME+uqxBQ/YKNtkqj?=
 =?us-ascii?Q?TBu4UQDwXx0zzBAEdLEvuzhdDd2g1nMjyzInMjBv8kF/GyHO8BnvksmSb0VZ?=
 =?us-ascii?Q?rzdRcqoYxv/dQTcyHA0oW3s7b3PXrD1mi2rVCwZ4Qm140er9Qt0I04AhzrFZ?=
 =?us-ascii?Q?59MOiOMtkzmtI/7FIyfzbmlJwQTBEVFAb0iDkJcoJDRcVbhr+dZdD93gXBGo?=
 =?us-ascii?Q?A7o/BsMuhT1v7vq84FB/if8SStdgzV3dhMWoxa0cTKz4YkVTYFXyX98raAne?=
 =?us-ascii?Q?GkcwKOTX910VxKQiwRKNKsqCBaMhpChxQhwFvxwUmQ5gwWiBCQZa?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe0c4af1-6393-4ccd-fd43-08da474c4979
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB8440.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2022 23:37:00.3414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aj3GbEJV5hqQn/0mUdsfladVxeqNm0A/8s8DsowbT6x77muyw6CuYynVtphC0qcDf9NXZqCmezK9B9NWNLs4+qKfmTFIGyzzLNIkgtKSC6O2znaGUsCv+xKfetq6cBiE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB6326
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Geert

> <kuninori.morimoto.gx@renesas.com> wrote:
> > These are for V4H (r8a779g0) pinctrl patches.
> >
> > I have separate new macro definition from original patch [1/3].
> > I have cleanuped original initial patch, and merged its fixup patch [2/3].
> > I have merged original many device settings patches into one [3/3].
> >
> >   [1/3] pinctrl: renesas: Add PORT_GP_CFG_13 macros
> >   [2/3] pinctrl: renesas: Initial R8A779G0 (V4H) PFC support
> >   [3/3] pinctrl: renesas: r8a779g0: Add pins, groups and functions
> 
> Thanks for your series!
> 
> Here's a first set of quick comments. More will follow later.

Thanks.
I will fixup all, and will post v2 patch.


Thank you for your help !!

Best regards
---
Kuninori Morimoto
