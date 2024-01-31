Return-Path: <linux-gpio+bounces-2842-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CD58448C1
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 21:23:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6669C1F22CBD
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Jan 2024 20:23:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36F433FE2C;
	Wed, 31 Jan 2024 20:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="utAqutq1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AC23FE23
	for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 20:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706732611; cv=none; b=i8ME6xpzlq8pkrcVDLo/nquVT+yBuRG/VZ1huCIBW5Podoz3J7fiZPzTSWOnRXrVrOKzIU+53+khEQxXQnLJtTTa/KsNY3Y7qhj5N3MxDn1hBKtxeH5iSKEZajnWFB7ytjV00fKxzUpPBjPWzEIjyb0X55DF6mqI2D0HcweyGg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706732611; c=relaxed/simple;
	bh=SEc9m+e3CNgOiYfioXrsW3eDnkw9q57N3o4XcChDGG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lAaHTC9oTZduGog0O1xPmm2/IPMF4TFYO/MEhuEhj277E23XxMbJ8TN8eDRvMl6IVSathJIYyWFo+4DZlVj2Uk8gv6WFaTx2PZ0dlDROXz3aaMpjKf2ora5rGmOxHCgTvqDAmCTeUXZVyaey5cXGSMWo/RVxmxgeCxatsf7tUP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=utAqutq1; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-603fd31f5c2so11949797b3.0
        for <linux-gpio@vger.kernel.org>; Wed, 31 Jan 2024 12:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706732608; x=1707337408; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SEc9m+e3CNgOiYfioXrsW3eDnkw9q57N3o4XcChDGG4=;
        b=utAqutq16Jx/5Dseg1BALD+KUC4JyfW3xDL2gOahiEIJdxUArBEwjsdJBO2L+d7/yJ
         7J0S0NC/LlgnQgkkiHTPv3Q/WZxdtKKAqLXj2lWUi4vpjCcMGzvoviecHLXpix7K1N0d
         1rUhcgN7crkq8qtBneZG55b1qpsrVSqHdfsbBnKrKJvFsuLR6EEQgL7nBQU6yDR+mY/n
         UBd05ygOrkYXumiDXka7CopUzjlmVnMnE+LSHbh9V1yDmGD4sjZMXf29ISpIbqGRdhtB
         GlFQbCQ+W9iV5O9qjQDbQ+rm0YoUBM03IPQp8uvQnigRsdvbbLhgwVGvQE91b8/zdxrf
         BpTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706732608; x=1707337408;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SEc9m+e3CNgOiYfioXrsW3eDnkw9q57N3o4XcChDGG4=;
        b=R+3aB1FppFj8ofF+iKzEYKKMkQg815PNG7bnSC+RM0Dqt7whYAJUb+d5mzas+N7z6p
         ER9QVKlR5rLq7lRJ7efxBo4TvhZ8tYuagpb4THYEpVqsYZWAUE3aOzLdYKBBSNsE2uYu
         E2c/ySqQXukvuf+DwIJdwR+iPXp1CAiXcak6O1EichsvwXzBkE8+3pB1Kw3DlOKZg8iG
         LfmgPwO+lRfInyB+Ep0fqI9OiSAFMJh6Jhl2KlgtNge/NlHSgti+Mxn4VNFa4mpDXS76
         RouLPK/u9oGQVEcZKLA9SQKt2p1t8UFLlr70YO1tAPnJ/jcYjJJEnrQu4kA25CMUAIqR
         dvZA==
X-Gm-Message-State: AOJu0YxhDSJpLjEDww0TodDFI7qos/iDh25FOVPzqFVT4zsLpqWkGMki
	E/lf/Lh1gb7fJvuYi5jWXtyVqeZfwg+TB4yQO9kkS/oug0VWNHs4ZNgYFCzfCyD0/5tnUzmsKgB
	dI6gOevYv/itRg/wBrEhBaUAr3zQcTR9TSp8OHw==
X-Google-Smtp-Source: AGHT+IGpcvN5GMQZlhwTk//mv9UmQh0VRdjb90ri3lGR+8BZIzuGOGjXfggbx2Wm6eOgueit2MKW/muw6bwnOhAZNOs=
X-Received: by 2002:a81:a010:0:b0:602:9fc4:bc82 with SMTP id
 x16-20020a81a010000000b006029fc4bc82mr1561453ywg.23.1706732608362; Wed, 31
 Jan 2024 12:23:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130124828.14678-1-brgl@bgdev.pl> <20240130124828.14678-21-brgl@bgdev.pl>
In-Reply-To: <20240130124828.14678-21-brgl@bgdev.pl>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 31 Jan 2024 21:23:17 +0100
Message-ID: <CACRpkdaBPWOd-MwQvkWCJaua6sbPTBxeK7TV+79SvvGkzCW_4Q@mail.gmail.com>
Subject: Re: [PATCH 20/22] gpio: protect the pointer to gpio_chip in
 gpio_device with SRCU
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 1:48=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Ensure we cannot crash if the GPIO device gets unregistered (and the
> chip pointer set to NULL) during any of the API calls.
>
> To that end: wait for all users of gdev->chip to exit their read-only
> SRCU critical sections in gpiochip_remove().
>
> For brevity: add a guard class which can be instantiated at the top of
> every function requiring read-only access to the chip pointer and use it
> in all API calls taking a GPIO descriptor as argument. In places where
> we only deal with the GPIO device - use regular guard() helpers and
> rcu_dereference() for chip access. Do the same in API calls taking a
> const pointer to gpio_desc.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The way I read it after this the gpio character device is well protected
against the struct gpio_chip going away, good work!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

I would perhaps slot in some documentation around
struct gpio_chip_guard explaining how this works and why it is needed.

Yours,
Linus Walleij

