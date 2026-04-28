Return-Path: <linux-gpio+bounces-35723-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aFdSEYzz8GnUbQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35723-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 19:51:08 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BD048A310
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 19:51:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1FC831DC9EC
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 16:36:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A4253264DD;
	Tue, 28 Apr 2026 16:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cGjW8Idf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IXHv3VvD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B731ADC7E
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 16:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777394158; cv=none; b=quIm3ys+UNmsoYsDVi1VtoHsG/cQY983kjJMnEudwZ6rYEwBR+/A5oIx49gI1py64kNeWVdDnpoRlllXpxKf4E3A23+HWmW8R3g8tNCDvCRvD5EBbmnmra363PhpWzu4G+9jdZnB1uTO9F9NSIPJjqT3NvZKW/zlC2tS9vqQH6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777394158; c=relaxed/simple;
	bh=jI0tPC4tDd+wKQNIa7rfhf0kb0nJRXzO/zQ9FpQLENE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=s3a4kHDSzv+vfhEkZN1NMuz3gHO+yvEjEHSctUelcJ2CCBkCXXiUS57SpfgMRLfbDkGOheUcYYTFMtCcn4gA+32X00t5A0RCSuuS/UyZ18f+3YTsNsPd/wUsYpHfk7KjsccDEQAftgnRPGz9yMVntpl3EmTySwWd8496Y9IffHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cGjW8Idf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IXHv3VvD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsQPg3705090
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 16:35:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=oadSlOUD1KzxQRufIOtEIqEZGmpUhIcER7I
	Fi124J44=; b=cGjW8Idfh1zhYa2bPuf5WUE8oOCNq4EmnncWC81THy9z3cDwezE
	KaiOQOSxEPY0ObCbhplbu9kBbgRlJq2f60VNTSsAbw0pJnT5JQt86vycFvUpjUc1
	b6lZaY7wEGOb4pwfM35C5GgsAr9gZW3qPw4QtHelKvp3L1Fwpvb5xmpta5Bn1T4c
	XBHNcToPg+AE9Q+/O9y4exJMZCYiJhpzwuBRMhUHipbZwbCxJrq8K31J5IFiMfeT
	1MIEQYVa8cRKuHguf+LMonTV+g2bRmiAhXY7rZHmQfi41RrJwAyBK+xwXoY1KQi6
	hkHQ/b/r6czz/DgPbk7u9W3TLRNzpaB8rVw==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttxh9g9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 16:35:55 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-56eeaefec9bso11663288e0c.2
        for <linux-gpio@vger.kernel.org>; Tue, 28 Apr 2026 09:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777394154; x=1777998954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oadSlOUD1KzxQRufIOtEIqEZGmpUhIcER7IFi124J44=;
        b=IXHv3VvDLaPZ6jVZKLylLEiyVPbLKR5vDsfyel16drKBcpCmHRz9xAKB81ezVvo2mM
         S7TbQv0CkDahqBS7KEj5EY8NXrQnUrP9qH9FUe7k9u9WkOaFeMid5lF8rr896R7xgUsw
         69xjlLGXTsOSk5unFPxRPBUEBr8Y4ZojI6ejNaq5J7h8WM6ISn6oBeb8s9ZD4aOK89Wt
         Cy3rhQwABRv5MPLKRvFR+NbSQ0kPWqv6MVW56d4t5+ATV8OXab2bWsP/NvdpJaJKEKl+
         F8zO6BQNU2ubFLxQaTnGsu+BVtSImLsQU4wK1zhvrPcRdR2QVVwiQxLbauYMdBOAXMDD
         Zzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777394154; x=1777998954;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oadSlOUD1KzxQRufIOtEIqEZGmpUhIcER7IFi124J44=;
        b=pltLU4uf+DE4yZaFeQIFpuDinviqIZrOudHITGyysuVBL5y3dtMGEfakWOiy+XaINS
         FXZ2exN7GJjCJ0dpuCy9hkwJkqEVwMxQaAK1jpst3uh15aUUnO6ZVyCeB/Sn7ZQdaGxU
         Itzt1BbYo2i25M61L4WjKHoVwbFJMfWpWbSyTc7tD2QjtLsVc0NG3IHEVowvtEO2ENZ6
         uC+rgOEo0KWllcR3mfkXKhNyxPVRYabzZ6YtNGZHLQOcAm/01cWqxpCv4ZhjZE2Z/8Rb
         KJ306KHyv1X/9ehb3d1ct5s+TOwuS884Fri7rLW+ti+J/Blrdud1Lza7X8FlJKi5/5gc
         zvQA==
