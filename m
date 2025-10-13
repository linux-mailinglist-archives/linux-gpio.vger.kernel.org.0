Return-Path: <linux-gpio+bounces-27001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3042EBD1E49
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 09:57:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A67281898919
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Oct 2025 07:57:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58CF62EACE9;
	Mon, 13 Oct 2025 07:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="fmCrNkRl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AA82EB5C9
	for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 07:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760342210; cv=none; b=hAwLzhYSvB8+lyiEfVaYWVvlfVsSym2x25qnMwecZeKiTeEZ7Q6bfcf6agrEi3CzNWAK/HUWvvUOSeVWoJSUXKaRt9p5X2efinaYm87EImazYe5/nUJWh3VR/embIHxA8SIkzb1El5sh56JcI0ls1Rkt8DDLNe681DuEc5demlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760342210; c=relaxed/simple;
	bh=SL7n2KdQvOjjrVhOkMHHRC4gMIQW/W1Btvg/A0RdL2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Xt8eOECM4fDzbSoeKFcQVHo+ULpkqObegtXoYSJK4+2bTp4fFDzCvrRHQnjViFW1dTZv3WZoHjaSlRqVCS7jZT3iJRGUmN3XoCrOe/XNqMn71fq19MG6mFip8uBYITPidbYuY8PldlSBsxsrofD9GBlKtPjKvSEYGgKez0dYpx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=fmCrNkRl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-46b303f755aso33264825e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 13 Oct 2025 00:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1760342207; x=1760947007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ti3qbUsRzsBtmEjEWfle0or3xlL+83M+/faVmQZq/YU=;
        b=fmCrNkRlQN39C/GCTC/poNQX7HlrmxjuG7g3b8zqMyZslwKRHMvitjEl+7woymWLZ9
         auavNFkvoezbXwCb8uQ/SMeot/q9PLj8C9Z8K6YQlULtozsBqmGFlR810uad8STrBnNh
         icQBN+sspUTSexQ1PLpm+VRjTwvfcKL5a/sC0exTDxc8GuLyKjU0XFrqaK+/nj909X/o
         4+OVp6tlyE9Ib4VLwwqSsC4wEueZhF4Wd1BonRJBlVDS8EYM7rikng6wnsnWCP0u5HmS
         CT8CKjrtKR6c/EA88LpDx0Q3Qz+k1DhpJtKqQzgUgK4sdBz2PS6LV6ntAS8v2Qd8uvkg
         kGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760342207; x=1760947007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ti3qbUsRzsBtmEjEWfle0or3xlL+83M+/faVmQZq/YU=;
        b=jUTOpfCLs9u1OwKOydR4EDjM4W4pirpzyhHywutgzIS0hl75Oeeg0ZrIpzcAcK0X6L
         dx+n61IITaUeD81rV52N7+6Jyb+CrepRcqKyHIo9NtzoRvjhJEnKri7UbVF1jyuJ1DrI
         yd6AASfWBNZAoeukARnjA2xQaI4IXFfjmL0E6TDEyrAjWHEjWnmzbBjpxmLYUfklAwcu
         nflXovFml92BXwFKvYfQA3Dyub+qtF91NHXdRwsTk2OGc2QYi7KSBDvypHHPOw7kP1mR
         wQ+PT6WSLYgiYkmOi+qxv2I4s41W4r9DLBneP8KPSea+/ekd7rxEmBk8nEBjZ2ART5EX
         giBQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGgHLiCoSvu+Zuj2MihVchi/wSXRMCtRN4u9vHBW2imhoahyaCC9tluH5oy5mO/vbLUCjkM4NdY7+0@vger.kernel.org
X-Gm-Message-State: AOJu0YwntzdObPsrovORRhjrxCex1krPfXLcwwAJuwfEf/uBC9ogxicH
	0wftjeDIEPCdNRWWpiIOj9k+eUlG9IcQQ4ivMQsQMyG5r6ciEpiBvU5vIvFSH5dC6wc=
X-Gm-Gg: ASbGncuUriD6IKG3iqwf2RUX6i01REHZE/2gm+WoOZwC+aQ2SfFo7F90Kr0jXqlNpfi
	txsszn85h0p4NwfzhYNxdHb2FPlPFN5o0mNXRZCz76AYDwdLSpvmiWZE1Sur7wSHGr2R3z+NzaF
	MLHord0bVyEgRdGp8dkKBqZw8rNhs1qjr7HM2pmF0c0yXfos62+rpuVEZN/+A03lIwi72CBgZWV
	rJaeMqqLR+N+k0L9w1LsIGONIvtfNPMe8vIc4h0q7ZPQvEDIwFTa9ZJJJQm5LvOgIuTn4zMIPAi
	Wjd9hYE+fPU9Q4i/GrsRgrci5v8f+5fesA4Ip+dBpJgOaPlZnbkrP8Qw+M3UfDeQRjpsbMVAh5n
	D4k6IJ764EDI3bv1ADyPARL6Whmy4ASmwZQwWpSIetA==
X-Google-Smtp-Source: AGHT+IHOX1/2+jxlOfUxvgfeklliY9quaHws1lnroDn6Tp+1CVWZB+Gp8DCBWdKEIn9UPKfg90tjZQ==
X-Received: by 2002:a05:600c:c4a4:b0:46e:1d01:11dd with SMTP id 5b1f17b1804b1-46fa9a89444mr130387155e9.2.1760342206713;
        Mon, 13 Oct 2025 00:56:46 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fc45:d50e:e755:a6e4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fb32a84edsm96545345e9.4.2025.10.13.00.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 00:56:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: virtuser: check the return value of gpiod_set_value()
Date: Mon, 13 Oct 2025 09:56:41 +0200
Message-ID: <176034219937.9647.5828196652299079563.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250922095841.52330-1-brgl@bgdev.pl>
References: <20250922095841.52330-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 22 Sep 2025 11:58:41 +0200, Bartosz Golaszewski wrote:
> We converted gpiod_set_value() and its variants to return an integer to
> indicate failures. Check the return value where it's ignored currently
> so that user-space agents controlling the virtual user module can get
> notified about errors.
> 
> 

Applied, thanks!

[1/1] gpio: virtuser: check the return value of gpiod_set_value()
      https://git.kernel.org/brgl/linux/c/383760e3faa4d3df6e399d207e2930a785380c4e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

