Return-Path: <linux-gpio+bounces-35015-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ADjeEXEm2WmnmggAu9opvQ
	(envelope-from <linux-gpio+bounces-35015-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 18:33:53 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B20BD3DA70D
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 18:33:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60E743082DD9
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Apr 2026 16:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF8433DBD7E;
	Fri, 10 Apr 2026 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="poLVcO41"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F0623EA92;
	Fri, 10 Apr 2026 16:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838509; cv=none; b=lQqUOi3L/k5Gh2YPMmdMEgjsVnHC3SSPw2XZcgbznZ5/+4iImgAvOaAlEUOLTj/U/kaWjLM/wimhSCD1LTrOqYScaVvr2M3XRza+KBiUXWHpo7TE96a9NLDUsvaAyJy+mrkCgXs7/FNQTduWTTU1dei9tDBRN7w02+6LKs5IYQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838509; c=relaxed/simple;
	bh=EpnNbR/nAY+kLzkBNfKS7Cb94i1OYlMvgNWWPVNUEHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FVp0InlFZCGP5Z4PI4L6PWBD8DoC2CwqpQiQbGjI3hRcOYpgwZaMrHolnji8BRrO0bJyxMMzpj/QEpnAfgtO7c1jiaWNrDGY0tHa+EjqjOApBmGUSH1kiPLYU9c5jcUzDbmFaMnAo87m8/hXd/ku8F1fwjEvBgxRRTWfGLSQBQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=poLVcO41; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B386C19421;
	Fri, 10 Apr 2026 16:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775838509;
	bh=EpnNbR/nAY+kLzkBNfKS7Cb94i1OYlMvgNWWPVNUEHc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=poLVcO41o0YakKir25v4r37sYRi/2JayT/KpQTGadfRh2l3KEMbKflMy6SJI3LMrQ
	 m5mgxOlf5mHy2+TITMon3vW7EXCdOal4eAN98cmja5KXvVuz53+VkxOEUmmVVdor2m
	 M6lTYffpX3OX9VcSBFJkE6bPg5R4J+PKcoy5LW78IFgYdlNboJeElj04NEwRBLzT/+
	 L+yRjTuFNeolge44uzV9Vq115VtNgjRZAJIB0dZHKpNn7FTzZJclAecC1MfucazAqL
	 1NYw5xhKVD8oOKXoLq5mpFK6vtOtk28ZmgOlNoJynS0veguWjepq9O2VeAmElyvC+B
	 lU3j+hE6srQYg==
From: Mark Brown <broonie@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260409-asoc-uda1380-v3-1-b3d5a53f31be@kernel.org>
References: <20260409-asoc-uda1380-v3-1-b3d5a53f31be@kernel.org>
Subject: Re: [PATCH v3] ASoC: uda1380: Modernize the driver
Message-Id: <177581696991.1070744.13246183215946136465.b4-ty@b4>
Date: Fri, 10 Apr 2026 11:29:29 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1089; i=broonie@kernel.org;
 h=from:subject:message-id; bh=EpnNbR/nAY+kLzkBNfKS7Cb94i1OYlMvgNWWPVNUEHc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp2SUqz4/fQJ0lMXsG8iyoC+ipcR7rhWJ09QvYM
 faCVWOVZyuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadklKgAKCRAk1otyXVSH
 0NmFB/9t0RWsee00Ft9uTrRYEwtdWsgnngP33FHIj6pcsTBykIeAY8J7K3Fc5EiTg7/FhET0rxO
 D4dxHK4XgFaoCEtnIxuuPzTHb8QYzmW9v6JAqChWmmruj80vqMOI6OUS9SDeNUenJiymhyYa+YV
 18okJCmt7Zqv5GmADInN2bcPjDxo4YPtjSpKnM3+/in4WCbI18uohHBHka3EMO8EAONLltjv1we
 lDpJBwzU+La6nT2t4mhKBmPG7I5X358yVucOqoa69OaO29lP2WUbjkCCRQtTvVEhZuxroCcnvLH
 NGtxDp1Yk/FjlpUFM73bgJXTjo6kOjyM48Obw2wN3Q/czlf9
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[pengutronix.de,perex.cz,suse.com,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-35015-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B20BD3DA70D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 09 Apr 2026 23:39:31 +0200, Linus Walleij wrote:
> ASoC: uda1380: Modernize the driver

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: uda1380: Modernize the driver
      https://git.kernel.org/broonie/sound/c/0cb7aa965ad0

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