X-Forwarded-Encrypted: i=1; AFNElJ/EznpIvRKUHoTNWe/5fEw9ELEgRWbjHSOix0sIjtnuf6r4wD3S2+6kO7qjhw0jx096EKvFxkbuGb+j@vger.kernel.org
X-Gm-Message-State: AOJu0Yyrnq9eFO4hrPtjUOZpWgrKK1iNwIBxqGRiCBfusZv2ms72MSqU
	hsEPRDpWP4mnsvxkn1EvlCGqyiOe2m5oc+jI+g4KaCENfvHS62P22z683Vs66RN1G6XHD8YEhVJ
	wNPFmk9NIlYOicsiXcipVdoGNopM/uZwZijjUbSXGB6ylOU/fOppZAri3lT7SVJfQ
X-Gm-Gg: AeBDietd83+gbCSkuUh8+1tWUEZV1jos80fw0bq8RWwcpC2J/+hV8c/+wsHUdWFo5J+
	QL42O2YQOnExfptPASaLIDZARkgLltvcNp1q87I2Xbghs8gsFjIA8evol57IK9s9/oklgB/h+g2
	WTmx2Sht47UI367ZfxGeuUFvuy6E6ViVXnGmdMiB2qoqG7EsRoOo6XqC1bkdWSdhGzEgUaRfy9P
	0GNID+6HFCssJaHRPuAig2E8hsvfWAjdQRVbc5+ZCnS51kiaHQwzb8bStlT5pWLnA1N387ihqDG
	WsyWiKypky+rJRkG5v0CewT3zlptUnv8BfMG7kwF9YQ5h3j01nhRJRzIXPdbK0eBUinBvlopbge
	mj1C4G8dRaMqoeqlBcWlWhSBzn+n57uas8HYuLe9xXxJ74+c=
X-Received: by 2002:a05:6122:1827:b0:56e:e9cf:710e with SMTP id 71dfb90a1353d-573a554147cmr2156733e0c.3.1777394154035;
        Tue, 28 Apr 2026 09:35:54 -0700 (PDT)
X-Received: by 2002:a05:6122:1827:b0:56e:e9cf:710e with SMTP id 71dfb90a1353d-573a554147cmr2156692e0c.3.1777394153154;
        Tue, 28 Apr 2026 09:35:53 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7b571b83sm4322655e9.13.2026.04.28.09.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:35:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v2] pinctrl: qcom: Make important drivers default
