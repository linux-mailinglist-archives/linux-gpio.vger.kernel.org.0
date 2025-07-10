Return-Path: <linux-gpio+bounces-23064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDD4AFFD6D
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:03:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B1AD13A67D9
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 765D029345A;
	Thu, 10 Jul 2025 08:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WY9uea4B"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F6328C86D;
	Thu, 10 Jul 2025 08:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752137936; cv=none; b=tdvutXYphvybbYvs95uKuiGtRXfbECqUxfp3a8nuvnxWN08mh27auNopFS6cWFNeAjy4ZmO+J9xI1dlEEKacyUL1qfS/p6daaAfqKNfPpE2bhXosmTB84E+GcSi3RRC97ekr7MVwYIHQFvn/Q3L+EVOkfQX46cDhAKrpSf/MfyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752137936; c=relaxed/simple;
	bh=UXD9GeP4baw6LpE0sxH7fdcWy6NpmrP6SBauhZSFCwI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jk2phoPhnXKv2hKiZ01Js8lQaV7InTyu2Ph1IEJKTfOaQzCfwOSnqqmbDuSAmnpB/CB4MH7iE4b3xvjfReX0o+hNEERNaW9mHLbJq3YiJpgNDSeSVO6fDfLjJtFWnQ6HVchjXEES8d6PFiBI2VLevstg1GDkZ3+juWMFxyNUKAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WY9uea4B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB4EC4CEE3;
	Thu, 10 Jul 2025 08:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752137935;
	bh=UXD9GeP4baw6LpE0sxH7fdcWy6NpmrP6SBauhZSFCwI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=WY9uea4BBapdijQgutJGxA0KKLQUMSMX8ZusOd4aFjmIMprA/Y6jRnG3vWD4XzMue
	 t0w6+/mITal5omfRZ2uyr3ijjY+5RcnR+Bh/2Ei8sXLHppyre9QZ4Be+EJQGuOuv9x
	 gQoc+nz5ojAq3aXVi0ZsArCQd9PP2eVrvNqMb6NiPzxnWdjPPLK4X2+42B5OjWnJcN
	 fB7vv+2fB3JLYqtwn2wNIb07hjL1eF14kDvMJ1ztxb+iW4CCNeqmaPzTf6kTZQ7Ije
	 /+IBfTUvenBC8MZGa3mtMknlp5ED4tr9oY8fPCGiyeBDZHNFbsorb0FcEesbn/fPSa
	 Lq2U4m0Zk8tfA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Panis <jpanis@baylibre.com>, Michael Walle <mwalle@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20250613114518.1772109-1-mwalle@kernel.org>
References: <20250613114518.1772109-1-mwalle@kernel.org>
Subject: Re: (subset) [PATCH v2 0/7] mfd: tps6594: Add TI TPS652G1 support
Message-Id: <175213793326.1429296.9106240987537536987.b4-ty@kernel.org>
Date: Thu, 10 Jul 2025 09:58:53 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-c81fc

On Fri, 13 Jun 2025 13:45:11 +0200, Michael Walle wrote:
> Add support for the TI TPS652G1 PMIC which is a stripped down
> version of the TPS65224. Support for the latter has already been
> merged. Refactor the regulator driver to ease adding new devices.
> After doing that adding the TPS652G1 variant is really straight
> forward. Some care has to be taken by the interrupt handling (of the
> regulator part) because there interrupts are used for voltage
> monitoring which this variant doesn't have.
> 
> [...]

Applied, thanks!

[1/7] mfd: tps6594: Add TI TPS652G1 support
      commit: 626bb0a45584d544d84eab909795ccb355062bcc
[2/7] misc: tps6594-pfsm: Add TI TPS652G1 PMIC PFSM
      commit: 9cba6a7ebf65c603b80c0b3c7fa8c7c03f1b704c
[3/7] pinctrl: pinctrl-tps6594: Add TPS652G1 PMIC pinctrl and GPIO
      commit: f6420de1c810e282c34de65c70e6cc6177c12394

--
Lee Jones [李琼斯]


