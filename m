Return-Path: <linux-gpio+bounces-8147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7981C92C37D
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 20:47:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 31B4D2835B6
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jul 2024 18:47:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC28180036;
	Tue,  9 Jul 2024 18:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AKxaEiiZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AC51B86C0;
	Tue,  9 Jul 2024 18:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720550853; cv=none; b=NtCFklFE9t4mzL5EX0/MQrAF5BrGCwk1+ZQTZaG8DmlafjAu2BFxxqB40T3JxMEbRKEtYYnOCxWXph1WVnCMuDzxb4YIPrm/Bno+7n2YbKAN7UksAY6k2ODJSxHGwe7SF97yUdeMlRFhYw/xXN7oyD9GhTALS1oo4JBaR1vtKF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720550853; c=relaxed/simple;
	bh=7ye7ltyXbYOYYi8uAxpAmR2GIyPSMjM7g8VmAI3m74Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yn3TwIHbyKUWQ+9zxGtLGCXYYlvp2dgEER0t3RSFuuJpDqjnkjFJi8eJkpstRvQ/juckxTKgGJz9Q2kQkk2iAAYYFp+UAQFyU0vzduy2MXREND/jgSA4dodyp7FGEr0uDqN6GCWbae8PT2StyX6JHqw8BNhnD4e5eTW+ly8/ZRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AKxaEiiZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59F36C3277B;
	Tue,  9 Jul 2024 18:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720550850;
	bh=7ye7ltyXbYOYYi8uAxpAmR2GIyPSMjM7g8VmAI3m74Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AKxaEiiZdtZv72eh/8HcEMtgL6askaomDjzh73Zmd585jJ9eTgjA8y605uew+GyXq
	 BjVzXnTa25OtDMbvRzghMEoaZSm1+ncjkNet75r5zoxZdl3TOyqPMDXXFj0NIZcmzC
	 C4TEBMPOgR9YjvEpUd1osYwGFrbsBKmsco8O8DLXeeGY//0GxFhujmJCxeaPez7SW3
	 WY4tI7PURsponiYKUn94muFFNDz0CzfCfgnXc5TRN8r9d6r6uwy6hsgp8bN34Pg5IP
	 8AfY1UR94wrAFkDc1hKCm/h/s4EFN8h2XUmt2OBSc8FAslyq0lyh2M84LHzJmnqQaF
	 Wkys6UfkIASfA==
Date: Tue, 9 Jul 2024 13:47:14 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Rayyan Ansari <rayyan.ansari@linaro.org>
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 0/4] dt-bindings: pinctrl: convert remaining qcom
 bindings to yaml
Message-ID: <yyxc3ldrgphgp65fydziyswbvrhdkcacsnpw5mfqddglxecpun@rjrxj3ffpxnw>
References: <20240709162009.5166-1-rayyan.ansari@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240709162009.5166-1-rayyan.ansari@linaro.org>

On Tue, Jul 09, 2024 at 05:17:52PM GMT, Rayyan Ansari wrote:
> Hi,
> The following patches convert all remaining old text bindings for
> Qualcomm pinctrl to yaml, so device trees can be validated against the
> schema.
> 

Thanks for fixing these up!

I think it would have been good to use andersson@kernel.org as the
maintainer address, but I see the other bindings have the broken address
as well, so I can follow up with a patch to change them all.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Thanks,
> Rayyan
> 
> Rayyan Ansari (4):
>   dt-bindings: pinctrl: qcom,apq8064-pinctrl: convert to dtschema
>   dt-bindings: pinctrl: qcom,ipq8064-pinctrl: convert to dtschema
>   dt-bindings: pinctrl: qcom,ipq4019-pinctrl: convert to dtschema
>   dt-bindings: pinctrl: qcom,apq8084-pinctrl: convert to dtschema
> 
>  .../bindings/pinctrl/qcom,apq8064-pinctrl.txt |  95 ---------
>  .../pinctrl/qcom,apq8064-pinctrl.yaml         | 110 ++++++++++
>  .../bindings/pinctrl/qcom,apq8084-pinctrl.txt | 188 ------------------
>  .../pinctrl/qcom,apq8084-pinctrl.yaml         | 129 ++++++++++++
>  .../bindings/pinctrl/qcom,ipq4019-pinctrl.txt |  85 --------
>  .../pinctrl/qcom,ipq4019-pinctrl.yaml         | 102 ++++++++++
>  .../bindings/pinctrl/qcom,ipq8064-pinctrl.txt | 101 ----------
>  .../pinctrl/qcom,ipq8064-pinctrl.yaml         | 108 ++++++++++
>  8 files changed, 449 insertions(+), 469 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8064-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,apq8084-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq4019-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/qcom,ipq8064-pinctrl.yaml
> 
> -- 
> 2.45.2
> 

