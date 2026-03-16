Return-Path: <linux-gpio+bounces-33474-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OTKLyLMt2kRVQEAu9opvQ
	(envelope-from <linux-gpio+bounces-33474-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:23:46 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2389D296E4E
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 10:23:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 211FB304483C
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 09:21:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1DCE378812;
	Mon, 16 Mar 2026 09:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="iLbwcJO+";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="p924joL/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8324C257423;
	Mon, 16 Mar 2026 09:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773652882; cv=fail; b=klbHHqaLSChquDUErsLdwLGfHpCDKo6E2KdD6rTXnRnPp+EvQ1aiCpAHaoa2wWpdMe/spXkUpaWWYP7b+BEnabHCLXu5p1tRFwOTqltKD4qEjAoBv75dZqnNqvj8jQaIMKckKGbRDvtQaipMxR4jjkuJI80CIweeho6ZMcvqRhU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773652882; c=relaxed/simple;
	bh=yUsjiZYVIBdNktYgxu40d3z5aZRR7rxx7gRl4XWoFss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCCK6byNt5qrcEAFnkmWAp3j81zQ7CfAAdvw492iAccjsGysW90mhAcIaLSJbxxvLA3VG/j7+Wew/nVhw19TCn47xZYoJR5Co0pDx+fGXVOY2ZLCck28vSe5irJLkYGTOyyZZHjK9PvwyzpFVBhvkzbnI3eBpCw+JdEBB+d/o0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=iLbwcJO+; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=p924joL/; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G81NDi2939823;
	Mon, 16 Mar 2026 04:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=4IEVQsP1gTvZFw4qHR
	OpngfHL7u6sMc4s85Eih1KBas=; b=iLbwcJO+tyb6AqGIYeq+tgq3e2VTigGu6t
	FG6USnRFrePii+OAXsofj9W7dmdTWpTeqFwYjzPt+9HRiUvGMRiQlDAPO5PVAkgX
	vRATQ5eFpA4PA/3pQwZnWnkN/NehGh6q0dbC6ckrvUUD2AyEBQpjxOwUT9RG4VO7
	+CGmM6DqrPeacmdf4F1El0LyMlLIKpLqxdEun8rTPdf5W1cY5UkP4pe98zRFeFp+
	15hdpi8fAllpppemOeO3dV2/F3rBaJAUvi+x1/wB4At6NbcZjEQ8jO7+u3heugaR
	09NXeVbF5JQllVTXeDZzWGQPQqa+m8kH3qmDOHsIkbEXJgaj83UA==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11020127.outbound.protection.outlook.com [52.101.193.127])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cw43f1sqd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 16 Mar 2026 04:21:12 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbtddVkvzwjjPhzRj73+X04JElsiFBLd4Uz1FrG4tlrxF6Bew/g9+1ypzPERCfLjvZp2Yzutf3dobCEcTkj8esDF6LyCi5clUdYUEiElm7sGpcW0jvclETGb3oTmAplI8Jg4GdwaBBfqeuotvRXVCzwMUYl789pIWWSBGxl8aMitBQBlFouRaqiYX1wL5Z+eLHo+OawyFIhIP0tth3Me7pI6OUQuELIcmh99x8jb9Q8J/JOiN3uBMGQHoebJFbUpGMsdwWRhHnHXNkaI7gDxyxgqXvOMIgXxD+tWrw4K9H3POUsvPwMcbZH1dNcJzBbjsSl08Bdu5KAgmwYOo/d3Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IEVQsP1gTvZFw4qHROpngfHL7u6sMc4s85Eih1KBas=;
 b=f72UmmUUrpM0CGWHfBIGgHgSYhZBU4cFQLEk2gpb6jtuDJdMgq97ONI+e35J5m7Zh393eh9Ya0bwdqzmDV9IKVX7s3en4wqEi1eXHEn7mLkylcYHUsQ9hGFDLB1qVRotIkle2/Bbx3DOs+fFYWYkx8XaiJWqDYXdkpRq7C2UpXU05xL8yvUx8K6oK8WCH0fynNiawY+dgvXmgcaHzX9wrXOxI1q11+mtO+6b2CHo0SntIfERTijQGwy1Q1WAqdKOO4bVWimJ5ZWZVVVezrqMl6EPZR/AyXvBn+D4VoNrT9boNJ7iccxbw7rwfoXBSFEUumzXiQW7X2sMYO8fhwErHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IEVQsP1gTvZFw4qHROpngfHL7u6sMc4s85Eih1KBas=;
 b=p924joL/DBKv7Fh+H+FIOxFz9I0KysNRSGyIOp+Oa7ti7mQfjPadD2Hkcea3O0wpdYmzjrUpMxRTlrV2k6SzHx3ac/yic2Kw741AvZ6tW50l+mM9ocxe0uNS0cT9QpCBaRV52eHgcNffYhqCOXjnGJowdK6b+VuvB5osfeY0VYA=
