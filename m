Return-Path: <linux-gpio+bounces-20514-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856AAC1E6A
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 10:12:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAB0AA27A9B
	for <lists+linux-gpio@lfdr.de>; Fri, 23 May 2025 08:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6A3288C2C;
	Fri, 23 May 2025 08:12:46 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D3314A627;
	Fri, 23 May 2025 08:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747987966; cv=none; b=cOL1LQ4aF4tZo4OSKq2eH/xeuUOp3VC157vCEqD5VzLnjVHiTqkGDIr3IotY1daIUTxQ30tS6dX+RmGryogVkqYs7VL3UIIhgupsksF692f14V5AmO1CcId/smt1Z8dL4CsRJCfgEWwKyG0ZxRFKrO8ilvIhBqV8DlCaRn9U+1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747987966; c=relaxed/simple;
	bh=/L47K031fNCntmHXTti7FA4/p7PJPFyTm/d5Sjeqwkw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DciNf7fFAkspVNBa9sT7XVmAKewxROaLVkau854uFENgBKCqnlny1vqMW4hdMHIq0KFLasC57ftHr8w/NrxrebI1gtlIsVZKaAzBg3DP8aVp/EBMZ1phdUE6NElC+cMpiEZMYQ5lJfhxQTjyljMp3F6eSwbsfZ0gE6B2HXwoklk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05945C4CEE9;
	Fri, 23 May 2025 08:12:44 +0000 (UTC)
Date: Fri, 23 May 2025 10:12:43 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexey Klimov <alexey.klimov@linaro.org>
Cc: Srinivas Kandagatla <srini@kernel.org>, 
	Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 02/12] dt-bindings: arm: qcom-soc: ignore "wsa" from
 being selected as SoC component
Message-ID: <20250523-fancy-upbeat-stoat-e9ecbd@kuoka>
References: <20250522-rb2_audio_v3-v3-0-9eeb08cab9dc@linaro.org>
 <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250522-rb2_audio_v3-v3-2-9eeb08cab9dc@linaro.org>

On Thu, May 22, 2025 at 06:40:52PM GMT, Alexey Klimov wrote:
> The pattern matching incorrectly selects "wsa" because of "sa" substring
> and evaluates it as a SoC component or block.
> 
> Wsa88xx are family of amplifiers and should not be evaluated here.
> 
> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
> ---
>  Documentation/devicetree/bindings/arm/qcom-soc.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom-soc.yaml b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> index a77d68dcad4e52e4fee43729ac8dc1caf957262e..99521813a04ca416fe90454a811c4a13143efce3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom-soc.yaml
> @@ -23,7 +23,7 @@ description: |
>  select:
>    properties:
>      compatible:
> -      pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
> +      pattern: "^qcom,(?!.*wsa)(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sa|sar|sc|sd[amx]|smx1[ep])[0-9]+.*$"

Why dropping front .*? Are you sure this matches what we want - so
incorrect compatibles? To me it breaks the entire point of this select,
so I am sure you did not test whether it still works. To remind: this is
to select incorrect compatibles.

(?!wsa)
Because qcom,x-wsa8845 should be matched and cause warnings.

And probably we are getting past the point of readability, so could you
try:

compatible:
  anyOf:
    - pattern: "^qcom,.*(apq|ipq|mdm|msm|qcm|qcs|q[dr]u|sar|sc|sd[amx]|sm|x1[ep])[0-9]+.*$"
    - pattern: "^qcom,.*(?!wsa)sa[0-9]+.*$"



>    required:
>      - compatible
>  
> 
> -- 
> 2.47.2
> 

