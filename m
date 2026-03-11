Return-Path: <linux-gpio+bounces-33180-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIMuKKXEsWniFAAAu9opvQ
	(envelope-from <linux-gpio+bounces-33180-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:38:13 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB322696CB
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 20:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D1F933073FA6
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Mar 2026 19:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0481832B9A8;
	Wed, 11 Mar 2026 19:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E5ATBm9g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43285305962
	for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 19:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773257886; cv=none; b=bbTSn9t3JCSt1rbCK0PMciElSH1e8szZPauMSkFwHNTZCpvRYVSoh/lfHag3SJuQnRV37Asu0NA9QJ5S1/jqYQn8FDpa47ePUF0Z2d4HuTInpFeerCgZt+15m7QY0CXcVT811Q8hKAESeJInHL1bXzQK63Oqt3R2lVRRlrA5stg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773257886; c=relaxed/simple;
	bh=uk+w+sTtMCxK5SSLAnjnJ8LuG+64ZZOSctjkGQ2I/K0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rWdmPUFcJyodjW5zidwgraO8tT5dOKBPY79vqnc/Dav/81dov4Ykt2EtbUsinyNyt6F1/Jx9H3xe6bVtyAAUn4Xo+fHk1vxrMxU+GmTgOk/kGcp0G+UKHFOzzEmeJu5EvCcpfvPVJIjZHinkG1njD9OKnueQSZpkV8l8iyrR4Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E5ATBm9g; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-439c6fc2910so189456f8f.0
        for <linux-gpio@vger.kernel.org>; Wed, 11 Mar 2026 12:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773257883; x=1773862683; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=E+AkwVqaWf8hy65M6kQXD8z5ogodn290MdxFGjaBkgY=;
        b=E5ATBm9gH+pn7du6rh6hllyL+wj/XBoB9c86m2W94wTGwRnsHBTD4Y3oFFGzqux1v4
         H0+18KNUOU7DiOj30VbkZObJCaBfjlEiSgLX4GgaPQAxFy/gKK5QCIWxe7GltJZfjrxu
         8U0Gn2J+1/8jWzA6LFULWxkNraKUZM3quO398k4+s5xpUlvvwbHGMQJ/UcmrEFtdcOTw
         I9TkkJ/KuPpDBUWxHoF/g6HUUv+ZQKR7dRmCpJ50OrtEdIxC5ZTJv2DYZ0Ui77DENU5Y
         7vIp6vodT28GANPPvkBoJ0KkH+4/WBBCOLlMtPngxkX8cGv33GRb77B+qpsp10b2aTdj
         OOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773257883; x=1773862683;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E+AkwVqaWf8hy65M6kQXD8z5ogodn290MdxFGjaBkgY=;
        b=pL3YW0fovmj3a0BN7P8xzIvKTtSfo135CSK0tMpC9niBTBR3xsWM+7GfxiAlBzS2eH
         4Jo4jHcNuee0UNpj+sAS5lIxHTX2Pl1+FadMuNasXh0vI1cHCyoymazDTjFHvFOEJpYU
         rUjejjV7UbuidQqio9ui3iRiGNunWw76FQhHgyXxotap57xRFQwcAqAuruK2bqNAJl7j
         V5OOVpwRNx/Shg3+cE6u9jSgn++yBpuUluI8dxKx2PVQ957jBfyrQ3lODV/CD8ZMTeAg
         JOx3EOiMq4hQ2q1fS4isgwHt+wYZzV5KAnUyh54McFUYJ8qkOnD4ULAeq2h8WF1BRA3I
         atNg==
X-Forwarded-Encrypted: i=1; AJvYcCWs8WCTeq/Z/PYkGH3s1+JQO3nVANprIvEYXEngtTlIzcFMyJwV3W4AZHtyrygot4XAsd+mgScNSghD@vger.kernel.org
X-Gm-Message-State: AOJu0YzY/xOJo4jd/KsEV3ODCuknU9fYdl8/qg5Rg3AmWO4SRCPOcYHb
	JsjErEnQEQu0hMZPeD12qGXFVnyMZoYDZlgzOgmy9rZiYbjN1E19t2Yj3gjjg+1a5A8=
X-Gm-Gg: ATEYQzylC9hpAKQJVIdf667vxcmWWt74zBAarU4ga9Kz8hJmbWVFGG2rZViOhlFOppL
	7AOuKqskDIoBBKtftwgwqXNY6AstyIjHW7NwwNaf4S4YqyDUcwgebHW9ULe3oKglBaDOMTMyGBy
	i6WtnwqC3umW8MMKHR12zJMYA+m+jpeynUWvS2JCxsWpnWKxf/x+BvmCUHXiKWZz5rkTOFHIWxy
	e4NWgVcCKX7xXn3iKdMw4bvKHVJTe9BEr5qOQDDzWXLOHYLNrk9cVu9onIcIKNyz5R0Cntd1WCY
	RrqMutMuiTa33410eLnMbDpyhGD4zvQb1KgRI3GXf837Vxd7AXQ91QJqdiJn3Gkj2a+C7UwnOsV
	dY/wqKgmtgGCLJMhzDQ8fwSvjxd3rR8aBTCfsSysEPhppsFsf3WRoQgGFaBPUuCjoRbNhEHTbd2
	xwGmZDezqdzWgBRqZvKKR/OYTaJPgn
X-Received: by 2002:a05:6000:1a8f:b0:439:bdd7:425d with SMTP id ffacd0b85a97d-439f8200089mr7617923f8f.23.1773257883423;
        Wed, 11 Mar 2026 12:38:03 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1a76e5sm1426159f8f.12.2026.03.11.12.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:38:02 -0700 (PDT)
Date: Wed, 11 Mar 2026 22:37:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Linus Walleij <linusw@kernel.org>,
	AKASHI Takahiro <akashi.tkhro@gmail.com>
Cc: arm-scmi@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Dan Carpenter <dan.carpenter@linaro.og>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v3 0/7] gpio: introduce a gpio driver for SCMI
Message-ID: <cover.1773150895.git.dan.carpenter@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33180-lists,linux-gpio=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EEB322696CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This basically abandons my earlier attempts and goes back to Takahiro
Akashi's driver.  Here is the link to Takahiro's patchset:

