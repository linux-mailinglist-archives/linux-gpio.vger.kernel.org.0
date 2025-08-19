Return-Path: <linux-gpio+bounces-24575-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C43B2CD45
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 21:49:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CA843AD57D
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 19:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA21341AA9;
	Tue, 19 Aug 2025 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bx6/fDim"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3F9425A34F;
	Tue, 19 Aug 2025 19:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755632823; cv=none; b=ecVi+S1h12pMzXmME0Pt6gEIKciGV9bVqPQYf7piWzt2Y2cM1WAMW6ft40agD2R2PihVCyqYaouv4Ob7jceMjLg0nuHj/Bmd2I1Xc9dGkEVjx2zNLz6ujKpQ1aGK0Tz5V1q+1DRfH1WlWAR39wu/HiVYa5nO3sUbEG3HtM+GwJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755632823; c=relaxed/simple;
	bh=TywL28JiMgpNsfLpXar8mcRLMEOquL5t8uql2vHQ0y0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=YKTXAXMswSuqu8xi5wI1XGACtbdZI+vJYKf58T2l/ZHB4atzRXLFfVyJnhVrQdutp/gk+eLY8EO5v3m8bZRAVAKbDq0RWTUQFwiGezIniqmfdJh7S+CHMtzDWxsGxqs06ecA+DtDHK6sPAQ50tjm+CHSPo6TjGx3CjAWRPSYDxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bx6/fDim; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09FEC116B1;
	Tue, 19 Aug 2025 19:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755632823;
	bh=TywL28JiMgpNsfLpXar8mcRLMEOquL5t8uql2vHQ0y0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Bx6/fDimuY0XA68apldTZvnU1FmSbGVjaJ4J0vVh5Q7g31QQlP/duOlYusajHJiPC
	 hJ1GbmpdWOJtEGZ/+5kDU45FQH73sTCslMMG8ZTve60E1eMCoSvdUUkMOxMTGdg1Oy
	 xObie6v0GyFd9s5USrsT3CGY/+VOFsEpglm9TEohlANU/5/44MMI8T2TNevtR+hwsU
	 hi5tYA2jN6olRHnnEY5cV1GqhhYWf6eqGm/1mU75lzXflon/2+fQ0W0BjRrLirPVLf
	 gALPoEEB4/oCvwk7EEkeORvUAaArg9rxOZJuXP8nZgAmZnNp22MMv7h0Nb2tkCmjz0
	 a2Gsan/FKDBYw==
From: Mark Brown <broonie@kernel.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, kernel@oss.qualcomm.com
In-Reply-To: <20250815172353.2430981-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250815172353.2430981-1-mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/2] Handle shared reset GPIO for WSA883x speakers
Message-Id: <175563281972.270039.2781752507684682140.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 20:46:59 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-cff91

On Fri, 15 Aug 2025 22:53:51 +0530, Mohammad Rafi Shaik wrote:
> On some Qualcomm platforms such as QCS6490-RB3Gen2, the multiple
> WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
> To handle such cases, use the reset controller framework along with the
> "reset-gpio" driver.
> 
> Tested on:
> 	- QCS6490-RB3Gen2
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next

Thanks!

[1/2] ASoC: dt-bindings: qcom,wsa8830: Add reset-gpios for shared line
      commit: 126750523eac0ea79df672d9771eb483f7497b16
[2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO for WSA883x speakers
      commit: cf65182247761f7993737b710afe8c781699356b

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


