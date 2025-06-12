Return-Path: <linux-gpio+bounces-21475-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF4FAD74E0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 16:59:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CBE1167A3F
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Jun 2025 14:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0394926D4C9;
	Thu, 12 Jun 2025 14:59:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49B93433A8;
	Thu, 12 Jun 2025 14:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749740342; cv=none; b=OKwFaIDjWeDF0OWz7Qp+PqnJuQknEp6lYfYqbQXbUQWnwzg2XeAf/BN5OmqwkHe+qhyhjlt5vOIS2H4BTTF7jNnM0G63w9B6gjUy4Zwuept3gpW9NgkverP411LoKcQPWocJG0hcQ97+CVut5gGMsPhMdi6G1m0AY0vLK+hT/fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749740342; c=relaxed/simple;
	bh=YFbcPaCUWz0JNm0nMAA5mwjarfFNlAjkrukhxmWA728=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R0QmA1xuTqp6tOgjqEturY/O0aSk9tNS+NSrKpdQrHvohISecLUWkFmcev+UmKqv/v4We8KunRlpjB/bxmD29LzGeSc1s97bRXek3ZSEDcDmqt5+KxzgUzFSd0NMpyK9Xk7IFAkV3QuL+gYvDH08rXcHj+3OiSqWv+PJIzHdzBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-87ecc02528aso278221241.2;
        Thu, 12 Jun 2025 07:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749740339; x=1750345139;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j7urv+43q9m5//eN/fBrHnA2GxbG1zcAPVe31MZBFY0=;
        b=c6Ey3fC9hMKr3W11NPKrXWFGN4XX8YN6isVY0F92hSCVmrIXxXcY21MzbO8fVQP/z7
         4JuUeQo7a5tOgirhMvvhroIF4w1wPv1BrbIhsSLDNR7iswNTT7BUq5A0ctdBUFWPEL8d
         U04I3RzIFTo2XH4mDDTbxGYaKmbgPuSkqW7n7q6yEvLOS3xMYTdtRALJXICZZS4+44st
         gQY/41V67dm6uXXJ1ZRh1zjU9MmrbKyOgOGurITEZLEE2wco5SX1U2yYxnjYmQuf/ohS
         VmyZUBPmPLD2vAIUCDrZwXChvG7ETpQUvG1B1Ab7VNJQShNB+fFKXeutbcKEDhFDKLVm
         NTog==
X-Forwarded-Encrypted: i=1; AJvYcCVDpXy/hevvmJcsUMjbIGpJpUDKMbpr4q0ZLopDNj1Pr4gOGPnt5f239X2MOFtqxiDneG9XXak5y/ko48ErWGKCA5M=@vger.kernel.org, AJvYcCVtVxVl1tOakQ6p2vo+K3sZ+GOhj1T15yRpphta0YGQLu8kVze8lW4zLNHpBB1U4Ygfd1YUrPSwGNA4@vger.kernel.org, AJvYcCXRd4sQc+A6TDsPNSISSt9k6pqvrxnBOeg/7pfyf0MxQvAjsN8NStq+nTldThf8JbeF4OyIbFNPT5EpNl90@vger.kernel.org
X-Gm-Message-State: AOJu0YwNLX+eha3Irbr6X/Lw88ScUY9AaDZxUdB+J25+0CNQUnw6yPLn
	Ts/Ue94/oRLLpMUAgaBKgT3S3sNyiAaHXYzbNQ/kKDNTfY3an+LJaD0x/EniPQT9
X-Gm-Gg: ASbGncsJtNEE+teuZl1JCHy3Uzl1PbuirD03MgA40Pgi6NdfLYrXvbiESl4+CQHE7pg
	X5VqPaCgrv4xJy7KcByRLINu+FJiwwDATOCNE/duuEn27zAqVTkBudSJocafGH1KrAaWXMxYlsJ
	FUiWLgWpSKqdATpBDzfO/pLw9jSczSGZSE7SasCANSqP7F3p9tcDVViHHLiznqfnNwFPYxqIXxz
	iEX9ubrS+BOpPugZql3Hx528i9gQQgIIAQe6P0DXb+6iY23RdUuEJamJhinsoVQgBF0crFJ4AoS
	B9pj3hwxnuB2a5K3uyrKzTSLUAAGdMya0YbZEsBNaQ8JwhfKq4/4eN9/o0bWSIoD8DZTeqixkdt
	fngwdB+dkjBckGjjpXJ5z8ISP
X-Google-Smtp-Source: AGHT+IErGQ4S796F23yq83bC6pdXSd7l+w0+o7liA23ok20eocm3/qzhDW5BLU3W0WGTYqS7iG0RFA==
X-Received: by 2002:a05:6122:2024:b0:530:5996:63a2 with SMTP id 71dfb90a1353d-5312ce5ba11mr4520968e0c.7.1749740338992;
        Thu, 12 Jun 2025 07:58:58 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5312f6513b0sm315024e0c.26.2025.06.12.07.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:58:58 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4e7ade16082so285256137.1;
        Thu, 12 Jun 2025 07:58:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUrGJAvCGRxUDWoUiT/d1qlvxkzRYwebZYjzma6t6BKENAGAdHwPv0zPCAp9w+bDy7VgEnN3QB96h5l@vger.kernel.org, AJvYcCWijaO/jlTLDGvPlSLpYvLHZu0F3TFQriaPeJr+KEDo/OsGMRiA4dLc47AJU7z7MpoMXYFaAOBIZISOK59WqdJgtdc=@vger.kernel.org, AJvYcCWqtH9WhQNEmVdXq+VDEnWzGP2PxKYF2PJQrQZjkY8LE1qt/awYJbkfjNXM3tCSleGGbCA9kDkh+8rrO+B/@vger.kernel.org
X-Received: by 2002:a05:6102:3046:b0:4e6:a338:a41d with SMTP id
 ada2fe7eead31-4e7ccb9decbmr4392145137.11.1749740338109; Thu, 12 Jun 2025
 07:58:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250610-gpiochip-set-rv-soc-v1-0-1a0c36c9deed@linaro.org> <20250610-gpiochip-set-rv-soc-v1-2-1a0c36c9deed@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-soc-v1-2-1a0c36c9deed@linaro.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Jun 2025 16:58:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXt7W+XLoeQWqjNR8dBS3oCwFKBydVZueqtYg2uka0WxQ@mail.gmail.com>
X-Gm-Features: AX0GCFuo1dTCSfHZ3zIJsOn9_JIHrUSOYlkHewmTg8yRd6ll7bXt9Le_Qc4mtYM
Message-ID: <CAMuHMdXt7W+XLoeQWqjNR8dBS3oCwFKBydVZueqtYg2uka0WxQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] soc: renesas: pwc-rzv2m: use new GPIO line value
 setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 10 Jun 2025 at 14:38, Bartosz Golaszewski <brgl@bgdev.pl> wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.17.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

