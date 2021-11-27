Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C8E945FF09
	for <lists+linux-gpio@lfdr.de>; Sat, 27 Nov 2021 15:10:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355066AbhK0ONq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 27 Nov 2021 09:13:46 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:8852 "EHLO
        mx0b-00069f02.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229638AbhK0OLq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 27 Nov 2021 09:11:46 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ARDUXgZ012068;
        Sat, 27 Nov 2021 14:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=b/TvkS+9xe0/px2sx3m2f3F2mnzNz2dFc3iZMWEPraM=;
 b=pGV5Px6YiCA8iMLTsw+GSSAHH1pwXpkbIMbY2Yq7hJyt7xgvjvJW3nRWRvkKIronsjXC
 x86QRkCYEbg0BnlTf9aFOzcOw4RJvttocJn4hqS9yVdl6qLsTL2gf0WllwWzwEvl16rL
 a17NVpmy2LXWcf8ezH8i5ILj+U0UtydJbuVrmq1936jhRDQOjPXWxIhSS4by0xSDyKMi
 jg24fGmwdp4P/EOK2z77eMIEWzXbDhOri6kj4lDfpnPboRlAYFV2CqSdxjsSMJwbYlzm
 Zx1rgS8N02iVZnok5cVoYtkaWdEEqnZqM7R39NLvc5T16ia3EBlWGR9fYwT3qGVyjsGw Sg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3ckbf39169-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Nov 2021 14:08:13 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1ARE5SKD084768;
        Sat, 27 Nov 2021 14:08:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
        by aserp3030.oracle.com with ESMTP id 3ckaqaj725-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Sat, 27 Nov 2021 14:08:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ef0RwMaaQyQr6M+33crxIyrdGsG/T19PGJkBaxXeUaZIxEhfmR1tUQCYSKG7LuFy/2Luz1+8XDZu6nwL0nPdYsnuGOy4cSc6DzOPmf4Fehz2ciTfPdyRiZzWRkXKradT92TvhK41ii3FsgJ+bOzeyOUnPkdvbNlPoYqguh16FIZk8qQK86Vrw//bTJ6ByDSEjYuEROJ/sc5zVvnym7+IcGwy2fsum3Y+Xui5dDU6ymlS6Y607orSxRLNdeFRZCtvEDuKi0P0V4dp1OKgRC2jYIpsOXtSpTVOydKwcpGkCC6MedVx1DvNizAku+umlPncgy+uvnIHOklN8sQ7xhVCbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b/TvkS+9xe0/px2sx3m2f3F2mnzNz2dFc3iZMWEPraM=;
 b=gbsNjCN9FmryzEC7Jr294Go0YwpevhwhV1ZiiNANV19RucAFiHUpjfT8pGdFFyx25+MN3qxHLP7pCc/u/bRW6js/EEudhclxRd8X2XwbElljTVYHAWhHWPw8FHi3bKYHuqSJdEnA3KROYJjFCVOXLYRpelKVFO3nT+cJ490z4qkew6ye+G+2Bk+xljoOzqlFUkd1Cj7x67c3B87ITghu0Qsj5e/nciV2bkbpr+JNfCajqB2QYP7fEHk119M4lj05VZqESdD4TWIkN28vPLpp4DBX1j0I427I38fUBonnFTpUOHQioaOiLUFTCksTGTjSv6kgTHHTbK90pvN3Je/xYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b/TvkS+9xe0/px2sx3m2f3F2mnzNz2dFc3iZMWEPraM=;
 b=NYErWMLrS52JgwU+o00Db/8jzJhzETeDLkoQImjQj2tOZAIIaUEsSjMXtxYub1+4y5nkwJ09tSlAmK6byrIZX6T2cOUpdLMQW0Pio1xahoh0Wlc+pcgp20EMJDCFqJdN0GDPLTAtCZ9HBN9uZpu+BhnurYbiTOI/8FnRhCE+X7U=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1824.namprd10.prod.outlook.com
 (2603:10b6:300:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Sat, 27 Nov
 2021 14:08:11 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.023; Sat, 27 Nov 2021
 14:08:11 +0000
Date:   Sat, 27 Nov 2021 17:07:50 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Sean Wang <sean.wang@kernel.org>,
        Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH] pinctrl: mediatek: uninitialized variable in
 mtk_pctrl_show_one_pin()
