Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8498F54A901
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 07:59:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237521AbiFNF6p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 01:58:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230077AbiFNF6Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 01:58:25 -0400
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2129.outbound.protection.outlook.com [40.107.114.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 566633123B;
        Mon, 13 Jun 2022 22:58:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y8gPOSpwd+Z9csmCvosE7u0IXXdQvaCOJKQbh5VEo9PD4K3KIjTlLLPCx+EPfD0W6GexKs2p8ULAeZKqS/S4Y2kVA2hnyFFpLO5c7mCT7WYuq0d21j/tQDh7eFWZNiowUTWPoB0rND1QfK3dieMyZGLaM46p+VfkzGajC5pCXGRAhZRwkaMgl4fYJFfEHdW4bF5/NOt0u7HKXoh8TwywIIl2BUWEsPp67d0l45XAqUMvsGEAMlrAQw5O7/FthcRe6KBxMYApASUxuWp3KBQ6p3nSwmy92WBvNu7bpSyfhJLNZ/e9/OEKvwsOY7HdRM7FoYw51HM4SBGdGiAUggguXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8XJ0+At0aiYEdW4T3N2V1MFFZrBRg9Un1ht84S3eNIg=;
 b=UJ4JKw4qEaPtiZDnZihX6KhVw4wiUceMhEieBpciHgIzVQICPLuoAp8CB/hlqcdl5p2hGvswywFX/+VXMoLT/UfgGpWvwZZ5VfAMpXL2cCpDuEXPKCihhhv1lampdaJ1Jckhnw9l3mWo0xb1iZIU721GurQXYtaRID3YH13/PyjYKVAZUnrgmatKf4vH8p2mS/UXuPO/wAQKNbMmFlf7ZXlt6GMpYDTBesxSg0NeYv5UbE/U0UEwWMVJFJId0Px0oYMeJHKRwgqG7nNE5s+5VxQ9oX1KdaREnZ4yKhBvEMXYEL6F5hJYTm42IlDf4gwHeyM0kcId4KXyZf8JDLB65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8XJ0+At0aiYEdW4T3N2V1MFFZrBRg9Un1ht84S3eNIg=;
 b=Ol2O3WdFhEBKGBctq6nxdrYqf2rzY0w0+mIVS17PIH+7RP4P7ASbBw8G5m/e+QMjsez6PBEpxGXSPdh6wSbELrjSrH2u8rIkpS0gwClB5C92HTSBJX6tDdu1sCRJ/egSBj1HY3s7tvad0fjn3DhMqyRaZo2kFEW0oWm5W02iiVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYXPR01MB1870.jpnprd01.prod.outlook.com (2603:1096:403:f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.16; Tue, 14 Jun
 2022 05:58:22 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::d5d9:3646:37df:867c%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 05:58:22 +0000
Message-ID: <8735g7lrb6.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v3 01/21] dt-bindings: pinctrl: renesas,pfc: Document r8a779g0 support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
References: <874k0nlrbw.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Tue, 14 Jun 2022 05:58:21 +0000
X-ClientProxiedBy: TY2PR04CA0021.apcprd04.prod.outlook.com
 (2603:1096:404:f6::33) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c88491a0-1e40-4380-7634-08da4dcae32e
X-MS-TrafficTypeDiagnostic: TYXPR01MB1870:EE_
X-Microsoft-Antispam-PRVS: <TYXPR01MB1870E83DC8AA7E6E16FABB36D4AA9@TYXPR01MB1870.jpnprd01.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u7l2NkwNPDl8mFN4GmuH4nwqK8zL5A58GmmnITp/C1oqYKKpMFnbQt9v0m4k9/PFZj7M+FpCVUjB2F1WOLNAYIxh8CT4DFaZPFJrYzZYzW+HXJ7x8WJmDhE14HhmcW2i/vx8/2LUNT0Oe4104MN8/QBd96beSNCrIdwXcv93bVVGuc0SRCeGOggAcl+pZ5HZ8BO7QtAdW/2rmmZW1lgG/yZymYuaE3ekRy9GyhAO+KbBWgoF9MFnR/r3eGX8cY1usOqo8sKYzOeMJNpSm7F/dt8qcvCFuHd77X93eCy8AAgAbqZpbzhdjm365/Mn7bZjXI3D3JFONVcnObOFu/4M06y2gW7tynCWFR1V3JAyoJCQHyYogSOR8ON0cv5WnDszodVL/ZxOEbYQUkZhKjSHLWS/g8rscU/ofjOs3heNXa36QqesztQ2sR0342FJg7MoRe5kwFQpXE8gUc14xiomTskiBMVR46XHXbOFTpYkDMgwVbTJzeQJKYDOWA1s/MNOeEgv2mgXIZMS1ibQebfFqT6DwOWiSTXQOcOTMWzvFx65cJ7BvEMEXuFbGwviE5bS65eoWtZtMzW9X7uZYm8onJg1qSEaJL/J4rtRqwfI+IneaERyWHq7EqUOPyzzlxCfoZpVnor53XtUWv06/6XtnjdeT4z5Ct9qGf0ZTyptPHo6qraoG5bkvBoojP1Y2/kcVN76tpvbMLM+wGSUCy2AxA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6506007)(508600001)(52116002)(86362001)(316002)(6486002)(2906002)(8676002)(4326008)(66556008)(36756003)(6512007)(66946007)(38350700002)(26005)(66476007)(186003)(8936002)(5660300002)(2616005)(4744005)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RJJIBEsOpO7tl7nNtw+3GsjWl034APya3XwwsniehfvGXnsyydDCVc7ddV0e?=
 =?us-ascii?Q?jEJdqGhjbY79MK1Q+PuWFHcYOjiqPYumNH97IkeuFjcIq0xvUM2PCvvrM6a3?=
 =?us-ascii?Q?cXwgBrKk1Th1ZpRS59PBmZBs9X42Pdj2TQ6hBHNL3eopo3XrJmgrUvBab90/?=
 =?us-ascii?Q?t6qJwMrgYuoRbEi0UKjdyA5eHXhlnej0B7m7EfdDNdJf2ZCp7Y+GTNaQQM6Y?=
 =?us-ascii?Q?yammpxuQbrXuDYrkes5ik3G+Bm6we0MSC+LbcOGaV0tB2rraY+1Dci+dalFf?=
 =?us-ascii?Q?so3I9Oe7mo1DlBxrz6HqndgNnNe1RYbnUYtDbqzM9mVFKOT4uNZbYX6Ul6CX?=
 =?us-ascii?Q?73HLNZ+mhQ2Rp/zqZBThlHpMRuOGqY1PGvO5sow5Px1gVdb+gDzFqwYho8hf?=
 =?us-ascii?Q?NF8vHNmzMftfbiqSRInT7Q8KOo1x0XFMyJrSQWrhD4M/kpFKJck8jxCjwD8S?=
 =?us-ascii?Q?sgXadcqh92dECLETtGK8jMt+lN68hTGcgGhhwmon+MZrlxwtaDRuybPhBmiQ?=
 =?us-ascii?Q?cbx5UtVjF+M4eOPRlBoo1IRlQS1TV7+cnZCpIH1UtoSnZ4H9yBnvNu/Yy00Q?=
 =?us-ascii?Q?Iv7d9EAUtQ8elv3PQhcYJF6f80IJJ3CUJmZsIY8AYtfX71pmjiNeJH9kIQ76?=
 =?us-ascii?Q?Gpy2lEnlhs/M45aX+e9rxfrt+YPyplLryOC/Wznyhl6xQwiLFXn2ktdDfxgc?=
 =?us-ascii?Q?TzARXLsf6UJsYEZgp8+Khg9WWoHe4HXKCclL870kJbBdYzjMyID8d8JXwAp+?=
 =?us-ascii?Q?CixI7QC7UigB8XUD/hvyQSxidzX+XGrNm84vNtcsqN8+Yw7RVs9L7JcuQWTb?=
 =?us-ascii?Q?8DEip8DEjGa0mQsEyCpUPUxkhm8zqkrb25he40kR5IVKemqnK7pjj3+6k7IE?=
 =?us-ascii?Q?H0mE6pfSX9eTdtn68AwQLwr6kwg6WQsMajUYERZqrzC7TpKw72JxDfDz+//s?=
 =?us-ascii?Q?BZRtuEkxg7vsYpVRJM6jYtBaKd3NYBWzwmu9AaxxtjXh1nfP13ZMC4FEQdgi?=
 =?us-ascii?Q?8YEzIRSGxgeRUbUrfzokcOBDoR8UHQzBJi4xnD4+8/sBdPi6oGQ3TiWDiaOj?=
 =?us-ascii?Q?l0wdUFev0qLFr0xRo/LAOBRTt2KvAmcYwCvUXuOYnuSyWsW95MyMutF4T9Ge?=
 =?us-ascii?Q?s9JaOUmk5rvanUmsrfpzEoPbaTLlDNPoErX2E48egn84GpkoqZkudYSU6+3C?=
 =?us-ascii?Q?fOJzA3w2Xctt0pkJsQwzCDBk3SDUpjfmH1tFJf2VFlXHKVWTJ9jzXoq6x5n6?=
 =?us-ascii?Q?p0fJ/Mb2FckwdfL3n9OffeMh//ZRyeK4gHG6UkelCVeyLjJbDv3yjRKLoO1r?=
 =?us-ascii?Q?o5TYloqTuhXbAwPXYE6TVM4ZODHklFQI/QjzXC8ER+u5fdQQfIbmNlNyUN3A?=
 =?us-ascii?Q?1o3qs/sh1LptQkdhNgp7wCVga7gVwUcIKSg7ChbmoUyn7o4W093Qv8NiecPS?=
 =?us-ascii?Q?syXDDMlCz6/0MkBXnMcfXa+6DxFSoKQUGWqCsIlhBtNXJjYfcIKV9uRiNd+q?=
 =?us-ascii?Q?s3POazn3Vd5Vuj1xvrkccbxFo4Xv0YrxFFtU2TvwiFfyW1j4U3fbbc/3CiLh?=
 =?us-ascii?Q?ESmEzR0/oXR1MBovDdcPrbsEe2gO4d0GftbtqKVQFbKwUOs/WqWmd/V6AqhW?=
 =?us-ascii?Q?eIsWJ972v72ALQx0PgLlQe1uDaG0I5mfU4nDeFTrPvgJ+n6189qZ0r7DumEg?=
 =?us-ascii?Q?BTdbgTFkRUND87bObyYO1zhp4pvwdlGLGPu6yDv/V9zQGubqY3JrTrydHSdj?=
 =?us-ascii?Q?e6quy2/k9t+DavFlySzO6RFrVWWz0rQShfRGLLyCE32NIi9Dos50?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c88491a0-1e40-4380-7634-08da4dcae32e
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2022 05:58:22.2345
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B2w0MOEFzgSK5UZf58AXDkCDiA6LurqC5yhHsU8rjojeY85KO170Ti4I8KmwxueymQAjUhEgt/ptVnq3i23WpnqWuz++OfESNMzK+bhFnvw1MtnuUpa91Bp+ji09Lzee
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYXPR01MB1870
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

Document Pin Function Controller (PFC) support for the Renesas
R-Car V4H (R8A779G0) SoC.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
index 2a57df75d832..4fc758fea7e6 100644
--- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
@@ -45,6 +45,7 @@ properties:
       - renesas,pfc-r8a77995    # R-Car D3
       - renesas,pfc-r8a779a0    # R-Car V3U
       - renesas,pfc-r8a779f0    # R-Car S4-8
+      - renesas,pfc-r8a779g0    # R-Car V4H
       - renesas,pfc-sh73a0      # SH-Mobile AG5
 
   reg:
-- 
2.25.1

