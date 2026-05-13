Return-Path: <linux-gpio+bounces-36747-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMQoGE9uBGprIQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36747-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 14:27:59 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D5628533090
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 14:27:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9626530E6F7B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 May 2026 12:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F52E40FD87;
	Wed, 13 May 2026 12:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vr5UE5YY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iprxiEq2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C68407597
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778675151; cv=none; b=FW217/kOhH7oJ4qShJqu9v5TpUt+gmD7Bu8wCio6Oh3Zt/wthsJz2hmL2bbjmv0I+N4hjg4VPZ+6vwc4FWSwTzAZk6FaItqyChfFc1j4mhxteSJvEO7+REX5YGewiIUSZxqR4iBmLpRoS3l8FGHe0GbVRBhSGWI3t0ImFwhl7Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778675151; c=relaxed/simple;
	bh=13ORXNiGK5VY8fWQbqtg3OHn0VCBQZiClPk+uhkBcNQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=apz05NK797OBXukYHbnCQsqPZowj9eHq3THRLgCXJduEt5zbtR5UoWu1v72F/xlUTvjTZDafFZY5Rxf7PBccts2xivCa74KYq2hBcgZ7S5O1dS+fbghSwgA4eCmRJVdWsobJXt1eH4UbpC3bem7ntx8x84TTqZ2Q+90rUtGLAuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vr5UE5YY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iprxiEq2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DBmUlk2965306
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dmWqbN8vGUe
	JHt8BUeQ2DbLLPPLrShxdffLiE2tHYW8=; b=Vr5UE5YYFiXPIV5KzpspZoXMCYC
	0DlTqVMSr4fb3V6pap7+ZoL8SuIWCqX1qpMpmVg0R4/lbcqJn6mxShDwxJX6+c0u
	AC+h/0PTKOK22jXY1UnK51oUytftytAYskPzGeRjpMOguIuT8S9nipu/odWHaO/9
	JFeaQAv2ywStS+SRnwf1530mhgZ4FEdEsE0oDNWKK3PyxQTQbQie5xgs2mwkvnOn
	Hg9d1UghzOqxlH3IC+pxEkaZKL11Bt0XqSGGoOYwiCPy54SYs3CiKqmy+gcD5DZK
	kOCFH+um76PJQld4yyJDzUPdUGGKVXUjIWbdQSuemkjnyip0l23SfNY4WeA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma599er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 12:25:48 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-36781927b4dso9090732a91.0
        for <linux-gpio@vger.kernel.org>; Wed, 13 May 2026 05:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778675148; x=1779279948; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmWqbN8vGUeJHt8BUeQ2DbLLPPLrShxdffLiE2tHYW8=;
        b=iprxiEq2nmBBCjpPxxZS0RNH1hf+yffSd8psqB25ixylm5lY3FIjD/nX15GwGQp2lE
         ksue1/hp2NjNuQuDyx+Zg65Rw9fGQFkwuPu8j96ff3onIyHwTNEAen0gGHuvYm61tkql
         0J/P4MYCYfGoSM9wPctraLHoCR112HYEglLMlaMnegONOjGhfb3eKEjT+oy4pjAy4GPp
         6kFO/agrApeI7gbCmyiDAi2QkiHHmvWyiFKOsGripUgTiVBdBTGVqa01B02kPcQnDrus
         JX7gSTXVejvsU1vqrvApoK3Q1TPQjZi0sjrqWRk7DsaXBvqR9+jfBCypH0OyT6GDgcKh
         SiNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778675148; x=1779279948;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dmWqbN8vGUeJHt8BUeQ2DbLLPPLrShxdffLiE2tHYW8=;
        b=mycenNNFTzdRE/JH0EUvDvYNCcisd4hCzJ8l8qzADyzd3sHXbIUQvtXR27PWgTHp+U
         LpXxH9Du2zt6aq/vRwY508/ffe4iH3fA4RfuzssLNmIkXiTlpltIY5ZquIy65cHmERUB
         tbDIAWBMs+rhDQ7/46GjqTOapfFmBOxiwZV0YwAKMllQ0cjjTd7uwMD8ytYrqpEYolRK
         bTUBw2qrR2Xh/gzsnl3Ymjux56XifErbIcFQ3zXwjkNiayOpG3/BmDKawxvXJ6QyBHDr
         HndzWNbhKFHfMLobaOT8KYFutLvRWTR6FoPYv349X02ETjvE1sKYFUoUhbNFBAV4tXTV
         lwug==