Message-ID: <20211127140750.GA24002@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0159.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::8) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0159.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:41::8) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19 via Frontend Transport; Sat, 27 Nov 2021 14:08:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3d3258fa-b449-44d3-f61c-08d9b1af5800
X-MS-TrafficTypeDiagnostic: MWHPR10MB1824:
X-Microsoft-Antispam-PRVS: <MWHPR10MB1824FBD8A8BBE25DAADDB2FB8E649@MWHPR10MB1824.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1775;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TfkW83kh4FCx8vOwbKGGlsf2/fhkd0+wB+ZtWAl57IHommdYFQTZtz9GhF5FJiPEVGtcNEg03sikldRmTUVk/aTHLBdU5Ju36jEhZiKmq3kDNsawR+wcUs71RG7Qy82IUhEACSDyvJr3OqI5nSNwYTJuEn9KLa8KZ3EM40ORtcl1JPtDGg9KbqsgtFzvytpHnp18VNrBbbBksEHuSrZKqgT2wUDquZWo98crxcABdSX6gyO+OevytH8rCvsoi2uDbHfkvBNC/44mHDBi8bMcWf89GbuoJXpef424xekbLgvf7Cz4t9vMwVCN8tXMKBCy4k28jR0QDtDW38rQ9JhioX6YJxiDQoI1HXcqfDS7uxjROPYPNt34uq/5H87SWsELqz6FRQQCDTlMgyYC4+KrmVu77ZCqqXPRe9wIskvhuj8wXq+R//noeKvZtPSodgMIY7MCz51KPOk21PE03yq9g4XpMRII3tB9cM+hU9HRxlO6muMXMnZhJvqMkYx+p8FhZ2E0fJmeMag3N8iK+tRM5oEu6Q/Gv6EmleK9N2KmSKgLgptSGbYLy0GHpPVAZjZEBHHQu0HhgbF/vgOYjrLNeQzLszVYOBdFxZqIAJChSJb5L4R3BXyWnsUs8U47gqxLOin42HjdU3WdpsuPVm/mwROjwaFtEcMQeSDA0rdAF2B3nNyUkKPbqNBJiWfelG/w26q018RrJG/JW4DIlZ/wxw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8936002)(52116002)(38350700002)(38100700002)(33716001)(7416002)(86362001)(2906002)(186003)(6496006)(54906003)(5660300002)(33656002)(508600001)(44832011)(9686003)(8676002)(9576002)(55016003)(110136005)(4744005)(66946007)(26005)(1076003)(4326008)(6666004)(66556008)(83380400001)(316002)(66476007)(956004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mMy6xuvmLkOMC4FAaoUiaGJJR/8XHZj92K2v7lHuwMF0Y+6Hm434Aa5v9EZZ?=
 =?us-ascii?Q?aCtb2lCtky2lmLvAO8Hmf/HNhx051ceBstxjp4PxvdENqkYFVMuyrLU8sRN1?=
 =?us-ascii?Q?Hi0i70c3obbzS1j0n+7jKa19EaGgovXYJSjzjKO18OI1GO9gWGB8X5l0XDNe?=
 =?us-ascii?Q?gbhpPGjEhOiklrtVf3nBFVw4Lzi4W+BUFqmmnaFR8DRKoFe9eon5gbWh2hNV?=
 =?us-ascii?Q?PFOkjf90JwZow1hDVkcbx2FfdSVKdapxw8uuGq8MNrmm7Qgy2xunV8CNbGZ5?=
 =?us-ascii?Q?p09RkW+hfF9Od4a6PxXkA62LY6lOxQUjuzS9qOBnEaXnFjWVJYoqsY5eYkFc?=
 =?us-ascii?Q?mR1vBa7m/XbM6sz0g7r36u8WZ/Gdb8ccx4yAURt8+ol+ScFEgto55L1M84AO?=
 =?us-ascii?Q?oSSd2rAAjpxZJWY3DnnUQI6keTLi5f1xY08lttV/bThvGv2S9VW6jWjLONEh?=
 =?us-ascii?Q?HdH/+Xi0opi78Jf9aeDBYA0S5QhDhfTTVPRPvBSCOJv6zP3iOj4Hs78Y9EOZ?=
 =?us-ascii?Q?qHuYYiwq7VormspDn/M7mWTXtiJDTa11dCjuXNmp8sG/1BiCnnZb5e9Nm0eB?=
 =?us-ascii?Q?3uFiYDOgC7AFn01vDmiaBFbzNi+SS6OfT6hFSmm0HLyXLoLQ0s4Joy1YQpKS?=
 =?us-ascii?Q?+64N48jam2c9HPJStRD7jJwGwFA4+LuAnvlSCMsGASopUHEJmPp4h8z7gAXc?=
 =?us-ascii?Q?7IBqqPEugGE0fImFaUzRdVit+m4fai0KfWiNAtAbClAAk3Ch/DvcVwVI+VKJ?=
 =?us-ascii?Q?VqqUIU+6hRkP97mrlT53Q2YT7UslsiatIx/ZUEIywGngPGLjlUz6hfXrQKzR?=
 =?us-ascii?Q?VliB2ZJV+PsgYbZHBqL7Vc/sp3Q0rwtreW8KPFaS/Htcjc8pTy43yq0toBTU?=
 =?us-ascii?Q?8p9te8cI2w7cqEbNA/FKW8pgjsKPc57QNZidOfvIq2eGFxl35U3O0GE9nJf4?=
 =?us-ascii?Q?2H0IteiCR/faTcTk6riqN7q7n7oXDeOmsYRwhhzkKJwXDMG7SSmEwiNovMyu?=
 =?us-ascii?Q?WCR7lvNk/sVqvOqwhpjyLGDiechsx9dE+dkYn5zwA+sI+HEq4Ruu2WEy+UJ1?=
 =?us-ascii?Q?QYrNggQTSCe+Y3zL0cqLdAWdCf4XX3L9bCwYTV/bQvlvN4kkYNF7tyRRdv9y?=
 =?us-ascii?Q?o5Wg5+l/RphE8q6YzCFtN+dPiU8PNPFxUK52rLC2e4Mx9GC76IgCwasP8Kxo?=
 =?us-ascii?Q?dpkyy2CtKh87AYLAptSTr5oPk8Se5Q/CMQvL56A27jxK0dztVzhJr51zdDNh?=
 =?us-ascii?Q?4loF1jkGw5Tsy5qMeO7iWy/0saao61TbHrlEBVqiOYAlK0vckpr+9Jek0DkD?=
 =?us-ascii?Q?dJtSkLOXHVRSR5UqzB8kVlitBeYyJ7UNMqDNPyGWPMPJQXLbXF1vmlv/x5p0?=
 =?us-ascii?Q?sVd/5BNOTrKKgrFolnXnDaFlHdv5Kc2+qbUrrj0e2xCCeDjvyn0k67KYtnGW?=
 =?us-ascii?Q?81Sx4xErSCSmrC9qzn87Qj2woCfvFt6HJzo/0Do3MZZmxSHsvwhc9MaAaVbB?=
 =?us-ascii?Q?o5bsd5pOdNVAzt7UNUok0WsB4LjJTPYLaf1ym9YdhlhxFOldxz2fruI5DusP?=
 =?us-ascii?Q?k/oMqxPXbDcmoZh0HsAAykKVhwGr5ixmziCfXYFi6fVuxjmqURBtlmGIq8xt?=
 =?us-ascii?Q?wdncn6Q489+5CsbhQCcavE/gPBZBfyUmDNgEOd+M5/OX87fPI5GelmdpPo0q?=
 =?us-ascii?Q?OOKnjw=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d3258fa-b449-44d3-f61c-08d9b1af5800
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2021 14:08:10.8793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lt1n+F0kmXiJka1Y66gduz5fT2g0iAVpVG/0GjqzkR2rTndYzt0Uuvt6LySPwi3AjVQCN++AVhbb9YUDYXk+mU2vqc7Hx+HQdSfBd5B7UEA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1824
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10180 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111270084
X-Proofpoint-GUID: TBuBci4xHCUFJr3ea68E71iRQW2qGpuk
X-Proofpoint-ORIG-GUID: TBuBci4xHCUFJr3ea68E71iRQW2qGpuk
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The "try_all_type" variable is not set if (hw->soc->pull_type) is false
leading to the following Smatch warning:

    drivers/pinctrl/mediatek/pinctrl-paris.c:599 mtk_pctrl_show_one_pin()
    error: uninitialized symbol 'try_all_type'.

Fixes: fb34a9ae383a ("pinctrl: mediatek: support rsel feature")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pinctrl/mediatek/pinctrl-paris.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index d4e02c5d74a8..4c6f6d967b18 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -581,7 +581,7 @@ ssize_t mtk_pctrl_show_one_pin(struct mtk_pinctrl *hw,
 {
 	int pinmux, pullup, pullen, len = 0, r1 = -1, r0 = -1, rsel = -1;
 	const struct mtk_pin_desc *desc;
-	u32 try_all_type;
+	u32 try_all_type = 0;
 
 	if (gpio >= hw->soc->npins)
 		return -EINVAL;
-- 
2.20.1

