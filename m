Return-Path: <linux-gpio+bounces-34719-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEJ1DyzQ02n8mQcAu9opvQ
	(envelope-from <linux-gpio+bounces-34719-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 17:24:28 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 001FB3A4B37
	for <lists+linux-gpio@lfdr.de>; Mon, 06 Apr 2026 17:24:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1391E3019D5F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Apr 2026 15:23:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9521C3845D1;
	Mon,  6 Apr 2026 15:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JxGowwph"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560B9386541;
	Mon,  6 Apr 2026 15:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775489009; cv=none; b=gSUEwohUOGO0kuydDXdJ/ijZYdjErqqpJy0tdG1ZJru6/ZBq25c1+5g2Yi9GjvbMDwwqAHMn7SyrzeEWhQFKqEpCNZLWBoi3px5yz2WSykqihp6La0mxx3MoiI9ChuNqthlhZPORAbDfrpF4kyO2fkbiJO7aC4Bti+/QS8/Tc3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775489009; c=relaxed/simple;
	bh=8sz7HhWogtz4bAQCE5wYiwQaMtdydphZtxifA1hPwuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=X2gi97dcttK9mLdSxQDZPw/h1FzcdfQdf9zpfWrudIWGUfCmLpqsGlXRXJGwE2R9Zb94mNa/QxiNSbd2Er05jNkWfip2j210zeCRyGHRu284PZFHoqFs0htg9///X7qTuL31gGXPTfJlylBp93GNtRIbK8Bpz/0aK/y0XzB8WzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JxGowwph; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 606E9C4CEF7;
	Mon,  6 Apr 2026 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775489009;
	bh=8sz7HhWogtz4bAQCE5wYiwQaMtdydphZtxifA1hPwuk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=JxGowwphFFyvSXJXYQQo/kmBovF+wt19ELu2SwJ/5hMdelbW+QDZqzX81YaZ6JccB
	 WPz5PIQ3J+5+EFdrNp4ELcmOrvmQnZ/U0Efbrn6RrXVrSm+wk/D4yRXLGsbIms6bTa
	 OA7xqN6eYU7PHEtplBa7vBskI0DjGcEPcjiuQEH7Vy7iEdinhDc3o1RGMEubRSysxh
	 GDNFB1zPyAs5gPByvCxBmiZ+oaQ1LSHyhBxFbQVDjeCDDLNHifOzgHyAjYKjSOn2VN
	 JKCD1ngIAbg4Ez5/hl0Qz0mltJ2BHwb4t6OBwu9FqaEybPBEjKde6jbWztElrAmfb/
	 BKtyH6LZ+UDVw==
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260406075114.25672-1-clamor95@gmail.com>
References: <20260406075114.25672-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v5 0/2] rtc: max77686: convert to
 i2c_new_ancillary_device
Message-Id: <177548097517.46304.8142229926923155566.b4-ty@b4>
Date: Mon, 06 Apr 2026 14:09:35 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev-67696
X-Developer-Signature: v=1; a=openpgp-sha256; l=1439; i=broonie@kernel.org;
 h=from:subject:message-id; bh=8sz7HhWogtz4bAQCE5wYiwQaMtdydphZtxifA1hPwuk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp08/uU1CTT3KzlibXts1Z+4QpiWB+gZDbBH1Gf
 0VS4JHW22OJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadPP7gAKCRAk1otyXVSH
 0CrWB/wKShVledqP+QvT73mmRrRJOPaCli+wTDZaMbA1jrXuDYaYP0fkyzNOEmqIWRsf9lNnLtC
 +k9PvlQvBI50/i+SiC7vjfQ4cchL66zGQnNR3HufeyIGHvHdKlMe/RfeFVLqL3SBcXVmNX2kzkc
 drIU5oBzZbV1d/FRPMziKZzM0kDZwspd6vdxBTu7JjBkU51TaNsqHhxQ4OtGbDLrLQ+o1O/g9r8
 f6RAX0EFxTWKGNNNKBTyepCWj1+xGvb5oIjYQYsUeIqXbMHhW56ccX/AeUnrwZGUBgua2Yyqnin
 w6xWvnfOKE1iMSsdK4vct2mPv0bDujkxeTELdZEgs2jdgr0B
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-34719-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[broonie@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 001FB3A4B37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 06 Apr 2026 10:51:12 +0300, Svyatoslav Ryhel wrote:
> rtc: max77686: convert to i2c_new_ancillary_device
> 
> Convert RTC I2C device creation from devm_i2c_new_dummy_device() to
> i2c_new_ancillary_device() to enable the use of a device tree-specified
> RTC address instead of a hardcoded value. If the device tree does not
> provide an address, use hardcoded values as a fallback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git for-7.1

Thanks!

[1/2] regulator: dt-bindings: regulator-max77620: convert to DT schema
      https://git.kernel.org/broonie/regulator/c/881dd6b2ff82

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


