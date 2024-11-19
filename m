Return-Path: <linux-gpio+bounces-13106-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 680B99D2777
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 14:57:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2898A283A7E
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Nov 2024 13:57:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 595CA1CCEE1;
	Tue, 19 Nov 2024 13:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHCges5e"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B0A17E0
	for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732024623; cv=none; b=DZPI2PbDcNrRFTz7XUalVkXerV0sbjlrt7mHyYGDaSnl2y/pzdS3htnEupbJRwe++xOgb4owzwgsLSN4bXozWF9XU3ywicvmka5Kbe0eMKEL5xm8cz6KnFHBlOsq7oZ3lPraIgIljHIwFe10xgI2nhRt92IHTZOF4kVsTuALe5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732024623; c=relaxed/simple;
	bh=VoCt+q+FUWt3YjXbAVyxijezoY1gaUZiU4/67lToLJA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sI0MD9gNGLjOTG7+o00Z6XI4r17//Xgx0lnpmvEBf0fBG10E5xGm9J2BWUjWKS96YqJhLx4VI/7Cund/VmdY7+Odmz8Wfr1OUtXzAfnpt6NFHydEfOfDni2cuyVA/wK3zyoBXAlNWtyyprckYMRlutd46juO5YVn4OhVZ1qs++I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHCges5e; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5101c527611so1300001e0c.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Nov 2024 05:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732024620; x=1732629420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VoCt+q+FUWt3YjXbAVyxijezoY1gaUZiU4/67lToLJA=;
        b=IHCges5eZYy/rF0ZjtejLsd3NA+ygGFNAK8YoYLQCuCGQpCulRr8FPFkdJLhSx3qXr
         fd+dxyucjQYO4OFybcIDXFmcKZLQXcABHfycu5WPwe48IRO7q1MxO/jYjamhC3dKUzYN
         /g4kHjIBddCjBcF1OmuXxPXKRUjogUvjf4zWWGB/B23m5JjGGU8LqokATe3u39BwCMja
         Wev+xUAx7hD1/QkVCNhcW5bwKvGeKmEpRon8mKYnbPG/pA8FymxruNZsXsQZkZcWtJfN
         TmwtXlfy4s9BVVT8UTspfbJwES4/tLvQA+MrRzTFNfiyGOngzVlqR/CgbsGII/JxmUbc
         Lf9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732024620; x=1732629420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VoCt+q+FUWt3YjXbAVyxijezoY1gaUZiU4/67lToLJA=;
        b=e899QQ39BuZIRknDKw6WEA7As3WEKOhR0BWw23gsQeDJUvR9bDRmHLMOUiDOZ0n4Fm
         cmkLreFqykCYSYDH+8I5nld2Qd8LtWLKomNLBaxG00MSEK0JkUKL2z3fvjQDYCvFj+QK
         pBe9HoVC0JRJnoZerz8bbS2440/kcK8rFzEtDigZnHgaGQZpPbk7uc+1mhnGruqFLRUw
         0pt0u1MVSvbTD46mRFO2aiYZNhgUghUfBpKz/xY2yXeKB3uS3RA0P2rnT+avdAToKXzu
         nxXNcfpd0+lzPo6TAaahj3AcHndGOBD813OTSxe/nPzN9QiaeBpXJSIZoxYzDbsfzfan
         dg3A==
X-Forwarded-Encrypted: i=1; AJvYcCVdINtdTbunAG/S88r9vsUqH+tiyNPAAtUQpwKqPpFLZgFVIuLDyOdfFzsjV+yG99CgBxGzBxaa1T8p@vger.kernel.org
X-Gm-Message-State: AOJu0YxGH1PHIdQHeXjkv9sozi7zQBykoIj+LVSI1T4FdVh02dPm+N2b
	+M0SyeGXurzhL6klNiXYKXBIOMw6ptnud2khyjgMR4qk2+MJfaNeISgmSX6nzM5lx5nlwSK3aeN
	4/oYVKfQEuynzzWzj2DdYl+RjnxQ=
X-Google-Smtp-Source: AGHT+IF9i1vtSrxV+429nEAJnL0EvNm+T51kQNTRlPtpE6iFiAIUNpVU+McAJixOaLkxKV6sBAqEmYnM6BYEmatoAqc=
X-Received: by 2002:a05:6102:3594:b0:4ad:4976:292 with SMTP id
 ada2fe7eead31-4ad62baede8mr11959575137.9.1732024620589; Tue, 19 Nov 2024
 05:57:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241114145116.2123714-1-vfazio@xes-inc.com> <CAMRc=Me9qD-VRr-JSXfFkE2O4xUhoKBSo5ug-nyw0b4wkQ7WrQ@mail.gmail.com>
In-Reply-To: <CAMRc=Me9qD-VRr-JSXfFkE2O4xUhoKBSo5ug-nyw0b4wkQ7WrQ@mail.gmail.com>
From: Vincent Fazio <vfazio@gmail.com>
Date: Tue, 19 Nov 2024 07:56:49 -0600
Message-ID: <CAOrEah5PHxr6HR2KBpV3BT1xM_eSdZWmeyUKA-bGswmk0G=JHg@mail.gmail.com>
Subject: Re: [libgpiod][PATCH v2 00/23] bindings: python: conform to mypy and
 ruff linter recommendations
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Vincent Fazio <vfazio@xes-inc.com>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 19, 2024 at 7:51=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> Thanks for your work, this really improves the bindings.

My pleasure!

>
> On a related note: we still have some uses of deprecated distutils in
> the code. Do you know how we should replace LooseVersion to not use it
> anymore?
>

I can look into this. Should we create an issue in the GH repo to track thi=
s?

