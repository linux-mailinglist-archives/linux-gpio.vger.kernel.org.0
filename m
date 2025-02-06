Return-Path: <linux-gpio+bounces-15476-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BCDA2B002
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 19:13:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BF4D47A1C58
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Feb 2025 18:12:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 186CE194A67;
	Thu,  6 Feb 2025 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AaZ/UHGp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE7BF194C61
	for <linux-gpio@vger.kernel.org>; Thu,  6 Feb 2025 18:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865618; cv=none; b=glOCW5i73kpl71jxx9vOwNuUrel/IEZVTm/GIxF9v4nZznJ1z4vU8yOroOUjJ9karORylBpoSJO4IP1X+A2e7sY1d77F/ey4fGT+cuPCK4T4QVDE1qbsPGZFOtVVenZTaYEWLxzYmRELp+D+B/ERfsNb0t+2+qwx/2qH9OPNBkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865618; c=relaxed/simple;
	bh=V79jeN0tsHJXSx3cEymAS1MszNtH6Y9+4E36m1Ag3NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aKkKRZjRV0cboEA3HFKLH9gtvS1ayEWrzjTtZ882wQ9hGrH+qPobmLI9QO68KgyA7+ddbv0ESW+FErHFAQjJxb8c1TREXxuuYYaGwLON1qY7QZG+vtrevIzRzDOvDiQwZzyfynobZy+ZLUhSFFqImfRTVh4U/JyZIM5rv1B9uZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AaZ/UHGp; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so2748625e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Feb 2025 10:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738865615; x=1739470415; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rsc6zr7PmrWPbYfK/47bMrwsd9aMEq1+Dk9kwGENv5o=;
        b=AaZ/UHGpi7R63veGtDNUX/KUi0ollf5xpfU/DhTcTDQ4iA6uWb3yyrsjAeKZw/oePI
         xW3EWZEapR+QkD+6uTztDcKl0r1rId57pmTOId9xkQ4josu68ip55NbiARgDk2UmKLHp
         GMHC0Vpha4s2Cmfv/3po5DdsPmuc6vaN9fz7X+B5ZTLlumpRbvzEdXnE1WaQo3D9KMHk
         ZV2vRNecSxhIAPFE/lozCh6fK+fogz5hoOktRheB90G60ojZIB34dUpqVLFPs/nKYInd
         cT7mUM6y8dOw0CCmSxNQV9TZwTJlB9fgpCmQjV3bzXzVRXcTk2nFJ8a22fPzG90BG5Qb
         lTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865615; x=1739470415;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rsc6zr7PmrWPbYfK/47bMrwsd9aMEq1+Dk9kwGENv5o=;
        b=h2bbuYusAmaJmQULrzsd/DAOg8PnlJSMUD9vZ2azkF37pluRT4O0Nll9PDCY19h9V4
         7VJrwnJLvEHpkhq/604dNtNKgWBkZljNquiLTedvCuUWp9GnrBcw18iqZ1nv7siCw+Jw
         k9HaKosZsXf+ewRsYjszsgdl18bIPd0tj5YBCeJnj96zWsTh6wtRJmz3QSADvoNWezDR
         3ry6XjywR0Pz//yvvKMbjNgttcM+YCEpeNfsGl0Fg6/CpeBMpK0KovH28Zeg2Q4NXKzD
         R0EtAsV8xBmlvCtE94K2OjLbfvukYmQxiX3eVhrXUN3tsRbA1mRwS19xKh1st6SWwMQp
         hMgA==
X-Forwarded-Encrypted: i=1; AJvYcCXkyPH1fXrK+vR0HUtzWddfFEoFeiqWc23pRwSgOJDSFTaKHn8Lwtq8qYHaPTjDkCG7yfMQ23uGyczb@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1CyxH3U4YC5VuRsLz2jAdZjUmUKsrE50M+bI688C9AEhg0xxV
	DN665rL+ArsAhLmnpKTexUNwN1etaUT4YBXelINU5A5bIuB6bspMH6N+62vYqHOplbDbCIaVV1S
	eYmLnmo1UNkqon8s7OURDtZsEXLSObhOISJnjUQ==
X-Gm-Gg: ASbGnctITCgJkMVlCqtFhvsaP1yRgzKdCKvmJCAfoOs5QUA8xJP/ss91ETPwcq59+s2
	N29Lgt0N5Duij2MK5mlSU1YYxDHYMl5Q9tdq1Ru6QxrUGdbWgi3tob5nt3wHt2QVo4ievK68=
X-Google-Smtp-Source: AGHT+IFwrBUSdTF33fVZo5ZV4gid8WDGNMNJOaEdEoEhmoUQDAR23eXv8h1spnhBCw68+AF8aIOa5q/drMpa+oLxkek=
X-Received: by 2002:ac2:5f66:0:b0:540:2fbb:22fe with SMTP id
 2adb3069b0e04-5440e6b96aemr1178814e87.26.1738865614800; Thu, 06 Feb 2025
 10:13:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
In-Reply-To: <20250206-kona-gpio-fixes-v2-0-409135eab780@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 6 Feb 2025 19:13:23 +0100
X-Gm-Features: AWEUYZniqNW7wQtQ8_C815KDVnvw_narU0YUPqt-9SDoXe8RaCViVJAVIYjHGNM
Message-ID: <CACRpkdb2fDukNdrzhcVi5+siY_HO=ndLBOCRH0Yxcs_bZFaaKA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] gpio: bcm-kona: Various GPIO fixups
To: Artur Weber <aweber.kernel@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Markus Mayer <mmayer@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 6:46=E2=80=AFPM Artur Weber <aweber.kernel@gmail.com=
> wrote:

> Fixes two issues that were preventing GPIO from working correctly:
>
> - Lock/unlock functions tried to write the wrong bit to the unlock
>   registers for GPIOs with numbers larger than 32
>
> - GPIOs only initialized as IRQs did not unlock the configuration
>   registers, causing IRQ-related configuration (e.g. setting the IRQ
>   type) to fail.
>
> Also includes a minor fix to add a missing newline to an error message.
>
> Tested on a Samsung Galaxy Grand Neo (baffinlite rev02) with a BCM23550
> (DTS not yet in mainline).
>
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

