Return-Path: <linux-gpio+bounces-16248-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16366A3CBAD
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 22:42:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61B2B7A5146
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 21:41:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5A22580CE;
	Wed, 19 Feb 2025 21:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z4JYosSZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35FA256C98;
	Wed, 19 Feb 2025 21:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740001321; cv=none; b=TepCmA53TeZztGm986VMncYQVc0x0kguUKZSM6YFO02l8HoYbXku3RznoWH4NBGEyR/IASuQrRwqJeVeXQXm8chl0nD2nqR8TfPrnplapVTybVtWip1ElNdnS0qFSvB3R274WIOSP1q9t4PkzFpM7tOLGV41NLRqZXiZRKjwsG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740001321; c=relaxed/simple;
	bh=MaNSLEh2lxgU6f14YdTbvhpQpN1QDoQniPT9z9CW54E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBCzsCcDH8gcerBXehP1l5lC9vJQdm0OlA8Fv14Fsw69UGtIOmE2CMQdC+EMyw9euWSI94E3XtD17YZYy17EGv0N9rGEJ05Pg92WghyPbHcb3JMjrXb/aA45VfXbRk88s0SbYKPKRzPzVEhoMVf+Vanj36juv29Bsp+ZEtmE2vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z4JYosSZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05E82C4CED1;
	Wed, 19 Feb 2025 21:42:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740001321;
	bh=MaNSLEh2lxgU6f14YdTbvhpQpN1QDoQniPT9z9CW54E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z4JYosSZl2iv95aFKCoDpHX2qIof0HN5UG74BJxqR32jQSI/1ka1o5YajAAeXAi/v
	 MFmIGEAEJXwi+uh70T0/iJoF+B758rwBESxablb2cMqv/4JZJQ8qBnh4E4mrSXVI/o
	 BGpfi8YMDS+dYbaaoQNHmQN7y30sOXoUd1zP2mlDLHHZrRuZjurI6ljZe/ayElw5x4
	 YOx1OHSbairIEopQQh256xMjnyq7EVA/1H2VAMt+0rPLe15hVfydeadhfCNlPCGpvd
	 n7E1AmC/FFf32MPq3HmrpxtqS790hnWBOIhsRW0Jcn17kglYXbmenU8g16Zae8lBnm
	 /As5ZJBV2GX/g==
Date: Wed, 19 Feb 2025 15:42:00 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v5 1/5] dt-bindings: pinctrl: Add support for Amlogic A4
 SoC
Message-ID: <174000131935.3003574.5536314067516042941.robh@kernel.org>
References: <20250212-amlogic-pinctrl-v5-0-282bc2516804@amlogic.com>
 <20250212-amlogic-pinctrl-v5-1-282bc2516804@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212-amlogic-pinctrl-v5-1-282bc2516804@amlogic.com>


On Wed, 12 Feb 2025 13:20:50 +0800, Xianwei Zhao wrote:
> Add the dt-bindings for Amlogic pin controller, and add a new
> dt-binding header file which document the GPIO bank names of
> Amlogic A4 SoC.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       | 126 +++++++++++++++++++++
>  include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  46 ++++++++
>  2 files changed, 172 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


