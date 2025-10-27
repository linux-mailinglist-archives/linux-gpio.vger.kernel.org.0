Return-Path: <linux-gpio+bounces-27741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64329C11BE4
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 23:35:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6FB321A289D9
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Oct 2025 22:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C125132E722;
	Mon, 27 Oct 2025 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LOK6cmVf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B452E54BC;
	Mon, 27 Oct 2025 22:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761604493; cv=none; b=jmKmeXp2dA5Vcp5ionfTPb1V/5NPXbPafgeOXFXrS92oInjJ4G2sLQrfMvl9V7pYFZDsVVCzRSASRJokUI7bH5U0+ezOz04qAQSsaDC7iJMU6ayD0DQmYkEvAjqrqsw4l6agqwTdxOw+FasqE98Vi426x0BAFKD6qd6lqS4o3YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761604493; c=relaxed/simple;
	bh=+K1KqNSFjEqsZ6MriQT0b2DMEnTu05BP2udtDaFfjnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HmIyPmaSb8pT3/UvcV6f34j1cT97lrzgIm2V4wAMjtHT1RmF8Q16Es9Ere3fpO4JRwEwpgBGDka2HR62HPqc09WlDpUvGCtRihRZAj5kEakwQ1KDYm0l1c6GIH4QDfB/MOVwXdpOFGaanssY7aM1KknLrF4KPQmg2isX4P8Pg8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LOK6cmVf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 175F2C19421;
	Mon, 27 Oct 2025 22:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761604493;
	bh=+K1KqNSFjEqsZ6MriQT0b2DMEnTu05BP2udtDaFfjnA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LOK6cmVf1BQ02otHtC3zXB5I3pw/JVh0gj3xZoU4TeAvFzdJbsiItBVIG1Da1rRSw
	 AtIcwTZqDVJXIDtZZ1spcXlko2yYDzrqYfMMlQWvipzsemZZzTY2g1hI8C7t95SyQF
	 UT4gMtaqQWCNA89OTkKLaNJBJbCLqhobaPTQHJTrP8hi2207GFzxDPYq8SZPHTCELz
	 kSlVCc0gKw6ZTHS+YahtYrxRO3hgTMdku/n87YO88CzymThBOrYJfmklDyVj/rhK01
	 BimNfGv3aw2A3R/4sx/TIUNbbeozGucSk1FKIqhQov8GZfnjn9cA3sBxxU4622tuJU
	 s+tHjx81KtkVA==
From: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephan Gerhold <stephan@gerhold.net>,
	=?UTF-8?q?Otto=20Pfl=C3=BCger?= <otto.pflueger@abscue.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Robert Marko <robimarko@gmail.com>,
	Adam Skladowski <a_skl39@protonmail.com>,
	Sireesh Kodali <sireeshkodali@protonmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	=?UTF-8?q?Barnab=C3=A1s=20Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	linux@mainlining.org,
	Dang Huynh <danct12@riseup.net>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 0/3] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Mon, 27 Oct 2025 17:36:46 -0500
Message-ID: <176160465234.73268.17064439770048270449.b4-ty@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014-msm8937-v10-0-b3e8da82e968@mainlining.org>
References: <20251014-msm8937-v10-0-b3e8da82e968@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 14 Oct 2025 16:04:23 +0200, Barnabás Czémán wrote:
> This patch series add initial support for MSM8937 SoC
> and Xiaomi Redmi 3S (land).
> 
> The series is extending the MSM8917 gcc and pinctrl drivers
> because they are sibling SoCs.
> MSM8937 have 4 more A53 cores and have one more dsi port then
> MSM8917.
> It implements little-big architecture and uses Adreno 505.
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: qcom: Add initial support for MSM8937
      commit: a829f6f2e8a727409d2b896bff244d33ef21fe29
[2/3] dt-bindings: arm: qcom: Add Xiaomi Redmi 3S
      commit: 1a614267281fa477b7d1eeb7b225f106161eb739
[3/3] arm64: dts: qcom: Add Xiaomi Redmi 3S
      commit: 2144f6d57d8ef8b0c73bd97d8e5f2783e67afc35

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

