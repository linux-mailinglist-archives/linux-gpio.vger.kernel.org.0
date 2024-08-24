Return-Path: <linux-gpio+bounces-9107-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D55495DC4C
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 08:38:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C82E4284EB5
	for <lists+linux-gpio@lfdr.de>; Sat, 24 Aug 2024 06:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4935315382F;
	Sat, 24 Aug 2024 06:38:44 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B70041C72;
	Sat, 24 Aug 2024 06:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724481524; cv=none; b=pxntj8s9nnc7x6WnXnztSrGc/T7/YMnJ+bn9PAs5a+X2NlkpJ7Yp1leJet0pGFU6sGvQncuH1YcnbMiVnIJyzm10TqyM4QfyUhD3VE6kvE4GefG+yMH4UEERKqv4ilAaBYVqpH+Ag30Ceje0fDFiJJiJ9nccobsr8BUS0NTNd70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724481524; c=relaxed/simple;
	bh=p/mUgmk29+S4IL4JzOT+wL8fP5jthd1aavpwMxCC9JI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jLm2xB5uiohZu7vw3GftFrlx2Hz3EieD5S8Y5xGZrBiGPAF10AXR83feNrbVq252SFxEylCJpc8wj2JHIkfOO+1J67qrbLyfvHXYeo3ilUjh0oo15SqO8ot+aRYezGNEILYrKoHN8bPWM/2VBITItkH6/rqs5VrZ+2yKarcGUAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 881ACC32781;
	Sat, 24 Aug 2024 06:38:35 +0000 (UTC)
Date: Sat, 24 Aug 2024 08:38:32 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Karel Balej <balejk@matfyz.cz>, 
	David Wronek <david@mainlining.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v12 09/12] dt-bindings: marvell: Document PXA1908 SoC
Message-ID: <6jrycltcebgylznwvj4ocq7ewbdkglrxak73sbqn2yf3rdox73@ztgpvlc4cnck>
References: <20240823-pxa1908-lkml-v12-0-cc3ada51beb0@skole.hr>
 <20240823-pxa1908-lkml-v12-9-cc3ada51beb0@skole.hr>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240823-pxa1908-lkml-v12-9-cc3ada51beb0@skole.hr>

On Fri, Aug 23, 2024 at 10:54:44PM +0200, Duje Mihanovi=C4=87 wrote:
> Add dt binding for the Marvell PXA1908 SoC.

=2E.. and Samsung foo bar board/phone/laptop/something.

Some description of the hardware is also welcomed in the bindings...

Best regards,
Krzysztof