X-Forwarded-Encrypted: i=1; AFNElJ9xHvCvLpKzgxKzB8ez55t5sSakwVd/A8sxecDMPdpGit3HzvL908wNsqqI1ot1XVReNrMAwU6j9+eo@vger.kernel.org
X-Gm-Message-State: AOJu0YwnVdzmCKRc9mzKnAGQoo5jU4czPNQYqK4gEAoTCBu+uocXkW5m
	sq9I6CVg108F9n1/qsYjJB0h5ZVRd1Hk72sN43TbgfjarAgA71o9jpS52lz3RYUi3bZFJwRI4k2
	172xESTKcngl7xyB+JRHxmJ2Ue5dlLbblNVwEDHMfNsNtM3+hshJa6H6MHS5tQbj5
X-Gm-Gg: Acq92OEg774GdWuALbDGjiTQB9l3WdNI1CiVC5n3HchMD+LI5p76Wpd0p4ILFh/GUwc
	mpg4qjA35fDUAyd4wtfTWJ0+tliCgLEJKC/WN3ni5K14S3yAcigaifwmp+Gsxzf59Ju3F6RY3PE
	qWleg1yTuzOjztIRMaK10C0wR4mHCCbR4JLG0+hvCvm5IxjzJYrF9je8J41uVGKZVACv5uXA8As
	ont9d7VOPOpqaMFTGbD9EhQmSJEUJFIlKVXfAdml1vRFKSeWjscz994tPspzahGCwVdTEkeEdUG
	b1BPBz75PwzVWcu8FMws8Uwzs1JAtPifq7GvYpwLfUn83duShKNh5jGMZyk99XW1yb+oMKdBd/J
	yguhMnB01Hlixc/1f06r7cQ3/R2FS/5Kg/oEwW3RsSLRfu0w7nw==
X-Received: by 2002:a17:90b:2808:b0:359:fe72:3559 with SMTP id 98e67ed59e1d1-368f79c3c81mr2555097a91.21.1778675147758;
        Wed, 13 May 2026 05:25:47 -0700 (PDT)
X-Received: by 2002:a17:90b:2808:b0:359:fe72:3559 with SMTP id 98e67ed59e1d1-368f79c3c81mr2555027a91.21.1778675146795;
        Wed, 13 May 2026 05:25:46 -0700 (PDT)
Received: from hu-nandam-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368eddf4d84sm3651894a91.3.2026.05.13.05.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 05:25:45 -0700 (PDT)
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 1/2] pinctrl: qcom: lpass-lpi: Enable runtime PM hooks on LPASS LPI SoCs
Date: Wed, 13 May 2026 17:55:25 +0530
Message-Id: <20260513122542.3726319-1-ajay.nandam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
References: <20260508113636.3561383-1-ajay.nandam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDEzMCBTYWx0ZWRfX5bQtnXe/yjDr
 UYB0cB93a5G49jmvq3NTgM9+88/rnQ2SHgNr2mFEGtMGJ/jZTn5y1gFdLq+VzGUE/5oDdpscgP/
 yRtiBHK3lBDNldVZag66uo7WPgBw3/cyvY0P00kyvMPpgg6jL1W+rl5RuuOtHqHuoNkgJptj7kC
 /c6cVZNqgu3A8+fER/cxRgW9chTeCwEllIsVvNF+Dyie+4wOCNFsGy1od9Sjai3YKveMQ40b4mU
 2Tt22S8bWTRCrMPSXbKpDrGLWc0BYkZRsujdE6BAN6fPjJ4cixTD4cD/oTiIRBx2QUoabdH8pxz
 huO2YMDwyCtkXGT4OX/Cld8yvtPO9R6C7W0YBbAbIlDlCh5Uvf1RUSCFHOeW0ZfcaJoDaXEyN7O
 NBYULfE+BM2rHzqfxombsVCv/Hs6AWNfYGGKVfcYNb9TDQYse0pLN0CSwopnue4Z3nkwC3dn8Gg
 ov4UfR/sqY100MUpN+w==
