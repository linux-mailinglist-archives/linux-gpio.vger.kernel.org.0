Return-Path: <linux-gpio+bounces-27092-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FBB1BD9DF7
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 16:06:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E41AD19242AD
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Oct 2025 14:06:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48D8B314D2F;
	Tue, 14 Oct 2025 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Y9zuq2Xk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4495B314B77;
	Tue, 14 Oct 2025 14:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760450728; cv=fail; b=Er/opHJzaumqVtaPKu+AwatNFSU1+mdwXtkcllwcK2h2VQA6Ay7wjQmFy0Sp9UfMF0wACnpQDRs8eR7SvmgwdspVvkwQLiTCiyORbZpE7k1A2RrGtB9Ef/DsqbHrQcbEnVJkvTY64kwbepv7aVY6xD1r2V/JK4CLRlIRRQTzoIA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760450728; c=relaxed/simple;
	bh=fgw82tNhIUU16kT61sYC0lQML1sjZwhMhdyB/4dJPvY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JqJNVYiPwyQyJYsJVESrBW+HPRhAKb1M/re0HSe/n5Pc1SHI11ChubKvtOha+JxCPjUFkvlEg+YC98knUrVa6/nsbZce2UNgILCbvmeOlf5XZ1cURDi/yu1KQNrzLH8+HqMx9DdSlOpF0PhH4OT0w+oqjAioSsKUdl4MbmParnk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Y9zuq2Xk; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59ECvCQB004694;
	Tue, 14 Oct 2025 16:05:04 +0200
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013042.outbound.protection.outlook.com [52.101.72.42])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 49qfbtc8j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Oct 2025 16:05:04 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cfmGcbIKpp48sUJ94g9AgHrWc2jtz2rSREsRAo8fHbnfM6rsKGQ5eD43xDZanuqcR0qOmweXqde7XglwQllTKvVsQAcrvZM4FmkrreVJTOfofGRHdLyubDVQFkckm3uWx9tgzKoSsP8BNvXw95iX9Ew24uyZfykLSZiI+0EzlTszCTm7Awz+L1HvLgetsP48GK3f9geGjJvRuuNZfcttxWDzPvUBGZg6gq9QCAgwT2zM9/6OkgypIqV7mXR1PU1UmbrflGxqwSgE1VSqKHjhsLOhU7cUL6iO6AjZbD6rhfQFIzow8acSqy4hqZE43USFLbt98Tq2J+8ygU6b99d6Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRxYEdU8azREQylPeJ9GOdGrVPZYnrzX2CVeEMy2NAA=;
 b=tRLUYaeSKqu6uJsf0si97fruRZ77sTpjnjLg8J0JJMXBFzI0fZ0nPqu+Lk8MdUS7x32rifwr3+ogcEcA6m7sbBoHGmdycqPIU99dtdVVI+yLKZDQwrczGdjHAoiiLfOLUZ8etjKgdJrV/CaF5tL7ju8Y6uzat/1e05b6xFMa6b5lXBLBt7RWNKoCg1H3o2SwYr64YdeVbHJF2BiLcOvQnpSvSzkAkybi2vs8ewkDig3j8kkLzOGDW4vQHmgbYgoD5WTzz6MguyU8o/rIIVYeVn4ZpbqccbmT/pI6IIlvpSTxmQc1yH6Uk7zGBvzIC0d2FnpeLp5HuEkVoQD3/5O6xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.43) smtp.rcpttodomain=linaro.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRxYEdU8azREQylPeJ9GOdGrVPZYnrzX2CVeEMy2NAA=;
 b=Y9zuq2XkZFwxDPvJAv4LJ5HW6SqCzoA/v30qV95LIKqhqjvGR4f0lJB+hql2gLlIkP0Ss2A+xmELnsVKg8k+D8NoFuT49H4iaz00r+V4Di87BR4j3yrUEWqwIKew0vVuHUp2JuuzuGpQ1B5ff4Zi1P9UGP+dSR7qMfjBqz/iFswhMNRDzvIWW3vPA9znpeR1dsIms5GcjEH3Q+NZQjV0AuL0jKuo1Fkml+8o0ZvP+0/HE4mAkJRzK4JRzb7FJJt5AHv9+DEtylmMc/DHpOKGWirr/ZfWJEPAU/bqy3G2eENvrcaQnuuXz/5fj8xqw2A8pZ0r5rC9WOO81WhnVPOEsg==
Received: from AS4P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::16)
 by VI1PR10MB3246.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:803:139::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Tue, 14 Oct
 2025 14:05:02 +0000
