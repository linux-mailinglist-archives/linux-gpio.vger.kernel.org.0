Return-Path: <linux-gpio+bounces-38874-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id nnwYERnwPGq8uggAu9opvQ
	(envelope-from <linux-gpio+bounces-38874-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 11:08:41 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 394C56C415C
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 11:08:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=oW4u41Vu;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Z/627Sfa";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38874-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38874-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id EE6F8300A27A
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Jun 2026 09:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C010373BEA;
	Thu, 25 Jun 2026 09:07:40 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07162F8EAF
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:07:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378459; cv=none; b=Rp4X4Mz/IhjgfoO/7CauKNHXp3qJU1Giull/Vx8TFxIUKm5ZK3bpdVij6I53C2yb3bYIA9/j8W2VLjTTZdTGwPVBp+l+bFwaijv9TqIWObDM6hSxSOMJ/TQqmdv33nWYFDUpyVQqbmZNLXzefseaU52faiFaXPRcZbvsNfucNTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378459; c=relaxed/simple;
	bh=ceMcrjNYbCvZiZIXsW4Ppo3V4nUaRYZ2ACZmeN54qxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o9j4Cp39wqUOOmpjBAzvVQPIcmldz12RGWyRg5WDQqDrRf9n3LR+/O5mm71yHuYYbbm0gx+TeiZ7XhI+mCEE9/brkATxvte/DvF7JP574rq85aDqSoZfTdceDNU47tZi7mQ342yvGoY2zVH8fVA+SLtMUmVBYMxouBA7epTRLPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oW4u41Vu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/627Sfa; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P8pbNG1345898
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=vYdhJze0nhHjwjtggKPzDCdo91RqpBppHm0
	BlfxuxTQ=; b=oW4u41VuwJpmKz4MArAPwC3hkqbjGBcEAn52am8EWJfy8OAQtwb
	+W8sLqVfVfijtyWlxUVEctGqIPtF8mHDwII4qoCvZiVNqHDFpcUEeFHOtSYneIO3
	v69CokECoENOH2s96+WXgx5DOn0G5I6ixT7rtxSuvTkv4suLVKo5YJW/91rkAtsd
	ECzoKif0hoJFEVIReonR8/7beyfhQExflf8XBRPdTYbHz0W7JPowz/QBNpYBWbK+
	4WMfA5apD3SfifJ9+QGP6gUkxV5lCDowV0lj7vCruilx4YViPx4asqFz1/GuViEj
	JMuihZEM7/DZ9uJEbN3WzN3VCgH6SnW/egw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0nv7jjky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 09:07:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-91931144870so382182285a.1
        for <linux-gpio@vger.kernel.org>; Thu, 25 Jun 2026 02:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782378457; x=1782983257; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vYdhJze0nhHjwjtggKPzDCdo91RqpBppHm0BlfxuxTQ=;
        b=Z/627SfavtnWTDqbKGVQWxMPESYqPC2Ns23YITKBkeXBdJoy1AGk+Es+lNLbVHQ9py
         AdltOXCyS43ng1DmXuvoTiFBbzHlZOt0+YBb1gCFV/6uy34NPq13/lTz8bT9ysBMZ03a
         pw4Bb+71tMgk6hL5kmAs6tV7OLUzIU0M1VsgzSuWipeurwi2VItd2NG/l/djFnewR+m5
         /cK3mOTQCXY766KXxfkkIxObAWoFi+SQADXKLq4XYO4Y+YoBdIkG+Co8FBqulIqG5U/u
         QIoeZucwDNCesnT65qP1pnrxsu0w9y0o4EixVQZScRiZMo1EOcbGOkEhLdTFpn8BmXL6
         5BRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378457; x=1782983257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vYdhJze0nhHjwjtggKPzDCdo91RqpBppHm0BlfxuxTQ=;
        b=A+681NXt40bXW0CodcRjpWC2E86VCZlXnOzZ+8lApFdIUEXgVavrC/RQeyfPEEufgf
         vHvaF7vz7jIcOsSercXCr5dJxluw+UJDfGqmEGln2IBfJh+yDNUGaBTmeTSC9VyXeqLa
         yUGx8fqQoKB4diQZwTz8vHDZcs/D/uSjfxP24fuH315vxZ5QhegzHusCvNNS9o//c3Wh
         Zfrrg/Rvzz0/WqS/NlGq9SAP3UWf5AefW82gkbKgabyx5hIGYUv3SqfPozPAhyYnFOq8
         LK1gIhgv0wt5ZgDg5pWpKV0ISR5jg0uWHmd8MNtWE6MGaIozWB4ZEuOsopVGyU1a+UzK
         f+fw==
X-Forwarded-Encrypted: i=1; AFNElJ+ah+7AicshhSCzGT/PeFWnuEMd4QgYLAOpXJqdYpkyJQOmX5ZXMNSyPlMQKKo1YiicJ+sxBJBxTc0D@vger.kernel.org
X-Gm-Message-State: AOJu0YycKAtkuBBdZOTbnxmRIxS0V56CyUXB4mAOZFf8v10Pars++VOY
	FURbNhbJy2xmeVGaJbeHIXnEwtKL1a4jQmbxTahSHx+eUFo2Dx0h29ArrPQnes3h00vYJqVEZxK
	CIrx2nrnGVd6/vk0MxRP2eend5geIsYzTXeUOuKbx5A99gnydfmykpgfJMO+zUcCF
X-Gm-Gg: AfdE7clqt0oxL3O7EbcLCMROsaMhdzpLRzhKN1NozytTL9rBjxvdiElU948ccuoJlDl
	pgPD8kmmh3ATn4OwaCeIed9oh+M67C1tpC/nZYh5QmhT/tdqKt7raTPE1IfS+1r31mU54tyekPD
	dy3clVC4Bq3jfvGpmLezYyMBdVbbEoRhSKS9u+qWCI3iOc/Ij22+pSsbkkpVtPOZ41k1L6l9WPw
	KhLM8b0juzf+91AOPphR65gioGCbsPB5M/tGvr6oEjcVRlUfnk4hRt0fQByV//4boYqHjA/nLfP
	JF3ksZcHl1aPOHRab366Km4uRjOg3cz5W7GNJmsZ+MksYR5EHhBneHXlxo4uCkafkx+Yt0e4URW
	unLAJPSnJ8ly2GwSsS3NqLljX4ZaIFoFe829GBnM=
X-Received: by 2002:a05:620a:2984:b0:918:42b4:2c9a with SMTP id af79cd13be357-9293c02792bmr209038585a.29.1782378456964;
        Thu, 25 Jun 2026 02:07:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2984:b0:918:42b4:2c9a with SMTP id af79cd13be357-9293c02792bmr209032385a.29.1782378456380;
        Thu, 25 Jun 2026 02:07:36 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:9f56:d19a:8af4:e2dd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46caa798f43sm11057013f8f.8.2026.06.25.02.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:07:35 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio fixes for v7.2-rc1
Date: Thu, 25 Jun 2026 11:07:30 +0200
Message-ID: <20260625090730.12035-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA3NyBTYWx0ZWRfX7aVuFrcv8Iqz
 1u54Gd27dYjKbsfelvuRj+JkXBmh4vXQTr6j5Omu77+noe+6xKW/i/cSnsBHUlFavgcQs+7qxyL
 7TKWjTt1ELFbQhopJCHcv3eA4jkMuuA=
X-Authority-Analysis: v=2.4 cv=RJiD2Yi+ c=1 sm=1 tr=0 ts=6a3cefd9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=6lw2KsDxtVjikp0UavEA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: 61srpB3QTyTEQuvSkP7ja-jHBy5nW0CN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA3NyBTYWx0ZWRfXwMjahXXiZvhp
 rB3ZFbbfmsqsDczpdVi1dufYxVnFqjkFwMqW7yboRxgEw8etBC4+iHTibMMkNgSgwSphGHCMiIT
 UAE8F2wuheXsaQX9SqvOupYHb/Tq5FPGw99sT0LDTQM7ZYZ2fPoh4bWtcFMpsy3jU37irc81mdM
 M0Qzd5EcDMEG6U67XQFsdRscL5dO8IHM1T/9XAdCOb+e2HdBv+1lMXW7iypzbxGAtLM/H8O3hRd
 IaK2H8HrbjzSWIjMfRn7A5yX9RcLCMFWHEGiVRMHCbO/RihROn4iCjhNIJEYfOR/vWatRCPdi7r
 H9vEfKwOqAwKldP314oLlU0JIysbT4C6J87XuELw9eH1dxVzU9XNsZdoTgMSRYRf4IA5/CtQOit
 nln0JIqeRyn4VgIWdAbPIS2xs+or1PawFtIIm+fW6iFg1VTzF6Odg8z3YTEOm7F5vkKnRKbjb7X
 +HEzhAsPHbtyMP3w6Lw==
X-Proofpoint-GUID: 61srpB3QTyTEQuvSkP7ja-jHBy5nW0CN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-38874-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 394C56C415C

Linus,

Here's the second PR for this merge window. It's mostly fixes except for one
commit that requires some explanation.

During the last cycle I submitted a two-patch series with the first changeset
exposing the software node of the GPIO cell of the cs5535 MFD device in
a public header, and the second one using it in the Intel Geode board file[1].

Lee Jones picked up patch 1/2 into the MFD tree. I later got an Ack from
Borislav on patch 2/2 and decided to queue it for v7.2 as it's the last
remaining change that will allow me to drop the deprecated behavior of GPIO
core for software-node lookup by GPIO label match for v7.3.

To that end, however, I needed the prerequisite patch 1/2 from the MFD tree to
land upstream. At that point I had already more patches queued in my tree.

I was not sure whether the correct approach in this case is to:

  a) Pull Lee's tag directly into my tree
  b) Pull your merge commit
  c) Rebase my branch and force-push

