Return-Path: <linux-gpio+bounces-31428-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH8pB4gig2nWhwMAu9opvQ
	(envelope-from <linux-gpio+bounces-31428-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 11:42:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AF297E4B30
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 11:42:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 487A630162A5
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 10:42:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 906A813AD26;
	Wed,  4 Feb 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eZlrCu1Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5103C3E8C47;
	Wed,  4 Feb 2026 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770201729; cv=none; b=Ea5KtytLg4eDosJCrDZoloRDYgn7NUvFuwTZ6uqsr64Ad5acitHmNwkaaKCjE84tWybmES7XwCqsariPkKYlNEc97Rjd3NWWPGfjZb4D7pjM2/cB4ufUjgzTGrRyHBswJXHC7s7cJLJHvRfcK2QAChHyJBdKK+Imvp79Y+2UTEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770201729; c=relaxed/simple;
	bh=Ds2qJl/hvxPMbtTbj38gU6EH8pS8yF0G1IA1uU0CHaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FYAygUAz6oUrrJIsSqzvYlqvJc8PelxGP+bvEenRfw/E9mIAumWaHxwxwOHyx+hUKQwtoY41a50DI+1K/zvFrtUUs2TBfe6Awwt/EBHHz67tFEsXHQGIO9Pby+++pAy83gU59kOnJxYhc61+IiO8wPml8D/HrbowE7IOmOR+lJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eZlrCu1Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661B4C4CEF7;
	Wed,  4 Feb 2026 10:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770201728;
	bh=Ds2qJl/hvxPMbtTbj38gU6EH8pS8yF0G1IA1uU0CHaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eZlrCu1Zp+rQ5zdqT+OLsEBh/PzCRez196cW1vkE2EErYIzO50M9WUJp7tiNyCi73
	 HXKRVHLoYJ70QbnhUDVGchn4Ca+KMw1Gbdl3naQuzSF60FYL7j36URjEClLe1XtasR
	 zFe3ZMD8lVS7hFMCsOKU8UPmsi9ekPldZsMxY4SQC6CsnWmRBLGnxn6fYFTkWXmDpx
	 WGKBxjaoWKBQ+EPVsHP2SOLue9G1PKRpPHCcEnvhtWkkt29YflcBQPOesHnmn8npB0
	 8w74ArPDS1m/PTqDV3Y5Ol/15VNP2eOOC+OYcIcbkWQYjj05jb/wTT9OtuXCla0EtF
	 fX6NDwph88Uvw==
Date: Wed, 4 Feb 2026 10:42:01 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] Immutable branch for Regulator and Firmware containing
 MFD and RTC due for the v6.20 merge window 
Message-ID: <20260204104201.GB911837@google.com>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	SUBJECT_ENDS_SPACES(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31428-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl,google.com,android.com,vger.kernel.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: AF297E4B30
X-Rspamd-Action: no action

Enjoy!

Appreciate that it's close to the merge-window now.  Your call to pull.

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-for-regulator-firmware-v6.20

for you to fetch changes up to 3a17ba6557e28d5d99b7e3cad31f22ad28a36cc2:

  mfd: sec: Add support for S2MPG11 PMIC via ACPM (2026-02-04 10:37:29 +0000)

----------------------------------------------------------------
Immutable branch for Regulator and Firmware containing MFD and RTC due for the v6.20 merge window

----------------------------------------------------------------
André Draszik (8):
      mfd: sec: Add rtc alarm IRQ as platform device resource
      rtc: s5m: query platform device IRQ resource for alarm IRQ
      mfd: sec: Drop now unused struct sec_pmic_dev::irq_data
      dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separate file
      dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
      dt-bindings: mfd: Add samsung,s2mpg11-pmic
      mfd: sec: s2mpg10: Reorder regulators for better probe performance
      mfd: sec: Add support for S2MPG11 PMIC via ACPM

 .../bindings/mfd/samsung,s2mpg10-pmic.yaml         | 120 ++++++
 .../bindings/mfd/samsung,s2mpg11-pmic.yaml         |  88 +++++
 .../devicetree/bindings/mfd/samsung,s2mps11.yaml   |  29 +-
 drivers/mfd/sec-acpm.c                             | 171 +++++++-
 drivers/mfd/sec-common.c                           |  62 ++-
 drivers/mfd/sec-core.h                             |   2 +-
 drivers/mfd/sec-irq.c                              | 150 +++++--
 drivers/rtc/rtc-s5m.c                              |  21 +-
 include/linux/mfd/samsung/core.h                   |   2 +-
 include/linux/mfd/samsung/irq.h                    | 105 +++++
 include/linux/mfd/samsung/s2mpg10.h                |  20 +-
 include/linux/mfd/samsung/s2mpg11.h                | 434 +++++++++++++++++++++
 12 files changed, 1098 insertions(+), 106 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mpg10-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mpg11-pmic.yaml
 create mode 100644 include/linux/mfd/samsung/s2mpg11.h

-- 
Lee Jones [李琼斯]

