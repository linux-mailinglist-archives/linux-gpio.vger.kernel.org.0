Return-Path: <linux-gpio+bounces-10720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DDC98DC43
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 16:39:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A4DF286222
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Oct 2024 14:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C08901D0F46;
	Wed,  2 Oct 2024 14:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F5ZSO3No"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 917D81D0964
	for <linux-gpio@vger.kernel.org>; Wed,  2 Oct 2024 14:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727879595; cv=none; b=IIU/hFRuoa0LuxqhgVnk8j56I5sKH3dxPyFjJ7OHo0BUOkHPpm2M07WYzYK2NPK/YdGAx/xlS3dFR5BRhGJUYS7JayLw+MohAwg1eVyGwCbcEmLO35qpJuptffiagHEavbHK+ZCiXXGPN1nPQGGsrt43lscMVskxYGKb1CscYNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727879595; c=relaxed/simple;
	bh=f+90MQvPrEolQsniRVwqUBXVzeLBUfgK0+iQIljiG/s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aNmYHknfO2soO8y04C3WB0CmB2WsufjL5vbSAztXGdlmIG8rd6nqWtWu+QTBg0yGwVU8oUFj7PTtSvGeUh3GJlAJUN4T88ZM8nzBsc2LBirxqHnf3wJflVWdH+pjsGTHSBxLkxGOUaucvSLRCaURapoqfLkZ2/n4sXs5oQnvBNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F5ZSO3No; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37ccc597b96so4381906f8f.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Oct 2024 07:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1727879592; x=1728484392; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erU1VnZmdYTX2Wju9He3Bnn4nYfV32NEqyeEw+ucfvY=;
        b=F5ZSO3NoF5MIlAJeREsOMGuHGdPoFqiSRwz6YGq7vt6744w8TeMF5RJfAN3qgGhFi0
         oZdwspkUQHak9bReIKhDcFRqxw+Dydg6/LrkHxyz0LUUPmwZEEkvmrOkEbns0nuAIV3v
         ftOVvSqAfQ60ykn2MdqhA6ZsfRYDrkTOsvWsLr4+b0YUPksENch3/ZDYFEa0drx51ObH
         5PHRZN/eLUT2OwGfbAV7PsfRi/5xuWb4jZJ/V4+yIH/MxBjhFxd0EJ7H2DuTKZw7/kPK
         TmDNNQg2DWStKc1rCUOLPMgvmlTwgDDwkC3VOISdPsx5MMsUKcLv4zED8chzpOFfLY0B
         uNkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727879592; x=1728484392;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=erU1VnZmdYTX2Wju9He3Bnn4nYfV32NEqyeEw+ucfvY=;
        b=df7pwo9rPN/Vw/aRuvLpC3h+TdlXHsQOoFTMut2jnV8TOt2FXPeg4q4zZ4pYxn7Fxh
         j4Y1l+HR20GKopl6AjOTMk5Yon7aL642upd2Y3NkKxbTH29dqH/yjW/d61Zvc6luBXlH
         sCV+ooonJlzycs7t0lkAVN1DlSMJlLscMRQaAXYp8wctUthSF3LieU6ATvced6E7MpI+
         3gQK8YuYpTuadVNpldRQvokFJk4sQWHw1ZoS0Gx79ppNsEuTTLqK1/PN35h4FarSuqcx
         gjeogJRcbm3cH5fYqswcADzqz7KlHM0j+efA8Td1m4Fik4/QyJA7TkpZnleXySv4ChUu
         S+VA==
X-Forwarded-Encrypted: i=1; AJvYcCVDzdxBumoohqol6JX6PaXwMZIjM9DrxtruIsV9D5a4ph/IJThhhZ4u50aSXxZxoGBM+pBYdiqRVPkD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/bAKJich/DRy/hcdrZm2TDk9a8uHmXhcSIz7eq6zcpujfa4bc
	ryG3zVMCeiksbDXxs6EPj01ZN17z4SUtPFQfOMxtqznwRJyrPlyzk5fVoM8vMQQ=
X-Google-Smtp-Source: AGHT+IGDvMwjFCEIq74iXP38Q2qvOd1Ap6PuvMTjHWrmmX+7zhNUqX+2/u4tPlcpyyq4g1ZnXztWEA==
X-Received: by 2002:adf:ff87:0:b0:37c:cc4b:d1ea with SMTP id ffacd0b85a97d-37cfba182cemr2528511f8f.53.1727879591603;
        Wed, 02 Oct 2024 07:33:11 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:23c5:7b17:f5a4:f41e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd564d5b7sm14180124f8f.5.2024.10.02.07.33.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 07:33:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: aggregator: simplify aggr_parse() with scoped bitmap
Date: Wed,  2 Oct 2024 16:33:10 +0200
Message-ID: <172787958675.72970.2473245220175622074.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240930163207.80276-1-brgl@bgdev.pl>
References: <20240930163207.80276-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 30 Sep 2024 18:32:07 +0200, Bartosz Golaszewski wrote:
> The bitmap allocated in aggr_parse() is always freed before the function
> returns so use __free(bitmap) to simplify it and drop the goto label.
> 
> 

Applied, thanks!

[1/1] gpio: aggregator: simplify aggr_parse() with scoped bitmap
      commit: 22dec5aa596ef805cccbcd3fbe5ebffbcb4fa559

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

