Return-Path: <linux-gpio+bounces-10186-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 437DC979D43
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 10:53:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76DBC1C22BA5
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 08:53:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DB7E13C8E8;
	Mon, 16 Sep 2024 08:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="in3wcgtW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DBD145A07;
	Mon, 16 Sep 2024 08:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726476786; cv=none; b=pqsKeJ4pE6KgFT0/i6BdkKs2Q5iIMe1RjpB3zDcoNPpypFZj46mCu8lCDkPEl/C0GJxShVAMZK0lvVN++GZjSn7qPQSY/gxtADwxS1LNdhIxDtdQaoJKEFYaZnudqtgEs2lHemL21S77feotZCaXWuXqLaRuPJFctD8lcCmJo7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726476786; c=relaxed/simple;
	bh=lpBsDPPu+DtRITXEEs1YvzNC853IEGPvRRrnFlGZ/Fg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ig+ez/8aPf+cvy60illTbcqASlOQqn3LbE7pvHVSSmjxwYNj/YYE+eTqIH6K+iF4PUn+Iwej9VhsO/VvgE96Q+pDijOyvRDhzp9PoBCmJwvHUPDg1hFL088J24Zppi+FTEmrB2vYJtNAgp0/t4j228ATmAcYsa+ZpzsI372MnKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=in3wcgtW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6D65C4CEC4;
	Mon, 16 Sep 2024 08:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726476786;
	bh=lpBsDPPu+DtRITXEEs1YvzNC853IEGPvRRrnFlGZ/Fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=in3wcgtWWo5Ui1PxJkUCfXeWo8j074zXNqkYaZhTeDk1Wuha2h9aCXst+t4DB28O3
	 fcjL8E8+CKGyRNW3B7wnGAec4jnAAKXZkOtR+a4dh7CkDRrOKm4EZHs7fh3tOS0dyk
	 PkEYrlOCsjKXSKCkeOhmJz1gm6aP36FYpgbepXQW+FPrX5wuy61Hq6O5k51BpZ83bJ
	 osnH7YjQV0EhGk5YEIW7ZuY6j9dKjeBlSDBHQToZryCe8C2O7SEdTbe/V+66S9Ysap
	 zZPNfgMMT6BszhGNpPEecrK6rOs1DrN2PZt4rGMCd9mmcAg0xTPKlzijLe84JLM5sC
	 VY4GDk0uiMIIA==
Date: Mon, 16 Sep 2024 10:53:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Nikunj Kela <quic_nkela@quicinc.com>
Cc: andersson@kernel.org, linus.walleij@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel@quicinc.com, quic_psodagud@quicinc.com
Subject: Re: [PATCH v4] dt-bindings: pinctrl: Add SA8255p TLMM
Message-ID: <bzty5fgv4j3md6nnj5j3zq5562obwhd47hizdqodqlubf4zjoa@yjsvyqza7wlc>
References: <20240910165026.2406338-1-quic_nkela@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240910165026.2406338-1-quic_nkela@quicinc.com>

On Tue, Sep 10, 2024 at 09:50:26AM -0700, Nikunj Kela wrote:
> Add compatible for TLMM block representing support on SA8255p.
> 
> SA8255p uses the same TLMM block as SA8775p however the ownership
> of pins are split between Firmware VM and Linux VM on SA8255p. For
> example, pins used by UART are owned and configured by Firmware VM
> while pins used by ethernet are owned and configured by Linux VM.
> Therefore, adding a sa8255p specific compatible to mark the difference.
> 
> Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


