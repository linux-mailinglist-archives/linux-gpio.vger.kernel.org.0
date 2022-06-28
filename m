Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE7A55E96F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jun 2022 18:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239659AbiF1OeC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Jun 2022 10:34:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231706AbiF1OeB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Jun 2022 10:34:01 -0400
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26B6E27FCB
        for <linux-gpio@vger.kernel.org>; Tue, 28 Jun 2022 07:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7DaNORWEucj1gferVlxt5xk3nB7DJ5TNAxB77w8rAWDZp2RlKz0+Rrm821PXP1vrDTm12iveJaPhcdcHWhNE/qOvEt7WgUEHG21D7f5f5a+Tvwgp0tb5FvP3uztPgjR7vPGEuzMJzGknTJYL+w3PCf/fBC6y5V1l82i+fomhm2BGDOBE1KhxWoDAQv1VxQjJZptirx1kb0yBa1qgfNqj/CCRnbPx2qTB5/3/IWzzz+fItGhVApNF3HO1zdrbK3Z+JqUMbIoJ7w3zrg2eGNmjddiWCAKWMEOsKsoZMQVRJf3QGeW2aedKyuEL907gGlupt5pPrNnq9t2r6CJRu3a0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVrcX3YA55z0yWIER5YQ8Wl6VEaFPFHGNGuugyhuZqw=;
 b=jeUu9IwxlZKs29Q7CNnUZrRePw81SYusBbznOS+LQyKQJFVQCJz+NvOUebDhE3m2U4TEJn6a8fQgVA5WZXmnvx4MInDltBP+iMxxMRDWkz4qsWdRLH5UgU4kALxFaFe42jahrVeuLFIr+jA/DA9lI7Faxe5Z2mxG+Gd8kP+vrKhAE8dRLKrRNp38EfCa9GPEikgoELNiKkGPZxd64Cgh+oCTb0gTakxcaQPymeBkcu1hRAlSzeha0b5MKOijOWeLW/IGir/H40GNolGumLkbZ9/1/Jc5ZYvtkveQ3qWGuLos1ZOc1ymZUFO8++3NTHe27CHpKoH+0V6BU5E0E0PfiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVrcX3YA55z0yWIER5YQ8Wl6VEaFPFHGNGuugyhuZqw=;
 b=SPqiEWGBHDqxvqM7HTaM4acmUlHcaJMH+kWWv5mnsPutaY4uLJ9pKFtb0xi1ezBixtkIxNayUTh5aoFINFSgeJ0azrJWrtmNLGLu6jyd7sZJJSZVQUfMtobZ8QzXfRAa+dVX/+TV1MW4NuCoq78TtZcD4e59aHh74m853k/d1FY=
Received: from SN7PR04CA0061.namprd04.prod.outlook.com (2603:10b6:806:121::6)
 by BN0PR02MB8125.namprd02.prod.outlook.com (2603:10b6:408:164::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16; Tue, 28 Jun
 2022 14:33:53 +0000
Received: from SN1NAM02FT0030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:121:cafe::53) by SN7PR04CA0061.outlook.office365.com
 (2603:10b6:806:121::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.16 via Frontend
 Transport; Tue, 28 Jun 2022 14:33:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0030.mail.protection.outlook.com (10.97.5.194) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Tue, 28 Jun 2022 14:33:53 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 28 Jun 2022 07:33:52 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 28 Jun 2022 07:33:52 -0700
Envelope-to: git@xilinx.com,
 linux-gpio@vger.kernel.org,
 git@amd.com
Received: from [172.23.64.3] (port=34503 helo=xhdvnc103.xilinx.com)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <shubhrajyoti.datta@xilinx.com>)
        id 1o6CHn-000D9m-Ge; Tue, 28 Jun 2022 07:33:51 -0700
