Return-Path: <linux-gpio+bounces-21946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DE02AE2719
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 04:43:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 278FB179BC6
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Jun 2025 02:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5547E136E37;
	Sat, 21 Jun 2025 02:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cQzNMoWH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74860433AD;
	Sat, 21 Jun 2025 02:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750473806; cv=none; b=kHW2GdPdekMbV597/1x1exq7urbhLtLwf+BxVdFIqmX56aRxHKhgQWChRwZb+fT+wdKmgdOCzejYXFoIYnCkzAT/zR3wqo4vLGOd7oT34DNchyX4Cv9+HckpP3ae9FhaPfxX9rEEWRfmuoKa/NXAJrRicKfYxu2X+2BCVduOizQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750473806; c=relaxed/simple;
	bh=/mUu8wiWZRM27Ynp507EXjtNZKfG8JErGdZOjnS3KN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i1K20r+purG0G0rnWBaI3Oa0Org8I1WtJR/7rTyHZYqevhSPZ1rJwl+8RJpEiljKGYsADtPJn5EbEaS6hb9DCJy+5DUPKC5WCTLRPaxWxLP/Au0aGH9d8htJ5sGflGpROlbI7MZ9z6e85R2zN62Myb3C/xesTvC5rya5jKxRxrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cQzNMoWH; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=VuSXAJjGHGfDeGAQI0t00L+PSs0s6DTtv7L+mZ2k2xE=; b=cQzNMoWHO+ZRNfu6LICot/mnyK
	4NMiJ9zNI1mfQoDnUm5PgxqEp6HtcT+Oh7IHtiAQOvL6ZkY7YwByf2nQ1Cy8W06OJlmylqGeIMwaf
	0nowHA+p3BawmKPcW1XcBscMzyzxv0zn1mz5wAq4ln619wnxK8kiXf2AO2HjVrSRhTnByCqkz5OEA
	A8jmN/byt7umWpSb0bgc1Sq6pejgvmFA3ls33AoS7+LHxAZWyn5CgI57UD2F2IUN1EaTpyNGQpHv7
	RuR7ZC6w6ovO7fhnaxRueB/r6hOt/rKIqjPWV+Xi+r5v1Al5+iQUGS24Rcw8WDBvGw4EQp9ZsYAaw
	M9YsjY9Q==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSoCL-0000000EGH5-3niq;
	Sat, 21 Jun 2025 02:43:18 +0000
Message-ID: <969c90d3-eacf-484e-97dc-ab02c52c9453@infradead.org>
Date: Fri, 20 Jun 2025 19:43:15 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: linux-next: Tree for Jun 20 (pinctrl-zynq)
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
References: <20250620221305.720fedbf@canb.auug.org.au>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250620221305.720fedbf@canb.auug.org.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/20/25 5:13 AM, Stephen Rothwell wrote:
> Hi all,
> 
> Changes since 20250619:
> 

on i386 or x86_64, when:

# CONFIG_OF is not set

ld: drivers/pinctrl/pinctrl-zynq.o: in function `pinconf_generic_dt_node_to_map_all':
pinctrl-zynq.c:(.text+0x539): undefined reference to `pinconf_generic_dt_node_to_map'

or

ld: vmlinux.o: in function `pinconf_generic_dt_node_to_map_all':
include/linux/pinctrl/pinconf-generic.h:231:(.text+0x270bb2c): undefined reference to `pinconf_generic_dt_node_to_map'

-- 
~Randy


