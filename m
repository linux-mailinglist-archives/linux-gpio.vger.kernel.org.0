Return-Path: <linux-gpio+bounces-31948-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yOX1KRosmGlqBwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31948-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:40:42 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C8166561
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 10:40:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87A0F30209F7
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Feb 2026 09:40:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1553242AA;
	Fri, 20 Feb 2026 09:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aMcbAnA/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VyzXtRlm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D34322A0A
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 09:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771580430; cv=none; b=MYwPZe/BF4+L6gQws4KLShj982IR6uKlCJyCnniUtMdaNeYEJPtjK6azHMt3I6fa0ViHIGgVwbEJcsZxXiUviIBEajxOZJHzWadNiIuXE0vuU02zArLX9udVuGUOf6zM8ecAorKVKrA6g9/9Kx6sxuEGerfOdmYVEYTan2pB4Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771580430; c=relaxed/simple;
	bh=V2rL7KivYHtYoS6HylBc1RakKzVa3bW4Jm18CFFDgio=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LCriGFCMtw/hzdJhq7XH/Ql/0oeW12xM/wGDqOn+26CMI5sKreO/Qs7twxi2lCXNVlrFUK1vQySAGV4Krl+c9w5qPelD5J66JhXbGQMxhIG3um6G0+Ppz6meX7St4gFY3MY+A1tB+G8Of+bWTFBih/V2gs/fmHHLNp3zfpkovuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aMcbAnA/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VyzXtRlm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5SOT22380894
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 09:40:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=i5x6tyoyyz3uOsCJKO9fGl1ATmhqZQMBho5
	d1xlP9CA=; b=aMcbAnA/JpgOVXU7ejzy/rxcRteinbIZlCLm3iyPmOKB+/Zfrgy
	ddQSjxQOUf/EHv+yC41NYJnLIjCIJ+NBRjTXIKrS5MJCZ6UJClUfQyIUYi5JEwbw
	hdX+o5hbTzF57RjElFV0m1cheUiQhaByBiJs40ufwld8pY0fIXLOjPxFWUG4ZcwE
	bcb3CFmJFY5TPCuoEBEk53rMG7piRijkZReViMK1DWTdBKLNRVgAStOVYy396tri
	G3OnP2xukZb6n0JPETBM+bURdLrO9EKmT4cnWESPbZKEYxkXGrR648XGdk3FFIHu
	9mc51s+zam9fRQavK/UxzU2Yv3KPmiEdljw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cechh98xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 09:40:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb6291d95aso2466082285a.1
        for <linux-gpio@vger.kernel.org>; Fri, 20 Feb 2026 01:40:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771580428; x=1772185228; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5x6tyoyyz3uOsCJKO9fGl1ATmhqZQMBho5d1xlP9CA=;
        b=VyzXtRlmNUZDXBhbNCZ5WDSKaCATHV14QOWPwo1NhAzO24jD4n9ICzTQHWh+hNZ5Mv
         jqbMnIjXRMvfIZFZcVjpvsoUqWhbpZt+e8SMPOk8Totg2o8ImYPl3qQk57mk3Pj27Pqu
         teBaRFCICIcAKnwEj6VGuaq2pezJL/dEAN+NrBqgSDyt2SJDNSsoLja092KH/loVXGtQ
         Ce2wrVqwBQlLjsYk0XkjSUhi8yGTkIxiZ0B79lZLkaOQjIKb/V+Cric5+vwpW6ce7SJd
         8n4HGkBeIGMC+zhsR07mbtoXie/TyOhspBVEuJV0kpcVR4fDpzEB7c4He0tmIcb1tg7K
         exxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771580428; x=1772185228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i5x6tyoyyz3uOsCJKO9fGl1ATmhqZQMBho5d1xlP9CA=;
        b=G6VSo0URjSb9Xstnk7my7qI0/3ks6+nr4YsLVf7umxi0ZYzTZO67xw6CsnysSz01xY
         4w6RY3n7eLizEXF2i0GujupmCrR6GVzLcggL3AazY6SCmDrar4/fb7zpqQd9fQWDknsH
         bJ1qdzug9UMNV+8f+o5fS3AFVDAPXG5s7NXhAQsJabaiO4XMaeYEyWkS1/9ynxb5Smi3
         /1wV4Fit6JRDQOdOiSfEZBE1p6qNzJBEh9Agki6OsFry5VL7zCWCePwwTF9N2jx84FO0
         DIdHgO7AmqAS4k/3sMmNDyBUxkx+Ys3QZie05VzN0otwq9sFUgMaNVqmg3A5ZiTM+Kl1
         gzYg==
X-Forwarded-Encrypted: i=1; AJvYcCUjy/LaB84YkxmcVtRJniDN7TdVjXGQe1jCG4ZgdAs1FMHIb/KOlYgCML8Lj2CtII62SVLoZZZ2sVCC@vger.kernel.org
X-Gm-Message-State: AOJu0YxNW9gWReunSuU1UwA4S07q7N5S3x1/xvAipCJeP72dIE1gR3T0
	WssAKaoAqEKIV0AYOV4tG8tqZFrHvWHoJAwXDn1PDmkmeUj/sGXv/VOJsQPHdtJ3iNJ7ZTlC9pQ
	3Y7OYkX300iQJdWhJIHgd4arGun9R6XCAuAAL6td/xIDBzzqReDSkkEiXYlYVFm9a
