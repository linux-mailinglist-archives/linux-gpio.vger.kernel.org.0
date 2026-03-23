Return-Path: <linux-gpio+bounces-34047-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHx8CJCOwWlxTwQAu9opvQ
	(envelope-from <linux-gpio+bounces-34047-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:03:44 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 886472FBCD2
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 20:03:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3D3693019FCD
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Mar 2026 19:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 772DC313E3F;
	Mon, 23 Mar 2026 19:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lcPsC65g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE203101A5
	for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 19:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774292474; cv=none; b=mvnGdzLQWHF9tNT4f1cswpLY4mj/Ch1+/xEf6Hak0AUge9auFRtRSSvSdie6W1pZAI1BC/szGG074DicdZoZjwk4M/nJXGjEfu0+6pKKXBb25b2y32qrEcl/8q+NvPs1YJZ2EqyNAPpnK64EVfmelni5esqKiOoDnxlD1ljfiZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774292474; c=relaxed/simple;
	bh=HknQ5tmeJvs4F5JSI87UBv5DHfHkIOf0k7Z/bDgwvjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DsIDkmv0biNtlKSLV6eqszeoxsZ6V3MjFpmgVwYs9sbUiYCUxcxNYcqKlRs2J/Fk1rYlVROKBlDt/VewiqubdirGGztY/bhuyYD1zCKi3rg2mK8D1HEhPDeONibc/8/ztgTX46pvGeson+7bak8n5Vfde3KhkKLYPItdHR1Mluw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lcPsC65g; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-482f454be5bso51476075e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Mar 2026 12:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774292469; x=1774897269; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iAQkTnFgl+8yd50clSd1ldbwKw7NVFGAMfnkLJg3I3Y=;
        b=lcPsC65gr8E4LsGwneE2qGH0tPp6ZD4mt/In70ELRusHQaVHL7KB8rglZx3nmBlsXt
         yq89yEtkhd6YGtABmtDp6l1bv83DVfJn/FnXRAe4g2vmk5VmUtW9FJNuCbnT1lnjbxQm
         V7KzxASPGGhTQHEAT4gRZJWq7zLknibDWkQmDKuU1L2eIoXSnbVHN6gXARMzhCgWgZpX
         rPUHdwsiKC0rlk7PlBmfigtgYrkmpn2YTCpht2D5Ke3GxngU9If+Gg6sS9Emn+B8Mz/j
         RqYcm9S5jSb8/fWFppRAtKbwJC3oQtarwwQ7aIxuATb9Vjweqwdzwu8dPW5qOix789YK
         oyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774292469; x=1774897269;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iAQkTnFgl+8yd50clSd1ldbwKw7NVFGAMfnkLJg3I3Y=;
        b=ZSAsKfZWi9Uz3YMWiTqH0QG7k1qsE7MjiGfsop6Du8toHGdPf01AiI0coclZHgjna0
         HQqF9uMC5g2Q92DPpFPi2PRX2TXoQ64idMX6vHIv9L6CluozEPF/xa3YalPefLz7P4O6
         rHtsyJeR2Zhoj0W0qMf8oYWVQPr3kTRxGImTNCfu9q4pFuk3vi04SBpABZOqzr4BBWAy
         OPwGuGYHNmYSyec8DWWgB2cu/CCcb1OrJr8TiiYbdM6KQBooZ1fAbWEvktBIaACkc5ar
         L5F+kQcsOkxL/GYwgQgADnmmyKPKrdff5crk1kpiY9Kg+EujG3o2z/U7AkrgFNmtErJz
         BHHA==
X-Forwarded-Encrypted: i=1; AJvYcCWJumUespPCiAz6uBeLV4JgZ3/YhO4iiVeiy3Joy889uDh2vQ4V3QtxiuUJXzqzzkMJF1brvqfDqpsl@vger.kernel.org
X-Gm-Message-State: AOJu0YwF9NBIAUNi/b241UC5YtIu6heZtvI4BoCtBiMUeCLzlrOiVu/c
	MGVkcNWIA99NtYTIK2snjNvPgNwle9mRGArQ2K5xo2GfwtLMXzusj3nQ/q287vFapuo=
X-Gm-Gg: ATEYQzxiD2jjsh4h7z8v9ehfNSDBhvoatEsmgqFhoyyxDBEuSXaCszS/MtU4ZiwRfaW
	Wow26k9iDELId5wx1gTHs0HKFxIeTzPg2ec/g0BeIc2pPPPCwLFT3v50dcfPvs9iwhWQ5Tw1F4i
	HRbQra80tXMIrZ0SpSfhZqDvBr/TSDN6r11F2s5dPR/d+YMqzSUG+xuf84d1i6pLt2cNjb0ZiQK
	RZBBxLKlSGrUcDusks85rVNyyMpMrL/irmqJ+Nl92ZVeFVBrgaMljmQAgMWHc2UoVg6ILnW41uf
	5g2PTUGekowstDujqx5bswDcEc2nwu4oFI13meyaqdMW5qlukogyTjI+FCR5M48p9LOvRQYKRM3
	C6S0Hx9fkGNFkPrWEmZC/9EZYkZfSm2oQie46J17naYMKPjY3ytxt5WBo2bkYWueDFmJaCoRBtl
	5gzjQdd4G17pYGYBshi4QU6YgHIF6w
X-Received: by 2002:a05:600c:4349:b0:486:fe83:861c with SMTP id 5b1f17b1804b1-4870f1fc613mr5830435e9.7.1774292468497;
        Mon, 23 Mar 2026 12:01:08 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4870f822b83sm1713765e9.4.2026.03.23.12.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:01:08 -0700 (PDT)
Date: Mon, 23 Mar 2026 22:01:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v6 0/7] gpio: introduce a GPIO driver for SCMI
Message-ID: <cover.1774283146.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-34047-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 886472FBCD2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This basically abandons my earlier attempts and goes back to Takahiro
Akashi's driver.  Here is the link to Takahiro's patchset:

https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linaro.org/

v6: Fix a build error when CONFIG_PINCONF is disabled
    Fix the dt-binding subject and my email address
    Use pinconf_to_config_packed() instead of PIN_CONF_PACKED()

v5: Addresses Andy's cleanups to the driver.
    Adrresses Krzysztof's comments about the dt spec file.
    And almost all the subsystem prefixes were wrong.

v4: Addressed Andy's comments about kernel-doc
    Addressed Rob's comments on the spec file

v3: Forward ported Takahiro's patches and added some fixes ups to make
    it work on current kernels.

AKASHI Takahiro (3):
  pinctrl: introduce pinctrl_gpio_get_config()
  gpio: dt-bindings: Add GPIO on top of generic pin control
  gpio: gpio-by-pinctrl: add pinctrl based generic GPIO driver

Dan Carpenter (4):
  pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
  pinctrl: scmi: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl: scmi: ignore PIN_CONFIG_PERSIST_STATE
  firmware: arm_scmi: Allow PINCTRL_REQUEST to return EOPNOTSUPP

 .../bindings/gpio/pin-control-gpio.yaml       |  59 ++++++++++
 drivers/firmware/arm_scmi/pinctrl.c           |   2 +
 drivers/gpio/Kconfig                          |  13 +++
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-by-pinctrl.c                | 101 ++++++++++++++++++
 drivers/pinctrl/core.c                        |  31 ++++++
 drivers/pinctrl/pinconf.h                     |   6 ++
 drivers/pinctrl/pinctrl-scmi.c                |  46 +++++---
 include/linux/pinctrl/consumer.h              |   9 ++
 9 files changed, 255 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

-- 
2.53.0


