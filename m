Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C0DFE7CC0C4
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Oct 2023 12:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234843AbjJQKh5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Oct 2023 06:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234594AbjJQKh4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Oct 2023 06:37:56 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2042.outbound.protection.outlook.com [40.107.20.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D618A2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Oct 2023 03:37:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lJWPuqnBoioMp6foMHwQAgTeKoWqb5jfh5OwZyRcAkrotmkNJ8vvESXiAIRJthrYwx4cx0FXHls4uD6Icb9fvgKzMVJUh95AXxkMgBvOUd8NqXuCTLeaOz5HksMdTxW3NmCZebX+c0EIuE/b9yYrOORHp1MqBfjkq4Z85cFFSitBnniSRkFId5Boyf0AxXG4phlwKI/K6NwPEQVJLVf0pv+RC3jeMWhFQEuOo7tETj6s1yAkb0R8v1N16Tqpi8UTXygvyKuDx9oATOI7BMenpMdNjmBothUpu4+FBNbMVtAkTBVZX87495XjYY1lX7bgVHqEUqusW1ChIYFWuAWnMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K/zyQDkGsGCZSz96kNheoZHCi+VLW5NL2HXz9CfdOJw=;
 b=Wx7Ra8JxsxWETlXsstii3g11d+qB3AngU5siWv4q3fF8LuqLw51zfmGmDy47F8H3u3MYbAdbVSxQRb+4qsIylh+cp40KWIYiHC1XxcwtbeCceo+l+JH9wgnVBbr3CljGJXxfJYwwDexJN91Tpcd5RZP9y+4DxkY4uHJuORYNJdy5cYFI2tssAhlyAXbaJuCuJJQCcJbPxTMTbfvVudkfJGEYyN67s3neCP1r25pTjI2LxpMDkXNm5+yB29E5J6xqsRkfFhs8QbMsFBpMxb/Op6I41Zbu+USHwCzZzSd+faOqZgrkQuzw4EVAE58ySX97MyrHFYDDFwn0jMr5AwjjGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K/zyQDkGsGCZSz96kNheoZHCi+VLW5NL2HXz9CfdOJw=;
 b=CIqBPoSVuGnyjIk3ytE1QySmZGKhlBDGFC0mp/csOMBLfdFwjdovCFn0yOZ8uINzY462eHF7TYUOPSj/RFE1YyAnBbhija54RuSCjWKJcY0zYVLfe/ii3W8eOR+0nfGKdJjVxQ37YohIvIkcBaJeWePTfv8accMzGD25lY7OpDQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com (2603:10a6:5:21::30) by
 AM7PR04MB6837.eurprd04.prod.outlook.com (2603:10a6:20b:10b::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6863.46; Tue, 17 Oct 2023 10:37:50 +0000
Received: from DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188]) by DB7PR04MB4010.eurprd04.prod.outlook.com
 ([fe80::e796:8366:5d4:4188%4]) with mapi id 15.20.6886.034; Tue, 17 Oct 2023
 10:37:50 +0000
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl
Cc:     andy@kernel.org, stefan@agner.ch, shawn.guo@freescale.com,
        aisheng.dong@nxp.com, linux-gpio@vger.kernel.org,
        linux-imx@nxp.com, haibo.chen@nxp.com
Subject: [PATCH v2 2/2] gpio: vf610: config the data value before the direction setting to avoid glitch
Date:   Tue, 17 Oct 2023 18:42:37 +0800
Message-Id: <20231017104237.1966094-3-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231017104237.1966094-1-haibo.chen@nxp.com>
References: <20231017104237.1966094-1-haibo.chen@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To DB7PR04MB4010.eurprd04.prod.outlook.com
 (2603:10a6:5:21::30)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR04MB4010:EE_|AM7PR04MB6837:EE_
