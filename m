Return-Path: <linux-gpio+bounces-7050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B466C8D7DE1
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 10:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3251CB233CF
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 08:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43D0E6EB56;
	Mon,  3 Jun 2024 08:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="rAcFP6wn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B774F3D551
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717404775; cv=none; b=Ek/OBQyEJn3er7F/AJpv/6itydEdABvfqxIFUyqHPVLB/qZ5XvvNI3OlhftP72ZP1nkBn13+0geCWbcO1peMEZWKftVg4pGA+So+/QVbEBhVRgDUbU2icqFoGOf17sjqLRNResP5aT01KhOcHixg0Z9Xqr6ePyJjr/quppr1kDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717404775; c=relaxed/simple;
	bh=/Tc+eWFJa6vM7KWd/B6oUSZ1QJKFaRhH13mgIbIYTVw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=edv9baxyUUXjObi8hRTZdcbmJ+1GE3gcUzr3ZZCPuIbWJyzD+9x/sMhJYR10/wwdWQ5ts10QOuxVGgeQJ3ll4uIZNvJxEz+v6dL1WrF86YboEhcEJsrAB8OCxSzIWPxADOQGVqt+EvifxO9A10yahFVOFyXjS7NH2UaR3Zexzf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=rAcFP6wn; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2c19baaf564so3172021a91.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 01:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1717404773; x=1718009573; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4X04LJJsZYf+onoIJtX2o1VwdMa+HJQ3HXw+WcFjbro=;
        b=rAcFP6wnBGak+3E6hQGnwj3mZHco20du+AsqHNaXYdmtJg7j/uouyq5YQmF12vADby
         QrK73ceOCi1kyjQJzQ0zMV6orYO9KMIEdGgGwzYVEdkjZ+kJb8gokzTy+jtARJ5cbsS8
         MhtXkyaoRU35VlrFiMqNLQeHfz6zzIgYgxw3p6fmgmwFp7BHKyAzYEnGvbSpCLFaQ+Wh
         DqMR/YHXwl0GtNWS+QRr0eAUUN0rV1no1Sd6nizapO5PFCHEQ/gDVq/Xcl63ew95qDq7
         dQCxcSF0Y1OajzEaEOWuUV59Vy+En1hXr3alDt4+a3OJenbUuhxU2hZglvAFQlglpjiZ
         3Odg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717404773; x=1718009573;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4X04LJJsZYf+onoIJtX2o1VwdMa+HJQ3HXw+WcFjbro=;
        b=vzCm9C0Cop/D5Cu74HX0/6iZhdJU0nPjHK/QEuor9R/42Hzg6hiyjNllIKvWRTFr5m
         i39g6fEG3v34UY1PMGlnTYMymr264H0n08jUSQp4RMt3drSOoQ6wONT1WrAyyL68TXN1
         erS1+TOusdDmOYATALcIXKg4r5TCEdSwQFGbNomMnqktBnqZ/gvmY1AAhY+97OIwdCPr
         yuonrrvrgTz0omFLN5Z+95Gtmrr5twmnA034boVtGemNIU6CWuSOt09hokK2bdRvaUT6
         OKZkWOdgUZkK1h39NJZH3CqYeDyuviGxL12j9Ybbkui6zh68TTy9l8m4s7DbtKfB46xN
         3XVw==
X-Gm-Message-State: AOJu0YzE2v/AJhz+Cevc5E2uCYe0Taqa1Faz2tMw/ZTjbUMPmX25Vnyt
	QEuiW2wHuEkcmZsZn50LhgluNb3y9EwaqDl1sR/hdjZ2yRvOkTQFgOwbu/pGuytGHSmVUbNQw9l
	mBlN5p1DJ+u48LPyxa50h+lJTfzG3TwNU8WDLgg==
X-Google-Smtp-Source: AGHT+IGdFHR4qLQmVDEt3d8WQk5g0hYs5a/RnuFL92IV6WTgtkVt5maz9FV+5MScW2dN+hdHb5M5uk53rxaocUAF1q8=
X-Received: by 2002:a17:90a:bf94:b0:2c1:a439:4480 with SMTP id
 98e67ed59e1d1-2c1dc5da03amr6547764a91.44.1717404772925; Mon, 03 Jun 2024
 01:52:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240531134512.443850-1-warthog618@gmail.com> <20240531134512.443850-3-warthog618@gmail.com>
