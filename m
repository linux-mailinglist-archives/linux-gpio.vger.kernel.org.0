Return-Path: <linux-gpio+bounces-11649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BCFC59A4570
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 20:08:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 723031F224A7
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Oct 2024 18:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 990EB2040A9;
	Fri, 18 Oct 2024 18:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Q9MeujY+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787121362;
	Fri, 18 Oct 2024 18:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729274931; cv=none; b=gG0hjDon9KNPXM6HaFvMzVd1i1uhXCZloNVkdlzgQbszEc44cCFiByZvLXiTQ+ZSc0amDk9bfGSD+p7augy06MEhahdFtYFl2WBIPNwezMH+e/dno+klOj65QgeWqJ2xGMDzKOvChivcKTs7edg/4uzkzn0eXGTllmV8Oy2WauU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729274931; c=relaxed/simple;
	bh=O7WmOZ/UWH+i6C84k6Hkmat7ALV0t6fNrZmBj6MQNNk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rxzm4191RI3qbJ03J9wOFga8tOtVE7DytT3sk3rZLE8CkrcTXFBdKlTZUxlehQTWJU9XfOOxZz3Hpp1BBKQT4wLR+t+1MP7V7S0b9ih9Ld6oGZSAMhd5n7gl9JQo+hMzBfsnVMQnq5iIHlZI/S8u4ZemBKw5mBygMzFAT3JfxcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Q9MeujY+; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3IRrbV8v30eu6geVm8BmPCV09DcMpdtg/tZrGVi3N8k=; b=Q9MeujY+Jap/0raH44mEE2d3nT
	b8oi9FqKjqfmCzU8GOmxsekCR/1atIFDdtfE5IJQS88hczrw/oP7ILXwYG3P3oo0wVLdn53Yfd8Jr
	qyD/m+M0GSj3k0TnfwxgmgRPPYWVYw0JP+v5vG+NwzDOtGsSsDyzRX6/jrVSQjJs5L5I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t1rP2-00AYVm-9X; Fri, 18 Oct 2024 20:08:44 +0200
Date: Fri, 18 Oct 2024 20:08:44 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jingyi Wang <quic_jingyw@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	quic_tengfan@quicinc.com, linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v3 0/2] pinctrl: qcom: Introduce Pinctrl for QCS8300
Message-ID: <f9dace93-f6c7-40c2-a6d2-60ce8043aa72@lunn.ch>
References: <20241018-qcs8300_tlmm-v3-0-8b8d3957cf1a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-qcs8300_tlmm-v3-0-8b8d3957cf1a@quicinc.com>

On Fri, Oct 18, 2024 at 11:19:30AM +0800, Jingyi Wang wrote:
> Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
> QCS8300 SoC.
> 
> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>

I'm curious why you are Cc: netdev for a pin controller patch?  Did
./scripts/get_maintainer.pl say you should?

    Andrew

---
pw-bot: cr

