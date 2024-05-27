Return-Path: <linux-gpio+bounces-6680-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9728D0585
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 17:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF2191C21E80
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 15:12:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBECA169AFB;
	Mon, 27 May 2024 14:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VkIE78g4"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8CC169AC8
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 14:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716821585; cv=none; b=hPn5SkJchZZBLNZ4VgrRpqqiAM/gFUsHtyIUWnzu9okM4RWTJjjxSFVQMmn0oyqAWoW/m9TJiSSJ/sqTxOm6W8+1nGkNiuzF9+8e0Nm8Ngkr9lYsCVoqKlR1sgBfw3zGMhNcryMrZUTVQjWRHPwMRc/TV1O/69tZrEvo2lp/ofY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716821585; c=relaxed/simple;
	bh=5yxMdZmBSUT9i4hEAT9V16nLKOilp+kaLXgIrbnM1aA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GLeJAX0pxDi3GlG+YOfpHbgNVptBPA1mrZGD1fabV1UW6Iqi839vVOlvDpmMK6oF8z/QAgmLLPBGwMlarMO9a7QfQpfxXD6fVuWzqdatxw/d5kicrBotDxYV6U+jL8wxh8DWHJvXp+9OdMBG6ZGUtFNafyRGl2apcfmhl9RX+NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VkIE78g4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-356c4e926a3so2002767f8f.1
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 07:53:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716821583; x=1717426383; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bb5vQx53FslUz3l0ynJWCQH6eTzzby8erMqydeQ0x6I=;
        b=VkIE78g49AuSLsa4iNHPDvXt9sue/Ra5dxLKOXR/nuLPIuIJGxtDndQtks59sX7Hrd
         2tR5xTY80F2qeAEb5EOk54dJ8JUVi7rUvUnnZOdn556G5dj+PbvNt47IjEK3fTe0ezNW
         fHEpXUPIQO+OGL9f2qE8j2FWQineHtvDEkTvQMDLWmppOsHXxKzoqkUKoNIO4KE58hB4
         s9Ti7uyrqbg8LIOes4lVTLVKNsGsdRjRDNy6Hzr50ctuauimw6x/iQ9rL2SoFZA6K5T0
         0rGOa0nCySYtJhHUBvNhdZwEkKHZWE8OSod7AYZqmSjnpgVTEvk/uBNxzJcMnAFwF8VJ
         e8hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716821583; x=1717426383;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bb5vQx53FslUz3l0ynJWCQH6eTzzby8erMqydeQ0x6I=;
        b=MkWS/u81JRsWodAjOt/B3hyLqZY0rmAbxzZ51gaCswOxxnpxwM2SY44VCUNNkZNMok
         SDIsKW8JfKDcFLpIeEa38ljq+kOv+S43AbOHJ0G7gi5hOvvlent3z91GsAdUkwSxWFia
         nPLA3BzMXO0M46N80vhR6v8vWK7fZpvvZMKeuOXsO6cs8rx6dC8qfeFjqteq341psmEQ
         q1XfasP8/IholVGjEi7CnU9Noq3qR/FvcwQjsnjAlxikie4NfMt7T1KwRV3RNXdQ3nFZ
         b3o3amax8ikPrfcII1uKf/1Cjc/d6f291XnJkfbhQ3f2cWW6nnnzHeBjV5dd6/C0cLI0
         aoLg==
X-Forwarded-Encrypted: i=1; AJvYcCX20cEcRDA5F9eZI+n0au1mFd9bsJSQOZsLFtv8K72QVSXIIeGfaxd/jNqtfpUzWPh8id0Hv9u/f8W4ms0PPy2Bl2mNvdNur7yCUg==
X-Gm-Message-State: AOJu0Yy2crN4qs9gS/PrKi5zDnTutz8VnM3bZbf2DcTIne88iu+WNL3Q
	/cWFVW5ZhEoDLNjuOumtGPl7WEJsC+6VNfzCnCjShGW7JtbJ6zWjY3c3K+nEmnY=
X-Google-Smtp-Source: AGHT+IE4hTuQ5jI9JkweFBuhQJ7UMzHYA0vfP3Bts3fRVrSkRh9DgFZPy8mdCi2aO4S9wd9kF92NgA==
X-Received: by 2002:adf:a3dc:0:b0:354:fcfb:c4aa with SMTP id ffacd0b85a97d-3552fdfd3e2mr6706418f8f.60.1716821582684;
        Mon, 27 May 2024 07:53:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3564b762ca8sm8474214f8f.112.2024.05.27.07.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 07:53:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Pratik Farkase <pratikfarkase94@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Pratik Farkase <pratik.farkase@wsisweden.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] dt-bindings: gpio: lsi,zevio-gpio: convert to dtschema
Date: Mon, 27 May 2024 16:53:00 +0200
Message-ID: <171682157627.156531.2134241472358951863.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240522151616.27397-1-pratik.farkase@wsisweden.com>
References: <20240522151616.27397-1-pratik.farkase@wsisweden.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 22 May 2024 17:16:13 +0200, Pratik Farkase wrote:
> Convert Zevio GPIO Controller from text to dtschema.
> Adding `interrupts` property fixes the following warning:
> linux/out/arch/arm/boot/dts/nspire/nspire-tp.dtb: gpio@90000000:
> 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'`
> while executing `make dtbs_check` on Texas Instruments
> nspire boards.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: lsi,zevio-gpio: convert to dtschema
      commit: e4608bbccf2b9331a4a43385ab15d06eab7761ac

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

