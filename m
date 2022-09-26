Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B1B5E994E
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Sep 2022 08:13:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233189AbiIZGN3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Sep 2022 02:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229526AbiIZGN2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 26 Sep 2022 02:13:28 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2048.outbound.protection.outlook.com [40.107.94.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4BF6131235;
        Sun, 25 Sep 2022 23:13:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Y0vvwiYUbkwDGIEkrJ3UvIrt//ZV+kNBRhBpzGjQdcAMONGVdTwipN7UisToYEiSFXYbECRtdBzXVzeI3t4B6mbHlhxbmrOp+EN5DWxOGJsaTDLubhVDAvOq0xd2fisS8iLVdPJQW9kZ90njPKd0Fvr83PZh85jMua1d11dU8Ch0V5ynOsBB3GV8zfCCgf0BDRldfM7k9ZgyBUUQW/vzdli9gKe3gqr/C50vDnB6MZ3rs9fq/suC7lfTqdaO75RxttEsztlruvQ0hX1QOEOYXthBX8FbnF5UOELdCdDNQU02fYcibqRAojFebHltF2IjE07U03gE4p9QnKJHBaUlCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Pm9o5hKkDBRVM+hrAFWEV41OAURgOqftXtTjXoveQw=;
 b=ciMdQAnuw4BTH5NQzbBOsKTs5rOuT7MuaxfKydb84Pe/dcK5DiDeSGWOOTUDqxUCRXoljzTnZgwIA+l/2SFvnX/JrQrlZJRsWd1RSRB0yLBMuPeGq2+tnWy7I5rBwc5YUUjB3ULBr3023pTSc1FaX80vg7fHpZbM1lpWmDciXg+NzO6Oh4HpRuG+HuUcDj35SUYMO48c+OIc7zX6X5YlvOYvSJGZbOIZMeGky6NSZ2WMAqZCAlJ1cm9wW+yLkEyWpCY4DXIsLM1fc8uyjxroCSGgZ2uOVrbTjDDERyhrv/2psaTiFZk1Ndqc9Y6CvGq9JZ9icGss/X0vzp18I68EEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Pm9o5hKkDBRVM+hrAFWEV41OAURgOqftXtTjXoveQw=;
 b=0qHJrfRUtytquHa1DccQSbp4CJFvAzJfTw3+gPuY4ip9LKo88qAWhaPNYtelpKNwLdT3hNTvqzFC2cBF0Atk78Op2AqG0fxys8kY5a4ERuLc5azBfkhZOsC04C4iB2URqT36VcNVv2NocPOyuUJp0ZIFlrVqRne5OZo+AqdUlfU=
Received: from BN9PR03CA0267.namprd03.prod.outlook.com (2603:10b6:408:ff::32)
 by BY5PR12MB4130.namprd12.prod.outlook.com (2603:10b6:a03:20b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 06:13:23 +0000
Received: from BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::47) by BN9PR03CA0267.outlook.office365.com
 (2603:10b6:408:ff::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25 via Frontend
 Transport; Mon, 26 Sep 2022 06:13:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT008.mail.protection.outlook.com (10.13.177.95) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5654.14 via Frontend Transport; Mon, 26 Sep 2022 06:13:23 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Mon, 26 Sep
 2022 01:13:22 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sun, 25 Sep
 2022 23:13:22 -0700
Received: from xhdshubhraj40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Mon, 26 Sep 2022 01:13:19 -0500
From:   Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <git@amd.com>, <devicetree@vger.kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <robh+dt@kernel.org>,
        <brgl@bgdev.pl>, <linus.walleij@linaro.org>
Subject: [PATCH v3 1/3] dt-bindings: gpio: pca9570: Add compatible for slg7xl45106
Date:   Mon, 26 Sep 2022 11:42:57 +0530
Message-ID: <20220926061259.13491-2-shubhrajyoti.datta@amd.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220926061259.13491-1-shubhrajyoti.datta@amd.com>
References: <20220926061259.13491-1-shubhrajyoti.datta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT008:EE_|BY5PR12MB4130:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff5ac8e-817c-4554-da05-08da9f863782
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kuwTD83vCBiHMtmR2rYvr7wrbRijI6Ab9f17T+hkqxf4Y4LXY5qBtIb6WeV1cN7yNIfzTyvig/BUT9kJDCh3Lm2wzNMAobgGUflFLseAcblxHyI2fVRNKYX55Kx8tQsd+SpBh5nUNbBGU5vSRj5edAaAMkme3DrSbfa4FkWPtLwkDU0k2HTPGk3pgE+xj6nC/rVfKvzm/fFQQILuIkVgYqzU/6OE1tqOfhkDHBdtCnycr8F4htQJO1fJ9ycFuDgkNhYxpZv0D7mkNgroGJOSfyI0yhgjybQpZlHEzUBDmO2sgTRLFz+q+5U/qadK+YR0CSj7q962PMOrNTVQz8dtnvRpDXqEgWnt+Bf7A0afCzVS/elQa+iU8er5Iy5AHDZj8KGxfXEef9B5V77kWmeB1VJ7bLYj1+kpHy5aj+qsTzbluL+OZDzF1KYuE4iW+vM4Z6eVCX+YSIP/M9XuduFY+25YTwjc4dBDqVNieFK1Gc3QsnQmooXQ1ulVjqJ/myMOzQb1E5zhumN70+O939ji9Fgw80TavGz0TXUmfZlW2g9COuwLGIF/ymgKgha9eJf9ecJIREc6hO0kCPyP+8PDRCVvCrujbSDUtwV8JJ4h1EezeU6f2kWmp4q82tIzUJis88N6ZbOf3Cc0qj3i5bwlFqg+8c1nP7F8X0n357ghcaBCIscu2Dulbk5+8I+Hjz8mIV6Bzx17SL0hDHOxaJ7qNw7NWvXOwUWE6R52gMaAvbcCAfsCsqThpDkU+TldTYPnWx/vG6nSvDzc/uxmXVDmOld7K4pZbLmRorZi7MfAe92WOxxjtV8vutAJvcnD1Qdp
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(136003)(346002)(396003)(376002)(451199015)(36840700001)(46966006)(40470700004)(8936002)(2906002)(5660300002)(44832011)(26005)(36756003)(70586007)(6666004)(41300700001)(70206006)(4744005)(4326008)(8676002)(40480700001)(36860700001)(82740400003)(2616005)(356005)(40460700003)(336012)(1076003)(82310400005)(186003)(86362001)(81166007)(47076005)(426003)(54906003)(6916009)(316002)(478600001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 06:13:23.1321
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff5ac8e-817c-4554-da05-08da9f863782
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT008.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4130
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds compatible string for the SLG7XL45106,
I2C GPO expander.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
---
v2:
add alphabetically
v3:
Add ack

 Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
index 1acaa0a3d35a..48bf414aa50e 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca9570.yaml
@@ -12,6 +12,7 @@ maintainers:
 properties:
   compatible:
     enum:
+      - dlg,slg7xl45106
       - nxp,pca9570
       - nxp,pca9571
 
-- 
2.17.1

