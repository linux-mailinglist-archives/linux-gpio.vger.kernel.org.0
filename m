Return-Path: <linux-gpio+bounces-27965-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90957C2C63E
	for <lists+linux-gpio@lfdr.de>; Mon, 03 Nov 2025 15:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EFDE63BED3A
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Nov 2025 14:14:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CA8C2F7AAE;
	Mon,  3 Nov 2025 14:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0MmbxGZi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6986C19F127
	for <linux-gpio@vger.kernel.org>; Mon,  3 Nov 2025 14:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762179260; cv=none; b=lrP2P2tG9zgL7dxqGBi5zUZ1NotZVNOaIaoOHkGtup8633icXbcExXLQ83EqhP99lWvTcSRwdbJbwt7Us5xVem6IagAPnKARXLr3j4v8ngRQtBL68rimQ73w5l61xBmWI1zfChbXLvCTdqObcdc+RKfEaOqVkrUlATsfwJPeYWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762179260; c=relaxed/simple;
	bh=qNpCvuLCPjVhSPOY/TTr8xx/nFAJiYYYEoTJa8eEaaI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SaO3QeLZwKiJIztG7xYrAUaj+m2Z9ES/piou0Tqe94BNgb+/vTXs4V6W8DFv8kbNxKgDCpdl3FmjKCajYDIGYM4r86+68BasrX/DMNRD+ltKdCI8C5lH+BVVSHHcZ7dj3x4HvzVvtz0gkbB0bN4+FLa4cG26lx8j0Ml5NHfeM24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0MmbxGZi; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-471b80b994bso58264655e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Nov 2025 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1762179257; x=1762784057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EoMAIDiy80JlZ2DMoz5nEEW7dOP5ZblOtmfc/TQFMxo=;
        b=0MmbxGZi13Xt0Gijo4wZKWclxbyoLYC+/bfMtIgewcYC3H3i1Pu0fhPprY5+wPBwyE
         Q1Sw+Ot18WOUk8PKIgJ/Wv4JDKoStxltKBRHR9KxKuagbcP0pchNeiI7odxE1KFRL+Gz
         rTEOuqa2YCz/J+OX70vPRv1CEbYS5oUZ6uKNU4C6jEaf1to5W9Hj2LXgxQ1bYDYQDcIe
         yFq3ZYHIfai2lZiMWWkRCsO7rEP5mOzzyuap0FT3FNuYhVJqMpXArdqAoQXbk6GECMyl
         qMURQMP4x/NZK4DWe6k5fp4GVDbtYbm6sYee8RtcPYnR9Bu0xWRa5cjcaZw2IQ87kANM
         g4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762179257; x=1762784057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EoMAIDiy80JlZ2DMoz5nEEW7dOP5ZblOtmfc/TQFMxo=;
        b=BdopctcprzJwC155xfAUI5Rme3eH4v1/cUj1y8dg4K1NFFGFcsxOQRpBmqV2tokYdY
         nQ2ocI6hn1fgt/gBUsZUKVd+DOSPRUCOnIPVwPX4SvntQ3a8QtpGznTZzRyGMauceDsP
         ano3smEe1oBZjSL5XLEibKWCUpzh8cLs3U9InJaGD/J56Amd66bkoJQq5UENeH+ha3fp
         b1yXF4JYb288pKMDdAf85CpE0d3t/2koLd1Jo7IDM5rapdlLJAkx+S+B7lEyrvi/arUA
         ENbR6rUUKvM6NkgpEqORXvePHQQveSWlWle4fQ+kfDEWzBHLriwKf10En/bgnDgDB8Jt
         pJlA==
X-Forwarded-Encrypted: i=1; AJvYcCWb8zDHmecpiY24iDTS+z17hYqbMzwM+NukXId2xoubm/Ml+I/+xpEP6RlqVUXmyjUROPVVaaFBov1q@vger.kernel.org
X-Gm-Message-State: AOJu0YxQaV84EQK1zzwCpNQzNb48YZ3t0lhaENRQ1db8hrZ8iQoBarWV
	OB+CWRB2YketqWNFayOiGCEHW0W3k+8ISq27x/lRDpXsFyjH67oxSssDv+8lM2YqS74=
X-Gm-Gg: ASbGncstP7RIIt4cYHh5kjvY2/IDxUBNYiMuhIMzLSr3BpOWY9+18+QqDf4T6+F1ojF
	gKH0BGjyHDGxpotX4quvKu/agyrsciJtzY70L9CeyCz+JkAwRvhqMpRnEcRIXmkyLTGR5feWEHU
	3Vo6ukbKksaMQYPhsQk50QvCmfC0N9HcX8tLvJpjkH6Psx5ao7G+IU5h5Gbz4dyseJjwinwH85N
	eJWYcd0LKa0l5/okSQ6RHDmjkavOiut918KFksB+Qgj+UgJgSX7XnTWB2eom7NgXPQ9kudvh8iv
	C7VsNzqEYYFzMkFtF303tXeXfxxJr8+5xBeRM37fhoEzYhfXDVKMHS5D9Hf4KFw3U4RYa3evyW2
	GghYhMODYjyYxvUO0XcKy/3m17ShTDJwfkhwTY0p2vXQfKbIg2Ym5WpnhU1H5JT+9pUQoPw==
X-Google-Smtp-Source: AGHT+IHLTxJUWh2BXzgbxjWcAhT+fbvRofGiksQw6Mxx2/kQAdhUW2RWaozukFUQgF4dPtsxkYVg5w==
X-Received: by 2002:a05:600c:3548:b0:477:171f:65f with SMTP id 5b1f17b1804b1-477308aa6a1mr118209365e9.38.1762179256644;
        Mon, 03 Nov 2025 06:14:16 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:e6eb:2a19:143f:b127])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4772fc52378sm86531405e9.6.2025.11.03.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 06:14:16 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: (subset) [PATCH v4 00/10] reset: rework reset-gpios handling
Date: Mon,  3 Nov 2025 15:14:12 +0100
Message-ID: <176217924320.53912.4328025839514313502.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
References: <20251103-reset-gpios-swnodes-v4-0-6461800b6775@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 03 Nov 2025 10:35:20 +0100, Bartosz Golaszewski wrote:
> Software node maintainers: if this versions is good to go, can you leave
> your Acks under patches 1-3 and allow Philipp to take it through the
> reset tree, provided he creates an immutable branch you can pull from
> for v6.19?
> 
> Machine GPIO lookup is a nice, if a bit clunky, mechanism when we have
> absolutely no idea what the GPIO provider is or when it will be created.
> However in the case of reset-gpios, we not only know if the chip is
> there - we also already hold a reference to its firmware node.
> 
> [...]

Applied, thanks!

[04/10] gpio: swnode: don't use the swnode's name as the key for GPIO lookup
        https://git.kernel.org/brgl/linux/c/e5d527be7e6984882306b49c067f1fec18920735

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

