Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2E72A53A1C1
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 12:04:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351800AbiFAKED (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 06:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351884AbiFAKDJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 06:03:09 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2070.outbound.protection.outlook.com [40.107.93.70])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 746ECDF19
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 03:03:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fQf5MQh1CfTUua31w1uEEtiGOHEDxyBbJytjnzimOFFK1lN0uSPJji/hCjGMobZWYV6NSgj7HIEcAElESovUUOvfT85O4sETDMCw8MVDtpxlmtVfEY3W6ejph5WOA5ZCHoaehO6lGCIqVme5ReUY2QE42TDsw2ciYC18PZL8SbE7cYBpjTP1upBhSXKWW2fVJiznuwvDNjNgAhVEyu0L5rfwv1a0kkDCYpeNJkprmarBmqMKjE0ppgwrSPCuC0+JLiEdqzJkEtzlntae+l8U6MgREsuQKfuESE1aY8+27tOIuQ4e0IWZwBB8LSiTAIeYNwZRmPS0A9c/M0AUE8D1SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZcaU0hgo9fEqT/PoIDne1XJtDr7u0BZZ9tF3R6zOFs0=;
 b=mTIVzlh7D7Zf35zdGlAsTXYb3JR+SqaPBJSOYe1EL/T6cb4CTgkegRqqi7PjIR12ntlTH4XprICtxV0X5jdH0iB5+K+POFCJX/FVwJi7zqT5MU3zrZg6cQ94zSCHmmR6py15qY98FXnk6I6ifCM6gHu2BFbN+CNe/LhZg5KjYObIo5DHjRdYq+/JH8uTywUZmnADMs6JbRqzfVFk4JuFAFnQSL3FF2v5FNdcw13ojxOHlLF7mKU6b93djQy/wQ1WZcPUpOcjkX+WyfJ/bDkrp+p63OlDGtt9FuGqgUVosI47of91Hbz5NrZLK1RSykXJ31GUa0Yq60tmfQf4hlcXvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZcaU0hgo9fEqT/PoIDne1XJtDr7u0BZZ9tF3R6zOFs0=;
 b=ly5rk2iVAwJJ3Q4rz3fE1jMa7ga0UdMpIXPcONngyDUmjWbGWF8QMWxV7HS9hZbVAllZpnwQnuJvnXwN80qoQ2tAEZDKQVnyK5grfq99JK1NAiRbJGfnRSV1W/LAl4dCM3uP+6I3CGfLNo+KdJtPbeytzRkbDVwaIO1rG3QG3fE=
Received: from MW4PR04CA0035.namprd04.prod.outlook.com (2603:10b6:303:6a::10)
 by MWHPR12MB1503.namprd12.prod.outlook.com (2603:10b6:301:b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 1 Jun
 2022 10:02:58 +0000
Received: from CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6a:cafe::9a) by MW4PR04CA0035.outlook.office365.com
 (2603:10b6:303:6a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 1 Jun 2022 10:02:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT048.mail.protection.outlook.com (10.13.175.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 10:02:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 05:02:55 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v4 0/6] Enhancements to AMD pinctrl and implementation of AMD pinmux
Date:   Wed, 1 Jun 2022 15:32:08 +0530
Message-ID: <20220601100214.828595-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f2866318-cdd9-4dd8-1155-08da43b5e7e3
X-MS-TrafficTypeDiagnostic: MWHPR12MB1503:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB15035269D40232252730975EE6DF9@MWHPR12MB1503.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +wr2zmn6OVvBe93Ekk4oAPlgIQjnwFTvwVvSzl5rk5LnRhnwPWvw/XIcaDBEeol2vO91U8ACc3msvbVqw64+C/4GLjsS3TihrnEWmGsweUTwStMuJiUdtjx5aoPfymBtLKOhKClqqC9H1OvJNncU/JAc8608tx2nzLJ16Ekych7kfet2zW0X5C2ErrK6JxMkLMuVJvHS+vAXL0Eu6/+z9y5B/dGFltN8KNTI2h6JSlVqaPzjo2vkPDMFlG6Uy44KmBjg1n831ytSZSne/unILE2pmFsWAPpS8AgCJTnsbEwJ8azpSWrA3I0Z3HNTnp1NFDgxABDthoZtHwXugNsRE38C/3C9VnzPDpUAwNrG0BX9quW+ByaAeCnvEqI+Re9Aqy2hDza5Wt99maQliE7UzLi2n7JTFdC2RZhxRRap9LmvzlAb/1kcGHyV3dGjt//fchF5LYeuubXRSnGMP0l50L7S70PfJZLN9SC6Tuh4AVF1yQmK39KvxAyGmMJJEnbtSW73dFS6dsCB5QCI8jVHRKWsm1Iyc0doNdLHRLEzOwfsAiDR5oXVIG5to/wx/CnfAzQXOcHkbeu/9o+67Dx3kZ5Ou+phi00P3GD6pB8QZGvaJUu2ArZPLpaSFLYXYS9xNxpuvnXlGG34LxxeQz+qq9g9qrgQ0XdUlaac9W+dYGBabEUAb+34pokLDV+919fodu4DJc1RHGMDPs0ayYt3yw7iLvyCdbJCGy5JEVlicOtAs1i/w8mqRGKt2SYTDdENxPt3JMfUu4axb1m0NC1rLa1bkDjueIJ7GEBNAMWuBEmps6Xp5bEe3v056WC2Ersj
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400005)(2616005)(186003)(1076003)(316002)(4326008)(36756003)(110136005)(8676002)(47076005)(426003)(336012)(16526019)(70206006)(70586007)(83380400001)(508600001)(966005)(86362001)(7696005)(5660300002)(81166007)(36860700001)(356005)(6666004)(40460700003)(26005)(2906002)(8936002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 10:02:58.3031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2866318-cdd9-4dd8-1155-08da43b5e7e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT048.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1503
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

 drivers/pinctrl/pinctrl-amd.c   |  105 +++
 drivers/pinctrl/pinctrl-amd.h   | 1376 ++++++++++++++++++++++++++++++-
 include/linux/pinctrl/pinctrl.h |   20 +
 3 files changed, 1457 insertions(+), 44 deletions(-)

-- 
2.25.1

