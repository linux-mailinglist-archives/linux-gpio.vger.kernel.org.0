Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1548131CD0E
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Feb 2021 16:36:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230133AbhBPPgc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Feb 2021 10:36:32 -0500
Received: from mail-dm6nam11on2088.outbound.protection.outlook.com ([40.107.223.88]:30176
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229699AbhBPPga (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Feb 2021 10:36:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lz3PmYfBJpP3Wn4lOHpqalE09qPezzf1TAXluPuKgWW3hORC2jLAhafZqNSaghPECtoe8XHLToilDqsDGyApNlxXEwxvA01sGbAsb1OqoPeZwYIadekQdk0WBMJQNk/uGjiygg5xGdg2SRgbwz49UBSM0GhE9slvC+RxubG0dYbrXD+ttaOXIzp3/T6IWgSiSPCuIyWO7G/QneBA7weukr/q2wtmq1RTpDzBKxvlNk/Q0YGcmKuwqqAI5w+pEjOaDx9zA80f/4yfyAT4NypZ4My8CmAa3j3PYbpVUBRO43qs3FwAcOUQJnaWAndOTCGUVVvpFo5gtIR1elAy8TMesw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Y0NMKq/cMP7tGQ7RELiMXNQMABA2XYl89Nwur5xjrc=;
 b=n2pG4tvCiLbmHRMsW7sdAogK6J+8IqgYGh300rKMupjZmH2vttaHFPvj9KxYaDD2KNAtdAhNBBtX0xZsGR4TCZC/JjXAF5USi4eRPY8cZPbmtlEoKI1LMo8agdtCHw1GXBZpx7EuHD8wrjUZgvRjukC3rJpKogGTHNwEeGK2ixJa6O9Ky5cT07mL7pcgrUHsh2vaoGZ5Fs9de2FhlnXjTUOLtSqLJKKPS9vUX/dGSdmMTSjBGzxkUnRrIuFv4dacW5e5o0pnu0quBxjKWQ0kJkhWH42VwF8+i3LbCbzGoUYxIkECZuqZQPAApR+in/G+/8OIJKs+R3ml3hIbz9Pggw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Y0NMKq/cMP7tGQ7RELiMXNQMABA2XYl89Nwur5xjrc=;
 b=jlUBehbCGvaaER/Zk4XGC+85XdB0or97nSDzf/Dm+AE+QKy9QeC7HAw94xqBdWmvRfeoDwhS5VyvJZ7gloq+Zycb14VeYHiy6H/JWOCsTH6sM+eFNMcw8hUMFZfnyNLHMi4jyniUQKV4Tqwp0MpHl50qKyv0wyAKzcvi9RbGRV4=
Received: from SA9PR13CA0086.namprd13.prod.outlook.com (2603:10b6:806:23::31)
 by MWHPR02MB3149.namprd02.prod.outlook.com (2603:10b6:301:62::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3846.27; Tue, 16 Feb
 2021 15:35:36 +0000
Received: from SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:23:cafe::87) by SA9PR13CA0086.outlook.office365.com
 (2603:10b6:806:23::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3868.14 via Frontend
 Transport; Tue, 16 Feb 2021 15:35:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT048.mail.protection.outlook.com (10.152.72.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.3846.25 via Frontend Transport; Tue, 16 Feb 2021 15:35:36 +0000
Received: from xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 16 Feb 2021 07:35:35 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server id
 15.1.1913.5 via Frontend Transport; Tue, 16 Feb 2021 07:35:35 -0800
Envelope-to: lakshmi.sai.krishna.potthuri@xilinx.com,
 linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 linus.walleij@linaro.org
Received: from [172.30.17.109] (port=52748)
        by smtp.xilinx.com with esmtp (Exim 4.90)
        (envelope-from <michal.simek@xilinx.com>)
        id 1lC2Nz-0004Vu-LJ; Tue, 16 Feb 2021 07:35:35 -0800
To:     Linus Walleij <linus.walleij@linaro.org>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sai Krishna Potthuri <lakshmi.sai.krishna.potthuri@xilinx.com>
From:   Michal Simek <michal.simek@xilinx.com>
Subject: DT overlay applied via pinctrl description
Message-ID: <63d610ba-5f63-2be1-6215-f44bd88d94d2@xilinx.com>
Date:   Tue, 16 Feb 2021 16:35:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a7567eae-80f5-482c-c9d6-08d8d2908184
X-MS-TrafficTypeDiagnostic: MWHPR02MB3149:
X-Microsoft-Antispam-PRVS: <MWHPR02MB314950EF8F90B004660BEDD6C6879@MWHPR02MB3149.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: m+d6lcC0CujP1WLUbGXZJpFJBFNC8PlEtQBMBeP9k3N85yDtgH4FN9Pfk2ww9UNyUI16TK3GdW7wsaNURyDq9dpnt22WjcS1EacQqNCfZrC4hAhi8M1l8tDIcUzdtV2oHTgVLyAf0pm9YbaXe8ciIPy/f7nhnjzjR8nVLTcP3f5eKoYkwfQkRwWBgWLXGNCXol4JL+aWtgzEJqODymf1N+0trewcUPx16zv2KGS1N4JLYb3NcCNvkdZYKE0MUgQCwMm/gyzgBlGFf6PdNe73fckvojuk2w10UlLkFOoB0ZaZ6OQE6c9pIKZnPSeH5is67ZZwP631cVXwaOHHKPxKLC7CK71fhKJ11NJdlgMp0uUAhfnKkVjs/+Au0ek7QlHqw7HVl78mBewbVJK2Dyj28EVzmWIkeDlEE2w6yghm5+hO9zzt9tD30vAwyBClqYUYpdw9HyXzMp0EY14uBpuqNc/pmZle0v2Cc/oK+T0xsRWnEsViaTHbgG4ygRl3x+Tr/fLVIiUwWVSVzmX62/IZ9F9c9wg60ykiZRMlmgSCReEaRv3xNP24DC3h9weA0vyN2PViPj/OOve46/yj9UF2YskQCxMdtQxl0se7csgTF2ZPv8fKzU10eh0ZGMS/6PUB9MlPxLhugEkDVXJ5h5rKPHVhWeyPMaGPUHa1TcXZDTEEJ/0FWx+thYhPC0as+QSAdzXQivcDdWra1/yGm37kYiNY6FI4DS91CrStKO9utcoYsYmmx++fDF8kvaopQjNmNUfszdCfilIckJzjKP3JVtoAou5AO3B2cssUTBcKEPA=
X-Forefront-Antispam-Report: CIP:149.199.62.198;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:xsj-pvapexch02.xlnx.xilinx.com;PTR:unknown-62-198.xilinx.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(346002)(376002)(136003)(36840700001)(46966006)(31686004)(70586007)(356005)(36756003)(70206006)(36860700001)(82310400003)(7636003)(186003)(478600001)(47076005)(31696002)(36906005)(44832011)(82740400003)(2906002)(426003)(8676002)(336012)(54906003)(9786002)(316002)(26005)(107886003)(4326008)(2616005)(83380400001)(6916009)(966005)(8936002)(5660300002)(50156003)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2021 15:35:36.2212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a7567eae-80f5-482c-c9d6-08d8d2908184
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c;Ip=[149.199.62.198];Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB3149
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I have a question about expectations when pinctrl setting is applied. In
DTS all nodes are described in the order available in DT.

uart-default {
	mux {
		...
	};

	conf {
		...
	};
};

I don't know if this standard description or not. I definitely see other
pinctrl drivers which are using different structure.

Anyway when overlay is applied the order has changed to
uart-default {
	conf {
		...
	};

	mux {
		...
	};
};

which is causing issue because pin is configured first via conf node
before it is requested via mux. This is something what firmware is
checking and error out.

That's why I want to check with you if this is issue with DT binding
description we use in zynqmp pinctrl driver posted here
https://lore.kernel.org/linux-arm-kernel/1613131643-60062-1-git-send-email-lakshmi.sai.krishna.potthuri@xilinx.com/

I have also tried to use init and default configuration where init is
called just with mux setting and then default is called just with config
but the issue is there as well because in pinctrl_commit_state()
previous state is checked and for MUXes pinmux_disable_setting() is
called which release a pin. And then configuration in default is called
but without requesting pin which fails for the same reason as above.

That's why my questions are:
Are we using incorrect DT description?
And is there a need sort subnodes in a way that mux should be called
first by core before configuration?
Or is there any different way how to do it?

Thanks,
Michal
