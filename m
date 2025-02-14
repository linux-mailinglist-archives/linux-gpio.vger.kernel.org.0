Return-Path: <linux-gpio+bounces-15986-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D0366A359F5
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:14:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFB9C3B04B2
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 09:12:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93A1F24501F;
	Fri, 14 Feb 2025 09:10:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KEVQshiQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F5A242925
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739524209; cv=none; b=Q2hmMvY/n2e0oQuwLY/dQOphiERNMdEl5YdRa1yDKOBrSR5r5SsDkvpVZsZVqA9xtoTEYvK7sMMWS1U+R3efuJwAei33ZDr+tkk4XuwmewSNi6bA/3VUY2WpulfhC36LRkni5R9gUCQ3HzA7Bf/Es5dA31Hg/99+E7FXjOnxk8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739524209; c=relaxed/simple;
	bh=DER3TMntGQq5jg7E86/NDM7bx6lqw/lzX8FEgotNMUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NqKsIJ3Hr8iTUnI2KK9RJ87+ogW+ulFDgqypLQjSvDxVKrhiuOtb6KmsVVUd8Zvfk30+7PMyXbnjxyKX15AkPuqoq1IDH+7RdNKcIxdztO3lF/PkEhxXwG3xSqEnqs8hVXocDYd6JFEE2+cHylKqh7/bNRwHc/LkaqVezEkIqR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KEVQshiQ; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5451d1d56a7so1963327e87.0
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 01:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739524206; x=1740129006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DER3TMntGQq5jg7E86/NDM7bx6lqw/lzX8FEgotNMUY=;
        b=KEVQshiQVvW/yhbbEuawfh5arnnzKMijXiqe7mZ1k+ZNvXcfC0IxX2pESBhVrK97ue
         /fAr/yPiI88bgYbLm73BDR5OloDF6j/oYSVth3HMejKsl4KkpUulQ0+hVi4iYBqUEp/0
         UT0feugGfAy/3CQPC9nPgqP01dwccfgjAzU5896WNfNf7EWHMDb2bRilp3anPuvI5crT
         Jv9pTQMZT+q3rxzTlvpSP9T9lD4Y2io/Cecxb3qr8JducIpFzSAbh+lmUhaVXzgYZJM7
         d0mHDP85aFpytG12T5wp0W/6RL/aHvN0AXn3XfycDkhOKKKR039gCGxb8kZPcW4RYjdQ
         wDGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739524206; x=1740129006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DER3TMntGQq5jg7E86/NDM7bx6lqw/lzX8FEgotNMUY=;
        b=dnDv2UZb/ZaO3Cun4CvqSBUEhx3zDbczUxi+91LEhcKW129L9mrSsP5oqowrTyvGuD
         52l98jOlcCPgF73IfSORh6Dk5L2oU+Y7RyPD87jRnXt7vmsIrYAauNrYoVvVIk58JKXk
         NXAnqGlKsFbgOklxE7K0Nr82u7dmZ8j7sbJnasFqin/mYh35MiGjXMrq9dvrS7QGTECe
         N67692ClHQgMJOnB5+2qSmC3pFc5tf8jgRYBLnEqUOS7ZBJCGqqLBpFbAv+Ra9L+MAI7
         +Ugd/DIsnIT5e5/RbatYu/0FVHXWAppJ/kUBXu8NvxjkhtVOoTxHZ923HSie7wmpVBvq
         xDow==
X-Forwarded-Encrypted: i=1; AJvYcCX5+6l1WjAin6lTFpOyrZSjULSY6Ucoi7ZG6/WpipDqUoueBEA85WGrBF4SvZm+GWserOHTpnsw8r01@vger.kernel.org
X-Gm-Message-State: AOJu0YxKjhOgNvJhJFMUCnAPF/Cgd1XEEbvP4fkMWZOU9ELct4QjDcBb
	kR/j14jbkwKNMmYmgNZF51+YrTQTDofs3KdamIt590XWNb4fvWUM3N1eEEz0pQydDFOfUX9v+bD
	CjL3NdoTrMOKz3KmnT969fu9+LDkPonglB3hhkESSbzGaAVqB
X-Gm-Gg: ASbGncvqSf33uQN0JXrIU9IYMjMGEyinF7tIGRv7tNGsCvFgk5sjJ5C4ZJiMtrtUA5+
	Qhi3us2x8FDMHxny+HgJvq3D74BoNGNYu+MaLx8l8Ayk1HCAP6Xkjmby8RahfgD9OvIjukByl
X-Google-Smtp-Source: AGHT+IEAkug4IoXZCrjNUEs/f2U7SdEyFMpm+LMsw0oq/cisRKgOMzIhJOtnVLJvvA6rdUxdvsRrfELmDBHc4ke/nAQ=
X-Received: by 2002:a05:6512:1598:b0:545:2474:2c9b with SMTP id
 2adb3069b0e04-54524742e1dmr1124028e87.22.1739524205568; Fri, 14 Feb 2025
 01:10:05 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122120504.1279790-1-mastichi@gmail.com> <CACRpkdbtjS54+g-K1azE2hHeTsiyzA_gFa2NBX6QZZ3D_H5Ryg@mail.gmail.com>
 <CALieaedTCPNkMBZaaFWME9LHDE5OypcaOw0uDBK5fFFcNSO=wQ@mail.gmail.com>
In-Reply-To: <CALieaedTCPNkMBZaaFWME9LHDE5OypcaOw0uDBK5fFFcNSO=wQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 10:09:53 +0100
X-Gm-Features: AWEUYZl9vF-zSUt9bEaQ3FecnTlzAqqBsm5OSza7G4Mrs2iP2A6zz2vX5Rkx2to
Message-ID: <CACRpkdbpWgZHUn4SouR3yL_xjhjnyC0ogb8bErDuECakyhPW_Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mcp23s08: Get rid of spurious level interrupts
To: Dmitry Mastykin <mastichi@gmail.com>
Cc: Sebastian Reichel <sre@kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"e.shatokhin@yadro.com" <e.shatokhin@yadro.com>, 
	"arturas.moskvinas@gmail.com" <arturas.moskvinas@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 9:36=E2=80=AFPM Dmitry Mastykin <mastichi@gmail.com>=
 wrote:

> I made more tests and think that this patch shouldn't be applied.
> It removes duplicated interrupts, but sometimes they increase the perform=
ance:
> a new interrupt may come during handling a spurious one, and spurious one=
 will
> become valid (it's kind of a polling). I see the number of my touchscreen
> interrupts reduced from 200 to 130 per second with this patch. It may be =
a bigger
> problem for users, than duplicated interrupts. Sorry.

Don't be sorry about that, we code and learn by our mistakes.

So is this patch causing any regression for users? Like touch
events being slow to react? Also the expander could be used
for other things than touchscreens. If it's not causing any regression
for users it seems like a reasonable patch.

Yours,
Linus Walleij

