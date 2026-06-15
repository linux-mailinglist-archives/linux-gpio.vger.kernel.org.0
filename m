Return-Path: <linux-gpio+bounces-38465-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id TAolLAS4L2o+FAUAu9opvQ
	(envelope-from <linux-gpio+bounces-38465-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:29:56 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B4277684885
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 10:29:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=laYipRlo;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="gq82h/6L";
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38465-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38465-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9FA803004635
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2026 08:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB9BF3C5845;
	Mon, 15 Jun 2026 08:29:37 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3183C65FF
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:29:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781512177; cv=none; b=WkP0UJhe4q8bkyjm9mTyQEoCMpnOkE81M7nYYrFgMTAa+QB1EOe37Wy+NS+eQ0XsvFoxetIhqKETSk4UP/zk4xWh0h0cNuQWlmpgFfoOcTpqZdvj9J4sA+h3JbNpCMMA9UEGi8sPyVN9XKq0U+YOBOI05AFqA2TYAfz6uQ9mrPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781512177; c=relaxed/simple;
	bh=EjlKN+msOCBiL9P22k3aVtNF5oPJrwXZggSKfWHEpSk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RCwoXVdHkyPHgHsqfZgikWq24uClxJV9WH560CntGLCjR88GwUdMqWK7NtJYFpYKm0OI1z5TaCnpcyH1WFQ/I4YYMjUA5YDb+rDM82HA7jIq9C7MwVrQ2/IJYq6myOLVBa+lhcCXCChWw4wxQGHiKsEqUYGaazYTxKl3Xj9GmpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=laYipRlo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gq82h/6L; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6Kr3W3710243
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:29:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DzWwZQelq8KONgO+p9qsl9
	MLTwZR6CFKHiZRZSw/bOY=; b=laYipRloHcV5quW6i9N0BbgpoSaPrL79Y24Kje
	XwcezTxHt8dSTq4UC5MRO8nHR6PezgysX+hLgY3XNyfDMeqkM6isHz/EWGUnr4oM
	46bGAN/QlTtZtVAk7u6MRuQ2YYW/JqPVO8/TQTR0RAGs7ltO0YZ0vjtn0ED9WniI
	lxF0n7v7PznFngXQ7/ir9h3kRbNfPk4yRUkHwpq9KoavzbLAz5tQfxmcAcwJ9jdD
	HFAetHkeoETGuA/FUmGQTzDTmAQqYphJI8wdXCv7x11KTNv951sfqP41l2dXe9qd
	saLb+P0ED+c2j5ufsS0zFnruOY/2/EPc08RL1KLRCmK0KVWA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery956dmk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 08:29:32 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91565f8c589so555712485a.0
        for <linux-gpio@vger.kernel.org>; Mon, 15 Jun 2026 01:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781512171; x=1782116971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DzWwZQelq8KONgO+p9qsl9MLTwZR6CFKHiZRZSw/bOY=;
        b=gq82h/6LBxtQP7idyCN6UzC5srxFHwdeMOXLLbeXUSKDZneII2cAPnhmoXhqAW2bvJ
         CxMFMcltqDpcFsY5pvGTgv/27lotJJGKZANpGaokbDDTBVsYSLjbFbjaLk0IX9kWSJfL
         9avwFSESQLcoEgLfYskI5KcxSWzopgtbqlIkpwmer+Wd2Gms+kAzpEls4fgs7PyBhZfU
         IdPdBIN7O1Ch23Gp8X4tsk6nRzAjI6/OA/iqz/U3GAxHYXu9p3VkMKQFsAhQ25JRLFM6
         aquJrcNTckTdcfOtVd15/rWiARGnbxL5g8OHTzmEnoSmh8GuTVuefflSlkeMJ0JAYY3b
         +f9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781512171; x=1782116971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzWwZQelq8KONgO+p9qsl9MLTwZR6CFKHiZRZSw/bOY=;
        b=suw4eo5Dk2grOuw02j3PX9U/oi6t6fV+JhPunpcfUYa4VCCWISouUm08+sKq/MLrso
         txt3mvoqXlfmAh3OvCIGqrsJCoZHbqZbe/xTdQv6VGdFLNLZIx6DCqrvrDd4I5kfH22V
         Qaa6ZEUxQ+QzZWsTHxFmJuwXmmQSrTuXnQPL1zCy9bu5Sa5wOHCOq3htYBK3hR9gSI/e
         69GHzuOONxf4XgYEgBwn/JLEhApf2/n7JsAjyx5z0IcTos4S+upSJNIBJxDZmTxtzPit
         d9sE3GB5XhugEcPHczfA/6iGuIJ6Ei/3cYeNiQEXgI4oG2cqWUGXW+rYk48MyslcUN//
         SMkg==
X-Forwarded-Encrypted: i=1; AFNElJ/8zcorSqiB3dpVI+LbH9S95QcFeLnzFMHNlz9qwQSCOk4DlOYGMXbg5vFEfjicR4gxnrTbhda/ZeuL@vger.kernel.org
X-Gm-Message-State: AOJu0YzfjnUz1ldbyTZgjUTeZVbYYda6d56dnLTum4HL3IT3HNgcJ6zO
	U9Z4Ldu7jezBRVfujYmGCaAoS2DrhO6xDrQLyQ//0zr2dQc2wgLGYtTVNgzHqCWUwbQ2BE85T4H
	IH5Y9Gts+/H/ZAM4ryKu4yeusni/Kk/1t25lGfkPPGUpnb/EiwohaX2o4FXLieut18QQKFbHHoN
	0=
X-Gm-Gg: Acq92OG9N+TQZmxBeFjqw+zlIz0OzdH3+j7Esue+KYci+HsCDAzRSQyRk7bAGtTFuw+
	As7wH4V0V5cBC1j6aalPIsjQjQauqtzHGnllwWX65CrcnYCiUrqCrI1JIJabC7qtZPQBW0mnLd2
	QeC3XO7H+qhUKNQGAfElW3XuG5uXgfudfoBcL+xN5xvzEsEB/mawUXo5/KzDRd2eDxqtla8DrpW
	cdjW2GTup3ZVBiCQl+eEbwJenSsSs7Cwy4P3BJB0m6TeDwB0faL+CwASnqCwaE6irfBrRaw4ivd
	2atIs9bDMtql6n+ZSaUPjbpcwvzc0I8cGYAV8cxmlc6DsSmpc8ytK+d/sCs5yQPDc8Br+9pjhRk
	QgDGWqiBUvNTTArpWS/AhKfgKe1o+jm90Z+KIT3O+NWTNvU+l1w==
X-Received: by 2002:a05:620a:241b:20b0:911:c5c0:d5f2 with SMTP id af79cd13be357-91619db015dmr1155848185a.1.1781512171284;
        Mon, 15 Jun 2026 01:29:31 -0700 (PDT)
X-Received: by 2002:a05:620a:241b:20b0:911:c5c0:d5f2 with SMTP id af79cd13be357-91619db015dmr1155846585a.1.1781512170798;
        Mon, 15 Jun 2026 01:29:30 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d677:3f6f:b288:3b60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4a128csm323101595e9.0.2026.06.15.01.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:29:29 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio updates for v7.2-rc1
Date: Mon, 15 Jun 2026 10:29:22 +0200
Message-ID: <20260615082923.38764-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: PDrYT6YrlxeaCJrIkLNSTrBhwN8ny96O
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfX2BAatx5nkX6t
 QR3/MEt+7vhbSd1VuCCvCsntWc3t4A7V7qldjTCgS+D4crYDEs18V+isCGnG5F17Vx+3u/PRRWU
 WPf9cBLG+JF1jXPGeTgiiUs8gvcRpjw=
X-Proofpoint-GUID: PDrYT6YrlxeaCJrIkLNSTrBhwN8ny96O
X-Authority-Analysis: v=2.4 cv=EbP4hvmC c=1 sm=1 tr=0 ts=6a2fb7ec cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=oKOZmXbVODnbPqjrDC8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA4OCBTYWx0ZWRfX0KWC+ht/jlfi
 tU8r8bGt6q4uvKrBHsW6aZck265Ur7LUKdN/G4jkEYLewm5lNnInc4Fu9gi3kgEubLmJSRDIHu3
 I7Llxqe7jBf4FCCcuNFatPT9Hv0A3ZxVANSXC6a9OT58bxUpCklOu+zTUv7wtzQ9qGBGOV0ZlfP
 apGToU7nPlE43cuwNZ249s+NUXnLzyRH16ojAdqLoDwsGxQ262ywjdzusXimFFjdNkTHSkvhP8I
 KqzrIzIkOcwEAbKZk2m8tB0G4kLxQxVkhqSNX7UshNI5q1hIg8UVt6unc9mBWX0g2dQmM/BAmRt
 /FvWCAIvidNPHcqG4b6++V1S/lZGBfwhfx7H1tqu6uB5/Zxkrwh4OPwjN8UpDl3yYr+d9wqPm/v
 gJxjp5padbYF0JOyZuO7ln/NLdGI24v2Pp56yGqq5uEQ8loSL2zeCekjFzDmtl8KzVGG/fMkrE3
 r9MEbFbdi21D1K26pHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150088
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38465-lists,linux-gpio=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linusw@kernel.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:brgl@kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: B4277684885

Linus,

Here's the main GPIO pull-request for this merge window. There's one new
driver, one legacy driver removed, a kunit test-suite for the GPIO core,
support for new models in existing drivers and a slew of various changes
in many places though I can't think of anything controversial that would
stand out - it's been a relatively calm cycle.

There are some changes in arch/ that were Acked by the relevant
maintainers. The merges you see are either immutable branches I provided
to others or merging of changes from the MFD tree.

Details are in the signed tag as usual. Please consider pulling.

Thanks,
Bartosz

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.2-rc1

for you to fetch changes up to f953585dafd71ecb0897f9def9c0a3702afc1bf8:

  gpio: nomadik: remove dead DB8540 code from <gpio/gpio-nomadik.h> (2026-06-11 10:26:40 +0200)

----------------------------------------------------------------
gpio updates for v7.2-rc1

GPIO core:
- Add an initial set of kunit test cases for the GPIO subsystem
- Use the devres owner as the GPIO chip's parent in absence of any other
  parent
- Fix const-correctness of GPIO chip SRCU guards
- Provide new GPIO consumer interfaces: gpiod_is_single_ended() and
  fwnode_gpiod_get()
- Quarantine all legacy GPIO APIs in linux/gpio/legacy.h
- Use __ro_after_init where applicable

New drivers:
- Add driver for the GPIO controller on Waveshare DSI TOUCH panels

Removed drivers:
- Remove the obsolete ts5500 GPIO driver

Driver updates:
- Modernize gpio-timberdale: remove platform data support and use generic
  device property accessors
- Extend test build coverage by enabling COMPILE_TEST for more GPIO
  drivers
- Add some missing dependencies in Kconfig
- Add support for sparse fixed direction to gpio-regmap
- Remove dead code from gpio-nomadik
- use BIT() in gpio-mxc
- use bitmap_complement() in gpio-xilinx and gpio-pca953x
- Use more appropriate printing functions where applicable
- Use named initializers for platform_device_id and i2c_device_id arrays
- Convert gpio-altera to using the generic GPIO chip helper library
- Add support for new models to gpio-dwapb, gpio-zynq, gpio-usbio and
  gpio-tegra186
- Unify the naming convention for Qualcomm in GPIO drivers
- Fix interrupt bank mapping to GPIO chips in gpio-mt7621
- Add support for the lines-initial-states property to gpio-74x164
- Switch to using dynamic GPIO base in gpio-ixp4xx
- Move the handling of an OF quirk from ASoC to gpiolib-of.c where other
  such quirks live
- Use handle_bad_irq() in gpio-ep93xx
- Some other minor tweaks and refactorings

Devicetree bindings:
- Document the Waveshare GPIO controller for DSI TOUCH panels
- Document new models: Tegra238 in gpio-tegra186 and EIO GPIO in gpio-zynq
- Add new properties for gpio-dwapb and fairchild,74hc595
- Fix whitespace issues
- Sort compatibles alphabetically in gpio-zynq

Documentation:
- Fix kerneldoc warnings in gpio-realtek-otto

Misc:
- Attach software nodes representing GPIO chips to the actual struct
  device objects associated with them in some legacy platforms enabling
  real firmware node lookup instead of string matching
- Drop unneeded dependencies on OF_GPIO from bus and staging drivers

----------------------------------------------------------------
Alexander Stein (1):
      gpio: mxc: use BIT() macro

Arnd Bergmann (2):
      gpiolib: move legacy interface into linux/gpio/legacy.h
      gpio: ts5500: remove obsolete driver

Arun T (1):
      gpio: usbio: Add ACPI device-id for NVL platforms

Bartosz Golaszewski (18):
      Merge tag 'v7.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      Merge tag 'asoc-wsa881x-gpiolib-of' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound into gpio/for-next
      gpio: sim: add a Kconfig dependency on SYSFS
      mfd: timberdale: Move GPIO_NR_PINS into the driver
      mfd: timberdale: Set up a software node for the GPIO cell
      gpio: timberdale: Use device properties
      gpio: timberdale: Remove platform data header
      Merge tag 'ib-gpio-add-fwnode-gpiod-get-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into gpio/for-next
      Merge tag 'ib-gpio-add-gpiod-is-single-ended-for-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux into gpio/for-next
      Merge tag 'ib-mfd-gpio-v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next
      kunit: provide kunit_platform_device_register_full()
      kunit: provide kunit_platform_device_unregister()
      gpio: add kunit test cases for the GPIO subsystem
      ARM: omap1: drop unused variable from omap16xx_gpio_init()
      ARM: omap1: use platform_device_register_full() for GPIO devices on OMAP 16xx
      ARM: omap1: enable real software node lookup of GPIOs on Nokia 770
      staging: media: max96712: drop unneeded dependency on OF_GPIO
      bus: ts-nbus: drop unneeded dependency on OF_GPIO

Chanhong Jung (2):
      dt-bindings: gpio: fairchild,74hc595: add lines-initial-states property
      gpio: 74x164: support lines-initial-states for boot-time output state

Chen Jung Ku (1):
      gpio: gpiolib: use seq_puts() for plain strings

David Laight (1):
      gpiolib: Replace strcpy() with memcpy()

Dmitry Baryshkov (2):
      dt-bindings: gpio: describe Waveshare GPIO controller
      gpio: add GPIO controller found on Waveshare DSI TOUCH panels

Ethan Nelson-Moore (1):
      gpio: nomadik: remove dead DB8540 code from <gpio/gpio-nomadik.h>

Icenowy Zheng (1):
      dt-bindings: gpio: dwapb: allow GPIO hogs

Jie Li (1):
      gpiolib: add gpiod_is_single_ended() helper

Jun Yan (1):
      dt-bindings: gpio: meson-axg: Fix whitespace issue

Krishna Chaitanya Chundru (1):
      gpio: Add fwnode_gpiod_get() helper

Krzysztof Kozlowski (1):
      gpio: qcom: Unify user-visible "Qualcomm" name

Len Bao (1):
      gpiolib: Mark gpio_devt, gpiolib_initialized and gpio_stub_drv as __ro_after_init

Linus Walleij (6):
      ASoC: wsa881x: Move custom workaround to gpiolib-of
      gpio: devres: Use devres parent if undefined
      gpio: altera: User gc helper variable
      gpio: altera: Use generic MMIO GPIO
      gpio: regmap: Support sparsed fixed direction
      gpio: regmap: Don't set a fixed direction line

Marco Scardovi (scardracs) (2):
      gpio: core: fix const-correctness of gpio_chip_guard
      gpio: remove obsolete UAF FIXMEs from lookup paths

Maxwell Doose (1):
      gpio: sim: Replace sprintf() with sysfs_emit()

Mohamed Ayman (2):
      gpio: ep93xx: use handle_bad_irq() as default IRQ handler
      gpio: ixp4xx: switch to dynamic GPIO base

Prathamesh Shete (2):
      dt-bindings: gpio: Add Tegra238 support
      gpio: tegra186: Add support for Tegra238

Rosen Penev (5):
      gpio: zevio: allow COMPILE_TEST builds
      gpio: spear-spics: Add COMPILE_TEST support
      gpio: xgene: allow COMPILE_TEST builds
      gpio: en7523: allow COMPILE_TEST builds
      gpio: realtek-otto: fix kernel-doc warnings

Sergio Paracuellos (1):
      gpio: mt7621: fix interrupt banks mapping on gpio chips

Shubhrajyoti Datta (3):
      dt-bindings: gpio: zynq: Sort compatible strings alphabetically
      dt-bindings: gpio: Add EIO GPIO compatible to gpio-zynq
      gpio: zynq: Add eio gpio support

Suneel Garapati (1):
      gpio: tegra186: Enable GTE for Tegra264

Thomas Lin (1):
      gpio: dwapb: Add ACPI ID LECA0001 for LECARC SoCs

Uwe Kleine-König (The Capable Hub) (6):
      gpio: amd8111: Drop useless zeros in array initialisation
      gpio: Initialize i2c_device_id arrays using member names
      gpio: Initialize all i2c_device_id arrays using member names
      gpio: cros-ec: Drop unused assignment of platform_device_id driver data
      gpio: Use named initializers for platform_device_id arrays
      gpio: max77620: Unify usage of space and comma in platform_device_id array

Yury Norov (2):
      gpio: pca953x: drop bitmap_complement() where feasible
      gpio: xilinx: drop bitmap_complement() where feasible

 .../bindings/gpio/fairchild,74hc595.yaml           |  13 +
 .../devicetree/bindings/gpio/gpio-zynq.yaml        |  17 +-
 .../bindings/gpio/nvidia,tegra186-gpio.yaml        |   6 +
 .../devicetree/bindings/gpio/snps,dw-apb-gpio.yaml |   6 +
 .../bindings/gpio/waveshare,dsi-touch-gpio.yaml    |  73 ++++
 arch/arm/mach-omap1/board-nokia770.c               |  33 +-
 arch/arm/mach-omap1/common.h                       |   3 +
 arch/arm/mach-omap1/gpio16xx.c                     |  80 ++--
 drivers/bus/Kconfig                                |   2 +-
 drivers/gpio/Kconfig                               |  39 +-
 drivers/gpio/Makefile                              |   3 +-
 drivers/gpio/gpio-74x164.c                         |  17 +-
 drivers/gpio/gpio-adnp.c                           |   4 +-
 drivers/gpio/gpio-adp5585.c                        |   4 +-
 drivers/gpio/gpio-altera.c                         | 124 ++----
 drivers/gpio/gpio-amd8111.c                        |   4 +-
 drivers/gpio/gpio-bd72720.c                        |   4 +-
 drivers/gpio/gpio-bd9571mwv.c                      |   4 +-
 drivers/gpio/gpio-cros-ec.c                        |   4 +-
 drivers/gpio/gpio-ds4520.c                         |   2 +-
 drivers/gpio/gpio-dwapb.c                          |   1 +
 drivers/gpio/gpio-ep93xx.c                         |   3 +-
 drivers/gpio/gpio-fxl6408.c                        |   2 +-
 drivers/gpio/gpio-gw-pld.c                         |   2 +-
 drivers/gpio/gpio-ixp4xx.c                         |   7 +-
 drivers/gpio/gpio-lp873x.c                         |   2 +-
 drivers/gpio/gpio-lp87565.c                        |   2 +-
 drivers/gpio/gpio-max7300.c                        |   2 +-
 drivers/gpio/gpio-max732x.c                        |  20 +-
 drivers/gpio/gpio-max77620.c                       |   2 +-
 drivers/gpio/gpio-max77759.c                       |   2 +-
 drivers/gpio/gpio-mt7621.c                         | 282 ++++++++++---
 drivers/gpio/gpio-mxc.c                            |   4 +-
 drivers/gpio/gpio-pca953x.c                        |  93 +++--
 drivers/gpio/gpio-pca9570.c                        |   6 +-
 drivers/gpio/gpio-pcf857x.c                        |  26 +-
 drivers/gpio/gpio-pxa.c                            |  18 +-
 drivers/gpio/gpio-realtek-otto.c                   |   6 +-
 drivers/gpio/gpio-regmap.c                         |  74 +++-
 drivers/gpio/gpio-sim.c                            |  24 +-
 drivers/gpio/gpio-tegra186.c                       |  69 ++++
 drivers/gpio/gpio-timberdale.c                     |  26 +-
 drivers/gpio/gpio-tpic2810.c                       |   2 +-
 drivers/gpio/gpio-tps65086.c                       |   2 +-
 drivers/gpio/gpio-tps65218.c                       |   2 +-
 drivers/gpio/gpio-tps65219.c                       |   4 +-
 drivers/gpio/gpio-tps65912.c                       |   2 +-
 drivers/gpio/gpio-ts4900.c                         |   2 +-
 drivers/gpio/gpio-ts5500.c                         | 446 ---------------------
 drivers/gpio/gpio-usbio.c                          |   1 +
 drivers/gpio/gpio-waveshare-dsi.c                  | 208 ++++++++++
 drivers/gpio/gpio-xilinx.c                         |   6 +-
 drivers/gpio/gpio-zevio.c                          |   4 +-
 drivers/gpio/gpio-zynq.c                           |  12 +
 drivers/gpio/gpiolib-acpi-core.c                   |   4 -
 drivers/gpio/gpiolib-devres.c                      |   7 +
 drivers/gpio/gpiolib-kunit.c                       | 358 +++++++++++++++++
 drivers/gpio/gpiolib-of.c                          |   8 +
 drivers/gpio/gpiolib-swnode.c                      |   4 -
 drivers/gpio/gpiolib.c                             |  66 +--
 drivers/gpio/gpiolib.h                             |   2 +-
 drivers/mfd/timberdale.c                           |  33 +-
 drivers/mfd/timberdale.h                           |   1 -
 drivers/staging/media/max96712/Kconfig             |   1 -
 include/dt-bindings/gpio/meson-axg-gpio.h          |   4 +-
 include/dt-bindings/gpio/nvidia,tegra238-gpio.h    |  58 +++
 include/kunit/platform_device.h                    |   6 +
 include/linux/gpio.h                               | 162 +-------
 include/linux/gpio/consumer.h                      |  14 +
 include/linux/gpio/gpio-nomadik.h                  |  16 -
 include/linux/gpio/legacy.h                        | 173 ++++++++
 include/linux/gpio/regmap.h                        |   7 +
 include/linux/timb_gpio.h                          |  25 --
 lib/kunit/platform.c                               |  64 +++
 sound/soc/codecs/wsa881x.c                         |  35 +-
 75 files changed, 1724 insertions(+), 1130 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/waveshare,dsi-touch-gpio.yaml
 delete mode 100644 drivers/gpio/gpio-ts5500.c
 create mode 100644 drivers/gpio/gpio-waveshare-dsi.c
 create mode 100644 drivers/gpio/gpiolib-kunit.c
 create mode 100644 include/dt-bindings/gpio/nvidia,tegra238-gpio.h
 create mode 100644 include/linux/gpio/legacy.h
 delete mode 100644 include/linux/timb_gpio.h

