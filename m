Return-Path: <linux-gpio+bounces-31468-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJcmJL95hGlU3AMAu9opvQ
	(envelope-from <linux-gpio+bounces-31468-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 12:06:39 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D920F1A92
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 12:06:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A4D6C30242BD
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 11:05:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B58CE3AA1A9;
	Thu,  5 Feb 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="krmQ41wa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775EE34F27B;
	Thu,  5 Feb 2026 11:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289518; cv=none; b=JIUZFbgSlZ2Z12uf0ipTns1ChTuqbXX2IhnPnYBWXZI5GcgMfxhtQLjDsDoODXXnPGYFY/5xVK5/eaSOTMsuu0z2daQ42Isp2EFvd2otejF+hKzwNQA0/yX2+jrXWHI5byKuoJhp2+XTDjHHZhqxBpYsLecTTrObMBefuZ0zpKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289518; c=relaxed/simple;
	bh=suyIuqg+KTxdcWb2X5y7+eGvbERM9TmGzZPsZFEkI+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=cA2MqO+OrDWsBgDbc1/yaU/LCaKQaT551Nx6AMgsaobjHXJWQQqKY1WvGnaeZs1zYXaxX2cBCFmZ7mh0MqT/09K68fQTUmqQeuCiFMndfMRNcnOnFHSWFxWYnbVSDcc33URf8Cerfnh5IARPCmam1DDixPzzTdkP1U+gb1mjaB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=krmQ41wa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE961C4CEF7;
	Thu,  5 Feb 2026 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770289518;
	bh=suyIuqg+KTxdcWb2X5y7+eGvbERM9TmGzZPsZFEkI+8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=krmQ41wasR2nlBi0SjvFLQT4DhDmqm7MxQOfqSbSwktjZmdroN1uEyOn1PyQOnJfk
	 fjgQWr3u5ouVRJaY7NkO0Dgfn9HsQuAu3soao3D7/yHGczHaMbXoDRgkI6RaqhXMJR
	 gauhMpW4CNiz3quynPJ0DbDiQQNG1ETl1UYBSluaAk8jUUqLmoX22XAJnfWH1As9W4
	 2vr94osS1YX1/je6zqRgbt7OvpROh/2oZdXDkGXzlcnhWstHKIqvrAzSaiBSmeJttt
	 t/aIJ9tO1j532LJomtyifvshdjPQMK6UI5uwdrm+Bh0/4xlSZDiGJgJYjoYabqCSwD
	 ue9DRtcLxoIKg==
From: Mark Brown <broonie@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
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
Subject: Re: (subset) [PATCH v6 00/20] Samsung S2MPG10 regulator and
 S2MPG11 PMIC drivers
Message-Id: <177028951465.8936.7820400020144729535.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 11:05:14 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-47773
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31468-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 0D920F1A92
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

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[02/20] regulator: dt-bindings: add s2mpg10-pmic regulators
        commit: 71bc6adae4102550717a8eeaa21d3f76f5149ac6
[03/20] regulator: dt-bindings: add s2mpg11-pmic regulators
        commit: 030158c0528d1cbfbe9eebed09bad604f6135734
[10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
        commit: 7d33c0a4c6a3356db2b2f599820baf75d3753d44
[11/20] regulator: s2mps11: drop two needless variable initialisations
        commit: 0809d3dcc0dd8f597adbcd4d881063eb1b437987
[12/20] regulator: s2mps11: use dev_err_probe() where appropriate
        commit: 6430d65d7b74712e9ff60e270687d66265dad6f2
[13/20] regulator: s2mps11: place constants on right side of comparison tests
        commit: 223cefd021fa6ef5687159836871907aa3084fe2
[14/20] regulator: s2mps11: update node parsing (allow -supply properties)
        commit: 5b3c95739d674794730fbf3c678206f302609d27
[15/20] regulator: s2mps11: refactor handling of external rail control
        commit: 0042c880e43c54c9bf19c24a72e54eeea37995e3
[16/20] regulator: s2mps11: add S2MPG10 regulator
        commit: a2b8b9f33ce30ab51b33b52dc52e55d6930b9a02
[17/20] regulator: s2mps11: refactor S2MPG10 ::set_voltage_time() for S2MPG11 reuse
        commit: 8f23cfbe4463c3de2e552aed106e179c0c932b6e
[18/20] regulator: s2mps11: refactor S2MPG10 regulator macros for S2MPG11 reuse
        commit: 102dd11fc98261675a0664de1466616d7dad8d91
[19/20] regulator: s2mps11: add S2MPG11 regulator
        commit: 979dd8da76eb98b212f4e8cafc3c4019cfa3d93d
[20/20] regulator: s2mps11: more descriptive gpio consumer name
        commit: fe8429a2717fc01082502b0adf680a50b230eff7

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark


