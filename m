Return-Path: <linux-gpio+bounces-28339-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22ADEC4B675
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 05:05:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28DCC3B81F2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 04:04:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72AE42EDD53;
	Tue, 11 Nov 2025 04:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y6zKlGzi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121F320ED;
	Tue, 11 Nov 2025 04:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762833841; cv=none; b=kVaFIiX+uHTtq4NAY34iu7ViK6kYWQfSM8p/LWIJJVF2MFvTaBwg2GoGLIykXlkapmWSiLW+v1+cDSJAcKJXa3nQjTcNFAcpuvu0fnPnWpIW1E6wiYPi8jC3PEGnigrS6MUtJabzbWI7sqOdwdkXVUU5J86jYAflnVEpYySOQE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762833841; c=relaxed/simple;
	bh=5yESDvzUI5BgeeIMK00M3a30TNEx4W3yOd0yGANujh8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PhKpY+s7ygCKtbaEJjXinDahm73MCweQefu4PBSlc65YczAOlyca38G1Ui/k3lGOPje3kFJvBmErHFLKHOAbgoQRWBImaGyfyWS1Ef9a20HI/qZzYtNafShTfAe+qKK8zl/StBb5t5PO4KdrQOUr7I6fWkajTWLiDINIMBpe6vI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y6zKlGzi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98C4DC4CEFB;
	Tue, 11 Nov 2025 04:03:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762833840;
	bh=5yESDvzUI5BgeeIMK00M3a30TNEx4W3yOd0yGANujh8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6zKlGziGHfGlLWxf6kkVE4MRCuw25GMSHNKVoNyXdCpQRQy9bLVF7Jaib+ALvHlq
	 R/hSrXo3CXDs6QO70gzLiIwo6arusnv1TnLlsaFrPdjWKxnSqim92EV9sn028Hlzpu
	 cylLYdGwV88NOJp2M2ccDBnvA4+bLYxyzHKsrbXmIgRPFziDktH73pBkZTq61hIffw
	 ZZNBrxX3defk7itPm3t1M7gpC687YEVwLH8j3E2xxWQ21vQOYA4UpG9RL7krKi/K8M
	 YMssT2V4jiAtkI5aU1UWtb/9SeTEnK70LrR9l8yxKfk2UIjw2sdDbq/3CvFBQCRlON
	 HLQLWBLF/6TMw==
Date: Mon, 10 Nov 2025 22:08:08 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-serial@vger.kernel.org, alexey.klimov@linaro.org, 
	krzk@kernel.org, bryan.odonoghue@linaro.org, jorge.ramirez@oss.qualcomm.com, 
	dmitry.baryshkov@oss.qualcomm.com, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com, 
	quic_vtanuku@quicinc.com, quic_arandive@quicinc.com, quic_shazhuss@quicinc.com, 
	quic_cchiluve@quicinc.com, Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
Subject: Re: [PATCH v1 2/4] pinctrl: qcom: msm: Fix potential deadlock in
 pinmux configuration
Message-ID: <l2jnveusblgo5cfou3mx3usn7qgenj65wfyrnycmaqamkvhkee@gy745hkc3poc>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-3-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110101043.2108414-3-praveen.talari@oss.qualcomm.com>

On Mon, Nov 10, 2025 at 03:40:41PM +0530, Praveen Talari wrote:
> Replace disable_irq() with disable_irq_nosync() in msm_pinmux_set_mux()
> to prevent potential deadlock when wakeup IRQ is triggered on the same

"potential"? In what case will calling disable_irq() from the irq
handler of that irq not deadlock?

> GPIO being reconfigured.
> 
> The issue occurs when a wakeup IRQ is triggered on a GPIO and the IRQ
> handler attempts to reconfigure the same GPIO's pinmux. In this scenario,
> msm_pinmux_set_mux() calls disable_irq() which waits for the currently
> running IRQ handler to complete, creating a circular dependency that
> results in deadlock.
> 
> Using disable_irq_nosync() avoids waiting for the IRQ handler to
> complete, preventing the deadlock condition while still properly
> disabling the interrupt during pinmux reconfiguration.
> 
> Suggested-by: Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>

That's weird, I debugged your deadlock for you and told you to make this
very change in:

https://lore.kernel.org/all/7sxsfyu2kqbycyfftwfhrncwk3dfnubmzhyi2rqi3jtvi5qsnh@bya3cii45zhn/

So I guess Prasad told you how to fix this issue before I invested the
time helping you?


Change looks good, and description captures the problem.

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 67525d542c5b..e99871b90ab9 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -189,7 +189,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  	 */
>  	if (d && i != gpio_func &&
>  	    !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
> -		disable_irq(irq);
> +		disable_irq_nosync(irq);
>  
>  	raw_spin_lock_irqsave(&pctrl->lock, flags);
>  
> -- 
> 2.34.1
> 

