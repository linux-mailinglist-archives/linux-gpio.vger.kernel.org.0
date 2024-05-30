Return-Path: <linux-gpio+bounces-6964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AF68D5092
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 19:08:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D48D41F25DD6
	for <lists+linux-gpio@lfdr.de>; Thu, 30 May 2024 17:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A1D24437F;
	Thu, 30 May 2024 17:08:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="aAj+TQZX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B1C433CF;
	Thu, 30 May 2024 17:08:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717088910; cv=none; b=Om/GPwRbZ/48m09AD0CKEJrnUVjM86yQR8BqJTJeOrmB7nEBpgn8r5oxcNjbnNSG6uFFifYGuhzGO5cnh76kvBn76U4nTQGypPVzGjhSIYjiXiYNF0xh+KFCstRAh+qOpS3NPcRABuQh3yYfbhXF0lAT15Q7IlN5tfyMxmRndqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717088910; c=relaxed/simple;
	bh=axAu5FB6oF/a31axn3i0S5B3VLMnmWlh6gWO546FsOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpWW2nr5aqKcqgWOhAkIrxYuluuL5Fs8Q2xyfB6MEcJM22lz7DTRTdORFbrILhsvenCafT7HWqjH+Vwph0Kky9YMBRzkgm91PcMprzWAFsdJTa0zl85CdSQUnr4444dxPTlcaDxDVuasLTINzZAJDAI3NPXbJuMOUjs5zELRPRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=aAj+TQZX; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Envelope-To: linus.walleij@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1717088906;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FBh+z6/yWJorKMpQpXCLn6sR3W5MP5Dz7vo6P7gzhF8=;
	b=aAj+TQZXMbCj/68/EOx9VjszJzO4L1tmYYpDzuj4yKfaj30lTBYxoUuaa9Yr0wTfajdgbv
	URn9I+u8nX0PemlZ2aubI7b9BGULtPT49pqvwYJKE4fFdBute9CjKyu5uq4lYM75nmEgCO
	xmHpVIy18JXS9KdF9RGGj/zP1mSeDrA=
X-Envelope-To: michal.simek@amd.com
X-Envelope-To: linux-gpio@vger.kernel.org
X-Envelope-To: sai.krishna.potthuri@amd.com
X-Envelope-To: linux-kernel@vger.kernel.org
X-Envelope-To: linux-arm-kernel@lists.infradead.org
X-Envelope-To: conor+dt@kernel.org
X-Envelope-To: krzk+dt@kernel.org
X-Envelope-To: robh@kernel.org
X-Envelope-To: devicetree@vger.kernel.org
Message-ID: <e4972a07-18d6-4a8b-bb5a-4b832aa2d20e@linux.dev>
Date: Thu, 30 May 2024 13:08:23 -0400
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
 <51d984f5-896e-469f-914d-2c902be91748@linux.dev>
 <CACRpkdZ19+zUCEBCJJ+MBnnaF+caZKFTDxYiWZ0BRGx+PxN3bw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <CACRpkdZ19+zUCEBCJJ+MBnnaF+caZKFTDxYiWZ0BRGx+PxN3bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 5/29/24 04:38, Linus Walleij wrote:
> On Tue, May 28, 2024 at 4:28 PM Sean Anderson <sean.anderson@linux.dev> wrote:
> 
>> Well, perhaps you should have reviewed the original driver more
>> closely.
> 
> Do you want to push me down and increase my work related
> stress? Because that is the effect of such statements.
> 
> It looks like criticism of me as a person, so explain yourself.
> 
> Writing this kind of things looks to me like some kind of abusive way
> to express your desire and that is what burns maintainers out, so
> if that is what you are doing, stop doing that, adjust your behaviour
> and focus on technical issues.

The technical issue is that the driver does not match the hardware. We
must maintain the existing set of groups for backwards-compatibility.
But this should not prevent improvement.

Saying that we cannot have both group styles means that the driver is
permanently stuck with whatever was picked when it was submitted. Hence,
if you want to have only one style you had better review new drivers
very carefully.

>> > If you want to mux individual pins instead of groups and functions, by
>> > all means, but please do not mix the two approaches in the same
>> > driver, I'm just trying to save Xilinx from themselves here.
>>
>> I see no point in creating thousands of groups
> 
> Please share your calculations for figures like "thousands".
> 
> In my experience, groups are usually in the tens, perhaps
> hundreds, physically restricted by the number of pins
> underneath a BGA. A Micro-FCBGA has 479 balls and many
> are GND and power, so that sets a ballpark figure.

There are 78 muxable pins on this hardware, and around 40 groups, each
with signals that can be muxed to each pin. If we were to create groups
for each combination of signals and pins, there would literally be
thousands of groups.

>> for every combination of pin musings
> 
> It is clear from the documentation that the point if the pinmux
> groups and pins are not to present all possible options (known as
> a "phone exchange" solution) but those that are used in practice,
> i.e. these representing real world use cases. See below.
> 
>> when we could just switch to the solution in this (or v2 of)
>> patch. For compatibility we cannot be rid of the old situation, but we
>> can at least fix it. There is no technical problem with them coexisting.
> 
> Historically there are  ~2 camps:
> 
> - One camp want to use groups and
> functions to combine pins in groups with functions to form usecases.
> 
> In some cases (such as pinctrl-gemini.c or the very latest
> pinctrl-scmi.c merged for v6.10) this reflects how the hardware
> actually looks: it does not make individual pins available for muxing,
> but you poke bits or send messages to change entire
> groups-to-function mappings, so it is necessary for some hardware.
> 
> So when you write that "groups are a Linux-only concept" this
> is because you probably haven't seen this part of the world.
> Groups exist in hardware, and in the SCMI specification.

What I mean is that, for this hardware, groups are a Linux only concept.
Neither the firmware nor the hardware itself has a concept of groups.
While other hardware may have this concept, it does not apply here.

I do not object to groups where that is the hardware reality, but they
are unnecessarily constraining for this part.

> There are systems with individual control of the muxing
> of every pin, such that e.g. every pin has a muxing register.
> 
> These are again not really phone exchanges: I am yet to see
> a system where any function can be mapped to any pin. These
> just do not exist.

Canaan K210.

> What exists in practice is that each pin can be mapped to 2-4
> functions, in extreme cases some more. Often these functions are
> mapped to adjacent pins, and the "chessboard" picture in the
> documentation for the subsystem reflects this.
> 
> For this reason, it is often helpful for driver writers to group
> adjacent pins into groups, so an iterator can walk over the
> pins and poke their registers in order, instead of treating each
> pin as a unique entity.
> 
> - Then there is the camp that just by habit *want* to control
> each pin individually. The extreme example is pinctrl-single.c
> which is named like such because each pin is controlled by
> a single register. TI wanted this solution mainly because their
> hardware wasn't described in manuals, but in other HW
> description files, and they needed to process large volumes
> of data into DT-form.
> 
> I didn't like this solution initially because it makes it hard for
> people without datasheets to understand what is going on.
> But I was convinced to let this coexist with the group and function
> mapping, which is fine: maybe one size doesn't fit all.
> 
> i.MX and others also do this approach but with large sets of
> defines in the <dt-bindings/*> files.
> 
> Combining these two approaches is not something I recommend.

Well, the former approach is wrong for this hardware, but we must
support it for backwards-compatibility. A combination is the obvious
solution.

--Sean

