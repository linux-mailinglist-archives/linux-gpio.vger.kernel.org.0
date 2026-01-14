Return-Path: <linux-gpio+bounces-30565-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 77499D1FDB6
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 16:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 86308304375E
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Jan 2026 15:31:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45D13A0EB7;
	Wed, 14 Jan 2026 15:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kk8JIzgW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSgpfLeo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC6339C653
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768404639; cv=none; b=abnT5ZnXiqj2XztQY8pOJ+Ja5u/AgY+yocMb/mwnjb946NT1TYpDRpwg/PHVE7g/ocBQIMg6zxVAgTlyiSg2VF2bFh4VssisHWZ5FT6i7StMzzrZwl1EJzoqMdD22rAv88+p35w1yaBFJvf+iB3obHDoe/+SDW3eqLx+eiOXXGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768404639; c=relaxed/simple;
	bh=zRGKe5UJ9yNFcA3nCyV2yle+pcJ0o698KmnQ7j+oxLg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bt0j5obEy8FjUnobXfq1MHrItNVIjm0zYwv2KHnFMeTKOprrcqdnSPPj+37y38F/AWkCFazFGG84MX71SPdY7KkaqY2tMea0yPEkBwecJ3s/8hnh89fRjcpSLVF8+YbkHefakvk0j8CuL2Gjh9PpTegWmShoYL9GoxbLRpNr/u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kk8JIzgW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSgpfLeo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EB34LV3280116
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ssy8kvmbkidBSVa4bIF/Sg6F1PMs1iwvsiG9/WVtcJY=; b=kk8JIzgWD/bAHEgM
	0ls96MNXXtEja6QlnGHg+sHWfdxg9wDNaEzJfvyQq5xMnTuFWVseT9s6RLHdO5L9
	fiiRlWgh/YHepJkNkuC0AnfkwGL0Ld6YutVOHruXFFvt2zdl1KPFXN2Cdk+9raEf
	zVwyi4HdbYB1Qm3iEm8EXAmNAB5eexz3+aKnzn6LtAne6tKxrKfpmd2Pdf1s2JA6
	PGnyZKWvZl78FlUvryh6W208cUEVgEwxQtAzboLq6Fvy6bXHKAL+r7R4mbLDWzH6
	KQ/pTMq+l2VkT7Uu6Vm/oLuuz9ef9Gr2BrJAtjOSQ6YQeOgumZ7CN3XyCY0Zv1ZS
	hqsjxw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bp9x8rvcn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 15:30:37 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8ba026720eeso938045185a.1
        for <linux-gpio@vger.kernel.org>; Wed, 14 Jan 2026 07:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768404636; x=1769009436; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ssy8kvmbkidBSVa4bIF/Sg6F1PMs1iwvsiG9/WVtcJY=;
        b=WSgpfLeoPK9O7awuR36OjKIS6QTCezcaj0Df6mpVTxJJxsVfXP+tfToXYfheIYaJo/
         sLDuqYpTV2cmoZi0wJDLnZwI2wzH/v+ltQZAh1MbmkxubOZe7BfyUuOJLZrl7xepK1Mb
         uxMSKYkgw5BszTx4P/znYqGNMxVTh+VjCF7X04KIJkCkimhZ9qdIie0h7oLSDL5H3htV
         AMyC1VXEMX5iNjvXLI/fjO2OqMZBIRx6ZMVdTF4QdO+jpCHqCmZaQ+Ov1B1FYrCVsq4/
         K4VxKDiQGt/1OLck9NVdhiI3S4kImH8Wvbq4QwMY0O2elqgBaHIoA5Brp6+Y0NjeI/ML
         8jNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768404636; x=1769009436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ssy8kvmbkidBSVa4bIF/Sg6F1PMs1iwvsiG9/WVtcJY=;
        b=Iw0pcu8fqaQil9dd4Cr/Gj5i+tIKvzAUNBfjmIHG4K/mQ7sy6OdkhFUauB7im2qKNk
         w7zOC/Ojh52yFWgjn7PZHPFsel0KoMOSlvWCH7KpYkEs8boCWGTaK6hExs596T8TOgr4
         t/8ZabVH28hJXt1baWX3s2CKaOAQMMr1mZoW/PhzkSHj3+s/EQApT9XFsZsMyCTkYbSg
         fJQQpXnFZrpmMD8oc7JzdbW30LVml5BrBEYkVmYFR0RmITskRqSSKZzHoRHC+0pBEcT9
         Zx/wgVwu62VsNGoKPuY+9QVQfoEthGl9M798x9687wuGVuTmInhnsQUtmA1Dzt4ZyrF7
         JdIA==