I decided to go with b) as it doesn't result in two merges of the same tag in
git history. I typically never rebase my branches fed into linux-next. Please
let me know if this is not the right approach. If you don't comment on it, I'll
assume it's ok. In any case, this was exceptional and should not be a common
occurrence.

Please consider pulling.

Thanks,
Bartosz

[1] https://lore.kernel.org/all/20260429-cs5535-swnode-v1-0-2bc5e17ddcf9@oss.qualcomm.com/

The following changes since commit 6beaec3aee9852438b89e4d7891caf5e84d45851:

  Merge tag 'mfd-next-7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd (2026-06-18 14:26:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-fixes-for-v7.2-rc1

for you to fetch changes up to 4e8eb6952aa6749726c6c3763ae0032a6332c24f:

  gpio: davinci: fix IRQ domain leak on devm_kzalloc failure (2026-06-23 10:44:29 +0200)

----------------------------------------------------------------
gpio fixes for v7.2-rc1

- fix locking context with shared GPIOs in gpio-tegra
- fix IRQ domain leak in error path in gpio-davinci
- fix returning a potentially uninitialized integer in
  gpiochip_set_multiple()
- use raw spinlock in gpio-eic-sprd and gpio-sch to address locking
  context issues
- bail out of probe() if registering the GPIO chip fails in gpio-mlxbf3
- fix varible type for storing the "ngpios" property in gpio-pisosr
- fix out-of-bounds pin access in GPIO ACPI
- make GPIO ACPI core only trigger interrupts on boot that are marked as
  ActiveBoth
