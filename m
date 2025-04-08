Return-Path: <linux-gpio+bounces-18524-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B6AA817B2
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 23:39:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD6DF1718B5
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Apr 2025 21:38:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 743CD2550D0;
	Tue,  8 Apr 2025 21:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="WHuGg6yS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03E1254B17;
	Tue,  8 Apr 2025 21:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744148324; cv=none; b=XUlI233gw6xOC8HRvqgBo49K1wLZG6MQDfgTcEMgrHPAD3Nsgf0XVxWdh6/iZuldl0BFixyrwjrXKFGYK2s8TBCyJfGemmdo1L5yyzI3Fo82hfxbBkAK5ya7f5YFFJMvjj5K9WmPfQsRVrrMk0DKug8Vpc4iKb2juCkTDEU0xYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744148324; c=relaxed/simple;
	bh=GhWMPbyYndeNm1NHRZ9Pdb3C62NE+jGntpBEcNTlT7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KX/vf7odKy0JvwjQv2VVNYSeZ1kqwOE7CFeYKlMuylCvSnRMnICs9BloNFAIcgBFLOT6Qv8BXB4csIlOOCGjGgnuGI7ODAzAvGNzKUstYY7NCjer0x9UH+djPfquLh4J7dKUFs/YK1YSLgH4N3JbvTL9qPRPAe32F6Y2FKe9k00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=WHuGg6yS; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-af5cdf4a2f8so4477464a12.3;
        Tue, 08 Apr 2025 14:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1744148322; x=1744753122; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GhWMPbyYndeNm1NHRZ9Pdb3C62NE+jGntpBEcNTlT7o=;
        b=WHuGg6ySCFOY5BVFULvsD9gCVc35b6oJpFYJX3egN5q+qFAShOFJyP/YfDV/xBoPQP
         aGACn00TwbA45RLoptxyDCxg2Ld+P3povImm71EXqZylIz7hSUfRnEirPVC317CRkzdi
         /YA99V4Uva66znq3qshap8IFME2/RpiKSHG8A0KrofFpuH1Hb4HfmOz4ojmXr+XGUmix
         FAAFsxqFizSOCKDsnIwxK4DYeS2Vb0qEZsbxmjUX1EsWVQNtzsR7D32QO383Kn1fr8+g
         vjSceO0pBydt2f2hYiEhTKEHFQaefe8FkGpiO6I5S5IDnvP/08W6wqnHrXh26HOdiMck
         mj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744148322; x=1744753122;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GhWMPbyYndeNm1NHRZ9Pdb3C62NE+jGntpBEcNTlT7o=;
        b=RM6HDipdyG+ukf4A+ECmhYMBGvtK0hAkr6HKrSsbyXooX1vRr6axhXcHlNcK2MubYP
         7rwZWj4K3EXyrePE4EiHKjYaxH3Cqgo7z6YCwMEfcbk2KTCGtlJhurKmH3/ZnXTQqFVW
         8fm8zuIaT3+zxLEV4jdljSnJqCYf3R4F7oXzafHYiesfXmixxTlMjupvA9WEq8dYslwM
         9V6w8aFp+Pk2fkIZzf6fhVIpaNPSy8cQ9roYd6AXU0zH+9xnqRNE9vLfoOoNHuno5h7t
         CiqF/80gDMgfIdD3PECeS1lc1/uUp4HeclJNMd7ke4w3s/qjJiibBBKZKhIA+o2ovydu
         +2UA==
X-Forwarded-Encrypted: i=1; AJvYcCWS156Hj98f4D2uGGVm4JK/hIgoWo6ciUUkxesAGL4T6htx4FMs4mu35nxeKAWwhWEj0Z15XHN8EPnC@vger.kernel.org, AJvYcCWo+bQXDOe7QN4TLOaqQKCep/LT7G8Mumv1Ou6Xeemhm6Pg34OWeEa+kbFL7gO1BMcfIaiuoCBXXeZtgjLE@vger.kernel.org
X-Gm-Message-State: AOJu0YwMet5iUSGdIX1Ua7/4adt2S1Da77JRIH2ogwQJmel2DLiKVsm2
	oSTwL1aKnk4/snxJL3lfDe5jvuAyCkZFs3RPQIa4rzUmCX6+j1AEnN5NpaOEZPAc5QXaOyAlQuw
	8O/4mShWj57kMG96vxuQBEFPHT+w=
X-Gm-Gg: ASbGncu0aAosGzwLXRkRMqr59+SuvB+r4dZaU2yUT7XB7ywLpFHiCNjEps0v0K51hpi
	nt4gdfW7Y+F5/fM3EVqNx0k77a9eEiTEJQEs+rbtjOKXo0RXoVVys9JTwqkAlcpsYqiGzBYgtN0
	nSlVxEEIOkv76ignVWtKt5auwQjiz94iq90cJHUPzb
X-Google-Smtp-Source: AGHT+IFMZotDtWWAJlBzYOHbY6eZuROd8g46qqXTeR8HSTz+D0BC75aZwtJWVAGQnGX5SFSxfBqUCvgcV0HR+ALG1Sk=
X-Received: by 2002:a17:902:ec86:b0:223:5e6a:57ab with SMTP id
 d9443c01a7336-22ac2a2993cmr9011395ad.39.1744148322097; Tue, 08 Apr 2025
 14:38:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
 <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-6-c9d521d7c8c7@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 8 Apr 2025 23:38:30 +0200
X-Gm-Features: ATxdqUFqmoWg6ZQUVk7ZN8EWhyXPDuE43IZRW9OybjmWPW4EA1wKzp3juxP0OpY
Message-ID: <CAFBinCCCH_=Ji4qu_pF_umDhJp3m_osk62gFH5_1bRRvgOx7-g@mail.gmail.com>
Subject: Re: [PATCH 06/10] pinctrl: amlogic-a4: use new GPIO line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Patrick Rudolph <patrick.rudolph@9elements.com>, linux-arm-kernel@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 9:24=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.pl> =
wrote:
>
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

