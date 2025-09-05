Return-Path: <linux-gpio+bounces-25654-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AAF8B45101
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 10:13:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DDEC21BC7C4E
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Sep 2025 08:13:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5F282FD7D7;
	Fri,  5 Sep 2025 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uqfTjSQi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8E5270557;
	Fri,  5 Sep 2025 08:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757059991; cv=none; b=VCMqMsFVxG/63o3KqiePn5UW4n7GDHB2WUKb49ethZ8EJIeH9+dWEk3dHCqg3w2RRKXjuIh+hPMZ20fmSbHpn8cjTxgLh0rCl4g4s80EOUe9Jr/kqbKjjqOl2xLAKkJQVpxcyFwREk7Y2C4qH22WVtf0lhfNyLCEgWLVZR7Dvls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757059991; c=relaxed/simple;
	bh=S6kWmIW0hVTEZZAoAewWz0JxbYGS//J7DbVnzoq7lWw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwXYVECe9JQmRUN7s+E6rPpVbVQJLxcP19y4XE41JJxikeZw/zkbgONd126X4zO0d1uAnCNeaOkE8CLFOhXikg2NVGZ8VUaINUAxexNwyrIBYbSy3RNrB0ON4HVJB0oCBL4BiWSFMikQh/erOd/68P82TKBXOFcn6OBHqvkbIEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uqfTjSQi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF30C4CEF1;
	Fri,  5 Sep 2025 08:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757059991;
	bh=S6kWmIW0hVTEZZAoAewWz0JxbYGS//J7DbVnzoq7lWw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uqfTjSQidjTXugpGnslEzU82f/RadZElrGPTahUGa2Vj5cKM5BL5TuFZJyfNoVThP
	 cXJqvvemUKZHUrcqJZj7S+nU2Mt/FOKD+ANHVUJDojYsr5/k6McPz32+9bHLye4urn
	 1YvTNlTZ7ERiS/E3Q9h0TGVAo5cOi9RH9MY+eUMzyfVSeziJqjw93A3IIQ/qdHRK9U
	 gm6OUCPSqji0ceFUTD5F2sflO21MDu6wIywexM4+gWmryX0aOhjgvVx2k+jpjZ2CGB
	 dGnkwzASq7uyDcyrPakuM3WTWOS4lD5GVXOsqnJA5sbDKTJKhFkuNxRCnkvQ3cfDX8
	 QhlCb/hGrMHrQ==
Date: Fri, 5 Sep 2025 10:13:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, joel@jms.id.au, andrew@codeconstruct.com.au, 
	linus.walleij@linaro.org, brgl@bgdev.pl, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linux-gpio@vger.kernel.org, BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 1/4] dt-bindings: mfd: aspeed,ast2x00-scu: Support
 ast2700 pinctrl
Message-ID: <20250905-oxpecker-of-impossible-prosperity-63ee96@kuoka>
References: <20250904103401.88287-1-billy_tsai@aspeedtech.com>
 <20250904103401.88287-2-billy_tsai@aspeedtech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250904103401.88287-2-billy_tsai@aspeedtech.com>

On Thu, Sep 04, 2025 at 06:33:58PM +0800, Billy Tsai wrote:
> Add the ast2700 pinctrl compatible string.
> "aspeed,ast2700-soc0-pinctrl" and "aspeed,ast2700-soc1-pinctrl"

Nothing improved, completely redundant commit msg. We see this from the
diff.

You got comment last time and it applies everywhere.

> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

Best regards,
Krzysztof