Received: from AM4PEPF00027A5D.eurprd04.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::60) by AS4P192CA0024.outlook.office365.com
 (2603:10a6:20b:5e1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 14:04:58 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.43)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.43 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.43; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.43) by
 AM4PEPF00027A5D.mail.protection.outlook.com (10.167.16.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 14:05:01 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:02:38 +0200
Received: from localhost (10.48.86.11) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Tue, 14 Oct
 2025 16:05:00 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Christophe Roullier
	<christophe.roullier@foss.st.com>,
        Fabien Dessenne
	<fabien.dessenne@foss.st.com>,
        Valentin Caron <valentin.caron@foss.st.com>
Subject: [PATCH v3 08/10] dt-bindings: pinctrl: stm32: Use properties from pincfg-node.yaml
Date: Tue, 14 Oct 2025 16:04:49 +0200
Message-ID: <20251014140451.1009969-9-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
References: <20251014140451.1009969-1-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00027A5D:EE_|VI1PR10MB3246:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c84d488-be50-45e2-127a-08de0b2aaabf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|1800799024|82310400026|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?BUl5kudqcjjL8MrgQpDWoJY7ZRbLxKpKvOtCwNpIfu2NKQuM/xmBBijUcUIr?=
 =?us-ascii?Q?1lb/0PKphVMqaqRbu8cj5VFZoCf8ZthHblPU+xylOySQt2pPrSNZxlZFxUfv?=
 =?us-ascii?Q?N8RCr8mCcYibzaK/3Q+qsVvh/rpJrEZzsh/64e8rp8K1dRrK2jJj+ChkPu3N?=
 =?us-ascii?Q?swKOHVsO/Mk45CKDOKXQvcpCNHnpgKUEsl54K5eWXqG7w3rKJ1SHmGTjeVld?=
 =?us-ascii?Q?EMX9BDydevSo4TWJQ2PZ1ZWjXqWJRWk4Pp4MC8TNqP8mQ3yMEGZXoG0vX+6q?=
 =?us-ascii?Q?pH8Uf2i9rD54g3REoJ+IS5vl44UznipWg5V/jRDJ4TuRukE2d4wUXifhpOcD?=
 =?us-ascii?Q?/0o7jzYPTZle2jof8q23ljaiU1AUImdWVPOrEkPAPnzPQ3FFNrbbjXzYqY3f?=
 =?us-ascii?Q?DTgfDx0cLRpX7+HfP436cjLD1cCi5kUahkzmxvSJ0vS2kUGCpaAncb0hx9pE?=
 =?us-ascii?Q?uWAsTrTBwjzHcZ0ZkA+n0rRE1Bk2iTSib7SBVddOeOkVjvi1fvbXOQkl4UL2?=
 =?us-ascii?Q?dBbiJtPAM1yr+sL+oMfQlVu4hZp5y4Jpv+WCO0dng9DRQ4BCXqnUoCjKYhed?=
 =?us-ascii?Q?mQ+iVRjxvQvlnovGLB610wnjQ3UlSjPccJyvWd61A8wbUGMGOwEQOp8uz8GV?=
 =?us-ascii?Q?kBYdggzMmMbDqSlWbrQkAd5CS01SOR9dMk36u4ntZhEKMjrYmFMNAZvTFynl?=
 =?us-ascii?Q?OVRzFlVmxENhsWf2OKSAbChekVblqUvHr/h26NAwQGJb4nSseha8EkE6nVz3?=
 =?us-ascii?Q?HSs29h/kDae7TYtl7DN/SsfFLFDzGd0hY1JYUceM2e03jlJeW5erhBdgKwoc?=
 =?us-ascii?Q?agylPXTZArbX5yok80brpNGKdvfy8oz6+fR/MKi56nPDR5RWlZpTI4dzT9iI?=
 =?us-ascii?Q?njafm+cjFqKh1Hahpjw884f0n6IwT9ySXHAmLWBS2RtUGep7MPDi1vTpd8OD?=
 =?us-ascii?Q?Qaivru1KiP6cS5u7/AUOpTh2O6EKXodI4e7uIe8pA8hAMtxdSCRZ7WATU4Zw?=
 =?us-ascii?Q?ceXrTUenOWhPP+Ww4ZE4YeewkG5t7Ax755eCvGXpG9EJQ7s+qDrkW61JqVFZ?=
 =?us-ascii?Q?HsbZ4fiCTLeVfce+NNtZ7/JesICz1H1XLkl5LRldLMtMTfgV1CXF2sUMrAOr?=
 =?us-ascii?Q?/XiAOLw7cVi0m8qDoOdi/UJDSodfIYe+I8bHBLb/0IB21r374aco46ceEIoh?=
 =?us-ascii?Q?dbcqrj7EQUWeebw/IPneJjCHos/Cvh2qXLS0ZFuptfo9CNRh1Bv0KyD3TcX+?=
 =?us-ascii?Q?AtqeLk+fEwEmEQV+MK63o5vsl1gFfMm7p42Lk+hmS2jTCxklQunMbgEeaSm8?=
 =?us-ascii?Q?uikp2yC6wt+4MjTcZYNCcbYdlzHSmvqcqzJkZNKh9RDl4oA8Czo70EkE6N8p?=
 =?us-ascii?Q?BXqtvRenIvE841AGOmoXZuMDGhoyTZniVtuvINtIcEQ+FNtWwpWg7Ek1LJim?=
 =?us-ascii?Q?j3pREDGOcDhuUME36oGIXM7t/37RSgGksuvIeNuPkxvVXv0GMZdM6Y8H1z9C?=
 =?us-ascii?Q?axcCbbkG8fgaDSOisptbegfgxGaT/+CRkvQSvm8cCkX8D3WQwlsX7tvNo8KY?=
 =?us-ascii?Q?lepIVaLNQfmmge0iG/IUuwglV++rh+2HNbYuPbgY?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.43;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(1800799024)(82310400026)(921020);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 14:05:01.3124
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c84d488-be50-45e2-127a-08de0b2aaabf
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.43];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM4PEPF00027A5D.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3246
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX2mECEcN2Q4TE
 e4R3tLZVoDfImUN8QbTS94MOZk6QhChnN0yiObXjATQ8lALc+yE1wqj76NvKyohDACluzZvYgO1
 e6mRw+nwtqX98eXtgxxURwRpjPamC6ioINIZf1cCxLNSJgXt6S56I0D0Ut2u7nTjfcGv3evRv2M
 gfo9T01hMe/Muv5yz+zq+Gns9APMLhtGh05Ip92WtUIIo9cvHrLA/aPQp861DI4wcXxkcRLW0qJ
 BwsrPmnqhYmO8HOKmmj6OKshqIdJGPiPatqx4orCoOxlU4HR1D+pQiuSl7ZKNu2YrV8owyTmrWy
 47WgI1zUgEDOC1js5kmhs54fjzKdw+iEGs5saqx/gCvsctf/G0AF7XbXzKNI60hCmSfyto/o5f2
 d9cYMnkPbKsX8wAd6ezNEcFWxRhIDw==
