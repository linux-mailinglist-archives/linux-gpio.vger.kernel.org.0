Return-Path: <linux-gpio+bounces-31487-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iH3mMau5hWmOFgQAu9opvQ
	(envelope-from <linux-gpio+bounces-31487-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 10:51:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6065EFC3DB
	for <lists+linux-gpio@lfdr.de>; Fri, 06 Feb 2026 10:51:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 729723038AC5
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Feb 2026 09:50:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39A5361670;
	Fri,  6 Feb 2026 09:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RV7XudjP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="amgks5z4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DEE3148D8
	for <linux-gpio@vger.kernel.org>; Fri,  6 Feb 2026 09:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770371408; cv=none; b=gTdNtxL5tuneTPcwiblPOLuJe70b5P0DiwGI0Ywwk3c/AqfohezJKPRUOpVTxDnq2HBpBtahCBxw/vwAEAmd8tL/pVXB7aoDXeDQGKIaweX6OfGOjLfv5SwEeELm9R7LDqCehgiAgOxou6sCh5cycTQINycCegn0UcajBSZf+m0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770371408; c=relaxed/simple;
	bh=jbVoKYU4ev5Petiyr7vG3/lbL8apzibfZBtyn9szs3I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=psyYP9mMGlA63L6YPN7TQFAo/QsWwbLpum5ac8t+UMUHy7z3UsDMQq//2EIlUadui28fOA6l2rN1+r3v1Fexj5IBsNOxKLSINexB97XLvB3D+U6ZEH9GCQMIXl7fJg7DDR2opOCV77qy0PgYwOo/V927RJKuh8sBprXEJbKi7kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RV7XudjP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=amgks5z4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6168ir942313831
	for <linux-gpio@vger.kernel.org>; Fri, 6 Feb 2026 09:50:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1krOuL/jVU7sMVCcsHy2/GSYSjNlVLzwVIC
	HaUJdVHM=; b=RV7XudjPFtQaaWUUfCEL6s2+Jr/Ul5gtHQBgwRkA/NFSod6Tc4U
	FRK2/LhsH1wZP76NZRvc2Yzv8LxlJ2j5yJOh4iMiIKRrsBas8wa5mx+mZp/NFWnj
	ypfq5F0NzVHrYPWVgFoLTQ1rOfrRZP27cK+nnTCNvozGoVZ7UaxySAp5IPDhj1/M
	hFp95W9NNjaTHcC+7Ppb6tnmVRGtDnb9XX6GbCrQxnKzVBB0FxRYxeuNypvX3HDx
	HqLK7AxxY7RPZd89K8gfglGGs/PwjCCHSa6L/1ubh3Y8/zB0aIiCALI819CQYYiq
	55dlaMkcELKM12f6Yb/3ox0oKywBxtP35yQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c52mrjc6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 06 Feb 2026 09:50:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c882774f0dso122048285a.2
        for <linux-gpio@vger.kernel.org>; Fri, 06 Feb 2026 01:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770371406; x=1770976206; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1krOuL/jVU7sMVCcsHy2/GSYSjNlVLzwVICHaUJdVHM=;
        b=amgks5z48sotqb1RuZ9642quYN2UZmAaMzv8rRUky24P+NwloBDf24srl25z8/n2z/
         xScwfXn1hqyHOiJ8GJpcUURNerqQJ+aDL/WC9fJK39vtNnOmDh9SljDEeFnXZxpWDd5Q
         ZP9UVeAu2mFOtjPrlpF04zF/KtWaLXLH45/7t03cnRbBkSCf2Sdwdi84WRWmRgeubt1K
         7Waf/4g2x17K3HA8Cn2+TBaP5tdaBrRBAwwCk2Qj08Ttg3w28Z1FMA+Yj+M44ttXE1NS
         7o7IT/UldsTOeTvlatehuuH4CxRDANNFWAyu5y3EP6YH1anNJF2ttnBcti+J3zpmEDR3
         HSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770371406; x=1770976206;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1krOuL/jVU7sMVCcsHy2/GSYSjNlVLzwVICHaUJdVHM=;
        b=BFdIvORe89wRSwBYwdA31weOLMzlvsYgUxCqMMOZuOXwxcHmb60XgPJRiZxp6XDVaE
         Oqk6hXV3yCPSj3z5tNWnhZp1t90bv9jjC22S1SwtQF3r0i6QIN26TjVykMXVtD8uyLyi
         y2JSXTM8tmMs12VEs0J6uELMjgvkeGgpCOaOlcjVAagkl+UFSAoKTq39wxlVB1/eLisZ
         iumU22jMJuT0DVzprbJfg1w+JJokudCwITMud4g3/axOWFP7M8sHbmaKXQbiJ9jUO2YC
         6USlmsnLnXQnm5ny/aTuzJOI73mA4sdv6cZxJT1E4PhZxo6YSHOzpMHSYalDgUfC6cm5
         yvrA==
X-Forwarded-Encrypted: i=1; AJvYcCWCwW8FhhhS42gHOiI2YFp18at9dBn8AA5c6ntGdEQaL6bSOSp3rGxtE609inqNyXVqGDwTA9HNNE+G@vger.kernel.org
X-Gm-Message-State: AOJu0Yxow570sTUsRFEGTKaf5ab3JVGXOkCjUnNLlPdSkE2Krdz5rRZs
	zzLOMjmwRDhcUjtRGdOA2WsTldBs42dozDAqYSFe/9mJ/Ig7ju67YRHRm51xjVhto5+BPWZGD/o
	zpZyFp6tMhS8vOHQFz9PJ2kV61p/x53+QEP20ILvBBn5uhC6mwrDPRLMnTykeCDknY5BgtxYy
X-Gm-Gg: AZuq6aKRW/sIC2wmG5t/Khi9PIVLw9uhgQUvMPvLsiTV7WYuFYAF6NOPm0Fw2GUVO8w
	HF2IkVK5hUjqIPZfzI7dILU9YzFokXQ196Qxx6crISdN2qPo+1FB/jg44WxZLlMueZ+nD3uN4hV
	2SETEjrxfa2PhM1m9Bq0JSPkhJ/k6sS7XauLNf3Ow2HLHKcolO1zOdf5j/bkOA6qT4wyvvFK+ER
	mUslJgDnoBOwbJE8sB8U2DZVUarHQkOTqx3/vEl29NakYET1sIK1JteODz57ALd8io1avwZQxVv
	7G4nzQC1kXrkIqeGkf9gkHwWBoUgn05OqUDaChbxSrCar1yW83TQ2FVkOEC9U8c6LwjoBcuniMj
	oXydbbti2py7/SiZnv1OH4BcQtMa4/7wha88aRQ==
X-Received: by 2002:a05:620a:4494:b0:8ca:3d7c:e767 with SMTP id af79cd13be357-8caf0961959mr253715985a.52.1770371406180;
        Fri, 06 Feb 2026 01:50:06 -0800 (PST)
X-Received: by 2002:a05:620a:4494:b0:8ca:3d7c:e767 with SMTP id af79cd13be357-8caf0961959mr253713685a.52.1770371405725;
        Fri, 06 Feb 2026 01:50:05 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:fa9:b625:6a3a:d8c9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362974527fsm5012456f8f.31.2026.02.06.01.50.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 01:50:05 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v6.19
Date: Fri,  6 Feb 2026 10:50:02 +0100
Message-ID: <20260206095002.21317-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2NSBTYWx0ZWRfX9IgWuyRGnP2d
 AqjXerTBJE0lOWc9bcRvVDwpB1ibvW3oHizD1SG0zEZ1iiF5yuJYK5VTbis4X/c4QkdcXD5k1GM
 klEBiGe7HhnpKaXuwGS3eYw2NJL4v0t3YW6C0/nbOYxFTsvhpFzxT59GK9yz4c5Z0BEf+3o36Ai
 RhASvBSs68FbsglFao4eR+VHBxJEvWxOBdP0uSCzSoGSn/JFQ01Jhy63mwVPJBIf3RTR59H5qPj
 9omj5FNaIhRcFUXrQqGSwsX9vizZj7tWHJkOOg7xzWHwB3aSKw7YPyLy4X2uuNAbc3GcG+vvPlZ
 f60sGRYK5bvSSUba+lPMmKggJchsWymW1BkaFaQ65itzXDLm75V7VUIgqIXrx/9milQwLWyC2L2
 7/Xl3zON7HOaj6BWFiEpQSqlBMFIbKbkKrl9hxXFPueOY568dEb2Bm7QntcIpHRgdktQ8YClTNI
 kOEHfsSybPwECrbH4WQ==
X-Proofpoint-GUID: 6qZU9FFw7EqmHG3ePoPViiBCoCRSiOsO
X-Authority-Analysis: v=2.4 cv=e4kLiKp/ c=1 sm=1 tr=0 ts=6985b94f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=lRp8J38LbmjWs85nxDYA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 6qZU9FFw7EqmHG3ePoPViiBCoCRSiOsO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060065
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
	TAGGED_FROM(0.00)[bounces-31487-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6065EFC3DB
X-Rspamd-Action: no action

Linus,

Please pull two more tiny GPIO fixes for this cycle.

Thanks,
Bartosz

The following changes since commit 18f7fcd5e69a04df57b563360b88be72471d6b62:

  Linux 6.19-rc8 (2026-02-01 14:01:13 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v6.19

for you to fetch changes up to e34f77b09080c86c929153e2a72da26b4f8947ff:

  gpio: loongson-64bit: Fix incorrect NULL check after devm_kcalloc() (2026-02-05 18:00:45 +0100)

----------------------------------------------------------------
gpio fixes for v6.19

- fix incorrect retval check in gpio-loongson-64bit
- fix GPIO counting with ACPI

----------------------------------------------------------------
Alban Bedel (1):
      gpiolib: acpi: Fix gpio count with string references

Chen Ni (1):
      gpio: loongson-64bit: Fix incorrect NULL check after devm_kcalloc()

 drivers/gpio/gpio-loongson-64bit.c | 2 +-
 drivers/gpio/gpiolib-acpi-core.c   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

