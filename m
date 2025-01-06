Return-Path: <linux-gpio+bounces-14547-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B7121A0314F
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 21:23:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84DEE163EAB
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 20:23:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6EA1DF26B;
	Mon,  6 Jan 2025 20:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cy507WVq"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC19FBF6
	for <linux-gpio@vger.kernel.org>; Mon,  6 Jan 2025 20:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736195017; cv=none; b=UysvF7NwqdshOcOkFzLekKmJ0PkHoFPZI13q/KGsthL3Hr50opYJdTmSQrO4/Jxfd/Av9ddcbi6eesFz87FPaNrxnOqsuW7onCAW4IqduSa36ab+hEbigS6aUlz6bXiy7pDtFR93klXwY4ERIWgBxBalJZp/hRPbYOExdu+bweY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736195017; c=relaxed/simple;
	bh=oloSoCpL+vTs6hRSB6u1qL5TlfX3tfKLCkUfIBOyPNQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LhHp8NY2NglWyrY79/Jphw09a/45ct4wO9ZEQoDrR9f+ngR1H3IO9YhJk/W4ZcZN2UFmPA/grRlmgre9F4ixidlE8WCJKlYhEsTbyjCPRjOIdtq1ebIC+xnfSArgYEBjbTiHHth761EYyqVpgPAKIjIYLhYkWwovTgawSfcF2e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cy507WVq; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43634b570c1so106231155e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 06 Jan 2025 12:23:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1736195014; x=1736799814; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nh6giEYIA/meByuU7DxkCeD78i3wvwoOcPOobfQbLGE=;
        b=cy507WVqyEKOsFmXneyCRgh6hOceo/ee7d+W6LotcWfENy+ixMUBkMdpJdCTuJgTJ9
         GhF/h9PWsWouCtVh7Ut5UZRLnbF9knYF6q32B3oYgnAkcG96rp2kgu6qa6gqICRF8nAq
         VTkciP+GJuECBRDzv+QidErPsOpo/cId7/sTFitQxL6qAvwGM5y/WqfksE/6UYIqlglv
         itgWl30P1IOLnr0AIVeSkYsBjSJ1R5QfYs0GogXS0ME2QyPy5mXL34Xj5JOcE6FL3x7N
         jicEN/M/1bZJB9eEDJMb+EVGetR2foHrJj1HnifZxqv2eBOHhyNYxuyPnmtK0KgGB/e6
         vyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736195014; x=1736799814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nh6giEYIA/meByuU7DxkCeD78i3wvwoOcPOobfQbLGE=;
        b=asc0o95B3sGsiSq3RcUZm0qGSeSmeyK+9wt8mW9uWX8I8lebf83MC+37SVJdJvT2YT
         bhq7VL05Hi4+MXjFcaANhePC0fcqxRqrz/Bfq0AlL2AhT1l97jMURungIqwJTiJiRAye
         RfaCUZzA3PR84wJtLrI1xozas/zSOvn13aO4aPtRuxAnkkBuh6AiRvbwSzJHb7MZdo6g
         mRaFw20Xmp7DzwNxbQmIKvo1GtNibOi2wwDN5/T5bKG0fRKEvxC59nOFitwf0Q1CwAvZ
         WRoqqFjykeoVjdSH3V5l/zGmf3/Hxvy5ZvIaocBkUONibr/lXatCT4xmIcj/nuDSLmMU
         ZQMg==
X-Forwarded-Encrypted: i=1; AJvYcCUHi0GtxIeVaV3aWXUvDND891OBcmtoSSDwPsQUfDx/9TDz2j786QcDE19BSPSLoP+MX2zspMLtgZX5@vger.kernel.org
X-Gm-Message-State: AOJu0Yyd80sZetcOte7B2L5kWfulN6mK55yZA2dNWAixlY+a+tivae+0
	yyX+BcqOsVNpKzFALwGzwoGTEOLBcUM2eCFL7DMzemEmE42QrIVWPK4FEZ7FpgA=
X-Gm-Gg: ASbGncvTPLK4p5W4u8ugtmpAAbBiumtB4A4P/yvBiG6P3gvUthm2VDTOXPhoib6tE+M
	8WWFB7/GDF4cYJEqhxvV8jZxCH4YyFSHxU/OQuM8VkKfAw8IZgM2SkuipLUPMvicsG5azm5c0gc
	QFCP8zKJdGIfRK1SH0XnV3aZqFBgxvvjwadHzKghnrE10kGC0kwep4uig0HKO+cSY4PghSXaHTP
	c3+RpLNi2GJF5BeRY4O21FINQ3tjN+GzPx2V5jA+9T2t+pA7AV30A==
X-Google-Smtp-Source: AGHT+IG5MF7x6loZ2YU8l7YFeeisPs11ZQvCeOUqElgSEpjCa2qSR+5vvj/MXT5V88O23KvWA1y/Iw==
X-Received: by 2002:a7b:cd98:0:b0:42c:de2f:da27 with SMTP id 5b1f17b1804b1-4366b2f9323mr450859345e9.2.1736195014045;
        Mon, 06 Jan 2025 12:23:34 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:6d7c:e1c5:e9:58a5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b11495sm609463555e9.19.2025.01.06.12.23.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 12:23:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Frank Li <Frank.Li@nxp.com>,
	=?UTF-8?q?J=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: (subset) [PATCH 00/19] powerpc: MPC83xx cleanup and LANCOM NWAPP2 board
Date: Mon,  6 Jan 2025 21:23:32 +0100
Message-ID: <173619500923.255677.11065404025961122002.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 02 Jan 2025 19:31:41 +0100, J. Neuschäfer wrote:
> This patchset adds a devicetree for the LANCOM NWAPP2 board based on the
> MPC8314E platform, and slightly modernizes the MPC83xx platform support
> in the process.
> 
> This board is nominally end-of-life, but available to hobbyists.
> A U-Boot port is also in the making.
> 
> [...]

Applied, thanks!

[11/19] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,mpc8314-gpio
        commit: e083b304bb0c2c8c9fc1c2adb63eed6233babfe8
[13/19] gpio: mpc8xxx: Add MPC8314 support
        commit: 401239e1ec9757bf508240e49f5d5da9ea75e5f7

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

