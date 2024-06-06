Return-Path: <linux-gpio+bounces-7230-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E32908FE346
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 11:44:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F0B7E1C253A1
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Jun 2024 09:44:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E0FF815350B;
	Thu,  6 Jun 2024 09:44:09 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0E6813FD84;
	Thu,  6 Jun 2024 09:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717667049; cv=none; b=LMBg14HsULFIfT8OHOv127dKLWZgXji9d2pb5M/kWytU4WaCQAhDa9dLYY0hqbvbCFapGYKzUeteUd+Kmp/jHDrBasjQt/dIFilv4hvVq+xrPw/rKi5Oq5AC7W8kqbnwzF4nardt6LwRBVlqx5EYGKU8azxohL0Xpdo+kJvDBPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717667049; c=relaxed/simple;
	bh=CtDHgy8/C1mkmyal4k+zP9if7nW+yXD+0RMPknPCh9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LNbU2ZGkRxQz5+iSbAwnF1pgkh3RFZpaz24z2V5vDYvWC9nHn3kiVwBG/ZTfF1GaUg0kO0EDPGC7voGegIlw/3P1ZTJfzPN+cnsXFzN/mvF1b4/mi1C4D/kC2YEyqRZSTzIZIeir+wPsaoExOyZd8A0GkiLKvgOxm5qVZef/7qY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Received: from i53875b65.versanet.de ([83.135.91.101] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1sF9f3-0007cl-JH; Thu, 06 Jun 2024 11:43:57 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Linus Walleij <linus.walleij@linaro.org>, Huang-Huang Bao <i@eh5.me>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Huang-Huang Bao <i@eh5.me>
Subject:
 Re: [PATCH 2/3] pinctrl: rockchip: use dedicated pinctrl type for RK3328
Date: Thu, 06 Jun 2024 11:43:56 +0200
Message-ID: <2182307.KiezcSG77Q@diego>
In-Reply-To: <20240606060435.765716-3-i@mail.eh5.me>
References:
 <20240606060435.765716-1-i@eh5.me> <20240606060435.765716-3-i@mail.eh5.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 6. Juni 2024, 08:04:34 CEST schrieb Huang-Huang Bao:
> rk3328_pin_ctrl uses type of RK3288 which has a hack in
> rockchip_pinctrl_suspend and rockchip_pinctrl_resume to restore GPIO6-C6
> at assume, the hack is not applicable to RK3328 as GPIO6 is not even
> exist in it. So use a dedicated pinctrl type to skip this hack.
> 
> Signed-off-by: Huang-Huang Bao <i@eh5.me>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>



