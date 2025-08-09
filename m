Return-Path: <linux-gpio+bounces-24103-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B287B1F24D
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 07:19:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C65BA7A66B2
	for <lists+linux-gpio@lfdr.de>; Sat,  9 Aug 2025 05:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09EEC1AF0A7;
	Sat,  9 Aug 2025 05:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TOzqHum4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB792E36F1;
	Sat,  9 Aug 2025 05:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754716740; cv=none; b=B1Os1/SWMHDVF1Oqcn65FNu5LTcFT8lf+VojPy7ifzKNZ0+FNKg3M3KO0aKIPdpDCSLBSmjoQTyU8mf3FqBfQUipkOJNxlkKq7fxhQ+JWYMjj8fC7HEao/RTD9Z3876vs7zUnYf69dL6Yp2ji1F5jZjWFBgR9/ITCCGLcDypP94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754716740; c=relaxed/simple;
	bh=qvjDMmXyOK2nttH/09NCtPL5SrglezERY4VjqmWwmAc=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=IR3ZkS2ZMp6pv6mQDtkSNDRlK6jHRTz4quan6UTID8mQDAvNCXZod3xQ6UkHdBJ7uzMfeeq4a1e8GDdkrEUGf45Fkx+7k08JKnfvIU9AvPjN9Pyw6EviEXeNDHDDYyQabYaCwgfF3G5MK4HmTHnVYf70e3WlMTPvTn5DorTjwkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TOzqHum4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F11DC4CEE7;
	Sat,  9 Aug 2025 05:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754716740;
	bh=qvjDMmXyOK2nttH/09NCtPL5SrglezERY4VjqmWwmAc=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=TOzqHum4jFYLIYm1dSPdWcINYK95CYPNePxs+t5GgsKSYvcvVp6RRxdlS4NuhXOCe
	 FCeAx3ppRbPXEVYkI94GhFf6QGb1UyRw5l3+VI52CiXq9ANwinYTsKmUA+aOb9zGU4
	 Uv5DNKD8UP0OLFIhZmJvgnVN5O+QD6iTQA3oFUr0fRqom+XC/asrxc0IINs/lCF/3v
	 GAnwYppHDfIiRWk6unocDPjRhXR4ciDaE/KOOA12/WULxCG/aLkWJNhURxaG8fZexE
	 YspAfcwFkgxApauWiBGt1nqudMtk1NvfuPMXavTLMSFnZnZTAESqv1rwAurC+AUPd6
	 wMub6zqwhM+SQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAEEC383BF5A;
	Sat,  9 Aug 2025 05:19:14 +0000 (UTC)
Subject: Re: [GIT PULL] gpio updates for v6.17-rc1 - part 2
From: pr-tracker-bot@kernel.org
In-Reply-To: <20250808105436.6021-1-brgl@bgdev.pl>
References: <20250808105436.6021-1-brgl@bgdev.pl>
X-PR-Tracked-List-Id: <linux-gpio.vger.kernel.org>
X-PR-Tracked-Message-Id: <20250808105436.6021-1-brgl@bgdev.pl>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.17-rc1-part2
X-PR-Tracked-Commit-Id: d9d87d90cc0b10cd56ae353f50b11417e7d21712
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0227b49b50276657243e54f5609e65c4f0eaaf4d
Message-Id: <175471675348.380510.5828402634859158762.pr-tracker-bot@kernel.org>
Date: Sat, 09 Aug 2025 05:19:13 +0000
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

The pull request you sent on Fri,  8 Aug 2025 12:54:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v6.17-rc1-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0227b49b50276657243e54f5609e65c4f0eaaf4d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html

