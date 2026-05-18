Return-Path: <linux-gpio+bounces-37133-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNo+G5IuDGq0XwUAu9opvQ
	(envelope-from <linux-gpio+bounces-37133-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:34:10 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F74057B5E7
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 11:34:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AE3530CDDEE
	for <lists+linux-gpio@lfdr.de>; Tue, 19 May 2026 09:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F68D3F65FF;
	Tue, 19 May 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qvFv9gRo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404303EFFC2;
	Tue, 19 May 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779182717; cv=none; b=eAzsjPBnzqsCC5t5tubNxBWq/zitFaT+ET7we6fEapoqbo+nEoj9VUcFQlGbJVMhVKEdglU8ZP3X+Lmjr9EgXxew+CNSAyvsCTwfaOdL/PwlGieVbNkJQ6xZd4SBSP0FJp3keSxKQJBa3BGfIryEzkQdTObpUdIRIWe7b1JzeD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779182717; c=relaxed/simple;
	bh=LY4j+awKez8uEwIL98fiH+gRN9x2qY9yTM+7byFWkT8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XCSl0BY8V4bYQ3ZfJUW8JzCjdyVSVA1JdAMye6F9RT09/6ZVi4tqCYNzKtbJVQ0hrvJPfvEaN6ihBi7UVxpl1sYsrEtFqfw2or4R+ivLaggUrtopJu1xMqBFYJ/D+rXuOyT3R1PDVN50+nIFUwf9C5lggQ8nMtkk+DUR8f8vsso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qvFv9gRo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7643C2BCB3;
	Tue, 19 May 2026 09:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779182717;
	bh=LY4j+awKez8uEwIL98fiH+gRN9x2qY9yTM+7byFWkT8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qvFv9gRojvXoDWo7++gx8YgEHwBhplYpFEZMoqsGTigFypLqJomaA0Z0B4o7GyCD2
	 utPNm/g4AFtD8Y7osfFHEYhQ3pWI6+0kjRAfmW368l2B6/pLxfQvSdAMdSG8N0Z9vt
	 vLlAbg/xv3ZInCD10jp2pPWut9YR+mIacjErV0fi0z9yNgLgCcUk4Jazp8+t60gbMK
	 pXyX1UiEbIlUFHQVH1p6hTHUWdBcRJK0/64QTtKcjqu4DGTXkXmMCJhyoh33xgIOn+
	 DKfC6+YYc0X5FS5IIEO1Gm1D7hZA/PvNbHs0GsnFsFRzKBq0RNR8/Lg7alnQpqZyF7
	 H1QbEGEsNJILg==
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Herve Codina <herve.codina@bootlin.com>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Christophe Leroy <chleroy@kernel.org>
In-Reply-To: <20260513081702.317117-1-herve.codina@bootlin.com>
References: <20260513081702.317117-1-herve.codina@bootlin.com>
Subject: Re: [PATCH v3 00/17] ASoC: Add support for GPIOs driven amplifiers
Message-Id: <177912269514.352391.10184061127272991864.b4-ty@b4>
Date: Mon, 18 May 2026 17:44:55 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3526; i=broonie@kernel.org;
 h=from:subject:message-id; bh=LY4j+awKez8uEwIL98fiH+gRN9x2qY9yTM+7byFWkT8=;
 b=kA0DAAoBJNaLcl1Uh9AByyZiAGoMLHijtKhg2bzH9vN5cJeX23ssUzW9D4fCBT4nDr/XZaEGz
 YkBMwQAAQoAHRYhBK3maKpnVxi1n+Kf6iTWi3JdVIfQBQJqDCx4AAoJECTWi3JdVIfQA98H/A0n
 6RYuh8WJgFqu9o0qrpi6xiTm+AFuikj7qx/QqA1NaYOX+V4TqaAfjOy4wmLTL4eNR1ItCGX8AQb
 Mi599fXxb/Ru2fPh5glNkYVHs/DC1kRZ2ABo/79uxr58dhNy+GkY4Ce7AEgqsKgHNI0RS1A93a8
 YIbXkgXwzhv7dM7SSXB4KO5Kfl3DYoBCYnwK/AfxglmtzcaNtOW3S7HPsc9DtDzRktXvMlFvp+0
 VmCpGf5rOgWUlseQyN9hPShB7VVoUr66TG1WGmOFytXEujNiS00h9i7lEUdEGchh9BOSEarUB1U
 VVKMk9FtEsbzTNQ4klCx1Rd+G/QhLEx2TsYpwKI=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,bootlin.com];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-37133-lists,linux-gpio=lfdr.de];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 2F74057B5E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 13 May 2026 10:16:44 +0200, Herve Codina wrote:
> ASoC: Add support for GPIOs driven amplifiers
> 
> On some embedded system boards, audio amplifiers are designed using
> discrete components such as op-amp, several resistors and switches to
> either adjust the gain (switching resistors) or fully switch the
> audio signal path (mute and/or bypass features).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[01/17] of: Introduce of_property_read_s32_index()
        https://git.kernel.org/broonie/sound/c/37dba38ac8d0
[02/17] ASoC: dt-bindings: Add support for the GPIOs driven amplifier
        https://git.kernel.org/broonie/sound/c/04a1fe8e6582
[03/17] ASoC: simple-amplifier: Remove DRV_NAME defined value
        https://git.kernel.org/broonie/sound/c/28188a6d8869
[04/17] ASoC: simple-amplifier: Add missing headers
        https://git.kernel.org/broonie/sound/c/23cf9e3ca498
[05/17] ASoC: simple-amplifier: Remove CONFIG_OF flag and of_match_ptr()
        https://git.kernel.org/broonie/sound/c/2c562adb159e
[06/17] ASoC: simple-amplifier: Rename drv_event() function
        https://git.kernel.org/broonie/sound/c/dc8beaad2926
[07/17] ASoC: simple-amplifier: Use 'simple_amp' variable name instead of 'priv'
        https://git.kernel.org/broonie/sound/c/34ddd2d368c3
[08/17] ASoC: simple-amplifier: Remove DAPM widgets and routes from the ASoC component driver
        https://git.kernel.org/broonie/sound/c/4d84b75e5eec
[09/17] ASoC: simple-amplifier: Introduce support for gpio-audio-amp
        https://git.kernel.org/broonie/sound/c/41e3ebbfcab1
[10/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for extra power supplies
        https://git.kernel.org/broonie/sound/c/f68933d0eb67
[11/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for mute gpio
        https://git.kernel.org/broonie/sound/c/432331970eca
[12/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for bypass gpio
        https://git.kernel.org/broonie/sound/c/46c21e55c3bf
[13/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for basic gain
        https://git.kernel.org/broonie/sound/c/5796026b8e90
[14/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-ranges
        https://git.kernel.org/broonie/sound/c/d25e00ecd5c5
[15/17] ASoC: simple-amplifier: gpio-audio-amp: Add support for gain-labels
        https://git.kernel.org/broonie/sound/c/fb757dfa039f
[16/17] ASoC: simple-amplifier: Update author and copyright
        https://git.kernel.org/broonie/sound/c/7b295a6fc632
[17/17] MAINTAINERS: Add the ASoC gpio audio amplifier entry
        https://git.kernel.org/broonie/sound/c/5bd8c4b7d3bb

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


