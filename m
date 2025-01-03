Return-Path: <linux-gpio+bounces-14454-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 295A6A00592
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 09:13:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 04A2D3A37D6
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 08:13:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EC51C6F70;
	Fri,  3 Jan 2025 08:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VrX/Qa9k"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FEF1C3BF9;
	Fri,  3 Jan 2025 08:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735891997; cv=none; b=tF0Yi1DfbtMcHv+XwrOPbnteWmap0AGUnryyqwwYv/VGQlVY5K5Y5aQ7+Z6hB/z58ziR9jpneOl9l0izabht6ALJeQttd2yhkSXdVQ5PcfOmcJk0NHNgW0+K0cfCwUQA6dijChO0BQMd6ATFNKzE8d7Fg7GW20kj8YDh2N4B4gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735891997; c=relaxed/simple;
	bh=S47wggyuRv2A8v9Z9jq7+8RA2lHFl31wl43mZE2j1JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OmCdAs+oSXVrdXPvaUsPPGcQvJ7tlJYBXa6SGg8/htznvrIVTBxspTJ07Rwm16Saau1gpx9Io2WCYyHdz0O4pZ6e6oez25COuySLpkcvm3+HIZwkEMHP6Lm6XQGBywku9YkxpnXtlurNwgbpps48jPnNe3kFCs28ZjhvlVvTb5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VrX/Qa9k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D2D3C4CECE;
	Fri,  3 Jan 2025 08:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735891997;
	bh=S47wggyuRv2A8v9Z9jq7+8RA2lHFl31wl43mZE2j1JQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VrX/Qa9k/5KPueZGlHVOaMkG+y3cTcFVPcC4045Q6b+bmBVm1ejC28kL7Ctbvj4r6
	 7COCIxVdPat2bNQorI0sJi/odT8PRInOcH+Y5/CY3whH9eFVXRrNPTXcQN8VzDOhRt
	 /E7ZKazmSHnCLdcmMK632d+J4tozJf6jOmDsN64jIua0w/uTW3fzLGMuYolKtAxlWV
	 +GIm21EOxstpR9bM2yzz5bPBQsRqZWjJNBfKsEppXFjn9k1UMpFcEa7H36z/YYFQKB
	 VHe0uK1b7dH357g5Wh93PFfmq5FjoMSXmFPYMJJ3vFNhPwMWxOS6HiRN97Brm4bFQ+
	 /CsXYYPQFI4VA==
Date: Fri, 3 Jan 2025 09:13:13 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 11/19] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible
 string fsl,mpc8314-gpio
Message-ID: <ovcdrqxlniliv5qq2uds64hh5qavafxwccvf2m6yivwoggh4r3@62qvynvphnju>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-11-86f78ba2a7af@posteo.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250102-mpc83xx-v1-11-86f78ba2a7af@posteo.net>

On Thu, Jan 02, 2025 at 07:31:52PM +0100, J. Neusch=C3=A4fer wrote:
> This is for the MPC831{4,5}{,E} SoCs.
>=20
> Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> ---
>  Documentation/devicetree/bindings/gpio/fsl,qoriq-gpio.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