Date: Tue, 28 Apr 2026 18:35:49 +0200
Message-ID: <20260428163548.154392-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=24788; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=jI0tPC4tDd+wKQNIa7rfhf0kb0nJRXzO/zQ9FpQLENE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp8OHk6FOkpu8G1Z3z5YeWnKa5tH+H4Il/UBP0K
 TnyDmlqcOGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCafDh5AAKCRDBN2bmhouD
 1xbSEACVWaSfg/3/Rl4J20T2pJ/7vYHFM3oWEY6x/vgJz6+WrXY1NVYXAb5J5BjstVQdeShKQo+
 iSIaWLiXZqiOeLuc2JDdn45rm/7DXV9uZaGX4UcQ9jXfUl1YDAcBU4JE4CznplKYtFdMkIvMTDN
 b2Xd1A05J7W6kmASJb1IvuEs7HcCAvODbUQJyUDWKATvBLdSSBei8FumvEvHbLGYhzuW2C0lDDw
 YYLmcka54G7+CSh6trBq64wFtVTLWZ3vkBQg3JqqHX0enCOG0jgpcobd488zMXqwotlHZf2ZBdr
 vYAKYYOK+LC1NCepMnMp0zfdhHUhgAWRbD0T5cHg+YASjlDqzUdRqBVxbT92EY2i39eXJw1qcCW
 Bv6dI0iJDbDQ8+11mkYijvwNdIamQ7uujV3wH0WteOMVjFUNLA9cYzjFJYuvZe/7pb7784GVCuj
 pEH6rcc0+1GOJvFdrSaudG2NDPSr1gM7Aq0ZGwbVv3C1jwjyUaDhsPSy5WDcOJbH+a/OkjmF3cK
 PPFCHwQ2xTQb2cMOY43/06GiAIHwRDaPt2crqELhcr9pEBG/zxzxjaYUeCBxDHKmPO6HyuUXmHx
 iviRgYZmkAZaa5B7dyteW9bIRtCG3aaR2FXSWVoVEdUGKqGTLmyCmZ42fSKTDSLhosupm2YugcZ oh9UreTocxN7ZWw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE2MCBTYWx0ZWRfX0VV0MeaCNlPJ
 x6b7OUt4FNyVz0JfUHxwQbHWrnlgH+aPTD42dCGVGWoCf6BPMo+jpGzhQsO8UXzxBsdrktsyclM
 JLdkXLfuIzN1cK0eiUXpWq1oAll5dmQ2Xa1nac2JxdRkbDOPZ7uPLr6ktT7DcjJ3TwLm/talCsU
 zbfvGOXcOuV2iUQZ7+ha/aOlMB5dRGZO9j7GzsXwLTzd2qesHCKmfR7Hu5PDOpsgvrz4eb1uc9H
 xpPeEdEhNqiNXNwnrVWUtSjvXCMDVWSQfUjT2ywDZWoXhfnscyrq/eNfN1n0UR9mZ65lb5H5l9U
 RgGJ4/Zj4EXmtPOcluUJwAjhOYQS81D3TqcdiCfQACCadTim7DbCL5ZY+AvlLJEPBxf8qTuoWE5
 YQJlRZzjjK0IiKuceODCy9ek3HkRzSdDRJCZyfTQ9Or3zEQ7zkyMNcbIwVMeCEVHNZ/cIVUUl1N
 qnZYa6H8ri2LnN5B1MQ==
X-Authority-Analysis: v=2.4 cv=Uu5T8ewB c=1 sm=1 tr=0 ts=69f0e1eb cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=Amw14q-JFhzbT9FOICoA:9 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-ORIG-GUID: sX0HOjZoNKJUzlqkAfn7WSbmdbTgDBzo
X-Proofpoint-GUID: sX0HOjZoNKJUzlqkAfn7WSbmdbTgDBzo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280160
X-Rspamd-Queue-Id: 45BD048A310
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35723-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

The main SoC TLMM (Top-Level Multiplexer) pin controller drivers are
essential for booting up SoCs and are not really optional for a given
platform.  Kernel should not ask users choice of drivers when that
choice is obvious and known to the developers that answer should be
'yes' or 'module'.

Switch all Qualcomm TLMM pin controller drivers to a default 'yes' for
ARCH_QCOM.  This has impact:

1. arm64 defconfig: enable PINCTRL_SM7150, PINCTRL_IPQ9650 and
   PINCTRL_HAWI, which were not selected before but should be, because
   these platforms need them for proper boot.

2. arm qcom_defconfig: no changes.

3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
   platforms, which are already enabled on qcom_defconfig.

4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
   builds, whenever ARCH_QCOM is selected.  This has impact on build
   time and feels logical, because if one selects ARCH_QCOM then
   probably by default wants to build test it entirely.  Kernels with
   COMPILE_TEST are not supposed to be used for booting.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I did similar change for clocks and I will be continuing with
interconnect and other missing pieces.

Changes in v2:
1. Rebase on Linus W. devel branch. This should go with pinctrl, I
   think.
