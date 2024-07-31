Return-Path: <linux-gpio+bounces-8483-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA17942A4F
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 11:22:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29342284A5A
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jul 2024 09:22:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 424BA1A8C00;
	Wed, 31 Jul 2024 09:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="g+9iu+O0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00779208A4
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 09:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722417707; cv=none; b=tK+qw0bWKQOrgfdIQXJkPSRPaNkVMB8ac9B85FS3WeyuBuLEU/UAUQKHdnH4YC8UhbQV903H/QqTwnykNCMzEoFuzBn7oS2z5Zf+sC79TfCQmLJaua7Yvu4M89rUAMlUXijDlCDa40+k9ckIkSXT8UXWSiLWHbV5buREo9uy2c0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722417707; c=relaxed/simple;
	bh=gOeHuZiNv5fPMnbcqoee612UZWcvYBhaVsKjiTROguI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P1w9JKUXw0heTqlvRIbjHLiL+tevhJUTwtgxqvl/hvhU3+iiIgukyHe05g9/EMLGCwANtZc6F3n1LVubIVRvBOwOJMClK7/+rO8ORtz2vQIITJBaKG4Fak53Tvb8mrgIxaCFM5ywsGpb2JshcEKJqYzGrHV8ihygwt1JOCl7pjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=g+9iu+O0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4266f3e0df8so33767745e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jul 2024 02:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1722417703; x=1723022503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QUY7yqET/4fM6hEFSsuuXjHRk59205YQj4toTS8c5AI=;
        b=g+9iu+O09Ds5CcOK7INDYDtphkrvr+p1Z2xghOE9HSMsIPaY+/l5JQE0sz/sFrtF2D
         RVBrKqZs9e8zom0sR23qvciWkLMvlIiWZQYLQUUIawIuuNctG91aKe6raR0BOnfDyz4t
         ETmX/UMH2oVMFC0qMfajquRTTu+RuoUzZfOzWqkaKAUJWKArg2S/6qPv3Y/gH9X2v6nK
         mvaLhsfzCQ1SaHBI7xrmNvbP4l2OAD3gZplYIl06RgtGveUWvA002sdyX27zwBo+/lAN
         FKHsLgV/Y/lgx/inEhuj0UkOFO3Wx3PDU8IYd2TpkDuiinzNXOKQUCjscp13wxUlWHbj
         vL7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722417703; x=1723022503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QUY7yqET/4fM6hEFSsuuXjHRk59205YQj4toTS8c5AI=;
        b=T7qMUX8ltmBJWyWsMSqftIx4gERg3BeUqW2XC/2F0ItsPIciRG4MyonTGL5GJQSEW2
         8tYCFBLVNzkXFhfBZtW4y3EbW3Ev+QOLa2UIfgrnBYRkscTSdxBPNeWPlPbTf2fKXAeV
         hgqXYnVgjI7fZ5hl89XjJce4xvZ8gmqsGW6FiGXj7CVWU/KG3qBt5BhO++Ix0l4a1EnX
         XxbGFmGO1y9Fc3tq/aRru34ISR/hr2RAncse7SCHN7d/x0K5pBJ5r6RNaWaaLDkqm5Em
         FqI6l1tXhEWFJmHXh33aocB+B4dSYJKYBj9FFPbBmfAKNZb3vTiAEepGPE1uDndc54OY
         /Qrg==
X-Forwarded-Encrypted: i=1; AJvYcCU/5OH/JiieGnJdHIuLY3HzQE0oNnepobDec/ELsS2SbrtdP8+tG2YbZbFukuJTb2UDgCm3gD+vneGLnNohqcItxCV/N+2U3WHpMA==
X-Gm-Message-State: AOJu0YzBVjjv8tsLbyx1XZIqPEykg9mLQSVcD7Bs+qO5ICcNowuRmn89
	UJ/HKo0T9p7hcqQWAB1R61/6emjSPQ1QiM1JfMmEGhZpfM4oEITgFMUj3aMXYE0=
X-Google-Smtp-Source: AGHT+IEGTMmwLNh6UnQBUFrdBJ0QwM2AxKaTpvdigD5uJ7dEbmP6nQ+Qa4BbEe0L3iCqaWWRAMSNNQ==
X-Received: by 2002:a05:600c:a01:b0:426:602d:a243 with SMTP id 5b1f17b1804b1-42811d9f21fmr94554495e9.16.1722417703005;
        Wed, 31 Jul 2024 02:21:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:9c3f:3dd8:b524:cb31])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb64006sm14481645e9.30.2024.07.31.02.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 02:21:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: brgl@bgdev.pl,
	Iker Pedrosa <ikerpedrosam@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org,
	warthog618@gmail.com
Subject: Re: [PATCH libgpiod v2 0/4] Fix issues detected by static analyzer
Date: Wed, 31 Jul 2024 11:21:41 +0200
Message-ID: <172241767016.47158.16812278340760777151.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1722250385.git.ikerpedrosam@gmail.com>
References: <cover.1722250385.git.ikerpedrosam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 29 Jul 2024 12:57:15 +0200, Iker Pedrosa wrote:
> This patch series contain a set of fixes for several issues detected by a
> static analyzer tool. They are related to wrong pointers management and
> string termination.
> 
> v2 includes a number of fixes to issues highlighted by Kent Gibson
> <warthog618@gmail.com>.
> 
> [...]

Applied, thanks!

Please use imperative mode next time in commit messages. I tweaked them
myself this time.

[1/4] bindings: python: gpiod: avoid use after free
      commit: c497e29ca1f88963c525351e60af23ed896a2b8c
[2/4] lib: line-info strings termination
      commit: 5533f277aa28b36f8ed4bbfac8e22e011ed68858
[3/4] lib: chip-info strings termination
      commit: d71f5ad24663624a17d335462908ae5a8f69bcf7
[4/4] tools: free to avoid leak
      commit: e7b40978801a6148cee75b10b9b775eba1b70a64

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

