Return-Path: <linux-gpio+bounces-14576-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F58A046AC
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 17:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E9C4E18885A3
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jan 2025 16:40:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08DF91F76B2;
	Tue,  7 Jan 2025 16:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aReApzZl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786891F75B5;
	Tue,  7 Jan 2025 16:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736267955; cv=none; b=tskAmG+Sl1dKorcB8DYz19jboeUI+nDhSlY+zLGgH0Ssbx0fmy6wiSBn2MwPzPOMgAgUDhkf158zAtD+6J3oRHSU6o45Jlt/ulzKxS+97HePtkP9onD1Va2t27o+Rj2Q8TSQB0vJLlY/FGs9BDSA2dZKzkjhHPLi5iFy+r6jyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736267955; c=relaxed/simple;
	bh=9HemNwXCla1HurzEoi/CnptD9OsC5NaOru+Ac77BG70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cyL7WXtHTGMbTWMV+24FNOeKBE48kRDoItUrTHhuX89ZdnSwspluhoKjfdk/DM/4NxtxSxGLhbS0mueYj2gb6ruTfsDCmsTigaBMXuT7BIT4RnXyV0rQg5CNElt0Z2IwCUBHWXDEpBpBTGRYUFplbJZ3jV026Clo+wvcPmzyQWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aReApzZl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06F75C4CEDE;
	Tue,  7 Jan 2025 16:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736267955;
	bh=9HemNwXCla1HurzEoi/CnptD9OsC5NaOru+Ac77BG70=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=aReApzZlze75+vx7Qnx7rrd64DTjsFwrzqUYqvjDC/xnxlSHPre5LgR12Hdua3phD
	 h7lOlx2IYr3A+2DFC2iuw++JkxFlUicPQCnShoefTKV3K2NjfG1R78ZA5K7vUCAhg4
	 h7grMGrio88ePMuhhUvlrrQxS6JPVY7DF5e57YqyHxxYlHr1sv7skmszQcXUCC08fb
	 0TEUhfu0Kqinst3IC+c+y/kUd3GgFxnlLcDG49sYTvYugDPdTgJbgovL1SGvULgv3R
	 CXoij+OizVuru0LqP66FTmYBIP7mvIuec84svfVZpPhyo8StgvC68w/OCCoxpML1X8
	 rwNR2AqIMHUUw==
From: Bjorn Andersson <andersson@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jingyi Wang <quic_jingyw@quicinc.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Lijuan Gao <quic_lijuang@quicinc.com>
Cc: kernel@quicinc.com,
	linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: (subset) [PATCH v2 0/6] Correct the number of GPIOs in gpio-ranges for QCS615 and QCS8300
Date: Tue,  7 Jan 2025 10:38:45 -0600
Message-ID: <173626793401.69400.2278973364367185634.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
References: <20241219-correct_gpio_ranges-v2-0-19af8588dbd0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Thu, 19 Dec 2024 15:59:42 +0800, Lijuan Gao wrote:
> The UFS_RESET pin on Qualcomm SoCs are controlled by TLMM and exposed
> through the GPIO framework. It is expected to be wired to the reset pin
> of the primary UFS memory so that the UFS driver can toggle it.
> 
> The UFS_RESET pin is exported as GPIOs in addtion to the real GPIOs. The
> QCS615 TLMM pin controller has GPIOs 0-122, so correct the gpio-rangs to
> 124. The QCS8300 TLMM pin controller has GPIOs 0-132, so correct the
> gpio-rangs to 134.
> 
> [...]

Applied, thanks!

[5/6] arm64: dts: qcom: correct gpio-ranges for QCS615
      commit: 80c82827327d80bde8fc96ebd4e637d0454062db
[6/6] arm64: dts: qcom: correct gpio-ranges for QCS8300
      commit: c57c39ee522d873db2cb23486581a8269c389cfe

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

