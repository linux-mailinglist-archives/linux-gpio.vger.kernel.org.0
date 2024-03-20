Return-Path: <linux-gpio+bounces-4460-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFAC880E38
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 10:04:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD0211C20DD0
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Mar 2024 09:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3927338394;
	Wed, 20 Mar 2024 09:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="obfEUUOe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D81B13AC10
	for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 09:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710925459; cv=none; b=V/RHaqzfejmcpNAQqN1wW81OV7u1wv5OwY/Obx7oS0fuKRDbe4r5DUVbut4Ibv1tHneOUCi5TinebDji934+BYyduyho3L9W4Hv+VY1sTqkjOnkoKsVzMX+JYs4Qn+x+k4X9RxlZB2euK2Jr/kj7KJD6mZq10+Uo6jX9Jz55VVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710925459; c=relaxed/simple;
	bh=BTkTcVfqWVWbzXxMtTPuxzFtl9EAto5vfkPgrX6+cTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdQpvWpeT/iyVNpqHrQ4CDasrsa5xo66tQbSqDBFX4CSo3wO19YTR8ttD0Zq7aduwTHCx2g03eOqDd3SGFCKSxueNJfWUzOdgUP+Q4EmMjvpjwwPlL0AitfwfaN0wWQRT2hlwen+vvvgcyyO1WeS3xuhFhwP01vE1sHDI/GKVWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=obfEUUOe; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d476d7972aso96595041fa.1
        for <linux-gpio@vger.kernel.org>; Wed, 20 Mar 2024 02:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1710925455; x=1711530255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BTkTcVfqWVWbzXxMtTPuxzFtl9EAto5vfkPgrX6+cTg=;
        b=obfEUUOePojeab/con7HpYquV1rygi2Q1CJxSUF7/q9CGK7YfnektJ9uoBc/CHq2mX
         o5SP6568h9LQnbJTbfW8YyJ/MOdQWkV7nRSPYMOOXbmoD1XOVm5LSzv48+L1/seswMAU
         UHRhUFGB3aBLEJ5WYnkJHtlg+Azp7FuOsdOLFtM+jH6Y0XemLY+M0VFdsvFCGtWPIN7c
         4QGjZFtolZNCvofmiMIpYyzNsAFHiSr2Wr6WTpBg1wk7MZsoWIl0rkNkgUfaEdOhF6I8
         V/KhKPu0Y71qm7w7dXBezvihtclAi5TFHj0HRFImaF5/fjeMTwXsIwn8B0fJQjr+PCqg
         zM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710925455; x=1711530255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BTkTcVfqWVWbzXxMtTPuxzFtl9EAto5vfkPgrX6+cTg=;
        b=kddP0+mFH7xsFHl1fmkXHlBws7vogwrt0r4MTM4A0tHS9LtJkv0Dv6nrqONJGM3md2
         nNRgWPMvPGMDTUOSgaUehc+e3dVyA3+RgT5uLITVIQtZe+1yJu9H7vFlObjaxwmId9Lb
         um6MNEFw+DVchmuzmj+CkuEQBH4dw8b4H73lJ3SSvZ4F5l+owWdA73yT3ted8y5cuwh5
         XyYFJB3uulpEsBJ2L2UYdzIwdjPx/TfLwx4miV+8n5tuQN8sMvaSUycGoY7BkL6fv0+4
         55BlkxLHvA3Sc50ZXezv3c5cCf0+rb1nTBBpGQ1DRyIaMJrEQnAVyBucra75UzY56uA7
         lU5Q==
X-Gm-Message-State: AOJu0YyR7tCxRs9LLMp3/KH0HMnJN//rWhzYpRWN16W5ROCnCTkdhxz8
	lXV6XYnYGbW1xdc619k2KjBW+NnUmNGaWj36gHMm3SmlUgT4oyWpvUdDtq1y2lFVOeaj0U/hlE3
	VQkdSLAKQ0YvBaYELBrXw7ha9vU1i/PDi1w8fc5+OrAS9IvzZ
X-Google-Smtp-Source: AGHT+IFkS2FFIE/z7ZHDwBFNpDrqu8wxVjX6iC74+DTWn1lNJ4BJyQXN1jtQVEfvk4pMg6KFD6noLV/DF2d0UlLRRNA=
X-Received: by 2002:a2e:b0fc:0:b0:2d4:68ef:c711 with SMTP id
 h28-20020a2eb0fc000000b002d468efc711mr3431473ljl.25.1710925454800; Wed, 20
 Mar 2024 02:04:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240319110119.36cfd704@Akita>
In-Reply-To: <20240319110119.36cfd704@Akita>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 20 Mar 2024 10:04:03 +0100
Message-ID: <CAMRc=MeGWPNFKK1iRwBuETfgQnQzKEPDb96O_uEKouO8MiN0cQ@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH] bindings: cxx: link using the libtool archives
To: orbea <orbea@riseup.net>
Cc: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 7:04=E2=80=AFPM orbea <orbea@riseup.net> wrote:
>
> Hi,
>
> When building libgpiod with slibtool instead of GNU libtool it fails
> when it doesn't find -lgpiod. I attached a patch that fixes the issue,
> is it possible this can be applied to the git repo?
>
> This was reported for Gentoo: https://bugs.gentoo.org/913899
>
> Thanks!

Hi!

Thanks for the patch! Could you please resend it using `git
send-email` so that it appears as inline text on the list and makes
reviewing easier? Also: please use your real name in the commit
message and the Signed-off-by: tag.

Thanks,
Bartosz

