Return-Path: <linux-gpio+bounces-16518-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1CEA42D04
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 20:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1817178313
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Feb 2025 19:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51F3C1E5B8E;
	Mon, 24 Feb 2025 19:50:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2FFv3X1d"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF8D1A5B8B
	for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 19:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740426628; cv=none; b=VYWmPJIXsvx/zVmV3ac+h8XPd6zqRNoE0vxks3rT/SVnZqsiltfzvwS7VsIqwRfbBZQhHfwiQ36gfPoeRfEzAdtE1oqR1j17b3vdosPvDCzlnugTlgh667PZ39/8sV35b9qIpj0NDd42oSdhP/kZZoR+IpWHrbTtZrhDdOLaXjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740426628; c=relaxed/simple;
	bh=Edth2VWVcL+GjsEVcws8isbYUTtJY3BgQThXqgK4CI4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mT1aKKsj/x4iJuxmYmvkZQmnCsyPOP+IRCjW7YAHlaph5fnZFIHgr0MHAnBCUzUprX17tOYaiCRQyq9I9aPf4zI0ttNfUPHTTkZ6cSpL7oXZD7eTbfIqQF4/pVTAGsBEfFWzCMrGQHnU3LuOaeRbJiaWKIUdK4f4GKiBX4hrHTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2FFv3X1d; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f378498c9so4720848f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 24 Feb 2025 11:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1740426624; x=1741031424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L9+hwLdkesHaCpLTwGTfreJKZNomNLyAPfa//tZH28c=;
        b=2FFv3X1dx5yLYCKWON1qWQcNgXFizrpfXvpz/XyhHDfarLrrKWiMtJnBnysnASVNWr
         rIjqZu5o9CQ+TN7D8NUcZjgTjZqC829BZ5BkeuuGs09uJnw3bCpMOSEDHIEFTwLQoDyE
         EpqTfFpEXDfMLMXsnmxOcyOdkr78kau28yhFESJw1RkRqcjxjrTgvVjk0UiEwUCH9bki
         DzblBmT3mB9OhV+CC5bpD45vpDwRWIBbL+36BcXhKr2yOscLQkOpPZTUs7WUx4CAnkpy
         +wSHr9qFehA9a/Lz2y6V7QWB5SSgDY8ndpgaDDSB+ockylCfTrpZyfCCEbhMb8nP47lb
         j/ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740426624; x=1741031424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L9+hwLdkesHaCpLTwGTfreJKZNomNLyAPfa//tZH28c=;
        b=wu22glTwN+A45xkWnl3HM8mOsQ3EinR/9s5RfXAATiHqh4Uxu9X22VGKge+WA8c4GX
         MP2nGTiQzm1YBvgXanNrXeUYKclSI4moFAnvWv6AUxGwdH/jVGkht+W5lL7LDmUhR3/g
         Aus0pqRvKOqdNboCC3vFEVCsKWz6oVg0XmBsIYenUaZSNT2uzHzVyS/KE8bfIgjhdp7m
         QfBo1ocCE5R6iNX4Fk/k5x9zJxMLXf7WrEz+EVNa4l53xzbhBiILgYljqHhaLALDCkze
         g2Ju0F1Y0uai4R24WK+2BUWf0GjrwWIQCZLrLTNi7kGPS6Y8QQxDhinJ2NiARXr+IvD2
         cxfw==
X-Forwarded-Encrypted: i=1; AJvYcCXH9yRzJiNWNPPhgfwVkvx7pzvrb8D7Fl8GM8wFXiuUmqJBxqxjxEB+r0bkFhthy3sm+OFLDMPWInno@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1V96o64MWFjcGdWOvYnexvlnaDHmsgmZZlQCSoWX8g00ExOBd
	K331tbFPCHR/sajUiaMcPUJMpMKr1dMt47gvm7+CfWqQU/jo3D+fbvYUJhs6qlU=
X-Gm-Gg: ASbGnctjcJrb1QTIY//4BUnpjzRoLdUFVtShVZoSoWsxsm4PR8ZK4p/zQgxRVNR0A+q
	imTlZ3hFagptgruolUy6iunS1Q0C8rcd0ZbrnwT/EiFANF5faJr1CrPmX0fm7A/qdH/ox1t+DuF
	GWg4CYcEKrHk7Rhu6A1qgqerA+LBBwhw1INdHWCZhIlyYwehD5NLE5VKHPhdNiSwsYMdwlwGrfJ
	EweyU5Iy2WPw0smIbWWtPtYsUewUaiPNyFLcFXT0XXtfzzVaHOMn9/1hffLAHneyUFMw7mOkGqK
	gUVR2usL3XuOQ0+9V2TmGqEy
X-Google-Smtp-Source: AGHT+IFyM3bVwnZAodvVkV3LiEo56tzMFahJhbq1Psx/DtYCXKVCQ4Dxpkxfi/9ZT236MmccVMOpNQ==
X-Received: by 2002:a05:6000:1373:b0:38f:43c8:f766 with SMTP id ffacd0b85a97d-390cc60bb96mr371279f8f.31.1740426623515;
        Mon, 24 Feb 2025 11:50:23 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:eb70:990:c1af:664a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab153dba2sm1315295e9.16.2025.02.24.11.50.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 11:50:23 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Johan Korsnes <johan.korsnes@remarkable.no>,
	Bough Chen <haibo.chen@nxp.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	imx@lists.linux.dev,
	Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 0/2] gpio-mmio: Extend to handle pinctrl back-ends
Date: Mon, 24 Feb 2025 20:50:21 +0100
Message-ID: <174042660990.65481.17407135211920816325.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
References: <20250219-vf610-mmio-v3-0-588b64f0b689@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 19 Feb 2025 22:04:32 +0100, Linus Walleij wrote:
> If we're using gpio-mmio with a pinctrl backend the
> direction callbacks need to finalize their work by
> calling into the pin control back-end.
> 
> As I was made aware that the vf610 driver was missing
> only that to use gpio-mmio instead of custom code,
> I took a stab at it.
> 
> [...]

Applied, thanks!

[1/2] gpio: mmio: Add flag for calling pinctrl back-end
      commit: 2145ba374069ee8edc9d29c2a6b56fe4a28a6e2d
[2/2] gpio: vf610: Switch to gpio-mmio
      commit: da5dd31efd2465ccc9a70a85bdc325e394256689

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

