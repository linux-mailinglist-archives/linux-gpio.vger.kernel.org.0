Return-Path: <linux-gpio+bounces-24464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B111BB290F0
	for <lists+linux-gpio@lfdr.de>; Sun, 17 Aug 2025 01:18:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 595993BE7C8
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Aug 2025 23:17:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545A1235BEE;
	Sat, 16 Aug 2025 23:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="oNmJehO7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C8E3176E9;
	Sat, 16 Aug 2025 23:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755386256; cv=none; b=SRXtQWkxNY6CCHeeJ5YcF3jBTBfMOzLXhVIhL9bca0vXVKhpRFVCaX5RruAyflHwJE9owMc7DICCKMINERV1+HA2fvIumKS3DIulZ1AILI1eO7k+GABRJ6Dfew7VGB1yXxjjbWSJ2oUiUw3W8jPp8laELTKBHjkPP2D3pRIybjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755386256; c=relaxed/simple;
	bh=vrPXcmK+Ra08RobKOAqFOKjPp3JC1U5aS7aurWKvChk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GFWQkXKqp6LqAfZbdr3PWFquFkcfizVlhm4dzwFhAdSz55ngewDdkZVHUCeOeiDI8Qc6JyCeJP+EforHUgoqzYRplZ0mOGKzeikobzudC8Pp71Kfiz6ThZBahOX2NVZ6JoFQiCPmxGF2x2Z7h7OlbEMWmzO8M1t6FkRLLCioCUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=oNmJehO7; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=hvNsaXUHLp5w6bIeON9XakFAzxRfvKyhOfepozVZjXQ=; b=oNmJehO7CxUuYKh0wjQhgxcRQu
	yvFKrcRddekGuSskFbYOA9574Uf1857mLHC4CaTTpN1oboVdoMUjZmXuTGrICWXw0GGZOnAjEUloA
	6HbOaq61+7BjzoyRuLSZsmGvdW5AzRRenPhlhkIFAZfxWJZRa7vVLNRWkYCXdn7xXPQGt17S22cVs
	2YGydC7hPQ0FN/rbBT+9QKT4al+atIU1dmSiGdLdkSArCTR0rxHJzE9U3wV0iwf3jF/en+RfO28wA
	ZJGvUk6FdpuCNB7wcea2Aac7FdVMWKgL4TMw7vCfV34+c9G2BA+uyeRpJe4loIHwkzao/UFFw99pv
	O2hN/jzg==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unQ9V-00000005DPF-2PtZ;
	Sat, 16 Aug 2025 23:17:33 +0000
Message-ID: <b69d92aa-2d41-4b79-ad15-75b73897e263@infradead.org>
Date: Sat, 16 Aug 2025 16:17:32 -0700
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: gpio: add documentation about using
 software nodes
From: Randy Dunlap <rdunlap@infradead.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Arnd Bergmann <arnd@kernel.org>, Hans de Goede <hansg@kernel.org>,
 linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <ce4pjordujfvaujjgxruszba7ivoywex32rfwzeiil2zcdlgl5@lt4vvv4yalzm>
 <8bdf668d-c120-4ed5-a0f4-fe8c0876c8d2@infradead.org>
 <f93c26c6-c390-46d4-bdd1-4d2f0e03e63d@infradead.org>
Content-Language: en-US
In-Reply-To: <f93c26c6-c390-46d4-bdd1-4d2f0e03e63d@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/16/25 3:21 PM, Randy Dunlap wrote:
> 
> 
> On 8/16/25 3:08 PM, Randy Dunlap wrote:
>> Hi,
>>
>> On 8/15/25 10:30 AM, Dmitry Torokhov wrote:
>>> Introduce documentation regarding use of software nodes to describe
>>> GPIOs on legacy boards that have not been converted to device tree.
>>>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>> ---
>>>
>>> v2: Addressed Randy's comments.
>>>
>>>  Documentation/driver-api/gpio/board.rst       |  65 ++++
>>>  Documentation/driver-api/gpio/index.rst       |   1 +
>>>  .../driver-api/gpio/legacy-boards.rst         | 298 ++++++++++++++++++
>>>  3 files changed, 364 insertions(+)

Hi Dmitry,

There are a few build errors with the example code. It's OK to leave that
as an exercise for the reader. :)

There are a few missing header files, but the biggest build warning/error
is a Section mismatch:
WARNING: modpost: gpio-swnodes: section mismatch in reference: myboard_exit+0x1f (section: .exit.text) -> myboard_swnodes (section: .init.rodata)

so myboard_swnodes should not be marked as __initconst.

cheers.
-- 
~Randy


