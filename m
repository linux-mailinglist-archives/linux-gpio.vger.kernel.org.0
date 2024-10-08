Return-Path: <linux-gpio+bounces-11050-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7C994F3B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 15:25:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D372C1C20E3B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Oct 2024 13:25:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09A301E0B8B;
	Tue,  8 Oct 2024 13:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sSXUlECj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB891E04BA
	for <linux-gpio@vger.kernel.org>; Tue,  8 Oct 2024 13:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393819; cv=none; b=emLw3uzhfLaKTt0rHdSn7Y/XXx2ASRVioHj3y+rE/m9ua/97uE7FjUdzFCpENpi+8Xvh81Osj/snoT28/LHKKk/5kHyXfsuPiOb21i4yfuOX9UcM4B18+sN0HpV1o0e0TzXlXKqu9+WrWdqwKweMR5tKu83lIUJxzpxpwAukQ4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393819; c=relaxed/simple;
	bh=WI1DMs/nqbj/uWd0u1h29LQzJ1rpQ7NF7zh9No6L1WI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DM48Qewb+VXoQC5vJyUjjpNlRowDbEL8XrqaP0jWjKSv4H5AAwuapJPb74hjrn7GTluk8WEYqZdryWmTYvsmI4XYVBgMV+8Is9wFtQySSjyftyr99rKWm4uKKiLVHmbvQSCKKsJpS89slV2r2DWpy/qiYcW9bHYoZgvT8oZ5af4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sSXUlECj; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398e58ceebso4884344e87.0
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 06:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728393816; x=1728998616; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WI1DMs/nqbj/uWd0u1h29LQzJ1rpQ7NF7zh9No6L1WI=;
        b=sSXUlECj+IpXKtPnENaKOy2fAcTMcwsnLpGKY8iDea6G0iS7TYMDsZAYf9ye5il9Y6
         6z68jjP/K5QJTg/tQeV22OFgZ8FedfndGyM9oEiQVDXnvPeXkU6atFDcmILWBPS6VSr1
         Nkq6KwytqQCzYNu9kYoyuMwpABcyZu8bo4hJ5nS2YwhaMtMFRHyf94GSoJHBlFUEXDnA
         kmh9jJq56cpgRZl81PdUOnQm/MNBfAWaYa6qIyDdZ4hDEL8MGGLpkhcOALbMgakmBqfs
         jwxKj/Wv3mbFCmtUEoIPZOSiw+167I7piR/V9JJeGgaLf7HFA7+bkMJB+PJOxtVNw1lZ
         Cd5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728393816; x=1728998616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WI1DMs/nqbj/uWd0u1h29LQzJ1rpQ7NF7zh9No6L1WI=;
        b=FASWhhyVL4dJW1yPHfayUW5FFf7qzzjKgmhyhcRzynPjEGhPfEZ6cwv3QZASgG+1MA
         gxMBmpUX60PCDa1wLZkP0jYoJyVq8XBK6BcxOhTfJTjt0GoGWtK+5gNfX/h2BHnap1DQ
         OfGBMTCj73ZqiM02Z5Iz+EbCK9V8ue/pPfAlU1JZWeQafENZFYQ4b4m8r96HHEGUUwlU
         SnLSjGYsjY5LlwxuskOv9JMpzEb4fZ7sdx3Z1JHV7Lk8uUu+LQQ20dgTdZ6i+oKhBqcc
         pqiz3DvKRP5TBQJspNI/lW7vUYCQlxxaFTLUEfl7r4UQuYrRwYMSzO+A4WBO3SvQSpH6
         HHZA==
X-Gm-Message-State: AOJu0Yw6EXm2UAmpglsitAGKCNkExa3Rqg/hH6hbJmD9HWo68c4Ky44z
	k7iSkOxqQwj5BC2TbwjOTgjBU1gvWDSEgYECe/HPcT84a10u/0WhH5QMvb9RqIZ8GehW16yqB2V
	3TVdw2acOVrP/pb0afEHU5Fs1XgrcU43iUNZUqg==
X-Google-Smtp-Source: AGHT+IHIyRLz2eRr8RrQfvNGIjIGbOX0bZIdZj+4JryAYGRZDxJQRMLhpbQ56ZFbx2SeuqPDTcGT47FV7J9Uio6tLgE=
X-Received: by 2002:a05:6512:239c:b0:52c:ebf6:9a87 with SMTP id
 2adb3069b0e04-539c2b65376mr22871e87.26.1728393816288; Tue, 08 Oct 2024
 06:23:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240927-vfazio-mypy-v1-0-91a7c2e20884@xes-inc.com> <20240927-vfazio-mypy-v1-12-91a7c2e20884@xes-inc.com>
In-Reply-To: <20240927-vfazio-mypy-v1-12-91a7c2e20884@xes-inc.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Oct 2024 15:23:25 +0200
Message-ID: <CAMRc=Mf8JutXTdEeeWbb4JrDWAJkFmVu1EJKaRaei_eaqUxuwA@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 12/22] bindings: python: raise exception type,
 not exception instance
To: Vincent Fazio <vfazio@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, vfazio@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 27, 2024 at 8:57=E2=80=AFPM Vincent Fazio <vfazio@xes-inc.com> =
wrote:
>
> This resolves a strict no-untyped-call mypy warning.
>
> Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
> ---

Ok, so I see this is how it's done in the standard library but why? If
an error doesn't take arguments, one should raise its type? Could you
elaborate more in the commit message?

Bart

