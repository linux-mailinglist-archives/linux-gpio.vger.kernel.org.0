Return-Path: <linux-gpio+bounces-31547-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eBWcEpH4imlBPAAAu9opvQ
	(envelope-from <linux-gpio+bounces-31547-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 10:21:21 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A9045118CCF
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 10:21:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 945DD3034671
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Feb 2026 09:21:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2563340A47;
	Tue, 10 Feb 2026 09:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H4Wurr5v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OD0QymlD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 682AD34027E
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 09:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770715262; cv=none; b=isMjfcmkOOCCx+/KmndNXtZ0NMg6ukoQBnHZxZIbUI3pe84nUyuk1TCH4rLWydQkQ0CHAYdCq0/2aZmbrwrPcqkmCKgAru/hBrB4/n8Dg/bLrrqJIIjJTtzUEBYldcHpkdXFvo8UtGN7L3PluMRmdCWo2i7PCCPbqdGD4awV1k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770715262; c=relaxed/simple;
	bh=GqGpfh4pMDqSK97wBozhNYBqmfhCxs4me0kPA4QxJcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=m0CO9Fp8CS4WBbXkFIFNDK881GNHNzB9lBFiBBcu2QntiSIrfIb8ufLtCtfVwLxi/rwZ8NM4ZuuStv3tV0TwOZ8W+ntIJfYHGmwDvH9BA1qHIjtKKQfwEoufyEfsTVwzjrjvGjTZh3VtfNboZ9GOZQ0A+GA8uLEOT9EwWaTL1qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H4Wurr5v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OD0QymlD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A7Ioqo441723
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 09:21:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=IlH64Mz+KKFJUb9BlTOf5r
	Z4xZ1OVwTP7aNaOyu8jZg=; b=H4Wurr5vS7cBjn9k1Z82sjmvdN0fbKgj3XNuMt
	1sP7EzTe9xDIm+EXikOQHm+DkaJR/GjWXEbKkldnVFjLfbEFYGuZXVkTXm70bByc
	gFYPe7+L//j3AFeAQ8sxy80Bij2FOGbjrd7qF2tdDshYfLACr19QPt/6QjVLN1BZ
	HYQx+hO4SJcqhuB1qhDz0kd5HzahugB+eFCJ3kpHE3gOPHpyeUdHCX6Hofi0Zhhi
	JJsZXLG9G2I8p2ILc9KAoxytAZmZMgP+QjYDR3Tjuc7Bh1+2RPchi2ClDvL+wAWy
	DJdJsKcSghRc078o1SyXH3VlwSazEVW51PUUq9dfcW3qGJEQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7qp9j0cm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 09:21:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70ed6c849so1511052185a.1
        for <linux-gpio@vger.kernel.org>; Tue, 10 Feb 2026 01:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770715259; x=1771320059; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IlH64Mz+KKFJUb9BlTOf5rZ4xZ1OVwTP7aNaOyu8jZg=;
        b=OD0QymlDfsaGYukvrqBu+F97SZEkhwAOSyku15LbQHN7q2k4tXX4bbU9rqFsMlZ3EN
         ORELYYwZ7WHHX62pdzEtouV/4ark9j+q8xi26/2A4zxDy4K+aPWyvASXa5uaPMQeV5Jb
         wiGCxDcNHECQao61aKSPJCkuY3mMQ7dLwzMuhKIGIH8e5mPTo7BQpnVMfGiHNScfdEpy
         G0yUvVIHPnR9WPWL8MnHxlMKkKUDntWbjaQqxd7Rf85dBOP1EwGZSs67esnemdfEG5Sc
         VWYNsj3h55tcWmgxZYNuVVPlL/6soyBWSPlolu3sPYvTFqmqFJmNGH/sschz5SwUiFj7
         VxOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770715259; x=1771320059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IlH64Mz+KKFJUb9BlTOf5rZ4xZ1OVwTP7aNaOyu8jZg=;
        b=C/V5J5hXkp2G0cKILhmkBWXKCtGydvIzHzZOdPb03mdeue5c1gk41o6CQpopf+XxI9
         4GcbgD7SVyd6JeoJLUd0zFl/t7NYgdZdhLglXgDVQdy+kPWa/Wyf3wEFIJMdP9sLQMaC
         Es9dnpImQsQ6sa9m7mMir648fcokTULkf5LRy+O7KxprClW/8shyxw68cYEPoKD7xjee
         tJxKhWwiYY+PS3QTRxPFB4ZS+XB9g6v6pUhhUfn8HWKcG5cr/R/jAh+cl3KGPWGIsivG
         nFWp9LEBxgTnSOk5w9ICUO74+zFnwMX0bwCMRonnoKFzvRM/XQRyEd7X6vlc4FF7yDfi
         Hj9A==
X-Forwarded-Encrypted: i=1; AJvYcCVYax28aj2Xo4B/Bc2u76vII0UykuAHCQguGBisKUUkyJxOYrB6kv2hNJm4mYFcbbfPeGqpCcrmrsBr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5+Ktm0/fW8RyFF2v2pYDpl9DaZFC131NN4RZP7HWKiZiErMuX
	8r5Iq+1K0zECaSKSaRmJekO5MbQ6KmLCIzoO7BL2QBh61hW5VzX/0bW7b9WxcuZqbbOJ+6VX5Hl
	M183XZNqSMXPQiKvVrkBq81ioeWmDE1txj6xBQRDfXFAsspNCnpvLtph2hxyVwl0A
X-Gm-Gg: AZuq6aIMKNpPZN5ydJabl0cb1PTmss7UcQkD0pA8iJ4jUva3PHi0hiaweCiMayvPeIH
	N33U5HqSPdqK9fLCjlp3O8oSckAiHd7g+WRSu9wrOO4gJYR8pEch7bg8k2jQk/g1QV5TnOTMWrL
	DMMbr0nrz7LTQRseNWz9NGz2KOjZAXd03FHQ4xGCyvOIWf0WvR6bKqW8rA6OmI++YWJzQ44rFDC
	/yOBfDX9MX6n2ZnEyxw9kG1BCbNlkVQKd3C/lvlLvv4Lk74XUAwUwzF5AniVrEq9S2Q9EMuT+22
	UNZcfa3FBM/UG9/7YVX2j7o6LehtSeFiBRoooVaeXE9W81DWHRVry0aFW9rmieoUlF46x3U5ZyC
	PBJvkP0+TnQb2IBdDD+PvNOnGaunSg0kJD+kmiXsiINTx8W2rmQo=
X-Received: by 2002:a05:620a:1a9f:b0:8ca:4288:b16c with SMTP id af79cd13be357-8cb1f6ec26cmr159138485a.54.1770715259146;
        Tue, 10 Feb 2026 01:20:59 -0800 (PST)
X-Received: by 2002:a05:620a:1a9f:b0:8ca:4288:b16c with SMTP id af79cd13be357-8cb1f6ec26cmr159136385a.54.1770715258698;
        Tue, 10 Feb 2026 01:20:58 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1964:f977:ccfd:e173])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4834d7e64b0sm56219905e9.11.2026.02.10.01.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 01:20:58 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio updates for v7.0-rc1
