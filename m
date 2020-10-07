Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7D16285DEC
	for <lists+linux-gpio@lfdr.de>; Wed,  7 Oct 2020 13:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgJGLMw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Oct 2020 07:12:52 -0400
Received: from mail-dm6nam12on2064.outbound.protection.outlook.com ([40.107.243.64]:60769
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726219AbgJGLMw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 7 Oct 2020 07:12:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kQqgqFb15UztJYiDTjGe4RgUeRAzuqddMJX4EJ3AFhHs90OH0MCbhvH2ie4pZO5U5NFnXa2v6uyFqjjOQW5ilrhoaGf2rytN6IXOft4i52JXGOlwZQVyuttf0JWDgt/jp/3RE/uD4qLcUARLAwwbCB39t42ChO4QmISzpY8++0uJBNdMlN0qB89KlQvM84qdRvyKpa+qT8iI6gGai13xUWK2/M27VMfU+2/4SyS2RiTact/sqAXCArrN9AH4nxwcT0sEPdD4tVnSYfHYFo67nF33M15H9D9MR3nJyq7uH2GEvOT28zkNnBEVcUklRqz59rHUhxstOdM4y861VVITgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzGGZPgY5ddX29//wDvY1Y6kMjfG53PPoEFpI1qdIm4=;
 b=KLq0/7gK9YZJ8WHs3vhtxniuxkDsxMb6u7InvM/VMNEiCSyzn4/awQgnhhncNWmN6tnX5YRDtToHAMBQbvP62sX3f5FwCT/m8dDR1HxwQ6nblDnzaSiiv6qVt71QvNTrrwm3eKLCwL8ljHLXONRSWBWCcYOc0+6jsyuU/hemmSK7U96PsivKquEmHXGR7fUu9glOr+3XfA3W4GU6Vl3PqSHqQwdZpLuUBjHX1aBa8/udeN2U4gj/eZ5aRu4pxK7MCX2IembgqeAX181u4gZ5F7V0n/cXu8JnOv5Yl4/f7yojx0b3LmOcBRb3xE2MeNoJYsHcUE7pAvY17iXKM43eNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzGGZPgY5ddX29//wDvY1Y6kMjfG53PPoEFpI1qdIm4=;
 b=gOyzoD6bL0AIOaJnOvJnAPrzxcNuT+7NpaipyGI/9lbhIKPI3Q/61qZJpdu39bfpce+fFfVFzfVf6FyLmoU65ul8mojXai8EqwE+aeexCvve5HhQ5nKdYme9lgRAfpxw1pJ+D7aIDwyeIfppNCdR4zmipr67OysvvPfsmHcLOfk=
Authentication-Results: linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=none action=none header.from=amd.com;
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23) by BN8PR12MB3345.namprd12.prod.outlook.com
 (2603:10b6:408:64::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22; Wed, 7 Oct
 2020 11:12:49 +0000
Received: from BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::e8ab:4ae2:8e36:dfc9]) by BN6PR1201MB0004.namprd12.prod.outlook.com
 ([fe80::e8ab:4ae2:8e36:dfc9%5]) with mapi id 15.20.3455.022; Wed, 7 Oct 2020
 11:12:48 +0000
From:   Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To:     linus.walleij@linaro.org, linux-gpio@vger.kernel.org
Cc:     Akshu.Agrawal@amd.com, Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Subject: [PATCH] pinctrl: amd: Add missing pins to the pin group list
Date:   Wed,  7 Oct 2020 16:42:20 +0530
Message-Id: <20201007111220.744348-1-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [165.204.156.251]
X-ClientProxiedBy: MA1PR0101CA0056.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:20::18) To BN6PR1201MB0004.namprd12.prod.outlook.com
 (2603:10b6:404:ac::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from jatayu.amd.com (165.204.156.251) by MA1PR0101CA0056.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a00:20::18) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.22 via Frontend Transport; Wed, 7 Oct 2020 11:12:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c809f80b-d543-4546-281b-08d86ab1eca8
