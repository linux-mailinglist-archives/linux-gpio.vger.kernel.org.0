Return-Path: <linux-gpio+bounces-15700-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CF7B3A305A2
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 09:22:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71E4D162054
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Feb 2025 08:22:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 780EE1EEA43;
	Tue, 11 Feb 2025 08:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="l6R2ARP5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F40C26BDA8
	for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 08:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739262145; cv=none; b=ZGBA5HbjHTwSOSLWkOLyj4BimJvt/akqTF0G2HaqXnCr7veqbPfb/67Z4D6nQMDkpNtliTz0BcN8uWOYuLyXYz3PeaZ9Z4b7L/Dgt5dIdcnOb9w7tu/VsbDNl4jqQEamFnPcTByA59UcA8jTaN2d7yNVJarzRMHR5bnNu4vdY/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739262145; c=relaxed/simple;
	bh=VtlCoBRlyZzN6frYOm+UDR9Y9LTgg9CCmXLOlgK4JqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BRVH/MXjaTP1K0b9IIv11OtySyYiVy647HjdFNk9QW8G5YlVlGzvmfQHod5B2vH5fMDkMlgvC72zQbZlZReP9vvk2E7DSp/97TO9yeMVWb8CSSqsJ9WZHWwGXAO11oXopNgTrw1kd7unmiOCzGwHOvu0cV1l3ysZSi0GbnbC6ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=l6R2ARP5; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-38de17a5fc9so930336f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Feb 2025 00:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1739262142; x=1739866942; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abkvBx0v5xQR+AB9ER99VMmoPJKSMX/xYZ55cOWkUJY=;
        b=l6R2ARP5YBxdiBOeJEYGGD/X4dyoWWQ4fXomKRyEh5ND1vHPSJf3XQwfGzpx5LS88W
         Xja/wklzRrz+OEI9f3rHVaYn/wQ+RBrt+gj3y8cWG7xK3VPd6/fduHUNXLNsba33wFNm
         ryBYzkP9ZN+q17CtEwyZ84z7fRQc/PI7GAVLbW1XL3qnZrXCyLQCmWrB5p74ToDMv9yA
         Dy7I+QmD22vFRZ1MnzqgXANYw1uSIUB/bks3bSs2zWA0kBtEOVkUVGtmH2kysgHzD1sA
         aVvnvJh7bors7OknlnUyGZV+wm+lxnzbB+hocN3/bpGNaHUhAfueMuSa2Poca2K+SumI
         PVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739262142; x=1739866942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abkvBx0v5xQR+AB9ER99VMmoPJKSMX/xYZ55cOWkUJY=;
        b=QT7BJNUm+peDsktsjXCnPoUf/4ncmEfhMyDMZHELtTmmmgXLDzgM8iOCShliqMwe28
         L9d90HWp4HMlnA6DoyBrdpE8Q3OE940x8/d8qRcPtTdyJ1I3RaBsod0Sx0bNP/85iyKb
         uvfBWlmYfOeyQpF2Qdh2vbKNwoDadn88oi509aWKZ1oLQVMJp67mfrzvYaZtkKxIQh9I
         FIRwTyOqP4yPz71pmlodY279rGtLcA09AVuolbUYSPhmu5MksQ/vfh37H3tPG+2hQwrx
         NCUFhIMOxjefO/VbGhshbBpu3b/Sw7TtsNqpNU73Ob7b0qUBTxqayChXdha2RqiJDmuS
         J38A==
X-Forwarded-Encrypted: i=1; AJvYcCXS+P1OjEe6MaxFu6A+og/1xZyDkgWOTFfhdXU3dQfG0RSLrPaCezfnV31jTsEUaq7nW0S+iyYvqrif@vger.kernel.org
X-Gm-Message-State: AOJu0YyZbvFtVXpe7200iF8jhGxDGVj+N5baG3gabp5dxksOZnCkJX/e
	WurOmvfzjYt9z7T/vBSh1tj9r2q1b8KuchMqoMOMZLTFMDNaX7h0xF4B0OjsFmgzibqktk1LjeA
	iDCI=
X-Gm-Gg: ASbGncv6F/1IyXxh9g+sVkpxrUAHOl57OLup5T4JIxtbLPsw4GKO3fj4Vesz3BQGNJm
	abX3WtMslB8s9Okh3jcHd9QwsAPHYIsmNe4s1mZKoBNhmOilCqxMevxdpns55WI2++jWauiwERi
	+MyDTHEWVZ+Mum3ceSTq1ou101/P4w76N/goDd2tYftdXvFoF6Lm7B/1AdA4YBlLwA4OFcxpvEI
	PcPLwNFNysCRekrW/pEjPtF2O6wNwue0qCE6x/01dYCy4ckPNrHXIhQadexuB2YYbO4buYurghg
	Kt7vLdPkO1ITjg==
X-Google-Smtp-Source: AGHT+IFMK0Nn9o2/qeM7LLSpZk9GKr3o9T2LYpmMng3eAzPZNsEZRpFEaZ5tqKD9U5N7kc3OHLpkdw==
X-Received: by 2002:a5d:47c9:0:b0:38d:e12e:5db4 with SMTP id ffacd0b85a97d-38de12e5f10mr4447546f8f.29.1739262141893;
        Tue, 11 Feb 2025 00:22:21 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:561:8978:1d41:636a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dccc1f531sm10913753f8f.87.2025.02.11.00.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:22:21 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: info@metux.net,
	vireshk@kernel.org,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	viresh.kumar@linaro.org,
	hlleng <a909204013@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2] gpio:virtio: support multiple virtio-gpio controller instances
Date: Tue, 11 Feb 2025 09:22:19 +0100
Message-ID: <173926208976.9431.867890278648224136.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250210114935.204309-1-a909204013@gmail.com>
References: <20250210114935.204309-1-a909204013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 10 Feb 2025 19:49:35 +0800, hlleng wrote:
> Modify the virtio-gpio driver to support multiple virtual GPIO controller
> instances. The previous static global irq_chip structure caused conflicts
> between multiple virtio-gpio device instances as they shared the same
> interrupt controller configuration.
> 
> Fix this by:
> 1. Remove the static global vgpio_irq_chip structure
> 2. Dynamically allocate a dedicated irq_chip for each virtio-gpio instance
> 3. Use device-specific names for each instance's irq_chip
> 
> [...]

I fixed the subject, there should be a space after "gpio:". Also: when sending
a new iteration, please add a changelog.

Bart

[1/1] gpio:virtio: support multiple virtio-gpio controller instances
      commit: 84693df49dac458e980eaf37f26ae6e23ead98d5

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

