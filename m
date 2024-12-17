Return-Path: <linux-gpio+bounces-13968-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D089F4E47
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 15:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F1CFD167E2F
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Dec 2024 14:51:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B61C71F7567;
	Tue, 17 Dec 2024 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ai94OeF6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674FE1F543A;
	Tue, 17 Dec 2024 14:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734447003; cv=none; b=m7LCgRus0r9jzhCLq/0WUqIoe6IiCJUVpmn/h0oqr16Xk+T4IrJZ4W0LRw4JeFm6aQzkZ3tEAO+4x8ZTT+Y3IDwTx7OKpZjvdqVwFzOv8tsh6fyUy2/dgL+2vqpAqc0jCaYxbO8sCoPU3UiX847ngZ5g38m/zYhND81Ar/mhS04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734447003; c=relaxed/simple;
	bh=zXQZiLk9rpyX+BgoMRHWBbS2cq7bp8vnbhDeCpGUFzg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C9Kz2crzcQbHhHYx2E4bCMwdClxJs1ouvleNeFXWQ0i9zVMmEUHC4r6ahyMoENLKrwpAf/j6lSnDbDWWEvr19JE/SlS6nZkN+q2GTN4wQY2IjetUFi6WqRKazPzTJpB0/rdWf/e3cnWsafhbbfU4q0KA/Jz3lvSrETs6cX4pDtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ai94OeF6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8732FC4CED3;
	Tue, 17 Dec 2024 14:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734447002;
	bh=zXQZiLk9rpyX+BgoMRHWBbS2cq7bp8vnbhDeCpGUFzg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ai94OeF6nClKEEded2NPplsfTlJtGXjqWNqKEY6xLl7Pt6AvDpuhaMJvFW7t1738/
	 0rsCutnU/tM9mdveFfzKzZIYzRMcnfzlAwjU1rxmIxtUNbidKKogEMWg8uN+CqJcJm
	 RCvlv+mwmap87wjt+P3lXGoeJ2qsh5N0EMHApTL02cvXMNkeFMJmpkOH4fLqxJCLv1
	 atmb/Eo78ON1PAnetr0OwcB8O2STIjK6wuEHXLqUBt9HU8HHqPUNs/Jls3+C7b+Mwh
	 OwW0cLdzPYx/61YH54pB7eOibJ1xSel0w/kkDt2JIgbE7S/RXiij9m8HvIO1adM9x7
	 Hkxjifk/p91IA==
Date: Tue, 17 Dec 2024 08:50:01 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>, kernel@quicinc.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: pinctrl: qcom: correct gpio-ranges in
 examples for qcs615
Message-ID: <173444700008.1651738.973727201688707789.robh@kernel.org>
References: <20241212-correct_gpio_ranges-v1-0-c5f20d61882f@quicinc.com>
 <20241212-correct_gpio_ranges-v1-1-c5f20d61882f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241212-correct_gpio_ranges-v1-1-c5f20d61882f@quicinc.com>


On Thu, 12 Dec 2024 17:24:00 +0800, Lijuan Gao wrote:
> The QCS615 TLMM pin controller have the UFS_RESET pin, which is expected
> to be wired to the reset pin of the primary UFS memory. Include it in
> gpio-ranges so that the UFS driver can toggle it.
> 
> Fixes: 55c487ea6084 ("dt-bindings: pinctrl: document the QCS615 Top Level Mode Multiplexer")
> Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/qcom,qcs615-tlmm.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