X-MS-TrafficTypeDiagnostic: BN8PR12MB3345:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN8PR12MB3345B966BCAFE5AEB347ADAB9A0A0@BN8PR12MB3345.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xfj97L+c5OR+llr8QxvChL+Wx3YWDmIM+VYQI2Kceb1cjbwoHG5s068SVLNbn+jWH8har6u5lD6k1Tb4tkO82SQGs/LJ401XkK0y8PZKc7Z+e9BKKKAqVwoPvoWe7irmhcly7C5ypRamNJCX3ERNJDWO9RqCdH22c//1Ra8NxRZ0Ein2bDRa4kayTcMsrH/4+XUjDq0FIsL8TN1zxS35tboXMZHCxb8ZRlNpKD1DGBV+jwTXMWP0jLtvYrkfatkjvGDXCfhxuDKTYw0cNr916vI0US+F/Loq8/hGRCS/x1ENsnxY6UzJdR4Yr/tvJ44pcG6XgDXp/t4zxvKmXr/LLw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR1201MB0004.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39850400004)(366004)(136003)(376002)(346002)(478600001)(86362001)(8936002)(8676002)(36756003)(1076003)(6486002)(4326008)(316002)(2616005)(16526019)(26005)(186003)(6666004)(956004)(66556008)(66476007)(66946007)(5660300002)(2906002)(83380400001)(7696005)(52116002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: uSvWprCZLTJU+NCOjxyEpCJ2FXmzj3Hz+oM1mJlkfaGWgkZxPNw0Tt5AFtrWItgdgF1aTkIANHEQixFur3TbbuQQGGPP+w1a5D9QwWB2Jx9L7OWvsa2mWyTvPwgdBWNrrD/DBEFQuQAXUvZBcvqQJNigxhjd9ZwAc4Fw7MmZ15W90VQe75JFsr5k1+dkBEOXzvyNB9wUpgi2Z4B/Aa5X8HKEzd1Ya5RM5ZtgLtjSpQ7xLWcu4Vk3CehUWt2ZHGlvWi7D9VcqcCuVSnUwDBxh4Fmk6tOQK7OiTg6Gee7oK2iwXa3d2+fFQ7vfiSBcPUtUeuRh+2B/qPs24PRYEnu3TYs0/LocFzkO3m91IIUDhKlHVAI3Yrev+o03by/SD4PwCbgMAR8zfKsKftH9eU76XyHLccIiWAoeaeXsbhMEwcWblzc+kNU3Co5N0UNVAojYcLytmYlK4EwZN0m7dYvvmOGeXT5tJfPx9fJQsp8/9S6i+OK8NO0SuzMSQbGgMHjy/pt9RKzTvg1liH9CBazGIAtERt38RrEbOKTDCKlom0yRSmyXbb97Os5slIAuSigefljAW5VsnBXDdcCe5NDscZIRjnNWv4CtJRqN3UG+p8/D7thor1rJtwDbUV3VwIRAeIC+hs/raCgQckcdjbS99A==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c809f80b-d543-4546-281b-08d86ab1eca8
X-MS-Exchange-CrossTenant-AuthSource: BN6PR1201MB0004.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2020 11:12:48.6173
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etM7F9uNSeBeBm4d18yoDYcHoDqc2R12eSxPTyRDXQYiuyFhWcdOZkRwjq1wLH1fneJtcLuWtui8uzc+HAx2pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3345
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some of the pins were not exposed in the initial driver or kept as
reserved. Exposing all of them now.

Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/pinctrl/pinctrl-amd.h | 69 ++++++++++++++++++++++++++++++++++-
 1 file changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-amd.h b/drivers/pinctrl/pinctrl-amd.h
index d4a192df5fab..95e763424042 100644
--- a/drivers/pinctrl/pinctrl-amd.h
+++ b/drivers/pinctrl/pinctrl-amd.h
@@ -123,13 +123,31 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(18, "GPIO_18"),
 	PINCTRL_PIN(19, "GPIO_19"),
 	PINCTRL_PIN(20, "GPIO_20"),
