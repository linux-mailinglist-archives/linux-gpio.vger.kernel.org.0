Return-Path: <linux-gpio+bounces-6279-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 470F88C1020
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 15:08:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BFF7B284A08
	for <lists+linux-gpio@lfdr.de>; Thu,  9 May 2024 13:08:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D63150984;
	Thu,  9 May 2024 13:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QVwpTfNp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19DE0147C96
	for <linux-gpio@vger.kernel.org>; Thu,  9 May 2024 13:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715260077; cv=none; b=OV7g9uMM0TkbvLifGr6OOoxF6ozsGWEKRyNlVqpSHbN0DNhQSClW1hUekdKqmDKTvDEb7+Qz3kI1yD/pj0ADcn6Hs+yBGTiJWsWJFt8noNThQ0aWi51BQgJw1IpNQbMxUEjIZoc2x7ee9QqfjnSBksZVBowtvu78j+YveDO5kX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715260077; c=relaxed/simple;
	bh=z8SqJFswMNiOCt/oP6O/swgxgA2P0/VGrYDi7IdlXyU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nXnTZUBXCOZKsP8HRPKvcvo5FH3s1ohzV1B5/EapuTggdgP837MlYOwwT8m80VtJg7yhqEaGImyXiE46GM1hcVv/0lvljWXzANKHdVsPj5wXBE665PidIjqEjB5OUl9u3rMCY2GsOq/F17GIF/uLVn1KIxqe9q3i+2aigeB+Apg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QVwpTfNp; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2e4939c5323so11341891fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 09 May 2024 06:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1715260074; x=1715864874; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BnIPJSuPpdfHAhCpgelWzQDxXKYscFTQ9fmV3MxWiXM=;
        b=QVwpTfNpnFBE6FSBD5Z1mVRCF0biN2xFbwAnyst68JqoS9BEABNmZP+hUhvkAiG9KS
         1tSRA5djNokPEEGG2lHtZ3Rco9n0H7FWKbNVsgRjUS1eQ3+0G5BqPw8n1CSlQEGxuZow
         awlG60ddW+ndAC0R/IeoBcGdOepQwKc+68w3HONwScqLSCoU7l01Fa5ryg4UOuumXzre
         EcTwFNNf45hM/knUaXjagCp1YD04K9hopJPtuRSl13jHvLELNqtlN1xPiBJV/+NtqpdO
         TYYYjOubTWoA+apwtmZSlQlm1jv5X71p1W/Y00VgPnK5dXR3etJ6NMahhA6iP8bqW+3a
         CXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715260074; x=1715864874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BnIPJSuPpdfHAhCpgelWzQDxXKYscFTQ9fmV3MxWiXM=;
        b=eZJtYoXx1eEunCSMxfTdMdev8SKM5zZrxy6Whk0ebeBLShZdh6i9IUftH2lVDpuz2B
         y9SWN++XNPhwPqhX+ttXdfu3dl2T1aCt8uH2MLu9iAc6MSZt09T41aQuNYtN5bu03moY
         sNxvDFqKYzvL+T2rUZ34lHSSJqS++YYLVwJoeJKqQGVDaRnD4lxYTLNUymT5c6GnFJnY
         cMHVm9bBxupmp3IMVmVnG8Xht7qrXKWuEfg+AG+hJVYDxkZUvw4wks+Bwe3VNmnZi9+c
         Y9dikAdZJCfZGjwB7G9v7LUet5QP+QZpa2/aHDQWxHcYX6MD0FsBmeEcFk0qM5T6qtQJ
         BvAw==
X-Forwarded-Encrypted: i=1; AJvYcCUYNdV69ImZUEk847kpob8MsqQ6xzZ0uD7dmAN/TBYJHwyDAptzN4+nDBn2knEFkzsU0CHjn7tcIrQTpAZ4+db5amGLNQb6db+74w==
X-Gm-Message-State: AOJu0YyD8BH4SnElLNAEwcLMOzfumQH2XphdDLEq7UCA44l/lI7V0bzW
	dviBsKqRdngHmzw1X/KJyFBMKAd1j571Wl8YF6iQiFui8dTvSye+TqBbv6CNFVc=
X-Google-Smtp-Source: AGHT+IGqH7UFebNPJ9olqkCf6MNwQWe3pDuQuLPOy+hnDSHelK8uBIUKEyXUUQ5x6P9RLIO8q2+38A==
X-Received: by 2002:a2e:870d:0:b0:2e0:3f37:5af5 with SMTP id 38308e7fff4ca-2e447697286mr45694331fa.41.1715260074260;
        Thu, 09 May 2024 06:07:54 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:5c73:df7d:ebfd:d941])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-41f882085c5sm60626675e9.40.2024.05.09.06.07.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 May 2024 06:07:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] gpiolib: use a single SRCU struct for all GPIO descriptors
Date: Thu,  9 May 2024 15:07:52 +0200
Message-Id: <171526005990.16179.13548989415103122490.b4-ty@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240507172414.28513-1-brgl@bgdev.pl>
References: <20240507172414.28513-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 07 May 2024 19:24:14 +0200, Bartosz Golaszewski wrote:
> We used a per-descriptor SRCU struct in order to not impose a wait with
> synchronize_srcu() for descriptor X on read-only operations of
> descriptor Y. Now that we no longer call synchronize_srcu() on
> descriptor label change but only when releasing descriptor resources, we
> can use a single SRCU structure for all GPIO descriptors in a given chip.
> 
> 
> [...]

Applied, thanks!

[1/1] gpiolib: use a single SRCU struct for all GPIO descriptors
      commit: 7765ffed533d4a9f0291a0edc660496d104396ec

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

