Return-Path: <linux-gpio+bounces-3681-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BB1860D40
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 09:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46910285DE5
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 08:53:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57B622F19;
	Fri, 23 Feb 2024 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PXuVHDv7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCE841F93F
	for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708678376; cv=none; b=AuZT3AP6/HZHwWxrkRmS6629p0P5Dt3DPvrdA/zOBUtrd2KtZVIx/WuJL15gee2WDh8fTnVS6/taQatvBU9757u6FrjWjGlahZ373XnfW7fm2jtdieueyBjRt5pBzc/BxZ8wZ+MgHOccp0RiJpVW49LQuPShr4aoNoimrqArXzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708678376; c=relaxed/simple;
	bh=g3DztYcYHBisCopsdrxWdHuka4aOsmyFRpTwNGTdka8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rDoJgN0fkBFqbag/nxXofBqVWY7O+m+VZpVv8EKnKEXAWkqt9EQ5CoNfC5viZ5mun0QCDXARNC1+BU9VzTCplGldNXMHNqShdZzUAbImACGD8FFTesLkAyf/OKvuqZsoNMjOS+CF1n5pGHUE3asl4JgfsyMHWRtDUI/WovzyWGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PXuVHDv7; arc=none smtp.client-ip=209.85.222.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-7d130979108so295768241.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Feb 2024 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1708678372; x=1709283172; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3DztYcYHBisCopsdrxWdHuka4aOsmyFRpTwNGTdka8=;
        b=PXuVHDv7ttgoKljLtHg1q5B2kI53x9Zt8MkfSZNgfj6OagxkIH7wVgo3VUcvrXwatM
         sjvFhCwKWNOyfwUwYJXnu+De/hhwogYjJy+/gWDRG22UBOrW4OtfKXE/9jzH1Acaj4TW
         6TnUAYytwkWn2U87LsfvlnpKqD6fBn8Dyl5NUe2F8nDoARgFIBK64H8qyV2m+n6BEAuT
         OtzjQRDsodZT1NO81BFBu17T4AX6pTAIebzAKUQ78JUaJQ6QT90XbGHJwfGsU7pOfSWq
         OMQ4labVFxydeatcxAvpo0eU8eLYzlWJ26W+gPJacFaq59GL6Zrft23gdjXO9PoGhqPI
         Licg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708678372; x=1709283172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g3DztYcYHBisCopsdrxWdHuka4aOsmyFRpTwNGTdka8=;
        b=PfA8ILx1CGXvBSXl90Rj7C45DADL4ewRW2i0LVbeFNPTiujVD3Qkq+uF6HfpjsGUz7
         zOGCuljbhZS31x8k6UxT5v38/iSH8O7nYXk8PmfEdl7ZXdH9I7FR2s1SSRHEEWUjjPwP
         bPfmiDe5ibJsyf7fFAsbreYO9BNkgAGFGq0I4uGaMFdewqwafJPkwNpcDJVXN7E5PmaK
         DKcaUBHxCwnCkNTXZYTwhJBWAlG7hxEupfm0ydGkLhAsJlM6oJltFmbKlrMS0CvuJeag
         NQzmyQ28pSOQKHARTW/a65mfeNhfEVy/dRL5xZxXkdJBgNpo8MeW2yPZtJriS6Ad9xwD
         q1gw==
X-Gm-Message-State: AOJu0YyalqoFDNL0023+BA8GCdEgJ1Z+i6Ds5viIfwhewlF8Rn0Oyuav
	kDrh5Reg9ACaSNwjOhWHfizx7KCqgKhxJDVmBm71DlMqnql6r/tIDmGKH9quCTIsR0rCXziQ4aY
	CetDN0ZfoglTGryULwplSJ+FE+nIlBqK6hCDtDg==
X-Google-Smtp-Source: AGHT+IGaNMTtSVEdubH2GbnyG0AR5Hk5HfywbHtxHiKnvps0Jai1ymSs8LeNhk2vr7Lhe8k1UI9Z3510AGzVnVThweE=
X-Received: by 2002:a67:b649:0:b0:470:498e:7e67 with SMTP id
 e9-20020a67b649000000b00470498e7e67mr1328030vsm.19.1708678372633; Fri, 23 Feb
 2024 00:52:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214104506.16771-1-brgl@bgdev.pl>
In-Reply-To: <20240214104506.16771-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 23 Feb 2024 09:52:41 +0100
Message-ID: <CAMRc=McYim_fkvatZTSzXa04-=7OQ73PjMVh951uR_engoE94A@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: add lockdep asserts
To: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 14, 2024 at 11:45=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We have three functions in gpio-sim that are called with the device lock
> already held. We use the "_unlocked" suffix in their names to indicate
> that. This has proven to be confusing though as the naming convention in
> the kernel varies between using "_locked" or "_unlocked" for this
> purpose. Naming convention also doesn't enforce anything. Let's remove
> the suffix and add lockdep annotation at the top of these functions.
>
> This makes it clear the function requires a lock to be held (and which
> one specifically!) as well as results in a warning if it's not the case.
> The only place where the information is lost is the place where the
> function is called but the caller doesn't care about that information
> anyway.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Patch queued for next.

Bart

