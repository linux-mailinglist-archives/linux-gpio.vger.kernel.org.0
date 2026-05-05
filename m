Return-Path: <linux-gpio+bounces-36189-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDkyAl3b+WkmEwMAu9opvQ
	(envelope-from <linux-gpio+bounces-36189-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 13:58:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB654CD18E
	for <lists+linux-gpio@lfdr.de>; Tue, 05 May 2026 13:58:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DDE0B3014FF0
	for <lists+linux-gpio@lfdr.de>; Tue,  5 May 2026 11:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A4F39B482;
	Tue,  5 May 2026 11:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cEzCYbvz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B351C383C6C;
	Tue,  5 May 2026 11:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777982297; cv=none; b=jDkUoAyESsuEBQ0VfPIFfFsPbz2SMF9448+oaFt+UtTZPvUQSYtF+mVHHvW29a3QG5AVjwZR3vL4K32oMAgJ/eYJiSanVUQzAVGGpYK/XqW2UC8uIrkv1JXyqMFW8OHIIiImhFLJ6pv8xKoMnSZHjNkqb41GGBK25faOn0vFytg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777982297; c=relaxed/simple;
	bh=zpz/IBCMJ9rlEr5yvIog9kP6PEwlQCzTVEu7FEW2KM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FGfrAXycODGsUDId3MUYJ5uujKtC5geUuWxuh2BW5EUJfAwPrb6m/gAYPbMSYzVAcvfJqQb8xGrPNSpt/SqHNXtUTVI06gnMKxsyM2iUQIpW0Ytbagk2huVWDNhjkvGMWLZ1KD4+ls3exeP9ekiXfzykYnZ9IvksewNDBmC4hcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cEzCYbvz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10004C2BCB4;
	Tue,  5 May 2026 11:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777982297;
	bh=zpz/IBCMJ9rlEr5yvIog9kP6PEwlQCzTVEu7FEW2KM4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cEzCYbvzlQqVwbMHf3QKF3rgBoeN0/DldW50hQ2kCJwawcZw3c7FeP99QGUIKKRRf
	 rPVlDpcd7kZOIlxtgbE3kljytwC7tCAeSQ/Oe9dHJMV+y1Tx+wj4xwCrIPl0KMOfMu
	 caR/laiD6TwQHFfXueIMSjPmgX0Z5vmewf8IQkm2W8a8p/hk29v+A+qRB4coQANeWV
	 w3Xi9OkfUjN5HFv1LQtwjwWoPxjwTag61ifSccoKkQMWXmo6ordqP2qVvs91CGi+b1
	 C6uyHTmQoCDprRlbP8k92QxZXn7CQsIWUlx0u4zPh0Jtv+3pd0jF4IWTD3yCWrMpJ1
	 m96mKYj83UOhg==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>, 
 "Darren.Ye" <darren.ye@mediatek.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
In-Reply-To: <20250822125301.12333-1-darren.ye@mediatek.com>
References: <20250822125301.12333-1-darren.ye@mediatek.com>
Subject: Re: [PATCH v7 00/10] ASoC: mediatek: Add support for MT8196 SoC
Message-Id: <177798229351.597350.5415197464438946507.b4-ty@b4>
Date: Tue, 05 May 2026 20:58:13 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Rspamd-Queue-Id: 9FB654CD18E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,collabora.com,perex.cz,suse.com,bgdev.pl,mediatek.com];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36189-lists,linux-gpio=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,darren.ye:url]

On Fri, 22 Aug 2025 20:52:29 +0800, Darren.Ye wrote:
> This series of patches adds support for Mediatek AFE of MT8196 SoC.
> Patches are based on broonie tree "for-next" branch.
> 
> Changes since v6:
>  - optimize mtk_afe_pcm_pointer interface and improved logic checks.
>  - update mt8196_afe_private structure by removing unused member variables.
>  - only reference clocks directly supplied to afe and set required frequencies directly.
>  - update adda driver according to reviewer suggestions.
>  - update i2s driver according to reviewer suggestions.
>  - update tdm driver according to reviewer suggestions.
>  - optimize platform driver and update widget rotues.
>  - move the sof route from platform driver to the machine driver, and moved pinctrl to platform driver.
>  - update the afe yaml file to remove unnecessary clock references.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[01/10] ASoC: mediatek: common: modify mtk afe platform driver for mt8196
        https://git.kernel.org/broonie/misc/c/1aadc0147b42
[02/10] ASoC: mediatek: mt8196: add common header
        https://git.kernel.org/broonie/misc/c/33eda2c14ff7
[03/10] ASoC: mediatek: mt8196: support audio clock control
        https://git.kernel.org/broonie/misc/c/7384ecab34eb
[04/10] ASoC: mediatek: mt8196: support ADDA in platform driver
        https://git.kernel.org/broonie/misc/c/9a5881402c6e
[05/10] ASoC: mediatek: mt8196: support I2S in platform driver
        https://git.kernel.org/broonie/misc/c/65a195132669
[06/10] ASoC: mediatek: mt8196: support TDM in platform driver
        https://git.kernel.org/broonie/misc/c/ede4d841111a
[07/10] ASoC: mediatek: mt8196: add platform driver
        https://git.kernel.org/broonie/misc/c/57513aabfe5b
[08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE
        https://git.kernel.org/broonie/misc/c/5cd03440c0d4
[09/10] ASoC: mediatek: mt8196: add machine driver with nau8825
        https://git.kernel.org/broonie/misc/c/de764b0d1838
[10/10] ASoC: dt-bindings: mediatek,mt8196-nau8825: Add audio sound card
        https://git.kernel.org/broonie/misc/c/1c65cc451873

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


