Return-Path: <linux-gpio+bounces-27994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8438DC2E9D6
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 01:33:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BC9284F67AE
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 00:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25B5D1E1E1C;
	Tue,  4 Nov 2025 00:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="udnemSmg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA8681DDC08;
	Tue,  4 Nov 2025 00:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762216205; cv=none; b=MCcyM+yDBYXqU8eIMriWOgcOFc/ptbnEXmA430Dtu8zTXuDOvjsFc/iDSToonoUC7+FWoilbyFG71AASH+kx9Kk/NfL+E01Un80hOMIaBipPrXx+H3a4MBo1Y/dwtDytuPB4D1JP2llNCf1NO0wSOt0xAmEn5u/dusZQrn7tbC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762216205; c=relaxed/simple;
	bh=iJMJNhNBLd6Bi9oD1RrYVw+Wsn/1D4yN1mvr6iSp99c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s7y6xDEYfRC5n3w4i1nUWIHqvzshQj5skT5INmZBB0vSquXaIo6V2tBvJV5Vo1AxVH94Gb8hKiUtad8uS1/twFjXY5I4WynmRjnN6Ygi0FXp1bc0x2fP90Y/JruWSVwqwrarVt4+Z3b9LcI0QsZEtK9pVQ612oeY/3/WgTFsfxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=udnemSmg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C071C4CEE7;
	Tue,  4 Nov 2025 00:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762216205;
	bh=iJMJNhNBLd6Bi9oD1RrYVw+Wsn/1D4yN1mvr6iSp99c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=udnemSmgJ5Twje+pwLqijw3+rrKwcnQZ4Bd7Sy0f9MMXUyr64RTyPxCGERy0A68mW
	 enek+oOpibPe+UxPtcF3MYY9P2ce1rWku5vbWYJmItouzReyAMozdHPvua4sw0LZ53
	 kQI0aasqvcbSWj39jVureDRztmi9ePp/AkfWXhzIrvtt4PxMD1C0yqAnLWjtDyFsZG
	 r5rt1FTdc/ii1ciOKftR1FA4SjrPUdMADYMSZLleLKQJNnWQ/PZ1oj4JU0qWPtrm8W
	 r9eQW1eFJdZqpc6CC0/QXClnxvCyeM6WXQWpBkFuLbVma5cqZkyawzz7Ncc6SGxIN+
	 P58sG4qzvL8og==
Date: Mon, 3 Nov 2025 19:30:04 -0500
From: Sasha Levin <sashal@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	kernel test robot <lkp@intel.com>, Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Mark Brown <broonie@kernel.org>,
	srinivas.kandagatla@oss.qualcomm.com,
	ChiYuan Huang <cy_huang@richtek.com>, wangweidong.a@awinic.com,
	nick.li@foursemi.com, Richard Fitzgerald <rf@opensource.cirrus.com>,
	alexey.klimov@linaro.org, niranjan.hy@ti.com, shenghao-ding@ti.com,
	linux <linux@treblig.org>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH AUTOSEL 6.17-5.4] mfd: si476x: Add GPIOLIB_LEGACY
 dependency
Message-ID: <aQlJDP0rU8culpf8@laps>
References: <20251009155752.773732-1-sashal@kernel.org>
 <20251009155752.773732-102-sashal@kernel.org>
 <a137ca66-710a-4b0c-91e4-c69c68a21089@app.fastmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a137ca66-710a-4b0c-91e4-c69c68a21089@app.fastmail.com>

On Thu, Oct 09, 2025 at 06:03:53PM +0200, Arnd Bergmann wrote:
>On Thu, Oct 9, 2025, at 17:56, Sasha Levin wrote:
>> - Why it’s needed in stable
>>   - The GPIO subsystem recently made legacy interfaces optional/fenced
>>     off, which exposed drivers still using global GPIO numbers. This
>>     patch is part of that follow-up hardening: it gates the si476x core
>>     on `GPIOLIB_LEGACY`, avoiding invalid build combinations. It is a
>>     pure Kconfig fix with no runtime behavior change, directly
>>     addressing a regression introduced by the gpiolib changes and thus a
>>     textbook stable backport candidate for trees that have those gpiolib
>>     changes.
>
>This is incorrect, the patch does not need to be backported because
>at the moment CONFIG_GPIOLIB_LEGACY is enabled unconditionally, and
>the coming patch to make it optional will not get backported.

Dropped, thanks!

-- 
Thanks,
Sasha

