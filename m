Return-Path: <linux-gpio+bounces-23441-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 342C5B09D18
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:57:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C20B3ABB54
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093B32957C0;
	Fri, 18 Jul 2025 07:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="je4LupE+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A42D294A1B
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825382; cv=none; b=Mwq6+oRk5sUQmlUOaV8yTEGoS0djkSeV9FBUSlqOi/d3TLZ4/+lm+01LHgy2Nztgh52zJqxJ6QsqqwbewHuaJEt/ggyMraerz8ZjTJk7S+ToA3r76oEnlUaSefGFtw9YpA+vXUyYPRyIpBrNoh+sr4fT/joiZamKvyg6rA4ujro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825382; c=relaxed/simple;
	bh=alPVexbBxhry3NY0dUuLyiLSWqDYznmgxA4PA0hqC8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qo/3bPQfQHwE4bSWY5tTONPWkP83c48KlU6k9mAnq54wEZSWTDnMIsmkViuKdxl3y3QyK0SiCQW7zMSrftMyr+NfMNuuuDB7ZZBxmZtAm9YN/4ljlSZ2o1KTFG58v94PF/7LVgjv7lk4LQIuor+fLlLoy9sflpUaqVzvArLQcBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=je4LupE+; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1074807f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825379; x=1753430179; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ahNBqCLgi20kpDipeWAA9FM61/0sj5pfbYA2+06aUAo=;
        b=je4LupE+B138ExPFNmZJ3B6BBxAfvbc8+uKQIFyKd1uPr9ZXG5Z11eriUjxDnLF8+/
         otSAv/k0+1a9Q8wKwgY+2BUaE2qAH5RHxwrhOvLnCkqnc7tPHQ94szQio4Bdmg21ESW2
         5dxS+aVE2j5hEcRvJPpNqxP+JC7UCPML4NSVHTed9okUJecffSQSEjnw7Q7RIwFo0eES
         i/3tnPh7J5H8MUFhBrcjt4ogq2E9bdct23UtylCXKM/X74PbVE9SlKxRyof7yFGUfa1T
         qC/3vzaaqznJk7mb/401LI95PYEpXLbUnZ+7zhqsKWS2Bch1/SbAkwihC+/cFIemOjjo
         WJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825379; x=1753430179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ahNBqCLgi20kpDipeWAA9FM61/0sj5pfbYA2+06aUAo=;
        b=YzJ7HehPL6HRxGWf7Y/BRwbcbHBYyBwEh/cg9piu7VUfTSQOBj4bCWU2r/yku1F3Y0
         XJrOBNOG4Iy/PeuGtSS74bXG+lbWRw5EiYu3bMVEp7bbsNP7X/llgLa9Md54I2Cv9bjl
         CEU0bQx5xos24P1NkEon4g3McxawU366oksUFX848+kzksdCKSo4HuJ3YmrwTS+gdsbV
         fcqqj0MXo38zcxTebA/rFQ3qcluB6gqxFC/HKX+jKsLHKUYHwlY/mmQYm4zL77Zlh57N
         CJcS9EsqigNVSM30+FO7XFKwAYwHJAYh39CXbaiDttM0yqQzSb+AoH3lCIg9NoY+wQ/O
         rupQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLYXeXB0kfxtGPzwy7ghXRauHdojQs0bX4VHpOoTZrfGiHVeF2j3AihzKq4Lcv62Uzzk3HC0TlaIzr@vger.kernel.org
X-Gm-Message-State: AOJu0YznZUoNJR14S/exw82lvShHnjHnzUsh8Gd2fIyXSMVGXkgv4Vz7
	A0h0d3BXnpqYH5oumcChYvU9BdviiAIXBeAb2/h2HRBiAdD+Td7DJcO9pkCVBV045Ro=
X-Gm-Gg: ASbGnct/evJSjnTRS8PM8X2afowA4JLAJScGTeH+3oQSq59C3AOKVTONlzxQ+guK2K4
	azCt7Tc/8LHmwsg443IO+oDRYyWBvx2l9xVmIgZgFYZr8YCuzdREJ1KORX5NSq9vFvDi4vlk2tE
	LSFC9gPgCzdmC3zpbdYxyOTlZq5ZTecE8LhNCcJY03sBtNgwkQcemrsEd1NtLRl3Ym24n+CnH1u
	iYVdj0bMqo/v6YhyOIzcwRQWe5GyhPYWRnERKWyD0nUk8z6ic3W78fczwUGYvUvpJ9i32HwLr/v
	99VwhP/bMTOm4ws1MHE6pQPZevopFCb2Imw5EXdToOSF6hBnkOuHzi6mooBchOcH2eKeeScUJuH
	m6TmjgxTKmPONvo6MhzTr
X-Google-Smtp-Source: AGHT+IFNTTbzWKYK0ucn/dZcLBK1rm2Jfq9Njsqv0jifRb/BRMEZCeoWnJAL5EROj0k/HrXN7bDTkA==
X-Received: by 2002:a05:6000:178e:b0:3b5:f165:14e1 with SMTP id ffacd0b85a97d-3b613e98294mr4670874f8f.38.1752825379490;
        Fri, 18 Jul 2025 00:56:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert cavium,octeon-3860-gpio to DT schema
Date: Fri, 18 Jul 2025 09:55:50 +0200
Message-ID: <175282531512.45055.16195340693528031808.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202927.3012974-1-robh@kernel.org>
References: <20250714202927.3012974-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:29:25 -0500, Rob Herring (Arm) wrote:
> Convert the Cavium Octeon 3860 GPIO binding to DT schema format. It's a
> straight forward conversion.
> 
> Looks like Octeon has no maintainers, so Bartosz is listed.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert cavium,octeon-3860-gpio to DT schema
      https://git.kernel.org/brgl/linux/c/5c163c9759605148d0c66acd8d795133c4b48ebb

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

