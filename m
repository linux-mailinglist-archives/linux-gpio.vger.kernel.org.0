Return-Path: <linux-gpio+bounces-27927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D77EC293B1
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 18:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 617EA4E6B79
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 17:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B292D2DC777;
	Sun,  2 Nov 2025 17:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VoGdl9ap"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61AED21A459;
	Sun,  2 Nov 2025 17:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762104519; cv=none; b=hs1L4AOuRt6xeXQCQarZfNPyRvUjHzt2i5nyJ4LRnNmZg1qeaGM8k+xQSWZL6fIQ+NlbgIcfEWkY/aFU2nih/l9aCo35keQhGxF6DB14E9TxlrQn604YsbDyjcLlRcGtChpTWbIDnVHDWXCzkBQUQRroasF1/UgQz5qZ4ZItgnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762104519; c=relaxed/simple;
	bh=OcFwHvlXYWH66gsDoECiVrdxJwq5gFiy4jrIhapatU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K7w5PP2fOmxLIsypbpbgMXJXbWNR2JAwzDtGVKirP7oYH2ivF1TcOdzE07OFFgwFkJWG++3BWbNMaKCRyc3lgD62TjLKOpWgkYz3ADM6lHh3PPD4G1oND+R2RJyW1G2Wcd2xVPtU32zx8HDHrO3AQ0V08bxZOcO+6V5o00erARQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VoGdl9ap; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DCAF0C4CEF7;
	Sun,  2 Nov 2025 17:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762104518;
	bh=OcFwHvlXYWH66gsDoECiVrdxJwq5gFiy4jrIhapatU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VoGdl9ap/snoiJrAUypQcBLQieAI1kXPRAY5K6/H4I3uKEc0buc5743hmDZLNyBqU
	 Uw+J7+LiK2od6QFY5rgnanBBLhF1L6urlzd/Irul0fTO2rUAHJfRhE+OGbl7ADTDSF
	 m8lI7B7kDllFxpjQf+H06vEFf0Lmrxx/5Nq96kXL6uQpZKAxjJKAKc1htLOPvI6wv3
	 RzKdEBpI7QDygJPs2MvXWpbioN2uQiaO4NU0zlk5tgbPYg/u+cYgpFXWCOP2f7RfZk
	 1CM1loBJfqr+EyJBi9R0pt54Xqu+eCpntlw1hUTCIyavChXBczD4ra2MowkMwcEnNE
	 Byy0ZMXdssctw==
Date: Sun, 2 Nov 2025 11:32:03 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: mfd: qcom,spmi-pmic: Document
 PMIV0104
Message-ID: <ivfeokfjdtdmdctjpk2ckxdumefj6ff3q2rycbrqwo5ewq4x4k@az7wisyy2xa6>
References: <20251023-sm7635-pmiv0104-v3-0-27f1c417376d@fairphone.com>
 <20251023-sm7635-pmiv0104-v3-1-27f1c417376d@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-sm7635-pmiv0104-v3-1-27f1c417376d@fairphone.com>

On Thu, Oct 23, 2025 at 01:29:01PM +0200, Luca Weiss wrote:
> Add the PMIV0104 PMIC which is found on e.g. boards with Milos SoCs.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
>  Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> index 078a6886f8b1..c416f25c90d6 100644
> --- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> +++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> @@ -84,6 +84,7 @@ properties:
>            - qcom,pmi8994
>            - qcom,pmi8998
>            - qcom,pmih0108
> +          - qcom,pmiv0104
>            - qcom,pmk8002
>            - qcom,pmk8350
>            - qcom,pmk8550
> 
> -- 
> 2.51.1
> 

