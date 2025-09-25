Return-Path: <linux-gpio+bounces-26580-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A80B9FEEB
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 16:19:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A3C5188C83F
	for <lists+linux-gpio@lfdr.de>; Thu, 25 Sep 2025 14:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1332429ACCD;
	Thu, 25 Sep 2025 14:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VtxwNzGJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3F22877D2;
	Thu, 25 Sep 2025 14:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758809392; cv=none; b=d4pVUoWr5FQ/ETGAV+LhmXjUKMQWA3wZMg2ITm1c2EDXupCdZlf6ofQJ7eUGvOowqE45+I4oqyQLFVLLjdDlbh8gubZ253BQswp4jEWdw6R4oXhJjqCOsPSex8wkfifBCDfe/52nNpTQVZMTV/J4fbIbhJmBUuPusBy9wmxCq+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758809392; c=relaxed/simple;
	bh=92x1vheshati3hodKV1r/bZQ/N1jqbecpJHGcDxZdEk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCGCNZ9SGA0+5wjpx3L7zSn2MxRfuKTLTT9HWXGyq6VZae+NIZd75pq/HP7Td6ltofScue9CtbSO6BOMfo19m9iQy+XK4Uym6EFHcqzqqQ23r5IGwSGalo7KEO9AySMG9x7pYSjjlo9bYMeMv4lMSqnhIKnjMqgrIud1GX01xFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VtxwNzGJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCC2C4CEF0;
	Thu, 25 Sep 2025 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758809392;
	bh=92x1vheshati3hodKV1r/bZQ/N1jqbecpJHGcDxZdEk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VtxwNzGJn8RP22/JjSniCUe10pwu2y3znruCtmrIe6kUNhQGFoamg5ARFAcOyc97k
	 n/F93H+wKi0+5KEOyaQbg5S1H01snt4s3zvMtQFindiZvHqoWwn7zzDwbOgfAcO4XV
	 por15y2EeEsed4IKyZ+cYdnNtsFIxpwvg06YwHFfoJGLmrQ+h6zHWua1ieY1jh2WVk
	 veWmta6L/kadbXVmlLcS3neOk0XQBGoPqo9sB8pbdVeQfNiNfN0UJQBil3KT+v0/yP
	 u4yq/qaRyhHJoLp/zhstzTLnLMQLUcfoM9X8RKR2JucmoRGlYkRmA7muNl9L1IxA0u
	 j+B+T+zJFhzKg==
Date: Thu, 25 Sep 2025 09:09:49 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, aiqun.yu@oss.qualcomm.com, 
	tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com
Subject: Re: [PATCH 2/2] pinctrl: qcom: add the tlmm driver for Kaanapali
 platforms
Message-ID: <mbtlqpmn7ndmebauebwx2puhvnxghxszmsuhowi4d4up7jjnfl@it3etg77hrbu>
References: <20250924-knp-tlmm-v1-0-acabb59ae48c@oss.qualcomm.com>
 <20250924-knp-tlmm-v1-2-acabb59ae48c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924-knp-tlmm-v1-2-acabb59ae48c@oss.qualcomm.com>

On Wed, Sep 24, 2025 at 04:16:04PM -0700, Jingyi Wang wrote:
> Add support for Kaanapali TLMM configuration and control via the pinctrl
> framework.
> 

Reviewed-by: Bjorn Andersson <andersson@kernel.org>

Regards,
Bjorn

