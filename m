Return-Path: <linux-gpio+bounces-25603-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FED2B43F41
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 16:41:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB0A51CC24D8
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Sep 2025 14:39:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36520319866;
	Thu,  4 Sep 2025 14:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o92AJnVr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5A130F557;
	Thu,  4 Sep 2025 14:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756996521; cv=none; b=kcrn+NU5MT7lxRwh1CSo4c1z1fJMNpPmsa2BXtY9enzdKfkO0eTzmBXUo48LrZFPQDRHG+QjpIF4lHDi+GTRBiyEKR1mYFKcuT6ywIbaT7REouAsMpidIgv/k98O1aHepstYJ7oPoZFF4HFk7YwBalM3d3IbR8oIcOo4YfQaDEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756996521; c=relaxed/simple;
	bh=8kIGznDy+yBjtOzEZBMp/gYRmqnIWETZTPphA2eOkh8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jPCrzasyYqYONFINqhggIVJE0flifYOLfb1a1E+DWN6ipI/PbRlFuUdMVmnDH+N4l3JYlPifElhmc1y3L8S2HynPyB8SeNiz9OFmjutseQcHULbpbZfPM9+t0+d+2UYvygzYMoj48Xjhw8Owukody/EOTnLHSwBe/RVPq4pcTWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o92AJnVr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7651AC4CEF0;
	Thu,  4 Sep 2025 14:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756996520;
	bh=8kIGznDy+yBjtOzEZBMp/gYRmqnIWETZTPphA2eOkh8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o92AJnVroMgO0xyUlw5zPy+0SOqoU8a73BKt5yk4HJ/rA6ZxM/Z4lnFBvkqCTCcUt
	 g55GxGyJ4kUwstKETLKrzHpfRrXg1HXAFoT0g4qT6YMWzAA+sBlDYUwQKIxp3EWIAq
	 qSjq8hUsOGyVnMDYJl6+EUFw/w0owqY6Wo9+MsgUIRgAJ5+NY8nrN2n+lOZRu8+feE
	 eoTkxkplcOyrx0yLVoCoIHziOC/DHMYyRGcfgYBUVwTa4aZJwEGv9m6LNB7YRSjOhS
	 PhPBCM5x3ORKjDJK7txAcwIKaho+KEKGM9LQ5AvnsrOOD6SmUSh3mB3CpmVsRjSDhP
	 EgaYwvQIsFwSQ==
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
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Daniil Titov <daniilt971@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Dang Huynh <danct12@riseup.net>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v9 0/7] Initial support of MSM8937 and Xiaomi Redmi 3S
Date: Thu,  4 Sep 2025 09:35:13 -0500
Message-ID: <175699650574.2182703.5262816788916742029.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
References: <20250903-msm8937-v9-0-a097c91c5801@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Wed, 03 Sep 2025 23:08:20 +0200, Barnabás Czémán wrote:
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

[3/7] dt-bindings: firmware: qcom,scm: Add MSM8937
      commit: cf13bed78c90b2c0fc65774e86d564c868fa2a23

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

