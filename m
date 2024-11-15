Return-Path: <linux-gpio+bounces-13049-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6525A9CF38B
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 19:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9624DB33083
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2024 17:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 133441D54D6;
	Fri, 15 Nov 2024 17:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tUkFj+1V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FC4136341;
	Fri, 15 Nov 2024 17:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731690565; cv=none; b=r0k5GIL1luI2H+uOXkgu5lU64Hr62GifrF0xpeNCG7AkNS5qyyrm9ppazRdw4fyvCWFtYGX3gQpL/Z7RWzqM0OVTT1V/WMjNLiHLYuUR3uYBVO8vflBgy9/7dkK3a5sWIDCal+3BspCoJJU8r09tdOrspg1UBpj2DJlZa7y7LIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731690565; c=relaxed/simple;
	bh=Kat0vAa0R0WH/hqaed0tTlbgXevMzDUhnZLBXcBEO8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7VW7DCSUc2CaZ+ZrhH6mQKTzZH5E2LDQTu3W0AvXq6J1AsjO/ZVLa0TkJcWkHAuy7dHD0IbItT96hGHLX/JacSbUyyVhY2M42dwGyQAbfUovNKvvYutokoboax7yXy4srid6oH9lF4wGC+G8+YTiPtg9bVn9WcPLrOty3lItEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tUkFj+1V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2DDC4CECF;
	Fri, 15 Nov 2024 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731690565;
	bh=Kat0vAa0R0WH/hqaed0tTlbgXevMzDUhnZLBXcBEO8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tUkFj+1V4H5JGTNQNeKE4bp0/9yLPX11JH7rDNUBd59qfbrY9qhxOwyU0GyclUsqU
	 FNzzJimsDZSn+6yn/qxKa2ddEzagWoSkSqTvnx4WaW+t0LwO3Z4AaYik8wLx2n74q+
	 NpNKkVtN8tEz3F/TZhEoJzS3hmGeIbtWCZRzOJsiNihxb6aTIaoc6/WupAaaibGRBk
	 lNCBVlvVD/KMGu/LAEsVsIetmZWL3RPltmcGJAavsXyg5o0l4MXMzILTPAfq0o9q4o
	 pRoRUNKAHH5MexxRl8sHW9L7Imb4cyyTOw8FVeKJbOreurjMpNy8usapuVmgXNCPCb
	 OiU5TZf0qidPA==
Date: Fri, 15 Nov 2024 11:09:23 -0600
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] dt-bindings: pinctrl: move gpio-cells and
 gpio-controller property
Message-ID: <20241115170923.GA3356657-robh@kernel.org>
References: <20241113-a4_pinctrl-v7-0-0546a20c1c22@amlogic.com>
 <20241113-a4_pinctrl-v7-1-0546a20c1c22@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-a4_pinctrl-v7-1-0546a20c1c22@amlogic.com>

On Wed, Nov 13, 2024 at 05:37:28PM +0800, Xianwei Zhao wrote:
> Move #gpio-cells and gpio-controller properties from common yaml file
> to lower-level yaml files.
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml        | 5 +++++
>  .../devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml    | 5 -----
>  .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-aobus.yaml           | 5 +++++
>  .../bindings/pinctrl/amlogic,meson-pinctrl-g12a-periphs.yaml         | 5 +++++
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-aobus.yaml    | 5 +++++
>  .../devicetree/bindings/pinctrl/amlogic,meson8-pinctrl-cbus.yaml     | 5 +++++
>  6 files changed, 25 insertions(+), 5 deletions(-)

Please don't send new versions when the prior version comments are not 
resolved.

Rob

