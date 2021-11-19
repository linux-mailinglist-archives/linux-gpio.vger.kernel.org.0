Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B90F45778C
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 20:59:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236672AbhKSUCv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 15:02:51 -0500
Received: from mail-dm6nam10on2137.outbound.protection.outlook.com ([40.107.93.137]:31457
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S235044AbhKSUCs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 19 Nov 2021 15:02:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSvEyhMi5hpW8GnHzOzNDLG/eVfEApvJCJM5xu5G1wHd9SVpjOWTzU1DzGDQ+StXrZctOUenAuLivi6aogKdbXes7JoKowy2f01mWyDN5BnMagPTzOoW+F5YqKERNQ4az5IvAOv+ADa4uJHhvReBrhLkcvLGZxt2DW0kklapdXFpkT75HheWbhJT3hsHG0DUdwhVzPJJ1XeifXPdrPgzOFCsE2TobYU2xiVA4pWR4hv2THnw59HMHp/EaVdOKOaYPd8aVC1M9A3ujGv404+28YBslm3ETeWttcdivbW2+BHVH7IctM8NcIbRIy+iuIKtkxtE0+qneMiQLWJEQ54Ugw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y/QQb92rD3c6NmDqX1/t3hDsMmO9iOZP6jMPzbgAAb8=;
 b=h9GNW2TI6kvogIFPc9saBhEenOd2jZMJHRRboYrMFHYjZ+F0NlgROKv45U2VzmxfZ2NzQQPly88312i9DuX13aSxD5wr2/rvAM8vP5VxqSipiTLtSyi01BEHMNFSmx3ARO9g4+r279QTElAqsRCqhYwgm219hO1DexJM6vgWskc3LIfejepKH8U/GJcxelPmOz73pQL9EhOIXbt9AiQypumwU0oP9HC0p0Zh8dM3MK8TlPgvRKMipygjSSOlBu2KAyK9dr5LvcAyeZpMknmtC2AU/LI2m24UGWUi/Nl8Sd4dpmFyYfY8DBfhoGoth/2DwA66BLcf5GAmW9OAO5YMAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=inadvantage.onmicrosoft.com; s=selector2-inadvantage-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y/QQb92rD3c6NmDqX1/t3hDsMmO9iOZP6jMPzbgAAb8=;
 b=Hjl+eQjhvk0VcZrSn26Ng1W7mjaf0YObc6fszT8FyLDG3JBJdCnOsddl/EOwviBiNwMduzDReRrUu0FTvmi0pmK0rsOJFRAi4QYg+jzaAGNwTDX1PR8Dr+Eu3GxmWmdOYHz7FufGgVhCTc4Omz5g+3o9w4oqVM1Rf9DzEch+Sto=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 (2603:10b6:301:35::37) by CO6PR10MB5651.namprd10.prod.outlook.com
 (2603:10b6:303:14e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Fri, 19 Nov
 2021 19:59:39 +0000
Received: from MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::6430:b20:8805:cd9f]) by MWHPR1001MB2351.namprd10.prod.outlook.com
 ([fe80::6430:b20:8805:cd9f%5]) with mapi id 15.20.4713.019; Fri, 19 Nov 2021
 19:59:39 +0000
From:   Colin Foster <colin.foster@in-advantage.com>
To:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Lars Povlsen <lars.povlsen@microchip.com>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Linus Walleij <linus.walleij@linaro.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>,
        Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: [PATCH v1 net-next 0/4] pinctrl: update drivers to utilize regmap
Date:   Fri, 19 Nov 2021 11:59:24 -0800
Message-Id: <20211119195928.2498441-1-colin.foster@in-advantage.com>
X-Mailer: git-send-email 2.25.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CO2PR07CA0068.namprd07.prod.outlook.com (2603:10b6:100::36)
 To MWHPR1001MB2351.namprd10.prod.outlook.com (2603:10b6:301:35::37)
