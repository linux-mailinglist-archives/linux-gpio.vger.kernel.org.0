Return-Path: <linux-gpio+bounces-39386-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V/P9HvttR2qnYAAAu9opvQ
	(envelope-from <linux-gpio+bounces-39386-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:08:27 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C71856FFE5D
	for <lists+linux-gpio@lfdr.de>; Fri, 03 Jul 2026 10:08:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=JemNjQAX;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="KZ/4aUno";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39386-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39386-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 377043027947
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2026 07:59:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62F48370D54;
	Fri,  3 Jul 2026 07:59:12 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7515C370D52
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 07:59:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783065552; cv=none; b=Mn152mn6a+T3bx59djxMhNRsJqEGe/DnaBQ13bVLFwfi3Wcl9MV7ow4m8tK+bostmPGqrh1VeRiFVjn/Eor9QjlO0+aO4q8QZ84j54rdv/hR4mdl5TV95HthIDJXBGC28jmGYF/LNJXCjpnV84s8efoIOYzcr8I4Hyq3MDuHFso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783065552; c=relaxed/simple;
	bh=WiAt/s92DyJAnxsxMYowTyzt8as7Lz9B/ba8ltVSqWM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l7j6kxMyNCqgkhAVwwxkkOtFe6agMi4eUpBRLC3ciORdr9vosRsj35Vi3O5RI9f3wOR1IHImo0/A7DaKJZEL/Wf08cgFig380aJZdlXMOuBAhTMwvcHYNd7KAzHc4t1J7zZT0MH1EDKJfFepBWoxeG3wPFaxT6jPov2QiKFcCxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JemNjQAX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KZ/4aUno; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rfB92994888
	for <linux-gpio@vger.kernel.org>; Fri, 3 Jul 2026 07:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=OC+AHfo3Wn0I8cepxt2BxeG2gOf85XB6iTk
	hHld2ih0=; b=JemNjQAXDBZfcAx5Ol915m1RtWdmbMKvkt3ubvwKVFd+92IWJ0x
	jV8SFC85QrlpBcvLXssOczQrXhPfUOopSaQx9aOqwYhHHG+e3q0CvX6FWEBFc/OQ
	3vC5dn+RBxkHv+QHKhm8pg28Xvj2SBBnd5VEfd72iXSJeh8Gb/3B+Zkribv+w3RS
	IVXHJ1SGfI4817gIroKA2Y0h4PZbqCW2tqFtLj0t4SSgqolx8ZZg2DN/elhjXge/
	U+kANY7P1MT6uFaAK/jHBeeVbaSDN03exiJwlUe/4r7ffdtn8M1EuyTyTI5cZb6c
	oiv2+92JNJIAAjQo6w/UpW8dnFegi3KUP4A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f648n1ba6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 07:59:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e73fc29bfso49036685a.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jul 2026 00:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783065548; x=1783670348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OC+AHfo3Wn0I8cepxt2BxeG2gOf85XB6iTkhHld2ih0=;
        b=KZ/4aUnoAYG64oF905pGgPhVuis1SOt6EuzQriab7pKv8cMPFTNWtKrcAQ9/rp69YE
         vBoP8jJIPLY5gr5vIY+7f+lVjcBqdIbHOCMil1IMmfh054VXhsv81BFWuZkxiFagYdb2
         PMZTovAVmFty6CF7TTjmF33nKGAKEWOgud6Q0OmY5gLmexsXPmViEFwR9uk42XFqjG98
         lHNiiI084ECq58U475ulbZLnEr9QaSC1HQBUsC/5rbsXEx1QMSBxVr/gQXKRY/LkdH9Q
         cppePBx9CQ5I9CF7Q12svCRMP60MWPtiLckbVmCx/h+fIhf0glRLO8k5pfMnZlHy6o6g
         RkpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783065548; x=1783670348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OC+AHfo3Wn0I8cepxt2BxeG2gOf85XB6iTkhHld2ih0=;
        b=B8n+/lMD5EESd92LTGjPR+Zy5ra/RNZnR6BWffhn0A3mPPPhPEbbEWS9g2imMCSmDJ
         owgXKwZYA1Nx5dpgYWRc2ORbsSqzw0+OFqnCQSuisTdG/1N+7fDg1A+d5Xp9EEKR61Jz
         6X/ia06xvmdads+ur9b6kC5LVFqIrgemjIwHMstPnTRA0qHr+7u94V3eCIuj8K6TkMOa
         8DH9Xv/hBMetBQkSWrmLGdX6hgA7UR0qshzVIk2mdRXP90syoUNNHygy2q8n+syKqRuM
         v0oxbww86NFDTSuAO+ZcT91CSYJOJZYz7xYOkCO5nlJZm2h+4V3THx9EoS+02V8wevVy
         1UEw==
X-Forwarded-Encrypted: i=1; AFNElJ8a2YYUkgyPMsRwAKaxG7rzIfME6IngRMCBxJo0FzZ5VhntYFaoDpbd4qf2NUb2NgCRTgpuIWwimHPz@vger.kernel.org
X-Gm-Message-State: AOJu0YxD4m/mamxwQL9Yp6y9TH7J92E0YZKy9ZpR+LQlFeQjJjxJ2NUK
	2a1bR59W5xoS/6goT9sIOIFbkVuqFa/zM7i59dMLcO68pYnEZv+fbBgBOdtOK7AEp0h758oV7Vq
	E84vHfFoY4oTADNr2Dyz/Y90iIG0ssx1FjKn4H0h+/Kiad8RUyRT0m+3ZUmuE8vOb
X-Gm-Gg: AfdE7ckJOLmCLb+ApxEn8lgIeoZgW4bP8atH5XuqrSA1GEFa0HP0jVFcLnEZ0r1KvBb
	gPZOJnZCljRBDD8xrPAoqIjl+hWji9hr19+xRPO/K7H4En34goNXr/GGXrRBI3uVzZT1o+zYkDh
	TdVHohhNtXgjJGpxaActoUCDSgFRyCDmAGaFEnqWTOWTiHD/UPhFCnfmDmMHQ8edsxqFe2HQUCs
	aUttoBgUPPRv7jWJ0zUJhweD+bNrZl68+Gw8kGJjn/dgyet4QgeoOd4n4jf+nkT8RQsoLEea+hU
	sTrL9mTBkqWCU5PQNYaZfhCxmKiPiAmhF6cl4q+nfz71qOhjvMVWvm4EgdDXK8WxxOg6xBftwsW
	pKiCkJR7Cziesmp+s3a23QoBR0N3OfqTDs9XnhRM=
X-Received: by 2002:a05:620a:31a7:b0:92b:6805:9191 with SMTP id af79cd13be357-92e785486cbmr1154122385a.73.1783065547690;
        Fri, 03 Jul 2026 00:59:07 -0700 (PDT)
X-Received: by 2002:a05:620a:31a7:b0:92b:6805:9191 with SMTP id af79cd13be357-92e785486cbmr1154121085a.73.1783065547233;
        Fri, 03 Jul 2026 00:59:07 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:b934:1281:e054:26d2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-477db8a4b73sm15568335f8f.15.2026.07.03.00.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 00:59:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.2-rc2
Date: Fri,  3 Jul 2026 09:59:03 +0200
Message-ID: <20260703075903.5102-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3NSBTYWx0ZWRfXyrPh8fyuVAlD
 GRFlqyPQtH4fHBKoPBTDgD6q1YZ+QXXTIg/N5TUpUGCE7Mmo/ydr98dgfecUsr+sHRr+xSC7RF6
 NPtWP62sqp6BljCH1eYAIsGfX2ErB9Q=
X-Proofpoint-ORIG-GUID: gls6q6-sei4ZJG74pdgXWL5No-mgmk1F
X-Authority-Analysis: v=2.4 cv=O4wJeh9W c=1 sm=1 tr=0 ts=6a476bcc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=fQiAjsGaN5YPOirGohkA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: gls6q6-sei4ZJG74pdgXWL5No-mgmk1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3NSBTYWx0ZWRfX2PwMS9H1kIul
 RZIBCMUY5jAzRqCRUYvih4dbbsOl/Bzc91o+DWLj8AB+k6wH5AOIVcchDxL76S7ACVzLRbRbTut
 R7XsH6N8438DCf3NTECnC7kGrb34ka00uQazJX4NgwAs8MLEBJbwCb7ZR+KwIl6hcs8OZGB45aW
 3YPya2vmVLHFvq6f4Xnx0IoAXaXoq4+DVjtw5cT/emJMsml4+NW4BbSB22dYsmcu5PRT48ELhVK
 DOhoegrBHG6oEzaAoxbsQA7rkTimaKewEl4aqN9J5ziaxLYgy0O4FZD78wLnOfqCmfpDTR7jPgf
 /OVGRtqTh1m2efZYNNphvhSbthxjBacx/8x+E7i3S2/DqmJzuRArVT1BkTwja6OVST9YCp2Tw9h
 koVHDOybVPHqm3zMtk4suVBx8rwqZsXbvq4GdybS/cAYbOiipmyXtEs6xasB8YnflS3JFtu8IPG
 XmwXZtiyHJcYkqVp97Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-39386-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C71856FFE5D

Linus,

Please pull the following set of GPIO fixes for the next RC.

Thanks,
Bartosz

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc2

for you to fetch changes up to 9777530157e7b82fd994327ff878c4245dadc931:

  pinctrl: meson: restore non-sleeping GPIO access (2026-07-01 09:26:40 +0200)

----------------------------------------------------------------
gpio fixes for v7.2-rc2

- check the return value of gpiochip_add_data() in gpio-mvebu and
  gpio-htc-egpio
- avoid locking context issues with GPIO drivers using the shared GPIO
  proxy by only allowing sleeping operations (atomic GPIO ops don't
  really make sense in shared context anyway)
- with the above: restoe non-sleeping GPIO access in pinctrl-meson
- fix return value on OOM in gpio-timberdale
- fix interrupt handling in gpio-mt7621
- support both A and B variants of NCT6126D in gpio-f7188x

----------------------------------------------------------------
Bartosz Golaszewski (1):
      Merge tag 'v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current

Paul Louvel (1):
      gpio-f7188x: Add support for NCT6126D version B

Pengpeng Hou (2):
      gpio: mvebu: fail probe if gpiochip registration fails
      gpio: htc-egpio: use managed gpiochip registration

Sergio Paracuellos (3):
      gpio: mt7621: avoid corruption of shared interrupt trigger state
      gpio: mt7621: more robust management of IRQ domain teardown
      gpio: mt7621: be sure IRQ domain is created before exposing GPIO chips

Viacheslav Bocharov (2):
      gpio: shared-proxy: always serialize with a sleeping mutex
      pinctrl: meson: restore non-sleeping GPIO access

Vladimir Zapolskiy (1):
      gpio: timberdale: Return -ENOMEM on dynamic memory allocation in probe

 drivers/gpio/gpio-f7188x.c            |  6 ++-
 drivers/gpio/gpio-htc-egpio.c         |  6 ++-
 drivers/gpio/gpio-mt7621.c            | 25 ++++++------
 drivers/gpio/gpio-mvebu.c             |  5 ++-
 drivers/gpio/gpio-shared-proxy.c      | 76 +++++++++++++----------------------
 drivers/gpio/gpio-timberdale.c        |  2 +-
 drivers/gpio/gpiolib-shared.c         |  9 +----
 drivers/gpio/gpiolib-shared.h         | 28 +------------
 drivers/pinctrl/meson/pinctrl-meson.c |  2 +-
 9 files changed, 60 insertions(+), 99 deletions(-)

