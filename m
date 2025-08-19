Return-Path: <linux-gpio+bounces-24556-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EA05CB2C420
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 14:50:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 798635A5989
	for <lists+linux-gpio@lfdr.de>; Tue, 19 Aug 2025 12:48:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53253375DD;
	Tue, 19 Aug 2025 12:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EP98dYxp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928703043C7
	for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 12:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755607721; cv=none; b=Q1Bc7zlyEaACGYK9H824NBmQ0wz4nfPqCCbKmJ2FK9jEJl7nxIN4/yjWIf7eb2REAsgXlr3MSQwOKSBuiBLWtZZ7XYibkVO0Mzu6CDnYqahHTZvb42DNuGc4xCsAgl0eSBI241IxPZZBDH8naMvASxRhwnZko97wA+TOTr4hwZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755607721; c=relaxed/simple;
	bh=+6Vhrw93VOWzQ8j3tGD9sppz9syXEpi1MpSMIFUFmk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZT864qzHoWfr/MylTxLldCohUEBql9XA+/cv1HUT8YKdqtF5k8hTgNbdIzAWRLkuC5a31YNr+4h80Y4ZCAu//A0wg9/XkvqJfLaiRLuFn+uULx0kf3/wVDhPrfM4ZIyyEFei9D1XwpRIco3KmfkkN/J1P4B2o02LNXSL2r2gCaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EP98dYxp; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-55ce528a0f5so5292008e87.3
        for <linux-gpio@vger.kernel.org>; Tue, 19 Aug 2025 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755607717; x=1756212517; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6Vhrw93VOWzQ8j3tGD9sppz9syXEpi1MpSMIFUFmk0=;
        b=EP98dYxpzmtibQs+zlFeXRRt9o9ZWSVuZOJOAODtuPZERH7IuxPw8roLklRHqr5zCj
         FioHFrhu/t3/A8ARxXBYmoR3qY+RBcd3l+C/w//iIxTcmqGgoeT8ltMllTACcyhM9USX
         wuZP0DFYz6iNz67kCXEd9d0MAqZ6BOBHTQXUqa38v4uzc6/+NApXBt9hh/forDaYfkmg
         m8Sfll6sSzC73ynooVGZaV2mGlzfMmllrjW9W1oHy4Bjcw4AAQ1ZeFEyxwyIlsXu4O/B
         ltqzGRFM4jNTzUXqy0GV0YkHFm2KYNHw+gxE5eMyt5/2wHm0AW5RZIWd4HUjXZR3z1Jw
         GfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755607717; x=1756212517;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6Vhrw93VOWzQ8j3tGD9sppz9syXEpi1MpSMIFUFmk0=;
        b=ERXht6d0v5GO0kQXP9nmjCBnyT6su1febVFgXYApZtr9i7OrNCOEJ/S4hiNyCTgDZp
         /7bvisPe/GuDTPIPLK/c1u3T7ZPyu12ey8G2jD0HotEVyuBAJExjFeACvQnTCi27ta7N
         P0fHdqEkjxeWn4IxQ4NtbxoGlfAaYiKVZSv03lKy7oOOqBoq0tnQv9+fbIIyKhLLi3Zn
         UOfx/+lpeH0/7t+m9r2atN4bONSSuoWbrYoyzrDl3/UR44P+h/DQ9orsGKE5PROKkKeU
         YvfBoNE5LSoMEMUolJfmywhB3bb7mZryOF47tHFLHfwxIhxzOlKeNbSEZjSRHTco4jmE
         rJJA==
X-Gm-Message-State: AOJu0YweBUfhxxpKxdyU+SLHUd0GyYr46nlfiNYMXqDyUnubtKYgice0
	4F+MJKBkMBwKOaHuB/8XkIlyy6yTDhjx4Xt8ZEyJtm6xJ8bUQGc64YOKBlxhgGlPnrn6JaQV34H
	7d3ObJfcmeN21n4UQc63mZr6VyjmdPcql8/dX5VjnNG1dXbXGUsAaARhNfA==
X-Gm-Gg: ASbGnctVyZijNu1R73qbI2rJ8/PVcl55oECdi6G+LNnBInhTpU2JBbO41c8wlNN3t1a
	2F8wgwNQyXQIIbZZcKNA8UjYui4nvWHxQdcrbpKAuGiL1a1TroulE9XLCZz95Z9Q1ZBb1+8Lt+0
	wq46lz4Iioy/eiW7lJ27OTSi3QxSX+SRAH4eN1BBG0jjsFquJZASkVOOyQZCMxu1xgso4FEAT3h
	zFaGoUqZeUf
X-Google-Smtp-Source: AGHT+IEO5Q5KeoskGlIms3cL1kgpuG3Tin4R0ZiCNdWP8xfdXObPNVgZbMj7ADZ7hK5rm1fZ0JhXKv53ilShdHoEsxc=
X-Received: by 2002:a05:6512:108e:b0:55c:c98b:39c7 with SMTP id
 2adb3069b0e04-55e007fa342mr682379e87.55.1755607716665; Tue, 19 Aug 2025
 05:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815111733.79283-1-brgl@bgdev.pl>
In-Reply-To: <20250815111733.79283-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 14:48:25 +0200
X-Gm-Features: Ac12FXwdf0zGZXcVDNksVHGwqoT6ebJ9_yJJqxs4KUELxDvFXNTsRgKWa3ehq1A
Message-ID: <CACRpkdbzu9fvfvCV2BqhN7goUm6KLHbP1NCjQiFj8sqqNxxVxA@mail.gmail.com>
Subject: Re: [PATCH] gpio: sim: don't use GPIO base in debugfs output
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2025 at 1:17=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> We're in the process of removing unneeded references to the global GPIO
> base number treewide. Use the HW offset instead of the base number.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