Date: Tue, 10 Feb 2026 10:20:53 +0100
Message-ID: <20260210092054.24697-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2BgciwqNqpz6YcJB0CgDFxQtFBoXA4mn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA3OCBTYWx0ZWRfXwxbLtzvp/7w9
 ylVdDqqv8RUW0gs8oKqYeJ2dSnjk3FgkxbC2LzbpR43K2ZS6QGjBK0IwKHUNHi7gvU0M1Ma6oQo
 +dOhrLLBwvOBcbl/JWQuok8A+Iz+SGwdNdztY3o0BEHP8M8kcyleW8Jr3nzahJSz8Apmq+TgYpl
 4JEQueDfotxP3rt4E40neiqMdFxfjdoc3TPuv9tWtLKr5To2uMxU4qfuTfcIW2HfTFNAx+ps3zU
 1zBbsLsq0Fh9gafL227zD0egvx9l7FuvAZTuVzHX4Db9bhwVxQRyrBB7gU3k41Pgewe0yUO9c8k
 kdp1sjalIi2jGG3KNdH7SycEONTf8dKMZqj3KBgT0xbXROlngR9K6CLGusuPF8oigddaONwztMf
 ma1Z84i6KFU6t3fnfLCXTJPmTahgh3pm9FCTWbRBxTInpt1T3jdjEELhO7sW1QKuF9FKqqUTscN
 DIOpdFOorzS1C4aC0EQ==