https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linaro.org/

In the review comments, to that patchset we had discussed putting the
gpio section inside the pinctrl section.  The ordering problems are a
bit tricky because you want the pinctrl driver to finish probing before
you start probing the gpio driver.  To me it seems nicer to put the
pinctrl things such as pinmuxing in the pinctrl block and the gpio things
in the gpio block.

I updated Takahiro's patch to work on current kernels.  I've had added a
few other patches to make things work on current kernels.  The most
noteworthy change is that instead of calculating the ngpios, I changed
it so you have to specify the ngpios in the device tree.

I updated the device tree spec file to address review comments.  I
changed the compatible to scmi-pinctrl-gpio.  I also updated the
examples to show how pinmuxing works.  I didn't know how to include all
the potential GPIO configuration options so I set
"additionalProperties: true".  Hopefully, that's okay.

AKASHI Takahiro (3):
  pinctrl: introduce pinctrl_gpio_get_config()
  dt-bindings: gpio: Add bindings for pinctrl based generic gpio driver
  gpio: add pinctrl based generic gpio driver

Dan Carpenter (4):
  pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
  arm_scmi: pinctrl: allow PINCTRL_REQUEST to return EOPNOTSUPP

 .../bindings/gpio/pin-control-gpio.yaml       |  70 ++++++++++
 drivers/firmware/arm_scmi/pinctrl.c           |   2 +
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-by-pinctrl.c                | 124 ++++++++++++++++++
 drivers/pinctrl/core.c                        |  30 +++++
 drivers/pinctrl/pinctrl-scmi.c                |  46 +++++--
 include/linux/pinctrl/consumer.h              |   9 ++
 8 files changed, 276 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

-- 
2.51.0


