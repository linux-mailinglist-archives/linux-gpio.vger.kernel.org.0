Return-Path: <linux-gpio+bounces-11835-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 531EF9AC234
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 10:52:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7439D1C23FA0
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2024 08:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 953B715F330;
	Wed, 23 Oct 2024 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ul/d/0kA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DBCA15C15F;
	Wed, 23 Oct 2024 08:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729673538; cv=none; b=GoHbhiJ7wdcDjtP7Cv0cJV+ctu1SPWvtLXb2KCIj05kfPWBWU8uet2e6lqYMyBzKqAoAoHmOrh6p9M+dfNKFAl6boeYs/BUrE/+Hpmucw2W7orFRinrjsne8Ko9lxg6wXATayoXil2pkpevzjc6Wv3US2BlVXpOHcXqjBcRV9fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729673538; c=relaxed/simple;
	bh=QgZQZAHGGjtLGHw0LYRXygNDG1h6h/5BqjGMqhJ4MY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cqiybIXg29/c4V3budZC5ZxgbHSaMD+pb6T09xJwwinMAG4VQ4COfROgYX5lkYtHNFON72KpgGhbO1KLd4DlBzcOBai9ZR/kATu8DhQmwSFfByfGuyZtHZ2KFe5hlUKwDSFBfpj/IukI8uuqXSefMNSIwSdChNkohokE4IYMC64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ul/d/0kA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FEAAC4CEC6;
	Wed, 23 Oct 2024 08:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729673538;
	bh=QgZQZAHGGjtLGHw0LYRXygNDG1h6h/5BqjGMqhJ4MY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ul/d/0kA8oYv0b0iR4ZobZJUIPwE8UkhlbBGQJZgtI5x/3Y2GVY4TOTDqhLRqoXP5
	 VQMkLXSrvdG5GJAOOa2ODisyt02vLuAXBd4Cl4zsQuqQQlqBXkYJMj+3Gp3U3uACYf
	 lNpmbTDdHATEgy6R1SffQh9ltcr2S4A+OwNO0yqfWLTJCap4xFBiZTCCMsUvBbrJ+j
	 NbZ6qB6LcfkXgR4fiJJX1sF5HUQdAE7F1E88ErsFaJjFkpOUqFJlpkIohHx/vuMt8Z
	 to0pYq6PjN9A1ROSrb4g3ZicCaISb7kBvzNm9J6GJmKuIMOg6aXkdZLhj+fHyh6mT+
	 8DY/roqSm7nLg==
Date: Wed, 23 Oct 2024 10:52:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Antonio Borneo <antonio.borneo@foss.st.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	=?utf-8?Q?Cl=C3=A9ment?= Le Goffic <clement.legoffic@foss.st.com>, Stephane Danieau <stephane.danieau@foss.st.com>, 
	Amelie Delaunay <amelie.delaunay@foss.st.com>, Fabien Dessenne <fabien.dessenne@foss.st.com>, 
	Valentin Caron <valentin.caron@foss.st.com>, Gatien Chevallier <gatien.chevallier@foss.st.com>, 
	Cheick Traore <cheick.traore@foss.st.com>, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 13/14] dt-bindings: pinctrl: stm32: add support for
 stm32mp235
Message-ID: <p7lms5ouffudkszvzrf5pioqmt6ngvf2k4vrzu4hncfxf2oo4p@kbksruiaiqis>
References: <20241022155658.1647350-1-antonio.borneo@foss.st.com>
 <20241022155658.1647350-14-antonio.borneo@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241022155658.1647350-14-antonio.borneo@foss.st.com>

On Tue, Oct 22, 2024 at 05:56:57PM +0200, Antonio Borneo wrote:
> Add the compatibles st,stm32mp235-pinctrl and st,stm32mp235-z-pinctrl.
> 
> Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/st,stm32-pinctrl.yaml | 2 ++
>  1 file changed, 2 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


