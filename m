Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 471E353A4A4
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 14:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351874AbiFAMPm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 08:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351829AbiFAMPl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 08:15:41 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2071.outbound.protection.outlook.com [40.107.220.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65355B8A4
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 05:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=H7qZaY98W+eQEl5Ey4gCCJhcPlXoliwRMIS5a5+JUar28/8d/XC0w4ldAjIXYfcx+MC9c+K6uoCjVRL4Wi6A3U/N6ohH5YJjm8Nu3+GB9GCYH7GL56I8GVbmtHiIyhDPKibtMSH/E4zlkgvIfC177R9rqSxcJ4iP0Ve86cBcuQ+eXLC+I3Q0k6u+obSXQIjll9LhPIiCg9CUmL610Je9UUYrTEx0Ch5w15J/Xl5XfgbzxKTMBI3pZOC0TCL0bFXekO8x+9GZueh1X6HKosgoE11QaUf6sJsIcrKCZtZ+PTAoim9urqOZwP6JXGEbTUfPU5KGoz1ENrJCMRzQYN88NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OZT1yX1zltYemmf52wf39hw5lhclh9ljtbT5oU6RSR0=;
 b=Fvnbk7tFyaMxUoeWPeYjVx4zyLGHNqcpHXNSQ6rKUfd9gtc1GTJQerS/Yv9PfE8t6V8lOR56nOY4cERbUQZRv4CPAZiY/GOdr8Oo3mLcMCskm+BjUBiNBWen9YwXnIsh+fEEr8s/tPhpVmxbVWMRI8JbxVCXoTzwAwT362xw5E6K8psklG1LP4Xk92SV3KYQNECMY6ptvscG77mBcxfWBXUinEjf5M/TS4GX/DdH/oduFHiRSH5O0hJWo65fYz7MrXBRNZKqI2a3c+dEEpFrhh3N920CwocuNhwpLPITn8k9C0e8MWZ2iIOZ2DaP53ImgJKv7GF+1XoCmfeKGssmtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OZT1yX1zltYemmf52wf39hw5lhclh9ljtbT5oU6RSR0=;
 b=xJd2A6MEeXw3nN3n3+wxGbH2+Jei+wLbTlhOwvVEOsII2g0lqUGMyPjuCUprID7I2QTs4Tv5c/8diB6DRS29Qj06Ooqn99wLKoNQEAlMKho561fD7hjD0hbDdazkhz6G0pmxltJQKaFCSzfPxYJB2vjmTjq9dxNb81tyEyQFXVQ=
Received: from MW3PR06CA0014.namprd06.prod.outlook.com (2603:10b6:303:2a::19)
 by DM6PR12MB3404.namprd12.prod.outlook.com (2603:10b6:5:3a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 12:15:31 +0000
Received: from CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2a:cafe::89) by MW3PR06CA0014.outlook.office365.com
 (2603:10b6:303:2a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 1 Jun 2022 12:15:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT038.mail.protection.outlook.com (10.13.174.231) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 12:15:31 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 07:15:00 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v5 0/6] Enhancements to AMD pinctrl and implementation of AMD pinmux
Date:   Wed, 1 Jun 2022 17:44:32 +0530
Message-ID: <20220601121438.999369-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88886fea-9684-493d-16ba-08da43c86c37
X-MS-TrafficTypeDiagnostic: DM6PR12MB3404:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3404159F6DE9618F8188533EE6DF9@DM6PR12MB3404.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MQ068Dd3y5Gy9QJPtjvwi4Ce4XmXu17CWfC9b6P0Q7JFgcWaWrREOhpBgEk5xGAiQbJMkFcw4pdYAc5y6SmsWfJiZqDTYrrmkRouy0hvbExy5MqhUo4d8WS+eqIzGUnRmneKBsQu+atu80IJ4NYMqyP+iHtweI7tiYY47IFERhhKxhLgSxf0MqrSkuEoA9bN08tmxmdOMN1Y7PFBrXYJ0srmd+2SV3MPJT9Lv8lVXC/4uNNLPc3vLmqN1jWfFxuJXLzMCb8+MphWN29ouXdl7vEi0efAE4gfhVvSfJwTqs/ZA6Zg3MoKbjkN1GkNXcw7WBkmR0TbeKINU06YiJmGrB9lOzWtyBPnggEllpqSo6kzRS06bDqtdMP3Oc38GVZHqZ8F3oVCF1DdhxC+ra1CJaSan6UPxWRoneYRw8Rpl6gM0saPnZQdeCKQLjSWYyR0EFqs1G1hl9Zbj12WQwnokBQ7SVpKON22p3EMPAYw7qfm1JKSofS7/T2AIXGalJUvXpyRODHX/McSRuDzPlrNqRPyKa/SvdReejrfZDoB0WHXlcLZPqWreMI535KJx2/2d4UBRUSJbMienmlPkwfvzXykkVik34a7F+OKEK3tZ3HF0L70pezZxK1GMUTcQbWPOpoUC16KfYr0D/oE6Fw7Hyl6eNTCO6QRIry1FF05hYhhu/I1PpC0G5TxQ72ghaBmQ4uVLm/5cs3aAs0GWpw74atygKx+5IQHUHjHPQ7TEMYhR8yuX++Cw0W+7Wvp4lCO/r4ldpo3o2OnsO5Hb0yFgX4I2+ZRZjy+QksSYCbedf7b4YhO31XABK5/f6k0IxxN
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(82310400005)(36860700001)(8936002)(36756003)(6666004)(40460700003)(110136005)(7696005)(5660300002)(508600001)(316002)(83380400001)(966005)(47076005)(81166007)(70206006)(70586007)(356005)(4326008)(1076003)(2616005)(26005)(426003)(16526019)(186003)(86362001)(8676002)(2906002)(336012)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 12:15:31.2697
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88886fea-9684-493d-16ba-08da43c86c37
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3404
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Changes include enhancements to pinctrl-amd and implementing
AMD pinmux functionalities.

v5:
	- removed parentheses around compound literals.
	- change platform_get_resource and devm_ioremap to 
	  devm_platform_ioremap_resource. 
	- change dev_warn to dev_err wherever returns invalid or error.

v4:
        - Fix kernel doc issue
        - change PINCTRL_GRP to PINCTRL_PINGROUP
        - change fwnode_property_match_string to
          device_property_match_string.
        - make slightly better indentation and code few lines shorter.

v3:
        - change amd_pingroup to pingroup and moved to pinctrl.h.
        - Add prefix AMD_ at appropriate places.
        - use _DSD property to get iomux resource.

v2:
        - Fix for initializer element is not a compile-time constant
          on riscv architecture reported by kernel test robot
          <lkp@intel.com>.

Link: https://lore.kernel.org/all/202205240107.bryIFhOh-lkp@intel.com/

Basavaraj Natikar (6):
  pinctrl: Add pingroup and define PINCTRL_PINGROUP
  pinctrl: amd: Remove amd_pingroup and use pingroup
  pinctrl: amd: Use PINCTRL_PINGROUP to manage pingroups
  pinctrl: amd: Define and use AMD_PINS macro
  pinctrl: amd: Add amd_get_iomux_res function
  pinctrl: amd: Implement pinmux functionality

 drivers/pinctrl/pinctrl-amd.c   |   98 +++
 drivers/pinctrl/pinctrl-amd.h   | 1376 ++++++++++++++++++++++++++++++-
 include/linux/pinctrl/pinctrl.h |   20 +
 3 files changed, 1450 insertions(+), 44 deletions(-)

-- 
2.25.1

