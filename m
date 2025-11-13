Return-Path: <linux-gpio+bounces-28448-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E13BC581C6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 16:02:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9809A3BBE09
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 14:53:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45DD62D7DCF;
	Thu, 13 Nov 2025 14:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KacRUyP3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E63222D3225;
	Thu, 13 Nov 2025 14:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045615; cv=none; b=mlXGc58ds0JURcday6mI1H3as+3yhKPVXNvpI43RyLQphJOfiCs6b2i8/G+rl7V3fGLeh/HX47578lVclmGeqq+4upDw8lUHneq4MaswRysSOm/gKJTPWHJsn8bChCqn3bGGuaY6wowBdZlHyyjMChbhoY0Cx9+oxqjGhXcCTjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045615; c=relaxed/simple;
	bh=bar+ppaz8MVe3dnTkvVbA4c0GOjwBxy6x9+9lzZA6Yw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JGdfMzx7Zcgr4SLKYsH3z0EBCX9Lv+DWpds8FyZ41ZmR6wGB5EOfgqvNqb3tbmc0qEyIphwgSBgu5zCytRppAYm8nqPjA6mDJQj54YAsw+QYX2Jktr56v1Ap4sVR3hm1f4U+H0b+3Xokftt4FmrJdVmiz4WnukVLebQBPLqLolI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KacRUyP3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02267C116D0;
	Thu, 13 Nov 2025 14:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763045614;
	bh=bar+ppaz8MVe3dnTkvVbA4c0GOjwBxy6x9+9lzZA6Yw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KacRUyP3pjpKeaD+lQRRVZQDVtM3dutCf8Wkt+lFv5i63xWU/IOTqLlSo3kgllxjH
	 3DplTOTH7OribHeo0jr1mj1tHJWyXW8MBuB3QW2eaTCKxFFQhphSdIsZQzCUJQGv3k
	 Y0snj/NHCTK9oqkSPyDjITzlZjQQ1xNTw2CXOae7Po0nGpLWDB7btEuFmW4+v7bHFS
	 v7tN7CrwjC6vQMBoxtwrF+cdS886MvzvGUhHy4mMkqupTwunYNCmMQkL138poJO/TS
	 z4gz6gXBTsrtwYRAhgEH0/E49neC+ybbB1mMrsrUm3sy4qFwQDIOFiAAZtzIwG6c1S
	 hMqIi0Lpg+NEA==
From: Lee Jones <lee@kernel.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fenglin Wu <quic_fenglinw@quicinc.com>, 
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org
In-Reply-To: <20251023-sm7635-pmxr2230-v3-2-f70466c030fe@fairphone.com>
References: <20251023-sm7635-pmxr2230-v3-2-f70466c030fe@fairphone.com>
Subject: Re: (subset) [PATCH v3 2/3] dt-bindings: mfd: qcom-spmi-pmic:
 Document PM7550 PMIC
Message-Id: <176304561075.1523805.9861634409901015933.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 14:53:30 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 23 Oct 2025 13:32:26 +0200, Luca Weiss wrote:
> Document the compatible string for the PM7550 PMIC.
> 
> 

Applied, thanks!

[2/3] dt-bindings: mfd: qcom-spmi-pmic: Document PM7550 PMIC
      commit: c21a5a2d7add4677e595af935db9888c7e41871f

--
Lee Jones [李琼斯]


