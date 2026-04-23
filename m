Return-Path: <linux-gpio+bounces-35422-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4G8UKL5Y6mkhxgIAu9opvQ
	(envelope-from <linux-gpio+bounces-35422-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 19:37:02 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCED45598B
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 19:37:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A2A833013716
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Apr 2026 17:36:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CE93A9610;
	Thu, 23 Apr 2026 17:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jezsDCGL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HlNHekFC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC183A875E
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 17:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776965761; cv=none; b=Coamxcsaa7IdBRzvNbLD636LrVNT+hApZvklx2rqcYgtIFnCF4hMK/IpHmuXxMHuYYwQO2xQLAphDffkvZcr0V5Fq3/939E7x7hJDEEiKVC6CIGxd4YQ/hjJW6SPF6HpvNOtUlcQS8qDI8tZGHDwkI4CLR7RMvqcGcvC4wJOyCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776965761; c=relaxed/simple;
	bh=rzBTGpFpXPu/D8syEj5N48jKz/WGXbCL+5Hqmh68jC0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EVI3N7zQ6iq3FzJXGnlAupPUsjx155moV+E3JCb4+uFHToaz7Pn4is5rOX6EMN4u+bUvP5GD1vyayE1MQclgLZVYq/FJ/6nf4Q0ulwUXlL/A1fasQKZWRMmEQ4Jp54BOCNbHoNYfNElj8wddvTdM213Yt8n+6amKFAhMy10jH1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jezsDCGL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HlNHekFC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63NG9LUK366240
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 17:35:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=v01zgbIceFoQo2akt8oD72VOejP2Vjve3dK
	tP6YQe/I=; b=jezsDCGLTM9CeNhMdSKXCVBNjQi5UbkziBIh+Y/rOEUwmrHlB4+
	frLQIEhYe5dRKhpAh+ehaf2QUXBVm1Hii1ZZnudNmg8fGGCUO66BmSIahalG0Pa7
	YhX8mHnBYNAB+XWs2eJ1EjojvpLC7nvf2tVPgwFx9jIGRpfE4effrJOu5/rDkVyr
	vV16Z8GGiLDeTuMVTEZJ1UJPuSyDndz6Qz8ucBhNoId+4QY3SUyJZ6Kg10buOrLN
	IEEVzjaPFuXi5t0Wdj6q5U37GKUC8pfREyRJYVyxDnSJXSqZJZ3gpwjHgzWdCM9n
	HjDrDDM2xHHhH12l/cE8E+GS5G7OJaQnx8Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq35rcpch-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 17:35:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56f694e2ab8so6051530e0c.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Apr 2026 10:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776965758; x=1777570558; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v01zgbIceFoQo2akt8oD72VOejP2Vjve3dKtP6YQe/I=;
        b=HlNHekFCcPNFumF7sfB63v9zGsJXmPKrZh3WZMxXPynQj6SsE8JOLVA8hgyyXuaBI5
         CkMOBenx+1QBEN2ZLUgF16fGrQpJ0OkhcbChhKRUhLEYdPSszONEx0MpeJAKYeB/eb6R
         C1iC4UU6yLpkS5hCAEWqTVYHU/LsUdgY7pCr5/xsTUn7ovqAfDx/Xyj7mvRxxPaSObDo
         6p/tVtNszunoKqbEvbkm9MxSrl/DvrSR5UCOx2zWp1Jfv3jU7DbVc190dakeow3/lgxv
         +VwjmaTB5Y6Y+sGfY7nFCcLB02Ey2pEDOPpRUaqDleQ1j9rukWxvTeB2Dz6RAZw4gnR0
         xzrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965758; x=1777570558;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v01zgbIceFoQo2akt8oD72VOejP2Vjve3dKtP6YQe/I=;
        b=jiTaWGaMatkHj7hJ+VxW4iEMR+2h5f8tCOGNlGFIz4UaWrJmZkwUhjBUcx9XruonHq
         Y/+pawUfs1FaUvcO6raY4IibvBUMtVNdU3+9/dXopAUfKP6i0amzcPdAPbo+O0bMjx2Q
         W7KSwLa5orNM3b9YAndX1S+Ftyo7Liv4fKZhWZ/CvM59P9SRnKz/CS9dBBG/JdHl25Xf
         JSNciyDad22Nw62J4Pvjpm2nSqREUqNLqBnmA+3eQN5xJ5YNzWkChs/1vz+hoW+IX2Bz
         Dph34n2uB21VMVvbbSPXWeW5GYO0tahirX4zg8cuzCK3v1YIwSs5qBynG1+TRzUkSoYG
         zRoQ==
X-Forwarded-Encrypted: i=1; AFNElJ8peNtpPMlyB4Q2V7N8KDiFCVDvCbwZ7odXWDxta+gvATu1g3g26EK+epe5obO1n1GPOQXzOFwLdX+X@vger.kernel.org
X-Gm-Message-State: AOJu0YxGwUPL5yEg/TVe88IMxkd+XcytqD3XgLzAJRmhOfOLmc05S59q
	mUf7siDN1c2ktF38hQxNOV7FNrJRplzoe9qLRqjUe0WqgwJRWvqqKwyskHwq4CBZ1vbnKsp1eY6
	ZWUoa+tVde4pQUdy3I81UkBUmiCiDIMTsRiFzqp9lW/HyxwgYW1OraJvxwvH9lzJp
X-Gm-Gg: AeBDieukxdUqDdrM1ecqF+BdBhYAVKHaYFoGiX065Y9kO7Wv5G0YiRVuQwHJ9dEd6Rj
	95rjIy1ZMxbJftbuiTk19E0g9BrVX4eFPijJuLVPtt2eCepzi3T5UlI+BnDj25wdDOwBwrVnkww
	rwH1AXyoDF9XoF1PGmqGpIrZZ2Di9gVM0OELHcsLhCauHpMer/0g1rodAeZFmtmVGhsW57xydoo
	lJ8uY3cRG9RQILgIrOOgzAsfgzxjxMG7bQfJpbFHIHFFkiH5jURFMM6X/xbJU+3f5atCvPEFD3b
	QzHwGek1iaQNTteRlAy8WIOR4kLsl5gb6ginFph8bcnnLOjzkSBUN5U7vXgOA0ipnpjsDOppFx6
	oV3eXPeVCRtkewnW/hR5hLSPOWTDfZ5ZEVCGFlQ48MifYgaM=
X-Received: by 2002:a05:6122:d25:b0:56f:6d27:cadc with SMTP id 71dfb90a1353d-56fa589b2f6mr15057323e0c.7.1776965758383;
        Thu, 23 Apr 2026 10:35:58 -0700 (PDT)
X-Received: by 2002:a05:6122:d25:b0:56f:6d27:cadc with SMTP id 71dfb90a1353d-56fa589b2f6mr15057300e0c.7.1776965757975;
        Thu, 23 Apr 2026 10:35:57 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a557412eesm99064025e9.9.2026.04.23.10.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 10:35:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: =Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] gpio: qcom: Unify user-visible "Qualcomm" name
