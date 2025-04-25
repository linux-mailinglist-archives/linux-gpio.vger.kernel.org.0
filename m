Return-Path: <linux-gpio+bounces-19328-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 023E3A9D5D4
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 00:46:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C065B3A3910
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 22:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57C742957D3;
	Fri, 25 Apr 2025 22:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nQlm0yAX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D952686B3;
	Fri, 25 Apr 2025 22:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745621152; cv=none; b=Jk0pRBqaOZU9Vbh0P9dO0CxVobBF/FVySVOCjO6yp5mEvo4wZfE/U247wld/VA75P9AA5qaJM8oXo04e/2Bfy9n4IVLVciHZlYp1ASdBnFrap1Fz50saTfV8BGsFOZq3uBHUE+NynCVN3Geu3Mn6AV1W0ROdcy46CLUHdq5UuZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745621152; c=relaxed/simple;
	bh=kTr1BhN2Z4QFV4684nITve89LJWX0iF9IQ3PEiuD0mI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OzBL+hxz+/XSbGPXiBPUGdfjMf/TodLagcQo0euTZNwWeo0VdALrRe6VzCXj2exC9wRVBHg896GlA1Y4Kqmr4RYVqEEl1cfwF0prk/qNiiLBO5NCmW4hsRsDj3AxulQo1GjChGopxsm3uj533mieqDcZb1C13Jo3l0aIzJdXiyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nQlm0yAX; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4774ce422easo32498361cf.1;
        Fri, 25 Apr 2025 15:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745621149; x=1746225949; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wpxvPODl8XU4Mrgb+cq2MoZhp3SQCnv4izTBeRkVjNw=;
        b=nQlm0yAXPxjcofTUKdDJU4edE6bKBMB+/Lan5JoegVjSEf886L1zYYx+2uE+76N8RU
         IsZFAqbWQk5jh+W/qv1HEfgfyEykVQzSB0ncdKtKpB58EHrN5CF++ohE1OGWDh6FSsQS
         uRLXEjT+i5QIInhaR5e/6OzLer3t1DsRQZ76E53BbNzfZ58XhjHD8zu+vxWU2Jc5GHZU
         yO/OiWNtmE/ooX1zCLAgs8v0xRmWzf+YWkzGcGbjpq+Eez59XaBJUVc8v+vFdLhrHo+g
         aI//TpTNFjWm1VQ6VnLoPGkKC6T0nZx1nHvfUEoRz5U/7gKQS/IODkizrzcEswYRiznM
         SHKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745621149; x=1746225949;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wpxvPODl8XU4Mrgb+cq2MoZhp3SQCnv4izTBeRkVjNw=;
        b=nGj6nZ3sdZMufnES/C/YM6G5DSlKqfcBlEBJY7oI0jbveHxdS6VIuJHWVMev4DXR6q
         Vaz+LU34dlarhwgVF7My9l7M/kGvMw1Y8mCbHBG8Ux1mR7/MFEsLpmWBaS7NXPwLf8Rk
         YNmdw1plCOwy1WoHPbcTGN9iunDgxQpUZXXixSctz2NqNcx9HG5Pw4q6OgK/zV6F0F7O
         Gh79ksrHprNsfg6UlBvAXtkcXGbONZ+KyblRgSBtWbXss5sXiqw1Ua6MuU+KSHa0sjFU
         mHHpCV/Wm4oyaDlDUICLTL4EIlXQx+mFyBH/1NYdhX4KCREEM9urW/GOyw+ggOBEg0M4
         riZg==
X-Forwarded-Encrypted: i=1; AJvYcCVTqwWvHt1ZdIs1cr5kO1SPStJWd7diZ9lAQU8TBBscZw0Z0dqcySeBTqBig/SUIMmOien0ykdZAb0D@vger.kernel.org, AJvYcCWPuii8x+KXcAs4EjbDhXDLtWBZPEZnutRAAsR0kP2cYaei3FDxRQjdSiolD8hOkv3o7N7Nxps5MOW0nxjL@vger.kernel.org
X-Gm-Message-State: AOJu0YxKfqE41dQ9Q8kFtAxe6CNYDzndWekJXH2aJEbN50jGyBShjIlV
	n5ysnr9r1S/GEYTQFrNRx5cN6nahBYAeknVoIKuhC1jNaQOs1ywA
X-Gm-Gg: ASbGnct5PQyr988vdD/jqgWPR8dzFyTwSwRTLQzLLvWw1zJ1GWvObc/KfEy0GcgVPR0
	oLpKTjXPWm2bqAEZs07ZFlbjSh/3YlxFcSL6gozUToNeWzl4FtlGpalraxqzVljcr4Q3i0gvu1i
	zucvB9OWpdgFGe3qGM8gbzRxvt1oQE+TbwfHHSO0DVsxPNiEtE0PlnUAJOUJjK7fYFL1seNSr1j
	2SgqCQQolcawbOyE/4hO2KE2eRbnKtNdb1YghsNTueMOvAZ7+yXlsCgwyDGk2/DGuIgXeExjSng
	rdCWUdKBtWsHgg3v
X-Google-Smtp-Source: AGHT+IE80Z+JWIw8051HVjg8pT0cQ+xe8MMsCMDbfTvfXwWaHxfynvaJjSTMoIgWVOj7FDMoV6TEqA==
X-Received: by 2002:a05:622a:44b:b0:476:6625:eed4 with SMTP id d75a77b69052e-48132e8c157mr19310261cf.38.1745621149280;
        Fri, 25 Apr 2025 15:45:49 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-480b050a57fsm8619191cf.75.2025.04.25.15.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 15:45:48 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
	Inochi Amaoto <inochiama@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] riscv: sophgo: Add pinctrl support for SG2042
Date: Sat, 26 Apr 2025 06:45:35 +0800
Message-ID: <174562110477.44005.9722007878351490810.b4-ty@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250211051801.470800-1-inochiama@gmail.com>
References: <20250211051801.470800-1-inochiama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 11 Feb 2025 13:17:48 +0800, Inochi Amaoto wrote:
> SG2042 has a simple pinctrl device for all configurable pins.
> It supports setting pull up/down, drive strength and input schmitt
> trigger.
> 
> Add support for SG2042 and SG2044 pinctrl device.
> 
> Changed from v1:
> - https://lore.kernel.org/all/20241024064356.865055-1-inochiama@gmail.com/
> 1. Fix the binding documentation error.
> 2. Refactor the cv18xx code so SG2042 can uses the same code.
> 3. Add SG2044 pinctrl support as it has the same layout.
> 
> [...]

Reapply this to the sophgo/for-next.

[8/8] riscv: dts: sophgo: sg2042: add pinctrl support
      https://github.com/sophgo/linux/commit/a1d04b8461eced3c8933fc3f58ddcc4b44ca9073

Thanks,
Inochi


