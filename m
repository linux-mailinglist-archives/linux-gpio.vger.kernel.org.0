Return-Path: <linux-gpio+bounces-11110-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A288C997128
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 18:23:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8EB902872E6
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 16:23:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADEE41EBA16;
	Wed,  9 Oct 2024 16:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NtpmUYXE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com [209.85.219.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAE91EBA14
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 16:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728490194; cv=none; b=rKFC4QrlMP5X4Cab67ijcqIU+pWlhAtyWgxkN7A8V438c0Oj4pSFkXiQsA3P5B9kL5GwReinY0oLqs38aW4Fk27pYTxrv6RFZ4OUHhTYzbh7930vA21VbCWJDvi57FFm6cO883pN6Acj7UzSHQg0QmQUcmuDz0YyCrtiolxI0y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728490194; c=relaxed/simple;
	bh=cPkXjlkrYtPkS1uNPAVXcBkXBjjIchWTyZV6fxFES0A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jSgLsGSjQOhsCQ43QsGsp0OdX06Dv4PMQXcruewIQ66HjsKFpj85Phvasfh+jO+p6SqD/5DjrV+khBitsDts5XOiqqIjS+JELtIh1uHZ0wLYkQ2ev1wl8y6CniikHBS+J0QoW7by+B/bkWryqHqhTSMtVi8dY8n75q8HP++1VYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NtpmUYXE; arc=none smtp.client-ip=209.85.219.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-e263920b6bbso5801184276.0
        for <linux-gpio@vger.kernel.org>; Wed, 09 Oct 2024 09:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728490192; x=1729094992; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cPkXjlkrYtPkS1uNPAVXcBkXBjjIchWTyZV6fxFES0A=;
        b=NtpmUYXEbplBza7sLTVeIkYSOaQA2Y1Rmu+yyXU9prZ6ObZphlzQQFj431alKJUMCW
         OXuixK2dDsy1NzzuKbZO8LnB5rSNeApmofGHW1QaXeyfjCznXHgHyPWKha2bCF8ly+yI
         C0pjL6awcNynPMxd6qurRQ7oXfKreq4jcNe7CBNoGF+WP3GrEXh0ktkx1NKV1RZGbtrL
         gBqvUiG+BG5h6Ppb+Jk0Xx1vlGMeKOFyrEcclkly7yZC1YKkVJmtp2BUv9pyAAv7tI7/
         Ul01m6aN0tmZz9lJwoGjmdOxc0TgWvq5UUIYofZ/1SxI9n715FQSHjG8/q1yutVDHJBJ
         haCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728490192; x=1729094992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cPkXjlkrYtPkS1uNPAVXcBkXBjjIchWTyZV6fxFES0A=;
        b=bFISa5OIblW77jGkeip32TDW/CkW7HM1u4NVAMFXmAzwSj0JqEWRjW3Ezzx/2Y876c
         QLEyOkpWrBOl8PWQkWTvtvVBrSlMr4eNvOAbAZ1CGmEdhl3D2EgPcQtuslA9YoPwIbLZ
         Fp223bPA+bW40sTXndSFSyzOwRkOsXFXiZA0PPU7RQuV10Xsm97XBOjVN852jHVmIAE+
         Z+1M/Bk2JLGOCuFH+dqVg3esxupj/tEzbQl4aKFNNlcvYQWbQeFa7LB2sVA7wXMxQyZm
         1LEI6IH72BQi9Bb0pAM+LnX61pfKUrKD1J4YXoNeFe/742nuLeG2/Zu1jOYdkbvIGhBm
         Rg8g==
X-Forwarded-Encrypted: i=1; AJvYcCVGU7DYM25AbWp7COMVykquTvoRVZ9cJxn4xf3A7X6NAY3h/etn8gh3WAOImWSpFrqwM3daf3G4Fvt+@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5EKw/xRGpuBDCJdyrKw0RI/Urw3RZUpkm0/TA9CQcbZYxb8lR
	W00EA+Ux6hjMeoiP/qAC/WPi0YigIObPOBzaSg/RJrAvdPpcPmsZj+RWeAWKvguPaA1fCP42ZLE
	rQUPjF5GU/zaaa9m+uHVpiVp75NRGRlYJ//pMPrEFYu4NAPa1m6M=
X-Google-Smtp-Source: AGHT+IH31E71ejbn5Mvc5+Z+r6ftlx6TZdccjXCzROVUKamcnOKDr5jbF7avg3JbLBsQt7C8Km1tpdHhk+6+e+7bMkk=
X-Received: by 2002:a05:6902:843:b0:e16:1ebf:293d with SMTP id
 3f1490d57ef6-e28fe3e9bd5mr2208747276.20.1728490191807; Wed, 09 Oct 2024
 09:09:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241004-gpio-notify-in-kernel-events-v1-0-8ac29e1df4fe@linaro.org>
 <20241004-gpio-notify-in-kernel-events-v1-2-8ac29e1df4fe@linaro.org>
In-Reply-To: <20241004-gpio-notify-in-kernel-events-v1-2-8ac29e1df4fe@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 9 Oct 2024 18:09:39 +0200
Message-ID: <CACRpkdZYOwsfMRp_96n83yNoCUYD0auZKne1PJdcOxE-=wn=UQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] gpiolib: unify two loops initializing GPIO descriptors
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 4, 2024 at 4:43=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We currently iterate over the descriptors owned by the GPIO device we're
> adding twice with the first loop just setting the gdev pointer. It's not
> used anywhere between this and the second loop so just drop the first
> one and move the assignment to the second.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

