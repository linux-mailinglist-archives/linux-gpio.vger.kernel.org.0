Return-Path: <linux-gpio+bounces-6738-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19BCE8D1EC7
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 16:29:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0A2B1F23628
	for <lists+linux-gpio@lfdr.de>; Tue, 28 May 2024 14:29:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3268C16F90F;
	Tue, 28 May 2024 14:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="xpc1jwBV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [95.215.58.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D72216F8E9
	for <linux-gpio@vger.kernel.org>; Tue, 28 May 2024 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716906540; cv=none; b=Oa/6X+az0OeQLFIGKbMco9dqGTPf+uMWBOK0ajlOSXV9Ba962OOL8jp1ttnoEFdllT5hP7ipouxdI7sFnvYgVgGK2L5NCBbcQ0yr5PLrfvtqDZsuwcnaMAdTTctKqjDLbeDl/uVBLHWk5zHQoLkv1h/TSX3QL2kT9Oy052uFKec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716906540; c=relaxed/simple;
	bh=FClqH09kFsd0iJr0uhESR8yNfB2UKFuPfOCCTn5CTg4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFnuGvKlIqgzDUXwJVZZ7kJQHTnieUL0KtFcRUjm3QDJ+9j1B3FM4J8AW5YrVLPojMgs1ykVjW1fjzTXGZ1POMpIzwFfVm1/eB5pBbm9sgu9JdkQyrA6P1zLPc4dqmGJ0E6Naae+WAhLaJJTddwfZXAwg9r2B8wpOdjrX9xD34k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=xpc1jwBV; arc=none smtp.client-ip=95.215.58.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linus.walleij@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1716906537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mdB+sx7IWTFnAhjbj+baTMUPxCF5GwKzeCFXC4SL+3o=;
	b=xpc1jwBVSkzLSfSMm7f9IyrlIQIkooum+19LabhFqqwFkbprzvbE4RSTHOBJ2maohRR1P/
	QAZTmxoKaissSwhvHa5u+7QppSJbIogAtvgmSW0LUlOpg34hn9Nhx/FoYy1dbXzmFVtw0+
	JIckkiL1APVFja1ma8Is89ZN/cfA0Pc=
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: sai.krishna.potthuri@amd.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
Message-ID: <51d984f5-896e-469f-914d-2c902be91748@linux.dev>
Date: Tue, 28 May 2024 10:28:51 -0400
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/2] pinctrl: zynqmp: Support muxing individual pins
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org,
 Krishna Potthuri <sai.krishna.potthuri@amd.com>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org
References: <20240503162217.1999467-1-sean.anderson@linux.dev>
 <CACRpkdbOAoSDNFhXfz3djUZh1_MQ_T75CC+-LmojRXvyCbUusA@mail.gmail.com>
 <06a4e5fd-3d26-4923-bcbf-0bdd66d756c4@linux.dev>
 <CACRpkdbSsgxtKqF6ORXubufTaegjysHU7zH-tJfDfKNd=Kdoeg@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CACRpkdbSsgxtKqF6ORXubufTaegjysHU7zH-tJfDfKNd=Kdoeg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 5/27/24 09:15, Linus Walleij wrote:
> On Mon, May 6, 2024 at 4:45 PM Sean Anderson <sean.anderson@linux.dev> wrote:
> 
>> > Then we realize that not everyone need all the modem
>> > control signals provided. What to do. Well this:
>> >
>> > uart0_rxtx_grp = pin_rx, pin_tx:
>> > uart0_modem_grp = pin_cts, pin_dts, pin_dcd;
>> >
>> > mux0:
>> >     function = "uart0";
>> >     groups = "uart0_rxtx_grp";
>> >
>> > Now the CTS, DTS, DCD pins can be reused for something
>> > else such as GPIO.
>> >
>> > I *know* that this breaks ABI: the driver group definitions change
>> > and the device tree needs to be changed too.
> 
> Actually I didn't think that over, it is possible to add new groups
> and retain the old ones.
> 
> I.e. retain uart0_grp, but additionally add and use
> uart0_rxtx and uart0_modem_grp and use one or the
> other approach.

That is what this patch does.

>> Well, the pin groups are actually defined in the PMU firmware.
> 
> Is that firmware written in such an helpful way that the groups
> can be extracted from the firmware then, as with SCMI? Or is it
> a matter of duplicating the info from the PMU in the software-defined
> groups.

Fundamentally, the pin muxings are known a priori from the reference
manual. Because pinmuxing itself has been delegated to the PMU firmware,
we defer to it when determining what muxings are available. The PMU
firmware describes muxings in terms of pins and functions; groups are a
Linux-only concept.

>> And
>> frankly, I don't see the point of pin "groups" when there are not actual
>> pin groups at the hardware level. The pins can all be muxed
>> individually, so there's no point in adding artificial groups on top.
>> Just mux the pins like the hardware allows and everything is easy. Cuts
>> down on the absurd number of strings too.
> 
> So are you going to switch all of Xilinx devicetrees over to using exclusively
> the new method (muxing individual pins)?

No. We have to support it anyway for compatibility, so there is no point
in changing everything for no reason.

> I'm fine with one (string identified groups) which I encourage, but I
> let individual pin control pass as well on several occasions.
> 
> What I don't want to see is a Franken-solution that mixes the two
> approaches, even less so on the same system. Someone is going to
> have to maintain the resulting mess. And this looks like exactly that.

Well, perhaps you should have reviewed the original driver more
closely.

> If you want to mux individual pins instead of groups and functions, by
> all means, but please do not mix the two approaches in the same
> driver, I'm just trying to save Xilinx from themselves here.

I see no point in creating thousands of groups for every combination of
pin muxings when we could just switch to the solution in this (or v2 of)
patch. For compatibility we cannot be rid of the old situation, but we
can at least fix it. There is no technical problem with them coexisting.

--Sean

