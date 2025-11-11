Return-Path: <linux-gpio+bounces-28358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A91C4ECC7
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 16:35:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B14B33A9B09
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 15:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9801836654A;
	Tue, 11 Nov 2025 15:31:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C3kE4ClJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 299A735F8D7;
	Tue, 11 Nov 2025 15:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762875094; cv=none; b=GdmYsbYmvNSxh/bWYOSs3v1xL6F6hNZ4BEPprvdn1FvznUMjBtX3MeE3mg8pYWpziH7KV4g9YyJxMXi77ZNYIvI1bUZ2k8toZCmb9DtNttssO9Aas5wViPxxjRTKR/EX6zOD5vgzUJlqNalzyOfNpC6lt30nIo2A4yRiCuIQn0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762875094; c=relaxed/simple;
	bh=4UJ1g/RrS+1ok3QrqJbUIP9v0jFKaMDfl7/AKpbi0Ts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdV/0YnbJzIEyoKYl+XHqVzcF0xBHUbd8LRWNDvvecGMxeZTJqQtPOxRhLkYgygFYCViO9ZT+/6T5jzFkqjljyLKiHszhybGnFFMTHoawGeXyejt2Yyx+KysYQPmkGYtGdgfQ+wfmO0xI3AQeLU+4AfDt4tAsugH1FS9fpS6GKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C3kE4ClJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C218FC19422;
	Tue, 11 Nov 2025 15:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762875092;
	bh=4UJ1g/RrS+1ok3QrqJbUIP9v0jFKaMDfl7/AKpbi0Ts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C3kE4ClJ9ge3PmupH8qGcfzs6GX2cnMkEQ+8Qe0tnSB90r6kana3akA4DX909CPnb
	 Qxfy29plOEbifdRwWnq4a/Miy+W+AE8cvSmYGgoOw3ZKc9jfyl2npUUj1KS1PnD9f/
	 qiP3BELSI5m2gMnBUZLr0XGw0m97s/6vSsefGggrgcOlA06SZMRR3eqrzIMn25/uOJ
	 254AOx5GFlvZp9jY02BXzKXB0ZOBmP2qCZNqvmgql5TBET5sKpPiX3eFnAt0Gowecb
	 RYEksejsE4tyfVECaDAZlbdKRt5BSs0Tgpz//Akil9t1xx5l2ifBjronUXeeYLpnzM
	 5355npDMkjuOg==
Date: Tue, 11 Nov 2025 09:35:43 -0600
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
Message-ID: <z2oh7r56b7w3genfbq4jj24nvjehmnncufwwp6oj6duhafdaja@f2dle7jfao7e>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
 <20251110101043.2108414-3-praveen.talari@oss.qualcomm.com>
 <l2jnveusblgo5cfou3mx3usn7qgenj65wfyrnycmaqamkvhkee@gy745hkc3poc>
 <5cd78217-8da9-4290-b098-8210280e65d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5cd78217-8da9-4290-b098-8210280e65d8@oss.qualcomm.com>

On Tue, Nov 11, 2025 at 10:52:25AM +0530, Praveen Talari wrote:
> Hi Bjorn,
> 
> Thank you for review.
> 
> On 11/11/2025 9:38 AM, Bjorn Andersson wrote:
> > On Mon, Nov 10, 2025 at 03:40:41PM +0530, Praveen Talari wrote:
> > > Replace disable_irq() with disable_irq_nosync() in msm_pinmux_set_mux()
> > > to prevent potential deadlock when wakeup IRQ is triggered on the same
> > 
> > "potential"? In what case will calling disable_irq() from the irq
> > handler of that irq not deadlock?
> > 
> > > GPIO being reconfigured.
> > > 
> > > The issue occurs when a wakeup IRQ is triggered on a GPIO and the IRQ
> > > handler attempts to reconfigure the same GPIO's pinmux. In this scenario,
> > > msm_pinmux_set_mux() calls disable_irq() which waits for the currently
> > > running IRQ handler to complete, creating a circular dependency that
> > > results in deadlock.
> > > 
> > > Using disable_irq_nosync() avoids waiting for the IRQ handler to
> > > complete, preventing the deadlock condition while still properly
> > > disabling the interrupt during pinmux reconfiguration.
> > > 
> > > Suggested-by: Prasad Sodagudi <prasad.sodagudi@oss.qualcomm.com>
> > 
> > That's weird, I debugged your deadlock for you and told you to make this
> > very change in:
> > 
> > https://lore.kernel.org/all/7sxsfyu2kqbycyfftwfhrncwk3dfnubmzhyi2rqi3jtvi5qsnh@bya3cii45zhn/
> > 
> > So I guess Prasad told you how to fix this issue before I invested the
> > time helping you?
> 
> Yes, that’s correct. Prasad had suggested it earlier.
> 

Okay, then this patch looks good.

Regards,
Bjorn

> Thanks,
> Praveen Talari
> 
> > 
> > 
> > Change looks good, and description captures the problem.
> > 
> > Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> > 
> > Regards,
> > Bjorn
> > 
> > > Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> > > ---
> > >   drivers/pinctrl/qcom/pinctrl-msm.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > index 67525d542c5b..e99871b90ab9 100644
> > > --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> > > +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> > > @@ -189,7 +189,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
> > >   	 */
> > >   	if (d && i != gpio_func &&
> > >   	    !test_and_set_bit(d->hwirq, pctrl->disabled_for_mux))
> > > -		disable_irq(irq);
> > > +		disable_irq_nosync(irq);
> > >   	raw_spin_lock_irqsave(&pctrl->lock, flags);
> > > -- 
> > > 2.34.1
> > > 