X-Authority-Analysis: v=2.4 cv=dP2rWeZb c=1 sm=1 tr=0 ts=698af87c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=bGNZPXyTAAAA:8
 a=VwQbUJbxAAAA:8 a=m3PiDRfvGn5sIWi62IcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=yL4RfsBhuEsimFDS2qtJ:22
X-Proofpoint-ORIG-GUID: 2BgciwqNqpz6YcJB0CgDFxQtFBoXA4mn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100078
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-31547-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,pengutronix.de:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bartosz.golaszewski@oss.qualcomm.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A9045118CCF
X-Rspamd-Action: no action

Linus,

Please consider pulling the following set of updates for the GPIO
subsystem for the v7.0 cycle.

There are two new drivers and some changes to GPIO core but mostly just
GPIO driver updates across a wide array of files, adding support for new
models as well as various refactoring changes. Nothing controversial and
everything has spent a good measure of time in linux-next.

The merges are: an immutable branch from the MFD tree, another immutable
branch between the GPIO and reset trees and a pull of upstream GPIO fixes
from v6.19-rc5.

Details are in the signed tag as usual.

Thanks,
Bartosz

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.0-rc1

for you to fetch changes up to af9b4a56f0000fb11057e204ddfb05d72ba4dba0:

  gpio: tegra186: Add support for Tegra264 (2026-01-29 09:31:04 +0100)

----------------------------------------------------------------
gpio updates for v7.0-rc1

GPIOLIB core:
- shrink the GPIO bus driver stub code
- rework software node support for "undefined" software nodes
- provide and use devm_fwnode_gpiod_get_optional()
- only compile the OF quirk for MT2701 when needed

New drivers:
- add the GPIO driver for ROHM bd72720
- add the gpio-line-mux driver providing 1-to-many mapping for a single
  real GPIO

Driver changes:
- refactor gpio-pca9570: use lock guard, add missing headers, use devres
  consistently
- add support for a new model (G7 Aspeed sgpiom) to the aspeed-sgpio driver
  along with some prerequisite refactoring
- use device_get_match_data() where applicable and save some lines
- add support for more models to gpio-cadence
- add the compatible property to reset-gpio and use it in shared GPIO
  management
- drop unnecessary use of irqd_get_trigger_type() in gpio-max77759
- add support for a new variant to gpio-pca953x
- extend build coverage with COMPILE_TEST for more drivers
- constify configfs structures in gpio-sim and gpio-virtuser
- add support for the K3 SoC to gpio-spacemit
- implement the missing .get_direction() callback in gpio-max77620
- add support for Tegra264 to gpio-tegra186
- drop unneeded MODULE_ALIAS() from gpio-menz127

DT bindings:
- document support for the opencores GPIO controller in gpio-mmio
- document new variants for gpio-pca953x

Documentation:
- extensively describe interrupt source detection for gpio-pca953x and
  add more models to the list of supported variants

----------------------------------------------------------------
André Draszik (1):
      gpio: max77759: drop use of irqd_get_trigger_type

Andy Shevchenko (3):
      gpio: pca9570: Use devm_mutex_init() for mutex initialization
      gpio: pca9570: Don't use "proxy" headers
      gpio: pca9570: use lock guards

Bartosz Golaszewski (8):
      gpio: swnode: compare the "undefined" swnode by its address, not name
      gpio: swnode: restore the name of the undefined software node
      reset: gpio: add the "compatible" property
      gpio: line-mux: remove bits already handled by GPIO core
      Merge tag 'v6.19-rc5' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      Merge branch 'reset/gpio-compatible' of https://git.pengutronix.de/git/pza/linux into gpio/for-next
      gpio: shared: use device_is_compatible() for reset-gpio
      Merge tag 'ib-mfd-clk-gpio-power-regulator-rtc-v6.20' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next

