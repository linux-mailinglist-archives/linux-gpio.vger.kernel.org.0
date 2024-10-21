Return-Path: <linux-gpio+bounces-11720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 963C69A6F08
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 18:04:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 415E7B23B7D
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 16:04:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9BD1E8831;
	Mon, 21 Oct 2024 16:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="WnzhvlNU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BB31E47AD;
	Mon, 21 Oct 2024 16:04:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729526667; cv=none; b=puGfucJNNcNDqWVA0yISee0uKeeXOgcvPil2Liz2RfuzZXppBo7AEAGLbEItUmNvq4CsrYpdw1G0dOGF/8FIZdjZMJcY2zttvDXkCkrAgDU3EAiGwHjUbGIBVZRvAD2Qjqjdt8WP8R+63e4HLdQqP/7f+GpVtt4EZwcYOZLhWS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729526667; c=relaxed/simple;
	bh=NL+4/LzqhG5DQhyBo4s8Tz4jSgHK8KIC8B9jAve3quc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOq45cbL/7IZouneX3CvLLS1oej5kYXXTWjtck5kD33DlDu5po5s55tX3UMrGh6EdDcV2a3jJ+jUcS/A+2ofxLxDn+hehc6CnvOMnCZW0WvfatGVEvE54LpLdle0zZVYoO6w4QCn1NMZw5TjF4xUGgjgHvz9mAl0Z/lrtypNHbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=WnzhvlNU; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=f9aYH+x6gNVLLNdDAZPgbvN0mWCyYxKH2GG7iO1Wl7Y=; b=WnzhvlNUN6sZc9f1yvS/HqH8Yp
	p/EFSUsHn8p2P1NpBFy6xghFT86CX9gMKiDmW585mguvwZMd95YWSdgO1xjGQVxkKSjRtd8o+wv0T
	YIm+hoGfhVZvnHw4iPGUzCkdbqZ7CAX/UAJhkBullDrH25afPXu0xcT4Iz0Q+yl0Co50=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1t2utJ-00AkNI-TR; Mon, 21 Oct 2024 18:04:21 +0200
Date: Mon, 21 Oct 2024 18:04:21 +0200
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
Message-ID: <1e73d96c-6a60-4bd7-87bf-4af4956aea7e@lunn.ch>
References: <20241018-qcs8300_tlmm-v3-0-8b8d3957cf1a@quicinc.com>
 <f9dace93-f6c7-40c2-a6d2-60ce8043aa72@lunn.ch>
 <5fa2080a-f59e-405e-ba52-69d7293e2739@quicinc.com>
 <145d9036-6cd8-4aeb-80d0-b3d86b84f2cf@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <145d9036-6cd8-4aeb-80d0-b3d86b84f2cf@quicinc.com>

On Mon, Oct 21, 2024 at 12:27:36PM +0800, Jingyi Wang wrote:
> 
> 
> On 10/21/2024 10:32 AM, Jingyi Wang wrote:
> > 
> > 
> > On 10/19/2024 2:08 AM, Andrew Lunn wrote:
> >> On Fri, Oct 18, 2024 at 11:19:30AM +0800, Jingyi Wang wrote:
> >>> Introduce Top Level Mode Multiplexer dt-binding and driver for Qualcomm
> >>> QCS8300 SoC.
> >>>
> >>> Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
> >>
> >> I'm curious why you are Cc: netdev for a pin controller patch?  Did
> >> ./scripts/get_maintainer.pl say you should?
> >>
> > The cc list was generated by the b4 tools.
> 
> double checked with ./scripts/get_maintainer.pl, also get the list:
> netdev@vger.kernel.org (open list:PTP HARDWARE CLOCK SUPPORT:Keyword:(?:\b|_)ptp(?:\b|_))
> 
> I think the list should be added for keyword match in the driver.

I assume this is a PTP pin probably a 1 pps output, not an actual PTP
driver hidden within the pinctrl? If so, please edit the list and
remove netdev and Richard. You might want to review the other emails
and see if they all make sense.

	Andrew

