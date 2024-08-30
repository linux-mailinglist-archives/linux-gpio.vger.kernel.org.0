Return-Path: <linux-gpio+bounces-9441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54147965CD3
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 11:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CA34FB26290
	for <lists+linux-gpio@lfdr.de>; Fri, 30 Aug 2024 09:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A246D171099;
	Fri, 30 Aug 2024 09:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dRRqRuhY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F21763F8;
	Fri, 30 Aug 2024 09:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725010059; cv=none; b=RGIZdSgBdNpDGKRU5vfMewC5yewx8W27QENA41doM87X8OWOikpAV6778BpCEN+4xmKwTts0MCWgxfpxdSmJZe8C684+WOxIbzvvG219M7//UQkPGao3VV+q2Dwk7JgvTRt17nB30pPtNkoCi30SecFY+yTIH+P+0EaDdIoYhLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725010059; c=relaxed/simple;
	bh=SJ+gyVH0KzdFnWjRaZGIfqvHVeBO9skfvWd6+ptEJ1M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ltc52JzVC92qHWILCGm7Pe6Pv6OoJuTFLfZNSWFtuOZe+uR/iMSTzIjviGyUuSmiMgSDuqgUwbNCy39AAsaw+v6yvgHpzegVTwZHPQEJe73xVNXfpXV+cwUqoHfLx3aOV9BnAqZdMQO02cvV1DK5rocFTlu3vrkAy63xD7bqisI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dRRqRuhY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2788AC4CEC6;
	Fri, 30 Aug 2024 09:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725010058;
	bh=SJ+gyVH0KzdFnWjRaZGIfqvHVeBO9skfvWd6+ptEJ1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dRRqRuhYqZCoGgZdbtlsWXMBvljyz6fsxeqS/VyK9rsQPzufPdG7YUL7ubTaFyPDo
	 1ACkToq7PiJXsE7EzGiwu3UULgwHsjPHkBe0mjTnSHCn+BDb5UlE/sNWUqplnhQ5pn
	 tX+zQW7Q61x/KD/wV72kRBrmIIIZuukIOKEe6J7O+7AXMhXIfcIR/SfNHd4cqj2hHO
	 9BRo2BvAGlj0lH2/TbfxxyBIkk//1IS+32vRtT5QiZD0Jmqkuk0NXeLqb1lWL14AAN
	 daPTY0pRX/LRtK9mt8XqhBi3zR+mSXUbme1Rn3AMKkEeyOGq2kX11IXvM69M3YSLTq
	 oQUPS+Ew9tySg==
Message-ID: <265abf82-5867-4e21-9ec6-a0b52b851434@kernel.org>
Date: Fri, 30 Aug 2024 11:27:31 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: x1e80100: Bypass PDC wakeup parent for now
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rajendra Nayak <quic_rjendra@quicinc.com>,
 Maulik Shah <quic_mkshah@quicinc.com>, Sibi Sankar <quic_sibis@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Johan Hovold <johan@kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240830-x1e80100-bypass-pdc-v1-1-d4c00be0c3e3@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konradybcio@kernel.org>
In-Reply-To: <20240830-x1e80100-bypass-pdc-v1-1-d4c00be0c3e3@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.08.2024 11:09 AM, Stephan Gerhold wrote:
> On X1E80100, GPIO interrupts for wakeup-capable pins have been broken since
> the introduction of the pinctrl driver. This prevents keyboard and touchpad
> from working on most of the X1E laptops. So far we have worked around this
> by manually building a kernel with the "wakeup-parent" removed from the
> pinctrl node in the device tree, but we cannot expect all users to do that.
> 
> Implement a similar workaround in the driver by clearing the wakeirq_map
> for X1E80100. This avoids using the PDC wakeup parent for all GPIOs
> and handles the interrupts directly in the pinctrl driver instead.
> 
> The PDC driver needs additional changes to support X1E80100 properly.
> Adding a workaround separately first allows to land the necessary PDC
> changes through the normal release cycle, while still solving the more
> critical problem with keyboard and touchpad on the current stable kernel
> versions. Bypassing the PDC is enough for now, because we have not yet
> enabled the deep idle states where using the PDC becomes necessary.
> 
> Cc: stable@vger.kernel.org
> Fixes: 05e4941d97ef ("pinctrl: qcom: Add X1E80100 pinctrl driver")
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konradybcio@kernel.org>

Konrad

