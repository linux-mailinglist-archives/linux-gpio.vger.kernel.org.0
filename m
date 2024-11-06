Return-Path: <linux-gpio+bounces-12576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D01779BDAB4
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 01:55:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 872C51F2445D
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 00:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87B35188A18;
	Wed,  6 Nov 2024 00:53:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b9v0zHsQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E7171885B8;
	Wed,  6 Nov 2024 00:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854438; cv=none; b=A2d7+KtIDha2ZDrfkuNAVKDoRVrv+61Ob21mrbGPyzLxpLSspeOwevyyMBtzU9EPnLSazzFjMfejtijCEYyHLzBlqnu0HyREAWIUAyRAWpYt31tENTmGeH3m4+hPRRkbbVrWM7+YOEJZCuoMwK7xcP+ywUK9aMDmvT20/xR0DXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854438; c=relaxed/simple;
	bh=HPTg6F0AYPQEIKZS8GnAFmra5qXWz8AKMhVZCHGPW+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VaRfEN3TDA3N4Lr4XSTl/Cuzf77yFGdEi2DWQtF2jOV/FPVkZWn51uz/vfMdm/AbbmUGnW2WK25HxcR+R3kf2jy2q5oSyRcAJExnxUGk/G75FxbIkf8bcwJaflcGfRBWkzBTxm67bdjbMxZichO+J0sGuh+SPr7FosuINV29scA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b9v0zHsQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2EFC4CEDD;
	Wed,  6 Nov 2024 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854437;
	bh=HPTg6F0AYPQEIKZS8GnAFmra5qXWz8AKMhVZCHGPW+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b9v0zHsQjN2hTRx2yrCy/4HS7d/jSxBpi8f/++f2qyq8D2UDYx3LrwDutMiLlTqlO
	 q64b/Waq2CuLIhuHRS0m5eBc8UKnn0scn7a+5owraAIWwHPgRR3dsiY82q3NNdcyI4
	 +rozCJzGgdOWevZGIWt+1PKNCCYlUbl5G/4yi74sxmJ93CEkhOr87SxDSP1CDgv1wZ
	 sMByjejW+ec0YjFUG2x3U0HQrzPJOfThz0ApvJCtZ1wx4jO65RpkSZFwHL4xD+LeAc
	 Zl7nth9qpixByJW306xgur9vTAyScFsNPQDSuHdK8Ytdbks2UdgkwVbbz3D/ZY3Vxo
	 tO1roa2FTWnZw==
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
	dmitry.baryshkov@linaro.org,
	neil.armstrong@linaro.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Sricharan R <quic_srichara@quicinc.com>
Cc: quic_varada@quicinc.com
Subject: Re: (subset) [PATCH V5 0/6] Add minimal boot support for IPQ5424
Date: Tue,  5 Nov 2024 16:53:49 -0800
Message-ID: <173085441672.26510.12002868497417768812.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
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
      commit: fd516bb4f48fc527744cae42d8e156fb09bce157

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

