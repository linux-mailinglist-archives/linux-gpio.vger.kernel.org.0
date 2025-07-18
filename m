Return-Path: <linux-gpio+bounces-23439-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A7109B09D0C
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:56:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 00F0C16AE3B
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:56:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2461A2949F4;
	Fri, 18 Jul 2025 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Bsl2feXb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57217292B30
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825380; cv=none; b=ccBm2+hY1jHwzzxbST8luTycI9i6CxbawfxiHbym7ILupTJh7kyjWhj/6P6E0yI/ItdhfyeeOoT1gBgxw1KnXiWQJSWJr0tOVRae5ujxhgchHZtBZBp2J0BVmy+6kyHu8MorT/QN+zcGRYf7akYwC1dxkMTY6qS0jX6nqwHGAu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825380; c=relaxed/simple;
	bh=NJZN8hgycw4KG6QsQ9rNrS+Y6LgwUbbQtk6jxgqvXjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=g6eNTqz8PHNmU988mlRChZv+cy2FE8WYBRQ1e/i6Qbuxpw8SMIZbVrLuafjIz0RtuccQN8671ixWOAiSG2PWl8B2HsztVHSg9R1q3bOSFMeAC7jRujwo+PYIfgXajeQotpDaMCPgndA/ZjjLurMqcmT7gcwCuwe5j9CBzv0Xed8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Bsl2feXb; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3b611665b96so965220f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825377; x=1753430177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iWfUo/6dDFw1FM+gvXLgmmRPvDTEti2xWIYY3nBbLRY=;
        b=Bsl2feXbkRBu4wzKtk4iEhxvvpClzwYV4eaboiCowyw+EqCXe+x9VTWpakOnKRx7K9
         kqwN3SSRuoQgUwhifTGozE9VL4cfcMVkIKVZOMnOg+I/bn/6tHMj+91gtPkXuaZPZxeX
         AXYd+YD/iqaJzm+KsS+5DW08h3GyFAonc3csTaEOlRJ/EYYXK9SjZzt3iQtcnw+8AaOf
         sR0VrTAZZBKKLf0o33g3+8Tt3ZC98tK20dxBh36A+JHfhk1REr9n/63RjWE62juf+37S
         jvnTKdSqoyzdcZgPpcbaYmGpgKAqUIecw0lKmiOj0cr+QB88mmN95h5B9h7QjnVKx5g6
         nzTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825377; x=1753430177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iWfUo/6dDFw1FM+gvXLgmmRPvDTEti2xWIYY3nBbLRY=;
        b=hPV5Nh+Ixkrrz1A2o5mm/0ukwEawKnTI4tWQUtdeyGR7dK4YclEvNOCEopSU1w4yuD
         r5g4FtpP14uheIsp/9SnBLg77AGQXIuxytT1W0PZ2OB1ST+N1rNe1/Et6qJPt18Jgkqq
         1ImCYRsVB/H41dpBL7ATlM78WIGPhUnm27pTmjvRz1Pq8U2ER6jsw9FkEDrctyMQYG76
         7+h4pW+Sae42UW7MR0JunZ1pLdxcBD72Qapnjq/DtXtjYG7dsymNK9SmrXEtDtss5U4E
         efSOi/GfRBhFFuQ6LzxABUHmJsGjyRHA96l9db934TKf0Lhs5tzSOs2AXviOrmx7lVr4
         HDTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4FVJ1qrsNLM9ICvSIMHUXfezBHs/STOjSF9yOLNCQ0SiYYpXav+OUvVDSY5HzpVShKndVtfMPPsZt@vger.kernel.org
X-Gm-Message-State: AOJu0YxPWa8IbIfbjmLYAXFCdVHAhaAX5V10+7hdyDOb2zEzAQ1FzSoW
	6GgvwoMgj+gVmVaPJqjNwI7TNuYHuiiHPLT0Him1AstpTdCqlkscUpQDZRmkx7WUKKQ=
X-Gm-Gg: ASbGncu8bDVi1WF3jg8XxMjPWZ0K40pQNZr6U++Ljyu8EvDgU6ZyMNXgEvqwgY4mUZ7
	55iDkhDWJlA+PYJGzF31T7ZgerjWD3hmOObnPqXgP3J/iG0Au+W4fD36yYCws4g3/uL+jP9IyAm
	pR9VxlCHaRPVBQRvpWTeUX5nDv+06bXCRxCKYeksmSX37h8QxfHtyIp1SK6qtjN213PvbUNjmG+
	FXCc/rXnrYHSe5KBzxJBxc54zoZauxgRsFJc5JFKDlwrXPjPSvbLKtWNWqjxxinA0FfM3qBiYjK
	qQfUt3OhlMlKV1dpOoH6kwccjRMZHCTbwGor6rm6+RbSn3WsDRDsE9l+qa+NEZbjWePtRpAWihJ
	gNgbRSRJILF6ALxHIr+Nw
X-Google-Smtp-Source: AGHT+IH8XUyHLBPZMCRZz4IjMyxBspWPxDe8Oe7fxSSb9/becL+d2Pfo1KQXdCUI234Fqguoxcr0kQ==
X-Received: by 2002:a05:6000:40de:b0:3b6:1e6:c9fb with SMTP id ffacd0b85a97d-3b60e4c510dmr8574712f8f.11.1752825376620;
        Fri, 18 Jul 2025 00:56:16 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:16 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Mathieu Malaterre <malat@debian.org>,
	Hock Loh <thloh@altera.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert altr,pio-1.0 to DT schema
Date: Fri, 18 Jul 2025 09:55:48 +0200
Message-ID: <175282531513.45055.13269786357124112170.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202905.3012386-1-robh@kernel.org>
References: <20250714202905.3012386-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:29:04 -0500, Rob Herring (Arm) wrote:
> Convert the altr,pio-1.0 binding to DT schema format. It's a
> straight forward conversion.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert altr,pio-1.0 to DT schema
      https://git.kernel.org/brgl/linux/c/695f375b2a881544d112edbb60a35a884c7604ae

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

