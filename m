Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30355223741
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Jul 2020 10:40:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725970AbgGQIkB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Jul 2020 04:40:01 -0400
Received: from mail-db8eur05on2083.outbound.protection.outlook.com ([40.107.20.83]:45793
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725864AbgGQIkA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 17 Jul 2020 04:40:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MOKjACMiwrtDGGtPOl4Ht6V+N9nj+bMd3sfolNn6o/UJPM4FciZMLpwaFeXoS7OIBUJgVEhGpZJUhYjvni+sXFrqkD2pRA8NHGfQhOdiz6M8w2Sx4wS/Jn/pJoz1jVxUPitIPiZ4v6M3Tf6fPUlMTiPLaoBXxer7739zPmnd97pWzeMW/JdwCTNwaOQAZubaMUL3xCHKPPgPNNjRyIOibaDG6fQJHCm2cr5GAzyFtUTz1Glm7DUGdrWYzVTGTaPe7bvKVzoxUH+oRyPaZx6s7qWmyAejV3FFgkqrjTrwCDMkGUZrJFgie7VhZIpU/n3K78YoNXSsqGCSx0bgTm83bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yITOsyCsQAV88tMaao191vL9mPSmgvIKkHffVjrTY6s=;
 b=acjwXs7upt1VJQ1h4dJbRCqnaldNUBC4Dw0MaEBSF6nkDEB+obo98I6uZlIUCU2almW2wtzAhusV5PAPE1R4y/fRVUG4bwVMm9Th0KiExYNEBh/mUIdGXUwFPFgglTGM8zLw7jetLVNV28BJgcIPYPBtz5y2MelzryrMgnBGsmcMRO5DrZDiRVxaDLjC72ScvRgjm30N7d7v8xYkseVYXSL7fpH4/613kqS2Udmd+c7NKjBUjWleJvLUa8hsFFV6OFjWwqknVnDYkNCQPOi34HKd1w1QvCfAgIGx0whKIphGi3P4Ew969gzKc9yrYBV+de09VhFG2r7MwxJPzRH2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yITOsyCsQAV88tMaao191vL9mPSmgvIKkHffVjrTY6s=;
 b=ZGuUDuqG1IRpy+a2sNuqSxe/WLVV5+Mbxg6mgsfpvSp4y2Cn3QGG/1VWvc1o+Jk1lZZ4j7RLLRvNt3k7pwfsVme+RTxmq4GGZNYNY74FPoLeAzJfsN43mENfv/xOSdpGebrEePF4U0jmNtXwcGngpncwSVn7NcZ8vb6AuJJYAEs=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19) by VI1PR0402MB3501.eurprd04.prod.outlook.com
 (2603:10a6:803:b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.17; Fri, 17 Jul
 2020 08:39:57 +0000
Received: from VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711]) by VI1PR0401MB2287.eurprd04.prod.outlook.com
 ([fe80::6888:5014:6c94:6711%5]) with mapi id 15.20.3195.022; Fri, 17 Jul 2020
 08:39:57 +0000
Subject: Re: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
 module
To:     Anson Huang <anson.huang@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "stefan@agner.ch" <stefan@agner.ch>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Cc:     dl-linux-imx <linux-imx@nxp.com>
References: <1594912013-20859-1-git-send-email-Anson.Huang@nxp.com>
 <c00f8fe3-d12a-0f91-c301-c028e5aa3f25@nxp.com>
 <DB3PR0402MB3916C9FE00C0F4FC62ACB711F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
 <5e2af0c3-c832-3978-017e-0b1649aac61c@nxp.com>
 <DB3PR0402MB3916AAEE01257A7F9A25A657F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
From:   Daniel Baluta <daniel.baluta@nxp.com>
Message-ID: <c27109aa-280f-db0d-980b-fbd735bab0a6@nxp.com>
Date:   Fri, 17 Jul 2020 11:39:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <DB3PR0402MB3916AAEE01257A7F9A25A657F57F0@DB3PR0402MB3916.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR02CA0022.eurprd02.prod.outlook.com
 (2603:10a6:208:3e::35) To VI1PR0401MB2287.eurprd04.prod.outlook.com
 (2603:10a6:800:2e::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.102] (188.25.93.120) by AM0PR02CA0022.eurprd02.prod.outlook.com (2603:10a6:208:3e::35) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3195.19 via Frontend Transport; Fri, 17 Jul 2020 08:39:55 +0000
