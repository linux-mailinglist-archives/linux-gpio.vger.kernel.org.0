Return-Path: <linux-gpio+bounces-9820-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB7696D07B
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 09:35:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29B951C22697
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2024 07:35:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B51D3193069;
	Thu,  5 Sep 2024 07:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="kSB4QdP6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4B111925BD
	for <linux-gpio@vger.kernel.org>; Thu,  5 Sep 2024 07:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725521727; cv=none; b=t5ItgfRZqbEwmgR0Y9pb7xk+TK5rNgbCa3gWSmgekjY0C1g0Hsxlh99Kw087anp3uZ7sIKPDzyG5jlMWMLqyOOMrfNx+y7z59PF+wQd+AE5HebdQQD/OfGsGib286aD7LbHsfaq6bSD+xLPxat9lo1oJCVQUYNDPnFR0ik1cZb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725521727; c=relaxed/simple;
	bh=8nhodvz6HDn8Wahupc23sOH8/EeoJhhQwRss0CyE8vI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WRij2vClxYpT4tcgvUv6HzGJwc8C9OJrK79uiLx3fbVvG4MSKAdhqNUe+LKZksFVh80yubms27gsuv8xntypemI4jGk1wSX/fW5QSWmZzy49NbFhEdpUR7DzxKAMPQUpO5AU15/MpPD4cA3AWSjzy8FYSatkfHgIg/klRLAMu4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=kSB4QdP6; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-42c7bc97423so3982875e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Sep 2024 00:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725521724; x=1726126524; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ/23GvmcJ7ovLSwWwHNTpRoVPzfdaMFZbo2FZTdTbc=;
        b=kSB4QdP6hXsPsKLQCSsGWcP1+aUIzni+uyfbHyfIoysKFmZkW6UiE5HtriCL3BQ047
         yZbgPb1MZREswS8GOraP1JpTPCdiZa7QviP8hHVLK6aamQe8LzP1TS81LIii99OcYHoo
         Zy7F0KJ6ydF5vCUS5SoCmRh9D+Pdj3Zs73vEm43FRcFCaFbaWPxLL5saBAPCtmYxb5FR
         fMb1HuDRWiXIJsKVpYFVquQ/L14qowsqxpYvQ4EIybzMDlsDCqhojOg1QS6czVkIwxFo
         ih9pRGRGR/YdC2+pa5Bepw7yLYZv0E8rS9WGdByjY/nIFnhrKbFHlP+bNVxYmwD8jlaj
         j8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725521724; x=1726126524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQ/23GvmcJ7ovLSwWwHNTpRoVPzfdaMFZbo2FZTdTbc=;
        b=P77Qo7bA136bPsgEN4378D2Bsv/5xSA6gkITT9bdrflcypsKjaloOL9IRsLhvkGw76
         SqnHULcF809OmnV0WbNiOP9bcKaa8uA+JHx1ioSp+Wi3nHzeqRdQYogRbD+uT8IIMMYO
         tQcqtggPE9TOha9n4yPx9EpC06bKXPoeuIFLy9SxRJ7FnK9IqUrfZ5LUMNw7dlCKUdE/
         rUuLDn/st565mwIUhtgs/skZutujAHI5hEFVpSWuN8nz02rnlY7qQI+C/7lPZq27XZkG
         /ilMoh92Ws13svYjUEL4aCmyJZs48+7RugR8oWbXMPDKB8uFgpwBxdt83CnQG0wrOyr5
         rHlA==
X-Forwarded-Encrypted: i=1; AJvYcCWGbsQQK4shHgs4Dd8v99svnjdpPJUg6uRTiDUwvYwCQtHlGoE2Xs69WzFZDNHsIGVXgWMJXVsRMCj+@vger.kernel.org
X-Gm-Message-State: AOJu0YwIFUjaxsiV66Dd2By4HD5BRgO+T2TFmQki4vbjbA/u08wR5uMa
	GICCIROvoYMN6s5zuU4rUmH8ymGkIfMt8SgZ0a/gONFr3J/Pq8hCvu1tzdCHtzI=
X-Google-Smtp-Source: AGHT+IH68IdBloyowsN91EhICAtD6L29zRBIkLYcX3XVsNMUoPU9rxNQRGfaLXzbXdtnWjXiONHKxA==
X-Received: by 2002:a05:600c:1c8a:b0:426:59d3:8cae with SMTP id 5b1f17b1804b1-42c9a365902mr12535915e9.13.1725521723998;
        Thu, 05 Sep 2024 00:35:23 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:cbe4:ce99:cb33:eb1c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374c6479514sm11556586f8f.93.2024.09.05.00.35.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 00:35:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: ludovic.desroches@microchip.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Chen Ni <nichen@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: sama5d2-piobu: convert comma to semicolon
Date: Thu,  5 Sep 2024 09:35:22 +0200
Message-ID: <172552171821.28249.17645569487083979651.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240905024245.1642989-1-nichen@iscas.ac.cn>
References: <20240905024245.1642989-1-nichen@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 05 Sep 2024 10:42:45 +0800, Chen Ni wrote:
> Replace comma between expressions with semicolons.
> 
> Using a ',' in place of a ';' can have unintended side effects.
> Although that is not the case here, it is seems best to use ';'
> unless ',' is intended.
> 
> Found by inspection.
> No functional change intended.
> Compile tested only.
> 
> [...]

Applied, thanks!

[1/1] gpio: sama5d2-piobu: convert comma to semicolon
      commit: f4d08a8fed0542effc545990b583b5322e5bd003

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

