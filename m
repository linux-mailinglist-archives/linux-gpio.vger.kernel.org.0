Return-Path: <linux-gpio+bounces-7721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 348D7918017
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 13:46:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E018B1F22A92
	for <lists+linux-gpio@lfdr.de>; Wed, 26 Jun 2024 11:46:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29B5017FAAE;
	Wed, 26 Jun 2024 11:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1Z6ba+QH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843D3139D04
	for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719402383; cv=none; b=KdWMMG6f6N2WGgOhzSogqUgKfOMM7mW+GOVoKV+ssO2smc8+ctWbZsNC7CWEYayUqqEVGU5Hh4DwM2QO9ozrhaXgQ4kGdS+y47yhNiafGtRM9ZNYYZr4G+kAkN6VE6fkgLsaDfAl8HChcMxhJybNiYd3Y9ThCT9HJcEhrVOrUig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719402383; c=relaxed/simple;
	bh=Xk2LNbzme7MT44mPDYnDDNt56ztybDfUPtZQBVnnN0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/m6lHCIYWKJ9/NKWCXWu/sUt5tmKsZpD4Nm+d4ryAwybW5l5vB8hnPVuq0dDGKyILesz7pETJfrJAmXM5iZZYY3XuwBlmkvXSA/1p0o61Dncp4sqcdmHuho6/v0SmFqWJ/jOz3xRe4cjISXZkbodTJDPIvG0cmXYrDEZLm+Fkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1Z6ba+QH; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so72971461fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 26 Jun 2024 04:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719402381; x=1720007181; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ivKhkKERiob7XeIyEG2ezyLpuRNeSLzhi5OPf/vRhDQ=;
        b=1Z6ba+QHorNNM88Ul1HC0MfGu7Ztr5io+d43cwUaLra2dUPV8iTbCH6lh3/dF8Tt3w
         uOgo8g9odiGMuFx4F55hkJ82AVxaA47afict/SjfoNfEnCuWRLuWs2YHj8/0MdZ1kEsa
         OwrvLTkpuSIqOnmRNVKE4lYAAR1GcWZyH8YEk9xFPIcKbwuVm2BuRuZth87F62ZfrZHM
         PqiaV7QIcc0B6B268LSWf8DJp4HdBG0EhISuBlZLImZ87d0oeclNrKHitKhDlJ3Uw7/0
         MLjjzmLDUI7bb3wUH/7t3+DsNYDHd85lMVYTkg96ome79HM/e0YKsvb+Vo+4VwNGEvI/
         BG/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719402381; x=1720007181;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ivKhkKERiob7XeIyEG2ezyLpuRNeSLzhi5OPf/vRhDQ=;
        b=RIOxRKHJ5RmhydJN9uzWhbosYDx3xj1kAdkalwZmakhS5H4txO6V2VG9V10ZOcNdzh
         CpUAkRUrvw9BF6MQt93V3XOfJCUX+VbkzSgVBUXYQ2zd6+hIa82kbY5ZOgRSwWaL1Ihd
         1SZCuGVhHhZz+SAlDmNtPOBQPAXmpYnlLeIHCrBmAinyeoEppkGkoD+Yso9vPodQ8y/p
         dPPEQt1aL6jtiNUTpH8sSmD0MPRCOlM7lF10PJ4WaoQiv5VPXyfrrMlnHmDo2m5XGfZQ
         IC8gWppgN+Q6s+VtmVYB4lz51VNe8RbLQuuGZaSfiU8ZzAeVQRHCJKjr3OKw8nzV0eAV
         ZcMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0821FdR+sifKQr/AhPjHbqLRyxpopjsJaK1U+9lwboxvYxxqKbahu7LgVtFPkh31szFw6L1qqHbUpQWRplPco0irSuoYDlD2GVg==
X-Gm-Message-State: AOJu0YyIik+DL9bWYVNEvlkEfxWTYNDSURwCjYVHb0OEFqnyGj0Mq6WV
	sA83bOy5IVUB08x87wmz5BtT72rCA3rgrFBv+Bdp+P8rw2X4WLIKTuYOkhBhSx+mF+qPLhDYFHc
	pAgrydIXH3vX3SP83d9utZM9dPA9nAMKEuLCtAA==
X-Google-Smtp-Source: AGHT+IHZ3UXaVFuTvL/MpPHs91fWdqv+FqBhfwARoeGwnutlQoZWH/zebBBRKJgfItL4zMJThnRDmj/Oj34rj2pK6FQ=
X-Received: by 2002:a2e:9596:0:b0:2ec:1dfc:45bf with SMTP id
 38308e7fff4ca-2ec5b3d496emr54685221fa.42.1719402380803; Wed, 26 Jun 2024
 04:46:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240620094159.6785-1-wsa+renesas@sang-engineering.com> <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240620094159.6785-2-wsa+renesas@sang-engineering.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 26 Jun 2024 13:46:09 +0200
Message-ID: <CAMRc=McPFAKh61r_L4kpTdD2HJCWo_u_=Wt3bJ5SMVmtSgE8oA@mail.gmail.com>
Subject: Re: [PATCH v10 1/1] gpio: add sloppy logic analyzer using polling
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Linus Walleij <linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 20, 2024 at 11:42=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
>  endmenu
>
> +menu "GPIO hardware hacking tools"

I want to put my GPIO virtual consumer module in here as well so how
about calling it "GPIO debug utilities"? I can tweak it when applying.

I would have changed the general architecture but it's always a
trade-off between perfection and getting anything done. If Linus is Ok
with this then I won't block it.

Bart

