Return-Path: <linux-gpio+bounces-15329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB5B6A272FF
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 14:40:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D89A21883898
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 13:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B0E821767D;
	Tue,  4 Feb 2025 13:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="a9c9E+mh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EC4211472
	for <linux-gpio@vger.kernel.org>; Tue,  4 Feb 2025 13:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674882; cv=none; b=Q1lLKwGbgl1zLEAEvmEt6m2zU7Av5i+pzqahZKv74z+AIFYvSl0jHeMwmtorVUnyFi1traiRLtcQTwbwCPfqshw3c34WkS8MS+QeVvnYk6vpoX8ieo94E34Q0fZ4pY1nFm8ZDIQfT7M9E+H6Ekw7FTb5vwYRSS287MaRU1mNyN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674882; c=relaxed/simple;
	bh=lJ9T1u9q2YZ6gau6z5aPQ5S1iFNq+ZFtrOES/qnuq+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8lhV7HqsjAo4WED7rnrfuurqiSZC2w6MRTaJeWJH31G/8wdA/vaKBIp/U1Fd0+/+NdRAvZHj1R8sNRoBYiJH+tjtR6ykziEh65FhmdcNF0FCSckw2NwXbZcfQmdVfl9PyqgJe4cWuS1JdCG8uXeTypXNz24cN5N64PBpDu2GhM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=a9c9E+mh; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5439b0dd4bfso4844193e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 04 Feb 2025 05:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738674878; x=1739279678; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zzKgIq7rz08fBMN0W/dqGNraXehNUjIQ90fAtJxNy1o=;
        b=a9c9E+mhZ8Y7YL5vd994W/W5NcaoWnDgPMcmNq9leF1WNamiyGq8VWDCZ5tNiUscwM
         yNpyfWp8lHWMJcthtr0BLaG6WezIVGDlINGR/KpPtRHs+37cM69EMzkBn4Ekzm0ydwOw
         Zu/weoKggCW0QdbQ9VlNmlokuEoCxFiZUBGyrTcXNKgOQsl9vg55cLbnGSEz0QYYaLGn
         VRMPNBwvwoAd0AAF/QCp34hID3GPac+kLbgaY6QfHneOeB/idw6YCDCNXffUwx6qCLz+
         a5MLSNWoAqaF/I0sez06J95S8x5sWpqmhFfu5vZ9pa+nYeCYeDABCUk58xRwu/Lw+z8/
         4qng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738674878; x=1739279678;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zzKgIq7rz08fBMN0W/dqGNraXehNUjIQ90fAtJxNy1o=;
        b=iDQRfmnfAZBYaU1KQBx992yQuLM/awG/dBcYHtwirA42ifHOMKEnTH/8+8sb+AZPvZ
         xkgrAdMda7auNqIzMzUQLzlfbmLUvsvHFn02HEF1qEsuYPSApEubv4giX2bCj/LSlnoG
         wIJoqRwZQ94y2Ys+ac8tcPCiA7jIn0NBofeYJrqTuDJ1HHVWDb5altlqeEmYX4tbR5uO
         /UpwmY/BYDQl4gok9pP8cOPXTDIr1JG3hpiR9ICtu237OYBGyfX9grJm8pHGMOC6G5H3
         cMx86Xb2igYtntfgksR8zhe2oyDk3daU1b1OMpUGQfZCRaIJjINjseicWc2pmoKbWJTa
         RaPA==
X-Gm-Message-State: AOJu0YyHNr85tNnvn19mQuHoFVGco7m0JJhrMZg3YHPck2EZ8Fxe0o9s
	1ZxHW6+sHIZYW/YMXM9VZH77xyCj6tt+eDRHsmb/COXA94+C6e+DZ2sscuQxOupQRF0Y/dQCH98
	BoFYilhbDPELift6YzcQ85GZKy6gk6TWLOC9JpA==
X-Gm-Gg: ASbGncvg4E4JReVpr1RP/987U05bGNAr3GdfcAFOnzh8oBKp8Cx06vT+FwlA7k9QmZS
	PFmmh9giMNa2r8InjfXBIYYyqdwDngk4qlbF4dG8JzvxvP3YgZnFjSQY94COy31TuB2uVLeGJw4
	jkVEkApZmMX6wrHuSWaWF5vrkpbyxJ
