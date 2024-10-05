Return-Path: <linux-gpio+bounces-10879-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC32E9919A9
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 20:46:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 265E7B216D0
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Oct 2024 18:46:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40E2415DBAE;
	Sat,  5 Oct 2024 18:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qazhTj17"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3ED52F88;
	Sat,  5 Oct 2024 18:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728153961; cv=none; b=EXv5ENwb7TE6D45GRBpiPRDOgVHxX0E7yRO6KRsKkkqTwysawI5ki7wZfIpvh+7C4hLEzctgWCC1Z+1mbDiw4y0e7nwFfFx5o81TqJxLw7gohAwQ9cUQKE44yNBh9wDF4fiIne+iD2kYTyVVrWFDmV1GEW8x72+fWaNMlbJrisw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728153961; c=relaxed/simple;
	bh=yXGJWhJIbS2W6DokaVQR9XbZQBgCt4aNCxyXpH/4rYY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SgxPnYC066eWdAIApxFePIjIoLjN6lQgWU/iYoB/674ErmgxWmMjiQxqkWoSIwVj/Oa4PriAE45g9bLU4EdIZSytE0QyMTJsF9x5KWH3HfyyK+igcpVQP4wX9zBX3KzH3YMRtzmEC8It5cPsSVO9hSw9Q0LX7cgwillQSej4spI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qazhTj17; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638EBC4CEC2;
	Sat,  5 Oct 2024 18:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728153959;
	bh=yXGJWhJIbS2W6DokaVQR9XbZQBgCt4aNCxyXpH/4rYY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qazhTj178cug128FmSIXJa/pVwHNBGmLk5jyuew0WSKwl4Oz3Z7F8Q+o3ad4StCka
	 OarImiVGPklnMlTvYrjjLZDOjULeqHwMmyCI7OsPzBO7isUX6xP3OVwEHWJD5yKiJB
	 K6eLV4Edq9hnmbdcPmWowf7tr5P++EEI7UULo8AvqnTZB1e5rHysuJ6q7cIERVoHQ5
	 HTjKkih4FP7869+bOODQCCgOiQ1xK6ghTkYS6l8TQZXf4FDZtoQD3O4mH1a7wfn/xc
	 2JYnz2otus77eKvt7/ACCSQjcTIN/kZ/jrRbEAHInAGx/cJ0temKw8Thl4qVfT7FKi
	 4neAFKTmQIYVg==
Date: Sat, 5 Oct 2024 13:45:58 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl:
 Allow schmitt and open drain properties
Message-ID: <172815395809.519434.8305860321156601948.robh@kernel.org>
References: <20241004123658.764557-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241004123658.764557-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004123658.764557-2-prabhakar.mahadev-lad.rj@bp.renesas.com>


On Fri, 04 Oct 2024 13:36:56 +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> On the RZ/V2H(P) SoC we can configure the 'input-schmitt-{enable,disable}'
> , 'drive-open-drain' and 'drive-push-pull' of multiplexed pins. Update the
> binding documentation to include these properties.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Hi Rob,
> I have dropped your Ack from v1 as I have updated the commit message and
> included `drive-push-pull` property in v2.
> 
> Cheers, Prabhakar
> 
> v1->v2
> - Added `drive-push-pull` property
> ---
>  .../devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


