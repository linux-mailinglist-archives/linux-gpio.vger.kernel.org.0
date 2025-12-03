Return-Path: <linux-gpio+bounces-29229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8E0C9F2D1
	for <lists+linux-gpio@lfdr.de>; Wed, 03 Dec 2025 14:47:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 663F94E19FC
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Dec 2025 13:46:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB2CA2FC874;
	Wed,  3 Dec 2025 13:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="PbnNmrsN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6ED52FBDFF
	for <linux-gpio@vger.kernel.org>; Wed,  3 Dec 2025 13:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764769589; cv=none; b=gEmYd51El1ZRQj+/iDksBSaBwv7DUl8TP0Tv/z+whr6WkxozQyrqxSR74/rGXedkYswojkXLsfgpuPHHQfzoa1whxB3AZUPY8u1AKaNq3eAzA173qoYcoS+8e0Zi20BBr/eCBeEbrc4E1BVOhPtOnoJ9jYEShnuiHlE/7pqYO1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764769589; c=relaxed/simple;
	bh=QoyOKOGalJTETaQ2d7JCV5VAbOwBVt88lEVeNz5ZVvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GtPtqLjG58pYgkdj9hECdCpjDpKCsZz4/YO+qfGkKdZC24XkEALnNbxfS2O9+HagOONW3+atnIoMrtWi2davNTBjPOJiHZR6DeiTOs6ORgDk/nI24cdrBOotDIRb8QdQknhVlFKoFlNMu4uiPVXmUB+MzU3SPhf3810CIdU/OjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=PbnNmrsN; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5957753e0efso7149806e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 03 Dec 2025 05:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764769586; x=1765374386; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoyOKOGalJTETaQ2d7JCV5VAbOwBVt88lEVeNz5ZVvQ=;
        b=PbnNmrsNOslJ49ITClxL1X4z5uTa9RuNu7VzpCwlbdWPui65Gq62LsA5xjQL1G+/h5
         xbxUEd8TTtcOW/df0nkASEvM1x7zg7CSNxFi7YLyxCVrU22AN8N5eFbRxCKtHI3gRtz7
         75zzgAe7Xy6e7zInt4nIfz3ODWUv8T/t5Htu3kjf4gSerEnAfYAS7Jag4IIQWqRD/v/i
         CauN5HXA4IzyWNI5G7BkI8rspdzPfZXGeQ/bsFOBy8RsuaG5vDjiiESUI+UrFY1geY2K
         dyQj3IvLjeZnYHmcGx56ldAMUuMaQQXTPJnLirnHypSiqS7aD15s9OuCQHoOTI6M+Uv7
         Hf7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764769586; x=1765374386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QoyOKOGalJTETaQ2d7JCV5VAbOwBVt88lEVeNz5ZVvQ=;
        b=n6LAXfgkgvT9garlj7SwzwLmpVmkW6Fp1/Z4eMu1oyowrauuqPUPWf8KVbjw4yS7LY
         p+Gmyr1ZElwJm02PxQ1cqA8rphaU3fIWqQchNTrGUSMFAYW3L1Xax0xepWVsm37OCWD5
         ZUEs25/IT6pQ+i3cMY/YBY5t9egArNEOXMuJpNKEo59C2Jha1pCRzLQUjGsbBqeHHzxV
         uzjpGnYlujrKFL2cwPlYPWGqNRTtpHeWPDGH1WlUewsIuEXhs/s4kc8gNDdQQb9jnWAI
         wJ0tK/5oUWqjzG216CZ2+Q42JiNkYUtzkMX5+HOYjeU7T9kqAZx6OfQB2T+BaSEmKzdn
         ICTw==
X-Forwarded-Encrypted: i=1; AJvYcCV2z238+AdKcLizjR0+bMmlyrr1m+yDd4uxvPbMTQfyZL1tm3yDjRMOHYSEy4Jeosywnh+fyCYOMWxl@vger.kernel.org
X-Gm-Message-State: AOJu0YxiTIiAuzcc9cwSP1BGSjGgOeEPF0yFDLh2M56PnnKE+wimxnEZ
	VUx1q5ikQ/1yOhiotWLDgdgc937tCd6+wMVUOlhG06TcM4PCZK760YkR26A4rKDrhaUj+RMx45i
	9aISwSs7OynoOQdVhnHOeSZohuBLiqIcuop4gobHkQA==
X-Gm-Gg: ASbGncvUnZHV9eu5Wqpyz0oWXVal0RmCB+kAzI7izqA+WqLFprXJynR8DMNktb6/uEx
	VFNZ0B94XvMCu1zNUxfpCrwC+qmB26J4cX6XE8t7cAuizeyiMdI1yJO2h0B7XIdq3sG9wzK/863
	97maVZqfOap2v4s2An/U4NXS2fAotj0uMfTKdFFAfrvIa8OoQYg+xhO/ZB7QWIs3OiLD/JapwL1
	Y1IYrxNq8gtnBjD6uMBy5U93EC/GHQY21WPGnwu3Po6G+OH3tGb6DO9p+TsRpLjNZkAQOr6Rszs
	4JOVetZNyJb6xd+99a3xLP2maw==
X-Google-Smtp-Source: AGHT+IHFFPvlS+xnRg7LmRyAPE0Xg830mIDL8NqOuo2+jEik5URdIxtITO0Sj0/I9E3gV0KOpOR5xUo7sSaBPCH/Rcs=
X-Received: by 2002:a05:6512:31c6:b0:595:840c:cdd0 with SMTP id
 2adb3069b0e04-597d3f0180fmr914852e87.2.1764769585729; Wed, 03 Dec 2025
 05:46:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251203020342.2564767-1-guanwentao@uniontech.com>
In-Reply-To: <20251203020342.2564767-1-guanwentao@uniontech.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Dec 2025 14:46:14 +0100
X-Gm-Features: AWmQ_bn8QlZhzSleILOTocoDoJsUikGtnai0FTYZncK91TZ-8PG9NeCR042vE3U
Message-ID: <CAMRc=Md7njO_3zrmkrSsYav-xokLix6=NwaVYbm59APwFS-Lgg@mail.gmail.com>
Subject: Re: [PATCH] gpio: regmap: Fix gpio_remap_register
To: Wentao Guan <guanwentao@uniontech.com>
Cc: andy@kernel.org, mathieu.dubois-briand@bootlin.com, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	zhanjun@uniontech.com, niecheng1@uniontech.com, stable@vger.kernel.org, 
	WangYuli <wangyl5933@chinaunicom.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 3, 2025 at 3:05=E2=80=AFAM Wentao Guan <guanwentao@uniontech.co=
m> wrote:
>
> Because gpiochip_add_data successfully done, use
> err_remove_gpiochip instead of err_free_bitmap to free
> such as gdev,descs..
>
> Fixes: 553b75d4bfe9 ("gpio: regmap: Allow to allocate regmap-irq device")
> CC: stable@vger.kernel.org
> Co-developed-by: WangYuli <wangyl5933@chinaunicom.cn>
> Signed-off-by: WangYuli <wangyl5933@chinaunicom.cn>
> Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
> ---

Please use get_maintainers.pl - you have not put neither Linus nor I
in the Cc list.

Bart

