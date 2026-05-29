Return-Path: <linux-gpio+bounces-37689-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKqRGouOGWpTxggAu9opvQ
	(envelope-from <linux-gpio+bounces-37689-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 15:03:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9A66029E9
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 15:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9985931131E7
	for <lists+linux-gpio@lfdr.de>; Fri, 29 May 2026 12:56:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF7D2FDC57;
	Fri, 29 May 2026 12:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aa2MPFjV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcnsZIz5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885B42E8DEB
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 12:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780059373; cv=none; b=AmbMZbLok692L7/wjSKhN1vvHUTO3Ia2bFxkutHt/SRR3/Q+PrxiC9w5Kz7KpTav6OoWQ4T1+EXOpCU5RjiEc4Ks03S/ysD9WqrGS3ON8qO6K9B+Edus7hSBL/igknxSHLQBdFF6ATrqUgYXwa7c8pDKPXhgO8lWcCgeArqmtJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780059373; c=relaxed/simple;
	bh=iTiYhpelLpWGgfB/Al47OggJjvyNnV4VQ2i749ZYaSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dzKoDTM5cU92IP8m0IK5ZFUUceoi2IqlbZo3kIIMOaBhQyDw6tVy5iSWCMDKUTB/Hy/ZGVsBI5G9LV+H7Mw0dyHrYYlzatxRZqGGoIer8ZFi86HfFPRo7Way3HN73doYbR4VOPX3vcTCqRd/OW9jKJxwXdqph8UfMpjVtUwIwbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aa2MPFjV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcnsZIz5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TC3eKU1540734
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 12:56:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9Nf90Hi/6HP4GIlolES7iM+gOdhTefJ3Bt3sz65J5A=; b=aa2MPFjVxtv8LIVq
	52vVKuSsxgR4uMpyl6tFJLDQc7pGvdnlHJp+ywSnl6SAxO9GecnekOShcNbd2+CE
	TW6nQ1s7NkzHfGC4TeDd4QBCLU23X2zLXk8fiUXWm5W/VBZWCU2mlAr6c+Oa+LUb
	4RYI/xIJxecLXA6QGYjBTAwnL+R0cmteq+5Z2Tifz5ipnWjqOZM3NNUwbZQH/SI5
	BEWox4F7/kIiKUKH6szacin8h6cYxeAfW/K/T0nVVByB7FIgHB4dbaKKf1xRMZ0m
	ZF59vLmvxuhcnxWdUEgfFGVjDYMTQU6z9PFaxxPL17jXPjV0C6OodMsbXojLwTuB
	L7fdAQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eety4v5yh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 12:56:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c823549b1fcso19963528a12.0
        for <linux-gpio@vger.kernel.org>; Fri, 29 May 2026 05:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780059370; x=1780664170; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T9Nf90Hi/6HP4GIlolES7iM+gOdhTefJ3Bt3sz65J5A=;
        b=jcnsZIz5LfYbZIPcDbAwFmQGqGfUciiCf2qTP2XTVvxmmbg0mtuWA5twGhvgSQKJWk
         PMCIBMl/QOUGTiDxN21tpOvxvaHE0AQzxQwmnvB8MgMSOZzUl7V/G1+/KCbCh7HUbtjt
         swcZxH45ey+mryA8Erx+mh2cnp7g5j/FpETuwDJBCiYzsHY0hiP9XaTrH6UbpTa59y8I
         XwSrr+Wv0gMgDLwnrYWDkFLIMxh92agwdp/QXIsnKMye/HGu51l0zQ8TzC9tpiUPN0ah
         k/QDhLu6fncgoUBx67GbD7+p60GgMbglCzNg1GVi2QbMVxpCLYjtYCrgNhmowECvsWKf
         xqNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780059370; x=1780664170;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T9Nf90Hi/6HP4GIlolES7iM+gOdhTefJ3Bt3sz65J5A=;
        b=HdBHsq5HXjZyHlePaEZ7KcLk24JTvvRG9/TLqE6QKzUUB7vBmY0yhpphdreGV1tu/6
         PZdRgaCqzs4rg7noNvR9/SumC/IvNDUVf6ZtrUpyD9dlzwiO3Chccfv54qDGqHdKP6Ih
         3xSKzeC2qv0ZygMc4FDmn5Oi1eXSzANHBIcDhGqgD4sO2p8Nj+8ptmNF52/zO3WtMCUh
         HW69NIYVPLr2I8qbzgucAQJlHpm3g/9+8p1MyMAUME4XG3pvj2GtU3OwmnITlbBf4crB
         3YNcp1NWsExi1rsaRaRNguq97zFzsVCW/lD5gh26jbwZQ1cGMan/E7om6Qdy3AoH9wz6
         S1fQ==
X-Forwarded-Encrypted: i=1; AFNElJ8NnyB4WTVZzIz1pnWwBVNm4gbVJNWbipA+9+p1Q+/EShxUZHqJHoc0xjrB5Nt0IbMp5ZSeg2p6f9Hl@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvy2oz+31O5lqbdcvqwCzyXewXdc8gWfYbJ6GHoHEF8U4uttDb
	NAq4KiuBQxEDxjfSsmWOtfvRtUU0QlCKAdjQN9vzZABJP6xcCaaxGGs50RzygNVOfYfsLiA0uoc
	Pi7TJ6VpfexrWnGbxgwYFB2TzxH3nEBMYNwvEgekIJ/d6c7JNEEeq0ft9+o5UYg/ylMaYMAEW
X-Gm-Gg: Acq92OF7cXKsVjwFI3korc7MQba+nMDWyOpKGcr81P0lmynWBulhNaZZ4c9BRNN17Mk
	82kQzuRiyaVhhF4AWsggVFDI63bqzkYYbEGXVTIVxpUToA82PlEdx7F7nG3BteNNpZjohR7y7bY
	pLMFqGFvf7YuYGXlWicFXehZdzNAPZ3+akUXxV6To3xfQpN8FTwy6qiOq6KPA9fPgSSDorRD3M2
	1JXQKwMqWpw80HUy/TDu0ewFv/y4g7TkduuFR0bSxCOX931+3nY8NKpQQPu4a3HFKH2ktwyUxGI
	2q/fca4tvMW+F7eqHKTQTtVoSNp8p0hBMxMV+dJLeI6NWeT6p6VGIkTkN3w8rKRE86DNUDlQ+7l
	dUvh5shg2xuhDH1y1kQajEfBazp/xkS/+Y1ccSPNKvhiQ+PqD8ACrWtwMBLLWbg==
X-Received: by 2002:a05:6a21:a04:b0:39f:a42:9251 with SMTP id adf61e73a8af0-3b411de8796mr3439902637.22.1780059370116;
        Fri, 29 May 2026 05:56:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:a04:b0:39f:a42:9251 with SMTP id adf61e73a8af0-3b411de8796mr3439854637.22.1780059369614;
        Fri, 29 May 2026 05:56:09 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85771a7c24sm2119680a12.2.2026.05.29.05.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:56:08 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Fri, 29 May 2026 18:25:46 +0530
Subject: [PATCH 3/3] pinctrl: qcom: Avoid assigning thread_op_remain in
 unthreaded test
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260529-tlmm_test_changes-v1-3-88bfdccb4369@oss.qualcomm.com>
References: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
In-Reply-To: <20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780059355; l=1056;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=iTiYhpelLpWGgfB/Al47OggJjvyNnV4VQ2i749ZYaSc=;
 b=8rskZm0Ft0bNEFtOzsXTRap4SzOqcPM01f9uFoQ5VPdviVg5K1+/Vw9wolQ1788k6qS9VnxEL
 3alsQ//x+2fCw5Fxq3j42UP2p1BUqv5uU3OLd+96XhQGdQaYZnPB02+
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-ORIG-GUID: V_clWyCqIdw3UnFp5Rs8ktiYegCnr1xZ
X-Proofpoint-GUID: V_clWyCqIdw3UnFp5Rs8ktiYegCnr1xZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEyOCBTYWx0ZWRfX+raQV/POgLlQ
 LDt+Vlf3LcMyRmSCXLZKmxutf5Xtx/c4oMVJ1qHGoGwUfTr50BczXdwZxiafVfGJyhSFswuLwzv
 38F+2J7XQAq+0/ND/ACWmGm2cv8tciEV28w+IT2D0hzUCviMZ4SZTXUsxwIWPFkTr2t6Q08Vktm
 HO32MGXqcC/MKuG6W9/8CfqYFXUNogTF0pPAh2IqsBWfF5MScw5aenmKqiVf5zgyxRekqTyGSXO
 wNWoXSDOKPRTBo6RmQuLD9iZ+6Qak0f0JkI5OVdNxB4g23LpFIwHovPDmTkRMJgj+BoPTZt8PhV
 042NB699jmV6hKbnK/yQA+SwYb/rW1xD5QCCeWwtua2nEtnplfLrHWZNKYjvEGJ6V6zZo04ZQgF
 95xHNerPPH7OeiRvOd2K9iGeWsnKpUidlqF66HvypysONUzAuICTNLOC3tstYUQHs3V/gFTBl1g
 eH7/+/lbUOt2tK0YFkw==
X-Authority-Analysis: v=2.4 cv=S+TpBosP c=1 sm=1 tr=0 ts=6a198ceb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=unFxLnwcM6tLXp7VbdoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37689-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA9A66029E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
variable is only used by the threaded IRQ handler to control the number
of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
register a threaded IRQ handler, the assignment is never used.

Remove the thread_op_remain assignment from
tlmm_test_rising_while_disabled().

This does not cause any change in functionality.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
 drivers/pinctrl/qcom/tlmm-test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 007d6539ceced294e81cfbe93a00c75a98c858de..e9e04300ab3687825255885821ebde0f3ee586a8 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -521,7 +521,6 @@ static void tlmm_test_rising_while_disabled(struct kunit *test)
 	unsigned int before_edge;
 
 	priv->intr_op = TLMM_TEST_COUNT;
-	atomic_set(&priv->thread_op_remain, 10);
 
 	tlmm_output_low();
 

-- 
2.34.1


