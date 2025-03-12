Return-Path: <linux-gpio+bounces-17498-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2B4A5DBED
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 12:49:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5B4E3AB530
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Mar 2025 11:49:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EE9E23F393;
	Wed, 12 Mar 2025 11:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VjLu+e8M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B699723F36C;
	Wed, 12 Mar 2025 11:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741780147; cv=none; b=Tr1OdfF58/X5TnXeDngbEFiSWHAoQRPtTlZ76w2p+dN0X5sYqfxgpqckNCSs9vFRPdx1dMbIlrd/AbaqSGvRPRIE/fjVAizZnh8X1BqFHD8Cy3yq+QBP7XwTB9IvfccxDN2WXTrOFD1XfOLSguUf1C3DM4447EBtF8kgoqMXgYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741780147; c=relaxed/simple;
	bh=hA8uC2cjJb0U97llAnvWr6pOTnn8TvnzZT+mShCaG3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DdWsgc6LQ+4BYcmU5Om/qprdTplHUl81TldQAwJlzkuT7C1CySUEwYosWhsEbar12Fvutqi/4M1DL4RNxyjYte+RerynNj6hZUVMK5v/sKxStvgu1mZRF7Gr3KZBiasv+ECV+9I/OEJrBogWyy+bsoKvDH225ThSjU9FBA5k6vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VjLu+e8M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B291C4CEE3;
	Wed, 12 Mar 2025 11:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741780147;
	bh=hA8uC2cjJb0U97llAnvWr6pOTnn8TvnzZT+mShCaG3Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VjLu+e8MHXavbfvAAc4y/dHPiHfv0YeLBx94u/vXlVgEXR1K0KQk8xbEZ09fnuKN6
	 Ba96Z0XF5GFDmObl1RvSns45F7tqQpdu33kib1trh4GCAJMjp/Y8koqndUE+JegVbN
	 lF3mtTFwlfI2Q5Ka0dRezXH55qDS3xtve15wEDgKjS6sjA01jaWjLiE+vAnGPNgzPg
	 2YzyiWIPjR+7RwJbGxhSrK0lvwF/Eqf2nOgry+O5dxWULJlTbqcsyfxqh5dVV5KTnX
	 FrNRA2jt/ix7eYsPSO1pqQYSFhmZs//zZb3HzXKP2yQSIbH1aIsA9e2L27m82/K/w5
	 bXE8aYiloFNjw==
Date: Wed, 12 Mar 2025 12:49:03 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, kernel@quicinc.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Add egpio function
 for sa8775p
Message-ID: <20250312-masterful-adept-squirrel-ff44c6@krzk-bin>
References: <20250312072509.3247885-1-quic_wasimn@quicinc.com>
 <20250312072509.3247885-2-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250312072509.3247885-2-quic_wasimn@quicinc.com>

On Wed, Mar 12, 2025 at 12:55:08PM +0530, Wasim Nazir wrote:
> Add egpio function for TLMM pinctrl on sa8775p platform.
> 
> Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
> ---
>  .../devicetree/bindings/pinctrl/qcom,sa8775p-tlmm.yaml          | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


