Return-Path: <linux-gpio+bounces-33323-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIBEA1HWs2mzbgAAu9opvQ
	(envelope-from <linux-gpio+bounces-33323-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:18:09 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D728057F
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 10:18:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ABE663066E44
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2026 09:11:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C7BD389107;
	Fri, 13 Mar 2026 09:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpvjvhD1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MXzvASKb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8891431714A
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 09:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773393079; cv=none; b=CCbnaMTb5qhChjj7QS1FZikSzBILowuLNI8olXLPlt1cHn+1Edne7DAiNEg1/rTRNO7phc8wQzNTLwgogqobDmkZyr3Paz7kVvtsf4NThvvnydJA5UcBM8WyAuI26e4xYbw+Pc2jgcmfbGXH1uzwypZSsITnz66R69cShE6LOLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773393079; c=relaxed/simple;
	bh=k/UJh4UZjGGPYyJbr8TNMioPtJ5X0IC1Gg/DjYTEoLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nhLZ7L9mAxR3I+lWVPO1tRqOsMU3qmpFaHHlL0rJ2MTPmGoNlSDD98TiYb6SyQISqmembvc8ujug2S/vnSDx3f1TCuP50x5FnN0D1beqFa36keszb3ivGDq0NSPgMAhm3AEUWRGtZUZAI66GqgLAINeqRC/wp582LFW0u8GSWEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpvjvhD1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MXzvASKb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5th5R3342923
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 09:11:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s3glPrJ/nBOEUBPv4cu1KL
	0dEGZIdUd65zm7Nv5gSIg=; b=OpvjvhD1ZnrIHzTMXjKHJUqRrNJUbdDQRiptJY
	eMk6sqoO9E1otKN3ktkZ8ygfMDacIKvy1FCTZsG2V7iQ37vlYO5VxjW506Yp7GIA
	Rf/ThAF7PLj8KH6zenJTPFSQkX7x0ANWAhLX3FfbksB0BconoI8hq5L8ZbIuB75E
	N9X8S+9/iJvGKsZiunJdOqU+JiuLKR1HYaEpEVwkXxNaiWbbbn8UkCSDivHotv0F
	Y3yd9CY9Z/08ur3eS++ktGBRSYJo/W5wqumvW7KAGquJoPe0Vc//PPNL61vfsNly
	TGFC/KNHCtrqiAiurvirie0SCn0GsUsL3+Gb5/SC75W5KjVQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cus9w43pr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 09:11:15 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd781c0d90so1679694585a.1
        for <linux-gpio@vger.kernel.org>; Fri, 13 Mar 2026 02:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773393075; x=1773997875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s3glPrJ/nBOEUBPv4cu1KL0dEGZIdUd65zm7Nv5gSIg=;
        b=MXzvASKbxccYRfje1n1+Ll/JBYJdYTG+PkL32Tj5/z3raZep5PDpJRKG2xd25J0cdu
         pPx17s3jXFpZ4PS2kAfCmeTtP2Kro2+ER+dpG3yZUrzyo6AZOPPRmLvUZGTzsi1ud7WH
         9qfxB0xL9CBE6bbQg54dINCRD+6T4WuwFGV4VCCM5zP8togZNQ9HcTO9bhgFutydouX9
         K+DNELe2Jb3gs2VCFp4XqQQ8449e7BEUaLmuGXptlTMktJ0EEHoBMSsCFx+OTOmZJPTG
         xl4iLDjzzHysemHa3I20s3n8bt/4UKGgdnfMDG6FAHsoqYp0TH4UZ9sIkkpv4gpx9IMT
         +wfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773393075; x=1773997875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3glPrJ/nBOEUBPv4cu1KL0dEGZIdUd65zm7Nv5gSIg=;
        b=Qld+BGsmVSCeRT7bZLO2g3CckmOTv7L+2gvZ7gIjh4aoBvAbPAYXYZ7R6Nixr1zatR
         U83aDWi3K40KpXaoHx1Jlu5EU8vIyTg2hClWV9E4WbURT/qbbVOR6H85BJxW3uZ5xMgP
         3MnTQB6KImXb4do2ijiqQin/q+jfXYg7ZbbFbKbE+j/8Nsuuh6XyqOVfBkFjB6v9nspu
         EgM2iF9qmYZ6LEHzUEFbr42ruFs2Ry0gvCFHIORRqBs7KJSfXgZhODPa6JvKfExXxv64
         whFAnxyYQ0UgSDnAlcH4zQCsHkvCONpz5P4KNUaZXodCBWqb3zTwhLHNtO5AA4m2Skxm
         Fg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWiBmhjwq780GBT6hKUD3hu+wnjQmocDXxFuKNFMWKN5XHTKR4wRnFVdS5dIECX7UJzFEIjndwDWxig@vger.kernel.org
X-Gm-Message-State: AOJu0YzbNrAXtHzEoxWKcIAmFQtEeFoMOcNQ2gP9JhKgJ/m+ff8mmt8V
	crMEZQI/f1C220FDOExguLSjSHmYDA68BrxVucmsyScR5eRn9r+6G/Pr2kHe1GLznkr3e2pGdwG
	wo/xcGdF28pQAG3Dg3H9V4DRhxE/LYoD0aszbYyNkLMrYjryu2Z1WIZm/6geqk23x
X-Gm-Gg: ATEYQzyAKr5KnE+nSXpyCufv988AW7ffqQ77Mzdv5gCWErqpOZszLsxtRKmohkyuYIa
	nU9219CvxxEkuWVocxqTfIKttQNGv+6d4i/Bm3fwqm/CZeK2xZBFp8ujCSsf28TU0p5oLk0Ni6S
	J7NNNOPwiDhea5K5voiMxfN+SzNN+64OhiH3db+qt9G1EGVprBEjJxwcA4ZCzBprRFdPm3oC3mW
	bRUGy+eW9WZ90EyFhOq4zciVouXYP1fTiq21ESwQV1tUwZAoBXbdyQxAKznekHh5VLp1cPuYAC4
	Ot8E3bIssBDKfIaONuN3YubQjQ3dZrBbwsAs5kMsLCixX6lcgesH56sqDfAVMpZMQnOOE9acpWc
	q61s80468xNCpNlFSB+tWijGcDcQ/912QUZRjb+x5d6VSocAen7U=
X-Received: by 2002:a05:620a:700b:b0:891:7008:f2e0 with SMTP id af79cd13be357-8cdaa779799mr924488385a.8.1773393074846;
        Fri, 13 Mar 2026 02:11:14 -0700 (PDT)
X-Received: by 2002:a05:620a:700b:b0:891:7008:f2e0 with SMTP id af79cd13be357-8cdaa779799mr924484885a.8.1773393074377;
        Fri, 13 Mar 2026 02:11:14 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:840f:d4e5:5fc0:62f6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541b6f6b7sm350529705e9.9.2026.03.13.02.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:11:13 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.0-rc4
Date: Fri, 13 Mar 2026 10:11:09 +0100
Message-ID: <20260313091110.7691-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DDJxvke7M0WEEQF9ukA-vWNGTy4uKIdd
X-Authority-Analysis: v=2.4 cv=IIIPywvG c=1 sm=1 tr=0 ts=69b3d4b3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=TJio9yMj_ybQtvrh6VIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA3MCBTYWx0ZWRfX6e/Bv82UOp18
 mZ+GG8P/JBUoUy6+T/MC34aE9v8wtaWnFKFinXWuo0FUp5npq6HHhDOZApnFk9b+4tZLdUIitrN
 GVo9QNOh57wIA0+0gKt7sAdIt8Vnz1zUSrITqbJQ/uEaqCJteoH3Zf1lZSICZQ7EZzGPWrowX//
 C0LQHwuL7xWVTztBKXZCytrzb9F2P2UXcpFHbi/pbJiix4HZc5DEwhpcSUv/xfMrJTtfDzX1OR8
 bJYA5VBD+YKG1io4p/gsa/BaHS1CWii9CxAtvVtLK04VG1i0LgAEhGKdRcCvn81sBAHObcDYFeY
 HGc0edU47x6UbCWkdALHQw+/qllPkh8NIi2dzAXxMDFlCaw0JRcvCjsNpJ/HdVrBUatAeX5GPZX
 m/GljY7CWZfdI1F6D+FSQdhG0qFqsQapbSBeFFFC3T0125tbdi+LROV2Vgo7ieJ3Mzc38xAMybt
 ZlUMUPlH0ycZBQgKQkQ==
X-Proofpoint-ORIG-GUID: DDJxvke7M0WEEQF9ukA-vWNGTy4uKIdd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130070
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33323-lists,linux-gpio=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7D1D728057F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 11439c4635edd669ae435eec308f4ab8a0804808:

  Linux 7.0-rc2 (2026-03-01 15:39:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0-rc4

for you to fetch changes up to a23463beb3d52815e5f8e61998f5c94f13274544:

  gpio: gpiolib: fix allocation order in hierarchical IRQ domains (2026-03-11 15:21:43 +0100)

----------------------------------------------------------------
gpio fixes for v7.0-rc4

- clear the "requested" flag in error path in GPIO core
- fix a NULL-pointer dereference in GPIO hierarchical IRQ handling
- driver kerneldoc fixes

----------------------------------------------------------------
Barnabás Pőcze (1):
      gpiolib: clear requested flag if line is invalid

Oleksij Rempel (1):
      gpio: gpiolib: fix allocation order in hierarchical IRQ domains

Randy Dunlap (2):
      gpio: timberdale: repair kernel-doc comments
      gpio: nomadik: repair some kernel-doc comments

 drivers/gpio/gpiolib.c            | 38 +++++++++++++++++++++-----------------
 include/linux/gpio/gpio-nomadik.h | 12 +++++-------
 include/linux/timb_gpio.h         |  6 +++---
 3 files changed, 29 insertions(+), 27 deletions(-)