X-Google-Smtp-Source: AGHT+IG3iK/gLYXxjiIAYHWRJ7P+AhZZKbxnmRlx23C/h/unN+vix5GK7X+U8ENJurLGDtOx9+8rw2p5LXLpdHZKqK8=
X-Received: by 2002:a05:6512:131e:b0:540:2576:d0d8 with SMTP id
 2adb3069b0e04-543e4c32866mr7678444e87.40.1738674878387; Tue, 04 Feb 2025
 05:14:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203031213.399914-1-koichiro.den@canonical.com> <20250203031213.399914-10-koichiro.den@canonical.com>
In-Reply-To: <20250203031213.399914-10-koichiro.den@canonical.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 4 Feb 2025 14:14:27 +0100
X-Gm-Features: AWEUYZk-OGR0Gg1AhH6ADDIik_r3P3vu-Vw7Ihm4kfBQvjAQXX4aKVaTVOSz8VY
Message-ID: <CAMRc=Meb633zVgemPSeNtnm8oJmk=njcr2CQQbD5UJd=tBC5Zg@mail.gmail.com>
Subject: Re: [PATCH v2 09/10] gpio: aggregator: cancel deferred probe for
 devices created via configfs
To: Koichiro Den <koichiro.den@canonical.com>, geert+renesas@glider.be
Cc: linux-gpio@vger.kernel.org, linus.walleij@linaro.org, 
	maciej.borzecki@canonical.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 4:12=E2=80=AFAM Koichiro Den <koichiro.den@canonical=
.com> wrote:
>
> For aggregators initialized via configfs, write 1 to 'live' waits for
> probe completion and returns an error if the probe fails, unlike the
> legacy sysfs interface, which is asynchronous.
>
> Since users control the liveness of the aggregator device and might be
> editting configurations while 'live' is 0, deferred probing is both
> unnatural and unsafe.
>
> Cancel deferred probe for purely configfs-based aggregators when probe
> fails.
>
> Signed-off-by: Koichiro Den <koichiro.den@canonical.com>
> ---
>  drivers/gpio/gpio-aggregator.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregato=
r.c
> index e101b78ad524..174078e02287 100644
> --- a/drivers/gpio/gpio-aggregator.c
> +++ b/drivers/gpio/gpio-aggregator.c
> @@ -1313,7 +1313,6 @@ static struct attribute *gpio_aggregator_attrs[] =
=3D {
>  };
>  ATTRIBUTE_GROUPS(gpio_aggregator);
>
> -
>  /*
>   *  GPIO Aggregator platform device
>   */
> @@ -1342,8 +1341,22 @@ static int gpio_aggregator_probe(struct platform_d=
evice *pdev)
>
>         for (i =3D 0; i < n; i++) {
>                 descs[i] =3D devm_gpiod_get_index(dev, NULL, i, GPIOD_ASI=
S);
> -               if (IS_ERR(descs[i]))
> +               if (IS_ERR(descs[i])) {
> +                       /*
> +                        * Deferred probing is not suitable when the aggr=
egator
> +                        * is created by userspace. They should just retr=
y later
> +                        * whenever they like. For device creation via sy=
sfs,
> +                        * error is propagated without overriding for bac=
kward
> +                        * compatibility. .prevent_deferred_probe is kept=
 unset
> +                        * for other cases.
> +                        */
> +                       if (!init_via_sysfs && !dev_of_node(dev) &&
> +                           descs[i] =3D=3D ERR_PTR(-EPROBE_DEFER)) {
> +                               pr_warn("Deferred probe canceled for crea=
tion by userspace.\n");
> +                               return -ENODEV;
> +                       }
>                         return PTR_ERR(descs[i]);
> +               }
>         }
>
>         features =3D (uintptr_t)device_get_match_data(dev);
> --
> 2.45.2
>

Geert, what do you think about making the sysfs interface synchronous
instead? I would argue it's actually more logical as the user will
instinctively expect the aggregator to be ready after write() to
new_device returns.

Bart