+	PINCTRL_PIN(21, "GPIO_21"),
+	PINCTRL_PIN(22, "GPIO_22"),
 	PINCTRL_PIN(23, "GPIO_23"),
 	PINCTRL_PIN(24, "GPIO_24"),
 	PINCTRL_PIN(25, "GPIO_25"),
 	PINCTRL_PIN(26, "GPIO_26"),
+	PINCTRL_PIN(27, "GPIO_27"),
+	PINCTRL_PIN(28, "GPIO_28"),
+	PINCTRL_PIN(29, "GPIO_29"),
+	PINCTRL_PIN(30, "GPIO_30"),
+	PINCTRL_PIN(31, "GPIO_31"),
+	PINCTRL_PIN(32, "GPIO_32"),
+	PINCTRL_PIN(33, "GPIO_33"),
+	PINCTRL_PIN(34, "GPIO_34"),
+	PINCTRL_PIN(35, "GPIO_35"),
+	PINCTRL_PIN(36, "GPIO_36"),
+	PINCTRL_PIN(37, "GPIO_37"),
+	PINCTRL_PIN(38, "GPIO_38"),
 	PINCTRL_PIN(39, "GPIO_39"),
 	PINCTRL_PIN(40, "GPIO_40"),
-	PINCTRL_PIN(43, "GPIO_42"),
+	PINCTRL_PIN(41, "GPIO_41"),
+	PINCTRL_PIN(42, "GPIO_42"),
+	PINCTRL_PIN(43, "GPIO_43"),
+	PINCTRL_PIN(44, "GPIO_44"),
+	PINCTRL_PIN(45, "GPIO_45"),
 	PINCTRL_PIN(46, "GPIO_46"),
 	PINCTRL_PIN(47, "GPIO_47"),
 	PINCTRL_PIN(48, "GPIO_48"),
@@ -150,14 +168,23 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(64, "GPIO_64"),
 	PINCTRL_PIN(65, "GPIO_65"),
 	PINCTRL_PIN(66, "GPIO_66"),
+	PINCTRL_PIN(67, "GPIO_67"),
 	PINCTRL_PIN(68, "GPIO_68"),
 	PINCTRL_PIN(69, "GPIO_69"),
 	PINCTRL_PIN(70, "GPIO_70"),
 	PINCTRL_PIN(71, "GPIO_71"),
 	PINCTRL_PIN(72, "GPIO_72"),
+	PINCTRL_PIN(73, "GPIO_73"),
 	PINCTRL_PIN(74, "GPIO_74"),
 	PINCTRL_PIN(75, "GPIO_75"),
 	PINCTRL_PIN(76, "GPIO_76"),
+	PINCTRL_PIN(77, "GPIO_77"),
+	PINCTRL_PIN(78, "GPIO_78"),
+	PINCTRL_PIN(79, "GPIO_79"),
+	PINCTRL_PIN(80, "GPIO_80"),
+	PINCTRL_PIN(81, "GPIO_81"),
+	PINCTRL_PIN(82, "GPIO_82"),
+	PINCTRL_PIN(83, "GPIO_83"),
 	PINCTRL_PIN(84, "GPIO_84"),
 	PINCTRL_PIN(85, "GPIO_85"),
 	PINCTRL_PIN(86, "GPIO_86"),
@@ -168,6 +195,7 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(91, "GPIO_91"),
 	PINCTRL_PIN(92, "GPIO_92"),
 	PINCTRL_PIN(93, "GPIO_93"),
+	PINCTRL_PIN(94, "GPIO_94"),
 	PINCTRL_PIN(95, "GPIO_95"),
 	PINCTRL_PIN(96, "GPIO_96"),
 	PINCTRL_PIN(97, "GPIO_97"),
@@ -176,6 +204,16 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(100, "GPIO_100"),
 	PINCTRL_PIN(101, "GPIO_101"),
 	PINCTRL_PIN(102, "GPIO_102"),
