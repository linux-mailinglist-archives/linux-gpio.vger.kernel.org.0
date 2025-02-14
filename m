Return-Path: <linux-gpio+bounces-16051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F375A3687C
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 23:41:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50FAE1893ED3
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 22:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 483F01FDA9B;
	Fri, 14 Feb 2025 22:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W/wdHpEm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E26831FDA62;
	Fri, 14 Feb 2025 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739572713; cv=none; b=NF5+jWzZprlqxHU8CWt60/215JyOv9dcAhDhi7vbpXmo8q0XNT4MYMOk9BQq+VYhMMnoIHgqAo7WjNL9LgNU/73LdXDYeY3b4Q4POp0ilVUmToC1ond8DKwV9D8IJIlFVXKnkHrz+cfUh/Fhv+ElxWZKT2yMbd7CAVYNIm3u4zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739572713; c=relaxed/simple;
	bh=PHjW0RMguI28CAUU14mM2YyB64lw4CLpFFVRYJYdQoI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AAB/of+1jH/vxYoKEVQd4WJkvxYwgxXvlTy4r6cxgi77DlZJeB9xB6qXJ7iQ4IeBoKxAfF97/kWI/u81Jk/SR2BpjHuDccKifacIBksL/t0ZZafJ9EtoX1W66d4BpR0WmgBCMOAZJ6D5rMErks8oS+C/zHC8h55F70tifUBBl4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W/wdHpEm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C2D8C4CEE2;
	Fri, 14 Feb 2025 22:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739572712;
	bh=PHjW0RMguI28CAUU14mM2YyB64lw4CLpFFVRYJYdQoI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W/wdHpEmRZpvFzWRvM7zbOLZJN/7/RGnasZ0i3t18BjSABcrCqk4Od7vp9YO7RC5n
	 iD7iG5/GCagNkTi1uBqE3hL/r981v6FG7aVAHMP2UsJmM4Vl0xVTPmb0lWBrJkC9+Q
	 DOU8IQ9gYvuoy9ILk3Q7QRHTB4PkKQ6aV2P53cyaug41HcS3Q0zY+jCsgoq16Oppvb
	 /ZF/yHbzabxR7zQkl2K0mVkNllYrwq/MBmOxMYS2gfurxUDELKQ+FLXzso9bGRnpZj
	 GJ0HWU7rQfhwcH7hw572t388ikJJIzILuBwFLhCJzFlziui3xpq95W5vtwbjXvlPig
	 ykAvUPnmAi1wQ==
From: Bjorn Andersson <andersson@kernel.org>
To: linux-arm-msm@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	linus.walleij@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH v6 0/5] Initial Support for Linksys EA9350 V3 (linksys-jamaica)
Date: Fri, 14 Feb 2025 16:38:14 -0600
Message-ID: <173957268928.110887.13654522511111181644.b4-ty@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
References: <20241007163414.32458-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Tue, 08 Oct 2024 00:34:09 +0800, Karl Chan wrote:
> Add device tree source for Linksys EA9350 V3 which is a WiFi router based on the IPQ5018 SoC.
> 
> As of now , only the UART,USB,USB LED,buttons is working.The front PWM LED require the IPQ PWM driver.Therefore the PWM LED isn't configed in the tree.
> 
> Also The original firmware from Linksys can only boot ARM32 kernels.
> 
> As of now There seems to be no way to boot ARM64 kernels on those device.
> 
> [...]

Applied, thanks!

[3/5] clk: qcom: ipq5018: allow it to be bulid on arm32
      commit: 5d02941c83997b58e8fc15390290c7c6975acaff

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