MIME-Version: 1.0
Received: from localhost.localdomain (67.185.175.147) by CO2PR07CA0068.namprd07.prod.outlook.com (2603:10b6:100::36) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend Transport; Fri, 19 Nov 2021 19:59:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 642416bf-c2f9-478d-b10c-08d9ab971e69
X-MS-TrafficTypeDiagnostic: CO6PR10MB5651:
X-Microsoft-Antispam-PRVS: <CO6PR10MB565104DD343017432B69B4FBA49C9@CO6PR10MB5651.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HnWJzI71ENlmkVSp4lQbhOHrrvWmQTncoipz8yuyPwM/EfoWeQt5NK8ekVGPQQZQinBVrpTjtCmAcYtjaeto99qpP/0uX/3uiulbCf9Pa6U8UA9HEElU4HTjMQG3/OVYcz0m2z1WdSFP5lq/WTK2XqjxQCO8nOz5JdSg0Q6dqeoiLra++ON8colHFdwRO+hq6eoyXCkpLXdjQFy4tyeuhit76fk126ZNYICRjK8gYr43MDKhNitZWfzfVkXrEg6wOTpZtVOi2q5l/aZ8tuxBllvTuBK0ku/2DauqA8IESkCVwrakyHUfTdr9plaJMMQVw0B/TT89gKQVLEn3Kstt3Kh+ut70ZB9tcPGwme65rZwxaK01gMqdiA/Bp+o31KnjGsMsyJQbnGIUHJZgUUuuviUofSRDtyMpxvKsCza2hMVxYTzLVdSomThEfAGlXuukHhla7fZ98nEoHtJqvp4YEjQSvfh5ENahdhSkZzVrY105Q5nSCBie2o3qyBJph8KP7E+FYaeaXBpS7atu9qpmQP/dVrbJTgA8rRir/1RoQOb7HwMbTi2DK4GwVTXGi1vyk4XRCmY1NTKtf479Q0sSK8OioQs5yAEZLeE/krLmgY8DO2Rt7Vdrd6eaDLf6XRa/VJde0Ab7bq/+++Gjd9NYA3lxjXpYO8CHKTougt4CJG6Dgq5rY6yMyPM3S1W7nCKv47iXYteyvb6XFL8dEnFUFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2351.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(366004)(39830400003)(396003)(136003)(376002)(8676002)(26005)(54906003)(86362001)(36756003)(6666004)(6486002)(15650500001)(5660300002)(6512007)(66556008)(66476007)(186003)(66946007)(2906002)(956004)(38350700002)(52116002)(38100700002)(316002)(4326008)(8936002)(6506007)(2616005)(1076003)(83380400001)(7416002)(508600001)(44832011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmRJSkJNQXNNaitCbjRWb28rMnJVM1NqRjR5ZzArQnNHUU5IVFMwS3lQTTlQ?=
 =?utf-8?B?RUJ2Nm9FNytBY0ZPNjNCWE5GNkExazVaMk9zYk8rR3I4b2ZqVXVBOWtBRncv?=
 =?utf-8?B?SURiOWY5THZna2dud1ZmQmw0akxSZ3E3aWZBdTZvQk85eGpHSlAvYmRBQkpY?=
 =?utf-8?B?Rk50cGkxUk1BTG52dUN5T0hsMEpvZEhBUmQrYWxRQ2VVdW9USXcxQ0F2MkpI?=
 =?utf-8?B?VEFEdU5vUjh5V1ZqNTFIN2ppeVY4OHFCbllTc0FBaEU2VWhPZnBQdElBUW5Q?=
 =?utf-8?B?bjJ0T1RoUlgxdWpIbHlUWCtwcUpJcytKMUlCbXJYR2M5aEFNN0RTclR3RVEw?=
 =?utf-8?B?UXM2eUE0ZDZ5elJKOVhqK1MyWVptWUJGNDlsaGI4NXBEVlhOSUQ3eWFmc0RE?=
 =?utf-8?B?VElFb2FwZTFjZEZTemlibzZ5Y2tUSGt0eEhDNzM1YzIwaDJwTTFNN0krK3Zy?=
 =?utf-8?B?T0R3REFVMmJYRlErMmlBMEgvaGYrRmxtWGs4YjQrdjFobXkzS051OGRqc2RR?=
 =?utf-8?B?U2NFK3ZmejlwVThtM0tCVFBVeWQxRDZpemhDTkx6bXhScE5RRFBybDF2Yk56?=
 =?utf-8?B?K01mL0NLU3pVZElxR1puTm1PWUpVaTJYbWJmYTZCWHJRdnFZTVVPOXE2Njdp?=
 =?utf-8?B?Q09vYzZwbVBTNis5eTVXanhNUWdGbzFhWURqeWxCK2tCcUMwb29Gb2RMeFM0?=
 =?utf-8?B?Vnp2SE9ZOG9udVY5ZU5QYjBXVUpJZXpXWVVzd1JiN0ZBOVBTT0RDSmFCSUtj?=
 =?utf-8?B?blh2NlNjd1BiU3V4YUcvUmRaR0FKdVVEZUZSRjZZZmw0MkFNRElxSnBBWEFM?=
 =?utf-8?B?VzJOZGUrZzUrdUUvOVJibFZmbFNzQmpJSHBMS28yWE0zZWxCaURVaCtrY1FQ?=
 =?utf-8?B?em9vekdCTTAzTGQ1emRHVmhWZ1FyUVd6ZXBvcW4yNGFSK1lzSkdkeXdWQW1G?=
 =?utf-8?B?L0NjaFRhS2x3M243ZEg0SFNETVQvQThVL2I4ZG1JU2cwdmRSNmFMb2RXM2I0?=
 =?utf-8?B?T1ZqRE41bGFrclpGblFXcFVKSERlUmdPd2pEd0FXNmNNcU5JYUVDemNYak1l?=
 =?utf-8?B?bS9lRW9mcWZTbkEyUXZqZ1gyWmN1alVKdWV6bTlyOGR2MUlDSE1GYUMxcFZK?=
 =?utf-8?B?ZWNhSEdYUTdOZzM3REY0eDU4SjFJc01IQ2RrWThtYlZTblNXdU9oZjVZOVZ0?=
 =?utf-8?B?TGhRVjlnZVcrdFZZWWZLOElTSmRVMFZhbndDeWZ2UENRN3o0QjlRRmNyWnoz?=
 =?utf-8?B?WlZSaFJYeEhxTnpsemxYOUxGbHV1MHp5ZVduN2RYZWFtTzBjbzFYTXB0S1U4?=
 =?utf-8?B?N1VpOEh5eStzSW5zMUlWL1MxZ0c2K2ppOUl1a2RqVy9PamZxRFF6c2kxSXdQ?=
 =?utf-8?B?ZTYwdjZXWExuaUtDZFlabXgwTnM5bEx1TWpJdVpQTnFpYUJXRHkraEhkRkxn?=
 =?utf-8?B?SnVhWkkvSDdQWWIydDFXc2grWEQydm1HOGRQOUltcU80TVpGUkRBcVNLWisx?=
 =?utf-8?B?OWJ4a1UzWHFpK21DU2JBbG9Pa05xNTF5eGUxdk5xOXFCSU9xZHVScmxsWFNW?=
 =?utf-8?B?VDY0b0RlM0RTSDZkS0RYRG45ZGpmeG5mVjh3bHhjQTVEbVZ0Wk9Fd2phK1cv?=
 =?utf-8?B?ZlpmYy9naUJSUkpRUlQzRVdlT1hLcERRZ0tWWEdMc1FGaVlGa1Z0ejF2T0o2?=
 =?utf-8?B?QVZ2d3FtZGxNcTczcW1OQjNKWlUwYk5rVVluTWpPdU9xdmNic3QxOWRjaUlQ?=
 =?utf-8?B?QklwVXBISzI4TjJVcjBoTytUL1NmMVRITTVXTUxRK3UzQ3ljVXA4MytSZmFu?=
 =?utf-8?B?eXA4STN6OGErdkE5K0hKeG9Nc0hXbTlYUzJHejVHK01iL2NFSGZOb3lYUTVZ?=
 =?utf-8?B?Nk1sWlhoUEpMUmcwMENkNVFiUEhjc3pOSGErclNZaWNFUWM5ZWhGaW1Bdmtz?=
 =?utf-8?B?ZHZhdUVyZVVseXY0MFZYTkpxTlYxVVBrRitDY2lRa29LelFRWkN5cUZOM3NX?=
 =?utf-8?B?SWowaVJ5L3FTSEV1a1JEMlJUWlJVZlhNNkZnU3J2ZUwzb29FRFJJUno1NFRY?=
 =?utf-8?B?UGQzd2s0eEtjbVNhRkYzWGhGZDI2QXVGRTYzZ3lTdW13TTMvZGw1TG0wZWQ5?=
 =?utf-8?B?U2VVQnBwc0xzaGg0OWV0TjdXOFZCbXRnMFlmZmY1anBxczBRMkw4NWZCTUp4?=
 =?utf-8?B?Z0tkNUdjVmJOaERvSlJMVUpuc0d2ZEFsY29YSXRvQngweDErNFRmZkVjdEhJ?=
 =?utf-8?Q?nNg3YKDnvPhHizkZYD6glnhdVrUT/hcVXmrvlI+MM0=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642416bf-c2f9-478d-b10c-08d9ab971e69
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2351.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 19:59:39.0499
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: crKRNmlumuI4oA4KOF7f5eHQ2n+yWS8GyTTCp5i+rC3YoBkBwwrm+WVpkt67Yi/R3tJNS9wAMdwN4KCQfuZykmCqYoVG5rWEdv8vjboOyxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5651
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Work is being done to convert drivers utilized by the VSC7514 chip to be
externally controlled via SPI instead of MMIO. The first step is to
abstract memory-mapped calls to use regmap. 

That patch set has grown to 23 and counting. In order to keep that scope
minimized, I'm submitting this patchset to convert the two pinctrl
drivers to a regmap implementation.

This patch
  pinctrl: ocelot: update pinctrl to automatic base address
is the only one that should have any functional changes, and therefore
has been tested. The rest should only impact what would be expected by 
normal regmap abstraction.


Colin Foster (4):
  pinctrl: ocelot: combine get resource and ioremap into single call
  pinctrl: ocelot: update pinctrl to automatic base address
  pinctrl: ocelot: convert pinctrl to regmap
  pinctrl: microchip-sgpio: update to support regmap

 drivers/pinctrl/pinctrl-microchip-sgpio.c | 45 +++++++++++----
 drivers/pinctrl/pinctrl-ocelot.c          | 69 ++++++++++++++++++-----
 2 files changed, 90 insertions(+), 24 deletions(-)

-- 
2.25.1
