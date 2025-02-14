Return-Path: <linux-gpio+bounces-16002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 87627A35BB7
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 11:45:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 06B221887CCB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2025 10:43:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA1D7259487;
	Fri, 14 Feb 2025 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yg68Gh7v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DB8245026
	for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739529824; cv=none; b=iJk632dNcQJvbrOr9fArT9yi0DrCbQXePqxrVXTggmLGIjl08FVJAs1okS+EIPevknn3zpJrZfOmT1MpvwOy5bUiDj5LghDyllj8c01OIX3pwsdf/XM7idawkt+bQLcczwbd/QIeuCEqMqVHxA+rjZJ+/Aj2tRP34SPjyJYOaiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739529824; c=relaxed/simple;
	bh=258ESUmkji2A70iQi0WVuGZY6DzAzC9+BBeqUcHI3MU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Pq48a8UT6+ohR08fA/EYrWdPv8IVkYBgBhu5JhBG5qJ8RqVPVoy2fUQjoHH2VUkEVWg0lrxouesJuefJH5LCzq/CUmCc9751aYgRMcg7Ar7yqdlB44nS8/rWETnt3sq5sDtzxiGe6176BYuICd3lGh2BQzzySIaawVuCbAHtSQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yg68Gh7v; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-308e9ff235bso16437841fa.2
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2025 02:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739529821; x=1740134621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=258ESUmkji2A70iQi0WVuGZY6DzAzC9+BBeqUcHI3MU=;
        b=Yg68Gh7vH67KKH73fZDYm7O4pMoRUqhXWo7yWx8VJqAkXgLAu+wNXOxqTeV6cuoPGu
         DiYjj1e5FqP5sPZU6GibHiY7r01GRsNprprcw+JA9SONoCGIE57WXrm6xzI7LL6Q02D6
         x9/jVvGFgsSU21K7EZgV3BaaKzObeVc1e7XwP6CAYv6Uj3htJmYGDQYi2RcovrD2a/yu
         yZ/xy3IdPmaUVIrGlvtM3iHYtAnV36hda1spXVpQcHd9FfXdd1bBWOJPLKxLoeLA9HrF
         s3Lc9UGHljiigxciCF8oj5lAH15q9+jLp8IITd9rrF2/kuP8htqBrNi+XAAm4kNHlKvU
         gTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739529821; x=1740134621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=258ESUmkji2A70iQi0WVuGZY6DzAzC9+BBeqUcHI3MU=;
        b=ril/ev4WNCo5jEjNhksyUSEK6tnAmXKE9lRlwfPobDDdgUAGdRmBNpNhafKsYGpkOb
         tqYPDGfFJ2564on7NQvDTKUZvT2bnDs24qqrpaqW9h48ubbP+jNsrOl98F4/upEqIpXN
         guy5DLQky9VHst3spzuL5eMnxiTNymJFP+T9Y7q07AJu3TMpsIhbUJVt3tUIucu+KpF2
         3+tCbErib3FHxrMeyZqOGjL2eosLkIeVM0x7bBCHO+v5Iw7kDe4sQ/ATRKuWKEqyL8oa
         TnB7tJOkCf1gNymT1Q59dePEjT1/7J9Vf80uU4i/G5j2hMpg1DBoqNkdPFS5APUIY4JK
         hNQQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/whXN3YXd77S/5FDl7RF64Ne6ENwlhElFxanYpdhV7cdFX+UqbOgXTFglGzOWSmTDQNv20ZbTsSW6@vger.kernel.org
X-Gm-Message-State: AOJu0YzZhbFriHP3F2E1eqU4RVJ0xMxfvnqIbEvMgYdxegRAvd+I7jVM
	KgW5z+253zfmflLk1GARXGS1Mctj/LU5VQZrsgccXREP9LCMTazRRoU2mwzJnKiq6PDXnhTPkD/
	jZ7pseJEWgstVXxBYI4Iao56FqW9+BXG4AuSo3w==
X-Gm-Gg: ASbGnctn8oYroV2El/0y8ukOzgQF6oX5BH793FXeOK/Q3GgU/FLutFBSSB3hSonGeJ6
	cv1StzncXZrsHjux9Wkb4UisXDjb2YSUCce+bcw5kj/zV8J2TiO7SfujscKFZY1+Itb6qFleP
X-Google-Smtp-Source: AGHT+IHIrJlrERpgwzo5wAuMDjjakD4AlBHd/8GGQfZyq2/tG9XCbPSB3xq9CnfI5XcNnXqNyGNdI7PPACfZeC6FfKw=
X-Received: by 2002:a2e:be06:0:b0:308:fedf:8c12 with SMTP id
 38308e7fff4ca-30903630e55mr39608221fa.5.1739529820875; Fri, 14 Feb 2025
 02:43:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20250213182527.3092371-1-andriy.shevchenko@linux.intel.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 14 Feb 2025 11:43:30 +0100
X-Gm-Features: AWEUYZn045uEEhfW31xBwMEeZrHA-IrXYXkIgwYU0XEIBbh_Wqus8rfEf1lz-KQ
Message-ID: <CACRpkdZj2TtWh2CFb4f4DewO90C70e_3YdKr_DZYuQ6J4+z0Lg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] gpiolib: Make code more robust by using for_each_if()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Alexandru Ardelean <aardelean@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 13, 2025 at 7:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> Instead of opencoding with long lines, use for_each_if() macro
> which makes intention clearer and less error prone.

Excellent patch series.
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

