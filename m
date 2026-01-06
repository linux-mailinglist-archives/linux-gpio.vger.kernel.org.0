Return-Path: <linux-gpio+bounces-30192-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 108EFCF7DBF
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 11:47:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 86212307765A
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 10:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F09A33B960;
	Tue,  6 Jan 2026 10:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mSieI+pF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E82733B6FE
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 10:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767696045; cv=none; b=O9garyuY82hkflcU9FxKq2vLYi0ZOTOAfGH9ZLpgEiOsO6vNo8gD1dMaXcoqWnDClSuoXei5Frsazm3MA+H29hcGM782aUgfWLSmsVEk6zNfv3iJVGqSKGndY/frfjfhhvJxN8j1WOACEp7hKsvf//REqVPl6jU92ChJdde4svc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767696045; c=relaxed/simple;
	bh=t4ddXhA7JhrJytwJ6SG59Nok1jm7v4ErHkDUWq3UJj0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uqLn7o2uGwOLf9NpkPH7xavkLvc9TRrTrScFXENgxAN4l3tpda66Kdhbo7QSONgOvc06RY1XqvKKywUWwFRro2M5GUm/xN9n5iPM5DAkOMlWJnXxF10u0vm11tBv3caYnUrRKAj21cSULrqrZPArf7lD01Ru/ztTRmB+gR7N8J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mSieI+pF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA27EC2BCAF
	for <linux-gpio@vger.kernel.org>; Tue,  6 Jan 2026 10:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767696044;
	bh=t4ddXhA7JhrJytwJ6SG59Nok1jm7v4ErHkDUWq3UJj0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mSieI+pFor5cLkViqqo0XupaQknJKW4qXwhxNKsnkhZBXp0cZu8oWKcIyXbTMMSMk
	 gwGxE0lWhvaYyl3XQ2fhPHVXLbTvOER30qdGQHHdh+iMU6JsL+GxtwgzfovULoc99F
	 mXbWKynoFgcnB6G2pamlI14uuRo2at3NV73Lay6ERyiIqCocu687OMS37AGr0X1kLg
	 Rd7aDSUBKEM6yFr0ceS/+75FpdrSVc6SLSGo84a3Ni38ciQVYaUWclKrEPBkvMx/MY
	 lNrATBByqJQhebSfhOKinJ2eZz02PGnlKXrmJJAPvRdst4qc+lptjsHXsSh99WRVNb
	 /8V3vfzwc31oA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59b67388c9cso515992e87.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Jan 2026 02:40:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWztAyzncrnbv1tx5qKmOmLYwRYznBkgcEma/ac4VXMPDQ+cq6qhqdCo7ZifR5E57oZw3lmoPOVXEFu@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8z+qprTruoxOFxyXqMMtK1epECBGOjxRVl4hWqsM12RI3g64/
	X+lg3BuER2sM3tUGcPd3beYFzCUDhX4cGxqVenLMP8iwgfIsZuOIl650UQiSFDWk+4CudVvnDnn
	w4e+KzLfO7uZ99EwegDzASE6E+YwwlINl3ISGur34Ew==
X-Google-Smtp-Source: AGHT+IGjEVOXW8CYG+0OH4S7sVxLtDmjVtqmU3wU1q5QsPBg5CO1iHEaU9Sc0XqZ9TEkG2QTbcPfX+ONV8l5hR9iWrc=
X-Received: by 2002:a05:6512:3d18:b0:594:27dd:2700 with SMTP id
 2adb3069b0e04-59b652e62e7mr943934e87.47.1767696043393; Tue, 06 Jan 2026
 02:40:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260106085253.20858-1-bartosz.golaszewski@oss.qualcomm.com>
 <10d5df9b-842c-45d3-8821-d4ca0c364e97@linaro.org> <7dc8a830-5863-412c-bcf3-498f47b35615@amlogic.com>
In-Reply-To: <7dc8a830-5863-412c-bcf3-498f47b35615@amlogic.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 6 Jan 2026 11:40:30 +0100
X-Gmail-Original-Message-ID: <CAMRc=Me+mgRZ4thXnYFUv42hQBV36hM5DUckM8U_VQa8chNehw@mail.gmail.com>
X-Gm-Features: AQt7F2r1rD5CkKYlWA8KJJCMMCqY-jVpyYiin_uV38wrHGuoHuGV7M0VqD8OJdI
Message-ID: <CAMRc=Me+mgRZ4thXnYFUv42hQBV36hM5DUckM8U_VQa8chNehw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: meson: amlogic-a4: mark the GPIO controller as sleeping
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 6, 2026 at 10:32=E2=80=AFAM Xianwei Zhao <xianwei.zhao@amlogic.=
com> wrote:
>
> Hi Bartosz,
>     Could you explain the reproduction method for this problem ?
>

Please don't top-post on the mailing list.

If you have a pin shared by multiple devices in device-tree, it will
now go through a dedicated gpio-shared-proxy driver. It will use a
locking mechanism depending on the can_sleep flag of the GPIO
controller device - spinlock or mutex. If the flag is wrong - like is
the case here - it may happen that we take a spinlock and then descend
into pinctrl where a mutex is taken resulting in a lockdep splat.

Bart

