Return-Path: <linux-gpio+bounces-14495-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2315DA0112B
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 00:57:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D980F1630C1
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 23:57:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65F21C3027;
	Fri,  3 Jan 2025 23:57:15 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3731C1E4AD;
	Fri,  3 Jan 2025 23:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735948635; cv=none; b=ieUXoACfDKZaZ7l3dzQi1+2/K5J5nMjvhf2f2Ro0vmL0xqLnCeppV/spaAtAyjYJ1YWfpAqaYFJRCtBEWXFOMKBKV6vUyPJYboR35680LiblM4s59hU24BrpdjMjevIgCxsl/CK5H+tuBQfcETnyUXwMLGBefio4jUkJslYRM4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735948635; c=relaxed/simple;
	bh=wbIBs/lf9vCDsr1vsLZOVnBt5dUb7r8hoMi3BLp/knM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kUPIMRnhiBjVd87j8ewNpmlWkFIhypm7X8BH8EW83YomO7izXtew7opIyaw0tkMLjkVRrFAg2q9xqOaTH2ebXkzOzXqmZcUKlLQno+TfwcBaxclkt7eCnAHUt4Vk7AYcbqjxbX1JewmJWacaaPBmEa+6uDG8P6wVnI4XhigWHO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 11B111480;
	Fri,  3 Jan 2025 15:57:42 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 098BD3F59E;
	Fri,  3 Jan 2025 15:57:11 -0800 (PST)
Date: Fri, 3 Jan 2025 23:56:00 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/4] dt-bindings: pinctrl: sunxi: Add
 gpio-reserved-ranges property
Message-ID: <20250103235600.7834a6a6@minigeek.lan>
In-Reply-To: <20250103204523.3779-4-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
	<20250103204523.3779-4-lukas.schmid@netcube.li>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri,  3 Jan 2025 20:45:19 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

Hi,

You would definitely need some text here, at the very least this "90"
deserves some comment.
But what is this property meant to say, actually? Looking at the DT I
guess you want to mark GPIOs as not connected/exposed or such? I don't
think this is the intended purpose of this property, it's more for
describing ranges of GPIOs not implemented in the GPIO *controller* -
say there are 18 pins on PortA, but pins 9-12 are not implemented (no
registers) - check Documentation/devicetree/bindings/gpio/gpio.txt.
But keep in mind that the Allwinner pinctrl device does not use this
kind of per-port binding in the first place, and I wouldn't know of any
SoC having non-consecutive pins per port anyway.

So I think this is not needed, not in this binding, and not in the DT.

Cheers,
Andre

P.S. Feel free to discuss things in replies to emails - that's why we
have those mails. In the past you seemed to always answer very quickly
with a new series, even though you seemed to disagree on some things
(RTC?)

> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml        | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> index 450240570314..24b90a5538d6 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> @@ -83,6 +83,11 @@ properties:
>  
>    gpio-controller: true
>    interrupt-controller: true
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 90
> +
>    gpio-line-names: true
>  
>    input-debounce:


