Return-Path: <linux-gpio+bounces-15993-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77509A35AB4
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:47:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 464CE3AE83A
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 09:47:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A0BB23A992;
	Fri, 14 Feb 2025 09:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k6vFLql8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B412063D8
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 09:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739526454; cv=none; b=o7yXqVis4jjBBnsXcojH7fBZTK+h7W9KHX0/CrCpBdEz2ggeVfR8KD8IAuC+u3zm4B4+HJiflhOP0BAuXsvD3PYotWUeVOSEu/e154crhjo/Mi8gx9xadz4q5cihrA/fUx9JiXZONCQcZk+wgBIgSmnTRCh2nPci9l+Mrwo++FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739526454; c=relaxed/simple;
	bh=iWY7ja7UwmuXlbTC+SdiHmLKKlAd/FexZHJ1iIoOUyY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IxHUEwn1kEmQ6eDLgKVqKe10MJy6MoqXkUVmeLXQFO5BRwjJBN2UikHB+3W0NiPiTorZIwj8Thzi0YHcTnTwolDKCKr0iv0DQCmgtuBLEwMF3VWPuJQvvwK3Nuk4xYaFxUr9i3IKVHcGrjZ94vDE9BioChhHpfDeHWhp4S+FAYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k6vFLql8; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-54505191cdcso1824197e87.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 01:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739526450; x=1740131250; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWY7ja7UwmuXlbTC+SdiHmLKKlAd/FexZHJ1iIoOUyY=;
        b=k6vFLql8ROlnSEZrhC4NdBBznFQ3C38XKhdA5TiKcHPmdr+C59VWyOpn5AAUNU9ttF
         Blq+lWdlxHrCVytSxxyj1MK7QZKuk0Hi0kaf2dC+gssDqV1hNDsosOKE9huGUShzL7hr
         N1ldBjEBKIrfYaagjRCIpdK3lKbVb4C/r9QRzprVatL0Zda9xiI+q8r2JnIAmFHZrlNN
         tLNKdFfIELMZUGElZ9y/KPY5QhUBMI/5Pj+wHkYxS9c+TcJF5cOhIE7x/kupyoFHdZ6Z
         uMnMu2czBjlADOKEjHNkt0lORhwJSMZkuFKN07wEy1FWCVrF3xznK1vlqL8pYy8Ly77F
         M0lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739526450; x=1740131250;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWY7ja7UwmuXlbTC+SdiHmLKKlAd/FexZHJ1iIoOUyY=;
        b=MN0HP8o0CXMBAuK5b+mtC09pIC/1hTpaD3jrod9VFCfBFJH6D7LV4BPxf/7zf0JrwT
         aP/RjdVeqH4kA45XEzsr+34ctxPUEPz+Zc9bGtlDYHob7SsuKEjR2rwOq6rUrE63yZHF
         vEL/7mDTZQ9Xi3qpTrLkw3bMX6qQJMfPYhy4bFEvJbjFjQTxGRY8d/DN70eEafb+i3gw
         9GdGITZP/72bvpEwoZx2PTRnoQis2Fl7dC4Q1N+6YiLewBBtZ0/RSxItOS44skNM3LmH
         /X9Jn7eM9JodBfRBsq7sPvxIpUkMTkqkMrV7PqpbEZrnTuqyt5ldEJvbcmTfCcmcc5Xo
         vnpQ==
X-Gm-Message-State: AOJu0YzfvsHAqEIJ5MmPH4skUJ4/KsRKTBtekbun4jWkcKpVifezeNf3
	TifUWlf+ObEz/F9tCrX0DulHQWDsthmrzsEmEsuCbUXXF/vHVwCS4kMhjT6Pp5cELbnPdoWmsvt
	ZI6/CipV2AchHfwbiO167UdkZfzrnfjooD7DY1w==
X-Gm-Gg: ASbGncvpC3uG/T0cNFuj5yro/E+yPnzwaPdOvRMigwARWDH7zWhLFUGi0dvrH7gcITd
	Wlc46wk3tOEy2uGs8ekw5j29/eRJiPtM2LRF2fZMSYVqL4YMZABoZ/CKI6mAFq7pxZ8qEM1P6
X-Google-Smtp-Source: AGHT+IGsVHCl29HYDG1NhwBtr+SJRsm0EHnF9ZUrWXRkU5DCNBBxAGHBC27Cu+0jzm6I8M4nBvjNYCMzV77t5Den0uU=
X-Received: by 2002:a05:6512:2244:b0:545:11fa:caf0 with SMTP id
 2adb3069b0e04-5451dd84c15mr2266055e87.6.1739526449521; Fri, 14 Feb 2025
 01:47:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250211120847.42437-1-brgl@bgdev.pl> <20250211120847.42437-2-brgl@bgdev.pl>
In-Reply-To: <20250211120847.42437-2-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 10:47:18 +0100
X-Gm-Features: AWEUYZnb7U0WXJs0yLUVl5mVvgJsY3A2dqLGhhpos7WoxgsSICOd3mvm6j3gj2E
Message-ID: <CACRpkdadUTEGW4oAMRrkbn4o6GOqcQxSLUXrHK8seni=WMj7ZQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: latch: store the address of pdev->dev in a
 helper variable
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 1:08=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Make the code a bit more readable by using a helper variable to store
> the address of pdev->dev in probe().
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