From:   Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
To:     <linux-gpio@vger.kernel.org>
CC:     <michal.simek@xilinx.com>, <git@amd.com>, <git@xilinx.com>
Subject: [PATCH 0/2]  gpio: Add support for SLG7XL45106 I2C GPO expander
Date:   Tue, 28 Jun 2022 20:03:47 +0530
Message-ID: <1656426829-1008-1-git-send-email-shubhrajyoti.datta@xilinx.com>
X-Mailer: git-send-email 2.1.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb117176-3d40-46c1-2f4a-08da591339cd
X-MS-TrafficTypeDiagnostic: BN0PR02MB8125:EE_
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uzuInOCR1rnF+FLIj0d4h70EC7v/cwlgZFpvKtDxpxvCCllGSOm30JBx43Ul13WfuPNjQqw4sXq6AF1wyK3v3mns/zCSIK57gAq6afJ6aHN0MIA6aH1MY477H+bK16dSjSlCMXMV8799qLgy7Huh9AnvlAAsduUvuydtOGT5csup+AjFPZZKfJJKaSUS8qmfeJu1CCdrQ07cJSh/RMOm7nv7zTtePsFncUQB8VteoGIC15QTeEMnN0CSFbJMTGI2XB2VWDB1zpP4MB0lnmaatwt+VsDDTUiZR0IcxA/17+tJ6OsiOKlFdWChmnksopIK9+kEEpWny3IyO3x8Kfm04G46q2HHK5C43JNFK3+UAri+iCmrgm3YscU1EI3ENqJFEG/3kNo+uq96sNm2/pAMPDJY76e8o6LEIbaMi4kdoJ5tupdtA0JkvhIm9MWhrYgEqZc1bMk0vI8iF8djiBTfngylYRCShv56DABy/f/OWa+y+4NN0SkrYk1tIavP/95Ai0u6i0U6f0zy+zvCJBU7Sw1yhMNnEhqBRtsI5es8lWTIr95J0xdj0ZH3jG/0VfDYTaeFUq3ci2DKO0wWjeJpxw28bKfxH28I4H8RWhYcQ/3IDRzhljwwz/BQzgvCdHBPgjotzX5cVAs2gresVJlppMxG1qUG8KlOkkfPz+CZhdxaFTnHK9AwvOH4n7PeIMhUpVGhpkMZZ18j4PBzakx6MDQqCdyR95D4Q2M+VZxJ+YwjTX/USNBmL2NzsTaV7UeoUlkoxEEtv11Hm+TbVw6EonkKDY/XNbGq/S+hnaGc1410FaUMjzMukQBO/9DvMUHthft77rvWUp15mzULsQ4S4Q==
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch01.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(13230016)(4636009)(396003)(346002)(39860400002)(136003)(376002)(36840700001)(46966006)(40470700004)(2616005)(47076005)(6666004)(26005)(7696005)(336012)(40480700001)(316002)(40460700003)(107886003)(426003)(186003)(36756003)(41300700001)(70206006)(54906003)(82310400005)(70586007)(5660300002)(2906002)(6916009)(44832011)(4326008)(4744005)(36860700001)(82740400003)(356005)(8936002)(9786002)(7636003)(8676002)(478600001)(102446001);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2022 14:33:53.4564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bb117176-3d40-46c1-2f4a-08da591339cd
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR02MB8125
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add GPO expander support

Resending the series as i see this series didn't went out due to 
some issue with my mail client. Please ignore if this series is 
already received


Raviteja Narayanam (1):
  gpio: Add support for SLG7XL45106 I2C GPO expander

Shubhrajyoti Datta (1):
  dt-bindings: gpio: Add gpio-slg7xl45106.yaml

 .../bindings/gpio/gpio-slg7xl45106.yaml       |  47 +++++++
 MAINTAINERS                                   |   7 +
 drivers/gpio/Kconfig                          |   9 ++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-slg7xl45106.c               | 133 ++++++++++++++++++
 5 files changed, 197 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-slg7xl45106.yaml
 create mode 100644 drivers/gpio/gpio-slg7xl45106.c

-- 
2.17.1

