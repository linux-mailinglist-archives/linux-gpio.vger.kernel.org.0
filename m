Return-Path: <linux-gpio+bounces-17880-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EC0A6CC44
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 21:31:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 85C347ABF34
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Mar 2025 20:30:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 839B6235348;
	Sat, 22 Mar 2025 20:31:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jBlgCdl/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9451C158D8B
	for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 20:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742675506; cv=none; b=eicO00s3gDb0/0havd+QUI18qTxygJ6Sk4HUOypp9cKfxEzs+y2K4AGF0AcfpZl/095XhpU400UREtVAJeLx54V7TfUUmBqjh0UFMDRB0s6xwWteZo/e7Hn9NwCB8vqIXhrPfUFJrRAx3YiDjyG8us1MWtOdZLMvTvpxJNZwQWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742675506; c=relaxed/simple;
	bh=s+Flcfk568jiSxGbIUnZkHfexTTZTX0yPITgwZ+ocYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jCegEThtZ7Te+qc8PQY4OKT5Z0HjssdYIxoeXBRz5SpdzeaAQZLBvDQp3+Pja0tDx0MtTKrFBx7st7huUQo3qOWqx2FqMg/zblaGu75KXwZBuTlJcRvGQdsvZLjlJ4nY4hfX4PX5KkjR3xo8ARrk+U84E0h8KIMQJvL/NcQu9cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jBlgCdl/; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5439a6179a7so3338980e87.1
        for <linux-gpio@vger.kernel.org>; Sat, 22 Mar 2025 13:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742675502; x=1743280302; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s+Flcfk568jiSxGbIUnZkHfexTTZTX0yPITgwZ+ocYk=;
        b=jBlgCdl/rQ0ltNqav4TZw/QrduaQfbCkpMBZ/YsghW9I3SIZ7+pfXjwenakvhPqeez
         d/TuhX3D++8e41vU7av4w3k0LZO7codMdT1gJ0IGPHhj0KYeijpUS2a37wLhvEvdbb2i
         rT2qDW5DOjJW8lrfbcuBIhzgDNQq2tNPm06QJ/MQVib5k38IuM+HqJdGY93W781bB7o5
         gs+7vfovQkrUV5GDO2hDmFYNH41SzPFBfmhhbMKaqMMAmCyFkxyWukrHjVejOCq9DUsd
         lzPIb5zC/L3NOK/RnPjgNCcrrIDakZTlbCOiuZVVRCsk3lUCmwkbq9odBK9rpbecYGFO
         oyzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742675502; x=1743280302;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+Flcfk568jiSxGbIUnZkHfexTTZTX0yPITgwZ+ocYk=;
        b=kCLIJScc9TY+erjswjCPnjOmy4EmnJqVYspexYWhE2LxAb+a1tE8Zs+ZmoaXDkb8tP
         FQQhK86qaODlR95zdpa2OZFIoRbV1Z1vhxUtzQP7SJBBRnGOZB2DJzHx9Jy+O3q1ltK/
         O73HhZqT8tw4M/tlDgYSeZYgFnoQgTei+tu8F0ntOwHB/+GQZ4GzWRzZ6m7qdjfypxTU
         KZPtmaT1fdOBepynZCcHvoS73tQE6o3Jou/kmgs9l71wg25hc3ZLBsv0D/QwWgtcOUG0
         JhvJt0L+9RgaBv1kYx5H5iORpZNtNGipRYoPRmb1kWysl6LOzQQYTN4FTj2NSx7B5Xsy
         QrIw==
X-Gm-Message-State: AOJu0YxcueA4pXakhj+9zdOC8PaTomkkSzpvm5c0qvz4Coxf8cVOkz9N
	CQl8GMfcD6sc0T7oZeC9p/c6gjqBxKU4Hw28ocQffs8IEvUn6JSxpmfeZhiQTAV95jGp7v2FeNv
	qPQXs0mvtk3Q2BRye1S9gbmUPxfe3V6zyW95FpMTh61a8R3bRl6k=
X-Gm-Gg: ASbGncuUK6l619hc9GVL9zKyT6WB/W0gkgy2XInbT+Tk3yibaj2fraawI2fOQ+VkO9b
	ViAA5C4quGolyV/81IQg1npRbFgzcII1vUzPNRk5kjrGVPhcg29tccjdlf/noRpkarbeBD895S3
	FwUP50O1uJb4B0l0w6uRvZMt4=
X-Google-Smtp-Source: AGHT+IHGWWJI5JCObJmlqejbC9ZGCn3s0Cwal7t60QLMdK5BgEDYUQPyqeMBUByTA+eeumGh9JU/MsKGIIRqNM+acII=
X-Received: by 2002:a05:6512:3d8b:b0:545:a70:74c5 with SMTP id
 2adb3069b0e04-54ad604dba2mr2358554e87.13.1742675501604; Sat, 22 Mar 2025
 13:31:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250321-gpio-todo-updates-v1-0-7b38f07110ee@linaro.org> <20250321-gpio-todo-updates-v1-6-7b38f07110ee@linaro.org>
In-Reply-To: <20250321-gpio-todo-updates-v1-6-7b38f07110ee@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 22 Mar 2025 21:31:30 +0100
X-Gm-Features: AQ5f1JpOqyiDfDTaZrmmnQbBILSf0E7bIKkFcJDNq4nhuhWHpxZa9XyIxTF1OSQ
Message-ID: <CACRpkdYQhxpQPmohdfXy1Caz=Wjg048SpJv_OBLUuOuU0icaVQ@mail.gmail.com>
Subject: Re: [PATCH 6/6] gpio: TODO: add an item to track reworking the sysfs interface
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 21, 2025 at 4:49=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> It seems there really exists the need for a simple sysfs interface that
> can be easily used from minimal initramfs images that don't contain much
> more than busybox. However the current interface poses a challenge to
> the removal of global GPIO numberspace. Add an item that tracks
> extending the existing ABI with a per-chip export/unexport attribute
> pair.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

100% agreed.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

