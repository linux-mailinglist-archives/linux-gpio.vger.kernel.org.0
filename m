Return-Path: <linux-gpio+bounces-10822-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB33990058
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 11:55:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8E0F21C234D2
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2024 09:55:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBE0A145B0C;
	Fri,  4 Oct 2024 09:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2nBKS8Zi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4CA8148FE5
	for <linux-gpio@vger.kernel.org>; Fri,  4 Oct 2024 09:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728035716; cv=none; b=rBRnB7/FGZnOjmY2XxbCIlOj8E0Fj/zvPuXm3Xw22fnQ/rhClEBmmDiBlVA41xzS2+i3CJYAXt79fIjENXSpP+mwV1ywDYbxBqOTr13F3/e09J4/hWLnIS4V8CMwYcfAsrcjfphAwHsGXQh5BUuonxQSEzSABxOeLTO55K7su8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728035716; c=relaxed/simple;
	bh=VZkyOhfmfwOoeVYduF15/aldfYX+K1aFcF2/tssYyeQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BlIaiVTIOCjUFGvCzg8Ee/dBiAHsEida4Dvotv42gGX9vatR5VJ4Dd5X+CTWXV115MxCm7flL0ZJiAarROTVumIFNDjGzgGUGW8W4rKhFm/lSebZyffq4736LCgiOlTleM+8McySre84xa954EmtpCYhiIjhXDk5hTeq+tQEnfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2nBKS8Zi; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5398a26b64fso1939827e87.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Oct 2024 02:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1728035712; x=1728640512; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VZkyOhfmfwOoeVYduF15/aldfYX+K1aFcF2/tssYyeQ=;
        b=2nBKS8ZiHZEb+zcoDe2jm3b7Q/MuyacVCUUB6gv8XnuzZC6zFRPdYDMeLpgshNywq8
         tP6yZNj2mVmDRLgwJaGiXExhqBHSxPjn1RV6iI9FoAGc1jIfaF2ROEXlJ5+U1BHe8/DK
         GB+AraPn7B3swVvl6cdL/NnUt5tX4i0FjdsSa7GiDoaIV0Tcy+/UYj1sdXGiO1W8omyQ
         2ZqtuHZ7yj4jWItKIto5v/hGM/+8+VklTF54k5KmMwF0t1bOqmicYZI5EqEt3ZtiZEHa
         kf/Soc6ubbQF0iTJwIKLVhypjGwseACkj9+3W6tGrqRHhkQAEHaarxf47qFe5hDtW40r
         SsxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728035712; x=1728640512;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VZkyOhfmfwOoeVYduF15/aldfYX+K1aFcF2/tssYyeQ=;
        b=GsyZ//L+rEDxiMQrnCtjpQIDOWsk6I7Gri2JOFNRdBv4lJSQyDNxa0tLMlqSbyms2c
         8N69tO6zRKvhZQoOUAv+qAIAZGeCZNzVsmuwEuauFEHwxwxgMmB26DyybVpHDs7vjMd3
         8+iapvEZwNI6HRYeq0gA+e55clq7Q4sUDCfJ9g+IAGkLmiywYwnqPWx4vlIMqsklE1Cu
         JQUsu1X8MZYzka7I0RRN2vfbLK8A244AengMlnbnt/Ur9LQiAqlEOaEbt2Gs5v/LKcBF
         eh+Y+fY//D/ycYuhJAMQQ8z+z5tI9lQ6wtaHg2lsfP1Aw/ugdp8q5tSN/WCcLfBH93+t
         EmTA==
X-Forwarded-Encrypted: i=1; AJvYcCXVJwxRcPOZAe31Nht/pmDfZZ4AJnmc+LK9vw8+xBo6YS+x90li0qoxPl0jPeJIXGviilSjMW30IJqQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzSgUWWoYEFIra5k+pYndjlWOXJ/JU0qcbvH6BoV19wyUtl5GxV
	DCSS2pGAEjmBj2JmMkAvx2rsEwgantzRzcyUkSWHY1e06HCLoT9HNexZXg0SbknmTrspzdZqWQb
	tbIlfyMGeJbbJOGXxdV0u+GZt38VW3qYEVfLvCNXg7HXrFrsc
X-Google-Smtp-Source: AGHT+IHMoy9Gn+vt7ZPfDNdYQxtrQth9VH83rGtAy+ppNU5YtqZ0f8Y0/j+3miyM9ris+4jBecKTtCv7GJlCuxb9R3w=
X-Received: by 2002:a05:6512:3084:b0:539:8aec:ecd6 with SMTP id
 2adb3069b0e04-539ab9eae1emr1424166e87.44.1728035712239; Fri, 04 Oct 2024
 02:55:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004094101.113349-1-sakari.ailus@linux.intel.com> <20241004094112.113487-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20241004094112.113487-1-sakari.ailus@linux.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 4 Oct 2024 11:55:01 +0200
Message-ID: <CAMRc=Mfx+OagrGPkMw2LFu_Yzu4cpDnCQPVA3C3rJarCBGE_bw@mail.gmail.com>
Subject: Re: [PATCH 08/51] gpio: Switch to __pm_runtime_put_autosuspend()
To: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 11:41=E2=80=AFAM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> pm_runtime_put_autosuspend() will soon be changed to include a call to
> pm_runtime_mark_last_busy(). This patch switches the current users to
> __pm_runtime_put_autosuspend() which will continue to have the
> functionality of old pm_runtime_put_autosuspend().
>
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---

Sakari,

You didn't Cc me on the cover letter, please do it next time whenever
you post such a big series.

I got the cover letter from lore but it doesn't explain how this will
be merged, are there prerequisites earlier in the series? Or are the
patches independent? If the latter, why not send them separately
targeting individual subsystems?

Bart

