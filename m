Return-Path: <linux-gpio+bounces-3602-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B2785EB64
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 22:52:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7E2731F21CDD
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Feb 2024 21:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2826B127B4C;
	Wed, 21 Feb 2024 21:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yJC3sfne"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F9EB126F2A
	for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 21:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708552339; cv=none; b=Yuy/NymZkPS2YqriQzEig5ra/frV1pyGK508O7yzBYqLJspZspCqEqGDX6Y47KOoWaSwhxqTBaqbO7U2RyXHbDlqYcm3ZJQ/nv75Fgx62+GmC3B+ZusPNS2Jtz6TtNNPFdfP36ulNbkTzRFN572TA3jRINp3CpTJGy6Rj/yXfYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708552339; c=relaxed/simple;
	bh=bzht/Nt79TBhvidvy4BPtQQspNOTYBbbyEtc9N8nXOI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPYGh3qF2yVR/7X5SnD6GvYUPX2ZW2lEcJNRmYD6bA5m3bQVlf9MewaI90ej61fGhSjfvzptucoiHIeIOZozvEwcvwC+t6ebdhkHAxouA5bBd+vYJKKPrNMDtpPEckYqetGXcpoZjXHyctcxxRH3eoUa0y4eW5zPebz4PbXtVIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yJC3sfne; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-608245e549fso43712217b3.1
        for <linux-gpio@vger.kernel.org>; Wed, 21 Feb 2024 13:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708552337; x=1709157137; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzht/Nt79TBhvidvy4BPtQQspNOTYBbbyEtc9N8nXOI=;
        b=yJC3sfneDshWoiPllAc1IbgTGGy3EusgMMhNte3bjpyzna6qXPDIgv7uLIPO8DDDwm
         /AJi8Axf4vemq95Ka0z29scY/Gb26+e+6jwPYyaRt9BANLszu3PFAX3X0fezmRDZw2ag
         Q26jucFPGCrrzdQHvbyc0JwhY52nnUk4TAY+YSg3ckeJo4CM8inxAhfaycSOvl/9Y6sl
         k8zJafdZM+X0lU1nq1keo4L/MHtSVzY/bvCSHg1GGMLTWOuNZ29kZZ8345m8Qpn+vMFL
         QOXytfy9nvO694o6ox8rWM+ME8gfO4f0NaNF//XVIuvtjDMrTS3B3jf3z2m5I7wYe1jf
         jPzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708552337; x=1709157137;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bzht/Nt79TBhvidvy4BPtQQspNOTYBbbyEtc9N8nXOI=;
        b=puJw05ZrGGhDcifD+nsLwnAWcQ7ll+H7csfEs56ULl5+xEdvEFcDsQ8ZeP7jR4BHKl
         eAH6MLCFcJGuPISWhp/XdYcTQeObYkyi00YCqvTum36WJVnABp70RnLPwC3SLk8kJC/Z
         fJ0yttBYPeoU45d1Ef120tU9qH2RSFnoyWi1Pk6h0fCa8B2CWZyKvXCHU22gkXc/8Dcm
         QX57aaC0u/mIyaVYHu4vi5S4SbcY2DKWArIfMSAm91bI07V9qudiWfd2eCos2X0l6YnC
         xHe1Fp/XT0f4gppJoyNipLTQz9UNmw4z8AajU4ATlveCWC9Zr5fTyX7+8Epn8oo7s7j9
         PDIw==
X-Gm-Message-State: AOJu0YymWXdWWCPPgZWmmldR/CGWrHPcpMnt6/xms7qorqYvfddWbf2/
	1Wf1MVuYvu/JPKQnyuCqv/6s+y6VtyZGjy93l/k/1FebMFmwvF7Qki/e+mwNVK8zHyF8q1Ba9BH
	858YoQLozr9MTlOp3H3R2bcChGldFw0s8nlVy8A==
X-Google-Smtp-Source: AGHT+IG4RntqxvQH+No+/mHowhisXAh3Eg+k3FlTdY3OImy1ZRhqZIM2nXFg00beBZCO+ESfsnQ+95ANDllNWVf5Ers=
X-Received: by 2002:a0d:d7d0:0:b0:608:93b6:87bd with SMTP id
 z199-20020a0dd7d0000000b0060893b687bdmr1342031ywd.34.1708552337481; Wed, 21
 Feb 2024 13:52:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240215083328.11464-1-brgl@bgdev.pl> <20240215083328.11464-2-brgl@bgdev.pl>
In-Reply-To: <20240215083328.11464-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 22:52:06 +0100
Message-ID: <CACRpkdYJcd0kLSF6+Mv6T8rSgqW+Sf3t0dZt9Pu3fGHGiY3LMw@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: sim: use for_each_gpio()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 15, 2024 at 9:33=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Display debugfs information about all simulated GPIOs, not only the
> requested ones.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the naming of that function fixed in 1/2:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

