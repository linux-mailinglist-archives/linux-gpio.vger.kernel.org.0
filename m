Return-Path: <linux-gpio+bounces-38171-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9ajNEawBKGp+7AIAu9opvQ
	(envelope-from <linux-gpio+bounces-38171-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 14:06:04 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9498065FD80
	for <lists+linux-gpio@lfdr.de>; Tue, 09 Jun 2026 14:06:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OFmn2l3V;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SkdeTIZn;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38171-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38171-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 72BE830547D5
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2026 12:03:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97C9B40BCC1;
	Tue,  9 Jun 2026 12:03:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D22840860B
	for <linux-gpio@vger.kernel.org>; Tue,  9 Jun 2026 12:03:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781006586; cv=none; b=aJPgbPb5E0bGmjUvfblHaNtq6aAfU1MNFtdEH92zLT3J6uJE+CmbqfPHowmLPvQtpgbIK8oz9WTq+zb01+wNpzB3YktbZKw/PI4feioWbN2TcQFSukL+vJ76vy3ol3L+Zcjgi8+lNDfQR9eVE/7HPpgxadRoluntw5AfSYiOUeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781006586; c=relaxed/simple;
	bh=zBdUZbGcGqZEcCOz3U5KztOKz87HIGIxtkYp4+uQJuM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=esZjTuwj+xpmHXOQcU869UFKxdEye6dudPaZMpmN33PF2L8tTOhIx7kVIC03RvLnh5R0Kb2nosK34wDK0sT+msjVYc3mMxwgiyBHmKk+3g23i7yvtmxold+qvT+fS38k7i/pcMk+wbgqE4GRtnGnAxJKNA0+gnz/32laS8tPTAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OFmn2l3V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkdeTIZn; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Bndsm2155577
	for <linux-gpio@vger.kernel.org>; Tue, 9 Jun 2026 12:03:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=W2tpd7e5j3M78eFYLPs/YQ
	mCt722o1ipsj2v9m4MOJI=; b=OFmn2l3VE9FvGdeo2AonKfy1IfZs+Oo03gDKAR
	+4vX1PcLKBOKaK0SnSm3sjxwAab2F70pX/ItdplSGFItZo15MBg+K345QOHNejc7
	osP0OTbYeVvUmIB5mzcXrpiG0SRvnCdFOE760ANAnRf1YdSK/6LQhV+H9oK9t7nd
	sjJbPzPyuWTwiw4LodjFWqhuvdYgMj97vDAnXVUbNw5yuugENTjSz1bF+gdkqZ2E
	XQwpPbsZEBbOredF8eDAy3jybM1H7MIDaKZnFQv6cxLSvFw+lQzyRsCWu6bsdvXJ
	4pDPw+nhcVZJVERbjq3y/QK6ZtmxFPjoGG6W17qlDwFclveA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3jrmqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 12:03:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3074d4102a9so1824599eec.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 05:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781006584; x=1781611384; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=W2tpd7e5j3M78eFYLPs/YQmCt722o1ipsj2v9m4MOJI=;
        b=SkdeTIZn4956SgfzF8APrRZG28z3TMeMPoMohsgDfxUDBVorGVpt6Lm+PhAEX3NHT3
         aX5GxRZqdEqsFmP3xkTRUoNqT0oSy/ZeaseqahWfvoOETq9BgoWZX39WKY6Qh/GK4d0H
         6awvoOqMj31boY0ZieyXR/qo1bmjZX553jc7JFXHGpRw3eLO/Fx77tvlOw/TDw+fuWOB
         cgJR5p/Y7bjzF08J9mNnL8aEwjh0u3HYFa6OxbYAKCj0+aRoPKoVxkKStjVnv9BnBOF1
         CuTMxBSe5sPq4heKL5Cq17//acO4xiRq1qz8PJ99v/GXxlxILnJzmZVe8C3bQFLiYE3s
         JUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781006584; x=1781611384;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W2tpd7e5j3M78eFYLPs/YQmCt722o1ipsj2v9m4MOJI=;
        b=pShdXJDn/9te/EXHwbrJKeAhmSgLAJC/MZhUubuNVIhtBM6r2oiUhxX4ojXTpTFerd
         /SrKnAy2h9pIBuYHarmS0toNZ9GmTSfaYNEpG3aWkgMW75GiU3RAGRP7BvtpDtYnb5TM
         Ky3FRhQyQYqprNc/jpqRupHhiRCjW1QNn47U0co19BFAP4JIxzmUEMEb2AjsZvywvmyf
         PLxvslVUJdQg51VJr59Ztl9nbqFG7qp0mPHwb6u2vV2df4z5hzLkANrP9gFoH/NjtSce
         n9tTxlwDKqc13yvoe6+aOBfqMmhYiwu6SZ4kImgeCfrxKdrLzaIPDKA6dY4kOeq+g1Bm
         Mehw==
X-Forwarded-Encrypted: i=1; AFNElJ+MbrACKRfY7EN1xQd4/oFrG5qqLS2EHLDy8lQHMNPFMiNCul2ohbbX5mMx5JjOuTRieoBPKXRijbth@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc6W/EJ+aZvEJqXTkh7e8WkaFylCRYNm777bnNSJ3gQ94z8U5v
	hWvGV+lPsL6XfcYvYLYGNfHvAlgwTcIYZh0pqIsztdU1qD6Mdoj4qpnxLntCvVlCvxv22pYGr6h
	C6Q9SV3YsFyEqDJKTvLy/6/VfGGrSzyk8wKFSehGx/hz1V6wGzEBnY0EhSNW8CugUaRRrFrPa
X-Gm-Gg: Acq92OG+hnE/8WSwbqPphtRcipjl78IaaCb3SDQAv42Q36kgVFb74n9RXaTlXj1GwFJ
	xdrHRFMjdtUk+SmAjzCu9e5hZelCF01Dmy1Qs1yu0kMvGcqT5i22ANuDWZoFWEnTyhYiZUc2rGV
	K2f41gmv5cnQiM+6dkY5ZT8TwdjIO1GKlDE+diBsq838ZQfecnTTxrcXVhfFo85jdvctNxNjujC
	Hy0XMZvclwD7ChqmVFFldcR+nForeOxAn6knk4p0Lgw0x0pm+iBox7dBn9IrXu7HnDbQGJ10uN8
	UhwO+XLeQeytwzeBd21bKMFQ/leg2qfiCbAA/5s+lLgU9954pgspenh2iyJHHZp64kAWS9L+ZPR
	XMCfWWOXlCB+0fo7BZLPSaYTKHXcM9SwT2zJM
X-Received: by 2002:a05:7300:7314:b0:304:641b:12fd with SMTP id 5a478bee46e88-3077b22b54cmr12905424eec.27.1781006583334;
        Tue, 09 Jun 2026 05:03:03 -0700 (PDT)
X-Received: by 2002:a05:7300:7314:b0:304:641b:12fd with SMTP id 5a478bee46e88-3077b22b54cmr12905348eec.27.1781006582655;
        Tue, 09 Jun 2026 05:03:02 -0700 (PDT)
Received: from hackbox.lan ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm67543251f8f.5.2026.06.09.05.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 05:03:01 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 09 Jun 2026 15:02:49 +0300
Subject: [PATCH] pinctrl: qcom: eliza: Add missing sdc2 pin function
 mappings
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-eliza-pinctrl-fix-sdc2-gpios-v1-1-cce631b7e7dd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOgAKGoC/yXM0QqCQBBG4VeRuW5gXWjLXiW60PHXJmRddiwi8
 d1b6/KDw1nJkBVGl2qljJeazrGgPlQk9zaOYO2LyTsfXHANY9JPy0mjLHniQd9svXgek87GTk6
 oOx8anI9UFimjFL/99fa3PbsHZNmftG1fK88OeYAAAAA=
X-Change-ID: 20260609-eliza-pinctrl-fix-sdc2-gpios-0c7e1b269e85
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=3545;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=zBdUZbGcGqZEcCOz3U5KztOKz87HIGIxtkYp4+uQJuM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqKADuUTli4XWxDq/56sGH9OY7tpZGl34OtJSg+
 AhUBQZxireJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaigA7gAKCRAbX0TJAJUV
 VuEYEACMr8Q4ik2+IGJCYAkY6euJ7VMILh0GxOaECbz6yjdSSzwDYlTgMLxsCEztRRQ3rtR2L4a
 9wo5klecahu6E9gc2WUVzrPy9w4vQuOolSzaNGEZDfEIN9dJxGC0/t0dtjUt2UsbLtItJYGKWyX
 gdhCVWt0fy0hHncJXRxRu7RqznHWsBVXIfHPN9NRKYMBtlGPsoihLaLo55Q+kkYWZfo3jD0nijJ
 9z4uCTJwUzl2oP0P0Hf2B5ueLK0L0BSb/BAszXQUe+Lnfee9WFHFCvGTkJGKEEbMgjoFcLosbCc
 9HBKN26zYWT9npXwA+9da3AxjqdaN5KXzSGDI5yXpmDe8Im0qKW/binLnkrx6vJJ6wIkLwmmh+8
 f21+ghqF3kVgWprzLRa6sr9nqIR1PqaHo3Qw/qu2gGmTFpVxCXdDcoMAE18HTEmrRlPTlWx2tqV
 LpF6AO0txiRp2CW/wCpiysDBapYqHVUqTcfplsuXbzrazpUT+X/1K8vAqN883H0tw3Sy+caE2eI
 0mr9jZ/7Px32n9CKw85awJvg7LkleUfgEKWgJKVu+o8IywITXfFY/QGtvmMeg7FQKHWwldStWxb
 JGvW1ULg/HzjQSVVMSCvQmMCAtXNGyxH5a5B1XVJ9L4YaORoi1gH04tkIpFrB08+WKRp9oET9pp
 E7d2sKclIUA/6Yw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: BJc88g9rBZa8HGrVtKorI-ojDp2TJs0x
X-Authority-Analysis: v=2.4 cv=aa9RWxot c=1 sm=1 tr=0 ts=6a2800f8 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=D_uGzcMVqVB47EH32tcA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDExNCBTYWx0ZWRfXwGtl20YEz2Wv
 ygH5JQdvNcdycp0RqJMQOGB5KiGRQo4QSv368rc9TJbvhtnohID5FS8TBDYx3dvN3VK89xCGuYP
 EbklpLlmmnddaFFvi8EWg0rbVidzb+i25OUsDq/m42pU7RmTzR5talBAGHkbgZR59ljf7Hl31Q+
 ioYygIJ3c6rPzwaIpv9jzq1xajf8qsG6M8Bpqed1J5vkLHCrfRS6TTJxX7v3qN8Kk/ENSy36n6n
 VH+SBHxFA6SQ+fZEeN0/MHgMsHfv/3fqL5PY1SuGhEm567VUHEyFHlLCfURWKTDVEFumW9PYais
 WeCO69KETjFHZmThTauo7NhFcqamPGvA+zTXOmcf5CsL/pcjNN9xih8Apps/U5gEEKRG8DwTvBt
 eymKvAD87xyycIz443uA3D5lmnYHDzIUUCOv9eyvFSpFfvJfdvPv+5bNTq3WXHjGZGgZvzx14Kj
 6ioEGN/XP+im7VVEvEA==
X-Proofpoint-ORIG-GUID: BJc88g9rBZa8HGrVtKorI-ojDp2TJs0x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38171-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:abel.vesa@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9498065FD80

GPIOs 38, 39, 48 and 49 support the SDC2 DATA function, while
GPIO 51 supports SDC2 CMD and GPIO 62 supports SDC2 CLK.

However, the sdc2 pin function is not listed in the corresponding
pingroup definitions, preventing these pins from being muxed for
SDC2 operation.

Add the missing sdc2 function mappings.

Fixes: 6f26989e15fb ("pinctrl: qcom: Add Eliza pinctrl driver")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/pinctrl-eliza.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-eliza.c b/drivers/pinctrl/qcom/pinctrl-eliza.c
index da2fead23aa1..58545e14710e 100644
--- a/drivers/pinctrl/qcom/pinctrl-eliza.c
+++ b/drivers/pinctrl/qcom/pinctrl-eliza.c
@@ -1402,8 +1402,8 @@ static const struct msm_pingroup eliza_groups[] = {
 	[35] = PINGROUP(35, qup1_se1, qup1_se5, tb_trig_sdc2, gcc_gp2, qdss_gpio_tracedata, _, _, _, _, _, _),
 	[36] = PINGROUP(36, qup1_se4_01, qup1_se4_23, ibi_i3c, _, _, _, _, _, _, _, _),
 	[37] = PINGROUP(37, qup1_se4_01, qup1_se4_23, ibi_i3c, _, _, _, _, _, _, _, _),
-	[38] = PINGROUP(38, _, _, _, _, _, _, _, _, _, _, _),
-	[39] = PINGROUP(39, _, _, _, _, _, _, _, _, _, _, _),
+	[38] = PINGROUP(38, sdc2, _, _, _, _, _, _, _, _, _, _),
+	[39] = PINGROUP(39, sdc2, _, _, _, _, _, _, _, _, _, _),
 	[40] = PINGROUP(40, qup1_se6, qup1_se2, qup1_se6_l3_mira, _, qdss_gpio_tracedata, gnss_adc1, ddr_pxi1, _, _, _, _),
 	[41] = PINGROUP(41, _, _, _, _, _, _, _, _, _, _, _),
 	[42] = PINGROUP(42, qup1_se6, qup1_se2, qup1_se6_l1_mira, qdss_gpio_tracedata, gnss_adc0, ddr_pxi1, _, _, _, _, _),
@@ -1412,10 +1412,10 @@ static const struct msm_pingroup eliza_groups[] = {
 	[45] = PINGROUP(45, qup1_se3, _, _, _, _, _, _, _, _, _, _),
 	[46] = PINGROUP(46, qup1_se3, hdmi_tx_cec, _, _, _, _, _, _, _, _, _),
 	[47] = PINGROUP(47, qup1_se3, hdmi_hot_plug, _, _, _, _, _, _, _, _, _),
-	[48] = PINGROUP(48, _, _, _, _, _, _, _, _, _, _, _),
-	[49] = PINGROUP(49, _, _, _, _, _, _, _, _, _, _, _),
+	[48] = PINGROUP(48, sdc2, _, _, _, _, _, _, _, _, _, _),
+	[49] = PINGROUP(49, sdc2, _, _, _, _, _, _, _, _, _, _),
 	[50] = PINGROUP(50, sdc2_fb_clk, _, _, _, _, _, _, _, _, _, _),
-	[51] = PINGROUP(51, _, _, _, _, _, _, _, _, _, _, _),
+	[51] = PINGROUP(51, sdc2, _, _, _, _, _, _, _, _, _, _),
 	[52] = PINGROUP(52, qup1_se2, pcie1_clk_req_n, qup1_se2_l2_mirb, ddr_bist_complete, qdss_gpio_tracedata, _, vsense_trigger_mirnat, _, _, _, _),
 	[53] = PINGROUP(53, qup1_se2, qup1_se2_l3_mirb, gcc_gp1, ddr_bist_stop, _, qdss_gpio_tracedata, _, _, _, _, _),
 	[54] = PINGROUP(54, qup1_se2_l2_mira, qup1_se6_l1_mirb, qdss_gpio_traceclk, gnss_adc1, atest_usb, ddr_pxi0, _, _, _, _, _),
@@ -1426,7 +1426,7 @@ static const struct msm_pingroup eliza_groups[] = {
 	[59] = PINGROUP(59, _, _, _, _, _, _, _, _, _, _, _),
 	[60] = PINGROUP(60, i2s0_sck, _, _, _, _, _, _, _, _, _, _),
 	[61] = PINGROUP(61, i2s0_ws, _, _, _, _, _, _, _, _, _, _),
-	[62] = PINGROUP(62, _, _, _, _, _, _, _, _, _, _, _),
+	[62] = PINGROUP(62, sdc2, _, _, _, _, _, _, _, _, _, _),
 	[63] = PINGROUP(63, resout_gpio, i2s0_data1, cci_timer, vfr_0, _, _, _, _, _, _, _),
 	[64] = PINGROUP(64, i2s0_data0, _, _, _, _, _, _, _, _, _, _),
 	[65] = PINGROUP(65, cam_mclk, _, qdss_gpio_tracedata, _, _, _, _, _, _, _, _),

---
base-commit: a87737435cfa134f9cdcc696ba3080759d04cf72
change-id: 20260609-eliza-pinctrl-fix-sdc2-gpios-0c7e1b269e85

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>


