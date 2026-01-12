Return-Path: <linux-gpio+bounces-30461-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 11371D14D58
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 20:00:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 295603018330
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 19:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF84025B311;
	Mon, 12 Jan 2026 19:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="JSBhX8W8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9116650094C;
	Mon, 12 Jan 2026 19:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768244433; cv=none; b=GKtHQcikkHU2GT6ZM+JMzhx+WKVUEuP9YIRhpxSVo5RHEVoTOL65jA5CTTpwII3NF8IPOeXH7o8KzEfP9nomkQTX2UJ7fi42ziiG5Opky42WCX22bStVMIVg2m4ea5lV0zZad9d20Kpov8hbRvVwCVVNDXzfJBmxCHVTJGiwv5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768244433; c=relaxed/simple;
	bh=ZOfrDgIEbBG5mTBCA4fwkzl/+8aonTu3wXaplk8tyxw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iINuOGo5+e1cAfIszDJILoS4L6vllT6H4SJxoPgxhv/kPpu6yBoLnWAO73WHSAhsgepScg8d/YB9WLYsPFdeaQU+AgixQdLxpffz1VY+P49v/S6grLlbgvLCerqBYuD+lhSW8RbC7SwMZIeZFyuWdvKONE7o//412GxdrTBDwhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=JSBhX8W8; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=Efk5es/KivDi0Fc3yeVmnS+OZ0K+LJKJU0wLWQjYd7s=; b=JSBhX8W8/VsK3yVcNpQ0ka9BZR
	wjEq4Ne7MheY7ujuihBOnCFpNhGDksfHn2ZHLtfww97gSCNdDqzIdsSs1FMlwWgu+jduVS/5mItM5
	u7IuLueGXkMbkaZPLSTdsCToGT3580T1J5G214BxY2Tz/bUP/jBm13+E31PcuEzFeDvLiOMzb+Ac8
	7TKxeW9Sniv9YnJatn7m3EqVo5yeFOAgkGZutEGwaT+z2f+sKXjkIoK71SpzHJLt3hgxW2cdhyveb
	owdG37vqClCZhuceZZbaoH+C1QpTE6CBhCD9xjdzbz1NCt7TwYXN/clPxUP2BcAh2aWZ/eJHtVkee
	BbvNhMqA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfN9R-00000005xF2-28FJ;
	Mon, 12 Jan 2026 19:00:29 +0000
Message-ID: <a0ba6721-d41e-40e6-8bf8-9b75defd2189@infradead.org>
Date: Mon, 12 Jan 2026 11:00:28 -0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] gpio: remove the gpio-tn48m driver
To: Linus Walleij <linusw@kernel.org>, Robert Marko <robert.marko@sartura.hr>
Cc: Lee Jones <lee@kernel.org>, Robert Marko <robimarko@gmail.com>,
 linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
References: <20260112064950.3837737-1-rdunlap@infradead.org>
 <CAD++jLnrcsEjKpBQWL=RHKVyyfq1UDk-sDZ7MP-16z0hBLC_dA@mail.gmail.com>
 <CA+HBbNFKyOFfhRu=XAE891dREPatFRD9VJ5=upz6xPBb8khGjQ@mail.gmail.com>
 <CAD++jLmPt9M5HEtN4psbk7Du8j4Y6_a0YzhxOM6wds53jT3kHg@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAD++jLmPt9M5HEtN4psbk7Du8j4Y6_a0YzhxOM6wds53jT3kHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 1/12/26 8:16 AM, Linus Walleij wrote:
> On Mon, Jan 12, 2026 at 1:24 PM Robert Marko <robert.marko@sartura.hr> wrote:
> 
>> It would be awesome to see it in the tree again, as the drivers
>> themselves work just fine
>> and allow SFP-s to work on the TN48M and I have patches for TN4810M
>> (Which is a SFP only version).
> 
> I sent a rebased version of the old patch as v11 of that series
> so Lee can pick it up and we sort out this.
> 
> Yours,
> Linus Walleij

Thanks. Sounds good.

-- 
~Randy


