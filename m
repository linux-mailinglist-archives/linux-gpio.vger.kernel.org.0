Return-Path: <linux-gpio+bounces-9547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6806968473
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 12:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5EAC42835D2
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 10:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F17213DDB9;
	Mon,  2 Sep 2024 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hE7DqvO3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFB613B5A1
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 10:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725272324; cv=none; b=nX72xmZZy9VURAEOZtQXBIb2YR6s0L7Gaz7V0U511sDiAOspBR1tZbmYMw84/dHrRNozRS69w38ahrtxG6EjfGrnxrObI3MMKfxA9IGGhQuZecNCnP2fR4/wFZzw2H4KSIKbo2ZDSYOXFM1nm3Lc4vW/bT3VkypNGjpqGUyiYSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725272324; c=relaxed/simple;
	bh=NswE2y90mim75aJCfzrIx/4kaVgnl/JCkngqK8EmH3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SGdXE+IrPN5QYzTtuCVwhpjTc5QDwGWKmnW5LLQMak2n3ANv/vS9CgKkpGXPX25Wtk95lkqsmvJviALCn6VW25WDt+dlookHU010ujxOvdVnEr6k0fdYKDydvEuKgEHhxxjFvo04qeOBv7dJf6hxPTsdlpaFyZdcni9Gypfhsr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hE7DqvO3; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-374c6187b6eso743396f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 03:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1725272321; x=1725877121; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v4QFj6+ALzemNgN4lMLiLnoXr0Dgmd+rfQHvi6JHSU4=;
        b=hE7DqvO3c4gBinpQMDSnZPRoV8pX5vm91UauI4my57VTEUL0zh46nW2bbCzTz3SJtn
         bcjZrJww3e3T7BZb/YllX3vrcJSZ9OUNo2CV/FUVn5KV2Uzd1LbKwj98T3t/KP4He5vx
         AWhkSz7LjhF1KqfQVk/aYfGJJvDhrlicuNKJaDEaqmaNstPjX3Fi4XvNujnJGKY6UR20
         Cpv8UliykJkaPCYjKad96hdcTRLPX44QzsUSKLebS85ZIh9cWG2yV5mwQBjMz1COyVmM
         IfzL2MEp1kzP/4xl5njwyf/IDIqkaiwc9m0AZsqAKcBCaY2xJeC0ZCBLlNvQCpgyonIU
         yfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725272321; x=1725877121;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v4QFj6+ALzemNgN4lMLiLnoXr0Dgmd+rfQHvi6JHSU4=;
        b=ZBsxHLMl/tmxviDdQ7iTKGx9YeAKs0vFyErWdBqNABapE+ikJdkEPIFD2xXlgtuMW5
         t/RfDrGET+jqcBLoh9r8CGViKbXm5tYJdrEqh0WKyyIM8qF5e8yQvThHzm4zvtFlq9Ni
         2R62idq7nYB2sXUw6+JbwtrMG3N2qfp2OgwS3Qn7qC5BrC3N0ysSBwej6EDqEeWc9KD+
         OVzDrUuGOAoNFMl5OPk400Ke+zAlnmaNcne5eFzEFPsDskH0nOd5kjYW7KFlckX7vFq0
         mAWZ2ioqGEy4n9fusqzEKQBfGQVXcVLgcduz+hfUB/7eOgaH5292uK/CvW3cs+VHvXWx
         Q4Kg==
X-Gm-Message-State: AOJu0YydEn96ILj0+IkpVOvQgE3Z8Ndn6f4VSQBffvgflbWcMzE7WdIP
	OjP0+eQ1NPAT1YvVMfGe+lN428New3Cp3/GeYkFJcTGxhHNUTSsNhNP1FojfgVfqKbkVLelyH4t
	K
X-Google-Smtp-Source: AGHT+IFwmJjnZR4B4GeO/RdQeVrzPp2PLK9pFJJJBmJ4/xvVUXdeCjovjyuyfoWfQWIbfsK2FDyHqA==
X-Received: by 2002:adf:e604:0:b0:374:ca43:abff with SMTP id ffacd0b85a97d-374ca43ada7mr1644330f8f.26.1725272320556;
        Mon, 02 Sep 2024 03:18:40 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b496:9e67:73c9:9f5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374cee38722sm1190892f8f.112.2024.09.02.03.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 03:18:40 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Robert Richter <rric@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 1/1] gpio: thunderx: Replace of_node_to_fwnode() with more suitable API
Date: Mon,  2 Sep 2024 12:18:31 +0200
Message-ID: <172527230207.24237.18438688734291858387.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240822225300.707178-1-andy.shevchenko@gmail.com>
References: <20240822225300.707178-1-andy.shevchenko@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 23 Aug 2024 01:53:00 +0300, Andy Shevchenko wrote:
> of_node_to_fwnode() is a IRQ domain specific implementation of
> of_fwnode_handle(). Replace the former with more suitable API.
> 
> 

Applied, thanks!

[1/1] gpio: thunderx: Replace of_node_to_fwnode() with more suitable API
      commit: fd7f4d67469d701f5f5fbdfdb94875fbe8b5ad15

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