X-Forwarded-Encrypted: i=1; AJvYcCXh0Zc9SAxWEDbhtfae/jmFrvny5Xz+wVUUZzpSPJJsAwmXgOfu+O41kyChrHBEoveh3Ivzu/a4ULW+@vger.kernel.org
X-Gm-Message-State: AOJu0YylLfUs8Xc6U8VLCZ+nis4cZo32Qwfv22ELKomg1wA4RzWwVzvA
	90t2P1Lljn1O3GdmDjJ8kbZkkWph/8rGvtmcmE8e7xwm/eZ6hxfngwgVZy0jz07pBfkWPm4C0Po
	zs2+kj6b/zJi6AvZaBqsZXte2Ja584zlkjBhyaXAB3aJaU4XIvjtLElxXQ+N6F2kE
X-Gm-Gg: AY/fxX7acfPhtZsztSvscAUDAtH41gHltSZVugU7ReSILF4BFU8ZcwSttXap0UeNKof
	BSe+2LVaw4GRY0EqsnqEheaAvDYMfgQIzdLN7u9pmACIAZkOIu4EHUsoPZGLg9gugC4YFfnbcyX
	3VgaN+D2hzy72C6IzNLnw1gzPX9f/y7Wdv3Kh4vaRG/SgGJcvlc7QFBNVCiaLetRNJRMDoqEpAs
	CgqIZ2+FktrbyfRqvdokcyF8S97iVPgsLykSOHDCSVxmAx2/uG1X9y0GLH1YSYfrdRw4C8rixT0
	ayZCwSROnOWL1KUxswFoMMTQZK0KYd+iewefuLqsia6BkypQNRqusGA2DKDDSiHX8q7lr5kxnsi
	uAM5abveuiyKd/70JFIeY021+bdjRdSJSuA==
X-Received: by 2002:a05:620a:4549:b0:8b2:db27:4268 with SMTP id af79cd13be357-8c5317f0aaamr303442985a.53.1768404636273;
        Wed, 14 Jan 2026 07:30:36 -0800 (PST)
X-Received: by 2002:a05:620a:4549:b0:8b2:db27:4268 with SMTP id af79cd13be357-8c5317f0aaamr303432485a.53.1768404635555;
        Wed, 14 Jan 2026 07:30:35 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf667fcsm22812989a12.29.2026.01.14.07.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 07:30:34 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 14 Jan 2026 16:30:09 +0100
Subject: [PATCH 08/11] pinctrl: tegra-xusb: Return void in padctl
 enable/disable functions
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260114-pinctrl-cleanup-guard-v1-8-a14572685cd3@oss.qualcomm.com>
References: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
In-Reply-To: <20260114-pinctrl-cleanup-guard-v1-0-a14572685cd3@oss.qualcomm.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>,
        Linus Walleij <linusw@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Hal Feng <hal.feng@starfivetech.com>,
        Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Steen Hegelund <Steen.Hegelund@microchip.com>,
        Daniel Machon <daniel.machon@microchip.com>,
        UNGLinuxDriver@microchip.com,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Patrice Chotard <patrice.chotard@foss.st.com>
