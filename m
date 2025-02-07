Return-Path: <linux-gpio+bounces-15518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F83A2BE15
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 09:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D9C4E188C6E4
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Feb 2025 08:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 670BD1ACECE;
	Fri,  7 Feb 2025 08:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="SfoCiJ9V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7ADC19995B
	for <linux-gpio@vger.kernel.org>; Fri,  7 Feb 2025 08:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738917188; cv=none; b=iYzNN8PmtLxI8U2q6kH9fj7TejokyKsuVNUzmlomUalXsTmxOJNXOZs+oMxSjh4EegdUfqcqhLXyzNN4xpeTkrKsElADL5zi5qPxyf2l3Qt5aRtKy+/M9r6dxcie741iSzpx5DJO19OLfzm5W+klHPZbEz8zMCBXk7LkHxC2qe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738917188; c=relaxed/simple;
	bh=FDZ31Nx3civlmwWIQQAP+ROKkOH2EWUR9BDacWGiMAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EKB5LKnrB0vCL2aVPBso+1gsLTtd/ksu1YLINelWSMMA+tH0MzljtL4SyiFU3LWb+yDos+inuFhh+UH0vbo233w2jcQIIYxlWu1h7J6g7xdHFB7B7MYL1+jPKbFmc5FjupqkkvvUlfzfjTa/Xv3ocWtfDUa6m/IUGXt+GezNfSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=SfoCiJ9V; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-543e47e93a3so1972044e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 07 Feb 2025 00:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738917184; x=1739521984; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FDZ31Nx3civlmwWIQQAP+ROKkOH2EWUR9BDacWGiMAk=;
        b=SfoCiJ9V/vHiHRjbGyW+Y2lWJG8yPIm37fEdVB15NIJlb7S5tB/xw2kFDZZRJrQ2W3
         EetzkglO9qerFRPG4XiUMExACleKkhO68Apr9m5hJAFSVeQDjV0Uv1KfxOdJTm36qtOx
         GD1iBS4TP8FKwBt7gq3gnOyVVvb/G+o4LAV1BfFAlCjAHZj2+FD0i+G3edMoM8DC36eN
         TiqaaOjfQIh773M25wfGlWWi3je1EMZ1SRMw+CwxMP97SzZVuvEEoLrp0wGETIPMmpfg
         C81prLIxwYEpLdhXoBAuiaLTQ0nqqdUIAdo0CSgawvyVwGF6++P7n7Fh3bWGnRC/9VnO
         lV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738917184; x=1739521984;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FDZ31Nx3civlmwWIQQAP+ROKkOH2EWUR9BDacWGiMAk=;
        b=kS00W3/pqXIUIYyst8eAed3MDvUzj9DLw509Fx/gQ2FjkaLAPeIQHk74YcIMtwm+jm
         AemBC2nmTqiOd5vwioFrJJqNgcblFzwSV3aM7L/GM1YGvbFH0v9lENN9/B9M76vNzwbK
         mqEpxl/k3UnuvLNbm7DusUK3TXvEBZ1PGsE7u0R96Nzurds91Bgb+0GfoSCKvi8Vc8Bx
         Yx/OvthmIAcbbeA5NmCHfCCjT/YUVgjlbGtkgstQzf7/pI+wZx0JfvE/TGapCQ9eQVkS
         oAw2TVqr21U43lqQDvekfm0UvxeWiik4cbAUv9ZZOPMxCgFSrXK6MULs6Q3v2IJ0bUnk
         KeGw==
X-Gm-Message-State: AOJu0YwVeDxFoDGdQFHqh9+wcDP/aBqm5nVduHzu0Ywvt/mWD6uck9Ho
	U1+pgEXPK67cC6+5mfV35EUqxS8ew8N5GwggM4rQhTF9cZSen9TLful7JGTpoZsyMJPfpcRJ2pi
	7I07iRjBpt2xQe9G0A4TUnBkVV5k6vJjCQsFO8FMTZQqpWU0Go24S4A==
X-Gm-Gg: ASbGncuX/rV8zldu2jujzOPwSJjmuCj1a/rjoSkGhOz7jOe1/69XpFkn/apJcB+bOZX
	6RLqQHrLo7Nvb7t6DJ6XP2iD02cr0Oq4e3VOYsDGsQbZkwt+vVpTt+kz/P2OZgJlONajyuLKqRh
	gWGk4DcyEuY5sRwZ7mNoQNhT57t3g=
X-Google-Smtp-Source: AGHT+IHgWB89hNW9OJ6NJL1Rj2tEIBIMQOYDoOww7bCgZyhnauDXQruFNOqLsaUZ2hE+SG4ZneFMitUz5QVDxTih6yw=
X-Received: by 2002:a05:6512:e84:b0:544:ebf:741c with SMTP id
 2adb3069b0e04-54414aa880emr710177e87.31.1738917183753; Fri, 07 Feb 2025
 00:33:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250207083146.17872-1-brgl@bgdev.pl>
In-Reply-To: <20250207083146.17872-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 7 Feb 2025 09:32:53 +0100
X-Gm-Features: AWEUYZmWklGhQOPVR4YjGZK1-XCvq6-AQnGa_lgtdadT-6hgqTW9nexvfLKNX_k
Message-ID: <CAMRc=Mcxw+O+rW4zUwM3roLxj3vAGAkepnVssyd7ifMvuuO=OA@mail.gmail.com>
Subject: Re: [PATCH v2] gpiolib: don't build HTE code with CONFIG_HTE disabled
To: Dipen Patel <dipenp@nvidia.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	timestamp@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 7, 2025 at 9:31=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hardware timestamping is only used on tegra186 platforms but we include
> the code and export the symbols everywhere. Shrink the binary a bit by
> compiling the relevant functions conditionally.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I missed Linus' tag.

Bart

