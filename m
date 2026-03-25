Return-Path: <linux-gpio+bounces-34174-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sRN1MOtoxGlEzAQAu9opvQ
	(envelope-from <linux-gpio+bounces-34174-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 23:59:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AD9332D358
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 23:59:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 87E6630224CD
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2026 22:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC7D238F635;
	Wed, 25 Mar 2026 22:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uEayiGdL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9E87DA66;
	Wed, 25 Mar 2026 22:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774479592; cv=none; b=cuBAg39UahuZ0StlnDXiFfJN+AzXr/5twwUk65FvgYBagZJouc1kZ3nDqsg+TMdpZ2UZNvyb23FXevwl+/KK8tPNz6/3Iqt1bIhsq1n4uIrrdrg3hV7RHzj7Wlu0ZBqb6SRH5pO4RZzHw2VHrxxPKWAsInL2YHZbDH9Ck1IgS04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774479592; c=relaxed/simple;
	bh=tg6uS2NQ9KcwGis4vKx40sO+FrPBh1NN362QU07kJyk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P8UAxAg0nX6OGoZ9O29f7dvCZqq39gpmT6FLAoEHMrg5YQ67qoOB8fTsPOPOCePZY1uv90mcgDxMc1ESFKQXtm/+48gVAn8GGaN1DMwyCHkpQ08ambQzNX31ugz7WAkA+FVJ3WmJmq/HqwWlRsSaLMNE4mQoO17gWSPx0IZeq+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uEayiGdL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FFA7C2BC9E;
	Wed, 25 Mar 2026 22:59:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774479592;
	bh=tg6uS2NQ9KcwGis4vKx40sO+FrPBh1NN362QU07kJyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uEayiGdL5cY00UsjxRrPaNr1vbsLWamrI2WigZ6KifJ+jJEMy2qQCDjMreuYqjGQk
	 tS9rosklZxxmVIIRfzhZILYoZZZ/AhyY1xWu3R2sXvah959mtUDE3aePA1+cj5r3wB
	 Vdpnhx6ctMBJ1kt9DqMEVghPz8D9KTyZvRJaK8oQrHot9bDM0FAFMsEuQcfocaFbwj
	 uTZU9634wBe3dxfGXQ2W9ZOb5oZ6c+MrQM5BJBLT8+d/D9ka4Y9nzN3d1H8x+KpoI4
	 KNSbYU101qgXyvilhJe/6MGI9as7qHRod/HKcDyaufanwQ2STwC36pGGxuDifX8Z5Q
	 a04Vtc6xYlleQ==
Date: Wed, 25 Mar 2026 17:59:48 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Introduce TLMM driver for Qualcomm IPQ5210 SoC
Message-ID: <acRo180cptltvk9Y@baldur>
References: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ipq5210_tlmm-v3-0-3a4b9bb6b1fc@oss.qualcomm.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34174-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5AD9332D358
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 01:05:14PM +0530, Kathiravan Thirumoorthy wrote:
> The IPQ5210 is Qualcomm's SoC for Routers, Gateways and Access Points.
> Add the pinctrl support for the same.
> 
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> ---
> Changes in v3:
> - Grouped the QUP SE pins instead of mentioning by function wise
> - Splitted the PWM functions which I messed up in V2
> - Audio primary and secondary mclk function names are expanded to avoid the
>   confusion
> - Dropped the R-b tags due to the above changes
> - Link to v2: https://lore.kernel.org/r/20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com
> 
> Changes in V2:
> - Split the TLMM changes into separate series
> - Picked up the R-b tags
> - Grouped the led and pwm pins for better readability and usability
> - Link to v1:
>   https://lore.kernel.org/linux-arm-msm/20260311-ipq5210_boot_to_shell-v1-0-fe857d68d698@oss.qualcomm.com/
> 
> ---
> Kathiravan Thirumoorthy (2):
>       dt-bindings: pinctrl: qcom: add IPQ5210 pinctrl
>       pinctrl: qcom: Introduce IPQ5210 TLMM driver
> 
>  .../bindings/pinctrl/qcom,ipq5210-tlmm.yaml        | 123 +++
>  drivers/pinctrl/qcom/Kconfig.msm                   |   8 +
>  drivers/pinctrl/qcom/Makefile                      |   1 +
>  drivers/pinctrl/qcom/pinctrl-ipq5210.c             | 898 +++++++++++++++++++++
>  4 files changed, 1030 insertions(+)
> ---
> base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
> change-id: 20260317-ipq5210_tlmm-df221be105b5
> 
> Best regards,
> --  
> Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
> 

