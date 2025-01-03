Return-Path: <linux-gpio+bounces-14453-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3447DA0058D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 09:12:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 74E1D18840C1
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 08:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A2701C5F10;
	Fri,  3 Jan 2025 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WK8SaiEo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49CD6A93D;
	Fri,  3 Jan 2025 08:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735891936; cv=none; b=Ykqieon3pGNy4yfPYq+Yr9dW1CxCLO+K+pHxNV1AFBQzCJIEjvbdhgriMVfEXOWRzVKMOGONdf86ldxfKZLP1fRG7sPtfk6Y41r+vC7Ki8hzYTTQ+0GVxmCJ6dSspzDJRqkXCG67RiDDxLh57mvgbl141FDi4/y0O//412roU/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735891936; c=relaxed/simple;
	bh=wNTe2dD8cq7ARum+Rs0SN994vsRAZeHnb2rd5cMp40E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClVHEQWyPE4ZY8G28+NinuH5Hse6wtVsH3JfwWS2qIIEmEGMqyPEy8LehZ0dZNzfAWAgNQ3f0YVFI3T9KcoMgcgqf3CF+be5/2nUi22PiuPGoEYqXR4eSkUweq5Mooj8Yy/gpJrVOsp/U9n5BghDOorLvRaRwfrkhbT23p0vKvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WK8SaiEo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16836C4CECE;
	Fri,  3 Jan 2025 08:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735891935;
	bh=wNTe2dD8cq7ARum+Rs0SN994vsRAZeHnb2rd5cMp40E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WK8SaiEoknbqAka9wpLvF/CrpINvc8K9DCyGT32TXF+BiXrdJmvZnp9WxnamTPAa/
	 FL5uTC1iE5NQRfNWjdYrieQ+spaVOUojfPe0yN9yNIHhhTOVEbwXJ5PgEZy02ZmHx9
	 wNxokVfZY1wD2eoRZDXh4GxAvDhaA6FHKCe3MKcTKpSDG2zgTbLCLfC/tZIG0hFocw
	 kV7gw80c/8+YYmfrjdX2MJ9xzm0grorH4ZLWqpC7KxGj8jl4ikC7FKVOIKZSGBOGCF
	 Di0ZQDlYfXhLjYcvKicIYDos8AEDzDeBCMzCiUeFhE0NxAvWYlGwPqeYPPujQgi/3K
	 5pX5lP1nGYScw==
Date: Fri, 3 Jan 2025 09:12:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 15/19] dt-bindings: vendor-prefixes: Add LANCOM Systems
 GmbH
Message-ID: <orlb6cianhugmggxnsaoullcsno46gqvq56xdio6dw34gy2grm@i2lguc3hz2xi>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-15-86f78ba2a7af@posteo.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250102-mpc83xx-v1-15-86f78ba2a7af@posteo.net>

On Thu, Jan 02, 2025 at 07:31:56PM +0100, J. Neusch=C3=A4fer wrote:
> LANCOM Systems is a manufacturer of networking equipment.
>=20
>   https://www.lancom-systems.com/
>=20
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


