Return-Path: <linux-gpio+bounces-8734-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13AF0950BA6
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 19:50:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 46B031C210DF
	for <lists+linux-gpio@lfdr.de>; Tue, 13 Aug 2024 17:50:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE38A1A2C3E;
	Tue, 13 Aug 2024 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vk1epMW/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F451BC5C;
	Tue, 13 Aug 2024 17:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723571397; cv=none; b=eas7pDWeKrAR8iaP4ktUq0JsBfH8K3BxSGqcZSQHNeGuJ7wcQLLrqWCoARMJv3v6XstlHe6vBpYuEf4Uw67BZU77qJipCuu5qPdebeYeyZAtYEXrpP/Dw/8i/6vToSOXEZA44O2+q2AeNjvmix/1xkyYuLqPYGTVCz3kQdVj/ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723571397; c=relaxed/simple;
	bh=dlhJCQpoZzshR0ZNpFbG4rH2zmnPQUmItk+BEUkzPdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XnoK+G21Kc7dg/H4Pvl6cOiZlQh4+Q9kN43fm6unKHshUmwun1wb1Hoo4JUSA0d0yPLLCqRtEhFYHSk1SODefG2F4x518lIoblOhqhNIthDhsR4BGRJizdCjmAcwiluRjLF+ZGT0eEK2NlZQfBvHbfK+NaraCmZWYBK31NCwnTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vk1epMW/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECC8C32782;
	Tue, 13 Aug 2024 17:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723571397;
	bh=dlhJCQpoZzshR0ZNpFbG4rH2zmnPQUmItk+BEUkzPdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vk1epMW/BQY1NN9F+FtLhlb8CB/IiWBt9H9xMiWBeZgl9NSAhAdVFBz7mUhKwcA6p
	 aDUaS7+y+82CnaH9RoJ1Lxt6YhyXzUmtw2N4n5o6HmI4AN2A3vtJQIVLXLYWyAsSqi
	 yq/W7O7ne68pr8lcQhlUML0CqeZoDYxdDS04LtjKnB+UFvUBXnF1+jHu7EqQkHye4T
	 LkfLQnEFnMzvyiSYXGfkGn+g4rlj2sEvmfxPDw5cEQWOeWCmvW8MAKxpgl3SjQ+s6K
	 BPuveyPHIyDU2fatCND7OpBM4mXiovqYE//pgjaJpQeoWSw7kgVEQx8Cfx9nnKz5Wy
	 pJz8S9HpEoMIQ==
Date: Tue, 13 Aug 2024 11:49:55 -0600
From: Rob Herring <robh@kernel.org>
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/10] dt-bindings: pinctrl: samsung: Add compatible
 for Exynos8895 SoC
Message-ID: <20240813174955.GA1411122-robh@kernel.org>
References: <20240807090858.356366-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807090858.356366-5-ivo.ivanov.ivanov1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807090858.356366-5-ivo.ivanov.ivanov1@gmail.com>

On Wed, Aug 07, 2024 at 12:08:52PM +0300, Ivaylo Ivanov wrote:
> Add compatible for Exynos8895 SoC.
> 
> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> index 242dd13c2..a2af2c88a 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung,pinctrl.yaml
> @@ -53,6 +53,7 @@ properties:
>        - samsung,exynos7-pinctrl
>        - samsung,exynos7885-pinctrl
>        - samsung,exynos850-pinctrl
> +      - samsung,exynos8895-pinctrl

As I mentioned in the dts patch, new SoCs should really define the 
pinctrl nodes naming pattern.

>        - samsung,exynosautov9-pinctrl
>        - samsung,exynosautov920-pinctrl
>        - tesla,fsd-pinctrl
> -- 
> 2.34.1
> 

