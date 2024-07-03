Return-Path: <linux-gpio+bounces-7999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5B1926023
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 14:21:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A1B4AB303B9
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2024 12:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E885F16DEAC;
	Wed,  3 Jul 2024 12:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b="X8ycZc6C"
X-Original-To: linux-gpio@vger.kernel.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A64EF155A30
	for <linux-gpio@vger.kernel.org>; Wed,  3 Jul 2024 12:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.43.1.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720008116; cv=none; b=m5gwuFdZ+/96VRGgiRa4JbpGoFYevPwxJ3CLq1uqsw8OQHWYxi2rUwUvR8TFjFGfHurfblx2gxm8bCfZBfqDm1A+MiquKNKYf8tNbuM9he4xkrzgiRcDanffXy4RIzy4BhX6ImNtIMhBQsOJs2CxhN370Of042F4pv8If/R91SU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720008116; c=relaxed/simple;
	bh=9dAVyCHJUbpgsOwKttgwckaAuEHsLYcRK6wZ/498yis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D49Y6Zw5h9kh3zMjk5RYUuiw/rzBjAA+9z69tON8OjdL3M2BC7YXm/Rol2aXslZpIrTTZ5pok7LUv3RcK2oLLbAdew4iG+l5vsKgUt44ztYgTRsWqbnyVkPCjhbRrUIbBuFB13j8LbHFB3PZw+hD5y5XpMtIeGlJaxdbmdkYunQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org; spf=pass smtp.mailfrom=kde.org; dkim=pass (2048-bit key) header.d=kde.org header.i=@kde.org header.b=X8ycZc6C; arc=none smtp.client-ip=46.43.1.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kde.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kde.org
Received: from tjmaciei-mobl5.localnet (unknown [131.254.253.210])
	(Authenticated sender: thiago)
	by letterbox.kde.org (Postfix) with ESMTPSA id 4AC793277C9;
	Wed,  3 Jul 2024 13:01:46 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
	t=1720008107; bh=ecKTykRRJYwwpDqE3efwVdHznyRH7/FxVk8kx07r2S4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X8ycZc6CSnLhgRBB/MBez4RWKc3Kj+Tc5ECz36JavRPGABDJUDgZURbr6b40bpD4i
	 h2bde3Lwp+5FwMjFEPsaB4rty/cH8q7iitgY+F5g2/D943uN4IoyaGCHMwzaO+bXRD
	 a0L8teHUvDUl1g+W6b0CaKdIK7g6MtGa39l+TjpOP/qXO/x7dfYp9stYWR6MIcq3MV
	 chCAEJJL1Zm6tOl0C9hLUZgWLJe0Rb7MGPv4HGlKfN9NMja+6JyLIudeUOS8RvTNB+
	 DwChWyFgKV+mD+a2nD3ncZKCiC0R4exYKHGfXkoeRKa3mMDLnsE2YtDaOYyj2Zfms6
	 MLriG77H9MvLA==
From: Thiago Macieira <thiago@kde.org>
To: dbus@lists.freedesktop.org
Cc: "dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
 "viresh.kumar@linaro.org" <viresh.kumar@linaro.org>,
 "warthog618@gmail.com" <warthog618@gmail.com>,
 "erik.schilling@linaro.org" <erik.schilling@linaro.org>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "dbus@lists.freedesktop.org" <dbus@lists.freedesktop.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "phil@gadgetoid.com" <phil@gadgetoid.com>,
 "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>,
 "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH RESEND libgpiod v2 10/18] dbus: add the API definitions
Date: Wed, 03 Jul 2024 12:53:52 +0200
Message-ID: <16081423.fTUFtlzNnI@tjmaciei-mobl5>
In-Reply-To:
 <CAMRc=McaFTy+csg+1McRjMNDkYond74VSrJsQ3mETp7dJoNtnQ@mail.gmail.com>
References:
 <20240628-dbus-v2-0-c1331ac17cb8@linaro.org>
 <1867994.25eIC5XRat@tjmaciei-mobl5>
 <CAMRc=McaFTy+csg+1McRjMNDkYond74VSrJsQ3mETp7dJoNtnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Tuesday 2 July 2024 11:15:11 CEST Bartosz Golaszewski wrote:
>  Therefore, my advice is to not have the API that can lead to TOCTOU, even
> if
> > by accident.
> 
> Unfortunately there's one issue with the above: requesting a line
> (even as input) may result in the kernel driver triggering a physical
> change in hardware which may be undesirable. Inspecting the "Used"
> property only results in fetching a flag from the kernel and will
> never make the driver act upon HW.

Ah, that makes sense. Thank you for the explanation.

-- 
Thiago Macieira - thiago (AT) macieira.info - thiago (AT) kde.org
  Principal Engineer - Intel DCAI Platform & System Engineering