2. Add tags.
3. Update also PINCTRL_IPQ9650.
---
 arch/arm/configs/multi_v7_defconfig |  8 ----
 arch/arm/configs/qcom_defconfig     | 15 -------
 arch/arm64/configs/defconfig        | 46 ----------------------
 drivers/pinctrl/qcom/Kconfig        |  1 +
 drivers/pinctrl/qcom/Kconfig.msm    | 61 +++++++++++++++++++++++++++++
 5 files changed, 62 insertions(+), 69 deletions(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index bcc9aabc1202..3847a6c17193 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -483,14 +483,6 @@ CONFIG_PINCTRL_PALMAS=y
 CONFIG_PINCTRL_STMFX=y
 CONFIG_PINCTRL_OWL=y
 CONFIG_PINCTRL_S500=y
-CONFIG_PINCTRL_MSM=y
-CONFIG_PINCTRL_APQ8064=y
-CONFIG_PINCTRL_APQ8084=y
-CONFIG_PINCTRL_IPQ8064=y
-CONFIG_PINCTRL_MSM8660=y
-CONFIG_PINCTRL_MSM8960=y
-CONFIG_PINCTRL_MSM8X74=y
-CONFIG_PINCTRL_MSM8916=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_PINCTRL_RZA2=y
diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
index 29a1dea500f0..03309b89ea4c 100644
--- a/arch/arm/configs/qcom_defconfig
+++ b/arch/arm/configs/qcom_defconfig
@@ -123,22 +123,7 @@ CONFIG_I2C_QUP=y
 CONFIG_SPI=y
 CONFIG_SPI_QUP=y
 CONFIG_SPMI=y
-CONFIG_PINCTRL_MSM=y
-CONFIG_PINCTRL_APQ8064=y
-CONFIG_PINCTRL_APQ8084=y
-CONFIG_PINCTRL_IPQ4019=y
-CONFIG_PINCTRL_IPQ8064=y
-CONFIG_PINCTRL_MSM8226=y
-CONFIG_PINCTRL_MSM8660=y
-CONFIG_PINCTRL_MSM8960=y
-CONFIG_PINCTRL_MDM9607=y
-CONFIG_PINCTRL_MDM9615=y
-CONFIG_PINCTRL_MSM8X74=y
-CONFIG_PINCTRL_MSM8909=y
-CONFIG_PINCTRL_MSM8916=y
 CONFIG_GPIOLIB=y
-CONFIG_PINCTRL_SDX55=y
-CONFIG_PINCTRL_SDX65=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_QCOM_SSBI_PMIC=y
 CONFIG_GPIO_SYSFS=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..dde8b61338e3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -651,53 +651,7 @@ CONFIG_PINCTRL_IMX8ULP=y
 CONFIG_PINCTRL_IMX91=y
 CONFIG_PINCTRL_IMX93=y
 CONFIG_PINCTRL_IMX_SCMI=y
-CONFIG_PINCTRL_MSM=y
-CONFIG_PINCTRL_ELIZA=y
-CONFIG_PINCTRL_GLYMUR=y
-CONFIG_PINCTRL_IPQ5018=y
-CONFIG_PINCTRL_IPQ5210=y
-CONFIG_PINCTRL_IPQ5332=y
-CONFIG_PINCTRL_IPQ5424=y
-CONFIG_PINCTRL_IPQ8074=y
-CONFIG_PINCTRL_IPQ6018=y
-CONFIG_PINCTRL_IPQ9574=y
-CONFIG_PINCTRL_KAANAPALI=y
-CONFIG_PINCTRL_MSM8916=y
-CONFIG_PINCTRL_MSM8953=y
-CONFIG_PINCTRL_MSM8976=y
-CONFIG_PINCTRL_MSM8994=y
-CONFIG_PINCTRL_MSM8996=y
-CONFIG_PINCTRL_MSM8998=y
-CONFIG_PINCTRL_QCM2290=y
-CONFIG_PINCTRL_QCS404=y
-CONFIG_PINCTRL_QCS615=y
-CONFIG_PINCTRL_QCS8300=y
-CONFIG_PINCTRL_QDF2XXX=y
-CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_RP1=m
-CONFIG_PINCTRL_SA8775P=y
-CONFIG_PINCTRL_SC7180=y
-CONFIG_PINCTRL_SC7280=y
-CONFIG_PINCTRL_SC8180X=y
-CONFIG_PINCTRL_SC8280XP=y
-CONFIG_PINCTRL_SDM660=y
-CONFIG_PINCTRL_SDM670=y
-CONFIG_PINCTRL_SDM845=y
-CONFIG_PINCTRL_SDX75=y
-CONFIG_PINCTRL_SM4450=y
-CONFIG_PINCTRL_SM6115=y
-CONFIG_PINCTRL_SM6125=y
-CONFIG_PINCTRL_SM6350=y
-CONFIG_PINCTRL_SM6375=y
-CONFIG_PINCTRL_MILOS=y
-CONFIG_PINCTRL_SM8150=y
-CONFIG_PINCTRL_SM8250=y
-CONFIG_PINCTRL_SM8350=y
-CONFIG_PINCTRL_SM8450=y
-CONFIG_PINCTRL_SM8550=y
-CONFIG_PINCTRL_SM8650=y
-CONFIG_PINCTRL_SM8750=y
-CONFIG_PINCTRL_X1E80100=y
 CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
 CONFIG_PINCTRL_LPASS_LPI=m
 CONFIG_PINCTRL_MILOS_LPASS_LPI=m
diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index 3accf0b489bb..156ba1c853ba 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -6,6 +6,7 @@ config PINCTRL_MSM
 	depends on GPIOLIB
 	# OF for pinconf_generic_dt_node_to_map_group() from GENERIC_PINCONF
 	depends on OF
+	default ARCH_QCOM
 	select QCOM_SCM
 	select PINMUX
 	select GENERIC_PINMUX_FUNCTIONS
diff --git a/drivers/pinctrl/qcom/Kconfig.msm b/drivers/pinctrl/qcom/Kconfig.msm
index b78d6410ed2e..f171ae0d891f 100644
--- a/drivers/pinctrl/qcom/Kconfig.msm
+++ b/drivers/pinctrl/qcom/Kconfig.msm
@@ -4,6 +4,7 @@ if PINCTRL_MSM
 config PINCTRL_APQ8064
 	tristate "Qualcomm APQ8064 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm APQ8064 platform.
@@ -11,6 +12,7 @@ config PINCTRL_APQ8064
 config PINCTRL_APQ8084
 	tristate "Qualcomm APQ8084 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm APQ8084 platform.
@@ -18,6 +20,7 @@ config PINCTRL_APQ8084
 config PINCTRL_ELIZA
 	tristate "Qualcomm Eliza pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
@@ -28,6 +31,7 @@ config PINCTRL_ELIZA
 config PINCTRL_GLYMUR
 	tristate "Qualcomm Glymur pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
@@ -38,6 +42,7 @@ config PINCTRL_GLYMUR
 config PINCTRL_HAWI
 	tristate "Qualcomm Hawi pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
@@ -48,6 +53,7 @@ config PINCTRL_HAWI
 config PINCTRL_IPQ4019
 	tristate "Qualcomm IPQ4019 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm IPQ4019 platform.
@@ -55,6 +61,7 @@ config PINCTRL_IPQ4019
 config PINCTRL_IPQ5018
 	tristate "Qualcomm IPQ5018 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -64,6 +71,7 @@ config PINCTRL_IPQ5018
 config PINCTRL_IPQ8064
 	tristate "Qualcomm IPQ8064 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm IPQ8064 platform.
@@ -71,6 +79,7 @@ config PINCTRL_IPQ8064
 config PINCTRL_IPQ5210
 	tristate "Qualcomm IPQ5210 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -79,6 +88,7 @@ config PINCTRL_IPQ5210
 config PINCTRL_IPQ5332
 	tristate "Qualcomm IPQ5332 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -87,6 +97,7 @@ config PINCTRL_IPQ5332
 config PINCTRL_IPQ5424
 	tristate "Qualcomm IPQ5424 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
           the Qualcomm Technologies Inc. TLMM block found on the
@@ -96,6 +107,7 @@ config PINCTRL_IPQ5424
 config PINCTRL_IPQ8074
 	tristate "Qualcomm IPQ8074 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -105,6 +117,7 @@ config PINCTRL_IPQ8074
 config PINCTRL_IPQ6018
 	tristate "Qualcomm IPQ6018 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
 	  the Qualcomm Technologies Inc. TLMM block found on the
@@ -114,6 +127,7 @@ config PINCTRL_IPQ6018
 config PINCTRL_IPQ9574
 	tristate "Qualcomm IPQ9574 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
           the Qualcomm Technologies Inc. TLMM block found on the
@@ -123,6 +137,7 @@ config PINCTRL_IPQ9574
 config PINCTRL_IPQ9650
 	tristate "Qualcomm IPQ9650 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for
           the Qualcomm Technologies Inc. TLMM block found on the
@@ -132,6 +147,7 @@ config PINCTRL_IPQ9650
 config PINCTRL_KAANAPALI
 	tristate "Qualcomm Kaanapali pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -140,6 +156,7 @@ config PINCTRL_KAANAPALI
 config PINCTRL_MSM8226
 	tristate "Qualcomm 8226 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -148,6 +165,7 @@ config PINCTRL_MSM8226
 config PINCTRL_MSM8660
 	tristate "Qualcomm 8660 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8660 platform.
@@ -155,12 +173,14 @@ config PINCTRL_MSM8660
 config PINCTRL_MSM8960
 	tristate "Qualcomm 8960 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8960 platform.
 
 config PINCTRL_MDM9607
 	tristate "Qualcomm 9607 pin controller driver"
+	default ARCH_QCOM if ARM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 9607 platform.
@@ -168,6 +188,7 @@ config PINCTRL_MDM9607
 config PINCTRL_MDM9615
 	tristate "Qualcomm 9615 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 9615 platform.
@@ -175,6 +196,7 @@ config PINCTRL_MDM9615
 config PINCTRL_MSM8X74
 	tristate "Qualcomm 8x74 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8974 platform.
@@ -182,12 +204,14 @@ config PINCTRL_MSM8X74
 config PINCTRL_MSM8909
 	tristate "Qualcomm 8909 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8909 platform.
 
 config PINCTRL_MSM8916
 	tristate "Qualcomm 8916 pin controller driver"
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm 8916 platform.
@@ -201,6 +225,7 @@ config PINCTRL_MSM8917
 config PINCTRL_MSM8953
 	tristate "Qualcomm 8953 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8953 platform.
@@ -210,6 +235,7 @@ config PINCTRL_MSM8953
 config PINCTRL_MSM8976
 	tristate "Qualcomm 8976 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found on the Qualcomm MSM8976 platform.
@@ -219,6 +245,7 @@ config PINCTRL_MSM8976
 config PINCTRL_MSM8994
 	tristate "Qualcomm 8994 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm 8994 platform. The
@@ -227,6 +254,7 @@ config PINCTRL_MSM8994
 config PINCTRL_MSM8996
 	tristate "Qualcomm MSM8996 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8996 platform.
@@ -234,6 +262,7 @@ config PINCTRL_MSM8996
 config PINCTRL_MSM8998
 	tristate "Qualcomm MSM8998 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm TLMM block found in the Qualcomm MSM8998 platform.
@@ -241,6 +270,7 @@ config PINCTRL_MSM8998
 config PINCTRL_QCM2290
 	tristate "Qualcomm QCM2290 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found in the Qualcomm QCM2290 platform.
@@ -248,6 +278,7 @@ config PINCTRL_QCM2290
 config PINCTRL_QCS404
 	tristate "Qualcomm QCS404 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found in the Qualcomm QCS404 platform.
@@ -255,6 +286,7 @@ config PINCTRL_QCS404
 config PINCTRL_QCS615
 	tristate "Qualcomm QCS615 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  TLMM block found on the Qualcomm QCS615 platform.
@@ -262,6 +294,7 @@ config PINCTRL_QCS615
 config PINCTRL_QCS8300
 	tristate "Qualcomm QCS8300 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
 	  TLMM block found on the Qualcomm QCS8300 platform.
@@ -269,6 +302,7 @@ config PINCTRL_QCS8300
 config PINCTRL_QDF2XXX
 	tristate "Qualcomm QDF2xxx pin controller driver"
 	depends on ACPI
+	default ARCH_QCOM if ARM64
 	help
 	  This is the GPIO driver for the TLMM block found on the
 	  Qualcomm Technologies QDF2xxx SOCs.
@@ -276,6 +310,7 @@ config PINCTRL_QDF2XXX
 config PINCTRL_QDU1000
 	tristate "Qualcomm QDU1000/QRU1000 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf, and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -284,6 +319,7 @@ config PINCTRL_QDU1000
 config PINCTRL_SA8775P
 	tristate "Qualcomm SA8775P pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux and pinconf driver for the Qualcomm
 	  TLMM block found on the Qualcomm SA8775P platforms.
@@ -299,6 +335,7 @@ config PINCTRL_SAR2130P
 config PINCTRL_SC7180
 	tristate "Qualcomm SC7180 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -307,6 +344,7 @@ config PINCTRL_SC7180
 config PINCTRL_SC7280
 	tristate "Qualcomm SC7280 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -316,6 +354,7 @@ config PINCTRL_SC8180X
 	tristate "Qualcomm SC8180x pin controller driver"
 	depends on (OF || ACPI)
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -324,6 +363,7 @@ config PINCTRL_SC8180X
 config PINCTRL_SC8280XP
 	tristate "Qualcomm SC8280xp pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -332,6 +372,7 @@ config PINCTRL_SC8280XP
 config PINCTRL_SDM660
 	tristate "Qualcomm SDM660 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -340,6 +381,7 @@ config PINCTRL_SDM660
 config PINCTRL_SDM670
 	tristate "Qualcomm SDM670 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -349,6 +391,7 @@ config PINCTRL_SDM845
 	tristate "Qualcomm SDM845 pin controller driver"
 	depends on (OF || ACPI)
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -357,6 +400,7 @@ config PINCTRL_SDM845
 config PINCTRL_SDX55
 	tristate "Qualcomm SDX55 pin controller driver"
 	depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -365,6 +409,7 @@ config PINCTRL_SDX55
 config PINCTRL_SDX65
         tristate "Qualcomm SDX65 pin controller driver"
         depends on ARM || COMPILE_TEST
+	default ARCH_QCOM
         help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
          Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -373,6 +418,7 @@ config PINCTRL_SDX65
 config PINCTRL_SDX75
         tristate "Qualcomm SDX75 pin controller driver"
         depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
         help
          This is the pinctrl, pinmux, pinconf and gpiolib driver for the
          Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -381,6 +427,7 @@ config PINCTRL_SDX75
 config PINCTRL_SM4450
 	tristate "Qualcomm SM4450 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -389,6 +436,7 @@ config PINCTRL_SM4450
 config PINCTRL_SM6115
 	tristate "Qualcomm SM6115,SM4250 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -397,6 +445,7 @@ config PINCTRL_SM6115
 config PINCTRL_SM6125
 	tristate "Qualcomm SM6125 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -405,6 +454,7 @@ config PINCTRL_SM6125
 config PINCTRL_SM6350
 	tristate "Qualcomm SM6350 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -413,6 +463,7 @@ config PINCTRL_SM6350
 config PINCTRL_SM6375
 	tristate "Qualcomm SM6375 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -421,6 +472,7 @@ config PINCTRL_SM6375
 config PINCTRL_SM7150
 	tristate "Qualcomm SM7150 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -429,6 +481,7 @@ config PINCTRL_SM7150
 config PINCTRL_MILOS
 	tristate "Qualcomm Milos pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -437,6 +490,7 @@ config PINCTRL_MILOS
 config PINCTRL_SM8150
 	tristate "Qualcomm SM8150 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	 This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	 Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -445,6 +499,7 @@ config PINCTRL_SM8150
 config PINCTRL_SM8250
 	tristate "Qualcomm SM8250 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -453,6 +508,7 @@ config PINCTRL_SM8250
 config PINCTRL_SM8350
 	tristate "Qualcomm SM8350 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -461,6 +517,7 @@ config PINCTRL_SM8350
 config PINCTRL_SM8450
 	tristate "Qualcomm SM8450 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -469,6 +526,7 @@ config PINCTRL_SM8450
 config PINCTRL_SM8550
 	tristate "Qualcomm SM8550 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -477,6 +535,7 @@ config PINCTRL_SM8550
 config PINCTRL_SM8650
 	tristate "Qualcomm SM8650 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -485,6 +544,7 @@ config PINCTRL_SM8650
 config PINCTRL_SM8750
 	tristate "Qualcomm SM8750 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc TLMM block found on the Qualcomm
@@ -493,6 +553,7 @@ config PINCTRL_SM8750
 config PINCTRL_X1E80100
 	tristate "Qualcomm X1E80100 pin controller driver"
 	depends on ARM64 || COMPILE_TEST
+	default ARCH_QCOM
 	help
 	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
 	  Qualcomm Technologies Inc Top Level Mode Multiplexer block (TLMM)
-- 
2.51.0


