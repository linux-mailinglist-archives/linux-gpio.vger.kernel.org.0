Return-Path: <linux-gpio+bounces-17147-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F800A54D8E
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 15:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD4A33A8901
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Mar 2025 14:22:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9001624F5;
	Thu,  6 Mar 2025 14:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nrfZaU4I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899B81624DC
	for <linux-gpio@vger.kernel.org>; Thu,  6 Mar 2025 14:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741270941; cv=none; b=K0aVmPOTsH1Zfsim1D8tWjGG9eDiJ35bpJi9uhR4dItzucmmEm7wSTaxJ01eWOfd0aMNnVUFyRh+gJwzTtK2LHPYfyeHK60xJSFSBrBeDry2GWQx6kdUI+5ullQAjRM4Bi5B/WYrkJWYBNQIEWtfgSIuIA276g00FAbT3PIq0qg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741270941; c=relaxed/simple;
	bh=VFbNjEz2+/wlUB7vGFfTzUXZhcULzXWdvo9/ByZBeMA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tq/Vr2wpqqfdb2VbOwS4p5KItLQLaOEuezT3Qx765Co3hSk1roWMxNt7NkUAvm32dYilrpwIA6Izl8fXStgbFJLggHBUzWc4WguRM2krsQ6BDCNlaqIAvxFixo4YjCgZVqUtpJ7AI0tZx5a4tSHWueD06PdxxiV7TqdJ32SyniM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nrfZaU4I; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-390f69e71c8so508171f8f.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Mar 2025 06:22:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1741270938; x=1741875738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxWPSzHzc/Gn35u8MiTD5Axzok0afEcoR/THf4/r/lU=;
        b=nrfZaU4IkHjsa3NAaXfdf0UPDhMBHJVIxY2nfxvfAZrHgcCkWVuJDZV7nFJ1KVtmgE
         3MsE/btBochEru7zx8e1OLUjnJ685A1F3PvocidmbRqwGjvNF76rG1lQdujpsBn+MRqD
         lMc+3wK4hyPcUInz7qzt3JbfTAkMgvavWvI629Trhtsq7BwspSdHLS0k4JJoE7vR/aIP
         JuxWTXvGjAUyeyzwIPmzElSQwWjxMb0+SXZ9rsn3SfsOqVUIG8h0xFLx4nBzyPZRmyj4
         ZPzdqybnpv6eQZxCtOJuvxpFj2lAbS7Daha2jftQII1LL06CkInfmjm2xSXJp/iOBd4v
         wAEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741270938; x=1741875738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qxWPSzHzc/Gn35u8MiTD5Axzok0afEcoR/THf4/r/lU=;
        b=FKpnOqMKrdJhXXNHORtBab76krKuuXbEKyXtqw6+HrXyu4+rt9BWLVkTZ2NTFMyzKN
         HNlHFdikynfxniGkHiElnUzHCk0MDo8JudsnhoXugTTmaNbd/bu2oEXPW/Ub2n8sKanh
         3lh7d7O0l/cTzzX+99MKAYNCQEiGX7xQKP7HnSusf91ekNJ06qoGEUaiFMdq4X7TKCkV
         HgFA9ndtTtgUEmjhgrWgzddcuspO+wUVaCxeqSK+Vjn+k6EZMtpNOXU8B7KIJIk1xTa5
         oBuX0uo1GrsewziQEhzLcoR4b/PrZt+jwVX5QaM4MNV3knsKoJQeT2VFmLzft4uXz+hq
         ugbA==
X-Forwarded-Encrypted: i=1; AJvYcCXyqd87AeT+RiKZR0iFW6wG9u4kmy53oKiafXKKlHT0hC5COP6LyXJsG2qZ+5Ij8B4JQjGtuCpq5T9R@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7lWc99+itEPARfcS6NEHBxCoNWxP2YlPNF8+WBRA2zvJvgZPE
	sdJ7jVZcDAbgtWtaniQNdheVEEIsaz2pibyqEac4LZhLGY1vIMfJ62GtnGDWgcs=
X-Gm-Gg: ASbGncvWIi8ieNSsvP3WvCY4Iq2pe34ODmQMsZRzIHPdOBDaJwSUOveGUYt8wLj9B9a
	3+9taTy/JLzRv2Acolj+8tltJF4uITWGGeVE+NPpxAY5L5UfjF7JescCQSSDFTuKreOSpZ3tsy6
	paCMlXmvzRoToU9bKx7jurjYwq7Vs0c8lpglVCnxFSwEa8QwWF6ItfJWozxQcnLVdMKZ0JaOO73
	qHvDNaXc/+NaZA94wDU1EljlUIZedMZvathLWPngDH/VwV3CYnos3bl9XdFow3LKPjG7D5WAKdr
	mJJRhISmdI3ET1FySXWPnbepqxV6warHR0ehyz2RKPs=
X-Google-Smtp-Source: AGHT+IFChfeAEV2PHdYq8EIIGSzRRpBIfJ68YMIUl/Po8biGKN3BXhslg6JIN0LNeFsPkfFqsFEoHw==
X-Received: by 2002:a05:6000:1f84:b0:390:e535:8740 with SMTP id ffacd0b85a97d-391297dc61dmr2919324f8f.14.1741270937604;
        Thu, 06 Mar 2025 06:22:17 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ce13:b3e4:d0d:c6a2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd426c01bsm52206175e9.2.2025.03.06.06.22.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 06:22:17 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Simon Horman <horms+renesas@verge.net.au>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: (subset) [PATCH 0/4] Fix missing of_node_put() calls
Date: Thu,  6 Mar 2025 15:22:15 +0100
Message-ID: <174127093376.41843.17930645720992126922.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com>
References: <20250305163753.34913-1-fabrizio.castro.jz@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 05 Mar 2025 16:37:49 +0000, Fabrizio Castro wrote:
> This series is to fix a missing call to of_node_put() from
> some of Renesas pinctrl/gpio drivers.
> 
> Cheers,
> Fab
> 
> Fabrizio Castro (4):
>   gpio: rcar: Fix missing of_node_put() call
>   pinctrl: renesas: rzg2l: Fix missing of_node_put() call
>   pinctrl: renesas: rzv2m: Fix missing of_node_put() call
>   pinctrl: renesas: rza2: Fix missing of_node_put() call
> 
> [...]

Applied, thanks!

[1/4] gpio: rcar: Fix missing of_node_put() call
      commit: f5aae815b5f7e79460a724af4debfc9abcac0cc3

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

