Return-Path: <linux-gpio+bounces-28020-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4A2C3151D
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 14:55:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F35C1886206
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 13:55:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041D5328B65;
	Tue,  4 Nov 2025 13:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cyh0w/j9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99E22FB97F;
	Tue,  4 Nov 2025 13:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762264519; cv=none; b=uAVZmrOb5M9WxrwkXaPlQ6NqopUMRTTa4ukc2MDzQdr9Gk64e6CEGiMiao8SuZJr6Zrq7Qd6aXSd0Q2jMbubCHPTWw+hS+kt5xPwkZreP3SjQ/ONcz9MmHo9XRPZKy7Itco6Jp3PBPb7oFqAYGlyPkH+zX/Y/KMjbLxUskb2d7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762264519; c=relaxed/simple;
	bh=5Osg+3PtpysyfGfQ66SX7Qtk71vZvS2ovW93DWIR9fY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5lKf3sA0y5ZPfcmJ5eqw7rjYPgd+zlkNvXRJiuk/Abt2dbvOfGp7YCBuycYCCbNN84M/nhKqXmP1lcqQX515mij393DMqSAb2S6GDPcuZel6AdRSLP2rJFxdngV6kDbXwVVsgGKViZSXE3rK53oLM0llEYELNoyFPm7/7Vp404=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cyh0w/j9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD00CC4AF0D;
	Tue,  4 Nov 2025 13:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762264518;
	bh=5Osg+3PtpysyfGfQ66SX7Qtk71vZvS2ovW93DWIR9fY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cyh0w/j9LfsRSyHmcvunHRg2C6DudChft4TNkk+4c/nKKyaErOXr2A0wMiDfhvIoy
	 eraLw+97jLee3odg5/JMVOghEWzqLhmzs4y6VThOiw+wdvVvJ0moinx5r9OSdZBoEa
	 hCPcD1uecDEIKfAnwT7CCcX0F8wJaqT40KbcWFBYnUoRDSTdEFhmOU/zCIEgROPVxS
	 5s8lbDAjvoZS0hRzFFdt6IagNdGB/1PEzD5qfJcE6M53AZRMoDur9ZNpw6OBTfVzxT
	 2pchh4AiI4D2DAgK21GW+Bl9AGNnDNx/qX7NVBgIqEKS6BOxLKuTAXcPsSG9yP8+nO
	 1jlUj2OojgZnw==
Date: Tue, 4 Nov 2025 08:55:16 -0500
From: Sasha Levin <sashal@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-media@vger.kernel.org,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 6.17-5.15] media: em28xx: add special case for
 legacy gpiolib interface
Message-ID: <aQoFxNFkvGOzOAH6@laps>
References: <20251025160905.3857885-1-sashal@kernel.org>
 <20251025160905.3857885-118-sashal@kernel.org>
 <d08ad8bb-d94a-41c7-8bfd-9c4e8c054785@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <d08ad8bb-d94a-41c7-8bfd-9c4e8c054785@app.fastmail.com>

On Mon, Oct 27, 2025 at 10:24:47AM +0100, Arnd Bergmann wrote:
>On Sat, Oct 25, 2025, at 17:55, Sasha Levin wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> [ Upstream commit d5d299e7e7f6b4ead31383d4abffca34e4296df0 ]
>>
>> The em28xx driver uses the old-style gpio_request_one() interface to
>> switch the lna on the PCTV 290E card.
>>
>> This interface is becoming optional and should no longer be called by
>> portable drivers. As I could not figure out an obvious replacement,
>> select the new GPIOLIB_LEGACY symbol as a workaround.
>>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
>> Signed-off-by: Sasha Levin <sashal@kernel.org>
>> ---
>>
>> LLM Generated explanations, may be completely bogus:
>>
>> YES
>>
>> - What it fixes: Prevents build breakage when `GPIOLIB=y` but the legacy
>>   GPIO consumer API is disabled. `gpio_request_one()` is only declared
>>   when `CONFIG_GPIOLIB_LEGACY` is enabled (see
>>   `include/linux/gpio.h:88`), so compiling code guarded only by
>>   `CONFIG_GPIOLIB` fails if legacy support is off.
>
>It's not needed for stable and has no effect in 6.17. This is
>only a preparation for a later change.

Dropped, thanks!

-- 
Thanks,
Sasha