X-MS-Office365-Filtering-Correlation-Id: 91cca4d1-8353-46f5-f536-08dbcefd1c1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xex0L+YV58Y4vaGVPx33MDcTFLqP58UsAPtuh6nwP4glaX4LWWIrJGpkQKWU06+MJ1xe1V7Ezo+tFKH0GDXrIY/hFiEIk+MFd+zvv0ThDy31AIaW6xxSGONK5XB7c+WVEWpfRn38qGkGQZ1QWZw/I3DcMZsDGZFsWzwAuL/wmjdKllf7OlzSWkXk2FoTpl2uUHj7j2dwjolxGxVOLrJLkry9Mp7Ig/QanCgtCPU0S00+9BHombLSSV04fwPVotyCaTo0+60qzQ36mKggDlLZDKyxSP/0S+LlU530yG8ekFK4LXXZDJYpq/Zyl3UHwnIq77YuDGk0n1uK/Bh+BQgEm8ATZd2lNpr5VsJkW34WDUqz6QjgzvnmLM98NB9I0Kyr9k2ZCcovMp90x8w+A+4yhYEghpuyPduQioSLL0VaO5VkLa5gxkGT2FZN3HsnAFjHgSN2z7plPqOxqEWQcjZA5txYpDauxMgjb0Tg/yuW3V4rv1UZMotrcMzXulZdE89kz92+fmU0OOFQfIdePJYyYIpoSaoOxbFZGWp4FMPOpG4mQ4llhWtW7/Nx0YkW3Vtc9V1IvTbv9RNfhMHtcIEUyZuQ4t5NLzbqikg774xgZl+8hUZ7ENlBUXhOgdEg0hvN
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB4010.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(38350700005)(52116002)(6512007)(6666004)(6506007)(9686003)(36756003)(6486002)(478600001)(38100700002)(83380400001)(26005)(1076003)(2616005)(66556008)(66946007)(316002)(8676002)(8936002)(4326008)(66476007)(5660300002)(2906002)(41300700001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NKdgaTenqXyji/GXqx0Di29visbXEoTEyna+fYdVO9VqF437saRVGp2PrNYp?=
 =?us-ascii?Q?hv84iO31RQqGgn0/obL0aai1YVUd8+iJ07RXyuhcb5NIDps70kURo2D8ob4v?=
 =?us-ascii?Q?a4K8QgUBDpoad9cEVuYtwyccEV+xM6rrpZlvDvdgcXN/Yq7D3wWyORE4aEeB?=
 =?us-ascii?Q?O+o/a9UslkcvBG4e10X50uFh13kIyCC8G7l2lD9IyZYTd3fCfAlwzqzPUhrL?=
 =?us-ascii?Q?aGEc1TFkBtr1tkyv5GhYHizOKIiyezgU7qvkqUdWmQXCMSCYEBtaYkwqrOpS?=
 =?us-ascii?Q?YmRzRUdG6ZSmQ/gEEbdkikLIWXrVxmUZUHEOk9g9trWBprV3GgAYxB52GlVK?=
 =?us-ascii?Q?E/jdxXz9cnlObN3dsshLDPtYSDQFdKns8L/mM2e0rZv5wtHuAi5rGWKk+7eU?=
 =?us-ascii?Q?xafjAtbTOFSisvHS6lVhDuT/44EfI1ea4dwmccNINGsCM0cgAnsmfpjfYbJr?=
 =?us-ascii?Q?tem6v7D0AttO6RmhcOOhfDdX5RQlATypiXEhXzJ2dUlMrVwM2CdHJnfdJ3TI?=
 =?us-ascii?Q?4/ZBjyiZoTl06N5bnCpd1IXzyemvxsLkASvb0QiCkW0AfnaOsqY6XCT1CbiI?=
 =?us-ascii?Q?Abf5o8CSx0XUMt527lilVnxhVb3Bwl28FxsiiNGlkm7/D4nqTfdCgu2wVX/i?=
 =?us-ascii?Q?Te0sE9on3mhwfyaVu0gB6i/y3s9VJ3qc/o32jup1V/pxAqv4hkoT8IQhHp+f?=
 =?us-ascii?Q?d7pjeoWk5Mc+Ce1zMT0OrUhQ4zRwSfyofrN3WnDkSg95vZWXAgQKsT/Ef3z6?=
 =?us-ascii?Q?Vd2dyT2f8J6oqiIltlaqDJXXSrtZ4S+oRMD3CK95r/zysBGl6jRi3CIM0zrB?=
 =?us-ascii?Q?NB5iTMSCCcjf3tgu2kjL682dDRaR0JhPlkvRNn5cXAnRTdxswAwvNrxAvpS0?=
 =?us-ascii?Q?wR5wFXCkNlLi77A8lhQuv02qXBYyGUIUvR85EXWIIdfo7BMoAQ3wnfZVmEDA?=
 =?us-ascii?Q?y936Ia4XlME0vJDT2rBNF+90t/lFR9iletp7JBKCRfToWC+72DdAi1dDBFav?=
 =?us-ascii?Q?kLKem099KJosDtZk/XAn3TLxCTgBTTPkEgn8V6ao/TdbhkdG54/bskRThNXs?=
 =?us-ascii?Q?fyDNWkSO4lH1quag0Naf0YrWIthkVs31mctEOs2QXVph9Modc8eLy8+Ihzce?=
 =?us-ascii?Q?e/6fDI6iebPooX7o4pwdkVJSCSraAsHhrS1svfxronwcgOK1qMFI1zFCdFj5?=
 =?us-ascii?Q?BxHAXBlXv7T8MKCXEtsZOmh7AJY2/P69T65oRYYetmvmD4tgixOuw3u1XGoF?=
 =?us-ascii?Q?K0kndZY14ATDDPi7RJOTkKhR8vgSOMZ4dBzUB0bZFp0sXT6Lf0BJwg62OvB3?=
 =?us-ascii?Q?Ma8EQl/B2486aO6Ofl9Ag/yHm7I6pVPI0q8yz4VeXu02/STGUCKwFgpHAg3s?=
 =?us-ascii?Q?paBZyAX3TNLXVRbIqZ9CM356Dw370DiPCYOdglV7QywhbEx9Y2pwExaV673A?=
 =?us-ascii?Q?aedzm56Y06t/ZhhomKP76cupfnvLbck2VoApp9WmgrxJ/drHuI2BILydxjsi?=
 =?us-ascii?Q?qzdWqjUx/8UFuYjt04qBE921NgrDMuurNNfqwQoqXfEFYxyX1ivf8qHEhC3t?=
 =?us-ascii?Q?4Hil997OcTA6yx71zsN/uzKNuly2LOOS+RcND+oU?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91cca4d1-8353-46f5-f536-08dbcefd1c1e
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB4010.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 10:37:50.0143
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1qxrhG0cFq2L+RbiGXk9qdILp5UOZsicLpAFd4nkas+MtaECH3zUG13NsgOsXSWeE/iNKeEjzAlV88IOwDfNAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB6837
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

We find a glitch when config the pad as output high. To avoid this
glitch, move the data value setting before direction config in the
function vf610_gpio_direction_output().

Fixes: 659d8a62311f ("gpio: vf610: add imx7ulp support")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-vf610.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
index 77d5b8dd2bd5..444501c56a3b 100644
--- a/drivers/gpio/gpio-vf610.c
+++ b/drivers/gpio/gpio-vf610.c
@@ -140,14 +140,14 @@ static int vf610_gpio_direction_output(struct gpio_chip *chip, unsigned gpio,
 	unsigned long mask = BIT(gpio);
 	u32 val;
 
+	vf610_gpio_set(chip, gpio, value);
+
 	if (port->sdata->have_paddr) {
 		val = vf610_gpio_readl(port->gpio_base + GPIO_PDDR);
 		val |= mask;
 		vf610_gpio_writel(val, port->gpio_base + GPIO_PDDR);
 	}
 
-	vf610_gpio_set(chip, gpio, value);
-
 	return pinctrl_gpio_direction_output(chip->base + gpio);
 }
 
-- 
2.34.1

