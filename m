Return-Path: <linux-gpio+bounces-14501-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A49A0139E
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 10:30:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 45A5E16236D
	for <lists+linux-gpio@lfdr.de>; Sat,  4 Jan 2025 09:30:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E3118FC86;
	Sat,  4 Jan 2025 09:30:29 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E6918C936;
	Sat,  4 Jan 2025 09:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735983028; cv=none; b=W0kxbrlScUWIWZtttkNZfqdPHgMTc/Y65EkIZMmLFbr+pmvrOJ7/MDhIv0/IVnR6j0jfq3KkUFjNyVUEfjxSjJ7tyMzYhPjgJ52FzqhO10tU6vyFzfnJWWqlsT2ifo1jnrcI4IhZC4NaAiupE8+6LIPnHidHTpukf5WSF4VEzAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735983028; c=relaxed/simple;
	bh=vFEb7BooZI3KEbQINwBZocAKDsspIQyDFtJ8loD6Hco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C1Qc9Y+5GXMo5HqZ6bquqHT3tjTEYZvxO4J/wqqS1lK3gvMgoNW1pPbkGcG+ZfziZkgXy/ujBGZG3vuZ2aj4uS10iV2AzFu0j7eDDNpFwPQ5a0sZwh0ui9oxs9t1YDsRfNe6firhsOaLbJKKq3GeZ6U8PHaPja0FLkw/SayzFgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67198C4CED1;
	Sat,  4 Jan 2025 09:30:26 +0000 (UTC)
Date: Sat, 4 Jan 2025 10:30:24 +0100
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Lukas Schmid <lukas.schmid@netcube.li>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add NetCube Systems
 Austria name
Message-ID: <pvbpqlejn6r7yjzufdmialyvjlmitusltb3ljhwstxbtoglf6q@7tvjz6neolnp>
References: <20250103204523.3779-1-lukas.schmid@netcube.li>
 <20250103204523.3779-2-lukas.schmid@netcube.li>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250103204523.3779-2-lukas.schmid@netcube.li>

On Fri, Jan 03, 2025 at 08:45:17PM +0000, Lukas Schmid wrote:
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>


Repeating again one of my comments:

Please run scripts/checkpatch.pl and fix reported warnings. After that,
run also 'scripts/checkpatch.pl --strict' and (probably) fix more
warnings. Some warnings can be ignored, especially from --strict run,
but the code here looks like it needs a fix. Feel free to get in touch
if the warning is not clear.

Please implement all comments.

Best regards,
Krzysztof