+	PINCTRL_PIN(103, "GPIO_103"),
+	PINCTRL_PIN(104, "GPIO_104"),
+	PINCTRL_PIN(105, "GPIO_105"),
+	PINCTRL_PIN(106, "GPIO_106"),
+	PINCTRL_PIN(107, "GPIO_107"),
+	PINCTRL_PIN(108, "GPIO_108"),
+	PINCTRL_PIN(109, "GPIO_109"),
+	PINCTRL_PIN(110, "GPIO_110"),
+	PINCTRL_PIN(111, "GPIO_111"),
+	PINCTRL_PIN(112, "GPIO_112"),
 	PINCTRL_PIN(113, "GPIO_113"),
 	PINCTRL_PIN(114, "GPIO_114"),
 	PINCTRL_PIN(115, "GPIO_115"),
@@ -186,12 +224,18 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(120, "GPIO_120"),
 	PINCTRL_PIN(121, "GPIO_121"),
 	PINCTRL_PIN(122, "GPIO_122"),
+	PINCTRL_PIN(123, "GPIO_123"),
+	PINCTRL_PIN(124, "GPIO_124"),
+	PINCTRL_PIN(125, "GPIO_125"),
 	PINCTRL_PIN(126, "GPIO_126"),
+	PINCTRL_PIN(127, "GPIO_127"),
+	PINCTRL_PIN(128, "GPIO_128"),
 	PINCTRL_PIN(129, "GPIO_129"),
 	PINCTRL_PIN(130, "GPIO_130"),
 	PINCTRL_PIN(131, "GPIO_131"),
 	PINCTRL_PIN(132, "GPIO_132"),
 	PINCTRL_PIN(133, "GPIO_133"),
+	PINCTRL_PIN(134, "GPIO_134"),
 	PINCTRL_PIN(135, "GPIO_135"),
 	PINCTRL_PIN(136, "GPIO_136"),
 	PINCTRL_PIN(137, "GPIO_137"),
@@ -206,6 +250,23 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(146, "GPIO_146"),
 	PINCTRL_PIN(147, "GPIO_147"),
 	PINCTRL_PIN(148, "GPIO_148"),
+	PINCTRL_PIN(149, "GPIO_149"),
+	PINCTRL_PIN(150, "GPIO_150"),
+	PINCTRL_PIN(151, "GPIO_151"),
+	PINCTRL_PIN(152, "GPIO_152"),
+	PINCTRL_PIN(153, "GPIO_153"),
+	PINCTRL_PIN(154, "GPIO_154"),
+	PINCTRL_PIN(155, "GPIO_155"),
+	PINCTRL_PIN(156, "GPIO_156"),
+	PINCTRL_PIN(157, "GPIO_157"),
+	PINCTRL_PIN(158, "GPIO_158"),
+	PINCTRL_PIN(159, "GPIO_159"),
+	PINCTRL_PIN(160, "GPIO_160"),
+	PINCTRL_PIN(161, "GPIO_161"),
+	PINCTRL_PIN(162, "GPIO_162"),
+	PINCTRL_PIN(163, "GPIO_163"),
+	PINCTRL_PIN(164, "GPIO_164"),
+	PINCTRL_PIN(165, "GPIO_165"),
 	PINCTRL_PIN(166, "GPIO_166"),
 	PINCTRL_PIN(167, "GPIO_167"),
 	PINCTRL_PIN(168, "GPIO_168"),
@@ -218,6 +279,12 @@ static const struct pinctrl_pin_desc kerncz_pins[] = {
 	PINCTRL_PIN(175, "GPIO_175"),
 	PINCTRL_PIN(176, "GPIO_176"),
 	PINCTRL_PIN(177, "GPIO_177"),
+	PINCTRL_PIN(178, "GPIO_178"),
+	PINCTRL_PIN(179, "GPIO_179"),
+	PINCTRL_PIN(180, "GPIO_180"),
+	PINCTRL_PIN(181, "GPIO_181"),
+	PINCTRL_PIN(182, "GPIO_182"),
+	PINCTRL_PIN(183, "GPIO_183"),
 };
 
 static const unsigned i2c0_pins[] = {145, 146};
-- 
2.25.1

