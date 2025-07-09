Return-Path: <linux-gpio+bounces-23002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B20F6AFEBBC
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 16:23:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DC9E95803AF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 14:16:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B629B2DCF7D;
	Wed,  9 Jul 2025 14:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cGcOpINC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29922849C
	for <linux-gpio@vger.kernel.org>; Wed,  9 Jul 2025 14:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752070578; cv=none; b=TcqQQfSpCKerJLoYV4XVHcVSZ82ZebYSG239ymDLTUjkOOOyLlA4RVVTywz+HhI2CPH8ZqjjLIUH/n95U1eB3OQ0zqxR4BsFFVMDQmdiyS7pryRhzoje5VlHj/GMtVNaF64Qmuo6dl01e4F56GzqrHBLGyVmwspcllSzk7Y1I+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752070578; c=relaxed/simple;
	bh=bCzRN8S3TCHRxDuy4CwuHetr2WFx4Yi7nSwZiTDU7Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGZDH3p9F3c6gnIzgYZYAkEzDklm8XkoxJzNFqffJvui7f0lbdUYtgFlNNMwWXjEjFfeXNCoIFgV8y/fRbK51RKEF0crLe3NEG7G/dL5RQFN2YeQt7BGtStiYSReNW4W5PEq+eplw08KeOs+KshkKpNZkH7KbNeS/EMRWYSpMe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cGcOpINC; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453647147c6so53187135e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 09 Jul 2025 07:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752070574; x=1752675374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7fTZikOujWiw19ywzSbP03LTsL+RF/3zlbom3UqZwY=;
        b=cGcOpINCBOHe21pcOOWIZQHwyX2+MOMnqCtibGQij5uRl2DaOKuLSA3SzpTcXJnq6F
         unbuhaeNwQNDi2Z5Yl9X7bj/wrt3rpf61cWLvNWH4Pnm71tJ79gN81NIsZZSDJGAioKi
         wqau9lBnqa7mM5ewJ1k0+EcHB3ZNLQEN1jkEY8Lg8Y9dukpreF5u9DMJnp7mdj2KTn4P
         zKOXqXXhUOudZgzsEiZjyqdcnNUpbeitucRuHzT2o0Cm8ArvTiyGMbCthPiIjm/ZlDwN
         OvN17gR6yDjuJO5cYrOd3Z73J7BnFlETDbwQd1RGbZo3uKzPrUpZG3q6kupmO9xkLg0n
         f8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752070574; x=1752675374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F7fTZikOujWiw19ywzSbP03LTsL+RF/3zlbom3UqZwY=;
        b=F9iMPYmV1QxF/tHreDAC48ONal8A71MIlUX+ZrU+k0qHZbVwx2GrBU7BSE/yXKIXhb
         hd/CcLIQLpM86hRcK4DijTfvdBSWRfi/HmhgZNmJlOSckYsQbrRzdIoywazaPciCPe5D
         9RZ+jPYaIQgzBRIjeCA+97hhWRR81HIo+8TDUyAyCGI7boBJc0OWeZnQ4lKIz83bZ5yC
         KFcG6Q3K9OhG3Cg2JQ7DpDGeoqUqPr2zgVY+r3UAUnGvOkGk/R0QMje2MZuRxjfVnwJj
         a2olHe76ayHPMC/7TxPv3Ay0ns4LoApwx1T0CIIlC9KaskU93+9QXtmHVuXDtNX1fJxY
         RSFA==
X-Forwarded-Encrypted: i=1; AJvYcCUZt/dYVdpvs+x5Z/1HKM2GD6WzcnMAyBCxbPAor0Gh17eFBXi2bhXryEpBzpnH/V3FVJ5E4LxVzxAT@vger.kernel.org
X-Gm-Message-State: AOJu0YzUxmWKwsnI/xtZRwCM2dKQgRhGAh60Pwdi7F4FOWZ7SfS1ZXqm
	wZHhmeUPJiGZi9d5UFqajI/W4VtVemVZjgSOXQxQ/b1jpwvqu/XR3jJv7FyzcE+7xg4=
X-Gm-Gg: ASbGncv2NFx34Xe2L3t0vQ0KiZCLd3WsR+vk+vyEo+1zs60SXp+n1bd7tmwniMBf4Lm
	AfGuuGRvnLxW/DTpxazXZ5TCdaaMPp2ZN3Cc26qtnSrjQ9p8/Tct+XbeHTAzJbH2hrZWxJfHmjj
	QIwO+Bg6V1Pe0du1fkCy5efdcJVmUCUxYa+OQ9LJx/Kijqj5jqduVfpSb2+mjMvqxchqUUayh1R
	Hf70Y6sANPMBziORB2239ZvnQTUWja5tCwHBWScgGglDb8rJzA8qkrLEd5RlxHUr0w+Jc9sN6SQ
	onGxkSNjq6R+Ag8RvroaGDKrg3lwr5W4UJ1D4xyembUJkL1f02/b89R9AYyxmPs=
X-Google-Smtp-Source: AGHT+IE9xU0GYH+akZYYqsxYhGGNtV2upbElAuXDfPacu28ln78ZHeuNA3FnnHkhTjkuDg6yqizWdg==
X-Received: by 2002:a05:600c:4ed1:b0:441:a715:664a with SMTP id 5b1f17b1804b1-454d53a0702mr24546265e9.20.1752070574163;
        Wed, 09 Jul 2025 07:16:14 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:b04e:cfc4:3bd9:6180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d511b43csm24218865e9.37.2025.07.09.07.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 07:16:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] gpiolib: of: Initialize variable
Date: Wed,  9 Jul 2025 16:16:12 +0200
Message-ID: <175207046834.40307.8526281080348815423.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250708083829.658051-1-alexander.stein@ew.tq-group.com>
References: <20250708083829.658051-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 08 Jul 2025 10:38:29 +0200, Alexander Stein wrote:
> of_flags is passed down to GPIO chip's xlate function, so ensure this one
> is properly initialized.
> 
> 

Yeah, looks like it's a bad idea to pass an uninitialized variable several
levels up the stack. I improved the commit message a bit and queued it for
fixes. It has always been like this so there isn't really a Fixes tag.

[1/1] gpiolib: of: Initialize variable
      https://git.kernel.org/brgl/linux/c/d563e7f95c933816efe531c3a48e22bc099c0f55

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

