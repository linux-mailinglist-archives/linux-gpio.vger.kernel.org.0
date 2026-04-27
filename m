Return-Path: <linux-gpio+bounces-35637-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MJlMHHMr8GmBPQEAu9opvQ
	(envelope-from <linux-gpio+bounces-35637-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 05:37:23 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1875147D192
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 05:37:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2281C300B19F
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Apr 2026 03:37:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195292D1916;
	Tue, 28 Apr 2026 03:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r4s7WmaD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC157404E;
	Tue, 28 Apr 2026 03:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777347439; cv=none; b=cf2gnjxSmVXWlICkji+YmT0ZBTlzDfagnUIX/R8u4T5aR3KAGBbjZY6n6M01i9Ffs1CPmnUE10TNT3waYdo2WOe4wlT8hbHWei0XYovtbEyhko4g4mZSC0oqKMDTwmJtVBrTx37t950BYvCsza4wX06s9+SFASeCR+5sMRdyDpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777347439; c=relaxed/simple;
	bh=2suceYxU88y6krrt22ZaO5KzYJZ3cUAIndOKkvU548A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=f7Ljrco/toEJoGYwfsWRiJuVOnSOfACiSCEIuqucWT0MEMtwUQp1UNfF7bewtaqLtQN/qkHxCFH/drE4zmtQK+r9nKzH8nNtoBHTpCogUGZZl47EhN9re7WvKrSvizpCqqNqpXE+5wbtiqR+wHvKpGCJTxXSHzQGngP2k8Jfw0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r4s7WmaD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA24FC2BCAF;
	Tue, 28 Apr 2026 03:37:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777347439;
	bh=2suceYxU88y6krrt22ZaO5KzYJZ3cUAIndOKkvU548A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=r4s7WmaDU2uexnPKho2g9q3exCEFSPLppH/VJZusCXM5NGPtYaZnOWWWRUhefwQOG
	 QzsS/JqP52n0AfP8CoJDiM2rSd2+AlglEBPHDPIrZrwLOEcGFCoKDXf/IuNwPlBJKI
	 hmF0K4hD0RrP59idXBMdc9vs5bXw6YGy+1qGJDYj1wZy3FJ6MfwirLM89IKBsM5QX0
	 ZVtj9gAlx7MCxIQElBEzhX5BlhkPfxdPxEC2dleh+E5ugugjX4aet6XbxqRADiPSp2
	 +1wNpb31E7uvLhlnwB36FmGthEq6M9sUCZsLpTUuFK8+x+0chuuGHXN7w7746Yj5Or
	 3ho5VDKniS3pQ==
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org
In-Reply-To: <20260427-asoc-wsa881x-v2-1-9ef965f94624@kernel.org>
References: <20260427-asoc-wsa881x-v2-1-9ef965f94624@kernel.org>
Subject: Re: [PATCH v2] ASoC: wsa881x: Move custom workaround to gpiolib-of
Message-Id: <177732956023.324244.14124577102269598769.b4-ty@b4>
Date: Tue, 28 Apr 2026 07:39:20 +0900
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1121; i=broonie@kernel.org;
 h=from:subject:message-id; bh=2suceYxU88y6krrt22ZaO5KzYJZ3cUAIndOKkvU548A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp8CtsFp+P81aiwBajJQ/Avj0GJo+RwghkpGYtt
 GywrkATHQqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCafArbAAKCRAk1otyXVSH
 0LxTB/0ST6p8ZIgydIX+XQ1oW9tF3BWzVHiOFLn7p2DK1ttXHW60O61LdpBqmXI8NLBOjGNdGm5
 55AAelKg09NQavo1jc1rZ6QapfaDyVUvS9RdCO5mTjrHjLiTZwql8n+3DN5CdRChJuNKqubI1/N
 IR8udOR02P9y3f0moalUB5MX7ajCp7IIPLZunF2wSp9JivpQp07ocBxsepcweQ1vnEnA68RmFTc
 gboxKyeZtQwZ+yhsNtO4X0mUw5QuNNxw7yZSK5i21d09RbPiRQ2OAxrkrUSgRN6YiXrs4xRHsKc
 0/Hk0fmL3WK+fBBWM0doQ+zxvcm43ogeA69w57+ZFdAqQeKn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Rspamd-Queue-Id: 1875147D192
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	TAGGED_FROM(0.00)[bounces-35637-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Mon, 27 Apr 2026 10:43:21 +0200, Linus Walleij wrote:
> ASoC: wsa881x: Move custom workaround to gpiolib-of

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-7.2

Thanks!

[1/1] ASoC: wsa881x: Move custom workaround to gpiolib-of
      https://git.kernel.org/broonie/sound/c/bfa336cee332

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