Date: Thu, 23 Apr 2026 19:35:54 +0200
Message-ID: <20260423173553.92364-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=rzBTGpFpXPu/D8syEj5N48jKz/WGXbCL+5Hqmh68jC0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp6lh5OCnPvJp6iYecZeFENund0W1fmpQMgl5Oq
 fj9au/xwSKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaepYeQAKCRDBN2bmhouD
 18AYD/0Qpd8Zvadzare6t/o/enMGE0slS8tCLBceQ3cNRHQfphviVASTcVLhhI7acSc9b93/uva
 vP2LDkgvbFpHutfzRPk9f6bRttx8jSHBGnuzXgEg7jwhGcnVlfvb/er3U74EDLPTsS66y7VM8vp
 alxc1tLFh3sAttxKnjuBl4C+Wxs6dn+XlBeHA1SXsUfYa+o7qfYwgD9R85JXwsIdvFysbwqISCM
 cZ7dsk85D/Jvf2ytSsPAIVSXyDfmwVLZWEhZEeMjqtMdaDzj71/ADPB5n84JLBsOHIYcVy/bAeJ
 N8N9Rg3ZIUDY9khb58fihlSLaRocpFVUt3vx0b+v0tM24p/raPbHIOWzmZcbzOihs2qWeXXh2DZ
 xB6M9rFdbCvVRIBIkVS6OUUngjj34krsLpbm1bpbLzrpQJo2H0Va47xeoASBivDXA++ueenVUwm
 jVgTE0xto1a5pBtruUJhcwjWMA291V9moWunjyCUyalMFfxbLdHHYZRXgUfc3+j4s5lGp9h2TGf
 dgwHv0tXtwJEVGgCeGl9itB+ll8SaTmOH0B6wk2B2EWmxBZ89RuJMWumELlT/Bd/B6YppauG2sI
 cEuL//qBxEPlAFKaaZzpfLplK8pUy01q8Ty7QNGc59WCtp5Uj3ecMv7RM1U2ECl6ie1Vu8oe7r2 1lChpXhmNi0bzRA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDE3MSBTYWx0ZWRfXxmdCjsgljzcI
 bWBDfeTx4XYBZMMo0jPvltM59cgs7A/5FrIBHE609REV2r6FClEyMzLxCj6mGKdjhsiG6btNqD6
 fKYgKiZDgOAW8jNIRIHdK/xix+gdGZ3teDSQGJVCP/Cc2gwUYPyaJkEc35zOvsWKrON4SqvBY+7
 cYlCHF8wv2vjaqhJW5wU4s1gUVEzOtl8EuhgzkzmepM7OcidDx09TgQUkLKtC+WgrWydk7LOl22
 +ZO3WyLv+TH/2RoihmvephsbQ8wrDg/Yunl6f89h4jtP/TOX6PQtf7ozvG5v0Yt3y1JJJ8gp8Zv
 H4+UAg2GLtbl6HJI3CdJ5DeVV36PsuvFe43Ypq2IfJ3WXcJNECcY6uYmQASgS9mj5H2ipJiuhuL
 g5kjxI1uFCP+Io6O0FGKNqygptX5toRti2fK2dBVesUU3HYV5Q9gByUNpOR1YW36NDns23m/yiG
 LEBOKdEMlSMYG067aGA==
