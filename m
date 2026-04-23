Return-Path: <linux-gpio+bounces-35413-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOLGG74H6mk/rQIAu9opvQ
	(envelope-from <linux-gpio+bounces-35413-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:51:26 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4194517E5
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 13:51:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 44C483009E2D
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 11:51:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 985483E9F72;
	Thu, 23 Apr 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A8iTYTZr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SulZzhXd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2633E9F67
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776945071; cv=none; b=m/ujVi5YTf4DxmOG6ZBWrG0cfm+VtKpFPBgt4K/kHWGKI1xNTJadQs4fXlXdQ0oyXOl1Jbgl/7aT7DJM7Zs7bErssJKARr5rR9rDKZ2BmpruVP395a44t9edwAX7UiOjuQ3tyWPzzNFwAEhVZZmkSeNn1NTXm81b/RTRB8GveMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776945071; c=relaxed/simple;
	bh=KGvC7KTLhq0r8D9oY5fxUSpOk1nYc8Ku/N5cFt263kw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=WcHZCFI69b056iBNslpzefXEcLhoqpD8GA6qRDIqJg4nqdvM7a5TJlCaUHT18GU3MKdE6tIjYSXg4DCkuAbDhf4TBFm3vItdOjIZxE1QBhcKlupiqyiXetbgmZsi729Uyv4/pKWc294tBHoYPGKSiaioHjmeazCOFTZVOlDsoLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A8iTYTZr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SulZzhXd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8u9V3366400
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=41+SGosw4qCcHzNh2g0MDK
	Ln/wuiSo+fXOZ/+DcIqtc=; b=A8iTYTZrLJmeK4fskbzAS/8XrFbjcifx+rUOuW
	H9pCIgrNsi8NagNKgrJezCHqrr5Yjqm0wnsS7idQ2tQlcooedfUq2mgNspdg934f
	XiTeXyHvxWJQhKj2gKE24OsWI/2NvqzWbGl2KlsK06fEUyYSN5T1fC7bd3LAaMQD
	56SusW8XxARxxYHfPI/1smGF1LcCOX8CAVhUDV/hg/kAHMD+mKI57lfjiyP8zi3n
	/09MZgPwcGI/QWB0Xz9WOwwzml76mdWxgiOcakP5GZrQmnSV5uSmgm09Q1K8iKtH
	Z8i9huiDQnv7ZlNAujNj66z6MTUJBxALVfCpujdLUnp77wEQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rbas3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 11:51:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f803658d5so8015205b3a.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 04:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776945067; x=1777549867; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41+SGosw4qCcHzNh2g0MDKLn/wuiSo+fXOZ/+DcIqtc=;
        b=SulZzhXdq8AzqtmVQLbOlSQ2UzE7g0xtmcH+PAui/rSfBvzxfV4Q32ZOVnlEpeN3ht
         +yGMPzhdGwNB2dbqaYTFFfdrnPjTiisLNj02ejdScn+J2CIbKZG17LsOAe1fYFE3xaMy
         EW9WmZB6JW8f+yybFShjqz3zomObaPHtgg1Itql6WTL5WznCJnsBGNLOovkiqeLvDtj8
         wMftJIMz/tDafwzeDiEdkFADup1WNGPANydMYE5ilMzvhfXI3DmrpMZIl51Q2WaaYOHd
         a9FL/81PA+zzpIqskn931pP2akRuVgqZAua4QzsE7LESfPAnuk/YkCetpYjXD/p/czoY
         qJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776945067; x=1777549867;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41+SGosw4qCcHzNh2g0MDKLn/wuiSo+fXOZ/+DcIqtc=;
        b=HFKOHqGIaz5hykXElYt6djPRCSYb5geXSFhMQrzzqe/FJKFY+MrMUG0NAND3oWaHSG
         bxQ9w+y/G50Ykc4Jh+Lue78Q2lVMBVyEw0yeycAbabb4BWZ9Q4BnLK4KfGCkvJhYMJz5
         iyTXwMQ6LDsS/Egob4U5aLh+er0DhonzbRJfxKSlnPRnlwjtr4m8W/cnR4Z7h+5U/PsZ
         TIGsUZRxTOQRI7YsOU5Tb+ZI4fFBt0aNNnXmcbiWxHxEQCllzWDmZY1H9lH57hJ61SjK
         aMTqUaecMlZ0KQhzEfGuDjU4nTKoYiBj4JRKNniL4svqnvGQR6uvF9AFCYu+SCY6x0qA
         LV/g==
X-Forwarded-Encrypted: i=1; AFNElJ/DfAx7IV3op2/ZNRPAEJuBMyeZl7gpgded57eZrgvVHGejnW2+hoBjY/4ovtQGYQ1b8b1E0mn/KXku@vger.kernel.org
X-Gm-Message-State: AOJu0YzAqzFDibJFzcK3A+qLzgWVe3+9tZb/BtqrN/s+9EVDFg4wgtL0
	HjUDCWuKXzTbPio6ohqWSxZ5c6PHGVU8KonsC3rbB3ZqnNU+oNL7m8L3MwAhin+zQMxA07W4BTI
	yLmLK7T/k6NB+EfEhh7ix12th2BsRaBJAZro/VfNBfWdgz3K1swzsLHsBMIFFcRu0
X-Gm-Gg: AeBDietWY6X/woNaqpCThaRxeSpjZEy3l2rhSd0Y+PpHK6UCwnjQUwPSabCkrOndBKt
	q5fSrBQYdEYxU6FHJtcUEprcwPwhkoMe8yWFvqFOxI+up+4eFkx6L/sgByuGVOoodww7oCfGD5D
	yeWte0MM3OxI6pPnQuONSc9bq5ehm23Vva33IghnIB3bRegkbyPNxc/LUkpWpScAqmFnFMyKg9n
	OPlDRMBQGOSqb7fHbWIClfCqvRjcvs4hPllWozWb1G09a3kWpQ25zlextpCqE/IyJgkp2v74S3P
	I6DmIDW/j/CUeFefKwDortLSOD7xXUaB03MASfqxm+OnicITyPTuOYQhoa5V2xnQ0CLzqboW0AP
	uiNBcTeJCtCavOe10lWNhClIg8XTG+Rn+zu1+SNOZdiuP2TgDhh0a081JPYOBK3ZQDHgM
X-Received: by 2002:a05:6a00:3e26:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-82f8c8f07d2mr28912543b3a.37.1776945067082;
        Thu, 23 Apr 2026 04:51:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e26:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-82f8c8f07d2mr28912499b3a.37.1776945066582;
        Thu, 23 Apr 2026 04:51:06 -0700 (PDT)
Received: from hu-nmalempa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebba485sm25350541b3a.38.2026.04.23.04.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 04:51:06 -0700 (PDT)
From: Navya Malempati <navya.malempati@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 17:21:01 +0530
Subject: [PATCH] pinctrl: qcom: Fix wakeirq map by removing disconnected
 irqs for sm8150
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKQH6mkC/yXMyw5AMBBA0V+RWWvSFvX4FRHxGIzEIx1EIv5ds
 TyLey9gtIQMmXeBxYOYltlB+R40QzX3KKh1Bi21kaEOBE+JimTZr7QIU6dxIE2iVBuCK1aLHZ3
 fLS9+816P2GzvAu77AVVu9rxvAAAA
X-Change-ID: 20260423-sm8150_gpio-6b97306811d4
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vinod Koul <vkoul@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Navya Malempati <navya.malempati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776945063; l=2798;
 i=navya.malempati@oss.qualcomm.com; s=20260423; h=from:subject:message-id;
 bh=p0meogd7D+F1u8p1F5dKPGdq/rdTGqXScAMfkTVpPmw=;
 b=Auzxd6uB0zOBrj8V9SWjJffAMpnG0w9QD8vU8Ymj/acGP6SohKz3sxfD/Bg1nzyZK0rMMQlEV
 OyNb9UvPBTiDGVkE0kuVTVCS8LM1TOd5Fh9eHM0kT276XawjZQUUfum
X-Developer-Key: i=navya.malempati@oss.qualcomm.com; a=ed25519;
 pk=XWkaQ4rYqw3tflaJ4YH+9iUHSq1kn9eQh+CAbSvNrdI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExOCBTYWx0ZWRfX909I5B5Rk8JK
 LJ0Gax4Fe7pnJ+MF1vbisq32da+FbhBILhOkFI6TJmS5urxuK9vNJj8Cwa8ccnaxb9UM3xZ5oIp
 YdpsQJyCH+aJQcMnH0avmTQbUm9tq9MXAR6zBSX2hcVa64bmnP4PtyGZLrDkLqNjF76gSd06zn9
 YWgq95Cl4MdDLs9udStXGnr657wXgaP3z7y5bQAGd4BJtzv30MLRP393s+N7vW0mqh44Zn73PVB
 3ao8WMuRwgT97pXEZ5jVKIrCwXBl46ZF8wXV5LFSG0XHEWYhkAtHLAa2x7kfjBbwujG8vr14B/2
 DIAKWuv8Y6FSLWLYeCz8dhKHghTAD2XZNDXdZadK99lYbMiiB3hWypQYDKMzTStf7lGQmlKoZcv
 9cC4hnL27TLODPMG7zx/9G1Qy5VW0Pwlb2SfzjZPBpkMog3LhnlCtrl6hSvBecFMhnJjIC2UjWY
 7fWvZYlT9zNtnv9XdPw==
X-Proofpoint-ORIG-GUID: Nbm7uHFYl6bt8yqMSt-FVSHaHTDAjPik
X-Proofpoint-GUID: Nbm7uHFYl6bt8yqMSt-FVSHaHTDAjPik
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69ea07ac cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=0zdWKiCgVtcSCpT9hG0A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230118
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35413-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[navya.malempati@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8B4194517E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Maulik Shah <maulik.shah@oss.qualcomm.com>

PDC interrupts 122-125 were meant for ibi_i3c wakeup but sm8150 do not
support i3c. GPIOs 39,51,88 and 144 are also connected to different PDC
pin and already reflected in the wake irq map.

Remove the unsupported wakeup interrupts from the map.

Fixes: 90337380c809 ("pinctrl: qcom: sm8150: Specify PDC map")
Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-sm8150.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index 0767261f5149..81c08b18ac71 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -1493,18 +1493,17 @@ static const struct msm_gpio_wakeirq_map sm8150_pdc_map[] = {
 	{ 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 },
 	{ 12, 104 }, { 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 },
 	{ 30, 39 }, { 36, 43 }, { 37, 44 }, { 38, 30 }, { 39, 118 },
-	{ 39, 125 }, { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
-	{ 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 }, { 51, 123 },
-	{ 53, 54 }, { 54, 55 }, { 55, 56 }, { 56, 57 }, { 58, 58 },
-	{ 60, 60 }, { 61, 61 }, { 68, 62 }, { 70, 63 }, { 76, 71 },
-	{ 77, 66 }, { 81, 64 }, { 83, 65 }, { 86, 67 }, { 87, 84 },
-	{ 88, 117 }, { 88, 124 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
-	{ 95, 72 }, { 96, 73 }, { 97, 74 }, { 101, 40 }, { 103, 77 },
-	{ 104, 78 }, { 108, 79 }, { 112, 80 }, { 113, 81 }, { 114, 82 },
-	{ 117, 85 }, { 118, 101 }, { 119, 87 }, { 120, 88 }, { 121, 89 },
-	{ 122, 90 }, { 123, 91 }, { 124, 92 }, { 125, 93 }, { 129, 94 },
-	{ 132, 105 }, { 133, 83 }, { 134, 36 }, { 136, 97 }, { 142, 103 },
-	{ 144, 115 }, { 144, 122 }, { 147, 102 }, { 150, 107 },
+	{ 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 }, { 48, 51 },
+	{ 49, 53 }, { 50, 52 }, { 51, 116 }, { 53, 54 }, { 54, 55 },
+	{ 55, 56 }, { 56, 57 }, { 58, 58 }, { 60, 60 }, { 61, 61 },
+	{ 68, 62 }, { 70, 63 }, { 76, 71 }, { 77, 66 }, { 81, 64 },
+	{ 83, 65 }, { 86, 67 }, { 87, 84 }, { 88, 117 }, { 90, 69 },
+	{ 91, 70 }, { 93, 75 }, { 95, 72 }, { 96, 73 }, { 97, 74 },
+	{ 101, 40 }, { 103, 77 }, { 104, 78 }, { 108, 79 }, { 112, 80 },
+	{ 113, 81 }, { 114, 82 }, { 117, 85 }, { 118, 101 }, { 119, 87 },
+	{ 120, 88 }, { 121, 89 }, { 122, 90 }, { 123, 91 }, { 124, 92 },
+	{ 125, 93 }, { 129, 94 }, { 132, 105 }, { 133, 83 }, { 134, 36 },
+	{ 136, 97 }, { 142, 103 }, { 144, 115 }, { 147, 102 }, { 150, 107 },
 	{ 152, 108 }, { 153, 109 }
 };
 

---
base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
change-id: 20260423-sm8150_gpio-6b97306811d4

Best regards,
--  
Navya Malempati <navya.malempati@oss.qualcomm.com>


