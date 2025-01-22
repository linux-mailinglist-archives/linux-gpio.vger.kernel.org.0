Return-Path: <linux-gpio+bounces-14996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 58761A18E40
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 10:26:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B1571889502
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Jan 2025 09:26:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70DB820FAAC;
	Wed, 22 Jan 2025 09:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ly1CiR8s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB4720FA90
	for <linux-gpio@vger.kernel.org>; Wed, 22 Jan 2025 09:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737538003; cv=none; b=u+3tMSWZSO2qzgR63iOm+QYcGu4isWJUTbeRYsdmXB88bcPYQNHCauwXUjFZ6a7Ayfod6IdkOoMTbykb4iIKLCUx9FiBTsl7aaYAGR6ayv85L2ctesSmqDNIfc1DDAEUFEDSCXnjpOfFkG6MKCSBnw6+CJC/Ore1xaLDO39aNgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737538003; c=relaxed/simple;
	bh=+yRmJU0tPBnL7fsox/jPmAihqETGreRvtvmgF6ietdI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n4D4pKYhBXgmu3NusB6nab/h7hh92EoNfJA5U+Aqf9VvH9KIRpog6RUuZVD02ZWqZznkpgDMk9TH2YX0fkCDT9RD/WykJb7kACYu0zNwUN6qjfV/W4A+hNScSl1DwXD3C/pNmVF4txJ2iERF+W3aB9czu+0//+YzkKGgy7DcF6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ly1CiR8s; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401d3ea5a1so6348148e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 22 Jan 2025 01:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1737537998; x=1738142798; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EEO3Tux6Xm3WHQWZpA+yQBz/dO+Iyn0H+PnYP5Efrh4=;
        b=Ly1CiR8s/AuCq6XcwbJpf7UWxdzNeT96Xvj2Zl8gbPDgQvHxZT7PjzfT3HoS7uVjhP
         POtiJxwv2G7J/0ne3WOqm84FfmkY7JSL5dJDDnKvWEUBmUi5XPfZFYoic1I8NyQUuhlW
         O31LRPWba+0L3g3voowEnHgFiugyS6GNXVztDPFR0Lgd21evZQIxvbf7jKeWkUfnAy4S
         oFVcvglSemahpHBFVX+ygHW0e1/mZeLlXkRdhv272trBh3xAqA92pECMV9C1Sk6OeTo9
         E/+4YjaAAd22eWSh0EvWcdR3PCk3c9qX4EivwFx+6b8ROwyuSxJGrbz6Q42y/QBOaCQr
         tohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737537998; x=1738142798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EEO3Tux6Xm3WHQWZpA+yQBz/dO+Iyn0H+PnYP5Efrh4=;
        b=G1nu5Kmu8UI7tH8uoID0r0bmNEtbTaYxRliZHRVoU0iF7r5OFW8Ev2bTjLjQNOqhSS
         smRgqMAPhKqMpz33Vde/XVzRjF429IIDgJ/8ogkaCItHe3VaDsg5S5k43OfoW2jtWDfz
         jwPCk+7h2ZcF+gfi4iOF6+tXP1YudO6D+GhY0FsGwY1Iaw286/yy6mcpqA+17odKxjpn
         EqW/JnO6Z2EgpYrHYuccemCbbWZbnwys0CbBDhxkoDg8XsqZYSQF62PLK0kpK/CKt54G
         SkZHj//b6ODimzPUqfLuul4YyP4JBqF1mJjoDx9gz1P9ZdwvQHBX4YQkghnXtGebqQc6
         VoQg==
X-Forwarded-Encrypted: i=1; AJvYcCWfAsDp8BgksG0T7iqOLgccUQHuOz1SAAbDJTanI0Wcmdjw4+1ICQfUduOVPapWwxCNM/iTQKYsoEpq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5iyU4S6yJqzLQDdPvdz5kqGh5ySa1VXLvR6T7QwSvp+OAgKK1
	/lIX5blSu/WX8+hmzGikA7YbNzvB+HYh4hP/N09Ni3vlYKncb3QildOzPQ5Qj/G01ACj1Je5sVQ
	qrCQTwJop2BeuQUBt8gINoap0gMuWYvmSnzYjkQ==
