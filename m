Return-Path: <linux-gpio+bounces-7082-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D048D86C1
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 17:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 846561C21857
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 15:58:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D3D132811;
	Mon,  3 Jun 2024 15:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NnE7AxB4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABCD1E525;
	Mon,  3 Jun 2024 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717430330; cv=none; b=ZvS90qS9V+4aUhxNtYQEqPg+PE6rFgs7gu+liRi8lU7BI3NrxxNxJBEX+rLfyhz91rq92vEm0Uf5hNfnY6EfbWfZ0LcoKQIlEMCiXnJb1I2w8FGPPAZB3AdGaDaMsCx0k+pzWaXlXYWA5kSIog06E28/qVuuXw0rhNdlrdzMYsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717430330; c=relaxed/simple;
	bh=jr5KtcQkjBceRa2Ci2HL75FOws1f+xvpDE3Fj2u3hG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HhcBwcV4m+jmkocrJz3lzZZbzErxYHClhDABRSBu4PSb/eFrBbHsImK5MNAi/wsmSqVleq5E+0TIpAq6U0pm1kUYuFIg0019DcEgZ094JtDzUo0FQiVO80WnEfJN1EqxbZUaEQncAxBoisKu0+9fZCvy75sOLdovDUrxDKf9Ox4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NnE7AxB4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CF9BC2BD10;
	Mon,  3 Jun 2024 15:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717430329;
	bh=jr5KtcQkjBceRa2Ci2HL75FOws1f+xvpDE3Fj2u3hG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NnE7AxB4O2JNJKnAW8Njm+7GaoNEIHTH1wmKepsGp1wiIoK0gyEfBTizpq8gN9VaG
	 aTFA79SEQDDGzD6oLeh9i+znquudhE4nVp438GlWcNGpOqUSa+EIHhSvYZL/6Hhx/4
	 DdWFkShVC8JD7yvqQ5leTxr7JLjlwWDL5R2qp8IMzWWm1Hj6NS9o7HapY+u0rksG7W
	 mvJkXm98AAvkzo5yXRgYOi0/riRuy5EWV6taBeFrEJG6TRQPtqMl/A51aZS9sVDF23
	 mAvl9/1opM9sndUJnrbkJt3qnJDS1+j7krJJvd0DRxSx0QFr6YoZfZHpHpr6J3VtZY
	 husY7cOS8z0bw==
Date: Mon, 3 Jun 2024 10:58:47 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: fuse: Document R-Car E-FUSE / PFC
Message-ID: <171743032508.512428.16482464723039405455.robh@kernel.org>
References: <cover.1716974502.git.geert+renesas@glider.be>
 <03e43e97941df238ef1a618852aecd7be68adbb0.1716974502.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <03e43e97941df238ef1a618852aecd7be68adbb0.1716974502.git.geert+renesas@glider.be>


On Wed, 29 May 2024 11:29:30 +0200, Geert Uytterhoeven wrote:
> Document support for E-FUSE non-volatile memory accessible through PFC
> on R-Car V3U and S4-8.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> ---
> v2:
>   - Add Reviewed-by.
> ---
>  .../bindings/fuse/renesas,rcar-efuse.yaml     | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/fuse/renesas,rcar-efuse.yaml
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


