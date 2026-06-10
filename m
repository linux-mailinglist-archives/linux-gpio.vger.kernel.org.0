Return-Path: <linux-gpio+bounces-38215-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id k6GLL+gCKWo9OwMAu9opvQ
	(envelope-from <linux-gpio+bounces-38215-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 08:23:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BDA66632E
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 08:23:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Eb5I5uQ7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Y4GtHupY;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38215-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38215-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63523313AF7C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Jun 2026 06:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6260033689B;
	Wed, 10 Jun 2026 06:17:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189F92D837C
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 06:17:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781072233; cv=none; b=QHWtaF66M7L/v5kb2DYMOJwgA8MhdzDWplFTnWdDF3TK9FUI4iYxmfp/fXaz8YhU79NX2ewtjE6HxsKzXKmeQy5y6YavYBcbmAO3EAKUOE0VVrAbRGI+2F7zTWXQi8WbdMZx18+CX4kxKPOw3MytFhv12V55fz08ljGW+U2726o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781072233; c=relaxed/simple;
	bh=hms2jLbPqmmXolnSZVmVHfmLcIODGbkUN2XWtu0ccNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ciTzFob829N50e7WFsLkuVA1yt1GZDU7xeWeUjeV6eOH3945jUivHQ9HEyV81f3CZLfRD8UQFK+i8abYnBOqJw5ewhiiNDLCy8vO3kvM8u3YqzGgBCuC/PFN03iKk/vfcoptVgFs+zls0DcJP1PCgfILSZ5wFt4LtJz1jjd12DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eb5I5uQ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y4GtHupY; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A2ejxS4061054
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 06:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VnlBPQxQ22pz6nk91Vnsrf
	uSTnck4MhnkVm/3m/qG/0=; b=Eb5I5uQ7WZmKdNGE16tcS9nuf87a7Qk6s2ncg6
	BhKt4MJOIUYSmMjHtZIr9m9QbzpklKlp84f8urXc22U2tFLiAYJXB8tq833Ry92S
	l2F7iZ89Xu14xAPrSilV72IkIOgFDq3BPeC8w3havARrlJp3rujMJGoWLX/K0D64
	Uy5KdR6S51AgaMF9I3xjxiF9QlkwAZjqPeY4sHdRNfkUIsa+HL3lYIzr8xeTBG6N
	b1kuddTUIQvaGdQ9TCW/AbYj6OF0tCJe6RnQCyprt2OZ/OiIaZbGC6h+IfJo9Hzi
	abhXSrmoAWixp9fZ3RF7HVKTc4Lv9gcPCwNmNSa5pf5aCa2g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh11r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Wed, 10 Jun 2026 06:17:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8423efbfb61so4276530b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2026 23:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781072231; x=1781677031; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VnlBPQxQ22pz6nk91VnsrfuSTnck4MhnkVm/3m/qG/0=;
        b=Y4GtHupYZ8bYq575Z+udkxYHY1Hr9uvJ4rYbYfFsusENb061xdu5vhNJ8PTLPXSU2g
         +bcWj+Epg5EohMqeb4NL0HW4z/efIsbZtBiM/ZsWUKkLpUUroZrU7HChN18tLO0sQCP6
         zbS56oMXCJvHqZS0mTxKd/RCtxnp4V3iWr2gCP7oW9/v9aJsMud/Gyc5ogKSDgbrAJrk
         6iwvNaeliVC+yv7dLGj8ZMHV31GJg8M1O74tN7OttyBUXWKuNm8jNER9HUBBSPAcojHH
         4ulSMuvJYi4UTjRy8w7AlR9suPUnPQKWvM528aQc7B+6jRngMYyCej6IrVBR7pj+42Gu
         LSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781072231; x=1781677031;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VnlBPQxQ22pz6nk91VnsrfuSTnck4MhnkVm/3m/qG/0=;
        b=Z/2cz1gw/iio/+W2lLuphbhjFQe3fmC75hnEsO/bxF6F8yfJbKEm8XuHhUt9lc7h7n
         39Cq06GHWy/U3LnRk1szad+amcZpisxGIw+g5ZPFoBlS5cdXt/U5IIBJ7Y51hvP1ld98
         d7A8gtAkCZA9V/wIif28pHIZjB8WWUj73wbshh4Mpt0ZESaz7eu6XcbRYfHnFy55vPJ+
         yaG2QLH+BDQGVfACdT9n+IyTIc6oX7TsCuMjc/SZwop23e819Cfq2IsMV4Icink8U2KN
         eiwjnFRqwwkHiQcDJWzV8sTbesMIYMNPnIjKmnt8KQbfLdHIGM18jv54R4wnWhZJSFOR
         +ZwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9CjvBUHuTpyKo3KqneKUkEHkg8WIIMmmBdN2vXi1EjoCANab63fs5IYJdQuf4PkAJoajblbkqXX8K3@vger.kernel.org
X-Gm-Message-State: AOJu0YxnM5RC/Ujws7CEIjBj1juggpa5H4ldbef/mRfei75QavT4fTmm
	Bd7fIfZBlrVCyMXKIu3wCDTx2iNgYqdPt1myTQPTtnzo059/TEwAHpxrUp+1L1OsW3utQe3/v/u
	7EmD0650nzk3TPdszCAUBBgsIKCwG+TbDeYl6p63HLWN20iYLR+DPq6tC/d1RHmz5
X-Gm-Gg: Acq92OEr8gQ3kzj4B+xJWsYn7yVoqsDF9Jlvm+I7Dwq01JAkEnIFNFJVCeQWSSUYOKX
	qyCCDAn6KkYIi4t6w7rxjBTTt391DiGM+ApAV8J5ptqc9/5xqzkfDbuj8FWeh/MGOYYwJT6f/QL
	1HSJwtwI46PG9cAyc5yksbBKBpeAcUzd+SJoL72yJR3QjIwxLPonBYZC6+C8Edb3cOWZsG/Va8v
	NgKbdF87kY2uRSprCTyADu0552fCAjNqDUjSQ4TpIUQbjsNCm8BqKXfSstb0etiH5RzioMGxuQ8
	XlUlxUYRVoYgaX+L5gX+xt0h6MTQkvfub+ahOhlviW2JN+Ff3OOwHwUw1k29u7hZMJTW/l8nVc3
	4zsA3m1jHcDffYqmXoRXYFbxIl69boWXe61FvDh7+lERVbuQm0Nek0kfot0Z6lQ==
X-Received: by 2002:a05:6a00:194a:b0:842:7476:236e with SMTP id d2e1a72fcca58-842b0fd2828mr25433944b3a.41.1781072230683;
        Tue, 09 Jun 2026 23:17:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:194a:b0:842:7476:236e with SMTP id d2e1a72fcca58-842b0fd2828mr25433917b3a.41.1781072230283;
        Tue, 09 Jun 2026 23:17:10 -0700 (PDT)
Received: from hu-smankad-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84300cb0a82sm6301361b3a.53.2026.06.09.23.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:17:09 -0700 (PDT)
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:46:58 +0530
Subject: [PATCH v2] pinctrl: qcom: Avoid assigning unused private context
 in test cases
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-tlmm_test_changes-v2-1-f34536da4717@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAFkBKWoC/32NTQ6CMBSEr0Le2pK2SqWsvIchBPojTSjVvko0h
 Ltbce9mkm8mM7MCmugMQlOsEM3i0IU5Az8UoMZ+vhnidGbglAtacUnS5H2XDKbulyMRVDArK3W
 mg4bcu0dj3WvfvLaZR4cpxPd+sbCv+29tYYSSuh6sVmo4HYW8BMTy8ewnFbwvs0C7bdsH2ArK4
 bkAAAA=
X-Change-ID: 20260529-tlmm_test_changes-6061f95c70bd
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Yuanjie Yang <quic_yuanjiey@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781072227; l=2335;
 i=sneh.mankad@oss.qualcomm.com; s=20250818; h=from:subject:message-id;
 bh=hms2jLbPqmmXolnSZVmVHfmLcIODGbkUN2XWtu0ccNs=;
 b=BCbtoTO8ETdUbpCgHdfZDgy/d1nFjUlU+phcysbbUGrmCGUki+3qHZrk9mb5l2+WX6YrDMniR
 Dx7tL1hs4WKBTu0XJFUi5kP604LkH3SzfWrK6sv2UEf3SFlIJfTCkOL
X-Developer-Key: i=sneh.mankad@oss.qualcomm.com; a=ed25519;
 pk=sv57EGwdcfnp6xJmoBCIT1JFSqWI+gawRHkJWj/T2B0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1NyBTYWx0ZWRfX1W1cL2rAR7hm
 LDHnVZWDT4cC45S6PvmMTz7whykPitSk0x4qgclknzt5Gc6DFOm6W91ncY+VxfG8IXSYPVfvu4q
 fN0IFlCzP3va5FEcDILkGh+/P8lC6C4pD7Rzf4lqaT9Ar1iHLUJ4EeV9bEtFZwVYrjvekFECmkM
 7KJzfrCaPiFtvo2q+Tj72onuzMSjRtvxyASCcnG/g0LndBZicck7BgaZQI7TGCUOSzCzjyjfIXM
 xxkFVy3ZkqiPo+s1S4GyHzNQDdqpMJ+BqfVe9j8t470uVFITqT/O25LOiJ095whxwbDrmnufhVr
 RnEbkjolrGlDWVNUwUDM1cBJ50VMi/GQkQqqKYv/m1In+Sj3A70UzyRYjNigpUo8BTiTq7h1BOj
 H65vbnm64Z21tunaYVGTt5X4Yt8fZF2/SO6htcPKo9HomBF5Jxi2VPoxY3NqeMSXZfyuZ6jvNIz
 0fuCW30gBR/O8PqVQGg==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a290167 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_oooiXWqQgcqgp1T0oQA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: voNnQ0G5v30FTHHgOuqCs8ULCPXxjqmw
X-Proofpoint-GUID: voNnQ0G5v30FTHHgOuqCs8ULCPXxjqmw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100057
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-38215-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:quic_yuanjiey@quicinc.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sneh.mankad@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 25BDA66632E

tlmm_test_rising_while_disabled() sets thread_op_remain to 10, but this
variable is only used by the threaded IRQ handler to control the number
of GPIO pin toggles. Since tlmm_test_rising_while_disabled() does not
register a threaded IRQ handler, the assignment is never used.

Similarly, tlmm_test_high() and tlmm_test_low() set intr_op_remain to 9,
but the variable is used to denote the IRQ handler the number of times
GPIO signal has to be toggled from the hard IRQ handler.

Since tlmm_test_high() and tlmm_test_low() themselves toggle the
signal and do not require the hard IRQ handler to do it, the assignment is
never used.

Remove the thread_op_remain assignment from
tlmm_test_rising_while_disabled() and intr_op_remain assignment from
tlmm_test_high() and tlmm_test_low() test cases.

This does not cause any change in functionality.

Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
---
Changes in v2:
- Modify change to also avoid setting priv->intr_op_remain when not required
- Remove patches that are already merged.
- Link to v1: https://lore.kernel.org/r/20260529-tlmm_test_changes-v1-0-88bfdccb4369@oss.qualcomm.com
---
 drivers/pinctrl/qcom/tlmm-test.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/pinctrl/qcom/tlmm-test.c b/drivers/pinctrl/qcom/tlmm-test.c
index 007d6539ceced294e81cfbe93a00c75a98c858de..13c417731be7a4dd1c0b8a48044c0090b607e72f 100644
--- a/drivers/pinctrl/qcom/tlmm-test.c
+++ b/drivers/pinctrl/qcom/tlmm-test.c
@@ -273,7 +273,6 @@ static void tlmm_test_low(struct kunit *test)
 	int i;
 
 	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_HIGH;
-	atomic_set(&priv->intr_op_remain, 9);
 
 	tlmm_output_high();
 
@@ -298,7 +297,6 @@ static void tlmm_test_high(struct kunit *test)
 	int i;
 
 	priv->intr_op = TLMM_TEST_COUNT | TLMM_TEST_OUTPUT_LOW;
-	atomic_set(&priv->intr_op_remain, 9);
 
 	tlmm_output_low();
 
@@ -521,7 +519,6 @@ static void tlmm_test_rising_while_disabled(struct kunit *test)
 	unsigned int before_edge;
 
 	priv->intr_op = TLMM_TEST_COUNT;
-	atomic_set(&priv->thread_op_remain, 10);
 
 	tlmm_output_low();
 

---
base-commit: 95d73427242a1b8f4c06c39e7e93d83cb5779680
change-id: 20260529-tlmm_test_changes-6061f95c70bd

Best regards,
-- 
Sneh Mankad <sneh.mankad@oss.qualcomm.com>


