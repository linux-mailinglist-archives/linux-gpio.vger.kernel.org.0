Return-Path: <linux-gpio+bounces-10416-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C54F8985293
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 07:46:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 64E3CB22606
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Sep 2024 05:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D12AF14D29B;
	Wed, 25 Sep 2024 05:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="SEMnDODE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138E641C94;
	Wed, 25 Sep 2024 05:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727243197; cv=none; b=owvur/gino5aQhbeFlFzDPAoUIJNjDlS3VamhQDB1VgF2Wk90CVH/X8nYUFio0pGBB9quwVuWaRFUHOMSQb1+IKyYqD8XAxa8mExu0p7HGdJUF2AxGKH59dEsIlilhDGvZO9W3FM/9BpQmeBcl6iAtyfu9l0r7vNID2433yLrz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727243197; c=relaxed/simple;
	bh=DU+SH9eBAQ5FYJiGRZiq4vbhuJdYXYckECno4X3QsMI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y4kY0yXBUPPXgbQC4pb9od5VvJDt5oK3oFN7Qr6sMQlVEG9iA3p+gwvjmPdOnHJKsA2pUpkV5HbhBFjfappyHxA56UfREbVzhij3CxzKzNoJNSaqSsT63UcjyFKvLeafl4SB+lgwrkFnpxV/IneySYosIIKDqxInUKbk0Gz06MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=SEMnDODE; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48P1X6xb016426;
	Wed, 25 Sep 2024 05:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=62263mkwrEroH//6ZhV5HEgNm2
	07MHSLYcAxTIQOo3o=; b=SEMnDODE0F/rgGY2LI19B0mX1rmH1eMcR+rwdceg5L
	0tDQDayPHX5bETc9qZXRLMuYiWrDKaSya+U5g/JPs757P3vjT05mZY/Q2NEeTT8u
	A7pvxVt8fTkjgH0KW115+0+t1/qR8/r7VwYhhBBmmTH8KZErqmFOEAW1/NKTWcyI
	cZSz31I2cp+D2gHMxjArg7zFufwnzNMeuw391b7Z9c0ErsjDCOEIvLbc2VxicmqQ
	Biv27rFTJwYAy5vlsoc7QEKgxx9giHk5sfJZ7U6mKOe82oajX+rdj0s7quM1BciN
	E5qgNTFVYXX9SOuPClXkv5jLNgYkEQGy/cWKFDqxYoiQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41snt1dnrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 05:46:30 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 48P5jMgX006913;
	Wed, 25 Sep 2024 05:46:29 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41snt1dnrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 05:46:29 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48P1okbr013966;
	Wed, 25 Sep 2024 05:46:29 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41t9ymypys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Sep 2024 05:46:28 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48P5kRfq34931218
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Sep 2024 05:46:27 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECE512004B;
	Wed, 25 Sep 2024 05:46:26 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 648F120040;
	Wed, 25 Sep 2024 05:46:25 +0000 (GMT)
Received: from sapthagiri.in.ibm.com (unknown [9.124.209.194])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Sep 2024 05:46:25 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Kent Gibson <warthog618@gmail.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
        Frederic Weisbecker <frederic@kernel.org>
Cc: Srikar Dronamraju <srikar@linux.ibm.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] rcu: Fix remaining rcu_momentary_dyntick_idle() references
Date: Wed, 25 Sep 2024 11:16:18 +0530
Message-ID: <20240925054619.568209-1-srikar@linux.ibm.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rkzxSx97seQqRv3x6UbhUNrzjw-6-8_U
X-Proofpoint-GUID: cU07K94HXPNCpkxcD6TgZgw8Om_yKUb3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-24_02,2024-09-24_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1011 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409250037

There is one last reference to rcu_momentary_dyntick_idle() after
Commit 32a9f26e5e26 ("rcu: Rename rcu_momentary_dyntick_idle() into rcu_momentary_eqs()")

Rename the same so that we are uniform.

Fixes: 32a9f26e5e26 ("rcu: Rename rcu_momentary_dyntick_idle() into rcu_momentary_eqs()")
Cc: Valentin Schneider <vschneid@redhat.com>
CC: Frederic Weisbecker <frederic@kernel.org>
Cc: Neeraj Upadhyay <neeraj.upadhyay@kernel.org>
Signed-off-by: Srikar Dronamraju <srikar@linux.ibm.com>
---
 tools/gpio/gpio-sloppy-logic-analyzer.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-sloppy-logic-analyzer.sh b/tools/gpio/gpio-sloppy-logic-analyzer.sh
index ed21a110df5e..3ef2278e49f9 100755
--- a/tools/gpio/gpio-sloppy-logic-analyzer.sh
+++ b/tools/gpio/gpio-sloppy-logic-analyzer.sh
@@ -113,7 +113,7 @@ init_cpu()
 		taskset -p "$newmask" "$p" || continue
 	done 2>/dev/null >/dev/null
 
-	# Big hammer! Working with 'rcu_momentary_dyntick_idle()' for a more fine-grained solution
+	# Big hammer! Working with 'rcu_momentary_eqs()' for a more fine-grained solution
 	# still printed warnings. Same for re-enabling the stall detector after sampling.
 	echo 1 > /sys/module/rcupdate/parameters/rcu_cpu_stall_suppress
 
-- 
2.35.3