X-Proofpoint-ORIG-GUID: -WT92Fgpy-YCjxWDTz8JuHj5FvdU1YRl
X-Proofpoint-GUID: -WT92Fgpy-YCjxWDTz8JuHj5FvdU1YRl
X-Authority-Analysis: v=2.4 cv=f5J4wuyM c=1 sm=1 tr=0 ts=69ea587f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=qLWlyxIRwKzE2EnybWcA:9 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230171
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
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35422-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5FCED45598B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Various names for Qualcomm as a company are used in user-visible config
options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
"Qualcomm" so it will be easier for users to identify the options when
for example running menuconfig.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

And "Qualcomm Technologies" has even variations over the tree:
Qualcomm Technologies
Qualcomm Technologies Inc.
Qualcomm Technologies, Inc.

I am doing this tree wide:
https://lore.kernel.org/all/?q=f%3Akrzysztof+s%3A%22Unify+user-visible%22+s%3AQualcomm
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 020e51e30317..f86e25da964b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -806,7 +806,7 @@ config GPIO_VISCONTI
 	  Say yes here to support GPIO on Tohisba Visconti.
 
 config GPIO_WCD934X
-	tristate "Qualcomm Technologies Inc WCD9340/WCD9341 GPIO controller driver"
+	tristate "Qualcomm WCD9340/WCD9341 GPIO controller driver"
 	depends on MFD_WCD934X
 	help
          This driver is to support GPIO block found on the Qualcomm Technologies
-- 
2.51.0


