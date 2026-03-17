Return-Path: <linux-gpio+bounces-33647-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cGEWHfNquWmvEQIAu9opvQ
	(envelope-from <linux-gpio+bounces-33647-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:53:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E8CE2AC68F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 15:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC4B430BC2FD
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Mar 2026 14:40:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 090183E867F;
	Tue, 17 Mar 2026 14:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d7WaUk0R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4587C344040
	for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 14:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773758422; cv=none; b=WzAanyzbWVWvBTv9PAGuHYGPom8FG7YK1TS9uUB9BuuzB9FMuJoFP4ptooMQEnB1KnQ00nl4s3yQnW+pshZsHBoDTjK7xicrIfiDjGumaSQYzQ7Ixp3hDcnAl8bCx418dgsqJSR+g6RNi30df8PdCMys2c9weGcdQ8THOmdRPiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773758422; c=relaxed/simple;
	bh=/4E+MNf4AmhTXqW1IGhVu7c4HIHNcRISLyU5YN+k+nU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CrwWwwREoXAAC5jx4xjKbPammJub2HNXky1uwTcgvzdcGwtIKncrQHurov4JqUA1TMT0ajbW59Z/sFfK+FxiSN1TAl04r5MhHzQxX8y4DIv1+LnAn7gbwS4B1UdbyhV4nSip+SDMLOIANk+LWb6z/Ur+ruaeCcNFO6sdmc6EAQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d7WaUk0R; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-666ee394529so2225349a12.1
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2026 07:40:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773758419; x=1774363219; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5F9q2Ra06tznmx/F5pEf3aEAtRQ3mACpkv9NtbBna50=;
        b=d7WaUk0R+iZzAyFwfuFWUwviPv+mFR4c8mKFsxBQsoEiCXaKCVfMGke0skFU/MDXKE
         zDWqvIdrdHh+TTF0bh4LeB+JPu3zm74xTrGcCuTmnw0BbFFZ/tSQBykZgvefaL06irHz
         jEVDFCdjDhtJPRIZQvNodWz5mbybN5zButKAYNBAOxLfL/aWsMq/OCI3NHZhUcbaJC7z
         k2O1rCm5NVtOl85iRhg/PaB1axBtfGNceAZ6qcy3mjTuOcKTREGeGD/0+CicZ8tAoblj
         GfEKVh2I+NTjuTqqUnlLtQDwP1LT3h+JTCVtsXM0obNjZp9A7Hb8DgEYAp3N7fU0Z6hS
         W1/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773758419; x=1774363219;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5F9q2Ra06tznmx/F5pEf3aEAtRQ3mACpkv9NtbBna50=;
        b=luxRT+tEj5K+DnM1xkIkxXkX7Zs5APc98Z1SsDLbbaqFbFzU1gLrQPPGUYeeclBW9o
         uuEJNpLplhx1wTMDVQY7W4zeAdY8R/5/rnyBogLPnZ3+avQjt65Cw2SntsGdXqIPZtr2
         fNecBBXpF0h6KMPPxIj3z+o2ixohe0I/+PnPT7YFVsWDrZWezUEfy+HHqtAMfktjfLPD
         qpEu9XINaeQ9vYlkj1U77h8hkhw4QdB74T7MDiiBymC2ch8fgutkKYz0PIL+tziXCDfO
         fEGXs2xx1cGrYBA7zvFWl1O0asYFKRc+E9WZcHoMPvTccHvY44fWK0JpyC47mfuK4vP+
         cCeg==
X-Forwarded-Encrypted: i=1; AJvYcCXdGATzO8tnYWIGIcPrPH7ymayIpzeWMG+xLC4WvDrFXg4Cg6TV7t/pvls/tNINcsPYGMBZMK+ass7d@vger.kernel.org
X-Gm-Message-State: AOJu0YyFu6kZeU2Wh+3EkCXbPN/qsv6dBhtAGfnaasnvr1luWRr1cha2
	zz1kE/xzWUFYtchNOZ7r1xVkqfimBUAs9UI1nuGc9lYt2tNKjzR4pRqf9BNDAFFVvfQ=
X-Gm-Gg: ATEYQzzJHjCMGRlE6U/mk1cm+MnjobFbE1b58AhSK7S4tk6+zuhOYW/fuFFJO7X7mVX
	rWbJn1M5z8j7nEmNzvJ1DqCT8iZGKGtWAnsaGtMUcEiR1ATce3RSAPmMFWjuFPJdgH7y6xFl4S7
	+GZRlrcjWYRo/sIAhu8LyOTaOODM8birhB3nHjmBSZjre7IaL1LNIm2tdsM4WSVihdKczWOydv4
	pj3UCshsge6D4iUWiq02OMzgxAtISrMpFfqTXIhgHSGlXpWpS4ZlBsYIlzbJg4aA+hQp9P3aGci
	uzYunJ9jpeli3P1d5K1fvzkRys1pj/eojRpqFG4ajtge/z+68kMCzaPFjhikborZqA3P3gpQY2k
	ELp9oaYTTO6aj9+7ajedHpGIzX+sAdqVzs+e0EyJIjs/vOD97RChmXTpsUpn1jJqKHHRxtX+aZK
	3eNRywSXz0z2CVoC8Q35k9rVt2jbXY
X-Received: by 2002:a17:907:1b16:b0:b97:a1ca:e100 with SMTP id a640c23a62f3a-b97a1cb2212mr737298266b.32.1773758418455;
        Tue, 17 Mar 2026 07:40:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf380f2sm755059366b.53.2026.03.17.07.40.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 07:40:17 -0700 (PDT)
Date: Tue, 17 Mar 2026 17:40:14 +0300
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
	Vincent Guittot <vincent.guittot@linaro.org>,
	Khaled Ali Ahmed <Khaled.AliAhmed@arm.com>,
	Michal Simek <michal.simek@amd.com>
Subject: [PATCH v4 0/7] gpio: add pinctrl based generic gpio driver
Message-ID: <cover.1773757772.git.dan.carpenter@linaro.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-33647-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 0E8CE2AC68F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This basically abandons my earlier attempts and goes back to Takahiro
Akashi's driver.  Here is the link to Takahiro's patchset:

https://lore.kernel.org/all/20231005025843.508689-1-takahiro.akashi@linaro.org/

v4: Addressed Andy's comments about kernel-doc
    Addressed Rob's comments on the spec file
v3: Forward ported Takahiro's patches and added some fixes ups to make
    it work on current kernels.

AKASHI Takahiro (3):
  pinctrl: introduce pinctrl_gpio_get_config()
  dt-bindings: gpio: Add bindings for pinctrl based generic gpio driver
  gpio: add pinctrl based generic gpio driver

Dan Carpenter (4):
  pinctrl: scmi: Add SCMI_PIN_INPUT_VALUE
  pinctrl: Delete PIN_CONFIG_OUTPUT_IMPEDANCE_OHMS support
  pinctrl-scmi: ignore PIN_CONFIG_PERSIST_STATE
  arm_scmi: pinctrl: allow PINCTRL_REQUEST to return EOPNOTSUPP

 .../bindings/gpio/pin-control-gpio.yaml       |  59 +++++++++
 drivers/firmware/arm_scmi/pinctrl.c           |   2 +
 drivers/gpio/Kconfig                          |   7 +
 drivers/gpio/Makefile                         |   1 +
 drivers/gpio/gpio-by-pinctrl.c                | 124 ++++++++++++++++++
 drivers/pinctrl/core.c                        |  31 +++++
 drivers/pinctrl/pinctrl-scmi.c                |  46 +++++--
 include/linux/pinctrl/consumer.h              |   9 ++
 8 files changed, 266 insertions(+), 13 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/pin-control-gpio.yaml
 create mode 100644 drivers/gpio/gpio-by-pinctrl.c

-- 
2.51.0


