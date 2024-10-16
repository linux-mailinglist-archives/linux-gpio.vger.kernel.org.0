Return-Path: <linux-gpio+bounces-11447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D1219A0D03
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 16:42:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E00A5B28755
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2024 14:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 928CF20E014;
	Wed, 16 Oct 2024 14:41:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b="JPu0z5jO"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-03.smtp.spacemail.com (out-03.smtp.spacemail.com [63.250.43.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE01120C015;
	Wed, 16 Oct 2024 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=63.250.43.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729089714; cv=none; b=j42a+bV0w3fzuZHlB75GCDyaKksoALuuKmKqjZsd4kWO+Yf1uTcbmfXpFFJj82LASrSNpzzgcAKqIxzSslTPpcSxxwScZmfp+u2VafRZWgJYNO4QxjBM3KQrCae6L0HdLwrcJKYTZAAHrJuNrhFnDtuICxNPVINDYuuWptJ88LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729089714; c=relaxed/simple;
	bh=5pqAUeM+sCAUVEmtTmEbLzJQvE1ZOR58MpVxFnbuY4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dDydktcIvOeoYz8o6WwHq4hKffxgFVQiQCujcU/k6VZO64FLEL8SrkTqcEvYfuuwM1fKSMwh9hCpQ2aQj2WDYwZKkNXUzey3uYbRkvNGKhLbSdSnWmz4aqZ2KfsSotsfroukPIgeLTMdPSIm1fWDhaadd/AYXx3jnJvpj0BpTk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org; spf=pass smtp.mailfrom=mentallysanemainliners.org; dkim=pass (2048-bit key) header.d=mentallysanemainliners.org header.i=@mentallysanemainliners.org header.b=JPu0z5jO; arc=none smtp.client-ip=63.250.43.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mentallysanemainliners.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mentallysanemainliners.org
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4XTDF50qn7zGpSN;
	Wed, 16 Oct 2024 14:41:45 +0000 (UTC)
Received: from igor-systemproductname.lan (83.8.245.91.ipv4.supernova.orange.pl [83.8.245.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4XTDDx2QSDz2x99;
	Wed, 16 Oct 2024 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1729089699;
	bh=5pqAUeM+sCAUVEmtTmEbLzJQvE1ZOR58MpVxFnbuY4I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JPu0z5jOyc/Ys3kRKdHWOR+JUgtpBOWjHE6M+6/FXoWoXxR+HTnRaNBMUOnjlr32o
	 r6vmMO2U7ckI8nObdiX5oYsg/gtVxs5BYULyfjK/UQptkwiF/JH0OsdL81wC/bqCpI
	 o++eeonoymx5eJs6hnhOALhcRL3bIGZQhGZWb0ZW1bCJjgs4csUyjK+gYFNnLXOrBc
	 6jQ2D3cdjsFpFnZczI8gLw5S7c0ZqqeavELfMGSkjTUF7ChpVH3D1dJVJPs9Ls1YwR
	 FFkkH26RQc7Vq3PkBMxPJdpsvLhEpeimifWdhzi8jaqKk89EoBblJHVFoH/vi6VRy1
	 DLdq7m2cyPRMA==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
To: krzk@kernel.org
Cc: alim.akhtar@samsung.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linus.walleij@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	robh@kernel.org,
	s.nawrocki@samsung.com,
	tomasz.figa@gmail.com
Subject: Re: Re: [PATCH v2 0/5] Add Exynos990 pinctrl and chipid drivers
Date: Wed, 16 Oct 2024 16:41:12 +0200
Message-ID: <20241016144112.17588-1-igor.belwon@mentallysanemainliners.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <795657e1-5232-494c-9ac5-a62455b0f6f9@kernel.org>
References: <795657e1-5232-494c-9ac5-a62455b0f6f9@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 16 Oct 2024 09:19:58 +0200, Krzysztof Kozlowski wrote:
> On 16/10/2024 09:06, Krzysztof Kozlowski wrote:
>> On Tue, Oct 15, 2024 at 11:04:45PM +0200, Igor Belwon wrote:
>>> Hi folks,
>>>
>>> This series adds support for the drivers for the Exynos 990 SoC. It
>>> consists of the pinctrl driver and the chipid driver. The product ID
>>> of this chip for chipid is 0xe9830000. The pinctrl bank types are the
>>> same as in the Exynos 850 chip.
>>>
>>> Changes in v2:
>>>  - Moved bindings from SoC bringup commit
>>>  - Moved device tree changes from SoC bringup commit
>>>  - Ordered pinctrl nodes by unit address in SoC DT
>>>  - Moved the exynos990-wakeup-eint binding to the correct if.
>> 
> Moved? That's not what I asked for. Are you sure you have this warning
> free? That's a requirement for Samsung (see maintainer profile).
>
> Ah, I see now what you did - you removed the interrupt. That's
> surprising. I don't understand why.

Hi Krzysztof,

Thank you for the review.
The interrupt was actually my oversight. This SoCs pin controller does
not mux interrupts (much like E850 and Tensor). It's still compatible
with the Exynos7 model as a fallback though.

Best regards,
Igor

