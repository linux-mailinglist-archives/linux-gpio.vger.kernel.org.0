Return-Path: <linux-gpio+bounces-26422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D91B8D3AD
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 04:41:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2DC5E7AF7DA
	for <lists+linux-gpio@lfdr.de>; Sun, 21 Sep 2025 02:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2A791F91E3;
	Sun, 21 Sep 2025 02:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qlaHzz6W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7375DB672;
	Sun, 21 Sep 2025 02:41:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758422470; cv=none; b=aU9H2A2r+xLs2eIuN0E8GTdmG+c6RN1PxKQs0KrezVtMAZH6F252lGa1fElBe+oh0SHKFnO1kwVe1w27pB//Y+2w/bhY0hYKJ/Xc56RWM/HQoRwfkSpx4hHZrGiU24LerV4bCfjbr0v5vO1ZYk8LEWoaozbVgNGXkvHjNq9WpdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758422470; c=relaxed/simple;
	bh=WHVI3zam98eCtwHQ4w4qHUBottfzJI0Bz/jC+FZPTM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cx5afn6NvGyTiP4qyDjmxTJPDt9JUPC2Qh/8ZPVrbdKG2WrTTi/EGV4Ksy8glIjF/1jAExDafkYJtcQHi6B1VDh9jpQUQZ6/lXVQMvLf06uAGeCD4hYBVDYUgwDeDvP+3JSDTmJ1W6KYQBO0TocHJoTEcrGUt74ghy+wMZkL3GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qlaHzz6W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D7FC4CEEB;
	Sun, 21 Sep 2025 02:41:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758422470;
	bh=WHVI3zam98eCtwHQ4w4qHUBottfzJI0Bz/jC+FZPTM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qlaHzz6WDu05CaJSeVBF54HsisQIp2JfKEm2gouk6LmpTpRlemIkU7J6YrwlwFEuj
	 6MP1f3jqyytXZYXKF++ISIWnnp6BMzSlROxlFaAas6F/HfOuk4NWI8jbkQGNaEsqxK
	 Wi4JNYUe11iOEYF8Af9oNfk3O1dhaokROBYT9wLaCI6sRVaMBOLySpSYVIuD8JBASB
	 aofJ61EBW25V45gQOaa5mDLiFrP2qeojyGoCea3x3mfkVOj2iy3W9Iit3KftQ/EXg7
	 MEV/7CROoiSO3NtcEFrkEVx9y44NTzOhBjOerSPwNPreFlaEV54rJWuYsGv2wqhEhy
	 UDK5f4JKAlcCg==
Date: Sat, 20 Sep 2025 21:41:07 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: linus.walleij@linaro.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,pmic-gpio: Add GPIO bindings
 for Glymur PMICs
Message-ID: <mp2elkdhqg2fsmvebwbxbxr5jyasfpzi4b5kbfxkjjxv433thc@7codfe5sp7pv>
References: <20250919141440.1068770-1-pankaj.patil@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919141440.1068770-1-pankaj.patil@oss.qualcomm.com>

On Fri, Sep 19, 2025 at 07:44:40PM +0530, Pankaj Patil wrote:
> From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

This doesn't match the first signed-off-by.

> 
> Update the Qualcomm Technologies, Inc. PMIC GPIO binding documentation
> to include compatible strings for PMK8850, PMH0101, PMH0104, PMH0110
> and PMCX0102 PMICs.
> 

Looks good, but this should be sent together with the related driver
change.

Thank you,
Bjorn

> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> Signed-off-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
> ---
>  .../bindings/pinctrl/qcom,pmic-gpio.yaml          | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> index 5e6dfcc3fe9b..8ae4489637f3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
> @@ -59,7 +59,11 @@ properties:
>            - qcom,pmc8180-gpio
>            - qcom,pmc8180c-gpio
>            - qcom,pmc8380-gpio
> +          - qcom,pmcx0102-gpio
>            - qcom,pmd8028-gpio
> +          - qcom,pmh0101-gpio
> +          - qcom,pmh0104-gpio
> +          - qcom,pmh0110-gpio
>            - qcom,pmi632-gpio
>            - qcom,pmi8950-gpio
>            - qcom,pmi8994-gpio
> @@ -68,6 +72,7 @@ properties:
>            - qcom,pmiv0104-gpio
>            - qcom,pmk8350-gpio
>            - qcom,pmk8550-gpio
> +          - qcom,pmk8850-gpio
>            - qcom,pmm8155au-gpio
>            - qcom,pmm8654au-gpio
>            - qcom,pmp8074-gpio
> @@ -191,6 +196,8 @@ allOf:
>                - qcom,pm8950-gpio
>                - qcom,pm8953-gpio
>                - qcom,pmi632-gpio
> +              - qcom,pmh0104-gpio
> +              - qcom,pmk8850-gpio
>      then:
>        properties:
>          gpio-line-names:
> @@ -303,6 +310,8 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,pmcx0102-gpio
> +              - qcom,pmh0110-gpio
>                - qcom,pmi8998-gpio
>      then:
>        properties:
> @@ -318,6 +327,7 @@ allOf:
>          compatible:
>            contains:
>              enum:
> +              - qcom,pmh0101-gpio
>                - qcom,pmih0108-gpio
>      then:
>        properties:
> @@ -481,13 +491,18 @@ $defs:
>                   - gpio1-gpio22 for pm8994
>                   - gpio1-gpio26 for pm8998
>                   - gpio1-gpio22 for pma8084
> +                 - gpio1-gpio14 for pmcx0102
>                   - gpio1-gpio4 for pmd8028
> +                 - gpio1-gpio18 for pmh0101
> +                 - gpio1-gpio8 for pmh0104
> +                 - gpio1-gpio14 for pmh0110
>                   - gpio1-gpio8 for pmi632
>                   - gpio1-gpio2 for pmi8950
>                   - gpio1-gpio10 for pmi8994
>                   - gpio1-gpio18 for pmih0108
>                   - gpio1-gpio4 for pmk8350
>                   - gpio1-gpio6 for pmk8550
> +                 - gpio1-gpio8 for pmk8850
>                   - gpio1-gpio10 for pmm8155au
>                   - gpio1-gpio12 for pmm8654au
>                   - gpio1-gpio12 for pmp8074 (holes on gpio1 and gpio12)
> -- 
> 2.34.1
> 