Received: from BN1PR10CA0007.namprd10.prod.outlook.com (2603:10b6:408:e0::12)
 by CHAPR19MB997163.namprd19.prod.outlook.com (2603:10b6:610:2f6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.23; Mon, 16 Mar
 2026 09:21:09 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:e0:cafe::ba) by BN1PR10CA0007.outlook.office365.com
 (2603:10b6:408:e0::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.24 via Frontend Transport; Mon,
 16 Mar 2026 09:20:59 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Mon, 16 Mar 2026 09:21:08 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id 83A19406540;
	Mon, 16 Mar 2026 09:21:07 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id 6B09F820247;
	Mon, 16 Mar 2026 09:21:07 +0000 (UTC)
Date: Mon, 16 Mar 2026 09:21:02 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        patches@opensource.cirrus.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH] mfd: arizona: Drop legacy irq_gpio handling
Message-ID: <abfLflfBQC90/RRH@opensource.cirrus.com>
References: <20260314-mfd-arizona-irq-v1-1-4b77f524f832@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260314-mfd-arizona-irq-v1-1-4b77f524f832@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|CHAPR19MB997163:EE_
X-MS-Office365-Filtering-Correlation-Id: 86351996-0f86-48c0-839e-08de833d5b8f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|61400799027|376014|36860700016|16102099003|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	nIAe2aYKi1Z1Cd962y2LBybhsPM40bAC6ex1VeI2AAdlBaFlTcPH8gtPJqoVXOx6ISbtRBIfoef6Q37NKHitusSfSta3wceD18dHDux7nKJXS8gHOSICe1aTPIUNNeUNllEFo+WgKrlCrGAvIifAYseBKON/Re3YCQiUwFXxX0uwpTdx9/NUEN8Gs9CWtvPaqeFASscKuZFhXcfjx+aLcPliR32LaVqznYG5qXNRoySpVoEpWmZpD8jD+bEj/nzQbtN4n46qGRGmvqaejAFZPoj4vY0iO8YpCgwBVgZvVMTkEqAtgjOhx5yyKn4sX50Y4NnDYqWUQlx1Q38d3YfnfQ+z9ioByGoKOsMNGMKlBgFUVWWy1bhVhlQPFoTA27fB4CpRO+kNN6uwbScxmZbXq7I2mkgGt8i8sYTIJHgOcwCmt/ksDBaDe1aFFX4XoS0oLOxO/1hurq39W3yahisLbWHirtQT0MewHTHg351GcxCvoRucl+yGQjgBbhAQ6vj3OZpBJK4jkgGbUKkLKawr5AP/Wdy0KXdhrMwOSt5OCRCuGtfgl5XB0+SWvgtivV7M7nbH28rxZPCGS8tcYHPwyp36Xbeanc7xM0OanHgLs5FoJbqprsbXfXSkbLk8wcztVcH6lYYCIQt3mp1uezTdIIelWCrnqDO/8pxLGsjXPd958ScrBexAsTRnF1s0Pj2asaP9kLN//rs0EJlmFtIEYczmqZLQJkhoj3vQuq9UpDH3SeZzCw8VTO2MccbKOI2yckW9lEr1wjF1LEW2b5E/yA==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(61400799027)(376014)(36860700016)(16102099003)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VD52FHic8tknK7mlmD1/wfxOtp2hHsGjTyqOHeZsAV3qATEfhmcTFvM05+JH1F5KvfHvvgkqmIoNpEsTFMxk/5wJjGWLo2bvqb6ydluYciwnWIuVGIC7MOavxvQHox+VSaS82k6YI/Chp+6BWGSzRJv02XvpYjj8ZHP4crM4fnpE+cH6lyZ2VNbTQXCkIIFZTBthw7bkM6Hm1nY8Y6LOO7ePdxr/FkbtkqbNdDod58ruxZEJ70q9ouXchPR0s5HXPyZMshMWjVakveQQer9O4pp+B3BLoDoAuXMcJAESzNtGBmzE/aahXsfz6CH/aQkEg/ZnbJIVUCKT6IFWgZHxj5boPxzZgaIhabEKfJXW7XH1EmJchHGeoRQLGZwXfSRlZi9LIr0uTjulzEq/cUkqBRp0xFnn45ahLm9VNe3t5/BvYcwFPtIQaWIagl1R0zU9
X-Exchange-RoutingPolicyChecked:
	wcnXYbtbKAg0QQjAUa30Xq9jRu0cX63Sr2EXHs+Vs00F7up4NAVQXXPgr44mIh8mXoaqangphH9duRY1zzhekOUrEwZYZvgVPwLMjwZHgqsy/w/LlKbwtHbQ5gyJV61Y6bG+2J7umKudgKwMYiK0S6qdEpu6iIUlFfvmH9FqNgHw5QHQeOZW1W2ynN/WVvA7/2fNID6RQ1rKahvZIJcQ/VkCVcS3EUPe86lX0cXaczVFl0r13RExJC2niziqzlDICkRmZu/1AXaN3GfSDXPDNvw9jv0qC2Cpie6Zt6bjVwm5IlB/JDqxfP6YA8wie9+MhSWS3nN+LoDNMRtzc01Zgw==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2026 09:21:08.3439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86351996-0f86-48c0-839e-08de833d5b8f
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR19MB997163
X-Authority-Analysis: v=2.4 cv=YqQChoYX c=1 sm=1 tr=0 ts=69b7cb88 cx=c_pps
 a=toP0yf9I8NDWex+H5c71Ew==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=tVk4qm1D7y846LRQiGIA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3MSBTYWx0ZWRfX0mAO2nYUSM2s
 rdIvDfx7QohMS4jPusGJ2O591A6Cg6qnurobOzTuTMdUNr80of0Xgb+Sx7uuW4VZD/QMJvlM+1v
 sjkyeTGHGu2APznep1uMLy9iiQIOBavnUvBb44U/HxuQj7UzmlRn8FwLJ5cU03vYBiO21H1Yhr2
 KQbhd3lBmWJKOxKHavX3vu+jiDp22/6HLgI5cek9iQNWQjX67riHdLPsfmHoEH7Y/PCNrO8HHIi
 o6TEoqnNXuDf6M14ivFiBCBWA2SZexhKPKzV99GS+IROzzDEHprH2dSnMc+pdIa1d9L6yV20Xcb
 wT5AM1OPL4c/OtEnEFRkw9QVTFMCl65PJOKYxRgY4eM9wclOc3sWcuFjXbi8inI/eR7J0PblvHn
 yWyiBBGV2ykUxDu0SOSwzahDRinQzsq2IHYwKff97DsWSfLCOpwogM738B+P5Bz3A3ZO08p+bOr
 2u3R8u/61wWn6MhEUng==
