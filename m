Return-Path: <linux-gpio+bounces-7083-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C11C8D86C8
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 17:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D8491F2187D
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 15:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F58D133402;
	Mon,  3 Jun 2024 15:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qi1lSgGb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9472132804;
	Mon,  3 Jun 2024 15:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717430353; cv=none; b=ToBVuepACggjEgzZgH9MN6y8WV9pdGWtYpS1iDtjfg2rjKUOEbjk/EbuhTapHPb80xTcvee/a7k3tVbktZPuEE15zKkWyidXbNdcrpg5kByv2P+bTqGH2lGztuMWXAYhVBZKC3cn1PzlFojhVxX/6L3C7OaX7I08izzd2zY4E0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717430353; c=relaxed/simple;
	bh=+IPbDiNKupe/tKYGz7GWLMWlSz+9XHPXjaXZt0CTwMY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2MWu7lWti7I0d+QOEahE48DXDKcn+n14E2oNvTwl1LfXJf29GNjN8ajHZD3ODBWCEDaQis7M5zPOZx7MMv3oXvnCxgILNvFBC1V0KZGsQ0tRTR/i+5fXJQiyGA7Uiv0XVj09kbg/a9dAGKa4xqyWaJU1ezUzjqp3BEo0V5k/7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qi1lSgGb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61EDEC2BD10;
	Mon,  3 Jun 2024 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717430353;
	bh=+IPbDiNKupe/tKYGz7GWLMWlSz+9XHPXjaXZt0CTwMY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qi1lSgGbv/3NtwsuMgIES6YLUXnJdWSaB3aOkCHTK+FFI+WyRtC7qR1JzdMrfcFMy
	 i71OnJidcfw3jkgtqWBtYs3DXzw2+9ftCy3s24WDTtWJqyuolfhKNzAc3G11InrKEu
	 we1NiObPEJq2oWoHZ2H+KeFDTZVrWbRgpZ5kZva2wZR1lc1c7naRbIQeyw6vOLqp3V
	 onkNWutbwNYiEAEjV12rrm18lr0Olecp163wdAAMpH8EgAOoxhHXrho3Fr7bFCslyO
	 N/eEBQqkSuIfcjw+fd2V2hAX6EVTlHoe1+u8sPClPNucWrcphWYPYtDuilyAYVOhqZ
	 SeU+VjBE05pcA==
Date: Mon, 3 Jun 2024 10:59:11 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/8] dt-bindings: fuse: Document R-Car E-FUSE / OTP_MEM
Message-ID: <171743034904.513055.5269054083345878989.robh@kernel.org>
References: <cover.1716974502.git.geert+renesas@glider.be>
 <436506babe4ce468fda19380d9373470468e3752.1716974502.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <436506babe4ce468fda19380d9373470468e3752.1716974502.git.geert+renesas@glider.be>


On Wed, 29 May 2024 11:29:31 +0200, Geert Uytterhoeven wrote:
> Document support for E-FUSE non-volatile memory accessible through
> OTP_MEM on R-Car V4H and V4M.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  .../bindings/fuse/renesas,rcar-otp.yaml       | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-otp.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


