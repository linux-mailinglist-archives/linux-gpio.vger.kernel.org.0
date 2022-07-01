Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 55AD5562850
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Jul 2022 03:35:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiGABf4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Jun 2022 21:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiGABfz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Jun 2022 21:35:55 -0400
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2120.outbound.protection.outlook.com [40.107.113.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F095A469;
        Thu, 30 Jun 2022 18:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aLBCkF8+mF5whwMZOQmizmYpBwnnldCC3criApQ2mBa3/FWlBuVn5kSxzlNO0rJbwfnLljs+XlhFt5MWp7pxPV0SGiILt7ihp+lFdRGqRBNzR8NVpNxVNsABiNqaDclYdHYuc6uaJWoMpnTgP9KphCWLx8Dz6Ein/OmlF+Aj6aHAltaw2lXWar/VylS7r1a9kXdjLcc1OjFCTR0UFl5x4WMcT07MSCbmbHjjSQo4EYmdvd4NVBnOrmYN/8UYTGyerNQGYo99w8XHfvtzljj+Ed2+yTRhT3+tXtVyjNhuXGTiT3Y63lU60pQabwI8/3OjniCQ7Y/gQ2ASgUk2hzz1+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8WD58BT8xHCDBMA70+61AxXzkcu28gGcOWj0M2MIEFA=;
 b=FYRY0lWJrw0KzDknaQDymlRNZnzq4w82ZrzansswYecRSzpPKDJ68fQLUV3DySNKawguEvduaZHVqm4Jz2NV/edenzWd/HLOtGo309yAGA5TvKtVAUFmBummirB4/3ACYCsqTYR2bObhTtx+5y0EpsPo2cfYiFZbs6K6L+6QMU4JaidHg4pIjsDC1ho6TALjP9cbN9VwutVytMWE4Dc8yj3gdZeHswAd/C2ggE1RpWLLQ8oL8qA8o0VjDwCnGdlTPPY7WHElxgIhCCxTLIt54GTUoByIO8SoRh6jtbJ0/WeYYaT6IPXWr7NOqJ9US4UhMjlLZHqRNQRAOXVVcHwAYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WD58BT8xHCDBMA70+61AxXzkcu28gGcOWj0M2MIEFA=;
 b=YRX2hS0PGc4JJWdGKqirkX+a7rgzHtE5QF54X0iGO4eEUT1EV0wKTQBVle7HX4EYHF8PSSpQystzSvHc+OMp47BkdrJGgN8jBJXJQfNcADajKC0fAjoHtfcv+mBC58JjkH2TNpHgSlUgwnwtBZ7MdyguPdzHJgVryG4Td64u7ZI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by TYCPR01MB9275.jpnprd01.prod.outlook.com (2603:1096:400:197::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 01:35:52 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::3838:1a73:ae46:bab2%5]) with mapi id 15.20.5395.014; Fri, 1 Jul 2022
 01:35:52 +0000
