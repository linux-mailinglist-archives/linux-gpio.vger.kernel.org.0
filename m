Return-Path: <linux-gpio+bounces-20417-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C43F4ABF0C4
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 12:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21AC71BA7BCB
	for <lists+linux-gpio@lfdr.de>; Wed, 21 May 2025 10:05:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED59525A651;
	Wed, 21 May 2025 10:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="dc8VicUV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236BF25A65C
	for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 10:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747821915; cv=none; b=dFHKzGfTm931UI4BlMmv0eotP9ie9FhqFdYzEx63aJqZ1wt/uBlwRjLPG4Vj3UAtA8gtAoU/VoIdQNFvUNCrT6nLf2GmLQxuNp7JFtg1VqGiKKu0RZqGol9cVpXs9hHAzowGiJzany3lCnh7Xb2wWAgWVRcOumwlbURC+SHG2Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747821915; c=relaxed/simple;
	bh=DgK/U/ckhgWu/wr6xeMX0u2rTbY5Zm6LrxtDph714Jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=psKYqcDJUms5b3yVSIIUydz4yFllAl255wEWPULzDM+jIDAYnnDlrvFxRpFTyycVKAFCYpFifQBE7FqdUW7pcErjAOlwjE+1Qujhm01k6RrENftPjyDlKaEEy7kQKNbZR4+huni4OSmEHAV61HmHFhLDyJxs/xsnZ3EhjZeljfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=dc8VicUV; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54e7967cf67so7633876e87.0
        for <linux-gpio@vger.kernel.org>; Wed, 21 May 2025 03:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747821911; x=1748426711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMgQIfDCtCEz6IKx87Z/6/hHB96nzq7wH3wvSBCvjtg=;
        b=dc8VicUVqArG3YO/hWzn0of1Yt2t8v92J7nAbYNxteBHbcb69Z0wUCMatug9YsAJPJ
         UtnXVO34s0t/RjrRsYJaRM+ixk6mjpRSeyL7tJ1iuvwbxW0/2ggBPVjIEvDdKOMNF9j7
         VO3dHlKk2AgiLfP1l+d/3YEevuKry9JgEoTIPXD3U9n2DWa3OM2BSAMTOPhzl/2qbmEK
         LBiUypn2j+EEyd4XVYFqzIm3DWmn46Ax+fwfsG8UcluqNT52Vns1mZdmrZ18BECCkJfp
         m+bvLlvrBrtowd1D6oTY+lfZgiIq/p1S2/kwP4L+U337oN8Mv3bzMkWodeRKInVYiUUg
         Xt+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747821911; x=1748426711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pMgQIfDCtCEz6IKx87Z/6/hHB96nzq7wH3wvSBCvjtg=;
        b=pdRIG/X8eLINaFXWWK0vwyvO9SYn1SI8iWr7os3ToegTkwhavtEckOFt+wKEzPz/A/
         +BHikcD3ADtSV3KRYm/5Wd1eE/UNoL5hbnYOYL/4y2DqQFTa3xA+UKgQtZgahI8nDKa4
         vq6DcpN8F3NKiC1UHPKZTqfU3tLSOZJHMiePhIVhHOcFiGaAFtXAsz56c6AqBKrgZzZa
         25xS89H2YfVcKM7CtHmLyW6MNWqMe9StunB+b3mWnrysU6sWecwp4yOSOtxxBV4Q7/Kz
         W0BDJBSGPaIpz8qVfBKAwuYQw0dopbO96QlTvj5fBxfqk3E0NwdPQ7FULFK1rZs7Ub2y
         zasw==
X-Gm-Message-State: AOJu0Yzl7l7dmRNJO5+XiyKXxW6Ju2OzzOtcfEyJSLAKujN2A04L9qJQ
	Gw649lTCfjSJvEErRoVjnN2K3Y0gJRGTS3jrVR7igiKDz+UVpvD8brifaDoj2NZrWXRGyPjpOmp
	bwNBeXmyKOWqtaOb1KPq9UrtL6B4wI+y8/2ELT5ErfQ==
X-Gm-Gg: ASbGncsdsmkeKCJxNxd60zn85JeIwY/r68Ef4B/nLL3MJ8u8zNH7QMUx3FA4IGHWA66
	O9mKh5h5zEr7NNrRqluhphfLkt9nkzuOe6WjhN7k8RAmV2hC7wMNhCHtlUAC0VUyph8ONQJCl07
	M9avqNzablQW/jH7G0lwMaN9GmmVqlxaXthbxOTJqfc3qL9s5nJkSSPe/hfMZ6iuVR
X-Google-Smtp-Source: AGHT+IGb6chYj1/26o9+mFQUjuvJ+R3vcH8oAOENAFaSIT1/GNlvVhwSTwCKh7ZM7rqq1ArgOcx8vXluOf92a1XR6FA=
X-Received: by 2002:a05:6512:6515:b0:54f:c44d:8956 with SMTP id
 2adb3069b0e04-550e725468amr5082143e87.48.1747821910444; Wed, 21 May 2025
 03:05:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aC2gABILEj1yRCxF@black.fi.intel.com>
In-Reply-To: <aC2gABILEj1yRCxF@black.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 May 2025 12:04:59 +0200
X-Gm-Features: AX0GCFt4FAZT0cd96C7VyOXCp5zznRBdZHn56DEmWHafzraEi_ZCzYlYoJf_URw
Message-ID: <CAMRc=Mcf3gAN-XoudVWBEQSMefbCH10Xci+AXz6-tJdaYRJH3g@mail.gmail.com>
Subject: Re: [GIT PULL] intel-gpio for 6.16-1 (take 2)
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Linux GPIO <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 11:42=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> Hi Linux GPIO  maintainers,
>
> The GPIO ACPI code rework is in this PR. The patches are in Linux Next
> for at least a few days. However, one regression was reported and fixed
> immediately, which becomes the last patch in the PR. It wasn't in Linux N=
ext
> since there was no Linux Next on this week. Nonetheless, Randy Dunlap tes=
ted
> it independently, that's why I include it into PR (without this the check=
patch
> and make htmldocs warn).
>
> Please, pull for v6.16-rc1.
>
> Thanks,
>
> With Best Regards,
> Andy Shevchenko
>

Pulled, thanks!

Bart

