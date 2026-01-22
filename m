Return-Path: <linux-gpio+bounces-30945-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QHpHA15acmkpiwAAu9opvQ
	(envelope-from <linux-gpio+bounces-30945-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:11:58 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F3B6AE68
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:11:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CC06A30AB4C0
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D3E3A7320;
	Thu, 22 Jan 2026 16:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qqHjPZVw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E5639F8A2;
	Thu, 22 Jan 2026 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099714; cv=none; b=G9Ut/S7c8FnrJH4JBrgM2C8F576kuCvFRmZoGwGMBI5pynMIFUnQCFQJDxcivhNoCro7DC8B6wUQYYFDDeAKfV3FB3DLzrcSn1LMEZV2AnTx4nldbQ6FYbihacVwwD0ujZqkiezqiU5D4hx0aeoDP1JVdir3B2DNppSF+V1oXi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099714; c=relaxed/simple;
	bh=ATzVU5Eh9/D968XS8XugRtNZ05MV4C91ZRl5HyqTOkE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=rlacbec0GfsuDLv8aj33dqHDevPkC3W90qpJXBzlupAfFpa9S9fysFBSlw4d2GKyROS+fKxPW7xVGV3f/Dhs/CJS9Vey3OymnHZykXeGSg2fq9PPNvFe3pFXoxpaDnyM0PX+vr0YfepjhVu1Uh5qMPojvXlVUnJnZakfUgyqQcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qqHjPZVw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8692C116C6;
	Thu, 22 Jan 2026 16:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769099712;
	bh=ATzVU5Eh9/D968XS8XugRtNZ05MV4C91ZRl5HyqTOkE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=qqHjPZVwhKQZSV/e6Xvs95F8UcfmNIjnloqHskkY3V5ufzJbBmUgTJRUVmf7yeH7b
	 aS0O9215E6WLVZnAt+CXQ+DyJ6sSEFx2Ktsh5H2ANKuj4FXooMMzIceK9bTbrBIH7H
	 mOlBJYB51dhNi+r/7rdQBb4fNfE0/NvAv63YbKGUI6rnwAar7LIzhdCsUL72G6xUNg
	 RjdOVONnFNMdk1Op3phPkh/YLpHDcAFbUkmpctbyNnDRzd2/PeFftJg+nCDt5YkuSE
	 P0nqdt+2SB3lP6Hs5YVh5eERBdYFP/6pF+NzwPJw8m4TAVs0roNuh2PqmFws1PToCq
	 srKWasEuaOP8w==
From: Lee Jones <lee@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
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
Message-Id: <176909970862.4046298.23888884171864307.b4-ty@kernel.org>
Date: Thu, 22 Jan 2026 16:35:08 +0000
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
	TAGGED_FROM(0.00)[bounces-30945-lists,linux-gpio=lfdr.de];
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
X-Rspamd-Queue-Id: B5F3B6AE68
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

Applied, thanks!

[04/20] dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separate file
        commit: c19ccbf37758f90064f7b1e32ec291954d97b426
[05/20] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
        commit: ac1068790221a421e7bc4dacadfe8d39d6bec3a9
[06/20] dt-bindings: mfd: Add samsung,s2mpg11-pmic
        commit: d0cd9ded4bdef73303e65abbeae47b00b7288059
[08/20] mfd: sec: s2mpg10: reorder regulators for better probe performance
        commit: 40b82c61c044e5ae7bbd532e841bd01507028c33
[09/20] mfd: sec: Add support for S2MPG11 PMIC via ACPM
        commit: 8e6c6e8ef5e241385eff14d4c8b8e45d5e762e84

--
Lee Jones [李琼斯]


