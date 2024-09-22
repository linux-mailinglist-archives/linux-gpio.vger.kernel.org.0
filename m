Return-Path: <linux-gpio+bounces-10337-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2812B97E34E
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 22:44:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5EBF1F211A3
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Sep 2024 20:44:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7289F60B96;
	Sun, 22 Sep 2024 20:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KKYupLf/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2044B55898;
	Sun, 22 Sep 2024 20:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727037845; cv=none; b=V3oOT3Hz3VDARERhsS+1POM5bheQVMhljyg8/botQhuExQcYZySmTh9P6cbpdqEbOg4P7uEMqqKhJmZT08mrwb5SJRyhFHZAOySEhE4InWk3GIEA/LF8bNzZXqQdBFvUj8iuABULNstLYqYOQFNPOYdlwjr+j2MX07uK8sBMduQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727037845; c=relaxed/simple;
	bh=U8Q/GAjZ32JI1g58R1mk3ZgK83IEBwMuA4as012CxkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YXsrRA3PPqHd3+2PFDst5gwD3bXYlB1WxlSnS0eWZ40BFzO1GcfzK+PTjhoPHi8pkQLrEBU/LIh5E4eCe/7+nCfJK6WdYyUaUeL6ole52jjrjNsRTkTZxqu6LHEJXyX0fATmxGScCqRNF90F7cnra0lNkGmr/I0SP8uYwfczAc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KKYupLf/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 028C5C4CEC3;
	Sun, 22 Sep 2024 20:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727037845;
	bh=U8Q/GAjZ32JI1g58R1mk3ZgK83IEBwMuA4as012CxkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KKYupLf/Ii7VNLwnVz3zKH2nVKw/9f5rujQbhyu/SRDD3tTII7u/SAx2Q4OdCx5L+
	 CVmIWBWTY3Xwm0jvX2ZJNCIoQHD+zV4v7eEpIEY92vJ9IwgnRbjq+jcfSOG6qC0M+w
	 syFytyPKQ/9DSyrBTWj6fLvEIGtyaeiHapd4X3WksZAVYOiLAzJZh0Ylj08PfvP2mL
	 O4Z510Rj/SWsIV8uskdYw7VP0rsxm/y+tRgpJyCDtVWU2TY8qPFk4e18QfNInOIVWx
	 WKVholcjdJ0nYj0HXCU1Yq0S9qFY/DndUhG8ZAyvp14JsPRY4EHprvhNc+opn+1gzB
	 N4QtNgsEuEhvg==
Date: Sun, 22 Sep 2024 22:44:00 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nick Chan <towinchenmi@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Mark Kettenis <kettenis@openbsd.org>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, konradybcio@kernel.org, ivo.ivanov.ivanov1@gmail.com
Subject: Re: [PATCH v4 02/20] dt-bindings: watchdog: apple,wdt: Add A7-A11
 compatibles
Message-ID: <xvadaefjj3f6c367b4z7cv7y4haf7fjsib77wxuvnen667nhjl@m2bpxstw6ujf>
References: <20240919161443.10340-1-towinchenmi@gmail.com>
 <20240919161443.10340-3-towinchenmi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240919161443.10340-3-towinchenmi@gmail.com>

On Fri, Sep 20, 2024 at 12:05:51AM +0800, Nick Chan wrote:
> The blocks on A7-A11 SoCs are compatible with the existing driver so
> add their per-SoC compatibles.
> 
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>
> ---
>  Documentation/devicetree/bindings/watchdog/apple,wdt.yaml | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


