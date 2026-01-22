Return-Path: <linux-gpio+bounces-30944-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEuMCPNZcmkpiwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30944-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:10:11 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F886ADC6
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D6F12303A4BB
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3550B3A7325;
	Thu, 22 Jan 2026 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PN3C61Q1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A5A43A7335;
	Thu, 22 Jan 2026 16:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099709; cv=none; b=oEovhsg0MdWH4cVFW7r9zCLOFpOAwSBshbsAxsSUh2CBECIU/0aDAUYLeQlECHcdSmdl/Up+/FeRKYw00pun9JZKAuLGbrmoSJxkfOd9eQBQQMjfzbyeb5PxzMQpwzD+/b/SdvsDPdWVyGKdrj7RtPTrn30nzi6N/l3qF3ViBzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099709; c=relaxed/simple;
	bh=Rs467JyGSGcxdTUssKwPcVP4PNnxqvgEetOOOSvVhmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vs8WG3I6nLUJAAEmebJaNKnH2EKJ8OvjFJ25aPzEiI2Os10VG4LBT3Oi4FgGnQ8BwUr8MrCqTqHI84lJulLjKM3MPI8zrfwfZmc13W0hKlPCI0EZ4s40SvD35mawDdXeJCpxJFiOL/WLXkbk01XiBjrkFV9xLvWBL873NGWDrOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PN3C61Q1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AE5EC19422;
	Thu, 22 Jan 2026 16:35:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769099708;
	bh=Rs467JyGSGcxdTUssKwPcVP4PNnxqvgEetOOOSvVhmk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PN3C61Q1pYpwpl8D3l6CC7Dix4/VBdKxJ/dO+Ix8ZBgkj49eYYt44d3OFf7t+qWDO
	 pWhZqfkRdJmn7BWkvsWF8b8o7tS0cKxzs/O6m6NsgWFPqP5gAnq1aDuLcaj4+LeLkv
	 +EcYnKn5Ir0roUXJXb3acFE7xiapmUCdF08mEJsjQZ0r5EuOkct6aOR5MgYDymnlf4
	 mx6JbaqrELVFleI9BTtbs7UP+4DeDb0s5/VKDt1oyBHg+Q+w75EWEAEQhnqsGTj3fV
	 3V4SUb6z8UsZFLoQJAfQtL+jRF4phkjSssqgaEky2aohxTLkypZ8Bs+H9NfpsK/vEz
	 lYPZqox8vty7Q==
From: Lee Jones <lee@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Message-Id: <176909970391.4046298.17325200147518692917.b4-ty@kernel.org>
Date: Thu, 22 Jan 2026 16:35:03 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-30944-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 88F886ADC6
X-Rspamd-Action: no action

On Mon, 05 Jan 2026 09:01:36 +0000, André Draszik wrote:
> This series extends the existing S2MPG10 PMIC driver to add support for
> the regulators, and adds new S2MPG11 core and regulator drivers.
> 
> --- dependency note ---
> This series must be applied in-order, due to the regulator drivers
> depending on headers & definitions added by the bindings and core
> drivers. I would expect them all to go via the MFD tree.
> 
> [...]

Applied, thanks!

[01/20] dt-bindings: firmware: google,gs101-acpm-ipc: convert regulators to lowercase
        (no commit info)
[02/20] regulator: dt-bindings: add s2mpg10-pmic regulators
        (no commit info)
[03/20] regulator: dt-bindings: add s2mpg11-pmic regulators
        (no commit info)
[04/20] dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separate file
        commit: c19ccbf37758f90064f7b1e32ec291954d97b426
[05/20] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
        commit: ac1068790221a421e7bc4dacadfe8d39d6bec3a9
[06/20] dt-bindings: mfd: Add samsung,s2mpg11-pmic
        commit: d0cd9ded4bdef73303e65abbeae47b00b7288059
[07/20] dt-bindings: firmware: google,gs101-acpm-ipc: add S2MPG11 secondary PMIC
        (no commit info)
[08/20] mfd: sec: s2mpg10: reorder regulators for better probe performance
        (no commit info)
[09/20] mfd: sec: Add support for S2MPG11 PMIC via ACPM
        commit: 8e6c6e8ef5e241385eff14d4c8b8e45d5e762e84
[10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
        (no commit info)
[11/20] regulator: s2mps11: drop two needless variable initialisations
        (no commit info)
[12/20] regulator: s2mps11: use dev_err_probe() where appropriate
        (no commit info)
[13/20] regulator: s2mps11: place constants on right side of comparison tests
        (no commit info)
[14/20] regulator: s2mps11: update node parsing (allow -supply properties)
        (no commit info)
[15/20] regulator: s2mps11: refactor handling of external rail control
        (no commit info)
[16/20] regulator: s2mps11: add S2MPG10 regulator
        (no commit info)
[17/20] regulator: s2mps11: refactor S2MPG10 ::set_voltage_time() for S2MPG11 reuse
        (no commit info)
[18/20] regulator: s2mps11: refactor S2MPG10 regulator macros for S2MPG11 reuse
        (no commit info)
[19/20] regulator: s2mps11: add S2MPG11 regulator
        (no commit info)
[20/20] regulator: s2mps11: more descriptive gpio consumer name
        (no commit info)

--
Lee Jones [李琼斯]


