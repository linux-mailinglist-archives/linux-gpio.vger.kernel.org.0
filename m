Return-Path: <linux-gpio+bounces-28447-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B8041C581BA
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 16:01:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F19FE3B15C6
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Nov 2025 14:53:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 557702D63EF;
	Thu, 13 Nov 2025 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eC59fplw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEC72D3225;
	Thu, 13 Nov 2025 14:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763045611; cv=none; b=GmsDjbfc+glzi8vQEo1f3oEq8ulVBHcDlTlLPdOJma+LYREHYXzctH4Z1I72AVT4AD4pVVFMFihXclO5s4CbUn8SGDlNbuq28pTYaXF2tOvvrBHdgh0535irKphvIEFR/l4Vln+WJU9T2uy9f6qp5EWmsYNNqO85JlBBYYSGXAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763045611; c=relaxed/simple;
	bh=mFLndgM1qt072BTZXfki8cP92jTRq4RAu1L/VyEjfJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qgCRMg8J46iVw4VD5466vjjxP6xSCtI9bOyOuldCmuGa5brAw/RPId2Eqx9s9aJVRmuZLaU3lMAsHcbUXQ5OIt/r7JbjWIcQ9jFeWIKFXoPgXVdtwM/DG6iJZMKJuuyQISwXVpFaBy+MzmVbZ8zh0uzy6Rqvz7JgfMPLjc/ksNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eC59fplw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1986C4CEF1;
	Thu, 13 Nov 2025 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763045610;
	bh=mFLndgM1qt072BTZXfki8cP92jTRq4RAu1L/VyEjfJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eC59fplw66cbKsUfuX1xQqYASKDrf8GSj1twlbfHyKvg9gylddWTNE+voCQkHP+lr
	 +4RwnaZezA6q8Htdw2wP3nMimUflFmPBwk4tFxGLihQbdiwgPkUVeeEMar3NMzll8u
	 jQCf0402yzZFzbxtxyEty9LuS+lsatCoLjCu/g2dHK9jeLEXEK1HHZ1btMsE7QW4vc
	 HhgJ2+FowswNVNbC32lbsDtQTh+sUZT/m0B6tWzyLBgw3iTWveMxiKkObwKlqO3Tk5
	 vBVTNp+Jr2LGQ4hiHOKR0RHnlVL851g26w4FCBkyU4Sjan7Lk1LVDRlTD45FZhTrDA
	 D8eNQ6rWdtDnA==
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
 linux-gpio@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
References: <20251023-sm7635-pmxr2230-v3-0-f70466c030fe@fairphone.com>
Subject: Re: (subset) [PATCH v3 0/3] Add support for PM7550 PMIC
Message-Id: <176304560663.1523805.5705925702375197311.b4-ty@kernel.org>
Date: Thu, 13 Nov 2025 14:53:26 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-52d38

On Thu, 23 Oct 2025 13:32:24 +0200, Luca Weiss wrote:
> The PM7550 PMIC is used in conjuction with the Milos SoC. Add binding
> docs and the devicetree description for it.
> 
> 

Applied, thanks!

[1/3] dt-bindings: leds: qcom,spmi-flash-led: Add PM7550
      (no commit info)
[2/3] dt-bindings: mfd: qcom-spmi-pmic: Document PM7550 PMIC
      commit: c21a5a2d7add4677e595af935db9888c7e41871f

--
Lee Jones [李琼斯]


