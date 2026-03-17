Return-Path: <linux-gpio+bounces-33636-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJfLOntTuWnYAgIAu9opvQ
	(envelope-from <linux-gpio+bounces-33636-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:13:31 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E4C2AA9E2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:13:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1206E3052AF2
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 13:13:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA97F3C8708;
	Tue, 17 Mar 2026 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="H1HDURkt";
	dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b="GoTQVidA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834773A5E71;
	Tue, 17 Mar 2026 13:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.152.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773753206; cv=fail; b=JOG5sVt+H1anOunaNxOY6bVSQf4hoRBA+WwtoXp3hKUoSfSp5d23C8w8LdaK9aqIiLpjuTgCBkamYNKmCu2VvfXVx4MmfpaSYj0/POMw1NZquqhLY45SfO1pzQG18EwudahQJOs2fMSFQTche7hlZRey3QLsz3R46SsyL+B5Xlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773753206; c=relaxed/simple;
	bh=c//C/MNDWLX1YhNXzqtogci9XGEH2AXr4rR5IttNh8w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YupargEuWdApqcioUBUqjxZOTbyTISMuR3OaGqrZSlzmyWiUAlQ0NNZlLID9U2Z9GLlpQsblMN1MusWPmqCFS80VjBn24J+lT0ui61bM89bp/2rfSW3Ena26asRda2mozyLbvjvUVhAZYZPlSabPOEnaQizZFknraQVSFpmi3WE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=H1HDURkt; dkim=pass (1024-bit key) header.d=cirrus4.onmicrosoft.com header.i=@cirrus4.onmicrosoft.com header.b=GoTQVidA; arc=fail smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62H6ZdIW987500;
	Tue, 17 Mar 2026 08:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=A7VUMzgpPtNVC3bxLz
	TWha+UbzXhsHbX3qFC5tixsBk=; b=H1HDURktaW4Er27WE+fGfWYqMHvhIldVTf
	UvMLcgXwQeA7jUFFVJiuKka04Vu/HlH2EE63RWRz51e+K4e1hLMIYo2mj7zR08hh
	H9nA+SfrOhsCU9tZDHENROunwSt3+sw2O2+r8+81hutN+Pk4iPLDuoOA0jo5YT5f
	J01ELTRFaYfJ+c/QbNuBj8U1fUvl8ivaUWg74eg2m48E2iETG9xTpwDg4qrClV+M
	pTVY2S+uIBNke8NZ2oCChoIA2phoqCRL8/YqyOKF5BrtCl5+mGI70lVUaHtCmSFW
	CC5rN5V/xbuy1KV1eDMcTahOKvP4sVPz0bR1F8Z1HkZ4kgBg3/bg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11022082.outbound.protection.outlook.com [40.107.209.82])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 4cw43f3j80-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 17 Mar 2026 08:13:21 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H4hZCq1loVStP1H2v68N51RcupPiLSBaExRf/32otB8ibt5H7tpBAQDSaXsIH1tOX0WZFJW+Y7V3xWDjeYh2liLTDjE+pilYKZ+wu5+ccAY7qQCjEPIjpDncANAQ+do6YwIlbjQ/jOOBvfmru0MQUPIV9lu4i3IeBs9evF9bzlbmdbNG1HbrdO4dRusUfWkOtO2UN1n71qYnjGj3A26olO84jfzmumu2xikep4FqXXSqBdBO2XznbuZz4oUamMQKA0vG+SfMKNTEwbRX+KTo1hxD163i0Pq5M9y7COzXQcv6tguSrzipNn+VL2wNpMfgL+z90Q8qZLkkJL0AhSsEPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A7VUMzgpPtNVC3bxLzTWha+UbzXhsHbX3qFC5tixsBk=;
 b=eyv/ZwoEnNgwWClUo3x64mJRAFcmywvV1t952fym2okOeNj/AQUouXsWNSVVze2dCVVLNBf3JP9YvM43dHo5pwhdl5i0JIUUqWkC+tt6s/rNnglauW0kvVfOO3Z2fkPx1RnJfgt6agAmunh+Soy01Ahw81N9wHTBcy12dIbGn4LOp/qAA/EijFQ9Ge9q+XHbdNF22TJOU+Eq0ouH6rAUDwCi6q/hT78Q1vzz5jkmt17ARPK6mobGMOCht1esWBSzeYdcf0x+dMpMnmZa7+Kmb6UCPn8d4KdmOK+cj+T5YX7i0/hUKxMVQfx2zrFtpUCbHLPgMGg87R53pe24EoC+WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 84.19.233.75) smtp.rcpttodomain=cirrus.com
 smtp.mailfrom=opensource.cirrus.com; dmarc=fail (p=reject sp=reject pct=100)
 action=oreject header.from=opensource.cirrus.com; dkim=none (message not
 signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cirrus4.onmicrosoft.com; s=selector2-cirrus4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7VUMzgpPtNVC3bxLzTWha+UbzXhsHbX3qFC5tixsBk=;
 b=GoTQVidAg51KWp+UdjxkcF6HfmDvQcl6v3JOhhuXmtUw1VniBNpJGSeQri1Gjz/qiJDo+E7BzdQyfFBBA2XIu+BwOCN8v6oC2QFY0o9ndx/572EaRO8WEp//u0vgXOx90F8rsku7FW4wkX6L4Bw2GjP2l7gRW93qKVSgrBR+TkA=
Received: from BY1P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::6)
 by BL1PR19MB5914.namprd19.prod.outlook.com (2603:10b6:208:399::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.17; Tue, 17 Mar
 2026 13:13:16 +0000
Received: from SJ5PEPF00000204.namprd05.prod.outlook.com
 (2603:10b6:a03:59d:cafe::ec) by BY1P220CA0002.outlook.office365.com
 (2603:10b6:a03:59d::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.27 via Frontend Transport; Tue,
 17 Mar 2026 13:13:27 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 84.19.233.75)
 smtp.mailfrom=opensource.cirrus.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=oreject header.from=opensource.cirrus.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 opensource.cirrus.com discourages use of 84.19.233.75 as permitted sender)
