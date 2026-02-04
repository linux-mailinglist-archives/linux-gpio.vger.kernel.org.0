Return-Path: <linux-gpio+bounces-31449-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sH89Gg+Gg2llowMAu9opvQ
	(envelope-from <linux-gpio+bounces-31449-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 18:46:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EB35EEB1DA
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 18:46:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E1BE73084F57
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 17:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D9653A1E8D;
	Wed,  4 Feb 2026 17:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OD8lMy+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qu7m1fvL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E213644DB
	for <linux-gpio@vger.kernel.org>; Wed,  4 Feb 2026 17:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770226976; cv=none; b=iGa1I3o3kXwlZt4ILlXqXcL3xl7TyOAy0Cv5ff4prKcG5Wo1eDf61TdTKO+tE1Yk6mmrfDBej12yzqyqFABJ3iIA1QC/mcey7yH6kec/edKAJtQwxN2tgCb1AkaMTryVuzhLoQzO9AtfIPzGEL7O88oKRJ5VAyH5Ewyu9MJ3oIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770226976; c=relaxed/simple;
	bh=UwJBqVNlAoP/3rom+IEdULEsm+PmtEYbK6RAsliv5mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOkOb3BSjvj1/gWA6QLoVaWodz/d2BHwMv+to5VDaY1u47g0FtetdsGarrKO1Maua6IPa4j3uJjd3ErEI+gy/RHDg9u8P3bL6s5LHCQAhuAUr3yMwEvnTOZ+AaEFDF8F2Ck+ui1u/0XHLhvwc8IJDKx2p69tqS8K7VzRQQqgGNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OD8lMy+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qu7m1fvL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614EGP6h926474
	for <linux-gpio@vger.kernel.org>; Wed, 4 Feb 2026 17:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=VpOE8ZUKF05
	Ol33FXMw/Gy+drB/FcanggYS/wQ+QeH4=; b=OD8lMy+empsB3ckNcSehBT6fyHv
	ui3X2dg4qxSMSaiOMNBLjxJnYMUyhzzjdycNqQVMoGGy/beXDK2vz/ch+jl8aS/O
	ACK/G4eOOhOtjEl5xwqmig4/op3QCJ86AL6jfhRYHsQ7Jfr8ysqwu+i/Q3QDepk9
	RxVbraCS3RBx+RVkO3aA5ujrrh2IqhjswdBBwah3DUezWfKsP1OXGfEZ1hKsBgmg
	mEcxCtVKJNtNBl21PjKsd+0g69U5S/e17hRFGToDZkjUFP2VRzTMetWOnKYA1v6+
	cC98GwhGnW0nWAGtAHA4g5OjHW7PyNFEkfsky1Wlhw1bPLYK6vLuQhxdiGw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c47qv8qcw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 17:42:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8bb9f029f31so2277896185a.2
        for <linux-gpio@vger.kernel.org>; Wed, 04 Feb 2026 09:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770226974; x=1770831774; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VpOE8ZUKF05Ol33FXMw/Gy+drB/FcanggYS/wQ+QeH4=;
        b=Qu7m1fvLn8tOyyn75IzqLSZX9QLCFPWOW8fgJC+zItSD/cuWog4fxYQcT1IfleW35R
         +UVlgYh36NPa4gQel2CTGfAAW1l+x3hO2jImGq/h4Aq6X4oVey5gKHJ+kxIyziIyckfQ
         aa+Lkm6G6+BlTCSjwn/LqRdPAWzN0+hb3QBLUn5MDjObdU47C7z+wFVfLQvKCvoA+Fsd
         g0lSYav+ddKnKN2a4M9SjEruqmqS7PI36BrSz2EljswuosSHTu7EB9MbJzgYaYv8O1VP
         +szCpu/orReRsW0B2iE2L9tkOL9RQ5raGdu/S2/AufOMps5vnbevHb8FS1MkIk5l6EhF
         n51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770226974; x=1770831774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VpOE8ZUKF05Ol33FXMw/Gy+drB/FcanggYS/wQ+QeH4=;
        b=KEZJDg8GuodrE82ymA/1H2Sp67Xg3ruVZ9fCWdD9PuoiZ4HPAA5wfw+3X11KaHO2/m
         X6FRloCHDzBbbzAQUusmI4dY9BEPgARO72CnLLqsJxKkrLkkqMsAd2HCbTdNXtpAve4r
         JTprHhxjLbM1dPKcBtMv2E0RfcPLeBv9VFY8sBAGB0AYDaxytKB7IciSNKeoa1bMKXXK
         5HSVO5Zhfqq+9C7BzCVUJ7diGfo44ddGRG9xzrV8BGZ0lphb9SlgNuyjDJJthGJKms0S
         QwcieUE9dd79edhR6iExgqS8Sqw3XBFDHjFlqWRYew4GhbTPy6UVl98AYSz+oDjZ/7We
         HGGg==
X-Forwarded-Encrypted: i=1; AJvYcCXakQnNrpK8BglEtwexkxh1pvcDitRCeOlap0COCJsjtFiJzkMXt7n0U9ECwjb6JcrBQHZQaYfF9+jx@vger.kernel.org
X-Gm-Message-State: AOJu0YxSgvoMKBwnyjZxpIDnwqQvWkDShb4slcKRT79alYipMv185E/q
	zjmQVcKFF2gZDjeYcL2aQoALgOfc93Gui16dC9R/85aJ1gz3CJ7wtTBnJlQVuh9k4lYEwjkkAS8
	BUNrAVA4QRaeej7l8ZePtegiqXu7XTm24G8NdF4h1QjejnUD5pyjtTBitNj04iBxi
X-Gm-Gg: AZuq6aIFdSFxuHGCQvA1Ra9Ld9QvJh1PY1S0AoV+TLPVQk01OhBFcX1StRBXIeiLY9Z
	RA72oR2A9ebdkKe0+ns3shD3PoJJJnYKiVszNQp5SmnUY1k2WCW/sB7IHFrz6Slr6Wvq+/i6ReR
	A9SDOsToguULzSzrGg3jVMB2F/wVZTXn/hIb+K9rQ00RQGq9+hixO8u27vKq/Pag/CbCY854/pz
	W/APiPUOP0BYCdXWIl4VfrZ7H8Pz4DcJxrXThAVdZwbcWUq94+/Lr7E2BDtUIkneHl425S/suPx
	89oXWFeQ1s+l2Bqa72B9rZoF270Sf0aDWYpdxuycxryzxy11Wj9sSW/mLdaPlHuZJUOV8uecj6+
	jeeYT0pwp2KWjyIua0rZhS7+ICBgrpNwBhyWhPWh21FA=
X-Received: by 2002:a05:620a:4104:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8ca2fa5eb71mr469324485a.87.1770226974210;
        Wed, 04 Feb 2026 09:42:54 -0800 (PST)
X-Received: by 2002:a05:620a:4104:b0:8b2:f1cc:a14b with SMTP id af79cd13be357-8ca2fa5eb71mr469321585a.87.1770226973767;
        Wed, 04 Feb 2026 09:42:53 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483179dbdcfsm959985e9.0.2026.02.04.09.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 09:42:53 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org
Cc: linusw@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, konradybcio@kernel.org, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi: add QCS8300 LPASS LPI
Date: Wed,  4 Feb 2026 12:42:36 -0500
Message-ID: <20260204174237.2906-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260204174237.2906-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GaEaXAXL c=1 sm=1 tr=0 ts=6983851f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=6qwD5vHFcjQxT5bUl8gA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: zo1ufngJsSe4hAoZbLnBxfBtVKrnstYn
X-Proofpoint-ORIG-GUID: zo1ufngJsSe4hAoZbLnBxfBtVKrnstYn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEzNSBTYWx0ZWRfX7w3aj7wZWPnE
 qMCG/RYI1v6orTBaYZxS/OOB1QxNFmRII5j18gE3XLXW9q4YlOUjpBNWQ2mccdwKTUkGM0B7YtP
 LyM1SjDbIwRyMNZY/IG7I+7MVXzPOvYrWOqlSCus0y+Q87uBdVOJGhwn6sSM7OtqlatteN7Dw87
 RgA74NzPWvGVz6ox+bs0BDJObtQPgp2nef0HLuxeMNUszCTOnlHEMt1v6EHaHau1YHaEVQomT14
 NL2DatTQNjXLG+0dF01O/Vn5UymuXu3I3IRmmnF8hNMVAZl9iItHV4Eug54XlWo5eQ6L3kZj6Bx
 LN2oNLTZHXFFKHrK079GDaJIA/WlEKfeuuVxFrpAfw0xMoKHn24Hokabssld/vwcOFZ8lxav40l
 lNNcRmsLA6E0XjN4fW4EvCEbPHItLOp4JoZgJ3pWENNCHMDqTevmunkkOwRLsblahlqF/5lh0kv
 xXxxgGb7SNQVoRiQ5nA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040135
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31449-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB35EEB1DA
X-Rspamd-Action: no action

Document the Qualcomm QCS8300 SoC Low Power Audio SubSystem Low Power
Island (LPASS LPI) pin controller, compatible with earlier SM8450 model.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
index e7565592da86..c81038320c35 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
@@ -15,7 +15,11 @@ description:
 
 properties:
   compatible:
-    const: qcom,sm8450-lpass-lpi-pinctrl
+    oneOf:
+      - const: qcom,sm8450-lpass-lpi-pinctrl
+      - items:
+          - const: qcom,qcs8300-lpass-lpi-pinctrl
+          - const: qcom,sm8450-lpass-lpi-pinctrl
 
   reg:
     items:
-- 
2.47.3


