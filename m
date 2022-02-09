Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A3034AF8FF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Feb 2022 19:08:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235356AbiBISI2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Feb 2022 13:08:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231624AbiBISI1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Feb 2022 13:08:27 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD4BC0613C9;
        Wed,  9 Feb 2022 10:08:28 -0800 (PST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 219HHLnf008871;
        Wed, 9 Feb 2022 18:08:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=46i/B+UhC5W6qYGc25TeFIRrmPRVoccbQ/5DaDt63j0=;
 b=OaMT57CGI9av1P3fiShG2x/7Vq3TnlIClvg2sNYC09e+3HiuAimh8AW2BR7LYPJy/0zw
 UitPuVFnPzM9k/zWIyPTJ9moFnRZauWtFT4W21hPvRqErGCNJH21j4UEd6PVpuwXlh68
 X3kkVoRWgZ09UJFD+Wk9Rhcp28y97FSySqzrMp2NmoXfKJ5pcDRrWNIjTYARCan6wfWu
 PHo1uu6HbLw69D0a26lNy+peegpIJPwjS6iksy0x25OouxwkkN23QoUqPqlh8cJiiBY1
 +QaWDxKrKiS6MBQGOA2oMPMzaycY3r8wgkO2uwdVvnpa3VsL2aj/ZrIqW5wYJPdxaFkC 6w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
        by mx0b-00069f02.pphosted.com with ESMTP id 3e3fpgnhsb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Feb 2022 18:08:22 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
        by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 219I29Yg067101;
        Wed, 9 Feb 2022 18:08:21 GMT
Received: from nam02-sn1-obe.outbound.protection.outlook.com (mail-sn1anam02lp2044.outbound.protection.outlook.com [104.47.57.44])
        by aserp3030.oracle.com with ESMTP id 3e1f9hspu4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 09 Feb 2022 18:08:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuiP+8y9Tf/ts/PAcJ27VdD/pkqTa8lLRlynKujKwJsPAfbNOvp36aL9RPnehOlnDF2jdT0mikUOII2rh0ikTSg9bl8pgSWTsWPsDOO1jkVOeo8UsTzDbzuFyOxl4F6yQjne9xAyPWoKaWRZMZ5FAH7ffb7Ed0IvX6LQFA3ULYh62kbXrzZ+HHClJ1mhd+btf2INXzlNC3YdV9HTtsNfVaycpjCHKHDE5CB675iUvji8h+IL0yRSs7BuTu1Q4l6OCyTNCrFfJLVryzxj6+kZHDcZNYO1zPzrdD2b8CacW93A3NbG6vo2C5uu449zTucLYLhZkfxI2VCAHM6ZX0zOdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=46i/B+UhC5W6qYGc25TeFIRrmPRVoccbQ/5DaDt63j0=;
 b=XDEmNMLt9nH5jQk8SVGA37PNFR7oJXDlSmRbB7wPjy/YSin0WZkJJ2guUofgEb8ZjkGuccNKRTHP9K8+U4C4bqcprOWEW29y5iw8AldR6XK4Hx8cvtU8+Mh6QdBRuTjGoT3Yeu6Mqi5QNY0wjE9kJ8Prxvso50cWW5P37sixMeFtiBFo82hg6a4qDSyrmgBB2bKoUwaRo7EMp6EJVJhsU54AgKLW1l9yMdg4ssexID+pMx4rYPUwYFoJFDbWq96X7z24ne6quHiXImTEPuElgtW1ZzbqGP0rDDyYhyvG+Z1gCe56xZ0aPT/lS0c800EgUQSjEz5j6cPG4d/Ae1LEjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=46i/B+UhC5W6qYGc25TeFIRrmPRVoccbQ/5DaDt63j0=;
 b=luvKjiKq22wB4X+y7VjBn1D4tpigP9Nyi69s2r4ouMWejUFrAPjJzfvGwOMjssdpEoO6ISgXJMxIDBEE9E8SBa4jFj/WAbBj27cEe3LHr2LQKIyk3qx9itMaPgGToDQt6gF4F1DS3GtW/iF0ADJ0Bl8iJ82Dlv6YfW1f7NMzgjA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BN6PR10MB1681.namprd10.prod.outlook.com
 (2603:10b6:405:7::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Wed, 9 Feb
 2022 18:08:20 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::e5a5:8f49:7ec4:b7b8%5]) with mapi id 15.20.4951.018; Wed, 9 Feb 2022
 18:08:19 +0000
Date:   Wed, 9 Feb 2022 21:08:06 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Damien Le Moal <damien.lemoal@wdc.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Sean Anderson <seanga2@gmail.com>,
        Palmer Dabbelt <palmerdabbelt@google.com>,
        linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: [PATCH] pinctrl: fix loop in k210_pinconf_get_drive()
