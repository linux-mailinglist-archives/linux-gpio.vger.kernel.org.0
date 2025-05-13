Return-Path: <linux-gpio+bounces-20018-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F38AB4FAA
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 11:25:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B02F11B44B97
	for <lists+linux-gpio@lfdr.de>; Tue, 13 May 2025 09:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 003F5217668;
	Tue, 13 May 2025 09:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X8SnbIPY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CCD20CCE4
	for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 09:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747128197; cv=none; b=CApgjgaa84B/vUS3ATPSvWwmnx6qq5AAh+4EG625PV9DXTYQ2/cS3u1kke5E1BnqtJ6n9wSnS7PhaPRn/V3NISqoYo3pRb931h1f9ZhV95KIAangWFhoWg6uv4VpodlOpagD+aDkI4XLxmirbBtGSGAp8+XFexUyYO1Hf0yE1Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747128197; c=relaxed/simple;
	bh=PUZdM1h8WI1vqC/o9GJnYO6sqlQvrPktbx07wyl5Imc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpKwI0bfyDCt620Is1tmlRlIVjIDk866m+YC3A2skxgZaJpZ9kQ57C8pe+V7LTXSEglKYv4nRh4eNukXZ1Kr814ydZ+KdyW708dY+kLi9MSLZqVkwfvAr5t6x1g7FD6/hXEyWLPj+E8B7tFGNjKyPI5UityMMrQGDNZP/YU4CK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X8SnbIPY; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5499614d3d2so6852123e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2025 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747128193; x=1747732993; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUZdM1h8WI1vqC/o9GJnYO6sqlQvrPktbx07wyl5Imc=;
        b=X8SnbIPYMfVAzs5kZ2Hfs7BjnVNEnljduCrMqkyWSt1XZQK8XQinlzhXx0CI0smPFk
         HI+JRIG+4b/ktseLIMSa7UgpZ4ycRWlTk2OOjfSMiYp2nX9Pr2W+KfUeOTFI4cDYwS9x
         Qn0/jrdmRct7fglUKE6c4/2/ALpNOi+dHhwQbvJfjaoOx152ipOTyllOi1FrjdXYcOQn
         jipBemN/GHYO6xVNnNNfRKo6zLUA01Ppj16jpBa82YL/Y4QdBMtscjc5Wdb1FhD/VNUR
         AniHqDQaujOSNMHZNkc9q7eEnXko4LVEats/oP7UZBe5iTbFpTZu5r4RdpnDYu5Q0oI3
         bmDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747128193; x=1747732993;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PUZdM1h8WI1vqC/o9GJnYO6sqlQvrPktbx07wyl5Imc=;
        b=D1FWNMZ6B7nW1n/0drRgutXtjpYvrspNNt+yk6UQHRqfPKsytpG4Vu06NcQSKOtBVG
         quV2VjlJAz1eAOGwEc0coET/d038JGF/+oZGG5b7j4MteXXulO2n4rleISqwAGzI1+Nh
         4xUJdlutdsQPXTpQY4jlePm9OeTUpVJ3WK5vGlEDYK28340PO9oyK7+g9lkv3+UBdT1V
         b9kFBSHEkQWfWucRmEz1vnPd50KixL+Vrkw6Kdx7442d3FswuQR7te6V8IOUwyTV0v3s
         2yw8mHQBCF70h8IUuDfqbkSmg51DU6D/t7Y6Ckngq22uciMIWWNHXt8UgYi3r73SrJ5o
         8lfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFwCqq0Q/Wr3IXbii1+r1TFeGTTCOmU1DSjzaEwntnIJmMT5Tms4OnggyyG/OpnTa0ET9+zBq9a1ic@vger.kernel.org
X-Gm-Message-State: AOJu0YxbewbgrUEAQCInxfCuK10qXm7bUBMM/6omStN9L+sCHgzKkKSo
	Wf45B1/vakYXUxBOmuPc4XcFz7brK0mliKGkoOD7wiNyULkR5PFqP07cq+b+75AgqsicYr3hXRe
	7ibFEYqPesKJRzeqLvWXdWBLlPO6wVjhS9Q+qWh+75Z1lmq5PqYM=
X-Gm-Gg: ASbGncskPhOugrnwU4YngHy24qKFjNP8QmcR85VI6xeN2QJMCfcIjmq+yMxC7NT0LID
	bZOhz6bnmdd5ICQAIVaVEFIVMIo2uyyFvVGLe9lpBNs5WZJUAIhi7Cf414Pqgi8ts2yXRdtfzrk
	PwoIfiKeMsYnaznYz9+mNLBN/MHA6oJv/L
X-Google-Smtp-Source: AGHT+IG3yJ2I/gSRbNR8Yc9mQ5D3H3jOM524XFmnhYp45I4Txi2GP3DWvoHzF8HaXmyZuGDfMmUhius5uFgg07Xw0xs=
X-Received: by 2002:a05:6512:660d:b0:54e:9c8d:bdc3 with SMTP id
 2adb3069b0e04-54fc67eba75mr4238045e87.49.1747128193339; Tue, 13 May 2025
 02:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <5889368.DvuYhMxLoT@rjwysocki.net>
In-Reply-To: <5889368.DvuYhMxLoT@rjwysocki.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 13 May 2025 11:23:01 +0200
X-Gm-Features: AX0GCFuBGgsy8OIbyZ_iRPj1JK6HiLr8l-sZYvuduHVP_RhHrCBW63Oul_hd7iM
Message-ID: <CACRpkdY57K7_rhQiXKbOpTGneQRvpJ33E-fG8ejMHzcBaTQE9g@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: amd: Fix hibernation support with
 CONFIG_SUSPEND unset
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc: Mario Limonciello <superm1@kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, 
	linux-gpio@vger.kernel.org, Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 8:27=E2=80=AFPM Rafael J. Wysocki <rjw@rjwysocki.ne=
t> wrote:

> From: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>
> After recent changes, pinctrl-amd will not support hibernation when
> CONFIG_HIBERNATION is set and CONFIG_SUSPEND isn't because it will not
> register amd_gpio_pm_ops then.
>
> Address this by restoring dependencies on CONFIG_PM_SLEEP where
> necessary for hibernation support.
>
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>
> Mario, this is on top of:
>
> https://patchwork.kernel.org/project/linux-acpi/patch/20250414203551.7793=
20-1-superm1@kernel.org/
>
> which is currently in my bleeding-edge branch only.

It seems the prerequisites are in your tree so take it there!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

