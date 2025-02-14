Return-Path: <linux-gpio+bounces-16047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B671A363AA
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 17:53:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 19CA117033F
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 16:53:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EACD1267AEB;
	Fri, 14 Feb 2025 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="juwl65YL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07377266EE6;
	Fri, 14 Feb 2025 16:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739552009; cv=none; b=I16P5F1mta+/eR0GgkXtyAEN7EFYBODSzvqc3ecQYs5Zr7usfBfMjKcpjalSfTSK17Q3BZjHvMnqcz0lf+BhAQK/hiwDxLLkQp4xRGdYKzi9q924qbyqoGhS5JhZNx/MVjmImzuLFRZrTe+A7pe75WKEvOktrZ8FeyvxY9ox37k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739552009; c=relaxed/simple;
	bh=moMb+jshfXbU2y4mJH0LuCX1cDoaPxchlZtsUt/CA68=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=sxJIAH+jGMZFX83PPgjuds6c8kFkWhETSXaiUd44t6Ji9v68X3h+Hzl5OojWHgBl3GFO70ByrasmIyK66uB9aIpUCGhIiPPt4zW06bRx3v2600c3PGIV75obGBWVG9HWSqgHDKt/iABuQBYal4DiEvKXV0qqL873Zifx+QGB4H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=juwl65YL; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Received: from localhost (web.docker-mailserver_default [172.18.0.2])
	by mail.mainlining.org (Postfix) with ESMTPSA id B98D5BB837;
	Fri, 14 Feb 2025 16:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mainlining.org;
	s=psm; t=1739552005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/2XZ4jUv6FVrcAT2QHq9u8omcuMzDuQ9yRKND/RJ4dw=;
	b=juwl65YLBBy36UjklSN0T6hCj81S77f/Q9uhtuPw8fw/+2UwvKAteHGQIEV9gArGN2D/5g
	k+xdKrlYr5hdkYBw2clCaYlrfsngU2qPihayN1VOToMObzjjpm0CSozlapB2RK/ts6fddu
	VEiMdt3ztZcocCfpHXXWKaOjtPCBKc8kd9KzfMWtG3LZFasx3Dv5W7lyjFvjqX8mqkqdAh
	vD8d5ivoV3encz2JkVADoveRGeX6a0GJfwAs1AA35b0GNQ/R6R1Fs5c4SdY0gklugynx/T
	DeUaFCaXNcDgidST2BGiLKVng4QEHX+MZKDKEzu41sOkZ1j7ZiT08AjVDAKOiA==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 14 Feb 2025 17:53:25 +0100
From: barnabas.czeman@mainlining.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, Lee Jones
 <lee@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy
 <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev, Dang Huynh
 <danct12@riseup.net>
Subject: Re: [PATCH 04/10] pinctrl: qcom: msm8917: Add MSM8937 wsa_reset pin
In-Reply-To: <CACRpkdbG-cS59TbB36=OrZ0MfXPdDPSpPEA8U_L_iMOgNZK70w@mail.gmail.com>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-4-7d27ed67f708@mainlining.org>
 <CACRpkdbG-cS59TbB36=OrZ0MfXPdDPSpPEA8U_L_iMOgNZK70w@mail.gmail.com>
Message-ID: <cfb463ca799f0c15dc2bddba23ed1a1b@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit

On 2025-02-14 11:20, Linus Walleij wrote:
> On Tue, Feb 11, 2025 at 11:38 PM Barnabás Czémán
> <barnabas.czeman@mainlining.org> wrote:
> 
>> From: Dang Huynh <danct12@riseup.net>
>> 
>> It looks like both 8917 and 8937 are the same except for one pin
>> "wsa_reset".
>> 
>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> 
> Is this something I can just apply to the pinctrl tree?
I think you can.
> 
> Yours,
> Linus Walleij

