Return-Path: <linux-gpio+bounces-27928-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3466DC293E8
	for <lists+linux-gpio@lfdr.de>; Sun, 02 Nov 2025 18:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3D03ACDCD
	for <lists+linux-gpio@lfdr.de>; Sun,  2 Nov 2025 17:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB7762DEA72;
	Sun,  2 Nov 2025 17:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jarIfixD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6461F15CD7E;
	Sun,  2 Nov 2025 17:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762104790; cv=none; b=nt3QQqI5gm9+lOGTh/lsDwnH9XLFfRifIwaZWyNOYEGZe9NomhSNu2j0q/qir8d0yPxWp+TWPuC0xaFJkQ0TnfItfSskzXoA0QUP1m/v7V106ijaEGGGQ3tyKLDx3a5mS1j9MH8eEEYFe/ARbnSkZE2fryPzJxHlRPQc3XpNnxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762104790; c=relaxed/simple;
	bh=XDRGroBej6AROeGYsn8quo6pJIWWvGn8+HVmd+688pM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rj9y8t6ZYDp8WAj7MjZCrjdWpIDIzjehpVcwv5TYmqYLd9C4NmU7QNeJURL+FRtNIcInWc3U9Oz5tcVmyuiiiqf5FmfiFeDR/lAz0WYDJf7NPMQR74LigBoiAOJa9AGm8qAMwH03Xg1/Y6/RdUtbCJIw1mozFAltwxx7s2ZxW2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jarIfixD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1225C4CEF7;
	Sun,  2 Nov 2025 17:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762104786;
	bh=XDRGroBej6AROeGYsn8quo6pJIWWvGn8+HVmd+688pM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jarIfixDh5isw/l05RqyQdGOeg4kxqXkSFCDISFO96MpBobQ9AiPIC5Yjs+jv0wVm
	 49/x3RDT1ERjASU5mk6t7ctsfsdzmtKPGXtqjhroapR5qn4SBzlUOLxjUcwQ1V/juH
	 XzZO4NPLqyDeZTZAsBeROjGLA5Ki5VZbykwuaCJfQTq2CPkdyuQoe0UzeBsnrUuJbS
	 DU9JR6CnA0WR7fFR4HaXJ9/v14YgIvfTdKBK2xc/3SaVH7PDhcAmXz8YoCEIQtRoLP
	 JUoHmI4nPERSu5agnK9SScuqd9OzzWPbPK6CGwoeTxJsye7uHysokp7Cj6l4HJfKi7
	 PysdSTQUG+3og==
Date: Sun, 2 Nov 2025 11:36:31 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
	Stephen Boyd <sboyd@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, ~postmarketos/upstreaming@lists.sr.ht, 
	phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 1/3] dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
Message-ID: <oc3pmctjyyijpz6lw33frlqgi7k23hadoekwaa7kak3wdez2tt@om5ybfv7pmoi>
References: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
 <20251023-sm7635-pmxr2230-v3-1-f70466c030fe@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-sm7635-pmxr2230-v3-1-f70466c030fe@fairphone.com>

On Thu, Oct 23, 2025 at 01:32:25PM +0200, Luca Weiss wrote:
> Document compatible for PM7550 Torch and Flash LED controller.
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

> ---
>  Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
> index bcf0ad4ea57e..05250aefd385 100644
> --- a/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
> +++ b/Documentation/devicetree/bindings/leds/qcom,spmi-flash-led.yaml
> @@ -24,6 +24,7 @@ properties:
>        - enum:
>            - qcom,pm6150l-flash-led
>            - qcom,pm660l-flash-led
> +          - qcom,pm7550-flash-led
>            - qcom,pm8150c-flash-led
>            - qcom,pm8150l-flash-led
>            - qcom,pm8350c-flash-led
> 
> -- 
> 2.51.1
> 

