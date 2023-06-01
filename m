Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5CD7719507
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Jun 2023 10:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbjFAIGQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 04:06:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231669AbjFAIGO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 04:06:14 -0400
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2044.outbound.protection.outlook.com [40.107.249.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367B797
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 01:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WlRTQGCy6qaRfDRbXHhZVKgqdrtDpbs80yUeSu1pc4oUBEqVuAEMNuV7R4AzV+nJ8styBuk7Jg3m4KBUwXqB4nfCtYzbIXn+T/tMYYBFzFDHyc920+mmXxOmh3Xfp7BjkrU9ppSPlQvBlfBnVlr1cmKgBL7qjQ/4x1qFeSj/9sk0XBK5xuYi1XJwTkWWptYIVZz/L8JAvqFwUwVUDQKruh7mOTjD4E0ziMhwkp5D0GF80+WZdqLlCtmnUfagHQ1PhONLOZ/ql1EyF3p88VpmeqFl2hf9SJIj1J6MvRGg6BZh3x5Eh0HcFTCBS7wADHmctIODuCT2IpYunyJlMVwn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+she7x2rwR4wwdeSjRVHcJ6+hg+BoXaRerx0Ev9jf0=;
 b=cLF8Uam2TmglKcjIjZIM/1pv3ZLuOEVBxTXZITkmlCDwj4lZcVFcZq5uzvUrXaMSPeAFjh8uPDyB5V+Iz8nfv1fyiwGCLyKYb2WlE2qDNZ7dMypEDWPpoffBGpeh8mZQwKyDeVbRrwlkBSwUnQQTEgasQ5ZJvMzEpack63J4wL5k7W4fIPPUmIuFsnSxJAUd8HqedVu9SeolTm4orZiWJFyZSL8gylqDfHx5WQ7BMStVrImFT76XVTKyy8kdN/zww//UC4UzCT8o1ukIRJfhkT9xiLjAFBB/cPb4fJsnJw0G9d0YoJC2hvtfFVNFD0gqbPEdj/Y87rv4t1yyLr9bjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+she7x2rwR4wwdeSjRVHcJ6+hg+BoXaRerx0Ev9jf0=;
 b=UCqxVdtMatVnt6xXhI4x9EO3qQsV114aY1PwdDXgmzNuGW9K54Pu45ZA34gTXBuGwyqZtD1JLmC8FLbcVjXm0QlYo17YcAUa5kuWelQ02ZB8GrU6C8nvARQ3dNcexUwzTpg/bj7114l8AHAJpSJjjJiEky3IbLEtaUiEIACavJpfjGaQ+4HTD+4xTZHcfv6Iy1gL8EobXfNA3ZvfmtPTQflRYconNXN9TP8vDDD1PmutronfAYKvREXvlEUiGz2nO+JKUn1Lt/ud24J+8czTDuHbdX4uopvu5I6tg6rM8ESjhPQyahKWYIDHVrd++TPElTdS7HgTL43HXHzmszIXtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR0402MB3439.eurprd04.prod.outlook.com (2603:10a6:803:4::13)
 by DB8PR04MB7082.eurprd04.prod.outlook.com (2603:10a6:10:129::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 08:06:09 +0000
Received: from VI1PR0402MB3439.eurprd04.prod.outlook.com
 ([fe80::7840:68b7:3d49:6bf7]) by VI1PR0402MB3439.eurprd04.prod.outlook.com
 ([fe80::7840:68b7:3d49:6bf7%4]) with mapi id 15.20.6433.024; Thu, 1 Jun 2023
 08:06:08 +0000
Date:   Thu, 1 Jun 2023 16:06:03 +0800
From:   Chester Lin <clin@suse.com>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, s32@nxp.com
Subject: [GIT PULL] pinctrl: s32: Updates for v6.5
Message-ID: <ZHhRa9FgA5ZWV/sD@linux-8mug>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To VI1PR0402MB3439.eurprd04.prod.outlook.com
 (2603:10a6:803:4::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3439:EE_|DB8PR04MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: 5df4beae-0249-435f-1b2f-08db62770e64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J/e7xpkRmI/01OwwG29O9dbq54PehxbIxU/N6YZZWEXmN7ujtrkNvckKBlMOiz1igR2Sc+PATV4FfdX5nSKDItuU+OZclFGXaFT/+7pmn32PK09CVYZlaS0rabOLQ2DxQ0nVochzdqahB0yJPwGjKPiyfqahoYXyJrvENmkDV+3c7OvJJvDBuNmifN9BL7mhQ3EEm6DR+HvuVKMwLEQ+HU8KEZS6wsx/Aau06qP9jPaU0uUrHYYEyI0jv5zuTvISQYCvrJGT68Yp+Ns8yhXnOQOdHSabxcffoQGWMJQOwGHV2mI6zYve+qS7GEuwM3htifc0onluUacfQ8/3tF52hPcRn395ZNOcuH7ah6agsonnZNjoE/EjqdED9FIk6oLAlCiFbLK8EcC0sNsKeJEwDdLBFlYuXrr8VevlNRGlB2oOIsTYx39A0IDpDwM18jqeDdh25nep/KjNkYdr2iCHCzKU5e69Xv7l1S27XKL9BDf4Ik6A5aKm0cyeKbPHP8LxijtwqoVFf83iwZJ+CVn5GjNz65668wTqmG0ov49Ghkc=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR0402MB3439.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(376002)(396003)(136003)(366004)(346002)(39860400002)(451199021)(5660300002)(33716001)(86362001)(8936002)(8676002)(41300700001)(38100700002)(66556008)(66946007)(66476007)(4326008)(6916009)(478600001)(2906002)(83380400001)(6666004)(6486002)(186003)(966005)(316002)(26005)(6506007)(9686003)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?izdNpL30qgcrfGOnSKhk2NmmiSzxGFsmf3ZepCSwWFeRqBgjZiKwsOExXdgC?=
 =?us-ascii?Q?61IRVEKJP6m8qobH252+isAtH2pYqdl5L2lwFb9qC1Gv7ET6U/ZYD+wLJcgg?=
 =?us-ascii?Q?qwGUSKla8DhUGEAJzogjYdiBTS3k7PZ7V576EVrXRSNYwW6us8CYgju8rLXm?=
 =?us-ascii?Q?o7vuYfDLvhCs1cHiuls6gal92vTBH2X045hxfrgYv84KRPIgq/BiyCEuFItc?=
 =?us-ascii?Q?VTjc+jcQnXXAPVFgmscIVRznLCTFzbi64I0JNrspLiYil2WvJlHe9Pijb0Uf?=
 =?us-ascii?Q?VBg/eahyW9t8SsZXcsThXR2WYBBUhmkis5fQGcdTHzMmKrJVSqL2yxOduAv4?=
 =?us-ascii?Q?wESgpW4wEvDpdwHgz+AbuFiaMU5460ElI5A0EIxWdvkQPebJXbTXq4t+MZsv?=
 =?us-ascii?Q?wFG/tNJvjjW0xr5KCozgppWkWdbRqP3tnrykAQ09tpNE62X0xWsPA7UCnjcH?=
 =?us-ascii?Q?0hzJ979mrY/zRDRINntFRulPb7aTkK/jruE0DXwB9/TNnW7xwG49C3aOlMoU?=
 =?us-ascii?Q?j1JxfM0PY8Wl3CtrCDEUlk2gDviihhd+gBErlW5QNN2vOGrHS780KSqdbKqp?=
 =?us-ascii?Q?ShO5vMFb7tDYHWcf6YM8YaU1b35/3lFwFzB+L1pyLh4AU56C5VzIdUJebxtS?=
 =?us-ascii?Q?hq1VHhkEpdBHhTfbgz4MZw29tWtXGIUhDtQttx6CdvnpEtQcTt+sK95ltKlO?=
 =?us-ascii?Q?5ML7sRoZ34G+Kxy+Xvi+XEENrwfEZ8/8oVqflvV4r4rYSlG3nQmLiyQx4d0p?=
 =?us-ascii?Q?E56E8LnfpTLG1HfL9t/fdqjaf3ia/BdQ/3r2SOKYoHXgupsDL9HZAJPzV3Rh?=
 =?us-ascii?Q?RTkmAoWp3pTJY1kygjEOOCGqmPBBbtD+o5LdCr4zUrMo25CfOeQaFaraiCGh?=
 =?us-ascii?Q?XKVWEu7FrxRLwab6rh0oSnaLQOBg3tYH12nIE/x2PCLkG1ZD+wU3lR1Asn5h?=
 =?us-ascii?Q?ZiaeaGpRwNhuLWSD7LUpe0896z7Hytb+NAnzO1FjVyUyXCjx4IkzpXmTNYQb?=
 =?us-ascii?Q?2GF3TD4UhRFs74uvTv/SWK4M/Zy6kMiYwecWgv1hrOUT6g7qNmBkZoAwAtEd?=
 =?us-ascii?Q?msd7qyBQZxwB4HUUAn31c8o4S0TnqtkzGB7U9ionlYeuc7lwtRKF9HuRmI/s?=
 =?us-ascii?Q?5g24BuP5/HbQkOo47N/GmzehW6nUGGXHUiR7mHlCRKVcnigJAnSVxUHsfeez?=
 =?us-ascii?Q?DA4kOD23o1VQL8OEKrs3p6ySrCISsAbJjYqbnGNKgExy37/0vHgO4iV+60Gl?=
 =?us-ascii?Q?D4xIFCDsxC7SRQk+tdURpI16gelfTFR6HIdBisuzTlT81JUgaHWALyNdMZt/?=
 =?us-ascii?Q?7GoDyjozmEyAp7qdyMRbwSmyPcMy46dMUQlcUnQxYo8hPsNJaXs9uD3d1p7M?=
 =?us-ascii?Q?GE6coEB51OL0IQuegrS0hxXfF5mbmqUhyycM6JwuLgk+J7KoUcmQMq0+7i/f?=
 =?us-ascii?Q?obyZp0o6TnazuqzrBT4lABBfOl4uCIdp8miQt3mmkJh+kKRS29eLyht95wu6?=
 =?us-ascii?Q?MnCB3QMiws4vTXpMXRjtvp5lem23bwbK2Oj2I6J64JXH66IUaQc1r42g3lIj?=
 =?us-ascii?Q?7oW79rVySctxardIdBQ=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5df4beae-0249-435f-1b2f-08db62770e64
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0402MB3439.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2023 08:06:08.6954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wEOz9Br2qX13kiI8vJVVtBotg3NjlrDbKKaqcXkLm59RINxuZZ64e/wQssB783Yl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7082
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Linus,

Please pull the following change for v6.5.

Thanks,
Chester

The following changes since commit ac9a78681b921877518763ba0e89202254349d1b:

  Linux 6.4-rc1 (2023-05-07 13:34:35 -0700)

are available in the Git repository at:

  https://github.com/chesterlintw/linux-s32g.git tags/s32g2-pinctrl-6.5

for you to fetch changes up to 261bdb8f2611be9b2b4bd176badc76d101bde408:

  pinctrl: s32: separate const device data from struct s32_pinctrl_soc_info (2023-06-01 15:41:31 +0800)

----------------------------------------------------------------
s32 pinctrl changes for 6.5:
- pinctrl: s32: separate const device data from struct s32_pinctrl_soc_info

----------------------------------------------------------------
Chester Lin (1):
      pinctrl: s32: separate const device data from struct s32_pinctrl_soc_info

 drivers/pinctrl/nxp/pinctrl-s32.h   | 14 +++++++++-----
 drivers/pinctrl/nxp/pinctrl-s32cc.c | 30 ++++++++++++++++++------------
 drivers/pinctrl/nxp/pinctrl-s32g2.c | 14 +++++---------
 3 files changed, 32 insertions(+), 26 deletions(-)
