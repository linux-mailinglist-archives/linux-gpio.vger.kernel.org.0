Return-Path: <linux-gpio+bounces-27788-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A00C19E05
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 11:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 69F89466490
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 10:43:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54DF3334C20;
	Wed, 29 Oct 2025 10:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="B90kQBey"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 061B62FE065
	for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 10:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761734433; cv=none; b=Kmcn7r/HTOLYaxOx6ufOPkDGbmw4CmStZbwfUnAbq0hK55IrVXqlolxGAfOtc9oGk6g+7T6EZWrjConnxym8DYXcGi7gYxbvae1EuNKNyUdRzw4x28lNidA3CgXUfLvNtJvzIa/IdOtD7ELFwRZpOtujMth2IAu5zj14uJnHdu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761734433; c=relaxed/simple;
	bh=JfzAn9sSDc1qDJVZK96W+YHwxa+dh1iExC5K3+gvRks=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mwWAJ/YJyB+Be71ARtrkoTPcFLSMkYCwwBzR3j7Qy5Iq4H6/e0POYBLYRq0Wcv8kg60mLujQ8tNKDNlJnT5NZXHQl/Cx/7jn69DXp+LClAFU7PFFYAUxiW+9TG/LLB5YMizzJaOhdwt2ifiatU0PhW6FrO3DR6vRivjvOwrVk5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=B90kQBey; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-592fb5d644bso7126172e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Oct 2025 03:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761734429; x=1762339229; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JfzAn9sSDc1qDJVZK96W+YHwxa+dh1iExC5K3+gvRks=;
        b=B90kQBeyS+zPJg7F0wgBnAKs9GiRCuz9v6d9LDEJRe4R5Higmlzol9+w0+GhCnwYAD
         3z1uvjvNoJyoW7w0zkCurW+FQsSkqbSqpSDQykRlM0qUGTjYEYxUjqjAPluZfAYTINM5
         Sue4u6Fpdaz2EcwDf+QReYuTHbL+Uhjad+fqFYK1+/VwNGz5GeuIiHz35nFWQbDJCAis
         k501n11ZL9Gv/3DpuaLD5PfH9X9zF89GnMySJgUfVezpJl1I/FR23h8nPxzuSqDSSJzU
         MAPrP8v8RLJVGGhAWSSec1Pm+yIRWfCWSx4gt2hXVkmvNaF38Z+US6fc1rm+MOQXy9Pj
         Twzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761734429; x=1762339229;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JfzAn9sSDc1qDJVZK96W+YHwxa+dh1iExC5K3+gvRks=;
        b=IPTa2UKulSVyTudAEFl8FKtB4RPM0FZtYuj3QeCdRH/qHyod0CjVtRLcOUeR/fO5ez
         H1yxWLftKDqFNB38JY6vUo++1dRt/VWAW9I6UaIJtksCtssGxlLJP+BJOnlt0SUGdPN7
         0Z7PAibHKG3bSY8+OlTjBc4iG7RhaSBwki1AiOHhFL7Zorf9ZYQgYzARPBBuL+LlNDjk
         RYNpeCqhMOL8+nQq1yDUL7TCtic58mktawSSJ5XUQ+ccc96t49cpeog8liWH4c73IYe+
         TXKT52wMP+n3C2192uPS2LtGBslSAr1f5LLlklIMX+T5OiV/dBSewhbatuB0eGOZXb6N
         X8yA==
X-Forwarded-Encrypted: i=1; AJvYcCW4CcPUWAf1/ZE9Ma4KYeIThcQxxTQda66y1MxLvHCRMER8IcwMNY1mmB1ObETtE6SnnYbV6rO3a8Wh@vger.kernel.org
X-Gm-Message-State: AOJu0YyhCgXUQGhAwROl3Cfr15w/73ZuPE6Y67l+qJJ+6lE7bNYnraZ2
	2rX/5ghfmMKk5OTf6BDQJWT/BnlNUOWe1xxZ/AEI2mI8f/sh/jtL/GyF7lLd90B0yZLQXXzgkQX
	N2VEL+9ByehXyoi3oBrGiFjvweBtqlTf57REOgb9mnQ==
X-Gm-Gg: ASbGncu5hNYmmrLWQFk1AR7xW0731ShGk8sSPYIhXkP+a4bMTEgFeawAkJ2fS/0aRH/
	TU6njKH6GIP6vgHKQ/0KR0iSfyYYcq5qY6H/evyApuK2S4EE3c9ZwWPbC6Xvtg3wIERxpMV7ftR
	r19hhev/s3wqz9GyQ7vANLp1biKLbpw8zyjE79clw0fR2ISdipJmhMnqsHpUuh2G8mStVCx9YaE
	lKzhlcUGV5sRA8EvCzdaaqD0oaB+l16AnEHVFNzY51o5iyo6gIftwr62Dg4UeUcxDDLII7cPQcJ
	d0MsWAeptCpcslYl
X-Google-Smtp-Source: AGHT+IHyDLW+hth4EaXe4cLca2vPqJJ5c/R4HYjWQC56YL1rSNqEk6nZ5SgVyrFqOZiGu1SitPQa0Ycy0KVVQyOFy1w=
X-Received: by 2002:a05:6512:a82:b0:592:fad3:9d02 with SMTP id
 2adb3069b0e04-5941287142bmr760380e87.22.1761734428954; Wed, 29 Oct 2025
 03:40:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251029062050.4160517-1-raag.jadav@intel.com> <20251029062050.4160517-3-raag.jadav@intel.com>
In-Reply-To: <20251029062050.4160517-3-raag.jadav@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 29 Oct 2025 11:40:17 +0100
X-Gm-Features: AWmQ_bnr-3SjGf9coBjCZmyQe_Yu7Q0DUNbpdgrzhPxUmo6g2IaZATu8NPPB_bA
Message-ID: <CAMRc=Mcz3df6KUx6q5MLGfB06jQhBTGfhCM7yovHBE3k1vn+nQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] gpio: elkhartlake: Convert to auxiliary driver
To: Raag Jadav <raag.jadav@intel.com>
Cc: hansg@kernel.org, ilpo.jarvinen@linux.intel.com, 
	andriy.shevchenko@linux.intel.com, linus.walleij@linaro.org, 
	platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 7:21=E2=80=AFAM Raag Jadav <raag.jadav@intel.com> w=
rote:
>
> Since PCI device should not be abusing platform device, MFD parent to
> platform child path is no longer being pursued for this driver. Convert
> it to auxiliary driver, which will be used by EHL PSE auxiliary device.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---

Are there build-time dependencies between this and patch 1/2?

Bart

