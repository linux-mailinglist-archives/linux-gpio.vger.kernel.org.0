Return-Path: <linux-gpio+bounces-8946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 007FA959BCC
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 14:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AFEE82846CE
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2024 12:28:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1BA18C929;
	Wed, 21 Aug 2024 12:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nmGKXRia"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F5218C915
	for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 12:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724243318; cv=none; b=QcrwzcZBMjQCpgv7JOmbD7J3jlQHHIHg4H2gMoPwKpqZVc3MWfxPIuZaMh4l/49asUNJD29zWhigqaIedqLVDWAlgYBwGd4HwDMcnecAqxehnkeCE0IiP2lNA0WmgNrmjdZCmKdWTo/VmPF+zDQzCk61I/7D74KR8cJuVVM+1GQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724243318; c=relaxed/simple;
	bh=xSVFz9HHw+X7DH7Ea8DnG25gh6quJr/uVGhVSIEoCqg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkdh6GSF4pGL23h2orLm4jOiL/YC3FBmTO4iErEMEqQvAQElC/Vg+H0RXgY8Qb+WaWCqDcRLm447aLPFYVbApdm02Tlplf9Q1C9bWTx8oLyadcQiLmQp6SnK9R6Y85318JZtq1tufEj3ISbk7Q1bEAjW1pY/QbSmW6xcKOYtC3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nmGKXRia; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52efdf02d13so8806725e87.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2024 05:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1724243316; x=1724848116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xSVFz9HHw+X7DH7Ea8DnG25gh6quJr/uVGhVSIEoCqg=;
        b=nmGKXRiazpW6Z65QER14Y80Fg2Pk//ZaJhXSODGjNVImBCxP0IlBXpjFU1m1yPYpcz
         qacyWen9+eb4XQcSsEF9WcxLdrudTeqvgQNQ/fYlw937FXZnwPFbArSEXzqyCjnaDmkp
         CRMCJ3SKZTl9hjMxJ+F3586R9OlS1Y8Zyf4Or1IFXCPLTua4Bm9RMsfl0j/8FrDkcS8g
         OD7YeAjRff4crYHubCslxk1nDYo3/7eEU2YMfViNvCAo8vLk6xwdvlJ6mhTYPt0ma9MC
         ZgbF/SV6G59uTKD5pWYYHIhPCVAnHSVdJE/5zJwKr8jchZWrjztWOVcCMGfGwTyQVpkA
         Y6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724243316; x=1724848116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xSVFz9HHw+X7DH7Ea8DnG25gh6quJr/uVGhVSIEoCqg=;
        b=d4GAZ9ubyY2cbpk3Xm2MxkdtTYJ4jHNP/fx8XN29cOh5j/WSZ4y3F7DBXUdJS20BuR
         dr2NGiLGNz0ZmMBymIKcXUeKDES/iSTPLXpQd5ExCsOOt/yBjwM/j0mRLKDJUU1ypbTE
         Ne5+FgpQkAMOqdVXJ3VcZQFhUeTfkbEkcvkAw+cjvynllZyKBbDmKMG/1y/XEkFpU1BN
         y1FoeI6CGCfYZCCcEsO47IRQ9VvEt5+McY7MmyjaJU9m+BeKnmSsH28EKkhX4hBos03m
         2saA9mDRrxK43QdLoHcRdCZ2TRgJ2EqcQcx1lAAsvT5BHSmn42gDf+nmKrHAthtuUbNk
         ijMw==
X-Forwarded-Encrypted: i=1; AJvYcCUhgmhFTdnKWPVWeyGi/YBA/hDFNKNhWv4oh7/0jyw+buLRMUgZMxtKOb9KsKVphtM89XyPWsmxYPdb@vger.kernel.org
X-Gm-Message-State: AOJu0YzPwgqaQcpwwsxjZrOEeuBFZWrt9ShzgyT4Ww6xU759PpNZXrZs
	I+9Ad2IWqNGyna80MBgSoquEZVzxqTnpZWXZB1Hb1wOCYS6ToN/Zbb4cDL0POAZzDxTTscyCARa
	MvnjJU5pdHH3he8dd3eZnzPsVRMQNefdIYy1/lQ==
X-Google-Smtp-Source: AGHT+IHbX4OoZeV/jthI0BKggGZJHlqpdvlmwuS09pBarV/qhMCa8cW1XS+gNam9uu+8PXLA9TMAv0N2A127JelaleI=
X-Received: by 2002:a05:6512:3d29:b0:533:4591:fc03 with SMTP id
 2adb3069b0e04-533485d627cmr1520636e87.46.1724243314656; Wed, 21 Aug 2024
 05:28:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821114202.2072220-1-festevam@gmail.com> <CAMRc=MfNOKhnn1hE7_Ue8nNkVNHrDsyLQqz3ON39C2zfLmkOWw@mail.gmail.com>
 <CAOMZO5C6=VgQcC9WJ2c8F6_k_nKFZhqcxzYcprG6SzYGf7ryzw@mail.gmail.com>
In-Reply-To: <CAOMZO5C6=VgQcC9WJ2c8F6_k_nKFZhqcxzYcprG6SzYGf7ryzw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 21 Aug 2024 14:28:23 +0200
Message-ID: <CAMRc=McBec0asgoUP0tcQ7Lf9v3uzvDbfUxRcn8QGTCDS-dhyQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: Print the error code on read/write failures
To: Fabio Estevam <festevam@gmail.com>
Cc: linus.walleij@linaro.org, linux-gpio@vger.kernel.org, 
	linux@armlinux.org.uk, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 2:17=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:
>
> Hi Bartosz,
>
> On Wed, Aug 21, 2024 at 9:11=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.p=
l> wrote:
>
> > How about using dev_err_probe() instead?
>
> pca953x_write_regs() and pca953x_read_regs() are not called from
> probe(), so we should use dev_err().

Right, sorry for the noise.

Bart