Cc: linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, sophgo@lists.linux.dev,
        linux-tegra@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1889;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=zRGKe5UJ9yNFcA3nCyV2yle+pcJ0o698KmnQ7j+oxLg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpZ7aG1jDmkP4a6PmHCk7jxdg6pIwc6m3a2BsZu
 jfRoWqEDhyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWe2hgAKCRDBN2bmhouD
 18PUEACGRm9HFTgK/BMYNlKpt3lPmWT9bCXtaAiUNJGcB6ffgJheT+i457oOaT/xTx1LOOiYEau
 UWjdo7vnfye/rqPz8xYcdQr+go81raUQ3IhBxe+LqfaMunA9y3Q+s3QbktSC3PldiTWJyw6MXBt
 uq+YFH0Vtnkbp8TC6c1687wMzaJsm5xlKxC6x3Sfmws6HwZXhBuTB4Hi0wT0my3LoS8gJTHQTNq
 +qkjU0hLXmrpN6ibgVT1FxGuHDuDSNeVSEIHmrFSXVlPBywSQGm5gVuLyiQCtiarsEhPhlP1a06
 OD9Hmdkv9AZLGDb+Nyi9BewRwnASnSvswYKtqIMj+lA+fj+BdCmRx1CeX2CIRINVcIZXzU4+VMe
 uKlw9dXawo9KJHktVbqmjTBM/mP3CqYpYoLKJ/Z266veUYfVXw8zFBpEdU0xSOqRlekxTnkGZEN
 dOEKquxcczR8jUIAagMutrlY6GtaQG8YcU5pIdWXfU7Mmly/s9fuJlOFKiCuv78MnGkL2CIwOxF
 saww7DthM71jMUAZ8mCReBzVQOz3GSqWUmdqg2hOkdn6kGEQgkbdIeWBCfvFxgKmUJOw6Jx3QkV
 ceyz1gCkgjID4vnUSP0ziWiUhEXkrHazIzGuYyBPUGmzvaZk1w/COGY+KgPKeu7arJ/qiUw/2Iy
 P4nTGG0eFE6fjiA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: azlM5cp8-M3BI1pWeFIv0fb74InE11ns
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDEyOSBTYWx0ZWRfX0FMqPcawQCTr
 9te+bay7vgOsJYeLaBtS/u764UCLWOGGjsQ1Iti+c1FdORsvpC0HnZ1acH1bKo/cEAzFCphz29u
 D6vkAGffg4Ibt0PDu86cp7K1Tku7CfGEgqUQnzrQkMecECLCpbe6V999LrcyHfvntwXgC7L6XW+
 w2g5IUJpAOkgFsdfUVfJ9gLo3vMzZCox0qnnM/gx9kaFLlSELzg5/fQPIC0I8SKrzcZMbpnTgaV
 t/7WpLYOZswM+FqEuUSx6cqT2rRYLk7cAAlBkFSHVPX2vK0G9C9UtfL2Q4jhW8Te4jFXghCsm41
 eNa1FH3VC4OV5UxhwEanCcfrbtR54KOAitx3Rrsu90yfREAVpvgi+iFxIK/sIliaox0vLF7iIOt
 1URw9YLSXdB3VS3wSvimnbX0D0rjStKFJXcNpuTl9WvLHOG+veNUyXAdCf7BJiRAh551KR8HOZ3
 Cq1bUJMKjWtzuUM5X9w==
X-Authority-Analysis: v=2.4 cv=HY4ZjyE8 c=1 sm=1 tr=0 ts=6967b69d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Ed5BEzkqmhObfCaRRI0A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: azlM5cp8-M3BI1pWeFIv0fb74InE11ns
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_04,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601140129

Make the padctl functions a bit simpler by returning void instead of
always '0'.  The callers - phy init/exit - still need to return 0, but
these are smaller function without if/branching.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/pinctrl/tegra/pinctrl-tegra-xusb.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
index 49c5edeba87f..34a373f7e04d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra-xusb.c
@@ -474,7 +474,7 @@ static const struct pinconf_ops tegra_xusb_padctl_pinconf_ops = {
 #endif
 };
 
-static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -501,10 +501,9 @@ static int tegra_xusb_padctl_enable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
-static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
+static void tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 {
 	u32 value;
 
@@ -534,21 +533,24 @@ static int tegra_xusb_padctl_disable(struct tegra_xusb_padctl *padctl)
 
 out:
 	mutex_unlock(&padctl->lock);
-	return 0;
 }
 
 static int tegra_xusb_phy_init(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_enable(padctl);
+	tegra_xusb_padctl_enable(padctl);
+
+	return 0;
 }
 
 static int tegra_xusb_phy_exit(struct phy *phy)
 {
 	struct tegra_xusb_padctl *padctl = phy_get_drvdata(phy);
 
-	return tegra_xusb_padctl_disable(padctl);
+	tegra_xusb_padctl_disable(padctl);
+
+	return 0;
 }
 
 static int pcie_phy_power_on(struct phy *phy)

-- 
2.51.0


