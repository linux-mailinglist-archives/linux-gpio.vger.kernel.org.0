Return-Path: <linux-gpio+bounces-8462-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B819416F2
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 18:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CD5628767A
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Jul 2024 16:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B929C189514;
	Tue, 30 Jul 2024 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KBxAy+sn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74237187FF2;
	Tue, 30 Jul 2024 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722355492; cv=none; b=GPflIN5y2SvjlfB5rjQyjCJHOteAj9S2JDrYIOIBqw1b1c/o0PWQ0cAeohXI5ebpYgBqfNjmFR+s821si8XpPlMqSKJL2wAH55k9SW6qk9RFR3CGmPwdMUhNL9oJ+WjhehSiywoOcMovNEDSeA9TpEu8hL5VodRLEc66g+VPTK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722355492; c=relaxed/simple;
	bh=f5xwyBTY5wcQG8Xzs8zNrFwJGxLHh7s/zhtpeic6m1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YCGMLhfFhuZTP9mJvYP47ZspqLiu4cSk7V0dEDLBwkfMsSlvnmmmUdPPgM5rMknfnCznBSnlgf4YazV2X9soT2hrcyHXWsvD4L/Qc6TMIa2q1H9a55omMxCirwKYYF2Hm9PiGmF2y6E+Iqg8OpaDGd5ypJW0PMDyTQ8JbbFw2Bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KBxAy+sn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1BA4C4AF0E;
	Tue, 30 Jul 2024 16:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722355492;
	bh=f5xwyBTY5wcQG8Xzs8zNrFwJGxLHh7s/zhtpeic6m1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KBxAy+snUOejKGM0/WwdqvSOrlTo08ZzHPB5LNA5+7FVCnBEgRsKQTnWMma6CYUOG
	 Fi5ZXzIT/Iwil6My1eTOZkSkcexOjDyi3bY5H7+U4j/0L0ecF9Po4K1jdxLk62Jmur
	 +folz2IWP0ene3yw3PQ8B0LXXQ4dlH7BzFs15IY7254uEjofg6qdxsNRGWnMfMAQe2
	 EITAMpDB2ctSBQ+T9u5ptZmBCKUOKR1wSFNNatcryRsc0F/oIp6disomS25BclT7ZA
	 Y5BTDpmE4r9vpAPsf/MCw3BCS4fu3dyeMvjsbUyJNjqeowJqfMfU5vbghryBYkGrtH
	 om1LqBpsbMpZA==
Date: Tue, 30 Jul 2024 10:04:50 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH V2 6/6] dt-bindings: pinctrl: renesas: Document RZ/G2M
 v3.0 (r8a774a3) PFC support
Message-ID: <172235549013.1348255.1946918733596079884.robh@kernel.org>
References: <20240725100534.5374-1-oliver.rhodes.aj@renesas.com>
 <20240725100534.5374-7-oliver.rhodes.aj@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240725100534.5374-7-oliver.rhodes.aj@renesas.com>


On Thu, 25 Jul 2024 11:05:34 +0100, Oliver Rhodes wrote:
> Document PFC support for Renesas RZ/G2M v3.0 (a.k.a r8a774a3) SoC.
> 
> Signed-off-by: Oliver Rhodes <oliver.rhodes.aj@renesas.com>
> ---
> v2->v2 resend:
> * No change.
> v1 resend->v2:
> * No change.
> v1->v1 resend:
> * No change.
> ---
>  Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


