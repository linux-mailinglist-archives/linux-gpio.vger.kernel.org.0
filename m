Return-Path: <linux-gpio+bounces-33578-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SJR0BCxJuGlTbgEAu9opvQ
	(envelope-from <linux-gpio+bounces-33578-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 19:17:16 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C7329EEAC
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 19:17:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4D1043070973
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2026 18:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BCAF348445;
	Mon, 16 Mar 2026 18:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IzKGWr8Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14F5347512;
	Mon, 16 Mar 2026 18:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684921; cv=none; b=BvDxGkHF80n8hLGz/RdNkqgGTaxn/wSkcPP9AaIxGqBOQveWz12/rspQwSt41efrGsn/ADJHNrbVoN7SA2cjgAwht86UhRrF3n9tLI/4PIagiiDGM6Xq0H87zaLETGx5V2efQp7P/OACytfT7hNY8Fnu6lCiANxTB7wxgYMBWFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684921; c=relaxed/simple;
	bh=f0V1XGDt0iDrlPiBc61XqhTfjDwAfM87xKlHzbkj1xE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kPUAN3xJ7vPDrOkncr+eKKQItUcjXxch1b22c2eMN7fNZ0taYSjiUC9Pvx2uyjMKo1CklH1c+YdFZONyB5fnyRQvaTA8KSY+f5lAzPlcTFUQHFdcLzFF1HEVRTdMninhjeiKtb5qOCLhIjh4UYyaYe6N6nWAtYDLevgIM/d8Liw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IzKGWr8Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11B9C19421;
	Mon, 16 Mar 2026 18:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773684921;
	bh=f0V1XGDt0iDrlPiBc61XqhTfjDwAfM87xKlHzbkj1xE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IzKGWr8Y8bdgCgHypXlfL7L9UV40MqCWXpx5ZSbdhR5Q5tWfPFkU9dSlXVdQYIXQb
	 1wYDtUv+a972HzgsVtl7FAa+e+txxzuYmtlbfCfvVx3YlgXYvcocfs6UIeyEGZ/XiA
	 nhF2mPRTC8FBQ8xjydvB9cZu6uXzm1uAMS2632VGrAbSErdVy4OibypDG+7fPfkS2o
	 mN6e9PQANA2VjNx+QI/G1uoEkMFx22+odi0zRIDPVv6KWwfD3veWnT6aoLdlzmhlel
	 C/o6UHeSN7PJpcmzlBUXFbYK8u3BOh4yWMiu2IL+HhoOgiSYzjwGF335J0h118bLSp
	 o1z9toqrSkDgg==
From: Mark Brown <broonie@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Russell King <linux@armlinux.org.uk>, 
 Lee Jones <lee@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: patches@opensource.cirrus.com, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org
In-Reply-To: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
References: <20260314-asoc-arizona-v1-1-ecc9a165307c@kernel.org>
Subject: Re: [PATCH] ASoC: codec: arizona: Convert to use GPIO descriptors
Message-Id: <177366676762.65215.4887426822529961456.b4-ty@kernel.org>
Date: Mon, 16 Mar 2026 13:12:47 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-c239c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1125; i=broonie@kernel.org;
 h=from:subject:message-id; bh=f0V1XGDt0iDrlPiBc61XqhTfjDwAfM87xKlHzbkj1xE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBpuEi15VIkFVpfbMENWG7miE5Gedb2iYkZYDVb1
 KFLtDV0u0+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCabhItQAKCRAk1otyXVSH
 0IgrB/92YGzRsgyzung8/Uf95Fkw5+Sp6uPvpKX9cgrxQQRVvUxp2sn8CyRWH4rZAmWcDWzWwm8
 Gh189w3kcUSHzn5m/UsBkhTxjY6q28jCKIoz4pHCCQHVfjcIl5QePpXPieDQqyAIlDQXJrOHD2/
 b7z6c5xXHinWj95Bppag4PO849BbIzLNqCbvPWrx9QWtIYN2fkpJ/FmK4vL+KY6ZiSHwjyDrCuq
 47tKIGArH6xApc5sAjvYQe4t2EHsyCQ28rIilRiEt8CyhoJkWpYz+jNWAsIet107yCp5s44WrwA
 ddPZ5/n2jfWSGnnOAbgEvbtQbYigf0+quY/T4uOU5Kw8W8NA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,samsung.com,armlinux.org.uk,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33578-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: B1C7329EEAC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 23:56:49 +0100, Linus Walleij wrote:
> ASoC: codec: arizona: Convert to use GPIO descriptors

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.1

Thanks!

[1/1] ASoC: codec: arizona: Convert to use GPIO descriptors
      https://git.kernel.org/broonie/sound/c/cb15d8e6cbe8

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


