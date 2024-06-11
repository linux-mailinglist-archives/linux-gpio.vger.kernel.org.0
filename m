Return-Path: <linux-gpio+bounces-7364-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D954903FB9
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 17:07:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01E311F25B7F
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Jun 2024 15:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49DFD38390;
	Tue, 11 Jun 2024 15:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b="a4arpJEG"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.eh5.me (mail.eh5.me [45.76.111.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D97E38385;
	Tue, 11 Jun 2024 15:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.76.111.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718118362; cv=none; b=AiEYTsP2U8G1L/DPe03hGjuYW1VItq+ju5NopBUdrY4IQoszYsyYUFHLOFHNhTlNuMY+cmAkmlineLhJm4IHugDOOkW1JnZ7u3CP6mQ9vD1k0sRAqBLxatzvFtrZb4tv07/EL0XV2k/t6NuMScrI6DHJ0gDFrqRqHq5MTMwO/Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718118362; c=relaxed/simple;
	bh=wAw9e/wozQOw8i+ERsap3osfC9F9UUvcpRornS+m3eY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rBn+a2RKBBirNqLZaMs/IRSB+qXmP2Jfn7VsL/ql+ej45p+cSqviiLIqHdCCH0Xes1B5uZxeD3a4D36uNv8f6x1RoeyHoZU9nxJST3p3AsXfVM0jwBDJaNYy1dWDBChQtxkdJ54UdUGMUS7iV1DUhKHUsIVY7im+/IN9wsiG/Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eh5.me; spf=pass smtp.mailfrom=eh5.me; dkim=pass (1024-bit key) header.d=eh5.me header.i=@eh5.me header.b=a4arpJEG; arc=none smtp.client-ip=45.76.111.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=eh5.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eh5.me
Message-ID: <5a194e14-f578-4a6c-998c-e025d3a65486@eh5.me>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=eh5.me; s=dkim;
	t=1718118351;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WXk1g2VHkQi76mFdTqCSmMpVfZZE8Ut2KmIPAo1Mpgo=;
	b=a4arpJEG/60zpKH0zF6lPjtaHbUHMEQhhK/KRX82XXPJ1ie5uqn4GM3Bkd1JfNrTZzrhNs
	dExHMqKhm6qa3mgOPyNSXajF4lpl4DZmyF9B1VQfrdRBP6Ttuc+QGxzm3EmlqasUOP66fC
	m45FaYmD82jYZgsTdDGQCv2ppQVGO6E=
Date: Tue, 11 Jun 2024 23:05:43 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v2 2/4] pinctrl: rockchip: fix pinmux bits for RK3328
 GPIO3-B pins
To: Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20240606125755.53778-1-i@eh5.me>
 <20240606125755.53778-3-i@eh5.me>
Content-Language: en-US
From: Huang-Huang Bao <i@eh5.me>
In-Reply-To: <20240606125755.53778-3-i@eh5.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/6/24 20:57, Huang-Huang Bao wrote:
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

This is also

Fixes: 3818e4a7678e ("pinctrl: rockchip: Add rk3328 pinctrl support")

