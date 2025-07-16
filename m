Return-Path: <linux-gpio+bounces-23340-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACB8B06F76
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 09:52:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 30B734A378A
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jul 2025 07:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AC629344F;
	Wed, 16 Jul 2025 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RYCEkmNV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31683292B42;
	Wed, 16 Jul 2025 07:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752652280; cv=none; b=sAyJnAVoMclbVFieAEgBcLxQQhWJiVmVnaslsh65/+Ge5dbzJjZ8++5D65zUpUmzds6EcjIKZXMRMAED6tIen5DNIZ4V6GHTj+mvKjuve/cNLnMlP/oOaUbwyXYt7qgGpY7xzXxD5Q8+OFPvPZrnFWT51Q9aNubl2gjjP0IZHs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752652280; c=relaxed/simple;
	bh=JmE7m3bTLeo9xgxysdSDSxK0t03ujqlDmwZ928eeLqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QYQzINuO8kjz21hn4VIJ5D3oHFBlUZ/+q6FQ2uejmg7R9K84YAdn+X2P09jYfNRlQn98FPkOOJTmCLGlWSNxmd+XEbfN5CFRFjOCLPEcCLHxXXGsmmwbwV53SX+mIPDVdhdjo1R8DntBRXg1r6TqWrmSwitp0Z44k0763HP4rAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RYCEkmNV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3378DC4CEF5;
	Wed, 16 Jul 2025 07:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752652279;
	bh=JmE7m3bTLeo9xgxysdSDSxK0t03ujqlDmwZ928eeLqQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RYCEkmNV2+4vXXAfDGdpkg9HXHC44jDHTrK7WBRGncG1bD7owC5vAX84WA8xGR80F
	 aRP/xZ2FDbY7lLyBAs1SKwSxe7fX8igMOvpuxxNfwM920v1Ze0sKCWtUSJ6EWkoyGi
	 Lwwi0OgJHZ+P6MO2G0poGu/5qOMoMWOrMSTIPmJd07YRbZyqqKBtw82BOCu1vqiffg
	 EmOkNgfFJjNdeTEtWlR/ypbO7bP6xwSTE7r4/dlAg9BTwP3jYrrBIGIXkPBGqdRBgu
	 JMTa68W/5QPPXsSYrlJUnZzIuQ7N6Aq1ZANWpS4geOTRpmwdsdibf1jvrKm/8Wvu2w
	 0DZw+7fwlrS5g==
Date: Wed, 16 Jul 2025 09:51:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	kernel@oss.qualcomm.com, Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH v6 3/9] ASoC: dt-bindings: qcom,lpass-va-macro: Update
 bindings for clocks to support ADSP
Message-ID: <20250716-spirited-sage-ibis-dcfeb1@krzk-bin>
References: <20250715180050.3920019-1-quic_pkumpatl@quicinc.com>
 <20250715180050.3920019-4-quic_pkumpatl@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250715180050.3920019-4-quic_pkumpatl@quicinc.com>

On Tue, Jul 15, 2025 at 11:30:44PM +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Manage clock settings for ADSP solution. On Existing ADSP bypass
> solutions, the macro and dcodec GDSCs are enabled using power domains
> in lpass-va-macro which is not applicable for ADSP based platform.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---
>  .../bindings/sound/qcom,lpass-va-macro.yaml   | 29 +++++++++++++++----
>  1 file changed, 23 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index f41deaa6f4df..aec654e6567e 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -76,12 +76,29 @@ allOf:
>            contains:
>              const: qcom,sc7280-lpass-va-macro
>      then:
> -      properties:
> -        clocks:
> -          maxItems: 1
> -        clock-names:
> -          items:
> -            - const: mclk
> +      if:
> +        required:
> +          - power-domains
> +      then:
> +        properties:
> +          clocks:
> +            minItems: 1

Drop minItems

> +            maxItems: 1
> +          clock-names:
> +            oneOf:

Drop oneOf

> +              - items:  # for ADSP based platforms
> +                  - const: mclk
> +      else:
> +        properties:
> +          clocks:
> +            minItems: 1

minItems: 3

> +            maxItems: 3
> +          clock-names:
> +            oneOf:

Drop oneOf

...  or rebase on top of my change and make it only min/maxItems:

lore.kernel.org/r/20250716074957.102402-2-krzysztof.kozlowski@linaro.org

(or whatever gets merged first, I can also rebase my patch later).

> +              - items:  # for ADSP bypass based platforms
> +                  - const: mclk
> +                  - const: macro
> +                  - const: dcodec

Best regards,
Krzysztof