Message-ID: <87fsjlty13.wl-kuninori.morimoto.gx@renesas.com>
From:   Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v4 01/23] dt-bindings: pinctrl: renesas,pfc: Document r8a779g0 support
User-Agent: Wanderlust/2.15.9 Emacs/26.3 Mule/6.0
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Geert Uytterhoeven <geert.uytterhoeven@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
In-Reply-To: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com>
References: <87h741ty20.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date:   Fri, 1 Jul 2022 01:35:52 +0000
X-ClientProxiedBy: TYCPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:405:1::34) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 78a305d7-2708-4249-06ca-08da5b02092b
X-MS-TrafficTypeDiagnostic: TYCPR01MB9275:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ei1ibc+Hf3jHd2olmhHSVy98PfvKOxuutWDngFqaGmAthdab7r9/fukVwVTFmIIrx3WADNHHMc2pHzPxRzLtblInywWIVCaC6kYQIj/FRGjn0SmEZ9FqCMBF/bTDOBU1YM2RvJkPwNiDNOYLg5o90jkWu+TjDRdPbqRrnY2BF5bpQkZnpNLX3pZX75BE8LNUba55abtwowIe/tsGjQKzpvKGhJ9aqXN8gE51N3/gruJ/T8WFRn/iG2B+186WG/NsCVl89A303/p05PgXKJSD9O/55fnK4zzM/zF05iYj1OKE4EbIyTgJ8Km9FXv/G5WVRWFkxCWhjIRjxkRJmZHWIg58YegFLt5qjWt6nJ08DARz43txg+lFYUJyO8u3SLWLK7k7oHmpDEWl2+rC/zsqX+izUD2Kim33xpNzRdQuhL/2PVgSP3Ku/GvSaA37BIZUDLJbFZljhH5KpB/Q5PE6rjldM8h017cBxDsgHUBeyv2A5MzsF47SA3hAW4YTUsBHUhvfKhgWezzWPAvNPx2O3gSheuNmfIcwbsx4EfmjefjckcW76TG2s2vX89L0Gt0G9ROqHRZPMdJepMBRbD/g2IAZHzczrXGF+h3iKQTANBsAL2XXkr1z2ZZngpVPTVIrsuoOFdQb6m8M8QmdJBL6NuX9TRZofXKmSOY1pCLQFep1SmdFadFmK/pkBZuZazlkMdRN4WOlB05meZPIg1W4zOjaFDPnUZZtUKNlKjvqxOd033ahLIa+m61RhYLbRYop4WCyJ6ctg4mXdoZgtTAQYz+5SbfufImuYYhUe6N7iPYhQQ1nqtB7OCUFS6ufG2pX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(36756003)(26005)(6512007)(4744005)(6486002)(54906003)(8936002)(52116002)(2616005)(5660300002)(478600001)(110136005)(41300700001)(2906002)(66946007)(8676002)(4326008)(86362001)(316002)(38350700002)(186003)(38100700002)(66556008)(6506007)(66476007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F5yhGHDer1zy6GRc8Z5eZa3XG44vOs4V2KnOVw4kE3rJmdE+vbGFTKvn46nO?=
 =?us-ascii?Q?RTszXHAkUcmafMD1kQbXTcdJ7HJC9EG/BpOvdjpAqrkm92cHNvPXAt7cjOgt?=
 =?us-ascii?Q?0yv9Blr4oHcIqzt7mt8eie+c2E3bOvcto71Gad7V/bujX2YrFZHvhi7Z5B/S?=
 =?us-ascii?Q?+8dws8EzFLGzVD+ptkOgkFYaLh9zWDYP14wZVJ78Ss/GT41jpZ53QHEgX3Z1?=
 =?us-ascii?Q?9MnPMPKrAET3C6lCITclccXoYoCvem6NZa19QTEttCRbzDDDwzNMyQC8zubg?=
 =?us-ascii?Q?foTzklxxpmZkyMEmzZI/oxRNH7WBKLR7Lm6SpnikzJNDw5l8SKRfbIMouthe?=
 =?us-ascii?Q?cd9jMn+Uk1oyof8DK1YiS7a9HnUSiUCOXoYo1Z2w+cw1YD3fkTzBVhTUWIU9?=
 =?us-ascii?Q?iNALORrhcfrpE8pGuJ2JJoKWY3wkqoWVlfumtUPT2ZHsPW4zBCEJfE090wnw?=
 =?us-ascii?Q?ArVzRWjcbeMt0QnwfdVP1vyFhyw7VdfI24FJWjrZq7mdos4m/pbFjp0h0kUS?=
 =?us-ascii?Q?2bnTrPH4L1YWXdVZHG8+zQqUdIZNcZo9x/Q5ZkelZOQbzppIhfBmPbuMVQiL?=
 =?us-ascii?Q?XIWzJuR3HflyrMYC7HSmul6S2I97rNkrkIJ77K2gT2p5EFicnVxIluNAmj9P?=
 =?us-ascii?Q?9SXyHZYOVb9lvhtmLvB05JsHlRnqaX8rGqzExBpLWX3WcNnnZrp4ALzbKXrB?=
 =?us-ascii?Q?gBVz6Ya7UyaUnQJmkEr+uYBmWitnBmqbOhbBinnEz6PEzS8zXQ7sKBCRW7zJ?=
 =?us-ascii?Q?bVxRE9sL6D35nGkIGuPa3o9DV3jhQLC9fegizNtjm+e+AuzrDA0YNE8V9vvq?=
 =?us-ascii?Q?Ljvivs9XCXTtQO6yffr6lK/mUp7SzAhTTR7z41OXAeGP86QFYWJXg8ecugB+?=
 =?us-ascii?Q?2HpP6jB6s8iGKLZAOSpR9rAkWbm2d9vb6+TFRfbm8v6n7lQWJaNh6SrgzSEE?=
 =?us-ascii?Q?NdjIaE6GW51thIPxkeJ8+9K83iO+0bR40VyqqTIX+q6azqGDpNZO2KoAwseO?=
 =?us-ascii?Q?Tss83sAxZZipwb0k+oP+/48iJpuQt2LMklx0YuiHnR+YkNU5uS6vPWcUoF0r?=
 =?us-ascii?Q?dgGXhYbHwFBAXDAkyBxTB3bJ/5sDx7OIzgvdYF/3edJvrDpxkej/kiD0NON3?=
 =?us-ascii?Q?2akZxGdGaVWnG+YQUq/3FYbEmBIlddBjO3bcirz9lvuR+8d5265jAvhdNjYp?=
 =?us-ascii?Q?+wBIl8PYrInfM52JLwZX0T9kYKvYsUKYxd/vaCpixkfKU0eN8USne67NOvCN?=
 =?us-ascii?Q?HqiF5uAjUn/bNBNEOGL3tzuy7myAB2177gw5rJJ/Mg6vAsUUcSHY2eNpGkYA?=
 =?us-ascii?Q?IEFUFMACEWRi/LnsHtMHhwbwMFccUMY5Pdcv9xGWUSjIy56zVKaV0FyLgRQT?=
 =?us-ascii?Q?IcHIXYTlbnD4ihMukrCJ78LVe2zbsigOxoH+gWy4UNLD1xbluAAEwD6rv2kK?=
 =?us-ascii?Q?6lb9mLn8FLXNh7HzaYuxuv0k7gP26xHJjgK7ewqUGT7ONyr0YTKEMxpDpzOB?=
 =?us-ascii?Q?8/emiOvEwUdj62sCmhofUC2IMpsfaSZzd2Ronb4Ua9h+oGMJ286vjP62m7FZ?=
 =?us-ascii?Q?z1SHO5hl18ZmOREB+GV8PFxuNd6EBwSTN8FqGa6CUCiWMrOp8r4Slh033+LL?=
 =?us-ascii?Q?tp6S/VzH24mYLPspMV7yLqU=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78a305d7-2708-4249-06ca-08da5b02092b
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 01:35:52.9004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OyUNXHNavE45lIfMZ3AZYrIv84P/7jPwReFwpyDjBJZaGLXaaNWYHMMtbOcYZzWlzoqvYVTd8Cz4bQHNPyjKTMaM7gSAZu7x+iIcehPUNpPjDIWODeODckvF8U7bYmcB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9275
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
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

