Return-Path: <linux-gpio+bounces-600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 579E17FC02E
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 18:21:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 890CF1C20BAD
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Nov 2023 17:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FFB5C064;
	Tue, 28 Nov 2023 17:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NkljAlqx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16D9C19A3
	for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 09:21:20 -0800 (PST)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-58d4e32ea2fso2141159eaf.3
        for <linux-gpio@vger.kernel.org>; Tue, 28 Nov 2023 09:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701192079; x=1701796879; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1KRci7MAuiNmCQTAsjB8Fyg+eMzzWJhmdTMyfbKheoo=;
        b=NkljAlqxtfzTbh3HEbWxuQUXQzCnYM8Qcsm4Smsp8i7lZG0cAWrK3otjF/v2TkHjS3
         9TMfcjjpBh8lcvn/x9GLbJCEo4LQGnoCF4qVjMQvjJA7MjQx7RyE2A4rzAKXjcS2C/9r
         WO9kLgTuGvG52hogZM+qK9SihY4L59q96YojzSF9g9KapdorVQu3CgZeRClYdXzQIm5o
         UR4g6YsN8XKyht5SP3QFyGKH+35pb2MhTByW5d5N5Ch5E0VPn5GVkjPwavFCcQbvvJUV
         iPkWxbDO5JbVMqP0IYxflitD71KppxccFL24BLA83CXBUpwzivUygmNZbPF6IXomk1vk
         Qf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701192079; x=1701796879;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1KRci7MAuiNmCQTAsjB8Fyg+eMzzWJhmdTMyfbKheoo=;
        b=HwUIYYlEHx6d1e9jJZzY3uQ+xw0EgyZeaWR10A1OOjuUUyFDoDtr/ISs4vdm95+IYU
         9OXQTOQVa7GTVOPrEbbvuoGJmBr6IJ5DzH4gfuvEzH6B3XclRnvBUCziHTjIrHHZC6oI
         03cGt4MzRgcOdC7GOwUZbvPUwO+egn3FPQ9/EkmkgHPVPwaRKPX3E8nQqgAnWqAHatux
         qMbk07eN3EG2h89Oeo7v6CvWx/sVBkMrxLUYQslTHJtKMbmhwDevdtYlBeoydfheHGh5
         v0JtFX1iDkwyhTfejRogQ3l2hnbl3U9IlUn7wFdjZFgS65VYlsrR0h0fS8puSPGLiVbX
         0zbQ==
X-Gm-Message-State: AOJu0YwtlY6Wd9P6e+2Me0deFKv6Bm2aS4Ks8H8ke98Zw2/CYv+1REqg
	1UsCYw8FBRwD/DsubCvSpKaedcuPE0SaEZ7jGa7plpbpOto=
X-Google-Smtp-Source: AGHT+IG24CjHpQa7Kf7g52620fQMABsGKcqY6kMy3APKM/ifc2MdHuRfa16zJFEZ8i/FFanRC9M8JZn5IhMn0Inb9I0=
X-Received: by 2002:a05:6358:520d:b0:16b:f6c6:b8aa with SMTP id
 b13-20020a056358520d00b0016bf6c6b8aamr17692833rwa.1.1701192079235; Tue, 28
 Nov 2023 09:21:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Mathias Dobler <mathias.dob@gmail.com>
Date: Tue, 28 Nov 2023 18:21:09 +0100
Message-ID: <CAEydidmWPSiyQPOog=9poWEhLLWkJh7Ue4Me_O0Uvi_BYO7XKg@mail.gmail.com>
Subject: libgpiod - stop waiting for events after request released
To: linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,
I am writing a C# binding for libgpiodv2. There are some automated
tests that keep failing due to the fact that each test uses the event
handling functionality of libgpiodv2. First it creates a request, then
starts a thread to handle edge events, does some operations on line/s
which causes edge events to be created, and in the end releases the
request. When the next test starts, it get's an "Error: Device or
resource busy"
I checked the freeing logic and could find out that the reason lies
within the event handler thread that is still waiting on
gpiod_line_request_wait_edge_events that returns only when the timeout
appears. My expectation was that when the request gets released,
gpiod_line_request_wait_edge_events  would immediately return without
timing out, but that is not the case.

So my question is, is that by design?
If yes, and there is no interest in changing it, I would find ways
around it, like waiting on the timeout but that would force me to set
it very low, to not delay the tests too much.

Regards,
Mathias

