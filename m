Return-Path: <linux-gpio+bounces-9146-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 930E095EBE1
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 10:28:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C54041C22D66
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 08:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B791465A4;
	Mon, 26 Aug 2024 08:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YizJB7Cn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F1413B792
	for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 08:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724660600; cv=none; b=JQgeuQAqjhDO7+qr4EPHzinWjkkBb8JwbjTr6FuGcMuvkGiIFaDjlVP0WWgn7OaPc96slsBPyIGHms4+NVQ12y9drF2qbHiwiMXY2R7d9lponTxKv0lCP3IuMs5l319HENgl3UWAfCCLcR0HP8lXEPz0ESbqebFQQOtxIkFhxog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724660600; c=relaxed/simple;
	bh=9nAlXzL3FCsDNJIv02ej/syTb5joWtGfbOwSnDgKRLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UHvhGrAfaoCk0WSpurMK98S1rc1TL2U1CdeTXJiTREbIT5kOS1T1XdCUf3byOMohlnL/2WRmf1OoLNwLb5YkF3xmnTGVivD84FhTV45wUDloGlVZ9cYo92riGIaIQT+aY/0TBAOWFOjzZSw+3did1BZGCT8pwQHnCMdQmwGHnCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YizJB7Cn; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53346132365so4745602e87.1
        for <linux-gpio@vger.kernel.org>; Mon, 26 Aug 2024 01:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724660597; x=1725265397; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nAlXzL3FCsDNJIv02ej/syTb5joWtGfbOwSnDgKRLc=;
        b=YizJB7CntvHZ9Uh9ReQZ855p2Roeh/fpWf/a28naZOUSo763bDBT7XsGxhbgkNXlCl
         auinHfM2kD+W26xAjPCfOMxIgVFmMHAJCPhWCRJnYPQfeNJV4A2y/1vHbcfoCecraNE3
         wHAHe8QgSrPczox04VuFFoKryjThpIHDAHHFbq8/+eZ7lvymCmQrWGOo9cg82sXXKPN+
         QhghcCE/xDYSWLqtEM4w2nEMxtN4v9VAoNJZC+U2VDY90N8e/xhTWFxvbZbXwVZkH8K8
         /MI/oDfhOmaT8SflwLEhfsXfAnGnkNUOk0BlfU7wNtgOtV1LSvBFD0pM773uN/tOOBWi
         t6TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724660597; x=1725265397;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nAlXzL3FCsDNJIv02ej/syTb5joWtGfbOwSnDgKRLc=;
        b=Xxqf9Y+E20hsGJdFP+ivAns1DCCul4/JfPM0agzoEnQsygoTm37v3OOIxTA/b7MtbJ
         kHyqJJI84JOyZKYQHqJkEIDeDRmQMcpgA/lbabJopiEKU2zYh68KPIF7+JYuV4DP46XI
         qnBOPq0esGBFiD1yW1XIpGOwI4u9wuYgmIq8G7W8wk0tiF8Qt2cvRMNEm2rf1wdrZpsd
         KyKz4KDAYmT95RY5Iy+xUsnG2sp9rVtWuFLVfIiIfEKHcWGrROMQl8AGPByQZ8v87Fn5
         n7TGNxkHdYSvHOGNHXg0EnvLDXjPVyVsroDAQ30rW3AIyZfx90YgmTjgPh4OJExcZznJ
         GTLw==
X-Forwarded-Encrypted: i=1; AJvYcCXB/wIwVyle1mkCXiYOHYj3bBmTzm9duhD5Jzw92q+MBXHGItpyq50NJ7HX5yGh3VzJkJsSvw4EJYdi@vger.kernel.org
X-Gm-Message-State: AOJu0YxzUMKO/Q0aajQasD65WDm7fA3sTrNxY0LSRC4OTf3oS/rqQoj1
	P1iskFdr24hegxlx/5plYdghhYrRxXaVFH6lk9JZ25nlIDNB9UiG3QKMjboUO73rhCa/n3edUL4
	liVO9hwZojHQBhcH84F4FrBs/1l4kkOUQNfZwug==
X-Google-Smtp-Source: AGHT+IFD0cIvY5sWI0VrRFAVUnk0R6NAc1wx03gNBoGtjwDEW2puIzCfiSlZLDp8w6H4FGoOxcSVb8VWj1PQLkd0LUc=
X-Received: by 2002:a05:6512:ac1:b0:530:c2f0:4a98 with SMTP id
 2adb3069b0e04-534387c1ad0mr5852453e87.51.1724660596476; Mon, 26 Aug 2024
 01:23:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240821121456.19553-1-brgl@bgdev.pl>
In-Reply-To: <20240821121456.19553-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 26 Aug 2024 10:23:05 +0200
Message-ID: <CACRpkdadD=GPKKrS-=51BdKc5gZcUBJKxJpkZWYpfeN+ipCANA@mail.gmail.com>
Subject: Re: [PATCH 1/4] gpio: ath79: order headers alphabetically
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Alban Bedel <albeu@free.fr>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 2:15=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Put all headers in alphabetical order.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The series:
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

