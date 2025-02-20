Return-Path: <linux-gpio+bounces-16319-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A82A3DE38
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 16:21:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 309233BE8EE
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 15:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E8871FCF7D;
	Thu, 20 Feb 2025 15:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UCzR170y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3E61E5B7F;
	Thu, 20 Feb 2025 15:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740064688; cv=none; b=J/K60W3HGfdte0GJLocQCdntA9omuktwEYs/kA5CZYMo7UScip5gTe7ZHsz8MvQY9bPD7nCFaPWD8oR6nw8c08ZDw64S7oEyTar/K9CgQdqtOSaZ9rkFiHglwDGIOk3pLCmoKX1LDB79r4ZHRf6U0VzDvmTEF9HbaVCipDM/lNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740064688; c=relaxed/simple;
	bh=ZnaNzN8t662cNw4RKpiVdVtvTtxMXS8tMZ1bItrIqqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=px7at+6/7MEje4QdMlndBS5T8af3Lk89KgJYcy8HsSXx08RZ5URxMY2znJYJWvy9Gk271SNANGmW3AjQNw7j8/nlJ3C0mGEXGhoXkBu8v1rntaS2348KY8CT+jOOqugrKSwsv2xMfW3VzOIGXI7HQ4w0A5d2nBk/KuBSwmaQcTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UCzR170y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 714E3C4CED1;
	Thu, 20 Feb 2025 15:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740064687;
	bh=ZnaNzN8t662cNw4RKpiVdVtvTtxMXS8tMZ1bItrIqqQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=UCzR170yfjLMG8S5D0SUT2ScspgvWTdIxWLSdlOAEgbAHISizyWLXzDn0Nc/SM9zv
	 tP5FbFNxE37YyoKO7zioIbiHzmJVtP0T9qyRnHYdUmwTa2h6DgEhAc/hFHJ2oWeApv
	 Yyq6wu6ja8UAdPx5gvWDzEDa4RyTHjAieJKi7cpyj0TYWyj/vr5FQgy4CcvAJaaK+f
	 5XWBmk8EjXapPCfOi+nBngW21GnmKa1eT7T+SJoH5+/v8JuMQaSbUSwASbXusUygSG
	 jKN7RC8F6qvv0/BUbT+SUey5didbDHTSUe5FEbGWH6mSdcGixO1Gr2nvZNSbn45heU
	 fLckq+tO+O9Ew==
From: Lee Jones <lee@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 =?utf-8?q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
 Linus Walleij <linus.walleij@linaro.org>, Lee Jones <lee@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, iommu@lists.linux.dev
In-Reply-To: <20250211-msm8937-v1-5-7d27ed67f708@mainlining.org>
References: <20250211-msm8937-v1-0-7d27ed67f708@mainlining.org>
 <20250211-msm8937-v1-5-7d27ed67f708@mainlining.org>
Subject: Re: (subset) [PATCH 05/10] dt-bindings: mfd: qcom,tcsr: Add
 compatible for MSM8937
Message-Id: <174006468317.807943.10112581876441058365.b4-ty@kernel.org>
Date: Thu, 20 Feb 2025 15:18:03 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-510f9

On Tue, 11 Feb 2025 23:37:49 +0100, Barnabás Czémán wrote:
> Document the qcom,msm8937-tcsr compatible.
> 
> 

Applied, thanks!

[05/10] dt-bindings: mfd: qcom,tcsr: Add compatible for MSM8937
        commit: c9498d76a96f84a80ca88a862b6112cdc2e7cb64

--
Lee Jones [李琼斯]


