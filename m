Return-Path: <linux-gpio+bounces-26188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C680B58C0A
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 04:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4E9832A56CF
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Sep 2025 02:53:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429B1231A41;
	Tue, 16 Sep 2025 02:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V34EYvJB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7AB199935;
	Tue, 16 Sep 2025 02:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757991218; cv=none; b=G6WUEiymdZtSDPVRmPB5xwIPe0InD+yheFchsme4vA8oiTIO5DAg3/JoDs7nHg9EyT10k62OJDCvYJJZiw8lEHhPyYmRI5bp7bCKOuISv3PDnP+sSDl5QAfeNJWmqeXqEQDR+BZG+DZR7RDrUAzH9OS4ZSSSUr9vMXn7E9TTyIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757991218; c=relaxed/simple;
	bh=xx6069vxbPWWst0kLZZTmFi0B3ZWje2/BYqnoV1KdqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WQYeIUQfJlyyapBI0VSA7SCH2RQdc+3BLM2vLQLiOxAXZLExcplWbLYUxUXukwITcNh2w0ihUeQtCMGSytx3RIqYS7mFwgyAKzUdkmgwHbOYYiOlqGrTx9qLuTip24vcZYHc9baBcRICsqfg2X48aATZG1Dll1NVUg2hkD6rMAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V34EYvJB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47E83C4CEF1;
	Tue, 16 Sep 2025 02:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757991217;
	bh=xx6069vxbPWWst0kLZZTmFi0B3ZWje2/BYqnoV1KdqE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V34EYvJBq4WNZpwD2nlhqLaSNRVFOPAymXcnoZD3mZBPYAlBzFQaTyy5huOkWptJD
	 RKXlPtuaU9wtX7zbqoXAULqXO1r02Uq4GKDQcW2DD/rTjIrIWQBr5tYxTjbdCtLYy6
	 hZgCgOxrm0FgzT4OC5LGHrs+628L1NssKVJzBLv6i+lohJAVqHVMwN3aoB242TM7mo
	 qg9hwbglm5X12cRjKhez/OrIThGc4l41weobr5jMDVZj2qMfCaLfeWXsbxLkwmmHuh
	 Q3G9vjzjH388JEco0AkC1lwJTJ6GrVd0vPavh7O4iUfapuT5OYxWTirzINUFGVHbUA
	 4CwkP/M/jiBYg==
Date: Mon, 15 Sep 2025 21:53:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Conor Dooley <conor+dt@kernel.org>,
	Tony Lindgren <tony@atomide.com>, linux-gpio@vger.kernel.org,
	Andrew Davis <afd@ti.com>, linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tero Kristo <kristo@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: pinctrl: pinctrl-single: add
 ti,am62l-padconf compatible
Message-ID: <175799121579.3582107.882281471207864281.robh@kernel.org>
References: <20250912-am62lx-v6-0-29d5a6c60512@ti.com>
 <20250912-am62lx-v6-2-29d5a6c60512@ti.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250912-am62lx-v6-2-29d5a6c60512@ti.com>


On Fri, 12 Sep 2025 10:40:41 -0500, Bryan Brattlof wrote:
> Add the "ti,am62l-padconf" compatible to allow for some changes in the
> driver in the future when needed.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/pinctrl-single.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


