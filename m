Return-Path: <linux-gpio+bounces-28457-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73521C5ABE4
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 01:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 003823B946B
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 00:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9807223E35F;
	Fri, 14 Nov 2025 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VCAZ1RsJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE6424A076;
	Fri, 14 Nov 2025 00:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763079232; cv=none; b=cvi/q5RZN+cHs5nonSv2FRaWpeNtYyHbSMgB5wUtbDtN7hKJfZaEQiSPWxZZY6SRJ3b1xzvAWRgnY3Mn6hR8h3Qb+gJHX5P011BMN6aG5FyFyWhFq2lHzI7OOfkaFlZMDK21CqmfCYRAxruWus6MWp8RnPieE/gyUKNTtHSgpjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763079232; c=relaxed/simple;
	bh=rdZnR3xDdHkTeQnczfy6MYPCmRTg2pqzHT9akRpPanA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XPjhj2UP17prdY5J8KDnf3Cd5k8a2GjsH4W2o6nE46NFTVqTesiEgGgZSdKV1Z6N9gbLgRn9r5ud9qGxlNAb07SHhIdTfVqSkJNLz/RQCKuPHYTvSySQSAuded9/pMoHu2zVafv8VIWmLvY2JCpdRgMbLS4GtI/MY/G9aF3p2Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VCAZ1RsJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D678C4CEF8;
	Fri, 14 Nov 2025 00:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763079232;
	bh=rdZnR3xDdHkTeQnczfy6MYPCmRTg2pqzHT9akRpPanA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VCAZ1RsJSM0H1KbXKs6ddoOlormlqxsEAE4ZjunJzXaWvEEIpJdZYYZiu9sJiLpt9
	 h65t+dLthODM0MqpFbRrekcFYCvoQX66IgghYryZjXawg/ObBJ+2bCH0tTJIwrhjEo
	 7lHYVhBT1ZkomoA4lvlhjp6qWxm26TXEPYCmafRvyxUtoa1edeeyXeEgGHP8M2V9s6
	 SzEhttdZtued7EdKvzNC03kdLIq+bhQtc7JbXnhpV2ulUr8TQRwRXzVApVQ+l8yvsB
	 dVoPWHO1qBkd4ch5OqLvgMj7g3K2jLAHycEU1Mkr/LwnxFCz2IvCZO3JdvB+ld2mSM
	 Kcvx8TACzu+bA==
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alexey.klimov@linaro.org,
	krzk@kernel.org,
	bryan.odonoghue@linaro.org,
	jorge.ramirez@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	Praveen Talari <praveen.talari@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	psodagud@quicinc.com,
	djaggi@quicinc.com,
	quic_msavaliy@quicinc.com,
	quic_vtanuku@quicinc.com,
	quic_arandive@quicinc.com,
	quic_shazhuss@quicinc.com,
	quic_cchiluve@quicinc.com
Subject: Re: (subset) [PATCH v1 0/4] Enable Serial on SA8255p Qualcomm platforms
Date: Thu, 13 Nov 2025 18:18:09 -0600
Message-ID: <176307948644.2565969.17951410722748623028.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
References: <20251110101043.2108414-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 10 Nov 2025 15:40:39 +0530, Praveen Talari wrote:
> PM runtime support was previously added to the serial driver but had to
> be reverted due to wakeup IRQ storms and deadlock issues observed on the
> RB1 platform.
> 
> Reference:
> https://lore.kernel.org/all/DC0D53ZTNOBU.E8LSD5E5Z8TX@linaro.org/
> 
> [...]

Applied, thanks!

[1/4] arm64: dts: qcom: qrb2210-rb1: Fix UART3 wakeup IRQ storm
      commit: dd5385c322857ccb760d9bf18619b64b55c27e5f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

