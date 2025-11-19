Return-Path: <linux-gpio+bounces-28725-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C08F7C6D189
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 08:27:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A06A134C157
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 07:27:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24C2431ED94;
	Wed, 19 Nov 2025 07:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WhO9mwHD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB062DBF78;
	Wed, 19 Nov 2025 07:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763537226; cv=none; b=n79T7hcVXNYfjia2bwr7fJ7b8LfLEHkM+cUelcvfDUZpwYI1e2yrWHSl1Ucwq5HJrfbFEEpIJ3vVafMRDSgrf4KXldMQFBRo9klT/jlZbl3NDzHwxup9fYRdDvNWs2gpeXJ77G7Cnj0WFX65uKBbA/5neiUd0Y4XjyUE0FHd4Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763537226; c=relaxed/simple;
	bh=VkvhOm7Im9NgLtpOPK9Ghu9qT2h9mz/GyVCt//vfA7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOTKnxPJDBvVo8fV56rD6H4fIPxcScO4Hzg+TIUtvA0S+KUTl+R/+XFk6z1zJmx29zZeJig0TM++YZkU64OVCauv1UkaNmqQoD1xB0Ga2GRnlcm0dz9BIMcjvqqPvQ+mIQgPC1pnzPGY5nOyQcmT2xwfSSgN34vjstt48LnnU7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WhO9mwHD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BEDC4CEF5;
	Wed, 19 Nov 2025 07:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763537226;
	bh=VkvhOm7Im9NgLtpOPK9Ghu9qT2h9mz/GyVCt//vfA7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhO9mwHDxV98gAchLiwpCG+KlIE2c1uS/9x3vAEoRyZPn32WURzsAUQgF/vAAv5xu
	 KhSA1PATm9Oe1JjpqrFNIWIk3NYvGS6/+Rc07+w8xphZUVdSrq879yAlTfl46ex9dl
	 AHhbmAvvMASzQPgZRa/e5kE8ccwirjMzxst/kzoglsm/siP1DLuoU5ABQGvH4gUKM1
	 aK0LhtRX48pvKCN3gRGtB/aHTcyKaXSjIFKzS5EW9MaE9FsZk2GXtj0+tixwZ2S51S
	 GcM7goKQVm/v+E4yD5Gw7tDGgatsA6SQ2DuZllJ8Xpy9CoVpGDhpiv7QNqWJ7vEM6+
	 0xgw1gJByipUw==
Date: Wed, 19 Nov 2025 08:27:02 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?utf-8?Q?Cl=C3=A9ment?= Le Goffic <legoffic.clement@gmail.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Pascal Paillet <p.paillet@foss.st.com>
Subject: Re: [PATCH v2 02/15] dt-bindings: pinctrl: stm32: use strings for
 enum property 'st,package'
Message-ID: <20251119-ambitious-tuscan-scallop-ecc1b5@kuoka>
References: <20251118161936.1085477-1-antonio.borneo@foss.st.com>
 <20251118161936.1085477-3-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251118161936.1085477-3-antonio.borneo@foss.st.com>

On Tue, Nov 18, 2025 at 05:19:23PM +0100, Antonio Borneo wrote:
> The property 'st,package' reports the SoC package used in the
> board DT and is used to inform the driver about which pins are
> available for use by the pinctrl driver.
> It has historically been declared as an uint32 enum, where each
> value is a power of 2.
> 
> Deprecate the use of the numeric value and replace it with more
> readable string values.

The "SoC package" is defined by top-level compatible or by soc info
driver. It is not the property of pinctrl, therefore if ever touching
this, you should deprecate entire property instead of growing it.

Best regards,
Krzysztof