X-Gm-Gg: ASbGncsVkBRGgiHruIilWMgWh0xzwxlK6JpqO6TjeCrAimkMIFjPNpvTz7+hkHe7yvE
	W7m6U9IafpmSt4l+1kXK8MYLm2mYno5t2qM0VVSTpV8rGx19yVVdibiMZsgOF3TdAGyrddURPJ5
	mYwu5zeg==
X-Google-Smtp-Source: AGHT+IHpN59Szas9VY3xt/KDpuEei7HsRYdu5hNY3s3eOV0chb7HdgJTXWKPDiFB9aWKqolSSdYDkzo1tqc34Qm7Hgg=
X-Received: by 2002:a05:6512:3e03:b0:53d:e5c0:b9bc with SMTP id
 2adb3069b0e04-5439c28743bmr7508525e87.50.1737537998318; Wed, 22 Jan 2025
 01:26:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250122043309.304621-1-koichiro.den@canonical.com>
In-Reply-To: <20250122043309.304621-1-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 22 Jan 2025 10:26:27 +0100
X-Gm-Features: AbW1kvZS-W6bXsh5MNdDL1bESL9lLMrOeq8iPer-n7LZoqBn2tS0MIDSYBla4pQ
Message-ID: <CAMRc=MfRm02TRJ52CU3iLhsvwd95CBhxmkbebCJ=riiXxsCkyg@mail.gmail.com>
Subject: Re: [PATCH] selftests: gpio: gpio-sim: Fix missing chip disablements
To: Koichiro Den <koichiro.den@canonical.com>
Cc: linux-kselftest@vger.kernel.org, linux-gpio@vger.kernel.org, 
	bamv2005@gmail.com, shuah@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 22, 2025 at 5:33=E2=80=AFAM Koichiro Den <koichiro.den@canonica=
l.com> wrote:
>
> Since upstream commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
> instantiated device depends on"), rmdir for an active virtual devices
> been prohibited.
>
> Update gpio-sim selftest to align with the change.
>
> Reported-by: kernel test robot <oliver.sang@intel.com>
> Closes: https://lore.kernel.org/oe-lkp/202501221006.a1ca5dfa-lkp@intel.co=
m
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  tools/testing/selftests/gpio/gpio-sim.sh | 31 +++++++++++++++++++-----
>  1 file changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/tools/testing/selftests/gpio/gpio-sim.sh b/tools/testing/sel=
ftests/gpio/gpio-sim.sh
> index 6fb66a687f17..bbc29ed9c60a 100755
> --- a/tools/testing/selftests/gpio/gpio-sim.sh
> +++ b/tools/testing/selftests/gpio/gpio-sim.sh
> @@ -46,12 +46,6 @@ remove_chip() {
>         rmdir $CONFIGFS_DIR/$CHIP || fail "Unable to remove the chip"
>  }
>
> -configfs_cleanup() {
> -       for CHIP in `ls $CONFIGFS_DIR/`; do
> -               remove_chip $CHIP
> -       done
> -}
> -
>  create_chip() {
>         local CHIP=3D$1
>
> @@ -105,6 +99,13 @@ disable_chip() {
>         echo 0 > $CONFIGFS_DIR/$CHIP/live || fail "Unable to disable the =
chip"
>  }
>
> +configfs_cleanup() {
> +       for CHIP in `ls $CONFIGFS_DIR/`; do
> +               disable_chip $CHIP
> +               remove_chip $CHIP
> +       done
> +}
> +
>  configfs_chip_name() {
>         local CHIP=3D$1
>         local BANK=3D$2
> @@ -181,6 +182,7 @@ create_chip chip
>  create_bank chip bank
>  enable_chip chip
>  test -n `cat $CONFIGFS_DIR/chip/bank/chip_name` || fail "chip_name doesn=
't work"
> +disable_chip chip
>  remove_chip chip
>

Hi! Thanks for addressing it.

Is there any place in this file where we'd call remove_chip() without
calling disable_chip() first? Maybe we can fold disable_chip() into
remove_chip() and make the patch much smaller?

Bart