X-Proofpoint-ORIG-GUID: kuyS_Ayvuozxgi7wJqLGT8sLicNodDx_
X-Proofpoint-GUID: kuyS_Ayvuozxgi7wJqLGT8sLicNodDx_
X-Proofpoint-Spam-Reason: safe
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33474-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,cirrus.com:dkim,cirrus4.onmicrosoft.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2389D296E4E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 11:53:27PM +0100, Linus Walleij wrote:
> It turns out nothing in the kernel defines this platform
> data entry so just delete it along with all code handling
> it.

Should really also mention in the commit message that this is
removing the emulated edge triggered support from the driver. It
is not clear from this we are removing a feature.

This was definitely used out of tree, although in fairness that
was all sometime ago (~10 years). Makes me a little nervous but
probably ok to let it go now. I am at least not aware of anyone
who is keeping a platform using this going.

> --- a/drivers/mfd/arizona-irq.c
> +++ b/drivers/mfd/arizona-irq.c
> @@ -136,21 +136,6 @@ static irqreturn_t arizona_irq_thread(int irq, void *data)
>  			dev_err(arizona->dev,
>  				"Failed to read main IRQ status: %d\n", ret);
>  		}
> -#ifdef CONFIG_GPIOLIB_LEGACY
> -		/*
> -		 * Poll the IRQ pin status to see if we're really done
> -		 * if the interrupt controller can't do it for us.
> -		 */
> -		if (!arizona->pdata.irq_gpio) {
> -			break;
> -		} else if (arizona->pdata.irq_flags & IRQF_TRIGGER_RISING &&
> -			   gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
> -			poll = true;
> -		} else if (arizona->pdata.irq_flags & IRQF_TRIGGER_FALLING &&
> -			   !gpio_get_value_cansleep(arizona->pdata.irq_gpio)) {
> -			poll = true;
> -		}
> -#endif

With out this the whole loop becomes useless so you might as well
remove that as well.

Thanks,
Charles

