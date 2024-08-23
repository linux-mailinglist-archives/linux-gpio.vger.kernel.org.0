Return-Path: <linux-gpio+bounces-9026-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EF37495C62D
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:08:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB52928271A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 07:08:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A794C1422D3;
	Fri, 23 Aug 2024 07:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b="JjtwRubo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.manjaro.org (mail.manjaro.org [116.203.91.91])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81894140E5F;
	Fri, 23 Aug 2024 07:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.91.91
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724396815; cv=none; b=QeaPXFlc0Jr2btB0E89D72nsP/wrDeggBgvL/P/mMCrwSX05JM56STEiVwUmm/RevqmgK+vTrYCyU2UK4OoMJUmS2+VqfRYvBoO0PczmFPFAOuDpSTnsgMqKAFi9IqqkAGTcx7cMaNFPPfkaK57XEpv7vvNEQoLWS90p3ahD4ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724396815; c=relaxed/simple;
	bh=l+jNErGC1Zn9eyfvrAu5rxOhbUYE9BBxG5YNVVs40zY=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=BqpIJTZHuVGjKsSf8V+KIxG2C5cv0mzqSBgUkbscy2m5/uaBjazcxtpJsmuAxLAaVnSet5yH8JpJ7Cfa+hxLhzPMzfPHyv1Jt7AX2r0U/Gt2F+8vLMoOHNQZnQEQj7jvdBp4v4+ly0TX3XbrtelymDikR5Ognq4PDX9ac42BCxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org; spf=pass smtp.mailfrom=manjaro.org; dkim=pass (2048-bit key) header.d=manjaro.org header.i=@manjaro.org header.b=JjtwRubo; arc=none smtp.client-ip=116.203.91.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=manjaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=manjaro.org
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1724396811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uk+gkYUflODc+eRWSAS3LGZzaVkq5JJYSdzC+cnX4hA=;
	b=JjtwRubot6tDXBlSTMcSA13Yb3AlCfGTaiJIQDtXbM13oYuSsgz4vOBehFmnDTZIeFethJ
	RAYwq/JszXK2zQG9HJ6/fq489F/8zs0roc+QaSz/8RwaNZktCD8GkggXXgRgp1Rg4SIPLY
	hRgaTCCCVsMhl/WFG90DvmRk7/HvD7MtBT0iz68CJtIGQPSN/7ncPTOQQqigTgD6fldjht
	e2E66iISKo+yblcr7qXSQLhLe4CGUhxyPasF+Wnn1OuOTaET6M0CMp1gBqTNI+nHvtr/E1
	TLyFlnZucALGjkba5p2opkT9mhWXI3lWTTZs3fF8V8wibVjWL863H9lCA3AOng==
Date: Fri, 23 Aug 2024 09:06:50 +0200
From: Dragan Simic <dsimic@manjaro.org>
To: Ye Zhang <ye.zhang@rock-chips.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, heiko@sntech.de,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 mika.westerberg@linux.intel.com, andriy.shevchenko@linux.intel.com,
 tao.huang@rock-chips.com, finley.xiao@rock-chips.com,
 tim.chen@rock-chips.com, elaine.zhang@rock-chips.com
Subject: Re: [PATCH v2] gpio: rockchip: Update the GPIO driver
In-Reply-To: <20240823034314.62305-1-ye.zhang@rock-chips.com>
References: <20240823034314.62305-1-ye.zhang@rock-chips.com>
Message-ID: <1195a341c0206b08318ca90af0b9cb00@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org

Hello Ye,

On 2024-08-23 05:43, Ye Zhang wrote:
> GPIO driver support acpi and new version, set input direction in
> irq_request_resources, fix division error and debounce config error.
> 
> Changes since v1:
> - Split commits with multiple changes into separate commits.
> - Adjust backportable fix to the forefront.
> - Modify messages of some commits.

It seems that you sent a bunch of separate patches, instead of sending
a patch series.  I believe that wasn't intended or requested, so could
you, please, resend the v2 patches as a series?

> Ye Zhang (11):
>   gpio: rockchip: avoid division by zero
>   gpio: rockchip: release reference to device node
>   gpio: rockchip: resolve overflow issues
>   gpio: rockchip: resolve underflow issue
>   gpio: rockchip: fix debounce calculate
>   gpio: rockchip: Update debounce config function
>   gpio: rockchip: support 'clock-names' from dt nodes
>   gpio: rockchip: support new version gpio
>   gpio: rockchip: Set input direction when request irq
>   gpio: rockchip: support ACPI
>   gpio: rockchip: driver works without pinctrl device
> 
>  drivers/gpio/gpio-rockchip.c | 297 +++++++++++++++++++++--------------
>  1 file changed, 181 insertions(+), 116 deletions(-)

