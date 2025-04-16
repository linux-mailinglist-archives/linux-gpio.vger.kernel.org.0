Return-Path: <linux-gpio+bounces-18980-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 08607A90B08
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 20:11:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1344188D09D
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 18:11:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0F422172C;
	Wed, 16 Apr 2025 18:10:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lzmYjCsN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BD621CA0E;
	Wed, 16 Apr 2025 18:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827056; cv=none; b=d3sbp1VuHCK/6ZylY7QBLbXTHL7M0bPyOcy1jkNTDc/UARfbGFUfqKjBSfeNsT3Q9S4xORymSglKIG/1xXi4w8zwEsboY0sdti2slfbyCjT9mL2DpAkVbbafZJXdXSS/lNgQmKSTfqem3lqail+byG6ec8Ez+USEsTjHrO/m9ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827056; c=relaxed/simple;
	bh=BwHkWTpOhur440Z80ly8g3N+djQD6dBjxS1kT5nV74c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SRR8im2l8Hay3dFcZRQ1ca60YOqVtdkD4V+Rj9ihKhLrfCQ0UOm6mfmARzu+dfA4scq3IL5AnE8Ejv3gzBM2+vsvuOEKwDPBLP7pzR6/GWbIJnTrkfOvKw0E2xL6xiRGxn+4HHgChz5os5ZrJKRzpZwxnUf4+lG5uBZKmCktf5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lzmYjCsN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28084C4CEE2;
	Wed, 16 Apr 2025 18:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744827054;
	bh=BwHkWTpOhur440Z80ly8g3N+djQD6dBjxS1kT5nV74c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lzmYjCsNepDSraryG5VzpwlDZMymqsbCUIVG1pE93F4nsvJ4sDUKkIFceIGn8SsqS
	 zTTTblMvtpNo4tz5BuU38fRzxWuWXvj9KKn07rXgfg786pZE7moBJKDzN0cWo+pKba
	 1WqTfdUgmXyJkofHy+pcBGnfJvqFg8ulA1BqG91BvG2a/vHN0gKGU9T5BiT2VjSAk1
	 EQ1qH6zHSeXlNy7WWa1++M3lNS+qOj99aCAKZDSBaxoPvdDx5xjr9rKNS7EVlkpPEX
	 8VzNpr0+ZnMqloSkevz2u734MLJELNtf1/Fc5fQNt/0SORCDqLTE8WFV4Am8FM524w
	 VbZQCI0SUXE2w==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	ulf.hansson@linaro.org,
	linus.walleij@linaro.org,
	catalin.marinas@arm.com,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Dmitry Baryshkov <lumag@kernel.org>,
	Sricharan R <quic_srichara@quicinc.com>
Cc: quic_varada@quicinc.com
Subject: Re: (subset) [PATCH V5 0/6] Add minimal boot support for IPQ5424
Date: Wed, 16 Apr 2025 13:10:44 -0500
Message-ID: <174482704415.446874.4349704931217088020.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20241028060506.246606-1-quic_srichara@quicinc.com>
References: <20241028060506.246606-1-quic_srichara@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 28 Oct 2024 11:35:00 +0530, Sricharan R wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> The IPQ5424 is Qualcomm's 802.11be SoC for Routers, Gateways and
> Access Points.
> 
> This series adds minimal board boot support for ipq5424-rdp466 board.
> 
> [...]

Applied, thanks!

[6/6] arm64: defconfig: Enable IPQ5424 RDP466 base configs
      commit: 4b77122818239bcc05995d0234491b91c8cd477f

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

