Return-Path: <linux-gpio+bounces-6140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 919588BD045
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 16:28:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C27861C21C39
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 14:28:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E99913D26C;
	Mon,  6 May 2024 14:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="RUMGXUk0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054491DA22;
	Mon,  6 May 2024 14:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715005718; cv=none; b=R0Beij7FedJI0B5YWQmgofNB5Zw6FdRDlWHC4eZQith17LBGa6BzkXOSOYJXnbR0glkF/KQPDCz9taIfejzIsEFxmaUoxDtqQwPv6YYj/psyfyIHDVQCIKwYVOd9nd08bGGCs4taBPd4WLZL911gXZtFC7UvDp9orN8OhTRCxQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715005718; c=relaxed/simple;
	bh=PA/Ob+PeIgYK/56bxpi/YcTUZp23Z72IIc5Igx2Qlbo=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=sbP9Ca3XzM9hj2qPnAndxCh7mQJVcy5G7He0NRJD0sezc+KxaJqob9uKC5p14rNghaN+FSw0JBaumPHzq9102UomuyU6/S4gc1kwtKQFpxtG+zrtyVQmqi6ZyBr9Tp2Zv4yhcTwzW4r5ul3/PosuXylaaGvxo+Y2lP0e0vl87V8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=RUMGXUk0; arc=none smtp.client-ip=217.70.183.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id EE491C0002;
	Mon,  6 May 2024 14:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1715005714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PA/Ob+PeIgYK/56bxpi/YcTUZp23Z72IIc5Igx2Qlbo=;
	b=RUMGXUk0pS94Utzp1N2KuwhLsZ0ZbwE2XlVxI1tzziUKXDvWMQJZMit0t7nI8/a+jeKiRY
	qFXZFPpCfO1VnmRAmf4C7r7YUpbxphJt2VccRFgYl8vHa7yuIEiH5YHHotZLL3YGBfMWj7
	GbX1eSoSbxMiOzzJ6V+DFmBgG9QGNStZRACk5Obx7rBOYeQytSwVcJpfIdpPZvqm60KuyK
	9U1/TAj2Pzcye1b1xDzVluHuW07gH/UziqcX4sBzOs8Iu1bePzsWWT0iANBEFuvDnzS53J
	hRvWhS/ZM06Zci6RIx3KNM+DZiq6pWy9Nyjf+hh7oQ4taSwVYnJPyBYYFrHqzw==
Message-ID: <c384a754-f1a6-4666-b07e-8a38f57ca43d@bootlin.com>
Date: Mon, 6 May 2024 16:28:32 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: emil.renner.berthing@canonical.com
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, dfustini@baylibre.com,
 guoren@kernel.org, jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org,
 wefu@redhat.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
References: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
Subject: Re: [PATCH v2 0/8] Add T-Head TH1520 SoC pin control
Content-Language: en-US
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
In-Reply-To: <20240103132852.298964-1-emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-GND-Sasl: thomas.bonnefille@bootlin.com

Hello,

Thanks for this series, it works with the I2C and the PWM.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>

Thomas

