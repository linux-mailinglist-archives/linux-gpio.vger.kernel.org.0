Return-Path: <linux-gpio+bounces-23450-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF6EB09D2B
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 09:58:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A81931C285BC
	for <lists+linux-gpio@lfdr.de>; Fri, 18 Jul 2025 07:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26B562BD03B;
	Fri, 18 Jul 2025 07:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="taz8uFfl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204BC29E0FD
	for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 07:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752825394; cv=none; b=OzfFV9Mq34TCSABgY630nxfvfJgfDJdaq5p5iNjnS2hh3vyaZzxbCZx+2wM6Hz498gNSlXMDGNkubKXa1t0NYcwPunorF7cqhMETou9ZbXClzHbV5TvnVlleD+LTwajCQr46Qw4e+TuSDNnXbeu4kjHIgPxuSOH1L01KLZkJxHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752825394; c=relaxed/simple;
	bh=/IfDGxxWwH9C3Ri8YFjSmKzSi0znt79eWoGTibw5i+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s//Alo5XdeKScC6A9oWbM1Z0/StJEB+rSDrAjTH3m6Mz9A8ToG6KMyZtQ3j1yXBm7xQzYSpr8uKcUx+MMR9g56lpRuM09Z2/ToqYPHwtIZp7t3ZQJ/yytlM758q/1L0msloZeWBT+wtKhG71S7pq/XUegtpbuZIn8Tq8e/aOS1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=taz8uFfl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45617887276so12605505e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 18 Jul 2025 00:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1752825390; x=1753430190; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCaZ+WKPsEn8tCTv6g/PRmp1aflmC3F0blXp5umhp8k=;
        b=taz8uFfllFf8x8IBig0/UiL1bVdrxm+3PaIha/L47PkZVuqcen5pZFOnllSWw96UZ0
         +AaU3a7lUo4M/UIL/hV4ea954vwL/wlLZm9+lL/hOh0I47c2+Iqy565zxbIKDSyAmn0j
         RBsNgVgVM+zSyHgz86xvhqnd9c8avYqXIAf8AwwOJZnXiUFmFFt+nPbokZQ8l6pVkLCF
         5GV0aGq9vzL0QgIlAzbjWWt/fbTBP7Y87nQiyhfSKtg+kcs42EDACcRF+8FkeootCbOb
         ZWALbKVl1OeVYN5uoKK7I43IemlHGxoCwB+M0AQtmhZ9w+lJ4DpogSvHUgEEePByI7Rs
         ORAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752825390; x=1753430190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCaZ+WKPsEn8tCTv6g/PRmp1aflmC3F0blXp5umhp8k=;
        b=NUO229viALqXr4dy3MgHohMEPKbvQgHcZ68FrTOZEt3kwIFkt4othp57H4T9FLm96i
         W3mdq4ICBXKBwqjS0ZXJem/8ShQAOp6y+K59ECIpl5T/1ItEgsHov37um4so4o743i7s
         ouRPxlybl99AoRIJC7YTNbF1QCxQJfl1lmiQKU4gK4pBTCX8tUa0Uzpve1NXxyxRRivY
         aEmnre4wtFlPHBhuPt0XhtR0hG2XkYNJMKylTGj5ktu0yHLuW8URu8GaMwkEaBexEzKO
         qILWR9vPwu/b1pOu/6bCom7aZ9wdg4hoyflJ5Vs5LyQPzpGw0ycJMLAWL5L1WA3Lx+X2
         0ugA==
X-Forwarded-Encrypted: i=1; AJvYcCWb9iQjMjv5EKn/wOqUKzYPpDCOXYay9zFqnT+4M130Qe6FpptqEQRAotKC7AK+iPRqyZogQh8zews+@vger.kernel.org
X-Gm-Message-State: AOJu0YyBqJvXJ9fJiU8GSlM0QF37JWPYT+GOItwqZsVVBRAHVCBs7fyT
	+irzTGADZ5DXB6dcRJ/fQs053NSJj8UkyDhX3LAJ+iPmIXW720HFZV2WujjLBRhzPx0=
X-Gm-Gg: ASbGncs0LNZwZeiJNsNJFH/A+UMSs+mOKbJeRLhLLloelmRAWvnDZpNPX95JSDC+aq+
	zY3x4FQ3pj91LRc2zdckcLxtm6e4Jj8JDhtVHdEuzVtpH3fE2wHMg1t6M+rkgMHTAcc54ob9vHl
	x1GwjuLVI6mYBb/lXsKo00w0XxVC/bEPW+URwVdaw91Btuq0IxuVtCh5ar+j8fierxNzMUCsNkW
	za00mSYfw4F/QzjutJwMU8qyztLbK/al6MAEGPc2qmJmG/xp0GgsMfRYpYX9HV9d467oqdSg1Yj
	1zUdz/oyapQraIrOuwmDIFz3ZwWp4CdGyC1etrUAEVdaAFXAegTxzoWPQZ0kQl41z57gegKMwv6
	rDeOUP9YtcN0a4x3vZ4TL
X-Google-Smtp-Source: AGHT+IE5asmOHY9ijht3WIRY02R518XDUE2Kx8RGeuGf24vxDpkdK3gfoDUp+3MG8ORx/gDQZyYPAQ==
X-Received: by 2002:a05:6000:2d0e:b0:3b6:164e:a059 with SMTP id ffacd0b85a97d-3b6164ea1cdmr2649609f8f.17.1752825390520;
        Fri, 18 Jul 2025 00:56:30 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:be63:a233:df8:a223])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca48a23sm1080851f8f.54.2025.07.18.00.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:56:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Kevin Hilman <khilman@baylibre.com>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: Convert ti,twl4030-gpio to DT schema
Date: Fri, 18 Jul 2025 09:55:59 +0200
Message-ID: <175282531514.45055.3441491568286298987.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250714202829.3011298-1-robh@kernel.org>
References: <20250714202829.3011298-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 14 Jul 2025 15:28:28 -0500, Rob Herring (Arm) wrote:
> Convert the TI TWL4030 PMIC GPIO binding to DT schema format. The number
> of #interrupt-cells was wrong compared to what is in use. Correct it to
> be 1.
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: Convert ti,twl4030-gpio to DT schema
      https://git.kernel.org/brgl/linux/c/a12b566ba571aab82f969bc3b137487e61afc976

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