X-Proofpoint-ORIG-GUID: KvyqjXJE43DK_H5vhBsK2L-0kc1cJ3f0
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a046dcc cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=PNqn8kwc-IHmyLqyaEgA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: KvyqjXJE43DK_H5vhBsK2L-0kc1cJ3f0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130130
X-Rspamd-Queue-Id: D5628533090
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36747-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajay.nandam@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The LPASS LPI core conversion to PM clock framework relies on variant
drivers wiring runtime PM callbacks.

Hook up runtime PM callbacks for the LPASS LPI variant drivers touched
in this patch so they are prepared for the shared core conversion.
sc7280 wiring is completed in the following patch.

This commit is a preparatory NOP on its own, as runtime PM is still
disabled on these devices until the following core conversion patch.

This is a mechanical per-variant driver update that relies on the
same generic PM clock flow (of_pm_clk_add_clks() + pm_clk_suspend/
pm_clk_resume()) and DT-provided clocks.

Runtime behavior was validated on Kodiak (sc7280).

Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c    |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c   |  7 +++++++
 drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c   | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c   | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c   | 11 +++++++++--
 drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c   | 11 +++++++++--
 10 files changed, 80 insertions(+), 10 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
index 3bf6fe0cf1bb..72b8ffd97860 100644
--- a/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-milos-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -203,10 +205,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-milos-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
index 0e839b6aaaf4..1a61316c8c47 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc8280xp-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -173,10 +175,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+			   .name = "qcom-sc8280xp-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
index 65411abfbfac..7b5aacaae7d7 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm660-lpass-lpi.c
@@ -10,6 +10,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-lpass-lpi.h"
@@ -145,10 +147,15 @@ static const struct of_device_id sdm660_lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdm660_lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver sdm660_lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sdm660-lpass-lpi-pinctrl",
 		.of_match_table = sdm660_lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
index 858146c408d0..0a31f7ad2e0d 100644
--- a/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sdm670-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 #include <linux/pinctrl/pinctrl.h>
 
 #include "pinctrl-lpass-lpi.h"
@@ -151,10 +153,15 @@ static const struct of_device_id sdm670_lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, sdm670_lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver sdm670_lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sdm670-lpass-lpi-pinctrl",
 		.of_match_table = sdm670_lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
index c0e178be9cfc..75bafa62426a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm4250-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -221,10 +223,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm4250-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
index b7d9186861a2..05435ea6e17a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm6115-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -141,10 +143,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
 		.name = "qcom-sm6115-lpass-lpi-pinctrl",
 		.of_match_table = lpi_pinctrl_of_match,
+		.pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
index c27452eece3e..656f22da7dde 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250-lpass-lpi.c
@@ -7,6 +7,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -134,10 +136,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8250-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+			   .name = "qcom-sm8250-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
index 439f6541622e..a79f99ec6df9 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8450-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -202,10 +204,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8450-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+			   .name = "qcom-sm8450-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
index 73065919c8c2..9037ef0020da 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8550-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -210,10 +212,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8550-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+			   .name = "qcom-sm8550-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
index f9fcedf5a65d..513ddc99dd37 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650-lpass-lpi.c
@@ -6,6 +6,8 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/pm_clock.h>
+#include <linux/pm_runtime.h>
 
 #include "pinctrl-lpass-lpi.h"
 
@@ -217,10 +219,15 @@ static const struct of_device_id lpi_pinctrl_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, lpi_pinctrl_of_match);
 
+static const struct dev_pm_ops lpi_pinctrl_pm_ops = {
+	RUNTIME_PM_OPS(pm_clk_suspend, pm_clk_resume, NULL)
+};
+
 static struct platform_driver lpi_pinctrl_driver = {
 	.driver = {
-		   .name = "qcom-sm8650-lpass-lpi-pinctrl",
-		   .of_match_table = lpi_pinctrl_of_match,
+			   .name = "qcom-sm8650-lpass-lpi-pinctrl",
+			   .of_match_table = lpi_pinctrl_of_match,
+			   .pm = pm_ptr(&lpi_pinctrl_pm_ops),
 	},
 	.probe = lpi_pinctrl_probe,
 	.remove = lpi_pinctrl_remove,
-- 
2.34.1

