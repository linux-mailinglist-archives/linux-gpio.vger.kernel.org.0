Return-Path: <linux-gpio+bounces-6740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B358D2226
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 19:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B8FF6B248D1
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 17:03:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB361174ECD;
	Tue, 28 May 2024 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BeBmgUCb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 781AB173350;
	Tue, 28 May 2024 17:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716915778; cv=none; b=Yn8PVpVeD0SIATuNGXkZwgZHhNo/0jIziUeHvKloPs77tLfBddUsVXPIDOm0yLOrni1ON3yawS/RSJTwaRA27jZj9T1cM5Ubk0CXp84ihBaW4DbB1Xv5rbwhWkCw7rlraVPW9q/de714JX5YEcQP79YSryLeBBTMaNV7OLvp3GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716915778; c=relaxed/simple;
	bh=d7VPMGIdqNLF45j8kC0Fc7trVtC0v2eVektCXeN9Rb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=uTzmVKV/xSyqmJ9SQimxliUO9gad5ee4ZwKHY7OSgB2AdpZepZln8X80AsIlGZYM9QORQNHKJr0LH4ELaRVNBGZYMpuWjWKDE23GwPOgL102QG6Ghe1u1wY6zl88RrKzToxpfaZxQjvbO1A0ome8XoGYATyGPzagufoqCtIdyHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BeBmgUCb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15FF2C32786;
	Tue, 28 May 2024 17:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716915778;
	bh=d7VPMGIdqNLF45j8kC0Fc7trVtC0v2eVektCXeN9Rb0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BeBmgUCb7WE5D4mdFdFd46CcKQtcuwFi5wCdofu3HfeLY2e5HwLGI/mA2qpG7NLkB
	 nVY9E41e4GuS9oxEP2bknp8AjInRaGumYDy2eRwkcozmldoCnseT6VR3YLtq8Fhlfe
	 pnaiidPFrxU24qBR1oRWyv0TF3tsPcqI/4tvQ/G17wkKPMdPmaMjiWDBtHiARUKLSp
	 KaD8kH/jzdAlwOoN5ouuGBsgQw6E6uaz6Q+9yvfEuG+E3NIH6lluyESobG9Q/DDW1z
	 KAjkHhWyA51n4s1Z+eOuJyTNoJ/TfMNN1HZZfQAdMFv+2BAZIR8a9kAPv1kNB2UeQV
	 X7k+tzucWZ/og==
From: Bjorn Andersson <andersson@kernel.org>
To: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Luca Weiss <luca@z3ntu.xyz>
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/2] Allow gpio-hog nodes in qcom,pmic-gpio bindings (& dt fixup)
Date: Tue, 28 May 2024 12:02:53 -0500
Message-ID: <171691576752.544020.9360876610718267733.b4-ty@kernel.org>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240409-qcom-pmic-gpio-hog-v2-0-5ff812d2baed@z3ntu.xyz>
References: <20240409-qcom-pmic-gpio-hog-v2-0-5ff812d2baed@z3ntu.xyz>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 09 Apr 2024 20:36:35 +0200, Luca Weiss wrote:
> Resolve the dt validation failure on Nexus 5.
> 
> 

Applied, thanks!

[2/2] ARM: dts: qcom: msm8974-hammerhead: Update gpio hog node name
      commit: 92b9ce5b11d7ba281f5bf0029185d5c891b29344

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

