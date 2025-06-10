Return-Path: <linux-gpio+bounces-21134-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC68AD2F3A
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 09:50:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 581563A544D
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Jun 2025 07:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DDAD280007;
	Tue, 10 Jun 2025 07:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="poqreVVk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70D0927F725
	for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 07:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541844; cv=none; b=Phphn1/Ks/I9THCviGvw41aIMct9az/+2O0FaK4Gz7fmRLtjNKobog/vWpgfW49MY2mkDQI88ADCfvwfsmpsaF2Tv3/vsxM9hW7z71vE6xMr4BwAgbQYOQVv5SozXHbHDfSXIq2+7ZhGnbILLLJrahPmwIAkmIOR0YEaXbTXWs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541844; c=relaxed/simple;
	bh=aylXY0fD9jtU9RKWhQdUU+HQSSOljGOWfssP28hVkH0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VOjm87DW42E1VA0vZRct/Ow0q5L3b1ojA+Na4InmOQiDCvNsqzdiJXnYOadJM1T1MOaC+3YBjQFO0G0OSmeaeoSCEHi0ISRCxFqoZ930zNddMde0kHoLcPtl1TvTSss537+DQfCEWxawV4r4K7bTUD+uyqkn8aVrjqbdGsXkUmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=poqreVVk; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so4261415f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 10 Jun 2025 00:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749541840; x=1750146640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f69urfFCSti5WMTV70Nc/FzGuVlpnkYrMDHZnd1PHVE=;
        b=poqreVVkK6eOtDf5oDViXIKagFYHVbtzu5T1ILzI0TmMQB3ro6EC2kzjY2Xq7zk2WX
         ek9dGcxS9A9hJxb37lXp6QYLjtIqgvTy9tlFuGXb3aur4s4/0sYhLig19IeBpJ2vZjw5
         /dJ53Ba6z8ITnJYjUkByf1viz482ZNBnSd3F65YrkyDd3jQRhupyE4E/PEfmqLkeGlYW
         kcEm6tguEcdEUVVzYdA4k4O6WE4liBUL+9fs5yan5PIBXAUjPSqvQlFoM8jcrTXrIK+q
         syCBlNvXHwCoM9EygsePtmD6KF5ySUZycnpTT2V648+Wsm+2NpUDn9LamouZkcny7llh
         d/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541840; x=1750146640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f69urfFCSti5WMTV70Nc/FzGuVlpnkYrMDHZnd1PHVE=;
        b=csC8LZfZfKvM3kivWBVficfi6vXGJ/sCFtb7Or9+3FAP6vMd2ruG2rSLd4baog+KsL
         d5ky2atN/F1YEdccM7AT9mbt8JgIcTjGgqgR5xDrs+JQp3KO+P+O4ypHV2dJO3TKyetq
         r8reQZ5TPXfObh1MhmX+zs3teqag7ydFjtKltp8OmLYgLg5Ltnk7NKfhRx285aNvvboK
         KovKFJmtg/1ESFZX/tPJcgfTroKLlpib+olG5WxK81UJlkNoaPBZnzf7oppyJYVl1MSJ
         nCcBR+N1Bf++5UNuQtqX7Qma2RtfU4nfO2BDmM0bTgdcpFVgcbgMQhof8iqtEhpVzJ8+
         SrGg==
X-Forwarded-Encrypted: i=1; AJvYcCUNM+AD/lUnL4cN5ww2sXwcbfrD5XzZd+adxG2/AOVdhBtRQOQqR7ckTx+kw4rk2Yjbah85cnHxc/1d@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ag5tJmzkySOxfl9myRFcbqf57ysKCLA5G9ZUpetXMP5b2WW/
	hxTH/sHyGzsbn3FETYPhawDczgj1Bm1TE364panlbpQokrrKBWWHHTwBVimTMHPigN0=
X-Gm-Gg: ASbGncsX2to+BBTJ48qW/EpJ0VPO8SNlJF5ffZbkL+w6FSybAu3YE8WMfe9FbmNO1nS
	FmBLcczdXdLjOtSaoiB+klmwIoSLkWRyB1lKuSLAn2xhj/PuIYX9ExU31i+E42y6/cCyTDH/MWK
	5v68a0Xf1mLW9XZq8zoLj6DuJQQgNcEddeG+xlIks7ZciTVQrI5NIO2KmQ8i4aziFC/P+qY8MZr
	IaM2gjVJBDg2FDGsOY/w+gLhSBQRFXUewYxLdfqy97rhR5Hdq2VZYXy2bfGokxrbnO+Ea/JwLcn
	+sJKw6/PbhipNr0HBReGuUhV1u/V1luozoNYHdUFoar2fJulhoiYNVRhfuq7hYMNsKxF0bQ=
X-Google-Smtp-Source: AGHT+IHJS5OltWlxcQGohgzSoeXfBjAAYsHVehBaI6Ajdj5eG5a7KBWerZLHZw0/esrSsUbeETCcjQ==
X-Received: by 2002:a05:6000:4205:b0:3a4:e5fa:73f0 with SMTP id ffacd0b85a97d-3a531ab51edmr12960167f8f.20.1749541839276;
        Tue, 10 Jun 2025 00:50:39 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4526e163113sm130617095e9.18.2025.06.10.00.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 00:50:38 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Vincent Fazio <vfazio@xes-inc.com>,
	Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Erik Schilling <erik@riscstar.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod v2 0/3] doc: add rust docs
Date: Tue, 10 Jun 2025 09:50:37 +0200
Message-ID: <174954183429.26552.12037557820886384586.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
References: <20250605-rust-docs-v2-0-883a0a3872c0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 05 Jun 2025 10:13:18 +0200, Bartosz Golaszewski wrote:
> While full integration of Rust docs with sphinx is currently hard, if
> not impossible, we can still follow the pattern we used for GLib
> bindings and generate the docs using cargo, then linking to them from
> the sphinx page.
> 
> While at it: fix some minor issues in conf.py.
> 
> [...]

Applied, thanks!

[1/3] doc: reformat conf.py with black
      commit: 1c4199e56b74162838a9510097302e3a79fe4190
[2/3] doc: improve the readability of the prefix variable
      commit: 4b779774dbe73acc15e29b0b53b548248dcb8202
[3/3] doc: integrate rust docs into the sphinx build
      commit: e4427590d9d63a7104dd5df564dd6b7b0c784547

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