In-Reply-To: <20240531134512.443850-3-warthog618@gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 3 Jun 2024 10:52:39 +0200
Message-ID: <CAMRc=MfHwp8Lj_5rFiqo61E__Y9+o4n3Bu5e4KSF0P6n0DR-0Q@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 2/8] tools: tests: don't declare and assign separately
To: Kent Gibson <warthog618@gmail.com>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 31, 2024 at 3:45=E2=80=AFPM Kent Gibson <warthog618@gmail.com> =
wrote:
>
> Fix shellcheck SC2155[1] - declare and assign separately to avoid
> masking return values.
>
> Signed-off-by: Kent Gibson <warthog618@gmail.com>
>
> [1] https://www.shellcheck.net/wiki/SC2155
> ---

Shouldn't the commit message say "*do* declare and assign separately"?

Bart

>  tools/gpio-tools-test.bash | 28 +++++++++++++++++-----------
>  1 file changed, 17 insertions(+), 11 deletions(-)
>
> diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
> index 34ea744..6bbb06c 100755
> --- a/tools/gpio-tools-test.bash
> +++ b/tools/gpio-tools-test.bash
> @@ -49,7 +49,8 @@ output_is() {
>
>  num_lines_is() {
>         [ "$1" -eq "0" ] || [ -z "$output" ] && return 0
> -       local NUM_LINES=3D$(echo "$output" | wc -l)
> +       local NUM_LINES
> +       NUM_LINES=3D$(echo "$output" | wc -l)
>         assertEquals " number of lines:" "$1" "$NUM_LINES"
>  }
>
> @@ -73,16 +74,18 @@ gpiosim_chip() {
>
>         for ARG in "$@"
>         do
> -               local KEY=3D$(echo $ARG | cut -d"=3D" -f1)
> -               local VAL=3D$(echo $ARG | cut -d"=3D" -f2)
> +               local KEY VAL
> +               KEY=3D$(echo "$ARG" | cut -d"=3D" -f1)
> +               VAL=3D$(echo "$ARG" | cut -d"=3D" -f2)
>
>                 if [ "$KEY" =3D "num_lines" ]
>                 then
>                         echo $VAL > $BANKPATH/num_lines
>                 elif [ "$KEY" =3D "line_name" ]
>                 then
> -                       local OFFSET=3D$(echo $VAL | cut -d":" -f1)
> -                       local LINENAME=3D$(echo $VAL | cut -d":" -f2)
> +                       local OFFSET LINENAME
> +                       OFFSET=3D$(echo "$VAL" | cut -d":" -f1)
> +                       LINENAME=3D$(echo "$VAL" | cut -d":" -f2)
>                         local LINEPATH=3D$BANKPATH/line$OFFSET
>
>                         mkdir -p $LINEPATH
> @@ -92,10 +95,11 @@ gpiosim_chip() {
>
>         echo 1 > $DEVPATH/live
>
> -       local chip_name=3D$(<$BANKPATH/chip_name)
> -       GPIOSIM_CHIP_NAME[$1]=3D$chip_name
> -       GPIOSIM_CHIP_PATH[$1]=3D"/dev/$chip_name"
> -       GPIOSIM_DEV_NAME[$1]=3D$(<$DEVPATH/dev_name)
> +       local CHIP_NAME
> +       CHIP_NAME=3D$(<"$BANKPATH/chip_name")
> +       GPIOSIM_CHIP_NAME[$1]=3D$CHIP_NAME
> +       GPIOSIM_CHIP_PATH[$1]=3D"/dev/$CHIP_NAME"
> +       GPIOSIM_DEV_NAME[$1]=3D$(<"$DEVPATH/dev_name")
>  }
>
>  gpiosim_chip_number() {
> @@ -3044,14 +3048,16 @@ die() {
>  # Must be done after we sources shunit2 as we need SHUNIT_VERSION to be =
set.
>  oneTimeSetUp() {
>         test "$SHUNIT_VERSION" =3D "$MIN_SHUNIT_VERSION" && return 0
> -       local FIRST=3D$(printf "$SHUNIT_VERSION\n$MIN_SHUNIT_VERSION\n" |=
 sort -Vr | head -1)
> +       local FIRST
> +       FIRST=3D$(printf "$SHUNIT_VERSION\n$MIN_SHUNIT_VERSION\n" | sort =
-Vr | head -1)
>         test "$FIRST" =3D "$MIN_SHUNIT_VERSION" && \
>                 die "minimum shunit version required is $MIN_SHUNIT_VERSI=
ON (current version is $SHUNIT_VERSION"
>  }
>
>  check_kernel() {
>         local REQUIRED=3D$1
> -       local CURRENT=3D$(uname -r)
> +       local CURRENT
> +       CURRENT=3D$(uname -r)
>
>         SORTED=3D$(printf "$REQUIRED\n$CURRENT" | sort -V | head -n 1)
>
> --
> 2.39.2
>

