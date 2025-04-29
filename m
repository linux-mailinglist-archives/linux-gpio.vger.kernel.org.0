Return-Path: <linux-gpio+bounces-19477-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEC7AA1C2F
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 22:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 233BF9C001A
	for <lists+linux-gpio@lfdr.de>; Tue, 29 Apr 2025 20:28:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F11626B96E;
	Tue, 29 Apr 2025 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VLdtBvIQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE7A26A1C7;
	Tue, 29 Apr 2025 20:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958496; cv=none; b=nZV7oAYCYE25Nu/Is7ysVtdbM4ry7qp2Vy/p0XNU/DLtryiA8HoDQaDgc7TLc69uFiSQt4XgWZckUbS6hbY6QbpwYr7dQetIWU8pxnoHulEJ/B9XLESot+3Js2uqt7GEmUMbjbEpY+6DJ1+gTj+JyvwNbxjNup9Yj714vyeYtEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958496; c=relaxed/simple;
	bh=MqdTwX9p+vPhVmjnWpKSsCOX9VqxDB1vJm44aWZs2K4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D+TNbbLv5/HzYk1RvSv4Ehspb41bJK9KhMX/Ue6gzcrjsZG5p3IE2vEaiy0YiCiG0zbm8FqL8E38qmwrMS0OBustMdq4Elro1clBglcwB0LSMfMNc1OjHYLO58soyeTHN9v1gNly2/d9OxEfnSMm5ez+asRx8OnforrVIstPkyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VLdtBvIQ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ac2ab99e16eso1404847166b.0;
        Tue, 29 Apr 2025 13:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745958491; x=1746563291; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MqdTwX9p+vPhVmjnWpKSsCOX9VqxDB1vJm44aWZs2K4=;
        b=VLdtBvIQKRyvBsEYRjBnc0AIht52Bt1xagD+InwgBgWAjnLhAc+xJQ9WxM/LHqAitf
         CEWdrkqVZlx8yy/c2GX8oLugA/p+02vpMQe6AL/NLKt2ysJPgxJjed4lWibIXjHRqZD/
         gIV7F35tdGtEOQm2qr9IwStvvRgYzyjRp8afJMZ+ZEyB5ChOffiuJrfvoSYPjLFkvOTn
         KbZlZZoEe+60/MbZgBmByUyweroAH6U3eMsvOOfZ2wjbxmytA7a4YwYskfRgA3rIy1xk
         kRvsI359+98X8tEQ1dQbrZQQKdgXpJBEfZ9L8DBtAs1Eb0yPY7io9JxOHJm3uIVCLeTX
         EX9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745958491; x=1746563291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MqdTwX9p+vPhVmjnWpKSsCOX9VqxDB1vJm44aWZs2K4=;
        b=hr6Nwm7xh2p1OlpB/XsSbWQV5yHbiXOoBJqzgE89lzJRmeqTZ8HmFoGFZYUwDQVwFk
         TK9J4NDRiOohZnuc5PGj7fwTYpqesb/9oMx6fxA4fX2EUm/+0DkI4BHGz3en18oNZizL
         k2vFAjhHnVrDKiVq3Bl50mR2wwtI2Tth/o9upbCwOVbU5DfinQLeamIoIqzz+V8FUw3Z
         nr5NMhjuAUHD240R+GkmOTSvvs/SSsLIYYQ5fWTqstjID45u8pu6nr29Ed3JjdX1FX42
         Z0nh4IuiozFfD449IUumMWK5EHu0ubqdedRhdlebglEywG/UPlrzhJfFsQs4E62bgZkD
         UEBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVuMqe9yzPnIT+Ih5G3ZQHQ6MBeahWs0HT+ciKHeg/htnouKbwHXfX7wo88BTOX849Bg8EbKUao4HgT@vger.kernel.org, AJvYcCX7r3t8i/FY4pRZLhtc4K9LZl32k3ky4SHyDwN26S8hjp8dvBtzi6He8RE5tQ9uvOnkaOASl7fVOa1NjLiA4uHq@vger.kernel.org, AJvYcCXep2HELWJucKj9E+OTEL785W8yEETmWq7m68ErPZUJ3o0iLPi5EMqfbYIYeoNl/ymdqPJKS6LXxZs3vlio@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhzBVBmcEjVRh/BNVsxJDRZIguDC2m4mr1VKHsTAQ5hbEQWOb
	/qHifEaGn9uhmDxeKZ+yqKZQuR2t8NLl02WJF3WFBBS59ngUi1dPPT85aZYOlU3blhpuTVKcnS6
	CPO+o7ISs/o2Il8qVSlD0fckKHbE=
X-Gm-Gg: ASbGncvPmcZeMH0KIGm9HqbrK5EtPUOmvlFzOV89z37JjZTJwAgIO8HpoUrRfxSoEd6
	m+R5nxlmZTpQG3+RWxygXK8YjRhfEQPzH5uFczGNgWAtMqg9ucUsd/jINxMX2EzdTgUUxIqTax1
	nAEia+5STenGavgOYE/JQ8cQ==
X-Google-Smtp-Source: AGHT+IFgfv85h9H0EW/Z+lJj1bnmrFeSYy5mDRtxVrMLDAuesL60OIiVQdhPoN1Wl0OZnVV/+8tarLBS4M2z8Uz5u7I=
X-Received: by 2002:a17:907:9801:b0:ace:c225:c721 with SMTP id
 a640c23a62f3a-acedc56d9cemr61727166b.8.1745958491460; Tue, 29 Apr 2025
 13:28:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429-aaeon-up-board-pinctrl-support-v4-0-b3fffc11417d@bootlin.com>
 <20250429-aaeon-up-board-pinctrl-support-v4-10-b3fffc11417d@bootlin.com>
In-Reply-To: <20250429-aaeon-up-board-pinctrl-support-v4-10-b3fffc11417d@bootlin.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 29 Apr 2025 23:27:34 +0300
X-Gm-Features: ATxdqUH4cr5nUEDj-u6p-HZj--JNXwQDz7o3xapcgIJCJWfffxqPzGdq3-IiTrw
Message-ID: <CAHp75VcTj+nJ66ym9C8jy+6u8wRZ8b7H5cDanZZoJHQvJ56dTQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/12] gpio: aggregator: add possibility to attach data
 to the forwarder
To: Thomas Richard <thomas.richard@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	thomas.petazzoni@bootlin.com, DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 29, 2025 at 5:08=E2=80=AFPM Thomas Richard
<thomas.richard@bootlin.com> wrote:
>
> Add a data pointer to store private data in the forwarder.

Reviewed-by: Andy Shevchenko <andy@kernel.org>

--=20
With Best Regards,
Andy Shevchenko