Received: from edirelay1.ad.cirrus.com (84.19.233.75) by
 SJ5PEPF00000204.mail.protection.outlook.com (10.167.244.37) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9700.17
 via Frontend Transport; Tue, 17 Mar 2026 13:13:15 +0000
Received: from ediswmail9.ad.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by edirelay1.ad.cirrus.com (Postfix) with ESMTPS id D86A440654A;
	Tue, 17 Mar 2026 13:13:13 +0000 (UTC)
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPSA id B9489820247;
	Tue, 17 Mar 2026 13:13:13 +0000 (UTC)
Date: Tue, 17 Mar 2026 13:13:12 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mfd: arizona: Convert GPIO IRQ handling to
 descriptors
Message-ID: <ablTaISNhI51cwN1@opensource.cirrus.com>
References: <20260317-mfd-arizona-irq-v2-0-9ea546f517dc@kernel.org>
 <20260317-mfd-arizona-irq-v2-2-9ea546f517dc@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317-mfd-arizona-irq-v2-2-9ea546f517dc@kernel.org>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF00000204:EE_|BL1PR19MB5914:EE_
X-MS-Office365-Filtering-Correlation-Id: 235f0285-b680-400d-e354-08de8426f33b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|61400799027|376014|82310400026|36860700016|56012099003|22082099003|16102099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NxhD+9UJlGMVjKaIkCZCgXX4J4clLLKMHcsg9DjgZl/DkMq/NmoKXQx+Jk5jC9T2iF0yiBVH6pcDB01fByA0C8EHXV4BHspheYdyyFdG0IalcCeh2S3dhCT0FmSWoSpE+S9vc4fXwlpX4XmgEZlYepfago+RKtTnuWnuuC3LsTHs2lfPY4ZpwIugVpyT+SUmztZlupqMspayE6uZwjg/OfITdv0Nvoux6XYBbP10zZ1GgIJDZtIfshX5z4x0tS5slKmyJWQsLBUruTR5vPotAKKfpMD80cvbAvOeHIU1/z/HNYhFxiESeBY/6V0vhQ5vQULZzHiMTVkNHmkBzN1ZojLkdSMi1b0jjWmPUpbpW6yV2AZEzPLjzxRhSbut8ZVHnzken3OJW/jU2aTVss1ygPinOuTEiNsivIx7Zf4dcRW/X/u142TUlOgF5LLBlbejO0zb41KUkkefguNsYGRxGRT8HjwRAv9jCNQwOaH268DFrUT7fJvvXViXFSLvY3tDCfdZOAY7VdX7FwC2CCViCNyg96DTCLljBF9s9tK/ngzqNJlB2irUgFs0oFsEf9t12I8M2vDZnIxLunOPfRtcPTCXVyZeqsceyAfU9liy//hou0Hl3q7hD7A6/y86VAiPjClFJfCn5UAEUDXc4k0zZBqLNAlE4y7XmXFPSEfEdyaKeAg3wCHLf8nQ+414ibZQIDXszUFryr3rIGt31bcgH8lDSqUMdI9oBVe3cEdsEYrOF45xanGhujsHZpkIFYxdSDREKYSMyjUGOKdh2Dvt8w==
X-Forefront-Antispam-Report:
	CIP:84.19.233.75;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edirelay1.ad.cirrus.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(61400799027)(376014)(82310400026)(36860700016)(56012099003)(22082099003)(16102099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/5PeFhFV2eRl2B4MafQ9TEW40IzpekiYznEQGN0qWIL/LFQOdKpHQiqZ5+KxeqW9l+Mn0bxphhk0UTSCWorOiGVm+fzJMEcBeDUYCNVuqseAOqNWiJCJvq4ku5pu9DQ8SpH5Ev4UhZwWIQi6XlPNGpYXdPAeEDlLf89GfCsZvj6PhRrOEgU/kat8HWMT4AFS1hjPUOWGTZSQYZegoLerBWoehKP1t5Ekqd8GmYY6kcr3RcnbgiMnb6Qy+yV/YTnoeXUf/FWuLshe+cflLvBV33/MsL90QGusbJiu8dJjksX7JEKRcS5oz4zRyfen/UMDTgMcV9/jHI9WaznaXonfP2ThGB5C/WBQ0EmN3IDq5Z6UzcORVu1BPlJ113qldh8RgZwMpzLipzks9yUCdL1IhAtuZ1EgLFpgZWG4d10/baXScltwBwaavfA7T4pgSL7u
X-Exchange-RoutingPolicyChecked:
	avZ3BB3KqZvUJcNsoMqpOb3bZohwwX8ndvR3qxMPrPGl4+V0RAx+ATWg9huWU2Y9jTkP/tnREa1rDkEfaSEoS2wSTUNOnJs9MTuD9aG5oK6Jrmxjkjha4HkvB0tda4ySXYyK6vrvaLrc0UcFAvKwCESVNPKmeZBrtO2KPjjBPcFSZhaouDirqTrfZJgnbsdazzb0pa2Kfl0EmWJ0a8VjefY9Qn065EnCeMU9sSXbbKWIc+4RZecFo/BdCULJy2+OZdrYfAqH0Gn++XTe7YF3VG/nOhL7MXEWsEJ1DQoF4D4TpsIc4Q58Q6NN8shnaSYk3b8V4rnEMb/5niUCtdUKvQ==
X-OriginatorOrg: opensource.cirrus.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2026 13:13:15.4385
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 235f0285-b680-400d-e354-08de8426f33b
X-MS-Exchange-CrossTenant-Id: bec09025-e5bc-40d1-a355-8e955c307de8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bec09025-e5bc-40d1-a355-8e955c307de8;Ip=[84.19.233.75];Helo=[edirelay1.ad.cirrus.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SJ5PEPF00000204.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR19MB5914
X-Authority-Analysis: v=2.4 cv=YqQChoYX c=1 sm=1 tr=0 ts=69b95371 cx=c_pps
 a=yElQ4muSOuhJtI3odKz4wQ==:117 a=h1hSm8JtM9GN1ddwPAif2w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s63m1ICgrNkA:10 a=RWc_ulEos4gA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iX4cTi3TZMoOKdANLEfx:22 a=KfkQE9S9VqCBgivYGm0O:22
 a=VwQbUJbxAAAA:8 a=w1d2syhTAAAA:8 a=vpGAyMKMmMnguwSmh2sA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE3MDExNyBTYWx0ZWRfX3XBc4con5u0p
 v6dO4VSlHkZLPF+eK4Q4jZO3Ha0TOAMnza1HGEqqxDzcLJ67IR0YDYiFAiV0n+UuSDUbEHWPVX2
 qJBruHTcLXB/P3r4l4E2261W6zJNJsMudYjMOVb5FJe9bU8Bqv7SQQVqKkeuJl1lNK+NbX6Ed8O
 Vkc3JCwnKPd9oxmqnhH611oleg15UWOokDEmFVm0RaGg/5z8r06ZlkmPl+AnHBUYs9hMfTgzwAM
 ZHdwXTSOYSOOVPErZ27s1DyPCufYZQPqH+Dy42GTH0GiTnx2p65LhZshBfLG99ys7LMr6lxhVX7
 9aghoUzVAfHjN0nakif3n4MoLX95lV/hnyFc6x9kLzM+BVgtY3dJl70JdNUguIen6/HbZFCEg+z
 rkSgGUCCzkNL35nkIs8Ln9g5W9z8IjQ8qTm/UNd/joeKSHpI+cfHOilm/0kmijGcr5slMMFJRrm
 EbJZpMItBfoLsyvWGww==
X-Proofpoint-ORIG-GUID: wyUDtV_ce7GGgJ6OUuetcABivAvTRhB_
X-Proofpoint-GUID: wyUDtV_ce7GGgJ6OUuetcABivAvTRhB_
X-Proofpoint-Spam-Reason: safe
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[cirrus.com,reject];
	R_DKIM_ALLOW(-0.20)[cirrus.com:s=PODMain02222019,cirrus4.onmicrosoft.com:s=selector2-cirrus4-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[cirrus.com:+,cirrus4.onmicrosoft.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[cirrus4.onmicrosoft.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33636-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ckeepax@opensource.cirrus.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A9E4C2AA9E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:28:32AM +0100, Linus Walleij wrote:
> Convert the arizona polling GPIO handling to use a GPIO descripor
> instead of passing a global GPIO number as platform data.
> 
> This mechanism is not used in the kernel, but let's preserve
> the mechanism to be nice.
> 
> Users can define "irq-gpios" in the devicetree or software node
> for the Arizona chip to provide the GPIO line corresponding to
> the IRQ.
> 
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles

