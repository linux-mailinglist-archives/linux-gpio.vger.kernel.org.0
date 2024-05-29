Return-Path: <linux-gpio+bounces-6797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CE98D2ECB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 09:46:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8F98EB2120C
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 07:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96026167D80;
	Wed, 29 May 2024 07:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="kkSRPxZg";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="MP0C026J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50DC215FCE6;
	Wed, 29 May 2024 07:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716968796; cv=none; b=hey67oTKsssVbW0pp0cQvd+cUUiLYq4JxhuURC5zJSik620D5sPZnY9sz6UndHEpyBF3Hn7ZTCWvxApYuDSWFXe3IzMNO8HR6XMJhKnKzIvaWgCs75UuUKwPD6fugGD3RcBXheNfhCRogc4jHAoGnoFSmLw6SN5AcnYtLU2O3nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716968796; c=relaxed/simple;
	bh=wIX0I6dBNzJ3YcP9RZ5r6rw6vXpVJT0HcPQ8BSXtYpk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jmnpVv2o6DXADqOWM+0fGBNWY1lZJTJooafhhd3zhjVU6bau5jX3Oz7vT6QDPL38alIdW45ln3eawyolpp67zEpgLI59TM/E2BU/T6nAR+w4/Gc549IqmVRMUHuncOttiHUaHwe0/pJDhKPcbkslU5RdrT60pHEYqk9WYLF8QSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=kkSRPxZg; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=MP0C026J reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1716968792; x=1748504792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=12wb6dLYGNieP4dY03eNUQA0kPAmzHw0zvX0b6aijck=;
  b=kkSRPxZgFW+YgMYdYNn85y8ksIjH2Rns59tpbkCRTlNgT9oQvTEh41/o
   aJTV/b8G3aWZOfxeRNl80GLkSIvfnJaXphJOpbVa9qjHRsBc7AlrFkND+
   YHmrY70cia3jAbZXj/Wg/BkWpFr42uxpxjBLoIyoMA0Bi7jCKK4HuxQHT
   WTv0aYUpobArWVtT1QkhamoGt3So8UqTJLLwMFcd0wLEOES4AzXQ9Jivk
   wU7NqXD3DEQUDTcSm5jxAJt64eWDnZXEsIzLZQlvfDrYkZ+CQoTHoq65n
   m6VKWl+hM+NA2F3MiA3f3Vt3JZQ5tMiRL3nxfZ8kEB1veIE+vm5LN74hv
   g==;
X-CSE-ConnectionGUID: 6G5bPbjYTamegbHe0LjysA==
X-CSE-MsgGUID: /xezvZ0jR06T9aAwPC+5PA==
X-IronPort-AV: E=Sophos;i="6.08,197,1712613600"; 
   d="scan'208";a="37119668"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 29 May 2024 09:46:30 +0200
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 975321652F9;
	Wed, 29 May 2024 09:46:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1716968785;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=12wb6dLYGNieP4dY03eNUQA0kPAmzHw0zvX0b6aijck=;
	b=MP0C026Jl0Yj++4/bGAdN5sSvfMn1mwiBF1OlvPktvTdemoE20t6LNQbV/sR3+CcjbqMAD
	z7g9tO1ERu+9UrwCWIJFRaiqrJSLsALzOalheAA/Qelk2x8IMtbAl1TVOQ0nzUuZ5BCziY
	qoo4LKRsEABr3qaTjNCDxpjBYC6TN05+4sdozT9951pG4KEAjwgmiH3gTLbH4XOg/VW2Cb
	Jo/muKPPERF/sMssQYCQ4NPK2pL3ykpO8ph0/VVh5iqb69Afjs8Uul9PQD62cpXT1tVU0q
	/tH6TDv0z7dNSYyhnGWqjtD8hNb6U+Vv1dH5CfEkyAYyayVzQl7dm7oqrtRoQw==
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andrew Lunn <andrew@lunn.ch>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Gregor Herburger <gregor.herburger@tq-group.com>,
	linux@ew.tq-group.com,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Subject: [PATCH 0/8] gpio-tqmx86 fixes
Date: Wed, 29 May 2024 09:45:12 +0200
Message-ID: <cover.1716967982.git.matthias.schiffer@ew.tq-group.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This is the first series of improvements to the tqmx86 GPIO driver,
which fixes some long-standing bugs - in particular, IRQ_TYPE_EDGE_BOTH
can never have worked correctly.

Other patches in the series are code cleanup, which is included as it
makes the actual fixes much nicer. I have included the same Fixes tag in
all commits, as they will need to be cherry-picked together.

A second series with new features (changing GPIO directions, support
more GPIOs on SMARC TQMx86 modules) will be submitted when the fixes
have been reviewed and merged.

Gregor Herburger (1):
  gpio: tqmx86: fix typo in Kconfig label

Matthias Schiffer (7):
  gpio: tqmx86: introduce shadow register for GPIO output value
  gpio: tqmx86: change tqmx86_gpio_write() order of arguments to match
    regmap API
  gpio: tqmx86: introduce _tqmx86_gpio_update_bits() helper
  gpio: tqmx86: add macros for interrupt configuration
  gpio: tqmx86: store IRQ triggers without offsetting index
  gpio: tqmx86: store IRQ trigger type and unmask status separately
  gpio: tqmx86: fix broken IRQ_TYPE_EDGE_BOTH interrupt type

 drivers/gpio/Kconfig       |   2 +-
 drivers/gpio/gpio-tqmx86.c | 151 ++++++++++++++++++++++++++-----------
 2 files changed, 106 insertions(+), 47 deletions(-)

-- 
TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht München, HRB 105018
Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
https://www.tq-group.com/


