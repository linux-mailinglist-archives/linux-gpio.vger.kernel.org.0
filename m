Return-Path: <linux-gpio+bounces-38386-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XSu9ADeGLGpISAQAu9opvQ
	(envelope-from <linux-gpio+bounces-38386-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:20:39 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAA167CB7D
	for <lists+linux-gpio@lfdr.de>; Sat, 13 Jun 2026 00:20:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=GfSNY6tC;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-38386-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-gpio+bounces-38386-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2FD6231EC949
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jun 2026 22:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9F43D16F8;
	Fri, 12 Jun 2026 22:19:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7E43D1AAC;
	Fri, 12 Jun 2026 22:19:10 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781302751; cv=none; b=hoMd+H84QtxNj1PjoKhki31qE19crsLHrlQ5Blcq6VBKmt/PWkRGAdVv+OCKK9EMfZ1t5l9YCW14TFthABv+CZFsQ3O1nVSEGwl541RXuh1U3VLsAn5wzMU5lQz+DM02fHX2GqZq4EY4SU1cMVmNmfoAOLOoH4v4wv2zUnLnaHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781302751; c=relaxed/simple;
	bh=s6eAXdoqlUtuLTZth4AInopuSR9AS4C4NIHo4pAOH0g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=q7qqw9rQrRKczquXHhhHTHz1xHdq8E2MtbhEyxQPauYzZhTDGHKtMkA2ivAFoUDvAxoOQ13lOWhX5i6bbm49RP9mhm6Zy48Ogw9e/WmIUHb/pnHRLRB3u4yUa+RkXcHlqes1S388bxL6fqajH1n0xFNkt+zmkItFq+z8fOdBjiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GfSNY6tC; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E57F1F000E9;
	Fri, 12 Jun 2026 22:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781302750;
	bh=f3oMmrVXWyC5Wzc2sMvrJFI2Fzlu9pNGMbkNW/R6LDg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=GfSNY6tCmURPFfTsAasGL0KULYw37NvIrwenNSXCO/zHges2r36rBXCobJI29tX4l
	 U0tU5umwOrMPHeEhXR/dd84LBvkF9k2aW+KlvfMTLVX93yDeX9jy3+JtYqxS2DXEbK
	 navC49qjtLL3G+AjcpbjT8wL3TwFovpAPGjzXjf2K1jAKdrm+7EreeYK9KKK/DbCyv
	 G/oysRjWCRWKv5G4eH47bYr7gwpDcLJnYYb12KJr+A9u1eMG3rSni3Q6dmO9LkaUZO
	 WtEExJKjv2H1O0OstT40Sf7pUMp/DySKlMo23Z8uKSqsHNrQJ1/mJ6KcgpP/yaM0cC
	 2HdGNa3v4ttOg==
From: Mark Brown <broonie@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, phucduc.bui@gmail.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20260610102021.83273-1-phucduc.bui@gmail.com>
References: <20260610102021.83273-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 00/10] ASoC: mediatek: Use guard() for mutex & spin
 locks
Message-Id: <178120798545.484538.11565286739109588330.b4-ty@b4>
Date: Thu, 11 Jun 2026 20:59:45 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2577; i=broonie@kernel.org;
 h=from:subject:message-id; bh=s6eAXdoqlUtuLTZth4AInopuSR9AS4C4NIHo4pAOH0g=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqLIXY3qY4bPRZzGt04t1+88KFfah/WK8pl1Dii
 yKqa5Bte0aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaiyF2AAKCRAk1otyXVSH
 0KzRB/9/lmKAq9WvQTjtXr2vcfs/RpkjmcKxB1gkRm+rO78MqATIRHFdBOlzCezkeK9Dmo+S2Ay
 4ZIDE/MC2+d4ssKrXbyMz1rekMFO+njYDoU43qtDjrDDavijOkMhKkKo0pydBQw7x7L+0eR4+2u
 Bez+M4/iIcpOhN4YtmBOicPNspZ6q0HTToJOEOMIqfklZ1amGHSR5SRpZaPB0CxIuYGo7ENsbzd
 BUFnaoRCq90RJXIb27JQNQHUS4Rb/+2tjlAMEQJ0wYhW9nOhsazyJhuK1z8WD+JVMNCvooK4Y6S
 lBBqwLu4fLlE3XNIbXDyVc6bSglIbyHdOL9VABtfuxeeXKRe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[26];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38386-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:matthias.bgg@gmail.com,m:phucduc.bui@gmail.com,m:lgirdwood@gmail.com,m:angelogioacchino.delregno@collabora.com,m:linusw@kernel.org,m:brgl@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:matthiasbgg@gmail.com,m:phucducbui@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,collabora.com,kernel.org,perex.cz,suse.com,vger.kernel.org,lists.infradead.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6BAA167CB7D

On Wed, 10 Jun 2026 17:20:11 +0700, phucduc.bui@gmail.com wrote:
> ASoC: mediatek: Use guard() for mutex & spin locks
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> This series converts mutex and spinlock handling in Mediatek ASoC drivers
> to use guard() helpers.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[01/10] ASoC: mediatek: common: mtk-afe-fe-dai: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/9475859429e4
[02/10] ASoC: mediatek: common: mtk-btcvsd: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/c69724b714c5
[03/10] ASoC: mediatek: mt8186: mt8186-afe-gpio: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/1e9f4587c873
[04/10] ASoC: mediatek: mt8188: mt8188-afe-clk: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/cc29c31e87fc
[05/10] ASoC: mediatek: mt8192: mt8192-afe-gpio: Use guard() for mutex locks
        https://git.kernel.org/broonie/sound/c/14edf39daefb
[06/10] ASoC: mediatek: mt8195: mt8195-afe-clk: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/a9f8d09ab109
[07/10] ASoC: mediatek: mt8195: mt8195-dai-etdm: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/a57e39c7ff03
[08/10] ASoC: mediatek: mt8195: mt8365-afe-clk: Use guard() for mutex & spin locks
        https://git.kernel.org/broonie/sound/c/befae7299ab4
[09/10] ASoC: mediatek: mt8195: mt8365-dai-adda: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/754c2fbf8bbc
[10/10] ASoC: mediatek: mt8195: mt8365-dai-i2s: Use guard() for spin locks
        https://git.kernel.org/broonie/sound/c/62bde3771c3b

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


