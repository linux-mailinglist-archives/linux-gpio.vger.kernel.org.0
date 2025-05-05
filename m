Return-Path: <linux-gpio+bounces-19601-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD07AA93E7
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 15:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 48BA63A57C3
	for <lists+linux-gpio@lfdr.de>; Mon,  5 May 2025 13:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA00225524F;
	Mon,  5 May 2025 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="WeKYq+p7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E48262550B0
	for <linux-gpio@vger.kernel.org>; Mon,  5 May 2025 13:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450202; cv=none; b=cL8AJQhS50rq5dA6NIFmJXmBtMrjIriiFr7OBLRpPt+9Lu8sEliO42bZK1wi/WtUwb48kW4jrq5bJG6BLjdvpnEyiIF7r5jz4ptluSxEOl853Ojr60E2nOOmXF5QpskkBD5CERBZLyTm0ZnZ+PZrQ+zSPQ4iN8yt7WUhQAbXx7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450202; c=relaxed/simple;
	bh=GX3fOpHRpwTiNw/HHyGPbbI7DxqoGlKtOoxGwbPApAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ab5OiMwOKzSCsXb8/suKeFac9I5JtohxJMoV5EpsUnDemJ+NsIFVKrM18u1XcBLZjw0x8bcLof8hwUPx7pFWujCbgkWY3f7SrE8FD7a62WMCIX5vl5Xyw9pivSbhGmHOelrMdwGhBXr4tO29lUKGqfFpbqkr6wnHHdAeCIDvNo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=WeKYq+p7; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cf05f0c3eso25479605e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2025 06:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746450199; x=1747054999; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=exQ9S0PkQmvIF3X9JD7ZxE0T6Y64rW4BPHjAOWOwk/o=;
        b=WeKYq+p7jRnFFg+HV9crL8pBJKgMEb8phT5399BOJ0Krj97eKMU0yTdohYhDt9EsX1
         oCkxE351at2bpPrvnK6vj3xMKwoOhnPMiMHGcM7PbBTNgBfkcozKdiMKYShQeaVsTowh
         yXP0EIoqYpBepRqPkdnE6mBdiD/SF6wSNmF2XXVaYZFxOV6kM/1fjrcjBLQ+5C9SR3L9
         +87lqmrBZzzLrJ1gEQUI+032ayImxIbHqdr8r706eg4KmhWA8UHUMa8hEOgl/V576+xU
         5xWQQqwuXPssPEgRlsZnjyQjMAxYRtXpl2ht3j5WK07uelDW8gCr7I/UsHJYKKP0Yoo8
         4ENw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450199; x=1747054999;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=exQ9S0PkQmvIF3X9JD7ZxE0T6Y64rW4BPHjAOWOwk/o=;
        b=kUZsi3+Wx0NZZceGknXdPSTo40YPCJFxhSF9yBlImdzuTaDWb+aNoELy6zX4r0+GQp
         c3uiHV6FJZ3EAwffa0oPKlDgCB2ZwtvMj/uDVcz7L6qBrg3mLxOr1GCywcwnRl957Obd
         aoLRs3Dk4eL4Es+2uF2VyjjlI4zlEr9B9f1QNOVbYUNVB+qRPlnqKWSkBzWbZvXhJCoo
         lusJk3W3h9n07dApJX4IBoT9B0zxzolQhbzAntO113j9sTKaouSJFT4odeW3YcxVYVi0
         R7yKqkuOaOxXZVeOt24zSJsKtb7GySXbuaFUhYJLZdZ0ceVO96mIDhwDeUpwYZCXSshv
         8iBA==
X-Forwarded-Encrypted: i=1; AJvYcCUOFonbk8oZkT4P8cszVGfUmT41Nvf1TKFo7XiSbhevlP8X5ABrF7/reCqROtfIhp9MUP6Hz7H4wJAH@vger.kernel.org
X-Gm-Message-State: AOJu0YwZCPofHjirNAzwMdeMsr1oGmBMD1I/EvlVoUeWv6hk0IIyYEQs
	U1NNk5+DnX95WnPFKSf7iW3W1XzL+GS+UcfqbAF6OXynhF2jsXvwnOquWi6/ZGA=
X-Gm-Gg: ASbGnctEo6bOdwXJV63I6LZeNOlJhTu9u7fUGCi/YYN080tmH+PrFc8ZRfVcx6SRIU9
	NEJfs4d8SI4DzJJi3eEBK5ReauIIytnerbZR7JoTrCD/nNjSadPsuxbeG2LtU4HcqKxJG2Cs4Jx
	dMKDbAj7yJVJK2I8OOpYjX7v9SeVfq66siZb5RNBGY6dOpvc9N394nHBw88K6oA2EZ70e75kxdr
	RHPvyWa0onkOajGInkUwQqG1+7Gtmth0rtgqT7lc6XlFY8y0KjScQp3fLB/7bOkfAxUV28gDcTc
	TERBzrgpmrXU7DyRCbCbcQwk7TkP4hpEnVmN7QEs
X-Google-Smtp-Source: AGHT+IGBSe9gkuaw/waiKDlvhi5qEhelecunE8RuxjCPPbdde/GxKzqd1CV9fdvHIVkiXv7IGpTfnA==
X-Received: by 2002:a05:600c:1d8f:b0:43d:7de:16e3 with SMTP id 5b1f17b1804b1-441c49237f4mr59652335e9.24.1746450197810;
        Mon, 05 May 2025 06:03:17 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:71f:4190:a04a:bb82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ed4d4sm131276335e9.19.2025.05.05.06.03.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 06:03:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: James Cowgill <james.cowgill@blaize.com>,
	Matt Redfearn <matt.redfearn@blaize.com>,
	Neil Jones <neil.jones@blaize.com>,
	Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Arnd Bergmann <arnd@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: blzp1600: remove incorrect pf_match_ptr()
Date: Mon,  5 May 2025 15:03:15 +0200
Message-ID: <174645019201.54400.7798160459786801009.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250502203721.2117186-1-arnd@kernel.org>
References: <20250502203721.2117186-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 02 May 2025 22:37:07 +0200, Arnd Bergmann wrote:
> The blzp1600_gpio_of_match is defined unconditionally and can always be referenced
> by the driver, so don't use of_match_ptr() and avoid this warning:
> 
> drivers/gpio/gpio-blzp1600.c:263:34: error: 'blzp1600_gpio_of_match' defined but not used [-Werror=unused-const-variable=]
>   263 | static const struct of_device_id blzp1600_gpio_of_match[] = {
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: blzp1600: remove incorrect pf_match_ptr()
      https://git.kernel.org/brgl/linux/c/3a1e07184d78f52c07f69b40bedbbebbc417e71b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