Message-ID: <20220209180804.GA18385@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0168.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:45::23) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 046e47ef-0a98-4d43-cee4-08d9ebf72731
X-MS-TrafficTypeDiagnostic: BN6PR10MB1681:EE_
X-Microsoft-Antispam-PRVS: <BN6PR10MB16817DB74C59422F89D4D09F8E2E9@BN6PR10MB1681.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qiv/27ZOxOCPqsI2HvzJerpauryfSgN00prISUWNPanEaN6g6yN/asy8mFce1cCH+y0/kVnmfP+B46sCYsFX1lNi0O4O+MPkJaLiJZN+PutmwApV7P6mIW2xLNXbS0SUSSNW6fyaqXWwEqxyRK48Knr9Wo+o1OOiRm97uhJY5nlwcL1M2A0tk417YEwhGSPcjJCaE06u1Kbr2lEH9TffYbtW288a6XFGurgmIgPvd3/0ggEoLRXTwnLLpJHwsGcP4YPY5U570XvPAuVVYEL+kzdTaMCXsPvGSpH/gTeVnUroCYISLzU8QMALuvRQicFSBZyoRRp6UI5JCpijwAeg/HKjIKx4/x60c0gzqvBGrPRcPqIq9tqbyNmsRAON+YxnKl888Wyk2PhLlTJKhzFwm22MHqvm/+u4mg8ndnhRQ09ci/iNdPK2WTSwNhm7qDF4O9Q9Yx7kCSIUEhsIWavDwanLLqZkeGOk3GZSH0IaEV9YBZTu9ITzGLdt+NxPUpwqzeeW+JjfjJZmGEJOxFpywBfwa4E0uz9t6F2ecXajp9Zvpjo+CFSTjS5QzRMoArqHdeTIKKdWKlNVCZiCkUmec9DuAnbNQ6hfyy6aUuTX4jUePFzLjfJaA3rnhxQIc79JDe+deaL45Fx9fCfO1IdzrzPIhVTuLqozwmSbAuZ3ZHTbR3g1eLhbbd68kd223NWDKZBUUhAbyzV+AHpUl2zCOw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR1001MB2365.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(366004)(66946007)(33716001)(1076003)(66476007)(8936002)(4326008)(86362001)(5660300002)(8676002)(54906003)(66556008)(316002)(6916009)(2906002)(6486002)(38350700002)(4744005)(38100700002)(508600001)(9686003)(6506007)(6666004)(6512007)(52116002)(186003)(44832011)(26005)(83380400001)(33656002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cAVGjWasF133xjTQ5exqnNCQ5Hx6Y1bFY84UOh2Ts3Ajcft0w/Ot3uJIIXmp?=
 =?us-ascii?Q?mJay3ON1ynYr3jQsXgg0ubFIGijM95N7Fe1iXG2MzV2JTl0YF496tvqPp0Cv?=
 =?us-ascii?Q?ljjmkKyZAyXcSmq+qYpLq7IcNfXaroEPufFUFjJFWBS1FKRrHBDH2Fs79Wih?=
 =?us-ascii?Q?tTZwZy7cZWvQPF8u7yrcjKfpG3tk/640GgX31sgFPn8y5bzjrJJsexOYYqPJ?=
 =?us-ascii?Q?OOrTzgpKFC30L2FrHuoxFagmWW+o1lWXSO+BFskuQCs4tBn1Mfbf9suyhfKS?=
 =?us-ascii?Q?u6teaeCgR7jQCAS9MSEq5SiSjiXA771XJW2Mht9pZi2tGP0jyTYQ5WZlQUui?=
 =?us-ascii?Q?OcB5/1dK/XFu68KDdjiMOTCztI7yDe7yankf21s8DZKMfhuDW492AX6Pv3+c?=
 =?us-ascii?Q?bLqJ6vU0yxQ4YOFOjS8UoupGXpnUyAXpsItTnh+6ibXqnrVxMY9WrZC/8YHv?=
 =?us-ascii?Q?varYAAqKu5SPhoXqgK+dxzWcQxkISM4SyMVSGnFTYYZu2oEmRFSx07bLnYaZ?=
 =?us-ascii?Q?RXcq2nMSvCjdF8g9GNOsb2whvQs/AN8q3r302t9uzXadlvaK2Ym0kecjhfcV?=
 =?us-ascii?Q?WiAVLpciwWp/1f//PeoL/DtpRT3CSkXKqdFCMM//vFlFtUOTrKu0A0jvyEd1?=
 =?us-ascii?Q?ikEgLHK9nF/QeieUNXp0ft8vieyat1n4hkZTlW06J+k3OG0zIEcqqa+Bs2/8?=
 =?us-ascii?Q?l1JIKu7Mr3n4rlsb95EyeONzUrgWQnLaj0YtRFHqKvGAw0Sv70O7RxfyGDwr?=
 =?us-ascii?Q?1NfBBjz7WMgoEIIOOb9YNJSukZX0qnHTX0s5GHOYTgra9LLVNpEO5A1pTtQ9?=
 =?us-ascii?Q?CJri3NyNVDQeNWcKmAogUW/lHah9c0y+y0i1rNoOVL2l8xHfPE21b4wA2SNa?=
 =?us-ascii?Q?TdH0jR72px4z+Z7Y58XojGx/HV8vwU26ZfYERL5XCpgANTPoVmc3fVP0zeZW?=
 =?us-ascii?Q?1wwbSjxadRHUA6Aq9UjKSBSqQQxeYJoHk/PJw4NoLaw6SFD/2QoGstn2hk4h?=
 =?us-ascii?Q?2VQbqcjh3WbZXqlYOCi8W64mX1sWZYcx/fhzA1vkE5NrNmA0XZt4U8CG9RqB?=
 =?us-ascii?Q?IagqRwy6/GPm4L9tI6IsI/COCJcKi+I8zoZDN5TumK/OJLbU8+O6IgnGKZZm?=
 =?us-ascii?Q?8KSR55c/2UQFkXJbGAVdeOlDlOpQJqelVZ59GqtNqCn/8lOfs1k4z6CsHhGf?=
 =?us-ascii?Q?+MAmE/oFi12ohLddMA2ZSLuYO76VtmgEN2kxF3bgKm9vfKFWRHLiCHN1rWmw?=
 =?us-ascii?Q?I+cWXnbqfy72rCqFOi8GW6sZq8OQXM0C+jBDDXt3ZMWtSy0DJxCxXaqVlZNM?=
 =?us-ascii?Q?rj4PwXPRaet+2lxKZQXOJVx5nLtB4zLUCIKs5On32l4Jo0cuHviJ/xw1U8Wp?=
 =?us-ascii?Q?0w2MF4SGaSuxK1q3Fr0bN4N770cKQzGMPUMmHjxR82j/HeKBzms/6K31qpsN?=
 =?us-ascii?Q?3BIx+j24b6hZVhuQJq6PQlsyfJ+1AvGKc5hQCiN9TuI4ioG2HZBSgLOG865L?=
 =?us-ascii?Q?WeD3wXFvoBXQ/VU7IvHgA3qAqeSOHPv8S5CmbElPr0yKJIIXqODX0EmK3O0k?=
 =?us-ascii?Q?S69VSp7Tw0oqm5y29q1/1RP/mQJSE9y8A0yUpJFDtIAUYou6AaNMyXOioWuW?=
 =?us-ascii?Q?sRSecAbneYailxc+Zi/EkKeiSpZ2TqhCvGFLvNDTMoAFiCUOJagHqTLU458b?=
 =?us-ascii?Q?9+3vRQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 046e47ef-0a98-4d43-cee4-08d9ebf72731
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2022 18:08:19.8067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Uc1gd8IYybQQbLZiC0nlGNE9rVCNIc2kRc6x342RxHku4bmaG6a8Wid6ppbw7eF8aIN4+SbVpaUss9Phhr3T5LDJRY8lHN+li3zhVR5A8E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR10MB1681
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10252 signatures=673431
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202090097
X-Proofpoint-GUID: me7GHYyJprNl60RdFdPKy7Culi2LjtB8
X-Proofpoint-ORIG-GUID: me7GHYyJprNl60RdFdPKy7Culi2LjtB8
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The loop exited too early so the k210_pinconf_drive_strength[0] array
element was never used.

Fixes: d4c34d09ab03 ("pinctrl: Add RISC-V Canaan Kendryte K210 FPIOA driver")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/pinctrl/pinctrl-k210.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-k210.c b/drivers/pinctrl/pinctrl-k210.c
index 49e32684dbb2..e3d03f2de7ef 100644
--- a/drivers/pinctrl/pinctrl-k210.c
+++ b/drivers/pinctrl/pinctrl-k210.c
@@ -482,7 +482,7 @@ static int k210_pinconf_get_drive(unsigned int max_strength_ua)
 {
 	int i;
 
-	for (i = K210_PC_DRIVE_MAX; i; i--) {
+	for (i = K210_PC_DRIVE_MAX; i >= 0; i--) {
 		if (k210_pinconf_drive_strength[i] <= max_strength_ua)
 			return i;
 	}
-- 
2.20.1

