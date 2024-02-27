Return-Path: <linux-gpio+bounces-3828-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9E9869C9C
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Feb 2024 17:44:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC22C283937
	for <lists+linux-gpio@lfdr.de>; Tue, 27 Feb 2024 16:44:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70C23F9C6;
	Tue, 27 Feb 2024 16:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yXVgikTY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA6C3C06B
	for <linux-gpio@vger.kernel.org>; Tue, 27 Feb 2024 16:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709052255; cv=none; b=PpLVm5hpj6OLKP+QHkrJKEq3aI51yOudTdGtoRxUVBRBi207mBdJuH9DBrRwCeiP+ec02/zXN1k7dGF6BuYnkKMJ1zHKF85RFxwx4hkIiQXT4JcNO9oexeNypYQ551OUsLeyRGMR/uGO4EOqZIIthRNfGaPrwDV4yFDhwGzk2Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709052255; c=relaxed/simple;
	bh=KIp0rmx+ayKj9IPU67F3Rr4R242hsgywg+SNQZ5dgfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JA7JzKTcpmIb/w258+QlDxdPswLlew25RxUvHIT2thBNoNkW8pSFdglIWTw6knPJkzqQkdXKykZE/2Bl086q1+575gAtGpt1k9FUOERbcDZBU5tJneIgpO/FMcoKkB6i8LMiyekY1tcatAqw+zeGW3DRllfY9KKFj5rTdnGwEhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yXVgikTY; arc=none smtp.client-ip=209.85.222.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-7da6e831977so702637241.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Feb 2024 08:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1709052251; x=1709657051; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KIp0rmx+ayKj9IPU67F3Rr4R242hsgywg+SNQZ5dgfk=;
        b=yXVgikTYSPjOB1hfvp32bU+uRSKNjOr4AmjiKdf2Y5bKOGXLOL4AeL628Jw4yMBMnW
         bjE7oPeGryupHby2oQTrVrZBWg/Faqs4xp0XFsE399SnlCOiHk/1XmFLux33Ho6PF04i
         olDkqeQOYogvF5EFB+kJfT+PuljeWTiwDQi+FGl4sIpCQ/Zm0FAjcyMxUcJp0elbtsmP
         49rPej//YyRiHZ6x2XEtY10NHsIuA4uASJydoWpUCXCgjxOXWFlSHljUiIKfk51fJKdo
         NPkmBoV8+pNo8pf4hNE0gJmD48xIHa7QCyEpO1e7yH2lYIERwnTSTPRW4xkOJB/AL+ty
         dpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709052251; x=1709657051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KIp0rmx+ayKj9IPU67F3Rr4R242hsgywg+SNQZ5dgfk=;
        b=mwMEwGUnWx9lYHHZJN+K/M6r61ODzxQGjHlsYTakF+aPwVtP1ppZic8LzdEhiP45Ya
         LWRM28v7D4aVxbTi8ZdAxugoARjXwNVGkdJWa/8fm4i/rhmu9ODJuZ1KHVrdTnI/FXiS
         Z2vRtvhWlwtmslVCE3mR7p86Mzr1JmM0PnEhDCUHAs5ZrJC7Oj29Rh9a0sZ+jI6j9ty9
         6YbVl1fCk5V0oQ9mfQVtwYXTI57SWpQr2vRNNCp2LF+wbNY/luV4WS6r+IQ7bDcRlI+g
         oKud/K5Wez7B3Vg2KG73ls4ZJzdpKtnCx9c4MGTXAlBkRTdXNwP9KRVCQTm/ytuuG+eU
         hmTw==
X-Forwarded-Encrypted: i=1; AJvYcCXPh/znTNEGH7qv8ReEK0ZD1uAFpbRp5f1pIaRsnp6V7Aao/YLsFBYTiJMiHSRXl1Jauq/9hy3Qr05KHrf9YrLHR+ndvE0Jjnmc3Q==
X-Gm-Message-State: AOJu0YwsoPU9MkYU5uPeQn5gCo3K1oiRhug9IdRn69TvDh28ibTEMhdM
	u7Htl/38sARnPpHZu5B0ycZ455ETGEBxcAu6aELb7XcefHnLmJtZPzA96rOsu6KAZCF9QKjhnBT
	llEzlROD8N/8XmAlRG3aP9XYMdCAI33bQiPH9ng==
X-Google-Smtp-Source: AGHT+IH2ONdjwwoI0rA5UtAbqRSwSTglngGy8N+DsOjlwARrz+89QUblO+JAMpp5uvf/Fs8kmMiJ+34cMXWkQ0nywbc=
X-Received: by 2002:a05:6102:3ecd:b0:470:a136:5c00 with SMTP id
 n13-20020a0561023ecd00b00470a1365c00mr10812685vsv.17.1709052251549; Tue, 27
 Feb 2024 08:44:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240214084419.6194-3-brgl@bgdev.pl> <202402262225.50983057-lkp@intel.com>
In-Reply-To: <202402262225.50983057-lkp@intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 27 Feb 2024 17:44:00 +0100
Message-ID: <CAMRc=Me=sfoimct+YHhhq+1vSY8eb7vNdvON4zibx3a6EhnzJg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] gpio: cdev: use correct pointer accessors with SRCU
To: kernel test robot <oliver.sang@intel.com>
Cc: oe-lkp@lists.linux.dev, lkp@intel.com, 
	Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, 
	Kent Gibson <warthog618@gmail.com>, Alex Elder <elder@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "Paul E . McKenney" <paulmck@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Wolfram Sang <wsa@the-dreams.de>, 
	Mark Brown <broonie@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-kernel@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 26, 2024 at 3:28=E2=80=AFPM kernel test robot <oliver.sang@inte=
l.com> wrote:
>
>
>
> Hello,
>
> kernel test robot noticed "BUG:unable_to_handle_page_fault_for_address" o=
n:
>
> commit: ef4aabaa372144b2bfa9c4ddc83255831cff9ebd ("[PATCH v2 2/4] gpio: c=
dev: use correct pointer accessors with SRCU")
> url: https://github.com/intel-lab-lkp/linux/commits/Bartosz-Golaszewski/g=
pio-take-the-SRCU-read-lock-in-gpiod_hog/20240214-164752
> base: https://git.kernel.org/cgit/linux/kernel/git/brgl/linux.git gpio/fo=
r-next
> patch link: https://lore.kernel.org/all/20240214084419.6194-3-brgl@bgdev.=
pl/
> patch subject: [PATCH v2 2/4] gpio: cdev: use correct pointer accessors w=
ith SRCU
>
> in testcase: boot
>
> compiler: clang-17
> test machine: qemu-system-x86_64 -enable-kvm -cpu SandyBridge -smp 2 -m 1=
6G
>
> (please refer to attached dmesg/kmsg for entire log/backtrace)
>

Please disregard this one, the issue is fixed in patch 3/4 which is
already in next.

Bart

