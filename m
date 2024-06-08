Return-Path: <linux-gpio+bounces-7279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6BD9011F7
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 16:21:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A06FB1C211B7
	for <lists+linux-gpio@lfdr.de>; Sat,  8 Jun 2024 14:21:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB4A517A918;
	Sat,  8 Jun 2024 14:21:43 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A4727457;
	Sat,  8 Jun 2024 14:21:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717856503; cv=none; b=EPagVA0QWPpaEr8DMM1gE4gvLxSqbPtcByBp9MIVed9Bb//mQda/PY+bv/FSe+SvEXBqvjY49KHk9EpWzzpzkGvupbpar5L++2L8TIO6Iy8ugu+Ae0uhm1SA7OystiVbN9olTXvziYnjYRa65BOw/QXjl2MT6t4h/m1r3JiBDtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717856503; c=relaxed/simple;
	bh=iZSKJDaJFLUvIeC837DEOvVIK6S3LqY9xtniXpfWtTY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ek8Qi3uuffj0M/hRCu9Ha7zvTFgu4jmEiaI+hxyGY49tOrgeug2HFv9lbsZmeCAownZ77V4c8xNeo0c8rdCIMYf6fvq8kwVAbrPyd/W8Dq2f5QcJVx/7YBcDkfRO9/KI7iS9FU9DB4NAzS4SysKJ5X7kWWEeaHYCgLFEQ0IgqZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sFwwq-0008KC-S9; Sat, 08 Jun 2024 16:21:36 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Huang-Huang Bao <i@eh5.me>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang-Huang Bao <i@eh5.me>
Subject:
 Re: [PATCH v2 2/4] pinctrl: rockchip: fix pinmux bits for RK3328 GPIO3-B pins
Date: Sat, 08 Jun 2024 16:21:36 +0200
Message-ID: <5752848.aeNJFYEL58@phil>
In-Reply-To: <20240606125755.53778-3-i@eh5.me>
References:
 <20240606125755.53778-1-i@eh5.me> <20240606125755.53778-3-i@eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 6. Juni 2024, 14:57:53 CEST schrieb Huang-Huang Bao:
> The pinmux bits for GPIO3-B1 to GPIO3-B6 pins are not explicitly
> specified in RK3328 TRM, however we can get hint from pad name and its
> correspinding IOMUX setting for pins in interface descriptions. The
> correspinding IOMIX settings for these pins can be found in the same
> row next to occurrences of following pad names in RK3328 TRM.
> 
> GPIO3-B1:  IO_TSPd5m0_CIFdata5m0_GPIO3B1vccio6
> GPIO3-B2: IO_TSPd6m0_CIFdata6m0_GPIO3B2vccio6
> GPIO3-B3: IO_TSPd7m0_CIFdata7m0_GPIO3B3vccio6
> GPIO3-B4: IO_CARDclkm0_GPIO3B4vccio6
> GPIO3-B5: IO_CARDrstm0_GPIO3B5vccio6
> GPIO3-B6: IO_CARDdetm0_GPIO3B6vccio6
> 
> Add pinmux data to rk3328_mux_recalced_data as mux register offset for
> these pins does not follow rockchip convention.
> 
> Signed-off-by: Huang-Huang Bao <i@eh5.me>

with my question about sourcing those information resolved.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



