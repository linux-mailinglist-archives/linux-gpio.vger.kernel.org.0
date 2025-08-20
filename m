Return-Path: <linux-gpio+bounces-24613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B3504B2DBED
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 14:01:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6EFA6723556
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 12:01:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A4A0183CC3;
	Wed, 20 Aug 2025 12:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pNND3jzz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43FD9A945;
	Wed, 20 Aug 2025 12:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755691278; cv=none; b=rF5STc1RLWLQ12zBg7miac1Hvg0pQjrXR/X+ng/Gkqy+AojbxWwaCoZoq7NAVXRExeYHU1i1VAc0TMn/8Sa1HJt+GT2b7oKm+B22ZH2d3LK7xI4uuDMnRXIA+PbXzjYhDK/PrGSpaLaMNszDQuKbAPC1LjDc7BuE/LLw+sjLTKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755691278; c=relaxed/simple;
	bh=rlHdLNhaV4hbV/T+d/Q/8F+as9rxAdsAsMzgSCD2LTk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oIRapkeERe3ISBITN+fEI9IedWrx9nQJy0D4hT1/2JHW/81h7PO1lkmVkuH8JCyXNSulS6AjW3E+gc0beA7ndYaBP1lOw4rpdey7xk4X9lJLZojEgp4os75YQGUP0lBOZXx+zIAKqMDW+hkNbADyuXGGDLXqdY10RpW12vj8Yb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pNND3jzz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4414EC4CEEB;
	Wed, 20 Aug 2025 12:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755691277;
	bh=rlHdLNhaV4hbV/T+d/Q/8F+as9rxAdsAsMzgSCD2LTk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pNND3jzzHf0fboXkkioRDMhiKmMqX1c0T6aGiiPxXLaKouUvCLd7rlLlG2glv2X60
	 djw1rTRavrCo+XjQyM3KXaFrp4oWtUu9KCCHKWPV9Pbx+s99xK26cMkVKskoUyJr9P
	 zQNTUhQBylIavtPPeLxMCkpHtCZLBhRLAjdeqnTS7D8Gyec2eeab911U2FpNUEjZ8F
	 bQjD974Eo3Rb+xLlGEdwYmu6MAuwa8zL/3/4BY+R0sFmLs6V6pg47dAqmi+fdFQvKU
	 PKiWTHp2hiyn2J3de2NND+qm1te7fQ2WhfRp4WuBdp3X2QwQHqzU1IbNO5q6Ch2cH/
	 3JMbn+yKOgkkA==
From: William Breathitt Gray <wbg@kernel.org>
To: Marcos Del Sol Vives <marcos@orca.pet>
Cc: William Breathitt Gray <wbg@kernel.org>,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] gpio: vortex: add new GPIO device driver
Date: Wed, 20 Aug 2025 21:00:48 +0900
Message-ID: <20250820120101.254206-1-wbg@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <aHD40TD8MLug0C6b@black.fi.intel.com>
References: 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=598; i=wbg@kernel.org; h=from:subject; bh=rlHdLNhaV4hbV/T+d/Q/8F+as9rxAdsAsMzgSCD2LTk=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDBlLd1wtvqR+Pzwyey1/srp5mIrIjFT9dnnL5PUflNZt5 Yk49Juho5SFQYyLQVZMkaXX/OzdB5dUNX68mL8NZg4rE8gQBi5OAZhIsT3DX7kyhYi2HXVp0749 kqzU72qo1Pl5woLR/twZbbeFHsk7FjL8M5B/WrvxyuVv15JzOHqED9RP8q1sEAmxTur2v+CwJp2 dAwA=
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
Content-Transfer-Encoding: 8bit

On Fri, Jul 11, 2025 at 02:43:13PM +0300, Andy Shevchenko wrote:
> +Cc: William,
> who is an expert in embedded industrial x86 platforms and might help with this.

Hi Marcos,

Just a heads-up that this is on my radar and I do have some general
comments about ISA drivers (in particular, this reminds me of the
gpio-ws16c48 driver which you may use as a rough guide). I'm currently
catching up on a backlog of emails so I should have a response for you
some time this weekend; but if you already have a v3 feel free to submit
it and I'll reply to that instead.

William Breathitt Gray