X-Authority-Analysis: v=2.4 cv=Jun8bc4C c=1 sm=1 tr=0 ts=68ee5890 cx=c_pps
 a=YRDmcPKYWw40vX7vQsDShQ==:117 a=peP7VJn1Wk7OJvVWh4ABVQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=y9YUpebZf6kA:10 a=x6icFKpwvdMA:10
 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8b9GpE9nAAAA:8 a=Ppt3ZVBhjIOpqDupxAoA:9 a=T3LWEMljR5ZiDmsYVIUa:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: morZY4ZhHPEtF8ZqNfDi_tg5qooWEHzN
X-Proofpoint-ORIG-GUID: morZY4ZhHPEtF8ZqNfDi_tg5qooWEHzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

Don't re-declare the standard pincfg properties; take them from
the default schema.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 .../bindings/pinctrl/st,stm32-pinctrl.yaml    | 27 ++++++++-----------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
index 961161c2ab62b..2df141ed7222d 100644
--- a/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml
@@ -151,6 +151,8 @@ patternProperties:
           pinctrl group available on the machine. Each subnode will list the
           pins it needs, and how they should be configured, with regard to muxer
           configuration, pullups, drive, output high/low and output speed.
+        $ref: /schemas/pinctrl/pincfg-node.yaml#
+
         properties:
           pinmux:
             $ref: /schemas/types.yaml#/definitions/uint32-array
@@ -195,26 +197,19 @@ patternProperties:
                           pinmux = <STM32_PINMUX('A', 9, RSVD)>;
                };
 
-          bias-disable:
-            type: boolean
+          bias-disable: true
 
-          bias-pull-down:
-            type: boolean
+          bias-pull-down: true
 
-          bias-pull-up:
-            type: boolean
+          bias-pull-up: true
 
-          drive-push-pull:
-            type: boolean
+          drive-push-pull: true
 
-          drive-open-drain:
-            type: boolean
+          drive-open-drain: true
 
-          output-low:
-            type: boolean
+          output-low: true
 
-          output-high:
-            type: boolean
+          output-high: true
 
           slew-rate:
             description: |
@@ -222,8 +217,8 @@ patternProperties:
               1: Medium speed
               2: Fast speed
               3: High speed
-            $ref: /schemas/types.yaml#/definitions/uint32
-            enum: [0, 1, 2, 3]
+            minimum: 0
+            maximum: 3
 
         required:
           - pinmux
-- 
2.34.1


