Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2738B547FA6
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jun 2022 08:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234853AbiFMGnj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 13 Jun 2022 02:43:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237900AbiFMGnY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2022 02:43:24 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2081.outbound.protection.outlook.com [40.107.244.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F7CCFD34
        for <linux-gpio@vger.kernel.org>; Sun, 12 Jun 2022 23:43:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A3nJMtLNE1+lfOQPTyrnGe0SRRwwjVGOfYUqTGWw0iTBnSQ+sSKdNgH0fzB7tlp7EHJVX47nQ4yP6DL0uHE+tPAkB3vbJVG1+Xvsx5EFYlKNxqw/19uEQraxbLMTcGpe9tkbqqzuiIQf+M75cUnF/9RkO/DhKylvvR/JsbmwVnowzViYNqPy2Apii/rGNNJYHPPvtvbLBjF+wy7CwoI2bmpx3JgBkeTJQM2MRrdSvvUZhRi8Gas+iMDlbLzOy3qBYrQsSkoFsjhSzyWOyzqvzh/M37OXhUVkSWusMTnSCKznJs4uLO+G3E/WRD887KP/LWXb01KXhtnj3ZNk946jeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pJqg8PjsPfhoDUvM44Nj69wD0JBf4R9+d4DO9w368bw=;
 b=Ap6kr6wtGTknjlc0OasCymHgvwLmiaNYTa2SKRMcDe+uPzVkh6aEaM0M+F0TL9C7i4Dk2xnVm8rUiZSfmA+uqk2PLoYAzUW9uui82RQgoblngKjcifubFITa9rVtmzPVIzqq0o5dDRAPSZqGrAFAHCqJ65/zr5+GMkniKak93/XBdMSw18tQC02d7oua7RUyE7+xhViWpfY+pnZ1hu0uPIsx9Dqi8yjXrHW/4di3E2dsSe4KLl2qOHdhx9jmpZie/gD+aMjtrpumejC1n0mujcvOvihlN/LZU+vB7e+yeEp7ZuAai83iTXdAkr6SwtCtrgs8j9GvJkBpUeKiPDbtpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pJqg8PjsPfhoDUvM44Nj69wD0JBf4R9+d4DO9w368bw=;
 b=v/NO3ttIDEzm2uj7coBPTklZRmqvGT91rcdovIH7HfiPhYak17RUTKaPM3TeRf/YssJ1JnqmkUeIkCqDhSpOAnCqlO6huitJJwlnmclvkOBrhxCh8q2Kr83SZHXQAIBXqdQRtme6ypC1esaur/cy/lG+GFLucgA2W+kQV2Rxv5Q=
Received: from BN9PR03CA0380.namprd03.prod.outlook.com (2603:10b6:408:f7::25)
 by MN2PR12MB4303.namprd12.prod.outlook.com (2603:10b6:208:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.12; Mon, 13 Jun
 2022 06:43:21 +0000
Received: from BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f7:cafe::34) by BN9PR03CA0380.outlook.office365.com
 (2603:10b6:408:f7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.17 via Frontend
 Transport; Mon, 13 Jun 2022 06:43:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT004.mail.protection.outlook.com (10.13.176.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5332.12 via Frontend Transport; Mon, 13 Jun 2022 06:43:21 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 13 Jun
 2022 01:43:19 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <linus.walleij@linaro.org>, <linux-gpio@vger.kernel.org>,
        <Shyam-sundar.S-k@amd.com>
CC:     <mario.limonciello@amd.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH 3/3] pinctrl: amd: Remove contact information
Date:   Mon, 13 Jun 2022 12:11:27 +0530
Message-ID: <20220613064127.220416-4-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
References: <20220613064127.220416-1-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8729c13b-547f-4b24-82d8-08da4d0801f9
X-MS-TrafficTypeDiagnostic: MN2PR12MB4303:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4303A285B0E8945F1CE2CD77E6AB9@MN2PR12MB4303.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oYVM1I6lx6x8gS+cxC8aimRIUm93A1Ur2SJtJhcEzPyhV0Tetifgv7dNP8jrf0cDEyIKhBS5XAy3dPl9BzP/wkW0rzFzWFaa4Kxe0pkAMLUcSJRt3fKlRMzxAsOwf+c4tRxzZDhUU1wakqHwBbePf78T5m415AdNeCuKPCmpKGGAUgVMyh0a8CThk3Nu2StESPkpxoTKoKv7AcCYgnJXn9zkRr+OxRUOK878ho4vErKnL+sbxRDbr3DjlSEyvzNG1PRUmVyNRpjZIKDlVdIhjGfUsAGLfDowqiGSbxFbNqGnQQPVn3/JtUBSkZx23l6HEfPA5dGxZ8I0dYjj/zwPvQtSHMshbQ8HRGdxOnRH+jPkr1qmGRy3ISuAGpXIelH4PeOlzzVtagPS1M42sHsXK3K6uMv3i07NDqFXeMrYhsG5oYGks/OeLPeDwjuQxr9tkNOrUF6VTJeV3okXkWAiiYc2HmfZ34uSlJNOnqu+LUHc+YycTZ/lqsLiOiyzS2fs24tQ3y42v3vcj40y0YtcBb2YK3xKn2p07kfmfOlO96aeLAP451DNc0uGmKgjUOXx5xXI+8uG6WLdLjf26isEpPTpHlipJGw3cfMXxt200qp3121yIl+dhsm55MtKSWxrMVOkEkZ0m0o9XApLltaBu1aQISpv7mq+X3sirTkC7/zo7vUbwAeNR9C0yF42KkaWwOqnrniORzaYx+/0q7yQh3Svbg24Cphah2op2lMhkj4=
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230016)(4636009)(40470700004)(46966006)(36840700001)(36860700001)(82310400005)(508600001)(110136005)(40460700003)(356005)(336012)(426003)(83380400001)(6636002)(54906003)(36756003)(4326008)(8676002)(2616005)(81166007)(16526019)(316002)(186003)(2906002)(1076003)(7696005)(5660300002)(70206006)(86362001)(47076005)(4744005)(6666004)(8936002)(70586007)(26005)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2022 06:43:21.3927
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8729c13b-547f-4b24-82d8-08da4d0801f9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4303
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove contact information.

Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
---
 drivers/pinctrl/pinctrl-amd.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 40e23b5795b0..22f8a615a8b9 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -6,8 +6,6 @@
  * Authors: Ken Xue <Ken.Xue@amd.com>
  *      Wu, Jeff <Jeff.Wu@amd.com>
  *
- * Contact Information: Nehal Shah <Nehal-bakulchandra.Shah@amd.com>
- *			Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
 #include <linux/err.h>
-- 
2.25.1