Billy Tsai (6):
      gpio: aspeed-sgpio: Change the macro to support deferred probe
      gpio: aspeed-sgpio: Remove unused bank name field
      gpio: aspeed-sgpio: Create llops to handle hardware access
      gpio: aspeed-sgpio: Convert IRQ functions to use llops callbacks
      dt-bindings: gpio: aspeed,sgpio: Support ast2700
      gpio: aspeed-sgpio: Support G7 Aspeed sgpiom controller

Christophe JAILLET (1):
      gpio: Constify struct configfs_item_operations and configfs_group_operations

Daniel Palmer (1):
      gpiolib: of: Only compile in MT2701 quirk when it is needed.

Diogo Ivo (1):
      gpio: max77620: Implement .get_direction() callback

Ernest Van Hoecke (1):
      Documentation: gpio: pca953x: clarify interrupt source detection

Jan Remmet (3):
      Documentation: gpio: add TCAL6408 and TCAL6416
      dt-bindings: gpio: gpio-pca95xx: Add tcal6408 and tcal6416
      gpio: pca953x: Add support for TCAL6408 TCAL6416

Jonas Jelonek (2):
      dt-bindings: gpio: add gpio-line-mux controller
      gpio: add gpio-line-mux driver

Jose Javier Rodriguez Barbarin (1):
      gpio: menz127: drop unneeded MODULE_ALIAS

Krzysztof Kozlowski (3):
      gpio: aspeed: Simplify with device_get_match_data()
      gpio: creg-snps: Simplify with device_get_match_data()
      gpio: zynq: Simplify with device_get_match_data()

Matti Vaittinen (17):
      dt-bindings: regulator: ROHM BD72720
      dt-bindings: battery: Clarify trickle-charge
      dt-bindings: battery: Add trickle-charge upper limit
      dt-bindings: battery: Voltage drop properties
      dt-bindings: mfd: ROHM BD72720
      dt-bindings: leds: bd72720: Add BD72720
      mfd: rohm-bd71828: Use regmap_reg_range()
      mfd: rohm-bd71828: Use standard file header format
      mfd: rohm-bd71828: Support ROHM BD72720
      regulator: bd71828: rename IC specific entities
      regulator: bd71828: Support ROHM BD72720
      gpio: Support ROHM BD72720 gpios
      clk: clk-bd718x7: Support BD72720 clk gate
      rtc: bd70528: Support BD72720 rtc
      power: supply: bd71828: Support wider register addresses
      power: supply: bd71828-power: Support ROHM BD72720
      MAINTAINERS: Add ROHM BD72720 PMIC

Michael Tretter (1):
      regulator: bd71815: switch to devm_fwnode_gpiod_get_optional

Prathamesh Shete (2):
      dt-bindings: gpio: Add Tegra264 support
      gpio: tegra186: Add support for Tegra264

Rosen Penev (2):
      gpio: realtek-otto: add COMPILE_TEST
      gpio: realtek-otto: use larger type for dev_flags

Stafford Horne (3):
      dt-bindings: gpio-mmio: Add compatible string for opencores,gpio
      dt-bindings: gpio-mmio: Correct opencores GPIO
      gpio: mmio: Add compatible for opencores GPIO

Stefan Kerkmann (1):
      gpiolib: introduce devm_fwnode_gpiod_get_optional() wrapper

Swark Yang (1):
      gpio: cadence: Add quirk for Axiado AX3000 platform

Tzu-Hao Wei (1):
      gpio: cadence: Add support for edge-triggered interrupts

Uwe Kleine-König (1):
      gpio: stub: Drop empty probe function

Vivian Wang (1):
      gpio: spacemit-k1: Use PDR for pin direction, not SDR/CDR

