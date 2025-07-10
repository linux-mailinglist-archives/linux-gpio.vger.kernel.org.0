Return-Path: <linux-gpio+bounces-23066-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 57924AFFD95
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:10:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 23172B4241F
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0E528E56B;
	Thu, 10 Jul 2025 09:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ELAPf0Hl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72AA828CF77;
	Thu, 10 Jul 2025 09:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752138377; cv=none; b=Z/47qNYJePE2rGvZZqt/PJUVXfK+tgpRieUHyJWMz8v/JkITByioUu0Je9X9vA+sYUPXEH/JmqJe5kev6LyEp3Ttfk7g8L5uL72619nQp3iEIHzCKXmgCF4AYMxuv+0WoZclrf39MnIqe3jop14WlMHvFEdaIBHK/mBM1+aaAFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752138377; c=relaxed/simple;
	bh=x4lBoYioxP/2JP2nFGvNan0gRSlXv0v+cjBCDqjG0FI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=SCHmCVGClYAORDjpCI6vO8n8wB783tPRDFdoDL46i1PJ6tjak4ZGSK/CQhidgGmNDw+D6qCuaW71h9WFsYMF0xHulGrsi2tDcqVhpr9L3hgBL3SbLocgt/ARbxqE5Krks6/9Y4QCTxyTTXp4E/3F5m2y12rVKv36ejnrLdbahx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ELAPf0Hl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54DABC4CEE3;
	Thu, 10 Jul 2025 09:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752138375;
	bh=x4lBoYioxP/2JP2nFGvNan0gRSlXv0v+cjBCDqjG0FI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ELAPf0HlNYAiugWbWHSB6b/w50a/GII3QmVGKL/Q1rttCYNH7m3JhVh6MBbj+Dr43
	 2TKeaJs5xHe+mHDNG4PpDI80dlpzA5GDkX2UZwCycqCUCbCrpQMkgbHH3vpxJ0Oziv
	 M+cfHEoKsNATj9fz9yTEW/msMaDugpzn4xOwXF4RB3rQCWipNu5vZd+gWNCx1I6wzD
	 Kxg4pkb0PIE6/86dJOCle+m1GYd7lAzQLZUxFbz4eZBGt9ElHXolbTpNhz20xEyWAm
	 cmbfL9zoIrwoB5OBAVF0MLWiEskWs1+aysiuzgIa8JRcBfFMMiJ/tqbQ09tHONl3CZ
	 RtBlcsnNieKyQ==
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Thu, 10 Jul 2025 11:06:11 +0200
From: Michael Walle <mwalle@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij
 <linus.walleij@linaro.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Julien Panis <jpanis@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/7] mfd: tps6594: Add TI TPS652G1 support
In-Reply-To: <20250710090025.GD10134@google.com>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250613114518.1772109-2-mwalle@kernel.org>
 <20250710090025.GD10134@google.com>
Message-ID: <baa1eccc55fd406b3c42f6a5466b6be5@kernel.org>
X-Sender: mwalle@kernel.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Lee,

>> @@ -82,6 +87,7 @@ static const struct of_device_id 
>> tps6594_spi_of_match_table[] = {
>>  	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593, },
>>  	{ .compatible = "ti,lp8764-q1",  .data = (void *)LP8764,  },
>>  	{ .compatible = "ti,tps65224-q1", .data = (void *)TPS65224, },
>> +	{ .compatible = "ti,tps652g1", .data = (void *)TPS652G1, },
> 
> I get warnings about this being undocumented.
> 
> Should it be added to:
> 
>   Documentation/devicetree/bindings/mfd/ti,tps6594.yaml

I've accidentally forgot the DT patch in v2 of this series. This series 
was
superseeded by v3 which has the DT patch again.

https://lore.kernel.org/all/20250703113153.2447110-1-mwalle@kernel.org/

-michael

