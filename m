Return-Path: <linux-gpio+bounces-30615-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA64D2818B
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 20:30:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F274F3020505
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 19:05:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 325A82D73A6;
	Thu, 15 Jan 2026 19:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cwln90jq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E6729BDB1;
	Thu, 15 Jan 2026 19:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768503909; cv=none; b=G/+qd62ZHWKFykJvhRkj4z5XJsqt88VcHDmJjtUJQy/9zmKjzKj0M7R8Cf3zaRzoqavwcwx5JOG7i2hN1MxijyXEy5obPJrnCVKAohCbY0HFU5wuwVV4J3yHmaj+j80ddkHK3ieUjRKB9Cd2RF4TycTR+/DGA/hU0wkpDp/brRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768503909; c=relaxed/simple;
	bh=XGxk5XqmTMXOuSSsKOdhgAHvgmaYT8PkS0TUquQx3Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUWPnn9yX7B1vHkO650e4Jen0ABPINZR5yZ9UgUt81gO8FCj1AL34N6cP6JiEd2RkvQQqD4yL/twCYIGn3umdmCkKrujk2kyQxHp8CAF0YdhV7jOGZv5tkCIxPmmsyZQIl40q7ZV8PwuPxAp8jcwOuKi9yqbexBM0TLQKfpeHDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cwln90jq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B515C116D0;
	Thu, 15 Jan 2026 19:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768503909;
	bh=XGxk5XqmTMXOuSSsKOdhgAHvgmaYT8PkS0TUquQx3Kc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cwln90jqVWwSRdAOYxtgSZO0omEPgP8ktrPfGmotvNNPVIcYxhHjdgRRMcFkpwUSB
	 ZqGC6WhFUPSdqaGrsjTlxfrX1oY52fUkiw3Kyk9YEpJub9jtJW8y9kMDGgkYb6OyNl
	 ZbOivC8lgXJpP1M0wjVOku/8Uv2pJrbmjmPq1b7XEikmHJAynvnxRyOSWdm7nJ2kB9
	 QZqGPu9q3XGBQq/OEMzFJyJK0nZ5EQiE+HXAoYaUKsdlAboi42SfEKoEHxvwxn3z9D
	 BvLiPI17UUsNxB7VP1SV6l+N64QQwB4JKHer229ntugF0sE2ezFuglptl1PmrvT30a
	 1mY8YCTVMND1Q==
Date: Thu, 15 Jan 2026 13:04:36 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gatien Chevallier <gatien.chevallier@foss.st.com>
Cc: linux-gpio@vger.kernel.org,
	=?iso-8859-1?Q?Cl=E9ment?= Le Goffic <legoffic.clement@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, Leo Yan <leo.yan@linux.dev>,
	coresight@lists.linaro.org, linux-kernel@vger.kernel.org,
	James Clark <james.clark@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Linus Walleij <linusw@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	jens.wiklander@linaro.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	Mike Leach <mike.leach@linaro.org>
Subject: Re: [PATCH v2 01/11] dt-bindings: document access-controllers
 property for coresight peripherals
Message-ID: <176850387192.1025633.5139708031708243841.robh@kernel.org>
References: <20260114-debug_bus-v2-0-5475c7841569@foss.st.com>
 <20260114-debug_bus-v2-1-5475c7841569@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114-debug_bus-v2-1-5475c7841569@foss.st.com>


On Wed, 14 Jan 2026 11:29:15 +0100, Gatien Chevallier wrote:
> Document the access-controllers for coresight peripherals in case some
> access checks need to be performed to use them.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> ---
>  Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
>  .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
>  Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++
>  6 files changed, 18 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


