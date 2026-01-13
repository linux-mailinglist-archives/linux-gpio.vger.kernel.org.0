Return-Path: <linux-gpio+bounces-30485-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 01706D18786
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 12:26:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5992030880A5
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Jan 2026 11:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21F4A38BDA4;
	Tue, 13 Jan 2026 11:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DgGZ20Jm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23DC350A1E;
	Tue, 13 Jan 2026 11:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768303371; cv=none; b=j8BtUc5uHrUrucQhq5ksCAppKD9WiNgbVn7eeVs9D6L33YDOPGDxpdGkP/M7L55mtsmoG8GVAWmTYI8/mwDFly9k6KyObWAg1IxCnGNRyaAsZfQrE9IubHA/aMI6sTznF4Hg2z05CQj4LaVT1zHS8UNOetyp+DCXOdCW7Je7Weo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768303371; c=relaxed/simple;
	bh=oc6rbIhLu0947i6MU1E3FFCo0BLhniry+Tepq+2kJZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HODvJrQSCju5mxOxChSwQRGbeAkpemcOjokShXT9RQlzjTDO5u5yB7zdwEjaY03C9038udVLXF7dEY1Azd94zIsYDvasTgrAlD6JnCJ6bNBDRskBP8ZqiPl7edGoENrQn29pkliafqkBytZNhcigTtt8fpyWsRZtfUBZP0oKH1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DgGZ20Jm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C99C19425;
	Tue, 13 Jan 2026 11:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768303371;
	bh=oc6rbIhLu0947i6MU1E3FFCo0BLhniry+Tepq+2kJZc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DgGZ20JmLTJ8/zk/Kw8qsc1eANt3U8MbMDMef/Blvm0FEDIXdL32FN134RIv0gdFE
	 cUOuhH4mZIbPaADniOY8Mg7APmE/sP3OXhsc1E33caaYLCdcubNuQWiMqc5c6nKMMC
	 vx1Ii8ZaJz2L69dcybQPNcQ2lexf4EA7aWzUZ/c+5Q5loJklwH1vRuoUjXur0P1j5p
	 7isIIp3u08K3cLosjcoeOThnLD1N0aCejeZthW0mXMsZ12VviitChatBFKXOeYlCbN
	 zKWJHzDr4vIfbBwsPe6VU4uR8Ar5M94MBRrPLxlQdQVwuI+cYfJW89V53fq1CXJ2ii
	 qIg0vbaVravig==
Date: Tue, 13 Jan 2026 11:22:44 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>,
	Juan Yescas <jyescas@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v6 00/20] Samsung S2MPG10 regulator and S2MPG11 PMIC
 drivers
Message-ID: <20260113112244.GE1902656@google.com>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>

On Mon, 05 Jan 2026, André Draszik wrote:

> This series extends the existing S2MPG10 PMIC driver to add support for
> the regulators, and adds new S2MPG11 core and regulator drivers.
> 
> --- dependency note ---
> This series must be applied in-order, due to the regulator drivers
> depending on headers & definitions added by the bindings and core
> drivers. I would expect them all to go via the MFD tree.
> 
> The MFD patches in this series also depend on my Samsung MFD patches
> due to patch context:
> https://lore.kernel.org/all/20251217-s5m-alarm-v2-0-b7bff003e94c@linaro.org/
> 
> While these patches compile, regulator probe will only be successful
> with my deferrable regulators patches from
> https://lore.kernel.org/r/20251227-regulators-defer-v1-0-3104b22d84cb@linaro.org
> --- end ---
> 
> The patches are kept together in one series, due to S2MPG11 and its
> regulators being very similar to S2MPG10.
> 
> The Samsung S2MPG11 PMIC is a Power Management IC for mobile
> applications with buck converters, various LDOs, power meters, and
> additional GPIO interfaces. It typically complements an S2MPG10 PMIC in
> a main/sub configuration as the sub-PMIC and both are used on the
> Google Pixel 6 and 6 Pro (oriole / raven).
> 
> A DT update for Oriole / Raven to enable these is required which I will
> send out separately.
> 
> Cheers,
> Andre'
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>

MFD pieces look okay to me.

Once Mark provides his AB, I can merge the set.

[...]

-- 
Lee Jones [李琼斯]

