Return-Path: <linux-gpio+bounces-28384-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A91C51927
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 11:10:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 366D0188EBEB
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 10:09:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D9F2FFDC4;
	Wed, 12 Nov 2025 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l7SE5VLa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D4C429A326;
	Wed, 12 Nov 2025 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942118; cv=none; b=Ar06WB51BBHk9gGB3fJwhKxTpyVVfPChjmYKeqHdlv/9WgGzqYdktamRqI4FGTcHQrzX51K4Wdnnu1m5mAhARGzKxvBa4jaBgneII7zDI4mT6RIMf5LaAGdjuR2Mno9BRa1S7rbVrTMhTuA1py/lvTYd2/Chkr5drjonYjQ1/LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942118; c=relaxed/simple;
	bh=EFP6097dkxiFu2N95M3PdiuyfGXLTN9cueBMbP3Vu54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fhRVGVUEgBGd/1bwOBq8BpjeGw7c0/mem+RtRQSwr+SASaUBHiEsbPVaT/Lkd/FqAQnxadydiLVoLd+kmyUb02p/3XbDVCiAsC6apoHXZ0tucgsXy1WttIaxSXf6lOGL7vc/WStpiF9oad4GzXkxNQa1zbjicyYX1qVGCi54Vjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l7SE5VLa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80F74C16AAE;
	Wed, 12 Nov 2025 10:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762942118;
	bh=EFP6097dkxiFu2N95M3PdiuyfGXLTN9cueBMbP3Vu54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l7SE5VLaHqn2w86VSwQnmSfzu95h2+/kMCpVYK/UrOJmE8e2BPTg3vaupxDf8rNUh
	 EMHPoxg6DUV5uFzwrEfU5lBADO51oenoZPHi8SP+8Z8aYyUzKTgjpYJJ2ws5JjujJz
	 4/BfkTDswyy1t2Q4X6GofxSmPQ/pA5NAuTEJKu0EwUdafKkuwIyuSz9YRMpvkeuPjx
	 ntkb6vKdp42x5MQPvICGtKBjwpESf+ZyCcmdh6COHQ4Vku5oOIyFtvqzaZiRKHCjmK
	 xHtlm0K28zm5BuzfUbrYyRapGaEYAJOJGCqsSBNpaFZzKZJ2CF+oN/UpJfbKk3sasy
	 SU/oNi7rpAPsQ==
Date: Wed, 12 Nov 2025 11:08:35 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Lee Jones <lee@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v4 07/20] dt-bindings: firmware: google,gs101-acpm-ipc:
 add S2MPG11 secondary PMIC
Message-ID: <20251112-discerning-placid-bustard-befbca@kuoka>
References: <20251110-s2mpg1x-regulators-v4-0-94c9e726d4ba@linaro.org>
 <20251110-s2mpg1x-regulators-v4-7-94c9e726d4ba@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110-s2mpg1x-regulators-v4-7-94c9e726d4ba@linaro.org>

On Mon, Nov 10, 2025 at 07:28:50PM +0000, Andr=C3=A9 Draszik wrote:
> In a typical system using the Samsung S2MPG10 PMIC, an S2MPG11 is used
> as a sub-PMIC.
>=20
> The interface for both is the ACPM firmware protocol, so update the
> binding to allow the relevant node and update the example here to
> describe the connection for both PMICs.
>=20
> Since we have two PMICs here, but can not use the 'reg' property (as
> the addressing is based on software, i.e. the ACPM firmware), the node
> names reflect that with their respective suffix. The existing 'pmic'
> therefore becomes deprecated in favour of 'pmic-1'.
>=20
> While at it, update the example.
>=20
> Signed-off-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>
>=20

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


