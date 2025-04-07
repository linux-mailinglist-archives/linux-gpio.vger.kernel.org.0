Return-Path: <linux-gpio+bounces-18320-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB45AA7D6EE
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 09:56:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8790F1889538
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 07:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE64E225A36;
	Mon,  7 Apr 2025 07:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BwPSTjes"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DBB224B1C
	for <linux-gpio@vger.kernel.org>; Mon,  7 Apr 2025 07:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012590; cv=none; b=PWAgEEWYrf1aqx/gIBY+u72H1szdt7ceq549KBXfQGpmSRsho7jf6zlzpJ0ry4dUSd2/ZCUCUtJ41Ri+VOwDa1npv07yA1IlDNpj2OHw0uwWYrTSqGj1nU1bgoXt51qblxUDJFIuJJslKFFr7dRYBTck3EBl80PpPfxvv2Pb6+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012590; c=relaxed/simple;
	bh=PbY2iBAdM5uxUm/Yc7ACLFge/aGVZH5yA6UNUuaJAC4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NHG9tsAE0AoQIwtUXtNuM0C4AaTImAUC0VXTwzlQA5z1ZcjYG49VKD5qRbeCYB3lmGDc/2WQOnmpx7xxjOD1idAN96vtX5vQ7HujplJjQZmYuo/TMAlMpe7HMrepJWNvhR7GeA8dIiA81F8yRwGyHiBjLD4MzRxvZvJz0kXBnXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BwPSTjes; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4394a823036so36604895e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 07 Apr 2025 00:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744012587; x=1744617387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gk3PDXrCi4i7kOY1hv+ABXdA6tfPrmWwO1BXasAm+5Q=;
        b=BwPSTjesCiFJDV/QiCsU2xVJhnireEBjb7MLV2nnQBCYgyH1xy9NjwwuuaFDa0eEWL
         9TZ/D8mSpqAF5kdTRlKjL9vZZVTHKZqOYUYRDkYIKNn1h8phKDKcviFjH3fkJwLwqZeD
         wMHAGUmrK1Q81hhEitmUWrbRZKoSU3ZAOM8adPkm8PxJAwQBtHY6fySfn+rZKF11yxnM
         kTOd4lv16tL2dTtNYW33qK6wQWl/pmxajs0cK6LM0fksVwc9GHNS2t5Rf9gBATV8Futm
         ruUHSZbTwu2fx8Zk8fWWnDfxlompsXzFBdS/uT6cxTmcSK47yCA/Bo9uZ6zQuHSxYLEN
         BfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012587; x=1744617387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gk3PDXrCi4i7kOY1hv+ABXdA6tfPrmWwO1BXasAm+5Q=;
        b=PJOy19NHBkEVXyjTd+JsKtkDR2C0StCfghd+UYtqKb5iJ3bzT2OdgUOy8X7F5U80DF
         9eqmuKW0AznlnyQ9OqV7TfChuixD4HuXetUTen3e3WJCPJNGCzQgwXN8rJl9sHrY46/4
         tgh7EH274jqCFhHAH7zyahjTYP5mozffwlYFBRcyPPdKaFd5JziTxTcPr/FPrV8tJ5oP
         9fjdDBWogzQT6W+SdLmOYd5AjWzx/WKavKxR+RNdclcPQR7txxOLeem56WehlnfcFqAw
         9dt/qcs2URBMNtXnn9c+bXZ1G3FeiPB6VIGRtaQFkEV7+IS41gq/0Ony74dPFJNAbgwE
         I1Ig==
X-Forwarded-Encrypted: i=1; AJvYcCWPc5ULfZmGhqrjSfzsW3cN/Hme1/hA0umpCDtp4kDAPqPO2FdRfncSrOUWNOBt7tzk/xcPd2fpxjpC@vger.kernel.org
X-Gm-Message-State: AOJu0Yx69HCZLfTHsgTE7efxzD05zivSJbmigGHEvEm4DgXaqxdZZOro
	ViEzImNmCrTqu2T41OvRVia1gM1XCtOdOFHFAx8T95o9NgeJlztBhQgD/3dDY54=
X-Gm-Gg: ASbGncsdO04P09bfCueLbc7wtrJnq6b68zSFWzo+cAODFwv+UsZMnVKSc55AhOug75t
	ugDtdnei3j92n5XsnxdMNmQo8mv9L32ezloaHZjHKCZj5AYHmdTV0x3M8k3muXgNZpkMtA/f3yS
	KvnHZWZgKlXe2B6CvoSuCi1x4Jy+ZFe6FyqVkN3c1t7KYV+CIWslBVh8LdFDSMweDB6Kc8WlnYf
	EChFRXtHF4PeCnu8aV8i/X4KZBqq4bs7R6VH1evvlzrQqwldeELfYI/ba0iI+p37no4saaJtJUl
	KlEsLSbi+87EMuqa3slCoaR6ngUILI1vQTW4FIhQ+yMLmjlOsiy1h4c=
X-Google-Smtp-Source: AGHT+IFuGAUYDVlIZ8EonvKfI1JZejqOAN2FYZFOVuldP7Sk6j7fmFby9VeiU0OPy9L4I7Jcqwq13g==
X-Received: by 2002:a05:600c:2157:b0:43c:f87c:24d3 with SMTP id 5b1f17b1804b1-43ee0878e6emr46890815e9.20.1744012587467;
        Mon, 07 Apr 2025 00:56:27 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a3dfsm123483685e9.4.2025.04.07.00.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:56:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v2] dt-bindings: gpio: pca95xx: add Toradex ecgpiol16
Date: Mon,  7 Apr 2025 09:56:20 +0200
Message-ID: <174401255666.28656.10157337361652941194.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250331072644.17921-1-francesco@dolcini.it>
References: <20250331072644.17921-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 31 Mar 2025 09:26:44 +0200, Francesco Dolcini wrote:
> The Toradex ecgpiol16 is a 16-bit I2C I/O expander implemented using a
> small MCU.
> Its register interface and behavior are compatible with the PCAL6416.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: pca95xx: add Toradex ecgpiol16
      commit: ac7d33f3899762b5d0c90a51a96ea11b6d7660ba

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

