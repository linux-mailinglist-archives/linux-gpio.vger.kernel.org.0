Return-Path: <linux-gpio+bounces-31161-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wI21H73JeGmNtQEAu9opvQ
	(envelope-from <linux-gpio+bounces-31161-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 15:20:45 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF3E95893
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 15:20:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9D863085B28
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Jan 2026 14:17:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BEC02BEFFB;
	Tue, 27 Jan 2026 14:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qjmw469Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0C57284883;
	Tue, 27 Jan 2026 14:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769523461; cv=none; b=UvucbLqOxQ8ZHhD5lPd1aXIZJMnieiEx8Y9YrTWM2Lb7KNVi7dOf/Y2TmlVxFy5MfF5s8mA3xHtR7XF9O9vbdchP6eLuX1PzElblX7QvEIaXOubE9/diQ2mi0CUz/44ZzRgXntgniSZVKNIMm+yhPTdGZ+MOvccXV+xB8DS1Zso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769523461; c=relaxed/simple;
	bh=6RbS3lq83MUvqvXbpS/fqmTiQO3rUelLTxFVy+AhT9w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sYDAqERyRWbx1h4419Fufmuuyov5y8QMUWfyCPF7YZMMtYOdA3/hILrltTqe4Cz3CHIj2wEfKlwyUmI+1zjkatdtQM74mnFJjfnBG8tr4BDbXcu3ktOqcxptxt9HnLlLIS861LuVRJ7YrsRLFKKVVz59IqPGSKkDlA4tqNx0NtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qjmw469Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 878A7C116C6;
	Tue, 27 Jan 2026 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769523461;
	bh=6RbS3lq83MUvqvXbpS/fqmTiQO3rUelLTxFVy+AhT9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qjmw469Qb8tRmK1hTgMyz5TmDgi2kY/hL8sEeYWOIYG4jrJeBle28BKtG/TuBC+Go
	 eTSTVc8XnRjIc59p4lgv7geyu62HnwlQYS+ABiW0WtEx/7d7qnHjQfMrVRMl9VGXxi
	 K9kCvkMEBBNARtpyTYIXQ6cXrEaOPUbX9K0jRCvlagc6q4rsv1XtjD7rsbHvH3yiID
	 PdFnD63XkcOtbjpXnSh59ihd7BCxFahLg5JaIuGsg4Y+vjEUrjROebHQnvC36X7Pt8
	 eLLWzKPk9hbs6lzKwsDu/tf26YQ52Deluy3LXaNAaeYlQG0B0648tAcoj6fx7osS2X
	 KdRqplkHn5nJw==
Date: Tue, 27 Jan 2026 08:17:40 -0600
From: Rob Herring <robh@kernel.org>
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] dt-bindings: pinctrl: qcom,sm8450-lpass-lpi-pinctrl:
 Add SA8775P and QCS8300 pinctrl
Message-ID: <20260127141740.GA1574044-robh@kernel.org>
References: <20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127105511.3917491-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31161-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 1BF3E95893
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:25:11PM +0530, Mohammad Rafi Shaik wrote:
> Document compatible for Qualcomm SA8775P and QCS8300 SoC LPASS TLMM
> pin controller, fully compatible with previous SM8450 generation
> (same amount of pins and functions).
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
> changes in [v3]:
>  - Removed the duplicate driver code patch as suggested by Krzysztof.
>  - Reused the existing SM8490 pinctrl, which is fully compatible with SA8775P and QCS8300.
>  - Link to V2: https://lore.kernel.org/all/20260107192007.500995-1-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> changes in [v2]:
>  - Fixed dt-binding errors reported by Krzysztof and Rob.
>  - Added proper slew rate value for wsa2_swr_data GPIO, as suggested by Konrad.
>  - Documented Monaco compatible as suggested by Konrad.
>  - Link to V1: https://lore.kernel.org/all/20251116171656.3105461-1-mohammad.rafi.shaik@oss.qualcomm.com/
> ---
>  .../pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml         | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
> index e7565592d..354629c38 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,sm8450-lpass-lpi-pinctrl.yaml
> @@ -15,7 +15,15 @@ description:
>  
>  properties:
>    compatible:
> -    const: qcom,sm8450-lpass-lpi-pinctrl
> +    oneOf:
> +      - const: qcom,sm8450-lpass-lpi-pinctrl
> +      - items:
> +          - enum:
> +              - qcom,qcs8300-lpass-lpi-pinctrl
> +              - qcom,sa8775p-lpass-lpi-pinctrl
> +          - const: qcom,sm8450-lpass-lpi-pinctrl
> +        minItems: 1
> +        maxItems: 2

No. You are either backwards compatible with sm8450 or you aren't. The 
h/w is fixed.

Rob

