Return-Path: <linux-gpio+bounces-37716-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKTuFAm8Gmqq7wgAu9opvQ
	(envelope-from <linux-gpio+bounces-37716-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 12:29:29 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC6460C1CF
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 12:29:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7392C303CFAA
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2026 10:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B71739EB40;
	Sat, 30 May 2026 10:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fjf4pTTM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C150430567E;
	Sat, 30 May 2026 10:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780136960; cv=none; b=hnWvo/XIJ2Wvi83ajccBPf789x7VKUHwRPGSt+h47lf6MGV0hvG2dTKSaXSeCoLJ4brgI6/+pOa5lAa8GRInngaVTvI9FPOhsiB9giRIqJ3JlW7Il+RrhM9JbM2e5z6MfjTf/FXVZ7SPV5dsYQtLFzrlzguyA9ZOq4zVEgDTwfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780136960; c=relaxed/simple;
	bh=+1XMBaxsCA0xHAFruPYs8g9g8Blv9YMSVm9QFDbq65I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rD2Zl2t67jPAjVH/ploeDhANe152neAxEq+2Rr01ryJMOVDYrhihsujPBvGyprV71nW83DM3audYLsOvpHS7IAvOxM5T+FpEebSH5bm1+B9sdwI5lopAEqhPEB6UoeX1gqSzQcshwGu1gKqT6HsCUJDJUWJXviuYzGC3DcOLipA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fjf4pTTM; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D751F1F00893;
	Sat, 30 May 2026 10:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780136959;
	bh=jjpfZdY2qtJ73w7DanAQT33plGvxPTGB+G4bRF3mZTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fjf4pTTMZxXYxITDdr30Y6HWBeraYdqjoHSJzYZgTrsvJpCCdBOWk1pIXzgBxpHUB
	 Eze/KcHRIxASMcjhM2Elk6DC2cMttbaM66jUzIVFPty5Tvgg1HaYmf3Wt8KPe5nIvD
	 DtoBYn2tZxjghpTBc3c+xnENJvIaIHDOT+RQQKxPlpouxTrNapbcR0JhQgOhbGptxb
	 APt5AX4rgtFJTUDmHWK1ZuntIjWEpeZ0hEA6EG3JE5WiDBuh6pGtd7rYiDD6Yw/elg
	 CWimtHRy5N+Q5Rl3bE4Q1j5GRwEqjiK0IwEigPidwwdS80FKX5VU/9VhYMLc3dR0jR
	 BlB1J9ez7Edpg==
Date: Sat, 30 May 2026 12:29:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, David Collins <david.collins@oss.qualcomm.com>, 
	Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>, Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, kernel@oss.qualcomm.com, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] dt-bindings: pinctrl: qcom,pmic-gpio: Add
 level-shifter function
Message-ID: <20260530-thankful-maroon-boar-be86f8@quoll>
References: <20260528-pinctrl-level-shifter-v2-0-3a6a025392bf@oss.qualcomm.com>
 <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260528-pinctrl-level-shifter-v2-2-3a6a025392bf@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37716-lists,linux-gpio=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email]
X-Rspamd-Queue-Id: DEC6460C1CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 06:05:36PM -0700, Fenglin Wu wrote:
> Add the "level-shifter" function and add the required DT properties to
> allow RPMh firmware to control the level-shifter. Introduce a custom
> pinconf parameter "qcom,1p2v-1p8v-ls-en" for enabling or disabling the
> level-shifter function.

I don't get how PMIC, which is not a child of RPMh at all or not
talking with RPMh RSC, needs to configure its pin via RPMh. It feels it
is misrepresented.

> 
> Additionally, add the "groups" property with the allowed group names
> that can be used to control the level-shifter function on pmh0101.
> 
> Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 66 +++++++++++++++++++++-
>  include/dt-bindings/pinctrl/qcom,pmic-gpio.h       |  1 +
>  2 files changed, 64 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> index b8109e6c2a10..19dc61ddff2d 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -119,6 +119,21 @@ properties:
>        The first cell will be used to define gpio number and the
>        second denotes the flags for this gpio
>  
> +  qcom,rpmh:
> +    description:
> +      Phandle to the RPMh controller device. Required for PMICs when the
> +      bidirectional level shifters is used (e.g., pmh0101), to enable
> +      communication with RPMh firmware for level shifter control.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  qcom,pmic-id:
> +    description:
> +      The ID of the PMIC which supports bidirectional level shifter function.
> +      It is used as the RPMh resource name suffix to request control of the
> +      level shifter to the RPMh firmware.
> +    $ref: /schemas/types.yaml#/definitions/string
> +    pattern: "^[A-N]_E[0-3]+$"

You do not get instance IDs (it's explcitly documented in docs).

> +
>  additionalProperties: false
>  
>  required:
> @@ -330,6 +345,22 @@ allOf:
>            contains:
>              enum:
>                - qcom,pmh0101-gpio
> +    then:
> +      properties:
> +        gpio-line-names:
> +          minItems: 18
> +          maxItems: 18
> +        gpio-reserved-ranges:
> +          minItems: 1
> +          maxItems: 9
> +        qcom,rpmh: true
> +        qcom,pmic-id: true
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
>                - qcom,pmih0108-gpio
>      then:
>        properties:
> @@ -523,6 +554,19 @@ $defs:
>          items:
>            pattern: '^gpio([0-9]+)$'
>  
> +      groups:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        description:
> +          List of GPIO groups to apply properties to. Only valid for
> +          function "level-shifter" on pmh0101. Valid groups are
> +          gpio11, gpio12; gpio13, gpio14; gpio15, gpio16; gpio17, gpio18.
> +        items:
> +          enum:
> +            - gpio11, gpio12
> +            - gpio13, gpio14
> +            - gpio15, gpio16
> +            - gpio17, gpio18
> +
>        function:
>          items:
>            - enum:
> @@ -536,6 +580,7 @@ $defs:
>                - dtest4
>                - func3  # supported by LV/MV GPIO subtypes
>                - func4  # supported by LV/MV GPIO subtypes
> +              - level-shifter  # supported only by pmh0101
>  
>        bias-disable: true
>        bias-pull-down: true
> @@ -592,9 +637,24 @@ $defs:
>            configured as digital input.
>          enum: [1, 2, 3, 4]
>  
> -    required:
> -      - pins
> -      - function
> +      qcom,1p2v-1p8v-ls-en:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description:
> +          Enable or disable the bidirectional 1.2V/1.8V level shifter
> +          associated with the specified GPIO group. When set to 1, an RPMh
> +          vote is sent to AOP to enable the level shifter. When set to 0,
> +          the vote is withdrawn. Only valid when function is "level-shifter"
> +          and groups is a level-shifter GPIO pair (e.g., "gpio11, gpio12"
> +          on pmh0101).

And there are no generic pinconf properties defining the voltage?

Best regards,
Krzysztof


