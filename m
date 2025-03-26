Return-Path: <linux-gpio+bounces-18000-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 754C8A71356
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 10:10:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5814317197F
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Mar 2025 09:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C2C21A5B8E;
	Wed, 26 Mar 2025 09:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uhu/tHoo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333B03D6A
	for <linux-gpio@vger.kernel.org>; Wed, 26 Mar 2025 09:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742980146; cv=none; b=A+8Ag8vYj0uX9wUheJxmqT/sRNnS0kQIJJ9Sdm8RFXXVZDMvy5zkz7HFVKSThohMuWyUTl44jcn9n8QrDz5TKaSm8/fi0scDjUATiTfmhmL9HJk6FhIvUHv9yRgR9qoPSExiVndJ0FOuZKyYdo1svLqjDXTjPHZiYKtiUgqjS80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742980146; c=relaxed/simple;
	bh=iyXMi6oBTLDvy9aUdNS3eE+LZyuLKsMTqtaOeBV5QPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=onyhfWOh+ATl9uJGge9CkkDEBD6hOlcgC7bbROe6cdsA1RjF3k0nZIfGaBFIsYCinVXGmGESjeBHrsfWA0vQLw3J8cmyYj0cuhcFz80hozfLC/70AILQ42DD4ctDyCzx6Ipj2K/FMrrz30O94/Cth3zGxOqPx2EsIvl1dQy+urE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uhu/tHoo; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-54acc04516cso7086426e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 26 Mar 2025 02:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742980142; x=1743584942; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUZngTTEzguKiucAB//HYWOGFVEX9dZzFTDX1IRyF68=;
        b=uhu/tHoo+JtNdeXk9CQ2Y99zjr9w8V2CFkvX4+nV+lywMVqwIU1mXmhSuzk5FfRq6q
         YlSqA4Dt0ydW8FTlR5/1AaWFBksjQ2dCpyPDpdnp5/RrhSLvc0mrttgHa9k2Rn+H7t0k
         Da7/r86AexyzXPji0P8eQPA25YyGzNpv3DPgEdE2RO/jGhnpoxkyGuoFNiVSsSJGsAgX
         EWhZSHiyTtlejU3/mzlmAHuNvjzntSJjxpexRh3L0lOqTT7vAPAC72OmXHOWCIcjbcTG
         DNK8G2tVtX5+BhzENikNSie/uGSRG0MGCQ+PcIEceWDWt9mi/D9R+NRpcEQTA1ZfhaiX
         IoWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742980142; x=1743584942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oUZngTTEzguKiucAB//HYWOGFVEX9dZzFTDX1IRyF68=;
        b=syNYm31G/67evzSliCCHevatK5lKMOD2tQ6YhLb/kMD006lkH83djxuek34CAYAYD9
         xXc3Y+86QS6u4JaydU3FvNu7xSQHrEy6rcmcT+98IHemBab6Td2vaAV1T1fMGLIyuiZv
         zN32nKAaBayA5SDfKSmO2ILuOB9ELhO3IwKp51ByxpxeSnZA2xSSuuBxaPMSjuQ0VAwI
         M2khvgGgVcw/0fa1Hjt/BJEhfckMucPXbmIVUgxAbG9Q6ZSFqOWLsMJw4iKuWshdRmD+
         w/j0EcIY5IwptmIgq9CvkQ+rjLO9Lkm6o+/ULcnVk4Fb1oHAAT0nxR5r8PWPD2XtNrCy
         llUg==
X-Forwarded-Encrypted: i=1; AJvYcCU0mPqHgdf1in81TEeOYSRAlGhs+08C4QtEbLNNspI6KNuUk9SgLbFVGPlJF/Kf7Z5EjmZClGa6zb0I@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9+wB9Zir7+2QP3dzZNwIyeD+Ym7M7uHg/1UaTwB4AE7D6lfAd
	qFI5pU2hl179E5GFxm/SAvZWnAqwilrIC4ZLJGN8LjcFdtWAnqP7zuBPWtFCtlesfWrFEAgCO6H
	uHYm5GCpcCHOPd/nBgprxgJ2bWEq5GIpu5O7lyw==
X-Gm-Gg: ASbGnctGIQe8dvWw3CUwvERfza7//AnU9XYm1NMiI4VE52C4qawGWxBjgOxVAYKewS+
	a3yGuRcjzzmdGYXwq2+N3XQGDpRTeaR6Cn4WqHrjyk54cubpt0E2ZVtwd8jpnwSu05IZlli6znA
	vt0UvK03+DdLOnukf8wx8jVV39NNNyREGLa7uOOje8oIONZ94rPTb7/WWMbg==
X-Google-Smtp-Source: AGHT+IEbF509AwwvF9uBzm/NQEb5CElWoFhmCLujCLM8AfO9baXd1EsZbD77B4ufLQManBlNueN8EKZ9MbxuVPXXcBg=
X-Received: by 2002:a05:6512:1149:b0:549:7c13:e895 with SMTP id
 2adb3069b0e04-54ad650075bmr6781599e87.47.1742980142162; Wed, 26 Mar 2025
 02:09:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250326063214.50577-1-kanie@linux.alibaba.com>
In-Reply-To: <20250326063214.50577-1-kanie@linux.alibaba.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Mar 2025 10:08:50 +0100
X-Gm-Features: AQ5f1JoCNnYkGIC4tglRhBZLc89xzcfRbive5WlMNXNsvF3qnSYnwZ1en9jcvv0
Message-ID: <CAMRc=MfNhDLV4GSmA4gNZLv3Lu=Wjh_=J1L=DCo8FPUMDVz_JA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: fix resource handling in ACPI probe path
To: Guixin Liu <kanie@linux.alibaba.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 26, 2025 at 7:32=E2=80=AFAM Guixin Liu <kanie@linux.alibaba.com=
> wrote:
>
> When the Tegra186 GPIO controller is probed through ACPI matching,
> the driver emits two error messages during probing:
>   "tegra186-gpio NVDA0508:00: invalid resource (null)"
>   "tegra186-gpio NVDA0508:00: invalid resource (null)"
>
> Fix this by getting resource first and then do the ioremap.
>
> Signed-off-by: Guixin Liu <kanie@linux.alibaba.com>
> ---

Please add Cc: stable and Fixes: tags.

Bart

