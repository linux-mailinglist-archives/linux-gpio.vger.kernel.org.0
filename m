Return-Path: <linux-gpio+bounces-28553-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 089D7C61F3F
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 01:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 71C6034AF26
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Nov 2025 00:32:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE4C0155CB3;
	Mon, 17 Nov 2025 00:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KsDrXaRQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8B747F;
	Mon, 17 Nov 2025 00:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763339571; cv=none; b=bzYwjZk94rj/INpO8/wFFtsCedAfCSsk32WrFOZcZg2AKyIQaQ+GsiuPIcjh63gZePyOamE8jLHemVWI2oxQzL5JV1LWc/ZJqODytSgVXTP0J+rHNq9zOyaadq6BHIg9eQ4Sp8Ew+eFE+nAvdY7efIWccfbhHnWeZrRPeOKEFoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763339571; c=relaxed/simple;
	bh=mcw3q7py36qJMwmRJbaSYjktGB/viMFJfxJL+bu1DVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QB+rvAwo1y13qceUWosw8fQEJyKifb0uVmBc6z2oDkJrYX9OStoOZ5cbkOqjfJ1VC0b2rKZHglpcOBhWjoRYrSccENQelxKezCkg5KP0AbHNVATAMl2IPz6s8Md+rJaMP2KBDD0wO3MtoDktiQ0MLD5RBcdmMUv2s14ZMrl6H1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KsDrXaRQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33CBAC19421;
	Mon, 17 Nov 2025 00:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763339571;
	bh=mcw3q7py36qJMwmRJbaSYjktGB/viMFJfxJL+bu1DVw=;
	h=From:To:Cc:Subject:Date:From;
	b=KsDrXaRQz4g4ZIABfT59KRrhwW+AVr266KfMOducA8NiSrJGJH8TilnBgAJuiew9y
	 5vgCa66BjbDupsNNSeDd+vs72wMsI2r2mJwmeATgu3Rb90YLWvg8SVOhEpOJQedA1a
	 e4RGMoHE9j65Pksbwy61pbnVzZDB/LSxHvYe+iQOXCIeFZ/JX29ao2FqPiV0hq+sEP
	 S9rwTMIPmOa46WRSpDxUKHcdTTnt7bVhI+kvVUjMsgpeQTrr7Xbu7q7QuAQiCr2mLz
	 X7nvUF7V2fLSD8ikD5DJFwi3LQ2BejhNfUu8eUjO5dEnr6bgnXkBvxd4YxOwjRVVKp
	 5wnb1YWorxNvw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] gpio: fxl6408: add optional reset and suspend/resume
Date: Mon, 17 Nov 2025 08:15:00 +0800
Message-ID: <20251117001502.12618-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Two improvements to the fxl6408 gpio driver:
Add opitonal reset gpio control.
Add suspend/resume support.

since v1:
  -fix W=1 build error on nios2 platform

Jisheng Zhang (2):
  gpio: fxl6408: Add optional reset gpio control
  gpio: fxl6408: Add suspend/resume support

 drivers/gpio/gpio-fxl6408.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

-- 
2.51.0


