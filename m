Return-Path: <linux-gpio+bounces-11043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEC9994DC9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 031DB1F2227C
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:09:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4ED51DF254;
	Tue,  8 Oct 2024 13:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TTKpNjaP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A251C5793
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728392964; cv=none; b=ENcuDH9wmcmOBISX9h+okH3t2Ej+hb9d7RKTxMWweKlBSiUHm5M+pFMK3+1awOblaQW/za4lncR2EOSJKaEjOHs6ZykxfYoMOXKCVWvrKNir2WrN7GUwCatCuyeijnsYrwHMrjTHE5GGbMMBipO4Zodkv8WwIqYkehWKcOpZOIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728392964; c=relaxed/simple;
	bh=WWkk2SoIJTL1mcULGI3lhNv37EJw2+lEA+xuz7r7vqs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FcmEyYhzlMg7N7mJnDtjvNtJarm3QcJq4iqKsEtD54A5YR7PmuMvzxQaf+2frVbebiT1umxOctvkCmfK1MXSSr3TR1azPtzcNi7RBhiCulqE5nQKO05fQSXJviFV9+18ZPFhNH6DTKMJ7OWPMAyWqZFDg6EGIJMcz18eWcH7sHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TTKpNjaP; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2fada911953so61497521fa.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728392961; x=1728997761; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJ9iBuMAkUA16xXb9cm9pB+Fz2BqS/DqoOYyejnt2D0=;
        b=TTKpNjaPzOsRjPsz4s9NsOdegS7uxfm9kwrBschNuu8+y8FP+K7Ey4UtPrjAXmT5cO
         lV9ljywbYcpVcLBmnOr0YIREjh2OSD6J/QHde7brl6PzNJvXGKJsLXDh3i2ytx2V71i4
         zRMVTXktxhjPSdGj+7ANeTKla2kHDAUPjRgKetVQ77OxItD5prX3pqXljtfg5FJBL60Z
         Nm4dLmkdgJg15ubSeAOoxx05opnao5LRyIPjkZ2DlwCq0yyFp3AASF+kaJx3yN1EQD+w
         qN+fU2pLOsAsrL7JPisqs7ScS+fti1kDBythvG0swvkSGFuavlQDoT7FlM+2YRQwij9I
         JwwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728392961; x=1728997761;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJ9iBuMAkUA16xXb9cm9pB+Fz2BqS/DqoOYyejnt2D0=;
        b=w1BbeGkQ19XPIahj/eAyR8bXgJ6hTfwyTYnL5UDDpHtDI5SC2sSyrN0b+akLyWyOdj
         pLQE0Uu7zNeWXWbmqLTK9rMmWTfbQ/V6qwshCPA/pOWpkKQS7klzyI7u39a5hVyOdQE+
         fOIWlEFNOmAckZw9S48vZFuPR1S5/K+HuVEwUqxKXK7l1KBCnolyYIepgPWMJ8uKPDPE
         rNMkI+NT+lhoBOIamye/yh5gk0PsGfDubz61TizqFqgqKnu+RM1pfMquLt+3KOT5Vd4J
         bRBoZbrOGk1xh6a5pkCYdp9uCSD6RHBrm89kdcJQiT9CNOqkRFazqVyx2VZO9gyh4PPo
         NM7A==
X-Gm-Message-State: AOJu0YxQweGc7IyDnAbv9S9TcvymC8wPIYo4laLYuvGr3sMtrHq0J0zZ
	3wqWtiZCmJfarvaTkZcr5pn7p7PiETzEERQCm3TlruIiXd4oVvfK4FrunOl8AtBaFmi+9VtdqPa
	knAOkMUJLAPv8+glRuhtkFi9l5GBCGOUULJraDQ==
X-Google-Smtp-Source: AGHT+IFe/zOkecQYvAvLFqhvl6udibGTZOUgIkqp/Gu/TgQC4Ru3ieS3ObbRTD0pDzaRnXjSG7RIyG0wYr+hXtmZvNs=
X-Received: by 2002:a05:6512:239c:b0:535:6480:707d with SMTP id
 2adb3069b0e04-539bdb056d4mr1080368e87.19.1728392960414; Tue, 08 Oct 2024
 06:09:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-6-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-6-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:09:09 +0200
Message-ID: <CAMRc=MdQsxTgunhuJkOtBHtyE5uc=voCvQBeLvzgk+a8pOQQbw@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 06/22] bindings: python: annotate internal
 members of Chip
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---
>  bindings/python/gpiod/chip.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.p=
y
> index 75cc337e74bc965a30962b39a1584b13b4c4b067..4aa5677f94caf8c5d863aa6d7=
5915a5b650de137 100644
> --- a/bindings/python/gpiod/chip.py
> +++ b/bindings/python/gpiod/chip.py
> @@ -57,8 +57,8 @@ class Chip:
>            path:
>              Path to the GPIO character device file.
>          """
> -        self._chip =3D _ext.Chip(path)
> -        self._info =3D None
> +        self._chip: Union[_ext.Chip, None] =3D _ext.Chip(path)
> +        self._info: Union[ChipInfo, None] =3D None
>
>      def __bool__(self) -> bool:
>          """
>
> --
> 2.34.1
>

Needs, commit message. Otherwise looks good.

Bart

