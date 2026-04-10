Return-Path: <linux-gpio+bounces-34989-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGR+LY+32GnnhAgAu9opvQ
	(envelope-from <linux-gpio+bounces-34989-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 10:40:47 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 571A03D43D8
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 10:40:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 08762302E0F2
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 08:40:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DEF93ACA6F;
	Fri, 10 Apr 2026 08:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ND2Nibtk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YScwRZyD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B453358B9
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 08:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775810402; cv=none; b=JwdFyFsgPKL5xDwgJQbWvPHj484AtDbRfyZsCJU0CpEA2ZXi2sppdTwMLjSYG3QQhIH5ImaS9z5eTza85S1VjKvM95ju9CwBIvJCvC7VifdjCauI0hGoHGg4/CFZb0hXlDSFnbzoemjS/I/hVgv48TiYMEnNX4gqG3urGgXGIAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775810402; c=relaxed/simple;
	bh=7FE9CmUlj9cgKxbcoVDTEH3hnriVcdVjMv6ecCOMpx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EyuRKqoxhVEeiF3N7WZkWBFCf+oaf5f6JWAkdizozBR2H2FpOsaUDymgDErOynf5pmc5q5kxspwhhXAk5rygxxXq7UStdIy8KCptHckrkelxii+w38a0wxX7iQyTFOHaMqcJ+NmZfQnOfXN00mkH76yyLbloBMX7O7GzXqCc0n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ND2Nibtk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YScwRZyD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6qmgb2624720
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 08:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=asH/e4E9YXp8rClMIjXpyIQJPsV0YQO9oee
	ae86nxlw=; b=ND2NibtkH7bROYU7tDYgWNup5o9zOMOURPTMqxgHf5b4HbzS091
	27+oomNefFrFhaSuGPVjMFZ5ZDC6oj5k2bHbLO4XSDfMRued8K7WyTTlU58IJaHf
	YH9ZR3bn0X17IGdbGp39AralFZjCB31VXV+S/j1JJ4idHYahBUYJsrTqQMIYHyrC
	+F1KCWrvo8syXwc1o3tW6m7v2NLnjcFhpRgaFS2SiMbVnpNoQaHfJMOQzWXfbaXy
	Vph/QePOA2oHQWrVAdhiBeKDDu4KCYxFmnaNq3A+KBJZm+3JiNdKEUwZoYfEqYur
	J4AYZd/Ys03dJE6Zz7kwqwyqSyDO16rrxjg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decmu3dxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 08:39:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d890580e1so34678241cf.3
        for <linux-gpio@vger.kernel.org>; Fri, 10 Apr 2026 01:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775810398; x=1776415198; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=asH/e4E9YXp8rClMIjXpyIQJPsV0YQO9oeeae86nxlw=;
        b=YScwRZyDNUUfRXsS1M6aNVaSlau1lcxBk9HUD4+BeQDZ5aYF9hdBbvrc4YcsIc6Qa3
         hImHXGQaEQhuCAJ3djLG1URXKQ7KsSKj07FRyJuFKgC7MSMl/w19A/ZKwmQvF9xUmkG9
         up/gR6ZAm3Y3nQuNpJi8CrWu2kZDv0IoFVkW1DF2LofSjNTVv3qa/uYdcgs6sLXjs0zK
         RrV4Tbkt+qThOfyKESqCFxrgOdfKIrm1YfQkZQCu8KPKHv7Gugt0KudB8RIo4ilmJGOr
         j5KLcWzSW9vHHcHM22sMGejNFS2/ogr1EsksCcIj4x306vG7VzWdIHdz5yB8iI6AwQLn
         2r6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810398; x=1776415198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=asH/e4E9YXp8rClMIjXpyIQJPsV0YQO9oeeae86nxlw=;
        b=Ygv7sL0XIjEF+avHeJwUg0YvAQ58lWihFG8+22aXRNw4L0x/piByygZda3sLMiRyzK
         uKCAaU70S8TOQ6aNrzofz5LBWceij0v7n6QzPrqSPGvphf3yszEaPixvgZO9IVi4XHF5
         eeipag/h6eFoToqd+zhpTLMtzHXYb/D+DpY44jHrHXRR4p9kqxHn0Ane1RrWgThfYh4M
         xd7VOLJ6+hGoJpPcS3JK/FHMy+0FtJHsFGa4ukWebk3cD6DyxXjv6Sxk3C2TB2jxX37W
         Ao5ZosQ0kRGJRn1mVNooZJ2YL9Erqs7u/UDfj/qkzc72jjgB7EexLy3RIOrt2l9F0/B5
         mHiw==
X-Forwarded-Encrypted: i=1; AJvYcCXuPkEoOiTlD27TJz72Wmjs8SVNWkTh7bQn2X7ecGsS82RPYrMrYYaVE6RVjCR5UeuN4QFQraiAQfjc@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+EV1YpBXZnHW/aCOJahanAj2QLccOMs6PEtq6gAY6mao+nDa
	kSOPjo8tywcP/cLx0r8t4148tearxrE7thm7QsXrhdGqp5sgL9G7w6J4JeVj7Jo+Y0ByqF53wEL
	vBWoGYnoqFLFIherIr0O8UU8Asgm8ZGBCavqJ1HofM+QPFrzvn/yqnVflUZo+kp4bmWjf/FDI
X-Gm-Gg: AeBDietsYKUf8O/TfAUtEsDsRsmcEgiWo0aVLQbN1TlIiPPfkWMfrhu6FDxYeJoTMgJ
	pdr6L2Zz8dh2IsN+0ACbp3t41OX2bHAvCovuJSx67lH++FCecn2EETv1Lx3XAchBW/J4+1iG0ym
	P3oyDHeKnPLD1cUKRMDuf2DJTxrghTcdVsExOLtS8r1rYVm4HKY+6OnO2Xpw8BM6yafdXRVlLN6
	Jhg+ZK8J7ofhukGauurSXOPB0G96p9b2pSUqS2H5Woe7hnVSI42cOQODXCtVkxW3idLtaeXD/cx
	dJUIrD9aMuYro4uzfBi7A7oSYAIEBvp04WmukY2bwwz6CycqzhVGa4l4F03iDICK6cepV4T04QR
	NJrfpGPL4DG6kBsqXBIhyi5QA1G9xOGxiGddQ78p1CEi7NyiMJg==
X-Received: by 2002:a05:622a:5e88:b0:50d:844f:3b34 with SMTP id d75a77b69052e-50dd5bc41ffmr36179611cf.51.1775810398235;
        Fri, 10 Apr 2026 01:39:58 -0700 (PDT)
X-Received: by 2002:a05:622a:5e88:b0:50d:844f:3b34 with SMTP id d75a77b69052e-50dd5bc41ffmr36179371cf.51.1775810397651;
        Fri, 10 Apr 2026 01:39:57 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:7d6c:c663:fa06:9ee8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm6046854f8f.2.2026.04.10.01.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:39:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio updates for v7.1-rc1
Date: Fri, 10 Apr 2026 10:39:51 +0200
Message-ID: <20260410083951.13983-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E99MGdN-CLWO2r2mfoZ7-IBRlctN6fr5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA3OSBTYWx0ZWRfX6OCE+kZJ7Y07
 Vg0pLEiQD894CUrey7FyhiNAaBGrp4EZMu1HOjoZGPAfMrrNzuUR5IR62+YCMLkpBlGhYw6CSb2
 KEfkzp2DEhMGqQ1RkQiZMDJGWJPM/E89TfZPW2arInCqm1Xqoq+9pvZItMZiLlLhRk5hKzXglR2
 ++oNLQuyH7N+4/zGEXEjDof5UBXrb1Kqx+nb2GpyGeFerNhLDGt5Su7uXP9thNEkjrraA/mG9xs
 fjKK1nZyquSkywL1Z0tKXZ4nw2ZIb+MubvJW9ar97DJkyUmVEmcKZImyZMoI6Be9bMet7O8lEF8
 bkBKg5G24ToXpyqrzjGFv70GNqzzJ15GDMtm8qUXEsyVD06cnLyFVlVSZHdOmlzlSR56sNb5PFh
 Dc1l9mfOFWfaZtAdjF3ReD5g7lGiS7bG/s8D2ODOsRlbhbMrLU+b/51cnZrSjmyBUHV8em6NMna
 7gV4cvFOE1V05i1gE5A==
X-Proofpoint-ORIG-GUID: E99MGdN-CLWO2r2mfoZ7-IBRlctN6fr5
X-Authority-Analysis: v=2.4 cv=DslmPm/+ c=1 sm=1 tr=0 ts=69d8b75f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=XamQjbECxn_R_DjOcKcA:9
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100079
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34989-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 571A03D43D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Linus,

I'll be OoO next week and disconnected so I'm sending an early PR for the
next cycle.

For this merge window we have two new drivers: support for GPIO-signalled
ACPI events on Intel platforms and a generic GPIO-over-pinctrl driver using
the ARM SCMI protocol for controlling pins.

Several things have been reworked in GPIO core: we unduplicated GPIO hog
handling, reduced the number of SRCU locks and dereferences, improved
support for software-node-based lookup and removed more legacy code after
converting remaining users to modern alternatives.

There's also a number of driver reworks and refactoring, documentation
updates, some bug-fixes and new tests.

The merges in this PR are as follows: immutable branch provided to the
net tree with driver changes prerequisite to legacy code removal, pinctrl
changes pulled ahead of adding the SCMI GPIO driver and an immutable branch
with a high-risk GPIO core fix that was then pulled into the for-current
branch and sent for v7.0 after spending some time in linux-next with no
regressions.

Details are in the signed tag. Please consider pulling for v7.1-rc1.

Thanks,
Bartosz

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.1-rc1

for you to fetch changes up to ca13ab654064fee86d6e7c9e87d0af7789561509:

  gpio: swnode: defer probe on references to unregistered software nodes (2026-04-09 15:59:30 +0200)

----------------------------------------------------------------
gpio updates for v7.1-rc1

GPIO core:
- defer probe on software node lookups when the remote software node
  exists but has not been registered as a firmware node yet
- unify GPIO hog handling by moving code duplicated in OF and ACPI
  modules into GPIO core and allow setting up hogs with software nodes
- allow matching GPIO controllers by secondary firmware node if matching
  by primary does not succeed
- demote deferral warnings to debug level as they are quite normal when
  using software nodes which don't support fw_devlink yet
- disable the legacy GPIO character device uAPI v1 supprt in Kconfig by
  default
- rework several core functions in preparation for the upcoming Revocable
  helper library for protecting resources against sudden removal, this
  reduces the number of SRCU dereferences in GPIO core
- simplify file descriptor logic in GPIO character device code by using
  FD_PREPARE()
- introduce a header defining symbols used by both GPIO consumers and
  providers to avoid having to include provider-specific headers from
  drivers which only consume GPIOs
- replace snprintf() with strscpy() where formatting is not required

New drivers:
- add the gpio-by-pinctrl generic driver using the ARM SCMI protocol to
  control GPIOs (along with SCMI changes pulled from the pinctrl tree)
- add a driver providing support for handling of platform events via
  GPIO-signalled ACPI events (used on Intel Nova Lake and later platforms)

Driver changes:
- extend the gpio-kempld driver with support for more recent models,
  interrupts and setting/getting multiple values at once
- improve interrupt handling in gpio-brcmstb
- add support for multi-SoC systems in gpio-tegra186
- make sure we return correct values from the .get() callbacks in several
  GPIO drivers by normalizing any values other than 0, 1 or negative error
  numbers
- use flexible arrays in several drivers to reduce the number of required
  memory allocations
- simplify synchronous waiting for virtual drivers to probe and remove the
  dedicated, a bit overengineered helper library dev-sync-probe
- remove unneeded Kconfig dependencies on OF_GPIO in several drivers and
  subsystems
- convert the two remaining users of of_get_named_gpio() to using GPIO
  descriptors and remove the (no longer used) function along with the
  header that declares it
- add missing includes in gpio-mmio
- shrink and simplify code in gpio-max732x by using guard(mutex)
- remove duplicated code handling the 'ngpios' property from gpio-ts4800,
  it's already handled in GPIO core
- use correct variable type in gpio-aspeed
- add support for a new model in gpio-realtek-otto
- allow to specify the active-low setting of simulated hogs over the
  configfs interface (in addition to existing devicetree support) in
  gpio-sim

Bug fixes:
- clear the OF_POPULATED flag on hog nodes in GPIO chip remove path on
  OF systems
- fix resource leaks in error path in gpiochip_add_data_with_key()
- drop redundant device reference in gpio-mpsse

Tests:
- add selftests for use-after-free cases in GPIO character device code

DT bindings:
- add a DT binding document for SCMI based, gpio-over-pinctrl devices
- fix interrupt description in microchip,mpfs-gpio
- add new compatible for gpio-realtek-otto
- describe the resets of the mpfs-gpio controller
- fix maintainer's email in gpio-delay bindings
- remove the binding document for cavium,thunder-8890 as the corresponding
  device is bound over PCI and not firmware nodes

Documentation:
- update the recommended way of converting legacy boards to using software
  nodes for GPIO description
- describe GPIO line value semantics
- misc updates to kerneldocs

Misc:
- convert OMAP1 ams-delta board to using GPIO hogs described with software
  nodes

----------------------------------------------------------------
AKASHI Takahiro (3):
      pinctrl: introduce pinctrl_gpio_get_config()
      gpio: dt-bindings: Add GPIO on top of generic pin control
      gpio: gpio-by-pinctrl: add pinctrl based generic GPIO driver

Alan Borzeszkowski (1):
      gpio: Add Intel Nova Lake ACPI GPIO events driver

Alban Bedel (4):
      gpio: kempld: Simplify the bit level register accesses
      gpio: kempld: Add support for PLD version >= 2.8
      gpio: kempld: Add support for get/set multiple
      gpio: kempld: Implement the interrupt controller

Andy Shevchenko (2):
      gpio: ts4800: Remove duplicate code to handle 'ngpios' property
      gpio: generic: Don't use 'proxy' headers

Arnd Bergmann (1):
      gpio: fix up CONFIG_OF dependencies

Bartosz Golaszewski (22):
      gpio: introduce a header for symbols shared by suppliers and consumers
      gpiolib: match secondary fwnode too in gpio_device_find_by_fwnode()
      Merge branch 'gpio/dev-init-rework' into gpio/for-next
      Merge tag 'ib-gpio-remove-of-gpio-h-for-v7.1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git into gpio/for-next
      arc: axs10x: drop unneeded dependency on OF_GPIO
      powerpc: drop unneeded dependency on OF_GPIO
      regulator: drop unneeded dependencies on OF_GPIO
      gpio: of: clear OF_POPULATED on hog nodes in remove path
      gpio: move hogs into GPIO core
      gpio: sim: use fwnode-based GPIO hogs
      ARM: omap1: ams-delta: convert GPIO hogs to using firmware nodes
      gpio: remove machine hogs
      gpio: sim: allow to define the active-low setting of a simulated hog
      gpio: drop unneeded Kconfig dependencies on OF_GPIO
      Merge branch 'ib-scmi-pinctrl-gpio' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl into gpio/for-next
      gpiolib: fix hogs with multiple lines
      gpio: sim: stop using dev-sync-probe
      gpio: aggregator: stop using dev-sync-probe
      gpio: virtuser: stop using dev-sync-probe
      gpio: remove dev-sync-probe
      Documentation: gpio: update the preferred method for using software node lookup
      gpio: swnode: defer probe on references to unregistered software nodes

Chen Jung Ku (1):
      gpio: aspeed: fix unsigned long int declaration

Conor Dooley (2):
      dt-bindings: gpio: mpfs-gpio: permit resets
      dt-bindings: gpio: fix microchip,mpfs-gpio interrupt documentation

Dan Carpenter (4):
      pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
      pinctrl: scmi: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
      pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
      firmware: arm_scmi: Allow PINCTRL_REQUEST to return EOPNOTSUPP

Dmitry Torokhov (7):
      gpio: bd9571mwv: normalize return value of gpio_get
      gpio: cgbc: normalize return value of gpio_get
      gpio: da9055: normalize return value of gpio_get
      gpio: lp873x: normalize return value of gpio_get
      gpio: stp-xway: normalize return value of gpio_get
      gpio: tps65086: normalize return value of gpio_get
      gpio: viperboard: normalize return value of gpio_get

Doug Berger (2):
      gpio: brcmstb: implement .irq_mask_ack()
      gpio: brcmstb: allow parent_irq to wake

Florian Fainelli (1):
      gpio: brcmstb: Utilize irqd_to_hwirq(d) instead of d->hwirq

Geert Uytterhoeven (1):
      gpio: gpio-by-pinctrl: s/used to do/is used to do/

Jialu Xu (3):
      nfc: s3fwrn5: convert to gpio descriptors
      nfc: nfcmrvl: convert to gpio descriptors
      gpio: remove of_get_named_gpio() and <linux/of_gpio.h>

Johan Hovold (1):
      gpio: mpsse: drop redundant device reference

Jon Hunter (1):
      gpiolib: Make deferral warnings debug messages

Kent Gibson (1):
      gpio: cdev: convert lineevent_create() and linereq_create() to FD_PREPARE()

Krzysztof Kozlowski (1):
      dt-bindings: gpio: gpio-delay: Use Alexander's email

Linus Walleij (3):
      gpio: Document line value semantics
      gpiolib: Update gpiochip_find_base_unlocked() kerneldoc
      Do not enable the v1 uAPI by default

Prathamesh Shete (2):
      gpio: tegra186: Simplify GPIO line name prefix handling
      gpio: tegra186: Support multi-socket devices

Richard Lyu (1):
      gpio: max732x: use guard(mutex) to simplify locking

Rosen Penev (5):
      gpio: bcm-kona: reduce the number of memory allocations
      gpio: htc-egpio: allocate irq with the main struct
      gpio: tegra186: allocate irqs with the main struct
      gpio: cs5535: use dynamically allocated priv struct
      gpio: dwapb: reduce allocation to single kzalloc

Rustam Adilov (2):
      dt-bindings: gpio: realtek-otto: add rtl9607 compatible
      gpio: realtek-otto: add rtl9607 support

Shawn Lin (1):
      gpio: rockchip: convert to dynamic GPIO base allocation

Shi Hao (1):
      dt-bindings: gpio: cavium,thunder-8890: Remove DT binding

Thorsten Blum (1):
      gpiolib: replace snprintf("%s") with strscpy

Tzung-Bi Shih (9):
      gpio: Fix resource leaks on errors in gpiochip_add_data_with_key()
      gpio: Access `gpio_bus_type` in gpiochip_setup_dev()
      gpio: Remove redundant check for struct gpio_chip
      gpio: sysfs: Remove redundant check for struct gpio_chip
      gpio: Ensure struct gpio_chip for gpiochip_setup_dev()
      gpio: cdev: Don't check struct gpio_chip in gpio_chrdev_open()
      selftests: gpio: Add gpio-cdev-uaf tests
      gpio: Fix lockdep warnings in gpiolib_{cdev,sysfs}_register()
      Revert "gpio: Access `gpio_bus_type` in gpiochip_setup_dev()"

 .../devicetree/bindings/gpio/gpio-delay.yaml       |   2 +-
 .../devicetree/bindings/gpio/gpio-thunderx.txt     |  27 --
 .../bindings/gpio/microchip,mpfs-gpio.yaml         |  27 +-
 .../devicetree/bindings/gpio/pin-control-gpio.yaml |  59 ++++
 .../bindings/gpio/realtek,otto-gpio.yaml           |   1 +
 Documentation/driver-api/gpio/board.rst            |  39 ++-
 Documentation/driver-api/gpio/driver.rst           |  27 ++
 Documentation/driver-api/gpio/legacy-boards.rst    |  36 ++-
 MAINTAINERS                                        |   8 +-
 arch/arc/plat-axs10x/Kconfig                       |   1 -
 arch/arm/mach-omap1/board-ams-delta.c              |  32 +-
 arch/powerpc/platforms/85xx/Kconfig                |   1 -
 drivers/firmware/arm_scmi/pinctrl.c                |   2 +
 drivers/gpio/Kconfig                               | 108 ++++---
 drivers/gpio/Makefile                              |   5 +-
 drivers/gpio/TODO                                  |  28 --
 drivers/gpio/dev-sync-probe.c                      |  97 -------
 drivers/gpio/dev-sync-probe.h                      |  25 --
 drivers/gpio/gpio-aggregator.c                     |  38 +--
 drivers/gpio/gpio-aspeed.c                         |   2 +-
 drivers/gpio/gpio-bcm-kona.c                       |  37 +--
 drivers/gpio/gpio-bd9571mwv.c                      |   2 +-
 drivers/gpio/gpio-brcmstb.c                        | 125 +++++---
 drivers/gpio/gpio-by-pinctrl.c                     | 101 +++++++
 drivers/gpio/gpio-cgbc.c                           |   4 +-
 drivers/gpio/gpio-cs5535.c                         |  48 ++-
 drivers/gpio/gpio-da9055.c                         |   2 +-
 drivers/gpio/gpio-dwapb.c                          |  19 +-
 drivers/gpio/gpio-htc-egpio.c                      |  13 +-
 drivers/gpio/gpio-kempld.c                         | 289 +++++++++++++++++-
 drivers/gpio/gpio-lp873x.c                         |   2 +-
 drivers/gpio/gpio-max732x.c                        |  24 +-
 drivers/gpio/gpio-mmio.c                           |   4 +-
 drivers/gpio/gpio-mpsse.c                          |  13 +-
 drivers/gpio/gpio-novalake-events.c                | 323 +++++++++++++++++++++
 drivers/gpio/gpio-realtek-otto.c                   |   4 +
 drivers/gpio/gpio-rockchip.c                       |   2 +-
 drivers/gpio/gpio-sim.c                            | 241 ++++++++-------
 drivers/gpio/gpio-stp-xway.c                       |   2 +-
 drivers/gpio/gpio-tegra186.c                       |  45 +--
 drivers/gpio/gpio-tps65086.c                       |   2 +-
 drivers/gpio/gpio-ts4800.c                         |  10 -
 drivers/gpio/gpio-viperboard.c                     |   2 +-
 drivers/gpio/gpio-virtuser.c                       |  30 +-
 drivers/gpio/gpiolib-acpi-core.c                   |  70 -----
 drivers/gpio/gpiolib-cdev.c                        | 159 +++-------
 drivers/gpio/gpiolib-cdev.h                        |   2 +-
 drivers/gpio/gpiolib-of.c                          | 183 ++----------
 drivers/gpio/gpiolib-of.h                          |  10 +
 drivers/gpio/gpiolib-swnode.c                      |   8 +
 drivers/gpio/gpiolib-sysfs.c                       |  30 +-
 drivers/gpio/gpiolib-sysfs.h                       |   8 +-
 drivers/gpio/gpiolib.c                             | 323 ++++++++++++---------
 drivers/gpio/gpiolib.h                             |   6 +-
 drivers/nfc/nfcmrvl/main.c                         |  47 +--
 drivers/nfc/nfcmrvl/nfcmrvl.h                      |   4 +-
 drivers/nfc/nfcmrvl/uart.c                         |  23 +-
 drivers/nfc/nfcmrvl/usb.c                          |   2 +-
 drivers/nfc/s3fwrn5/i2c.c                          |  54 +---
 drivers/nfc/s3fwrn5/phy_common.c                   |  11 +-
 drivers/nfc/s3fwrn5/phy_common.h                   |   5 +-
 drivers/nfc/s3fwrn5/uart.c                         |  43 +--
 drivers/pinctrl/core.c                             |  31 ++
 drivers/pinctrl/pinconf.h                          |   6 +
 drivers/pinctrl/pinctrl-scmi.c                     |  46 ++-
 drivers/regulator/Kconfig                          |   2 -
 include/linux/gpio/consumer.h                      |   2 +
 include/linux/gpio/defs.h                          |   9 +
 include/linux/gpio/driver.h                        |  15 +-
 include/linux/gpio/generic.h                       |   8 +-
 include/linux/gpio/machine.h                       |  33 ---
 include/linux/mfd/kempld.h                         |   1 +
 include/linux/of_gpio.h                            |  38 ---
 include/linux/pinctrl/consumer.h                   |   9 +
 tools/testing/selftests/gpio/Makefile              |   5 +-
 tools/testing/selftests/gpio/gpio-cdev-uaf.c       | 292 +++++++++++++++++++
 tools/testing/selftests/gpio/gpio-cdev-uaf.sh      |  63 ++++
 77 files changed, 2126 insertions(+), 1331 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-thunderx.txt
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 delete mode 100644 drivers/gpio/dev-sync-probe.c
 delete mode 100644 drivers/gpio/dev-sync-probe.h
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c
 create mode 100644 drivers/gpio/gpio-novalake-events.c
 create mode 100644 include/linux/gpio/defs.h
 delete mode 100644 include/linux/of_gpio.h
 create mode 100644 tools/testing/selftests/gpio/gpio-cdev-uaf.c
 create mode 100755 tools/testing/selftests/gpio/gpio-cdev-uaf.sh

