Return-Path: <linux-gpio+bounces-14493-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A24A3A01125
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 00:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 204D67A1E38
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 23:55:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CE5D1C303A;
	Fri,  3 Jan 2025 23:55:38 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83A8F180A80;
	Fri,  3 Jan 2025 23:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735948537; cv=none; b=tfS1iWLo29AicJBB0L8HpiEd9aC21dt3UlravhwS9BF1IMlkzuBefryRcSIS5Eamu1d6Pbw0SjhQclJZWoGINn0JrC90Trxcal5QJDSFR3GAzf2y8Y6QDhrHYYev8hfuQeA7WhbYxswOcaKu6yeQ7VqS255x84Lu/q69iI6/DYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735948537; c=relaxed/simple;
	bh=fpMdfP4gvoziexWPvq6lxs7Xah7kqgrHXjYGEl7hArE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tLQmlj+GaOlIgg4M4pulGSVgKrIDU6uuTr54k+TT62fLnlB/buV/T+K362S21G2xxgQhh84h3RGHDMmu1xdkboxcnIVGjCF5LELxPb5yggHochSS6S8KKx8BlD2LYgDbZtgZ3BpdUo5EckR9eglZy1qqcR2kQRJoIoReh4ncp44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C66C81480;
	Fri,  3 Jan 2025 15:56:02 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ADEB73F59E;
	Fri,  3 Jan 2025 15:55:32 -0800 (PST)
Date: Fri, 3 Jan 2025 23:54:29 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
 Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard
 <mripard@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add NetCube
 Systems Austria name
Message-ID: <20250103235429.672f09fe@minigeek.lan>
In-Reply-To: <20250103204523.3779-2-lukas.schmid@netcube.li>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
	<20250103204523.3779-2-lukas.schmid@netcube.li>
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

On Fri,  3 Jan 2025 20:45:17 +0000
Lukas Schmid <lukas.schmid@netcube.li> wrote:

> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>

double Signed-off-by:

Also can please add a single line briefly saying what the company does
or produce, maybe add an URL?
In general some text in the body of the commit message is always
appreciated, even if it repeats the subject line (check the other
commits to that file).

Cheers,
Andre

> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index da01616802c7..a30ed9547098 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -1027,6 +1027,8 @@ patternProperties:
>      description: Neofidelity Inc.
>    "^neonode,.*":
>      description: Neonode Inc.
> +  "^netcube,.*":
> +    description: NetCube Systems Austria
>    "^netgear,.*":
>      description: NETGEAR
>    "^netlogic,.*":


