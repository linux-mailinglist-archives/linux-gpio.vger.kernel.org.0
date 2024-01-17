Return-Path: <linux-gpio+bounces-2297-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B5B8301A4
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jan 2024 09:56:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C6B631F24BF2
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jan 2024 08:56:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E8351B96D;
	Wed, 17 Jan 2024 08:55:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QUAN1Gvb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1727413FFF
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jan 2024 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705481728; cv=none; b=YYyOhPI03wpx3dm6jzrmQqP8aQvim4lOlI6lnP7Lcf8+3LAcP2w8UhzUqFABCuJz4UaD6osfTln1mrbBFoTIvPazOCAf2XSqVAUdQkPMIJEqGp3qVzp99JYv3neALpnE8CVYvw/Jez75p2Cze+QLXaXZ8MiVJCICZOeWHUqJIlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705481728; c=relaxed/simple;
	bh=aQ+6JbM5yR6kQFalamoiBcTrOt23eDME+cRfrzz+7Wc=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=irM7T/Y8kwusmPZZl2laWyPMPkOsggVNJylTKT9CL/Jt+jbBHH722pcniU1cUZmuf6tbdmbhMjHGyqGobSDFmu3GnpU73M7F2u9SY8GKjdXr0loFFMVLatRhNMPK4ngz6ubtgFBLODonIMvDPcbVURakCe/mzZWUF4GpEQ0bGtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QUAN1Gvb; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4b756f2aebeso2615990e0c.2
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jan 2024 00:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1705481725; x=1706086525; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aQ+6JbM5yR6kQFalamoiBcTrOt23eDME+cRfrzz+7Wc=;
        b=QUAN1GvbgLoiyZ5l8jCF0s+Nbu2G3y4btXCUvkCaUZq8GJ8Bo3iQHzZRFflEpIBWHX
         Jysv/JvROzYFCFFUd5GLqdVO0filnCSeebF8ZvXpuNn5cZBUHPXmaJZHRi6u+q4uvia4
         hReb3qx716kv1X7hjxY/LjCD4rLSrSBZx117FrBRQCPNdET5k2LIck/sgylEQsHaYaB1
         CCuVXlDcgCC3qcH4Kzmr9nTKvI0F34kfMY0X2M0CLu0ATPEc4N6yyehapQKV6sqX3oQO
         nCGD6UMNP33hvyRkU9WDNyncFuLaxcqjmZgbRNy9BG99SJV85KML2x1RbPVkfUMuXnOl
         3EZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705481725; x=1706086525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aQ+6JbM5yR6kQFalamoiBcTrOt23eDME+cRfrzz+7Wc=;
        b=tYn4EuqLPcHmf1FoSdXCe6L2ciYX9mUXMtAN0vGKHxLvkVUAZDPyzH4cOjjH457bLA
         vQdY2nUqJgwhZnKq8T0F3iSLpNdcGroxoKSIWcwgeCfcxyadi+wBgs3Tj8Vot8RGMyeJ
         ktrwllO3u09Te+M11s1VvLO08kqBvWZp3mhhz9TCZiD2kxYrgS9ToubjHCKWCGjBsHdP
         NbIMH2DYhIZjKahg/gwJNViV3fu/h6dZuBCUpNdwcly8tYFZim/YGIjuEw9Jr3O2ODLo
         pC0ugivZ3DVe9S//U99QBFdNOPPc+krWU2MhfSEcpiiS8VNE269r6m3LP0FQ266vCHVA
         dFAQ==
X-Gm-Message-State: AOJu0YzITIdA0a1vNSnA697cmPOQ3P6osKNjZQFrY7UwLG4wqQjzgN1y
	UgngoVZGqvt9xe69a1k/47LMJH2tsGdYx3GQlN8kxMslj5PHUQ==
X-Google-Smtp-Source: AGHT+IES0DFHdOM86Gfrad0yRE/gG0ns3q7IesySq/UuocXs+YchPO//dRnsduZYFjqmfBLE32KcLpvyd6w/5fK9k0I=
X-Received: by 2002:ac5:cb45:0:b0:4b7:b264:b62a with SMTP id
 s5-20020ac5cb45000000b004b7b264b62amr3800364vkl.29.1705481724981; Wed, 17 Jan
 2024 00:55:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240115111743.28512-1-brgl@bgdev.pl>
In-Reply-To: <20240115111743.28512-1-brgl@bgdev.pl>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 17 Jan 2024 09:55:12 +0100
Message-ID: <CAMRc=McJEbeL-Esc5=ycNnTfQc8diQ8esgNjKDiG6rKDnT1CJA@mail.gmail.com>
Subject: Re: [PATCH] gpiolib: revert the attempt to protect the GPIO device
 list with an rwsem
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 15, 2024 at 12:17=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> This reverts commits 1979a2807547 ("gpiolib: replace the GPIO device
> mutex with a read-write semaphore") and 65a828bab158 ("gpiolib: use
> a mutex to protect the list of GPIO devices").
>
> Unfortunately the legacy GPIO API that's still used in older code has to
> translate numbers from the global GPIO numberspace to descriptors. This
> results in a GPIO device lookup in every call to legacy functions. Some
> of those functions - like gpio_set/get_value() - can be called from
> atomic context so taking a sleeping lock that is an RW semaphore results
> in an error.
>
> We'll probably have to protect this list with SRCU.
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/linux-wireless/f7b5ff1e-8f34-4d98-a7be-b8=
26cb897dc8@moroto.mountain/
> Fixes: 1979a2807547 ("gpiolib: replace the GPIO device mutex with a read-=
write semaphore")
> Fixes: 65a828bab158 ("gpiolib: use a mutex to protect the list of GPIO de=
vices")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Patch queued for fixes for this merge window.

Bart

