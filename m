Return-Path: <linux-gpio+bounces-21207-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 491BFAD3755
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 14:52:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2894D189BC5A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 12:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8F5B29C32B;
	Tue, 10 Jun 2025 12:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="m8HBbj0L"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8DA29C327
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749559354; cv=none; b=sEdrT2Lzjk2DbbI1IjcyEd/Mi4Lb08YU4eMBFFLBfwAbHhGzNM/k7RRRs/JnI1WACnlxs9CEPtEnoilyByG0GKH90tZ0e2MWQpQ7NvS1Gt8hwSBzkt0n8ba2SfUzAoZexeBNeA7YbS3oJpLVmMXIzIzGtfGk3CmBaUe6HaVBtUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749559354; c=relaxed/simple;
	bh=U6Na6s2P5c1DqTdnoC6CkwOGk4v/Ph4Wt3KUWux1jLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VPNIs/L5ngpUd3TD57iNKt/l48ZWGKw4n7sfgB/rKa7eZxB0qA684dk+ceuOdXcbySzWx5YMeu5yTMSUMHNEf7MFIYBiGV9PZSIbCazIitUeZLDvmSCkf+gL8yyD4fv3kMRC7blEMqdwgFxCadaKKnVHEtUHUP5fPoo0X7CJ758=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=m8HBbj0L; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-32a696ff4dcso45851451fa.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 05:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749559351; x=1750164151; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U6Na6s2P5c1DqTdnoC6CkwOGk4v/Ph4Wt3KUWux1jLg=;
        b=m8HBbj0L7i1RABUFxPposqPNyroZKieLJZOGFjMx+TwBkab7hbA8C2H/psaZLeSOPi
         sRQxVNWVZCEDHv28JUEyncQJwmAmxXZz/w+wT32fhcwLdCQcBDQhj1HOKFkNFBxv92dH
         mdzzYZ1PSW+Hfe/Tb/IIHq+S1Tm0CITtJuRbT22xOkNzG0fFTzUeomoobToNpkz1w9LL
         YrMU3WGaEg5dkNjJrCMyA2JUkr36nIop6D+T3Uuh2RDjT1kA85uu4B4mSz6c31EuMmha
         /7qhSQR24VhkIlaY/TpC0W0rvx06Taew5/Q6WwUjArn6gxdRgYofKPwggLDX88FeIdKA
         jqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749559351; x=1750164151;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U6Na6s2P5c1DqTdnoC6CkwOGk4v/Ph4Wt3KUWux1jLg=;
        b=k/XX9HM7z7SSe8F5guLAwzVUv3l/ZSmlF22jyEYknQecEvYmKQxfPzE4MnFCTN/YcO
         UdlAQzQIOwMYb4cN6GdauJWJzjqEgQq7S0ZYS68xroV/N36GrQnhU3FJEZ2N93VFXkmM
         RrNPrPnbrzDl0i75UU0ys9K7DbsP7HcEmgaPtNoskyCkR36vn1sjyluYZAkeNt9mOEZC
         6WZauobfuFAK3RjWOsZ1070ip6RabxNgoRSafUQgocc+is7u8iV/ux1+RtBdQhrUmegJ
         0DzmwiNbplmEu2NPF+PBJwmFCGd5vo4V3MMo9cu/qi6bIbGUd8/BdFhjlCWMet+Bwp7F
         3y7g==
X-Forwarded-Encrypted: i=1; AJvYcCUYCRGxhSy90uvlfaycs1aa/ym6NsI6IKnM6QHAewi9SK/UDpfqwpBY5XknwVqR21ipGD9ckXeBHHi/@vger.kernel.org
X-Gm-Message-State: AOJu0YyjZmu/iH04OZe/XckNlW1SLIXu4crpjM5Qnl847PX9LOISiyVk
	HLF2GHoBewfkZHCKBpuWP14cLNvr7bl/iTQ2L4c/MExWdeJ/q2uyyXqJ0NhTiLzhStfZU5ZacJ6
	WYmMwrrfVpoxoLaLNZbG4BcXrnJW/T8bPN6aXaoJNDg==
X-Gm-Gg: ASbGnctEh+TWaC7kEgiy1P530VZ7bk+57eqTRLDZhzJs/Z0a0twejMUL2mnCVxHW3Vm
	xmuZ5Ykcc42e1l+amNZHWiXlfzOQqou2zIq///Q8kJycahnCPJp0FKJI8zxwHG5sdgG38lIT/Se
	frccDZhvcMJYjEa6NdkhfdmQxLcWUQXTwDveE3QMP+xYFpHQO3GNcimw==
X-Google-Smtp-Source: AGHT+IGD5WXbHGGhhGRo5sVeUpYouurIwKWToxCb9XtYaZwZ9hBmk03t06DwUfTbDOn7DXb0nilwhoBbFz43CxKKxzc=
X-Received: by 2002:a2e:a78a:0:b0:32a:9a0b:4697 with SMTP id
 38308e7fff4ca-32b152d6ecdmr8013991fa.21.1749559350758; Tue, 10 Jun 2025
 05:42:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
In-Reply-To: <20250609-aaeon-up-board-pinctrl-support-v7-0-1ab73ec0cb98@bootlin.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 10 Jun 2025 14:42:19 +0200
X-Gm-Features: AX0GCFvbZS-4AQxpsQip_StlBivPF4rBRcoZGRYX2DDCi0OTfFjKlqil2Mw3JNM
Message-ID: <CACRpkdZpn5xy+6yb-mQd6wDs05X0QqRCQo7QpL6=aEWtyU-zTg@mail.gmail.com>
Subject: Re: [PATCH v7 00/10] Add pinctrl support for the AAEON UP board FPGA
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 11:51=E2=80=AFAM Thomas Richard
<thomas.richard@bootlin.com> wrote:

> This is the seventh version of this series. Only few changes, the series =
has
> been rebased on v6.16-rc1, the pinctrl patches were dropped as they were
> already merged and a fix was added in upboard_pinctrl_dbg_show() to handl=
e
> the case upboard_pinctrl_pin_get_mode() returns an error.
>
> Best Regards,
>
> Thomas
>
> Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>

Looks good to me, some testbot was complaining about something
but certainly we can merge the majority?

Bartosz when you feel confidence in the patch set, will you queue an
immutable branch and I will pull it into pinctrl as well.

Yours,
Linus Walleij