Yixun Lan (2):
      dt-bindings: gpio: spacemit: add compatible name for K3 SoC
      gpio: spacemit: Add GPIO support for K3 SoC

 .../devicetree/bindings/gpio/aspeed,sgpio.yaml     |    4 +-
 .../devicetree/bindings/gpio/gpio-line-mux.yaml    |  107 ++
 .../devicetree/bindings/gpio/gpio-mmio.yaml        |    3 +-
 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |    2 +
 .../bindings/gpio/nvidia,tegra186-gpio.yaml        |   22 +
 .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml |    4 +-
 .../bindings/leds/rohm,bd71828-leds.yaml           |    7 +-
 .../devicetree/bindings/mfd/rohm,bd72720-pmic.yaml |  339 +++++++
 .../devicetree/bindings/power/supply/battery.yaml  |   33 +-
 .../bindings/regulator/rohm,bd72720-regulator.yaml |  148 +++
 Documentation/driver-api/gpio/pca953x.rst          |   87 ++
 MAINTAINERS                                        |    8 +
 drivers/clk/Kconfig                                |    4 +-
 drivers/clk/clk-bd718x7.c                          |   10 +-
 drivers/gpio/Kconfig                               |   24 +-
 drivers/gpio/Makefile                              |    2 +
 drivers/gpio/gpio-aggregator.c                     |    8 +-
 drivers/gpio/gpio-aspeed-sgpio.c                   |  362 ++++---
 drivers/gpio/gpio-aspeed.c                         |    7 +-
 drivers/gpio/gpio-bd72720.c                        |  281 ++++++
 drivers/gpio/gpio-cadence.c                        |   76 +-
 drivers/gpio/gpio-creg-snps.c                      |    4 +-
 drivers/gpio/gpio-line-mux.c                       |  116 +++
 drivers/gpio/gpio-max77620.c                       |   19 +
 drivers/gpio/gpio-max77759.c                       |   10 +-
 drivers/gpio/gpio-menz127.c                        |    1 -
 drivers/gpio/gpio-mmio.c                           |    1 +
 drivers/gpio/gpio-pca953x.c                        |    6 +
 drivers/gpio/gpio-pca9570.c                        |   19 +-
 drivers/gpio/gpio-realtek-otto.c                   |    5 +-
 drivers/gpio/gpio-sim.c                            |   16 +-
 drivers/gpio/gpio-spacemit-k1.c                    |  168 +++-
 drivers/gpio/gpio-tegra186.c                       |   90 +-
 drivers/gpio/gpio-virtuser.c                       |    8 +-
 drivers/gpio/gpio-zynq.c                           |   12 +-
 drivers/gpio/gpiolib-of.c                          |    4 +
 drivers/gpio/gpiolib-shared.c                      |    7 +-
 drivers/gpio/gpiolib-swnode.c                      |    9 +-
 drivers/gpio/gpiolib.c                             |   30 +-
 drivers/mfd/Kconfig                                |   18 +-
 drivers/mfd/rohm-bd71828.c                         |  555 ++++++++++-
 drivers/power/supply/bd71828-power.c               |  160 ++-
 drivers/regulator/Kconfig                          |    8 +-
 drivers/regulator/bd71815-regulator.c              |   15 +-
 drivers/regulator/bd71828-regulator.c              | 1025 +++++++++++++++++++-
 drivers/reset/core.c                               |    7 +-
 drivers/rtc/Kconfig                                |    3 +-
 drivers/rtc/rtc-bd70528.c                          |   21 +-
 include/dt-bindings/gpio/nvidia,tegra264-gpio.h    |   61 ++
 include/linux/gpio/consumer.h                      |   36 +
 include/linux/mfd/rohm-bd72720.h                   |  634 ++++++++++++
 include/linux/mfd/rohm-generic.h                   |    1 +
 52 files changed, 4174 insertions(+), 433 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-line-mux.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd72720-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd72720-regulator.yaml
 create mode 100644 drivers/gpio/gpio-bd72720.c
 create mode 100644 drivers/gpio/gpio-line-mux.c
 create mode 100644 include/dt-bindings/gpio/nvidia,tegra264-gpio.h
 create mode 100644 include/linux/mfd/rohm-bd72720.h

