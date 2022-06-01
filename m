Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 316E053AA19
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jun 2022 17:30:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236679AbiFAP3g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jun 2022 11:29:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348790AbiFAP3f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jun 2022 11:29:35 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2071.outbound.protection.outlook.com [40.107.95.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96B694739F
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jun 2022 08:29:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LJlOW/7QMrsRGLPLjwSWHc5Gt537FkMBHs0rCaU2BfBOuo/gxNK9JfluEfw4Kcm55gzUT4/tGonjMc6iFbSTY0ApAgbT5TBIp+KI/leNqG4Xavm0QYqHFmsj9Iooso0kNyvIzz7CdOMAKNotqsGDojmamVxhDnHjcH0B9ksAzS0GOlSgTVy3coOnOxIeis6p7S95zjyaJjDFTQtcwZAFAuxsHwgYxjd4JBMh7ISHbWn2zZJ6h33DzlM3+uIByza51+hKwHtkv7QBF0th/ixc7U9irsafStqD3mkUZOC3YRQN5yHfYv1otPe0U+/OSXPMk8djLjXymLtW+2QnNRd7Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1lpmNW21h37CvraXx/MMEJ0TkD8VYUiwE+1ItBwi0Fk=;
 b=juqT+ZmFx0Tw6sJUZ7a+l+e+wWHSF5MkeKnbhsWLg1tqgYvakc6SowfWHW7dEOrrLhvUzfJRlih3aGbH0NACclV0ejDr87FEvJV4VY76IIl9EllTh+fNrpgGZxtozWn6T+PoESdcIGqQux379mlTMHs2XJgzrlwc7TWMQScs+nED7dUnaV7dFf6PJJsmkbf44Bor/UpUCNrlONqRo1S/eK+FojFUIGLZC57Bse8gWygKU/4mMQUuv2PT3azbPb3KjYDWFVpfmQX5HtN+Za6mEmR9SvFtXYM5i/phUImoCGcFRS7c1YpGEoaqB5VmuFFK3BVDBTclgyBGGG3Zhz0fzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linaro.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1lpmNW21h37CvraXx/MMEJ0TkD8VYUiwE+1ItBwi0Fk=;
 b=5fEOlQU0BWatA2mWSIz76QdSEpHGj9jMps8rQwy0/+SZnaV9turR3/PMkPjTVD/N/egs2FBhsaZB7hdoUcO2PxnfNPsEwajyBwceNxVLKGVHN8TsgGu7AqL8vbUY9AJjxoDUX861jCvsBsbpwZHqT32hUZ9kM7ISrgHEkaLS4s8=
Received: from MW4PR04CA0090.namprd04.prod.outlook.com (2603:10b6:303:6b::35)
 by DM5PR1201MB0203.namprd12.prod.outlook.com (2603:10b6:4:56::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.17; Wed, 1 Jun
 2022 15:29:31 +0000
Received: from CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::17) by MW4PR04CA0090.outlook.office365.com
 (2603:10b6:303:6b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 1 Jun 2022 15:29:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1NAM11FT015.mail.protection.outlook.com (10.13.175.130) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 15:29:30 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 1 Jun
 2022 10:29:28 -0500
From:   Basavaraj Natikar <Basavaraj.Natikar@amd.com>
To:     <Shyam-sundar.S-k@amd.com>, <linus.walleij@linaro.org>,
        <linux-gpio@vger.kernel.org>, <mika.westerberg@linux.intel.com>,
        <andriy.shevchenko@linux.intel.com>
CC:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Subject: [PATCH v6 0/6] Enhancements to AMD pinctrl and implementation of AMD pinmux
Date:   Wed, 1 Jun 2022 20:58:54 +0530
Message-ID: <20220601152900.1012813-1-Basavaraj.Natikar@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7fe4274-a558-4c1c-c7de-08da43e385b6
X-MS-TrafficTypeDiagnostic: DM5PR1201MB0203:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB020321FA615C7950424639DAE6DF9@DM5PR1201MB0203.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bIzfoTFYhciY7AJov4ZQa0lFZZaq5DYjqelj9a/jn21sfQ9WZVpew5qxraQzwzcbvYF5irrf/aOTKxxZEWn4+Uu9ycia8V2Eoyj90wpH2CIxE3pFIDuvBG8+DlpGjxt43nUlTR2l/NGDyN08lGZclMyyyRMmYhQ7ghCZf0VYRBfSBJT0qYDC0yXaUcKgQ2rvcreQlTWQSQBZB5V11ONsNanrkeij1SZUMnRiL1P4rOnIBW/5GbarFz13uEtP3YapsnyCj3Vbn8KbRzqVNggvkK963WPneIZ1nyK9IY6hM5f4ORCD+M9BKW00HEVAu7xMAkB8mlDOLGc2MqWar18gvyVF4sr+ZVo7ALVQakTkleuZh5fWWRDjrgznR9/PkoUd6qK6GQXBzQXCsup4yS76gre5iOaI1ET/Nk9aY+qPwy39OO7keygJC9VDfFqnnavM+vwKttRjq9YlxRTc5uq3jSZfWR/RecEXbZkQJJdNVDA309K5PJXEc/6nsa+NgwFqe4UUytzApr5y0T909Ph8T7js2QnZhSdqDs44ZfQPgGsRipYRUdH/lr6zlVopjhMDbtQ8WhKDKaEnmKc088fkyih5vKV8VDoFuLIWsxXZVXq4GA9cs7iCQUSpUPBheMs52vJCQuTLHPz9pE5mteONjB2SZQumnancferULHqHLw57Db8UPI4U85qAoKx6kCe6n9uH5/um1jdvgQifzYuqopUAGKbjB5+Y9v5Js0ceEquZWC26Q3LRgtBnkJYWOXBzy21sQW6qKH/aUc4xdpTFQ9LZgmopN8vTKHuEd44PYXO0uCet0Vw5CU/zE/mMVL/m
X-Forefront-Antispam-Report: CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(2906002)(36860700001)(1076003)(426003)(83380400001)(47076005)(186003)(336012)(16526019)(26005)(5660300002)(82310400005)(8936002)(110136005)(70586007)(8676002)(2616005)(81166007)(6666004)(4326008)(40460700003)(7696005)(356005)(508600001)(966005)(36756003)(316002)(86362001)(70206006)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 15:29:30.4457
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7fe4274-a558-4c1c-c7de-08da43e385b6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT015.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0203
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

v6:
	- avoid nested conditionals.

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

 drivers/pinctrl/pinctrl-amd.c   |  103 +++
 drivers/pinctrl/pinctrl-amd.h   | 1376 ++++++++++++++++++++++++++++++-
 include/linux/pinctrl/pinctrl.h |   20 +
 3 files changed, 1455 insertions(+), 44 deletions(-)

-- 
2.25.1