- fix kerneldoc in gpio-tb10x
- reference the real software node of the cs5535 GPIO controller in
  Geode board file

----------------------------------------------------------------
Bartosz Golaszewski (3):
      Merge tag 'intel-gpio-v7.1-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-current
      Merge commit '6beaec3aee9852438b89e4d7891caf5e84d45851' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-current
      x86/platform/geode: reference the real node of the cs5535 GPIO controller

Igor Putko (1):
      gpio: tb10x: fix struct tb10x_gpio kernel-doc

Marco Scardovi (2):
      gpiolib: acpi: Add robust bounds-checking for GPIO pin resources
      gpiolib: acpi: Prevent out-of-bounds pin access in OperationRegion handler

Mario Limonciello (1):
      gpiolib: acpi: Only trigger ActiveBoth interrupts on boot

Pengpeng Hou (1):
      gpio: mlxbf3: fail probe if gpiochip registration fails

Qingshuang Fu (1):
      gpio: davinci: fix IRQ domain leak on devm_kzalloc failure

Rob Herring (Arm) (1):
      gpio: pisosr: Read "ngpios" as u32

Runyu Xiao (3):
      gpio: sch: use raw_spinlock_t in the irq startup path
      gpio: eic-sprd: use raw_spinlock_t in the irq startup path
      gpio: tegra: do not call pinctrl for GPIO direction

Ruoyu Wang (1):
      gpiolib: initialize return value in gpiochip_set_multiple()

 arch/x86/Kconfig                       | 10 +++---
 arch/x86/platform/geode/geode-common.c | 12 +++----
 drivers/gpio/gpio-davinci.c            |  4 ++-
 drivers/gpio/gpio-eic-sprd.c           |  8 ++---
 drivers/gpio/gpio-mlxbf3.c             |  3 +-
 drivers/gpio/gpio-pisosr.c             |  4 ++-
 drivers/gpio/gpio-sch.c                | 32 +++++++++----------
 drivers/gpio/gpio-tb10x.c              |  1 +
 drivers/gpio/gpio-tegra.c              | 18 ++---------
 drivers/gpio/gpiolib-acpi-core.c       | 57 +++++++++++++++++++++++++++-------
 drivers/gpio/gpiolib.c                 |  2 +-
 11 files changed, 87 insertions(+), 64 deletions(-)

