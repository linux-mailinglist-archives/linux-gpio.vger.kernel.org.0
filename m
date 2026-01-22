Return-Path: <linux-gpio+bounces-30947-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NNWNs5fcmnbjAAAu9opvQ
	(envelope-from <linux-gpio+bounces-30947-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:35:10 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9966B6C1
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 18:35:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C4443030962
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Jan 2026 17:03:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C1193DB250;
	Thu, 22 Jan 2026 16:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LYUpiWbj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85AD3D9F20;
	Thu, 22 Jan 2026 16:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769099949; cv=none; b=Cntnh+v4gMw3YC9rrHNC04ALSeOUVJGOCzzGnEG0WIqLqMVtgL8Bkq2CsimTXLl8wpMqj4mHEfYa5xE0irHwM7KLXOyfdha8eP6UZM4dUeCdi5boCKT/zMLzJ8RGKND5lv7DPfL7DOqBVoTK7jyZHG1jns7oss25AXNmYDCZT+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769099949; c=relaxed/simple;
	bh=uVH7rNg9ewRBRQMIGyLml+s35IF3fTqXJq4VrmSDSv4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/pamwyv/7ue5sY3hcLyrv8NoUsr1cAOP8BYIO25quBlcz/1ux3DidjUQ3PVCsH7MV68AkcDJb2jta+42ua3TvLyo/ByS1qjoAceFCqDKcS1eoZc0zfq8wtjLdKv+LTSk6u2N0wiNsP0KZv5DOCR168f+4w5ppZiuydedFWKzXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LYUpiWbj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 591B4C116C6;
	Thu, 22 Jan 2026 16:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769099947;
	bh=uVH7rNg9ewRBRQMIGyLml+s35IF3fTqXJq4VrmSDSv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYUpiWbjWUAXKYC1XfIoeVunaq3DHD2NB+z1x1KZTHq99g4J0IJz1B29CBE4qbzbU
	 eyaya2vaB8qA4O83vwZqGvlyskGHvfUn6au5LlUStJgqTZX55qNve8HJvZh0LwcYYg
	 kjNfVCVzQNiT5RxPjDOyuAf4mhUweGYG3mmnDljm/7BRJSasz5neRSsTN2C6R56Inj
	 3Es41HVfdIRcL0KeEUoqKZolHNZFOh309PYszqIuZcC8OoGTcA1bd+6CHMUB6xQuM7
	 Oof/mugsRHcM1ldfE41XlKEkzcd9NlhUaVNRhooSYKbo9kWleY6GhnntMa/tayF9zj
	 O1M0WDkIaVxQQ==
Date: Thu, 22 Jan 2026 16:39:00 +0000
From: Lee Jones <lee@kernel.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Message-ID: <20260122163900.GN3831112@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
 <176909970391.4046298.17325200147518692917.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176909970391.4046298.17325200147518692917.b4-ty@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-30947-lists,linux-gpio=lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,gmail.com,bgdev.pl];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: BD9966B6C1
X-Rspamd-Action: no action

On Thu, 22 Jan 2026, Lee Jones wrote:

> On Mon, 05 Jan 2026 09:01:36 +0000, André Draszik wrote:
> > This series extends the existing S2MPG10 PMIC driver to add support for
> > the regulators, and adds new S2MPG11 core and regulator drivers.
> > 
> > --- dependency note ---
> > This series must be applied in-order, due to the regulator drivers
> > depending on headers & definitions added by the bindings and core
> > drivers. I would expect them all to go via the MFD tree.
> > 
> > [...]
> 
> Applied, thanks!
> 
> [01/20] dt-bindings: firmware: google,gs101-acpm-ipc: convert regulators to lowercase
>         (no commit info)
> [02/20] regulator: dt-bindings: add s2mpg10-pmic regulators
>         (no commit info)
> [03/20] regulator: dt-bindings: add s2mpg11-pmic regulators
>         (no commit info)
> [04/20] dt-bindings: mfd: samsung,s2mps11: Split s2mpg10-pmic into separate file
>         commit: c19ccbf37758f90064f7b1e32ec291954d97b426
> [05/20] dt-bindings: mfd: samsung,s2mpg10-pmic: Link to its regulators
>         commit: ac1068790221a421e7bc4dacadfe8d39d6bec3a9
> [06/20] dt-bindings: mfd: Add samsung,s2mpg11-pmic
>         commit: d0cd9ded4bdef73303e65abbeae47b00b7288059
> [07/20] dt-bindings: firmware: google,gs101-acpm-ipc: add S2MPG11 secondary PMIC
>         (no commit info)
> [08/20] mfd: sec: s2mpg10: reorder regulators for better probe performance
>         (no commit info)
> [09/20] mfd: sec: Add support for S2MPG11 PMIC via ACPM
>         commit: 8e6c6e8ef5e241385eff14d4c8b8e45d5e762e84
> [10/20] regulator: add REGULATOR_LINEAR_VRANGE macro
>         (no commit info)
> [11/20] regulator: s2mps11: drop two needless variable initialisations
>         (no commit info)
> [12/20] regulator: s2mps11: use dev_err_probe() where appropriate
>         (no commit info)
> [13/20] regulator: s2mps11: place constants on right side of comparison tests
>         (no commit info)
> [14/20] regulator: s2mps11: update node parsing (allow -supply properties)
>         (no commit info)
> [15/20] regulator: s2mps11: refactor handling of external rail control
>         (no commit info)
> [16/20] regulator: s2mps11: add S2MPG10 regulator
>         (no commit info)
> [17/20] regulator: s2mps11: refactor S2MPG10 ::set_voltage_time() for S2MPG11 reuse
>         (no commit info)
> [18/20] regulator: s2mps11: refactor S2MPG10 regulator macros for S2MPG11 reuse
>         (no commit info)
> [19/20] regulator: s2mps11: add S2MPG11 regulator
>         (no commit info)
> [20/20] regulator: s2mps11: more descriptive gpio consumer name
>         (no commit info)

b4 is having another moment!

I applied patches; 4, 5, 6, 8 and 9 from the v7 set.

-- 
Lee Jones [李琼斯]

