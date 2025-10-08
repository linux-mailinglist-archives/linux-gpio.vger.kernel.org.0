Return-Path: <linux-gpio+bounces-26911-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5029BBC5308
	for <lists+linux-gpio@lfdr.de>; Wed, 08 Oct 2025 15:27:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BD383C7D54
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Oct 2025 13:27:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC42834BA37;
	Wed,  8 Oct 2025 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QdhXDiC/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7A42586C5;
	Wed,  8 Oct 2025 13:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759930027; cv=none; b=WcD824TmTp9LlleB+4az0DrjfgiUu7yJvQ6cNTI3tVsGJueevV8l2AI2MklvQ0cXujckutP2EP5kU8jt+rsMLWWfVunikmMJN/uSGW3MczK+/MJFw/8GrL16wG/gXzNcenCWhhQSMIR0/y/Ix1mdkwTF6riApdFcmbhHoJcmMMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759930027; c=relaxed/simple;
	bh=DcgC3kZEqrZn6AzXVpTU92ybDuRM2fnOst1ekf9M8Oc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kPbjOvMI6Pf8J7gEsitzJ8rcpZWyJjffTaANuQRiakFV5jKgzMcLXI59eR98d1NZJr2Elwee2/9zeG7sUIAnNsTb54dkgKVJPlyq6xuRJ/xYIugw4aFgvLOPPqU9DzB+9DxyPyuDKybJvUQnkmiideFDuBxSYyEpkmL5+WMvUqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QdhXDiC/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4363C4CEF4;
	Wed,  8 Oct 2025 13:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759930027;
	bh=DcgC3kZEqrZn6AzXVpTU92ybDuRM2fnOst1ekf9M8Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QdhXDiC/f4mFHOCDRASpiSv5oZCS/dhHAf2Qxt4CyXL64Ha8RakSZaBSyedlySGN1
	 8Ty6ScIuVb65YIr17UcCoGUrqPwl96rPGB7mNqgOl3sQB6XYQv9FD+nNm3fj3LXBf7
	 1gfjfK91bCbrsp5puXuIHBVZTAUZw20IXTNR6MSeWrRxpz7tBpg1+kZluenkpmgMF7
	 w4hJmvuzALrTJ3n6ws6l5GENHqjxEyeVG1qmag9b/qeGFHf6CbnGiHusEMfW3wb8zg
	 2uBv8YitL9jhPhqJf6TaFouapjWnzLNP5mWgSMJLccPIq/SuqTkZfQXVkjqr/fDxRc
	 3GQ2uavZVsl2A==
Date: Wed, 8 Oct 2025 08:27:05 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-gpio@vger.kernel.org,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	kernel@pengutronix.de, Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v7 1/2] dt-bindings: clock: add TI CDCE6214 binding
Message-ID: <175993002523.3403965.4545656305134383205.robh@kernel.org>
References: <20251001-clk-cdce6214-v7-0-5f8b44da95a5@pengutronix.de>
 <20251001-clk-cdce6214-v7-1-5f8b44da95a5@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001-clk-cdce6214-v7-1-5f8b44da95a5@pengutronix.de>


On Wed, 01 Oct 2025 10:12:53 +0200, Sascha Hauer wrote:
> Add device tree binding for the CDCE6214, an Ultra-Low Power Clock
> Generator With One PLL, Four Differential Outputs, Two Inputs, and
> Internal EEPROM.
> 
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> ---
>  .../devicetree/bindings/clock/ti,cdce6214.yaml     | 192 +++++++++++++++++++++
>  include/dt-bindings/clock/ti,cdce6214.h            |  25 +++
>  2 files changed, 217 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


