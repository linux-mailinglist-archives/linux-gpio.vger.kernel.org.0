Return-Path: <linux-gpio+bounces-31469-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBDXA7p5hGlU3AMAu9opvQ
	(envelope-from <linux-gpio+bounces-31469-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 12:06:34 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A5316F1A8A
	for <lists+linux-gpio@lfdr.de>; Thu, 05 Feb 2026 12:06:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AD42E30305E0
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Feb 2026 11:05:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBAFF3AA1B3;
	Thu,  5 Feb 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="joYiMl9q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF343A9DAE;
	Thu,  5 Feb 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289522; cv=none; b=PUsHKGLk47nDYU9TfeRt/Es/6D74AKqyLIbP6CULV476DvfHDl9bof3DuC0C1KLGP4R6uA6L3QB7x/cblIXO/jOK9VrYiGTVk+dhW8riPmQhUYMHRSZHKcgoJ2PO0BYFqMU5zo17idWGXIrdVPZ+QU9Rom0PYi0adKbaNMf027c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289522; c=relaxed/simple;
	bh=3yroB5EuHT5Z0jDLlKLrB2U9tRJzVfP4UmJKpgI5erE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TrgoNr8ESIMmXFdpvyeyU5O2kCj5WmPVtb5u6vR0l4/oSlcq7n/5zlLzXft5Oe9KKiPR1DQEOXQYacuCiUPFcUexKEoxbxkp14sq5ZOiJEwa03bdzc9SXITBsD9ihFM2irp8RvX+ZBrp9k7BRGQxehdiVtqmosxr+8u3Dh2g6N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=joYiMl9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7D73C2BC87;
	Thu,  5 Feb 2026 11:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770289522;
	bh=3yroB5EuHT5Z0jDLlKLrB2U9tRJzVfP4UmJKpgI5erE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=joYiMl9qM8KAhoeKBW9E1QMN8hk8eaOGjyAspS/0YUOoYlm0oDqAZvM1HXPNxZ6P5
	 6XZj/cIuiOEIN6D2RLHuCD01Xi0euxEJbdErB9BqhDu68UI005Seg7omuampRDhwbU
	 7mUqkoQOwfo6wLLYZ6InUByDoDdRceZWk54jNwgojwHvcLKqEkEgdbO7bb2izLRQzf
	 XOu9J79HkoivhwY2sT4eDWBwNgjSDJiSDwyqgUVlIPmLTICpTJU2wXtyR5uTlJmEoj
	 yfdsextotM0IpC6UUcu0XrLBbHwkPp+zbJBuRVkU4fJjVJv22vEWumSRbQBKsRvzlg
	 fmC+Up4g2M99g==
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
In-Reply-To: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
References: <20260122-s2mpg1x-regulators-v7-0-3b1f9831fffd@linaro.org>
Subject: Re: (subset) [PATCH v7 00/20] Samsung S2MPG10 regulator and
 S2MPG11 PMIC drivers
Message-Id: <177028951856.8936.9455009190205034946.b4-ty@kernel.org>
Date: Thu, 05 Feb 2026 11:05:18 +0000
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31469-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A5316F1A8A
X-Rspamd-Action: no action

On Thu, 22 Jan 2026 15:43:27 +0000, André Draszik wrote:
> This series extends the existing S2MPG10 PMIC driver to add support for
> the regulators, and adds new S2MPG11 core and regulator drivers.
> 
> --- dependency note ---
> This series must be applied in-order, due to the regulator drivers
> depending on headers & definitions added by the bindings and core
> drivers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-next

Thanks!

[01/20] dt-bindings: firmware: google,gs101-acpm-ipc: convert regulators to lowercase
        commit: e4691f356b2c24467eadc8b20f267e9e046f74cd
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


