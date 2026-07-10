Return-Path: <linux-gpio+bounces-39800-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 91ViNvu2UGqf3wIAu9opvQ
	(envelope-from <linux-gpio+bounces-39800-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 11:10:19 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E48BE738DF0
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 11:10:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jbUh1Qj7;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bHlv0mOZ;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39800-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39800-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ACA71310C10A
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Jul 2026 08:58:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13BB03DBD41;
	Fri, 10 Jul 2026 08:55:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0F43DB96F
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 08:55:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783673728; cv=none; b=r8J0hCNb4RPoM8qt7ubmAh5Fqczf3GXHdvlFFtN2UMwuWh3W69qsJKVi5g3JzSbdMZbslBaxUCshLpByXlJOlmNNJd+jq5ABz03/Fwji3Rw4CSUNzKjQ5RsYc6PlT7N4qJL6yeKgU/rtrX3Vya9OmpBxmuvof+Xc5xf2DDTj8Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783673728; c=relaxed/simple;
	bh=KQZMaWFsx3BFSO5JutnY4YhWjtH5mt7sHk+supxlGm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CdL6HfEAkGS6HmZI4Ge/eJOMrdI/CDAaO8zx06N4pW3b4ToPKCkPD8lLT9Kbb6yMxWsGiYtDUNpl3cX742AuBIDzVIqr1D2v+jvQ2xuRmcrxyTIGoSjT+1pdeIa6kYtFufIJ2b8fi41ndGGIXE3s8tGuh/f8X41cXW4js3fBVpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbUh1Qj7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bHlv0mOZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dUCt4156533
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 08:55:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Sn9umgUgBlL33I55IjEVAMTV3nOOq1QR5lX
	ia9dkOCc=; b=jbUh1Qj77jVuPTc7NannuGy4AQawinKzX+vsiB6oO2Wg6zqRV3X
	ITnuU16k+VkbUpxcUYyGTSulsCCcr2RKVtLIyqa92lHwbyoSlMoCyuMA54MN7hnI
	yZT0VYl7Xn0Y2mbQ7edDWEBahdMUE77WCdHYSHibElP6oSsrfUelezF+URvd92f7
	6bP0XzSzsT4ZcrgENAcUL8Bo8M3Y7PJX1eKX7JdntIAiH+HKEl/P7XZm2pkho9CY
	ciam4C3ZyYwGv5PCW7H/3/PYDkAbM+KjZNZPF23i0ugZB8Boiv3rLVrCEhboOSJ2
	Xr9b8NYIHLHldQ1//knsP+LsF84upkThpMw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8jg4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 08:55:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8db414c7so10077061cf.0
        for <linux-gpio@vger.kernel.org>; Fri, 10 Jul 2026 01:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783673725; x=1784278525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sn9umgUgBlL33I55IjEVAMTV3nOOq1QR5lXia9dkOCc=;
        b=bHlv0mOZ/UFweDjRzBTvkoCQe4qcsw87ImMEK376NWH74gnkK6znenP+/4JtfPUuo6
         zYJ6ciaqMBy9p7lw9vOLB3v4pQlP8RzeYiMt0M/Y+JB/76auqb6ntLeEGClwo7Op1NGg
         9e0eG1ZTwMZ/Hll4bQB3WECR+W4yHiFu6xhwuCgCsJMTL3ce1adrP8wJCenq+nPWlZD9
         DSanyKMAuFgnZLAqj+osDn0c179U2tHOFJqQ6BSc0FYT/T9Oeb71pXpHatnmTOaNrOIw
         XNBlBBH2UKp7/q3eVIxjYnf99RTozFL7svVMOzh6LD8XFgjtArAwUPBaL9kG3tCTeEzX
         jY8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783673725; x=1784278525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sn9umgUgBlL33I55IjEVAMTV3nOOq1QR5lXia9dkOCc=;
        b=YEFZ5Qob4zvyDJCYFwDcb79yIzUXhSoIcWcg9ngRYVU2EeyUql4VDj5GWiipOGvsIL
         XOELVH0CzohuYi1kIUhy87i6I0fORQ+4HUXxXtdIANJQxJq78e1JNbRYYBmmQXpXgtCd
         5XLVLAdJhGshmcyP9zKUEkmBu1LqSrr+Ibqgmlj1ZEwFbnffUTRAJ+YEjlc0Cs6OPmbM
         cg6va7Z6WeVCK78nCmBTf744olr2j2J4S9SH18RM5dWfhwz/qAUM/soNT12bzYIyuM8K
         LoCNr2ZnCgcjs1+14FheO+YXa67lqjgfjCyk8wGdCZpERkjdwFGh11/yQPxael3gFynn
         LFVg==
X-Forwarded-Encrypted: i=1; AHgh+Rr4vbresclzoXU7/I2Tp+QAb7+gJBitzP4GHMHpXc7gGqD0Vh5tHm2uPGyd+1XYEAXlt4lJcVpQ2zUV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/bkt3y23Bt4yJJ323S9Lt8rPVTvH/UYQ9Tg9+gxQ62l9rEgT+
	0b9uA6r9BPSZhbnhaZhH627JF6/ZYFTlA+nO6HGd0Jl0bfK35L1sjq+xTgXR7WMTTfBENqfg7wW
	NsEd0KvJETia5L2M7IIIXqjCDuLXtVVO4jreBt2wJY/MmB7zm8HtaJjhtllgDqj8D
X-Gm-Gg: AfdE7cmEEv5ACk5WZEg+3gJM2BU5CmQcETB1nw1xw7v+exbx4Bt+dPKDLg06yONSoJt
	gB8JGwGF0dQh0C9WAEmVJZ9xuolf3f3cSteIaSvxCAb6DDvAP7Cbd+F3eqicn3gcVww8DXAyjw2
	E4j3B0JwUL/qzrub+Afpp2gScaPoE3eBSP49Nj8dhLIW8ndR+yVcVUwAhjpj4oar7EKKCin2wy2
	gKJwEZVzcEFzSqk/z1eC5Q6Skk0FB1ECHFjyPMfSoV5ij+zbP7Tqns7YEByZXd7C+1B5raVnIhc
	CHp9LLdVxgaAvMC6Y5mFzYNj5jF3S3o3Toaggi+QfdtBV2LhUV9kArAsoYmarUAaAH8UlErZ8+E
	DmRn4PgA/t5J8ghcpjwY8uOSr/llWgmkLhFrQik8=
X-Received: by 2002:a05:622a:1110:b0:516:d943:175c with SMTP id d75a77b69052e-51c8b49aacdmr112274251cf.56.1783673725408;
        Fri, 10 Jul 2026 01:55:25 -0700 (PDT)
X-Received: by 2002:a05:622a:1110:b0:516:d943:175c with SMTP id d75a77b69052e-51c8b49aacdmr112274121cf.56.1783673724975;
        Fri, 10 Jul 2026 01:55:24 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2dd8376sm27888545e9.2.2026.07.10.01.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 01:55:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.2-rc3
Date: Fri, 10 Jul 2026 10:55:20 +0200
Message-ID: <20260710085520.8412-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: eq45HWeRws1esuR_lL31Ez8u0f4ZxskU
X-Proofpoint-ORIG-GUID: eq45HWeRws1esuR_lL31Ez8u0f4ZxskU
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA4NiBTYWx0ZWRfX/XapLYm+386J
 4h8jFUV4p7IFuw1U89maUTPXberC3BjdQSbSjlh/tsi4ylhIWIvjDwBPZ23ufAW7NSvTFN36+7c
 21AmuP2XsYK5LXQqlBRpzeVci6w/ISc=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50b37e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=dDTvrRnjQywnSBWMsyIA:9
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA4NiBTYWx0ZWRfX9VB8TcUToNK9
 pX5TbOVcgRa8F3ypW1g9HLuuAJZCKEYUuYRh5tVooE6cApjEVhyDIhdd9/wAjvupmYYFbaIawIr
 eYpMeiXrGLgPgRmVzoeRJHCh08Jaq/kESwI+AWPwvGO/LWW2s+Ts4pYCBvWIYNqGq5hXt7NihWq
 PUj7elVqrckYmXdjSK1mw9r5ucnzMWsVMRgwluqtlgNj9gYhT61L1vUVDKByIr/0OKyJgYPMWRM
 /8RIDqVkZj0FTYFOsiIOABgBjko4khqSjvod8NzMhYZYpVxSTJ9NW+spZMtd2LD1d3wN6MrMi3V
 xEvP3AjhqbYoHGQCxXb43ATtpwGb7HBc2++11BCq69z3J/xM7AuJ+T8eMMqXvVnFfd9NSJAoMud
 CiQutw7OR1RbUlzXCmlymRZkBkVuhcJhztlHlxoYbC69hA1jc8VXtBGrqcam7tz3+VJR93A/Kpr
 RQvW0Mbi9de5qSm+d+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100086
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-39800-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E48BE738DF0

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc3

for you to fetch changes up to b11c513ad943f35cf5e8007d3a56279c79b7ed4b:

  gpio: mvebu: free generic chips on unbind (2026-07-08 14:05:11 +0200)

----------------------------------------------------------------
gpio fixes for v7.2-rc3

- provide the missing .get_direction() callback in gpio-palmas
- fix interrupt handling in gpio-dwapb
- add a GPIO self-test program binary to .gitignore
- fix a resource leak in gpio-mvebu
- make the GPIO sharing heuristic more adaptable

----------------------------------------------------------------
Andreas Kemnade (1):
      gpios: palmas: add .get_direction() op

Bartosz Golaszewski (1):
      gpio: shared: make the voting mechanism adaptable

Cihan Karadag (1):
      selftests: gpio: add gpio-cdev-uaf to .gitignore

Jia Wang (1):
      gpio: dwapb: Defer clock gating until noirq

Liang Hao (1):
      gpio: dwapb: Mask interrupts at hardware initialization

Rosen Penev (1):
      gpio: mvebu: free generic chips on unbind

 drivers/gpio/gpio-dwapb.c               | 96 ++++++++++++++++++++++++++++-----
 drivers/gpio/gpio-mvebu.c               |  1 +
 drivers/gpio/gpio-palmas.c              | 19 +++++++
 drivers/gpio/gpio-shared-proxy.c        | 66 +++++++++++------------
 drivers/gpio/gpiolib-shared.h           |  3 +-
 tools/testing/selftests/gpio/.gitignore |  1 +
 6 files changed, 139 insertions(+), 47 deletions(-)