X-Originating-IP: [188.25.93.120]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9460d6e7-07d1-4eb0-20e7-08d82a2cfc0e
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3501:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB3501C8D7D5D6E436F79D429FF97C0@VI1PR0402MB3501.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LOuo+8ecXhDmC6Z2q1Z6+qMXuZFCndoDQSVUv/ZBEoA3kR9r4/jFKgJ2kHApciqBjesKtVyS7aUCqrnercdyO77vWn2dtZxmcbacqHXCBM96c0dgSXX+b/hg2qi4d+5EUH77/+mll1ykWa7viIOhZAxS6gvWLlEC0tVvUSOnFoZ+HujDmDmwAfpyk7U48b1mclG3vAKos5YHZ2aKjXjU7s4d4iwlorhg3xwkefeGk4T/oDMYHPx3oHD8L2tpY8bBYXFsyLoMuXa8LUKtQ0sRYx7lcZIEd99hX/PAfcEm2XovQ+nsceHjI04IjByCcpgmX4aHbNnQjSFuE6EFayX03cZkkIh7r7e6nVeEkPIt13kdWj5OnUGaMBUm3CgCinncoVYMrr+DAq9cyUB4ZoIo1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0401MB2287.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(31696002)(8936002)(186003)(44832011)(16526019)(2906002)(53546011)(86362001)(26005)(6486002)(2616005)(5660300002)(66946007)(66476007)(66556008)(478600001)(110136005)(4326008)(16576012)(31686004)(316002)(83380400001)(956004)(52116002)(36756003)(8676002)(921003)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: j/4XKPKoKftAFhVYRb4jQOSM7UTfWejVKRceL0IQAjkXBnyuIAw0cnj4lGFAFApWuzoQbiFZ1Ki/p+HWbQa/5kD4Bc0/NpuSpKuS8QsgukNkO6HWbXWlCViOibGg3RW3Raf8tIz5P4jyOixt8NTMDOMUrsp5YjtkRGlQHVjbqmnzDEutqxK3ryX3eMuQzCo9OrrbzuvnJJpTKWtybEWbIV/tbItAntJ5OoauPviHkYrnYiLCYKmiuiUsyNBH1ywM85ypDT5RCp7NFdH6LMEru0zhXjw4NQvFZ0A7CMd/Py6kVwjevpuHoQj2wmKu+VzHNtJYIK4JZ2CeMlzECGVIYBSWiJSrKAk7ul18RTPUX2f7uxFC6IeGp+aCMjqdI4UFgZ5xPvFRh+yoQHJNNPXmcnXx1gIeuXiSXLkVU1IWV5yVcHR0AK/qT8w6RMc0wA2dXq53isH5mVcs0qYuk1hC+/AzFUgHLZcOr+VB7Ak7K64=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9460d6e7-07d1-4eb0-20e7-08d82a2cfc0e
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2287.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2020 08:39:57.2085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eJC8P2OL9PPYqLafBs6S+kLyXnyv0Zd8Qm/j5vQafi2PhGdwUdQMzy8OoX8yAHCwLrJ523jjR152mQicL5Fjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3501
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 7/17/20 2:44 AM, Anson Huang wrote:
> Hi, Daniel
>
>
>> Subject: Re: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl driver as
>> module
>>
>> On 7/16/20 6:21 PM, Anson Huang wrote:
>>> Hi, Daniel
>>>
>>>
>>>> Subject: Re: [PATCH 1/2] pinctrl: imx: Support building SCU pinctrl
>>>> driver as module
>>>>
>>>> Hi Anson,
>>>>
>>>> Few comments inline:
>>>>
>>>> On 7/16/20 6:06 PM, Anson Huang wrote:
>>>>> To support building i.MX SCU pinctrl driver as module, below things
>>>>> need to
>>>> be changed:
>>>>>        - Export SCU related functions and use "IS_ENABLED" instead of
>>>>>          "ifdef" to support SCU pinctrl driver user and itself to be
>>>>>          built as module;
>>>>>        - Use function callbacks for SCU related functions in pinctrl-imx.c
>>>>>          in order to support the scenario of PINCTRL_IMX is built in
>>>>>          while PINCTRL_IMX_SCU is built as module;
>>>>>        - All drivers using SCU pinctrl driver need to initialize the
>>>>>          SCU related function callback;
>>>>>        - Change PINCTR_IMX_SCU to tristate;
>>>>>        - Add module author, description and license.
>>>>>
>>>>> With above changes, i.MX SCU pinctrl driver can be built as module.
>>>> There are a lot of changes here. I think it would be better to try to
>>>> split them
>>>>
>>>> per functionality. One functional change per patch.
>>> Actually, I ever tried to split them, but the function will be broken.
>>> All the changes are just to support the module build. If split them,
>>> the bisect will have pinctrl build or function broken.
>> Hi Anson,
>>
>>
>> I see your point and I know that this is a very hard task to get it right from
>>
>> the first patches.
>>
>> But let me suggest at least that:
>>
>> - changes in  drivers/pinctrl/freescale/pinctrl-imx.c (include file and
>> MODULE_ macros should go to a separate patch).
> You meant in patch #2, the changes in Kconfig and the changes in .c file should
> be split to 2 patches?


No. I mean look at path #1.

The section above should be placed in a separate patch.

  static const struct of_device_id imx8qxp_pinctrl_of_match[] = {
diff --git a/drivers/pinctrl/freescale/pinctrl-scu.c b/drivers/pinctrl/freescale/pinctrl-scu.c
index 9df45d3..59b5f8a 100644
--- a/drivers/pinctrl/freescale/pinctrl-scu.c
+++ b/drivers/pinctrl/freescale/pinctrl-scu.c
@@ -7,6 +7,7 @@
  
  #include <linux/err.h>
  #include <linux/firmware/imx/sci.h>
+#include <linux/module.h>
  #include <linux/of_address.h>
  #include <linux/pinctrl/pinctrl.h>
  #include <linux/platform_device.h>
@@ -123,3 +124,7 @@ void imx_pinctrl_parse_pin_scu(struct imx_pinctrl *ipctl,
  		pin_scu->mux_mode, pin_scu->config);
  }
  EXPORT_SYMBOL_GPL(imx_pinctrl_parse_pin_scu);
+
+MODULE_AUTHOR("Dong Aisheng<aisheng.dong@nxp.com>");
+MODULE_DESCRIPTION("NXP i.MX SCU common pinctrl driver");
+MODULE_LICENSE("GPL v2");


This can be in a separate patch.

