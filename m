Return-Path: <linux-gpio+bounces-24064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2197EB1D3C7
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 09:57:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4DA19163FFF
	for <lists+linux-gpio@lfdr.de>; Thu,  7 Aug 2025 07:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 845F5244684;
	Thu,  7 Aug 2025 07:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="jgCUl2bT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72A2A231C8D
	for <linux-gpio@vger.kernel.org>; Thu,  7 Aug 2025 07:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754553443; cv=none; b=bzBEqqfmA2UWyXv30/nWDnZwRKT5sXJDdaG5IPPGAeSDocu3Hgo+LUNHqXJvVEJhiPDXlWvQTve/Ldg46hxK56A9xD1Z7673IlM5AGKgEevPS6bAfg2OCC0LRERQZpxqboJsvAKEHycy+qf+OF/7gkdneGnepQTajgCOzOFOxeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754553443; c=relaxed/simple;
	bh=vgkfpdwJ4jw4QPMZ8xrlzKyL8qOR5t7DvsVO97Z8Mvg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=a5bQPTnZOe+3ioQ94jKem6Ew5j2msllWIwWdu1cUmYkNLcqvdlUk0c67L5fOBDZDLA4wgmN/7XAoXQ3bH3wOUv82KoukoXk3dkyrsv7DtfTsRcmdnDJlacce0mfsnOaEvc1Bl7VF1hDedtkuL8HwAedhPKsmNK/o8uXXgtrfsNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=jgCUl2bT; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b78bca0890so299012f8f.3
        for <linux-gpio@vger.kernel.org>; Thu, 07 Aug 2025 00:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754553438; x=1755158238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SfU3+JLlOgj4XUuWyXL62GCcWpurAz54I0DEQzkcox8=;
        b=jgCUl2bTHVqAh44Tw/v0vqLOj6ZvfLpVWe++u4kHN/wF8M9CHlYx9PTSNZnwTgHkuY
         fT8mmYaf8LjlNIibY1c+e8ZOtS5s6nLagfypzrwclt4HRXH2F8+veBIWAeXlY0ZXDjmq
         oxkztSASvC0gI7FWh+WPT197Xnuh9kTf2/enBfDPbwYjh54N/SVs5oRrFEoeclQ7vkuo
         LR0Ag1c3jG1jmWXpvEkoLJfdAsWlmzD57zDwspoVYcW0wW2VYL8b3vU1Ku/MuaFQWvb9
         yCd19Mdmt7z+SBGqeSNJfxFKWc91bP2LaSYVSzld6Nh0gVzqu3VN3IFHGHVMWrir7RSk
         8FFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754553438; x=1755158238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SfU3+JLlOgj4XUuWyXL62GCcWpurAz54I0DEQzkcox8=;
        b=Ig6hQrzXFwgdOCtWVJcFBqtDGdjSAqwT2MZ3Zcr2pLrGauOtxIGiRtNghNmzJMvMva
         n5X4rgyVGaBKv4FlcMCWD5PXRf3Q9JBkcJd/Cu2zbLHq5Mx7M6V+R/e6ot5c9OX/NirM
         GZ5m+6eQieb7UI8kb0V6Wdqbpfn2oQPJJw2mH98vwJ52K+cHkXmJxWEPKBS79zmlocOp
         0PIY6sF1BB7hgrLDzKzCoA578IBLevoTU+ZlyXjqgS4ZRoCxo1/txi7uUbAK4FhbRe7M
         ZYtZHdHMQrU4nOfUJzRITzEspUqSN8l5Ov1eTgOW4pnpj2yog7TZxxZ/u38arGBGzBgB
         Bkwg==
X-Forwarded-Encrypted: i=1; AJvYcCXtg3b66vxfmy5C/6XL33jYQHuHXp5bv70hbsB4LXBNIBpKOWb0wwJYCQdN2B1HCs7SfIPFYenoo4AD@vger.kernel.org
X-Gm-Message-State: AOJu0YwIaPlktI2S69bO0jBcpmhbx47MOzAnwaM12deggxn30KYyj/50
	ibyDB/p5kv2ToNzQHh0isg7JDtHifVs+PqcCxpPgt5oMgbBYZww+m+ZimDFRL+fM6MI=
X-Gm-Gg: ASbGncsxJgn9k/OjTcxA5QXTmIracN0JOQUCKsGqLGkIyeEaPxm5AH6FNmdbIvXKYlH
	aIVO6is0ZmohIQ+1TBQi1R+l8RvTO5cEkcs8YAWPcVyoZR75vzPHKigsN1MpTQBs5unLFcHte23
	U6VEIgLUl1Ti/F0XPisY5xp8NBL8AZFbgRs1eyQajsAuM00eK/z+gQw+FeUsw7dRF44jn2UNCNP
	V8cQhIQqjzRSEBFx9SPa8H5m/hUaIX9POJXTc5wRm1c2QNA30GLaIpLw/GTOuRhwG+BqzIWh1q3
	f4s/o+YP91km+blr7l1QUN0xxnpiKN79GP1vZs35ytG1zWwd9IFz/0x6994UTRTeSUoABvbyBNL
	6KdPuDmfPe0od1LDYwNLIjfzFc65PxlNK7RC0W1Sp0xwMgpcpMiXCenldMng+T/hf0bokv/L5XI
	E2oeV0ymQ=
X-Google-Smtp-Source: AGHT+IG1Zkw/5s891kaO2uBzPkSnBXo2w2+ZGLhV+2clBzLljqoEFUKEehl54k7C+1ej3DQSWerCIg==
X-Received: by 2002:adf:eb83:0:b0:3b8:f8e7:7fea with SMTP id ffacd0b85a97d-3b8f8e7802dmr1563703f8f.7.1754553437672;
        Thu, 07 Aug 2025 00:57:17 -0700 (PDT)
Received: from brgl-pocket.. (2a02-8440-f501-4c26-fc12-1c8e-3b9e-e794.rev.sfr.net. [2a02:8440:f501:4c26:fc12:1c8e:3b9e:e794])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3ac093sm27069447f8f.9.2025.08.07.00.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 00:57:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: remove legacy GPIO line value setter callbacks
Date: Thu,  7 Aug 2025 09:57:15 +0200
Message-ID: <175455343159.5538.10394058883390003007.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250725074651.14002-1-brgl@bgdev.pl>
References: <20250725074651.14002-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 25 Jul 2025 09:46:50 +0200, Bartosz Golaszewski wrote:
> With no more users of the legacy GPIO line value setters - .set() and
> .set_multiple() - we can now remove them from the kernel.
> 
> 

Applied, thanks!

[1/1] gpio: remove legacy GPIO line value setter callbacks
      https://git.kernel.org/brgl/linux/c/397a46c9aa3343e8efe6847bdaa124945bab1de4

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

