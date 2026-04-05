Return-Path: <linux-gpio+bounces-34675-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OCnGFIIR0mlVTAcAu9opvQ
	(envelope-from <linux-gpio+bounces-34675-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 09:38:42 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1186F39DA62
	for <lists+linux-gpio@lfdr.de>; Sun, 05 Apr 2026 09:38:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1B643009F37
	for <lists+linux-gpio@lfdr.de>; Sun,  5 Apr 2026 07:38:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A1D03559D6;
	Sun,  5 Apr 2026 07:38:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Iv+G8JE1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0825C1A9FB7;
	Sun,  5 Apr 2026 07:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775374714; cv=none; b=WiiyaD+7CMGlUDk9DfuMqjcw8rHnXnLRYn8CS08yfxkRJ0iCsloqXrEuoBKbbofDlKtcliHw1kz9a1jisBHG6wxU0d02SjqE5V5FNnEpy539WYKyKPJqn0t+BmykrFDOM6HEPTgZBcx4pCf/qWtvt0b9JKgkX0USmtNXWvr2wXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775374714; c=relaxed/simple;
	bh=OwcwXniupGprGdJDwCn+eH/DBAf8FCEkpPX0H7B118c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uTOi3Wx1Fsq4Vc+uOFCWAWBYOZBcm55Om/JB585mVvqMMxE+8yLafhMo0yFNpir1K9KUGKCb3Z+Vo/hU0nHvhAhv1bkzYQcmn3ulphYyEnHgJznkFor3zxHidPmC2OllV854gE6rpkWg6kTu+dL55D2fucVg4e/rUAm4P89P83I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Iv+G8JE1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A28FC116C6;
	Sun,  5 Apr 2026 07:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775374713;
	bh=OwcwXniupGprGdJDwCn+eH/DBAf8FCEkpPX0H7B118c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Iv+G8JE1mBM42WyuJ9BmPic09CFbRwYVaN2hS67Our1G5RzszX2qg/5RV4owQ8+76
	 riLdmUR8DApIy4WrqlOshmd0ewMuymlbd5Zyxft2BDVIRmGk6/Wu06yXFt5srVeqP3
	 IfZB4snvuM7Tj7cDFkIzbiZBjADviN+vD+yOaTpLaKjL4YiXrcGw+y7y8Qmk7zg/s7
	 UfUApUAVJaWlx3guzaASJa2xWS5MiHMQ2xQkwbljF727ig0unE+/TVEc8Tz3MBiv+1
	 zs5+VUufOduQPLvHt9+ZFk3cWyH1OovAvHdNWt3JcqNzRlilM87hgSs3AUB199dLtj
	 2zz/+o+yYFIKQ==
Date: Sun, 5 Apr 2026 09:38:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, Arnd Bergmann <arnd@arndb.de>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: describe the TLMM controller
 on Qualcomm Nord platforms
Message-ID: <20260405-burrowing-magnificent-cougar-a923aa@quoll>
References: <20260403-nord-tlmm-v1-0-4864f400c700@oss.qualcomm.com>
 <20260403-nord-tlmm-v1-1-4864f400c700@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260403-nord-tlmm-v1-1-4864f400c700@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34675-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,oss.qualcomm.com,arndb.de,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,devicetree.org:url]
X-Rspamd-Queue-Id: 1186F39DA62
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 03:27:55PM +0200, Bartosz Golaszewski wrote:
> Add a DT binding document describing the TLMM pin controller available
> on the Nord platforms from Qualcomm.

That's the first time name Nord appears on the lists (except OnePlus
Nord!) and I do not see soc-info with explanation. I know what the Nord
is, but others might not, and if I complain to other patchsets that way
I should complain also here.

The easiest is to send soc-info patch with explanations before this one.

> 
> Co-developed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,nord-tlmm.yaml           | 206 +++++++++++++++++++++
>  1 file changed, 206 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..b1fdaa24a045469e3dec512ce0200f240daa1959
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,nord-tlmm.yaml
> @@ -0,0 +1,206 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/qcom,nord-tlmm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm Technologies, Inc. Nord TLMM block
> +
> +maintainers:
> +  - Bartosz Golaszewski <brgl@kernel.org>
> +
> +description: |

Drop |

> +  Top Level Mode Multiplexer pin controller in Qualcomm Nord SoC.
> +
> +allOf:
> +  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,nord-tlmm
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  gpio-reserved-ranges:
> +    minItems: 1
> +    maxItems: 74

I guess rather 90 (half of gpios could be reserved in theory...)

> +
> +  gpio-line-names:
> +    maxItems: 180

pattern in "pins" says 181 gpios.

> +
> +patternProperties:
> +  "-state$":
> +    oneOf:
> +      - $ref: "#/$defs/qcom-nord-tlmm-state"
> +      - patternProperties:
> +          "-pins$":
> +            $ref: "#/$defs/qcom-nord-tlmm-state"
> +        additionalProperties: false
> +
> +$defs:
> +  qcom-nord-tlmm-state:
> +    type: object
> +    description:
> +      Pinctrl node's client devices use subnodes for desired pin configuration.
> +      Client device subnodes use below standard properties.
> +    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
> +    unevaluatedProperties: false
> +
> +    properties:
> +      pins:
> +        description:
> +          List of gpio pins affected by the properties specified in this
> +          subnode.
> +        items:
> +          oneOf:
> +            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-7][0-9]|180])$"

Best regards,
Krzysztof