X-Gm-Gg: AZuq6aIc8oQo4+QWnsHR5YnNdxTEIzndg7LDk2+DwYPXO0WvCpyMqTYSNDKSbkB+xlw
	CsdEA2U/r826ceN2Is3szwW+VomsMyQMCoEzfF3NfIP4bWXVJblRy9UGA1jDXLhEHN7jSzGrvvS
	C2bqu7Mybw0BsZkhSMbSzLGi1DPadNhN/VgL9VqJt2KRyi9F/Q380vr2ApCTXItypRU2Zgo30yM
	ALt5W5zSCq+8yFLCeK3cFoDQfN4+xGw+jbgR1dcUqF9XXqPxxOzlrqiQmmtvsSU/2Rr1+Nz9Fnm
	S/Dnpat3Ip59gbydG6sbfM/l6na/KaKUwcT36GYNQfNYdITinsHWXa7gvGc8yXtSQ7H8mdkARzp
	3O+SR6omZ8C2zHKWuuW3BC61rgaQXglW6k7n5pMSak7CqfYqT+dI=
X-Received: by 2002:a05:620a:1994:b0:8c7:806:386 with SMTP id af79cd13be357-8cb4bfbe465mr2560955485a.34.1771580427749;
        Fri, 20 Feb 2026 01:40:27 -0800 (PST)
X-Received: by 2002:a05:620a:1994:b0:8c7:806:386 with SMTP id af79cd13be357-8cb4bfbe465mr2560952785a.34.1771580427370;
        Fri, 20 Feb 2026 01:40:27 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:336d:97c9:e7ee:e6fa])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c048bsm64422145e9.7.2026.02.20.01.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 01:40:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.0-rc1
Date: Fri, 20 Feb 2026 10:40:23 +0100
Message-ID: <20260220094023.16001-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: HJct6XitkdNHEDcJ9TDUSYS6idfaEVbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA4MyBTYWx0ZWRfXxrbJ27kEZDt1
 CoDOdkPkU0dlz779DCQ3lIxfmShAKKOE75KVeioyaX4SxCV294yaBnL/alwBeDTMM9ofyV8I0Bd
 418FXWshayQFmTwaUH14gidYQWSNJPBYWltKJDWtTTELzc8ypvBrnmsU+Gq+QenSMQThMn2cocX
 FsyumgalKrrGLArFqfdofx1R1ORzEJQvATI8wfvup1hEZ9freQW2tJ6i0NuKiHVwZVS6XUAae0U
 s8bzcIIc/yhNR+I634Nl3QXNKSg98HCna5mCZ1eVWdKoHkhpzqCYj0CRE+Mu+2ON3bEtm8998XI
 HpZT5jtYtL1xJRPef/JSSUcNQLdtwRuqEO57yDzg4rT/6YojwwGOBRcxmB/du61yxj5wyx7Zt1P
 NIVGiumTXSUPdMx1fA3Oxk0OuvaEHA5htALhO4KYP0cZmcPGl/gTkmsg07JOlY1lh5hh/whfsyi
 SrCkLos6bS8aANXV6qQ==
X-Proofpoint-ORIG-GUID: HJct6XitkdNHEDcJ9TDUSYS6idfaEVbX
X-Authority-Analysis: v=2.4 cv=KYzfcAYD c=1 sm=1 tr=0 ts=69982c0c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=Mt4fK7gLU2dDsOa1_ocA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200083
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
	TAGGED_FROM(0.00)[bounces-31948-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 224C8166561
X-Rspamd-Action: no action

Linus,

Please pull the following set of fixes for the upcoming RC from the GPIO
tree. Details are in the signed tag.

Thanks,
Bartosz

The following changes since commit d70178215211a7c73ecabeb55eeb0f8ef002bcab:

  Merge tag 'gpio-updates-for-v7.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux (2026-02-11 10:53:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.0-rc1

for you to fetch changes up to fbd03587ba732c612b8a569d1cf5bed72bd3a27c:

  gpio: amd-fch: ionly return allowed values from amd_fch_gpio_get() (2026-02-18 10:56:35 +0100)

----------------------------------------------------------------
gpio fixes for v7.0-rc1

- add a missing IS_ERR() check in gpio-nomadik
- fix a NULL-pointer dereference in GPIO character device code
- restore label matching in swnode-lookup due to reported regressions in
  existing users (this will get removed again once we audit and update all
  drivers)
- fix remove path in GPIO sysfs code
- normalize the return value of gpio_chip::get() in gpio-amd-fch

----------------------------------------------------------------
Bartosz Golaszewski (2):
      gpio: swnode: restore the swnode-name-against-chip-label matching
      gpio: sysfs: fix chip removal with GPIOs exported over sysfs

Dmitry Torokhov (1):
      gpio: amd-fch: ionly return allowed values from amd_fch_gpio_get()

Douglas Anderson (1):
      gpio: cdev: Avoid NULL dereference in linehandle_create()

Ethan Tidmore (1):
      gpio: nomadik: Add missing IS_ERR() check

 drivers/gpio/gpio-amd-fch.c   |   7 +--
 drivers/gpio/gpio-nomadik.c   |   3 ++
 drivers/gpio/gpiolib-cdev.c   |   2 +-
 drivers/gpio/gpiolib-swnode.c |  19 ++++++++
 drivers/gpio/gpiolib-sysfs.c  | 106 ++++++++++++++++++++++--------------------
 5 files changed, 82 insertions(+), 55 deletions(-)

