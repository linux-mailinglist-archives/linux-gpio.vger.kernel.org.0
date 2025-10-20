Return-Path: <linux-gpio+bounces-27327-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D1DAABF3C29
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 23:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8844818C4927
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Oct 2025 21:34:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAB402DE6FC;
	Mon, 20 Oct 2025 21:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="E86mJ40O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AFB22A4F6
	for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 21:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760996017; cv=none; b=B4stVbzO1mgOtCYwLO2H3L08qGTLErn2fRRSYbm2yrpfWIwT7XKCh2mVy8OOMEnDSLvHehilaWA3Gb3MG0wCBIHhqbQhr78H0J4eX49xINizRqf+TXKq12KuoOFmh/zpB5dLe2xAYFzyzjX3aHtpmw9MpXaXLnUAOt0ydTQON9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760996017; c=relaxed/simple;
	bh=YrGlth5fvXPzZeAmBmyPZPRYd5dwsROMF4koS4KTwi8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qAW6Bz8W3P1wuMz6ZEFaPaqLxhDhfzq9VLHXS3eYtTIPqawOvgatWqoGZ3d96cvoi15d8gy/DRiMqKq7AltABQtX5Z0ocBTPjCZnIieWH4gLA3XzFvg3UV3iWg9VgQwRs61g98psNj6C0ibsC75v3yzuaLGoBu0Z97SP9+CR0JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=E86mJ40O; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-7849f01e56eso18293377b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Oct 2025 14:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760996015; x=1761600815; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YrGlth5fvXPzZeAmBmyPZPRYd5dwsROMF4koS4KTwi8=;
        b=E86mJ40OvCSR8ntDIfW649tLJ3wA7fiz3uKUgMSOyJ9DZi+nQQwGOqK08FRAv48nMP
         d4EZISYUjzAQ71gtqtDL9uvu8yZqO3WES3b7L8fFqnr8JcSxV4av+x3iW2c1Twp7cWFZ
         XqtiwPqsoUUItd5AGt4ifPohAmmWvCA+VjTpHl4MnKC/4iAU+K1YtT2aS9PkjhK+IBOo
         LfHPtBpjQYk04TObgLLk18+WwBetmrP6r7/Dog3zLmgsQoB5XVvXxjdrU+teHpViHQYG
         8xhYcwfRHlfmp/9u9BB/gedTapeadLnLHjqkTOhiq5/zyNXFBiGAU6sYTQOm6Bd4g1rh
         +beQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760996015; x=1761600815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YrGlth5fvXPzZeAmBmyPZPRYd5dwsROMF4koS4KTwi8=;
        b=ctQPQrS8oUSjclV6ra7gEINEgR2uHoVfVpCw5tQVPKIFBs5Wf5NmPPeLmAWzoOXdpd
         xMuBQ9yWx1SgYwYXy9uW+okt/J1O/446dhKFwq7kJgYECmutD6VITnGKbxRc+rt/ewOc
         ImrQ0MvOLGpzU1B+ww21jmi0oHmZIUxf06dSLMzsjltOJ7tjcYliWY+titHnDRvPi+AI
         YgYny0ibyhbRP/KpERCfFPoFWyjpb1+kbxgyuSwuek4xFnYgeGFN5iT523EzGoasz9Ga
         VA1Ck62dujiIx9RK02L/a/Skpiz20PXUe3/2XBD9mADFf0lpsB0VbyJgB2aUgd0TMXru
         Ndrw==
X-Forwarded-Encrypted: i=1; AJvYcCWveNG1k4nuqoQbXtjcUnrJaSFpHvyiwq0G57ZS1wnaWx/5m2tRQEi/FWuWnb3xsbpkREJVrP4PCssc@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7u1DBwow3whNpqAOuJhNGvjHOfcLor5469zP2GE5vdaFXigCy
	U/TXXqlhH0lKrAqOMbJjZm+vLUjAPON7EKsFE5t7UCMPvGJwxfZ4LxOAlGr8BN0C8H+we9aat3A
	Bk62foszmjoGOIM5NDQ33wqud9+L7dAH/1qvh4I74WA==
X-Gm-Gg: ASbGncsuf0t0mcyVpH2wx1prlyxSxgnm4cs35TwhWiiAWqaALApehIPVz+oPtPLnv/s
	AWy8nSUDNMgyCv1TOdTiZi1yufZN4RYxNvCr1wTBiUFgEtSTWAnA9HiSbc64NelS9wDmJ07zYN4
	Od8zvuDu98KxS+cICt30YiBJ0vdSVcX31rRuPzFRHnPtUB98HJLrN6LFIZ7No7HRYL4pMlH5Cbl
	toZOgLv3N5uc/VmUhj3n75a2v+Te2Vq412xhSVWIBB4/9DPMVVXIK3H0EVuvd6CPOadrkM=
X-Google-Smtp-Source: AGHT+IGnAj+PvLwk6sz8k8VBBs+rDQFENAxd89cmxP0Cskfc+qbx8RLj0mUzmzdGLHOstur2GpIPaCgQ2XYuSy6QrTw=
X-Received: by 2002:a05:690e:1558:10b0:63e:1531:b3dd with SMTP id
 956f58d0204a3-63e160e3c4amr9861710d50.7.1760996014901; Mon, 20 Oct 2025
 14:33:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251017074646.3344924-1-gary.yang@cixtech.com>
In-Reply-To: <20251017074646.3344924-1-gary.yang@cixtech.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 20 Oct 2025 23:33:19 +0200
X-Gm-Features: AS18NWCltDS_N4NaY0c3A83FgC_-lfyfiL8AVRFFfvMHb2dlUjXD7k7Kzg6VMk0
Message-ID: <CACRpkdbcSkKnwODw_utWEUcwg+Q=_h=psM6ZKphGUr4iPqK4XQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] Add pinctrl support for Sky1
To: Gary Yang <gary.yang@cixtech.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	cix-kernel-upstream@cixtech.com
Content-Type: text/plain; charset="UTF-8"

Hi Gary,

overall this version is starting to look really nice!

Please address Conors comments, then see about the
compile error on the driver itself. The code looks good
otherwise.

Looking forward to v5!

Yours,
Linus Walleij

