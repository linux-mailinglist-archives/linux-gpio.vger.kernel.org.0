Return-Path: <linux-gpio+bounces-11212-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D18F99ACF0
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 21:44:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1F469B25F5B
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 19:44:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3F351D14E2;
	Fri, 11 Oct 2024 19:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hDYKxiEq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490961D131A
	for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 19:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728675783; cv=none; b=ICHygDfsHwne/ropUlBo6WaKW+PK784Xhf5FJZmdb9NHUrAGvYbkQCwf/pqaViyuyeUcTCEbW6gxiiqn6eKZnhiSlzhNbea6g3b+cmlX8vf6UHOEyPRmMkdws/6KSf74V8ZzNl6P2R7wFwegHYuhDIdmzpmnskYUXWHXAf6JNxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728675783; c=relaxed/simple;
	bh=Z4mGyKRuHwJSE7Pu35pcjWjsO3tQ4Kmt6VPPAU76NaM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XsoQnHZlLPslYnsSTCaVlKAxn38JF/Z7MVcC1La2KV1w56A7JMcvaOaIYL8OtdOYZbtGRhmHS50hQXoZdrQLLmo8kVjVfORhZUZUyvyXROya+kZkClMYsl0Fr/UGj3jcGdnUqs9M27BhKDIESbVyPzylVPu5f2oJKEhvEW45M6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hDYKxiEq; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fad8337aa4so26486321fa.0
        for <linux-gpio@vger.kernel.org>; Fri, 11 Oct 2024 12:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728675780; x=1729280580; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z4mGyKRuHwJSE7Pu35pcjWjsO3tQ4Kmt6VPPAU76NaM=;
        b=hDYKxiEqN9yOQcKHC5VT7uinwoM5wHKV95q+R92SSVKEZ/eEVlmX01JnD/LS/XS0FT
         l1qTLaX4d8w0teSkJKCwX3uW+8LvRWJCCEKHXWgMizQqb0WQSVQOkZsPqwPcUHOQods1
         A853NEVTpd3YWe/XGLvxIoHoNH+UM8EMSjRdbw2+t12vvcmK8tSdq29/spq8sRHA9cX/
         ze7Z8EeIVslPFTCOVzlGR6kJRrnTtrxQVPcj+0FOntO6oQTl55cKbqJNqJbchMhFOq1a
         ZEWLv5Df3hYctegTNeo27GwkwptuSp9k11RhwvDgeSFpwgVxHIliDLDJQU2BqLVJif0O
         9UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728675780; x=1729280580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z4mGyKRuHwJSE7Pu35pcjWjsO3tQ4Kmt6VPPAU76NaM=;
        b=rybF0Yoqmul9wpWEsIimqIaxJ37Vdd1869Wq65lvGfRbX8kmJ3u/crShbJTH0TRpEK
         iGz+l8batWsixcFvih7nQpz1L99rM3mielQXJR0Hj6oADHFYgpgZ9ZhzfqavwcW8pRe/
         pWB6TdQDX27rY8X5DVjnGj3SVZQXHmuf/CTk0JR6tLd2XvEnudmrOfB1c2uomaTTs9eB
         7ISonBPGMlByTFf8ZHsit455VAqw2W6VmnfmO/i4i3sEGHf8R2i7pXRkcLwzCw4G3/vc
         SFvurLI+E8orkflBNaGKP1YOAZyFmANJDpLy6LsWHVoo21x1FlzYIOoKszcofBbi2stg
         ZkQA==
X-Forwarded-Encrypted: i=1; AJvYcCXFKLVtAJSu1tt8CKUReKVNUAco/0Y5mb/e4eG20dPvznRyPDMKkcrXJlo5VfZQfUrwUmiZKZnw7/e9@vger.kernel.org
X-Gm-Message-State: AOJu0YwdjUavN7bggu/tBvFJB8NnaxnNP2BmoPm/g5DU4fSF/qhUzCxh
	b8uhazrNdwYGvcox7Knde+y34q0AkFEzHZ2RNHTT5q8imfv3k4Pa6+q/k5ffQQ+AEiTTU7FeZC8
	iW3XZ1M/C2dejhLJzlDXy4zDzuxvXAnzOHyuiLazP+jXsYVHR80A=
X-Google-Smtp-Source: AGHT+IHRGAZsA+c1JXEg3W3KPXi0hIwPisQdkgCI+x9zqe4NPFOofTaKNVlDEm43Unh6AnUT1JuS+cEBd8UuORylf0g=
X-Received: by 2002:a2e:a9a7:0:b0:2fa:ccae:d1c5 with SMTP id
 38308e7fff4ca-2fb32718b5bmr18751141fa.10.1728675780464; Fri, 11 Oct 2024
 12:43:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241007102859.35602-1-brgl@bgdev.pl>
In-Reply-To: <20241007102859.35602-1-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Oct 2024 21:42:49 +0200
Message-ID: <CACRpkdY1RdECagx-TrE3t7dsgqKcUiVY8B5OKTzmMupnYrHVAA@mail.gmail.com>
Subject: Re: [PATCH] gpio: eic-sprd: use generic device_get_match_data()
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 7, 2024 at 12:29=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> There's no need to use the OF-specific variant to get the match data.
> Switch to using device_get_match_data() instead.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

