Return-Path: <linux-gpio+bounces-24824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D938B31FC4
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 17:57:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B82281D2578E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 15:51:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86E20274B26;
	Fri, 22 Aug 2025 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jAqiwaKn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4628C153BED
	for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 15:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755877601; cv=none; b=cHQtl2e62LW4LN2xLEIfl8LeqOdZGo+yI0gdJ5mXajNmNJybBrqf3tzByRwcZvlLh2mpYZ7Pf41Y1VVNVOICG0wjSDuPGiC6plj4hZOLI90iCxr1p8t4gefVoSisjQVs1AiSQKlnPbzCNLpxAWpkjixmMD4dCJeFPXXjISVllkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755877601; c=relaxed/simple;
	bh=b9+nY0hCJ58Vi4rp0ic+HGnFWZ5w0z8S08lgMLJAn5A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jh0mkCELY4W87AGgoFCqsrsazKpkLrWXYisiD/KUoaYACPhMHvOcG6LEonTcp8vH6tIQdX78yvSLbsrN3JdT0Kz5k4jooyu7TgCJxwpXpIAxdnbEVeEnVGA/+6/AQiQViMLtueJdMekyED3frZWiSVz2ZL9WOz0YkWGHYz36qeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jAqiwaKn; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-333f92f1911so16774851fa.3
        for <linux-gpio@vger.kernel.org>; Fri, 22 Aug 2025 08:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755877595; x=1756482395; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LMODva4Wx+u5k/n8I9hDvFpyxaAAOgTPse/Q7Fgk72Q=;
        b=jAqiwaKnMoqMGesUXRNHQmuc/R62xotdlacos/XWw3bGmnB/TnWjOZSRDyO2Wr46gw
         AcOpce3GTt1tUtD/2MGg9KqQoeB91Wi5XfkzS8YNEXT5QYNjGenuENwrlFQOZbdJCiC9
         J7bYmLWaVaF+mTgsqBVMvoitz1UHeBfGhfwDgV7kCpCTDA1YL/mBISACM/AyWKfpEREk
         QllzR5IQnwSbxMiFOqJbS6m4Tuj17clgE7EjWjcoWccyXhYkUJa5gLEklDNORw53RpKR
         TYw/pH28RMHqAKmrBn8HEIPYbmtiK3vrsG53k91SOT49MdmsvcYMHjJRv/wnYm7bZSdn
         otXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755877595; x=1756482395;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LMODva4Wx+u5k/n8I9hDvFpyxaAAOgTPse/Q7Fgk72Q=;
        b=XnXer3YIh1LeXMSrBofo89jqJGq5Vtazymg6H8/y0liTdMJnUQaHowodBEtw1HtLa9
         zNA286G1AUKMDu7dU0Va2Ph4hDarN6uwOqgzk/lh7FSfhr/xBrqhoeGRxhQ5Hfo7380v
         epWll2KTqOTHGXag9KIxZh5CTleYcwBb50mgu14WScXsG8QWNwYuaHT0X5E9GqrRIlcO
         78VbYucsZYpH6x+kTTvyZfa1gh7Vb3juNoB8lOqT+ykvkfAUz8hLbDC6zYLWFjmWGOVn
         USDBRYgjLs++XbfXhJ3pg1ZtAxFIAxQtU1WqD1IE5n3hp7nwE3S2ufwNCfM8HxsBGpUr
         U0QA==
X-Gm-Message-State: AOJu0YwNwiP0KvewszjCDI7yuUrZEqSclRxW6quxRj1siJmFEsoqF6VA
	ZmR+Zi7AxwDjekGkV3p3N5wsSffuuVP7iffp+yvKEcoLa8wlWJAeb8Z9DkJG6t0+TviNLTjxGtL
	1w4PqbM4=
X-Gm-Gg: ASbGncvT/AIrtCfMs2XsX0qmIYCjOZoowisDqdu8xvC8T3Xe58aqeKqQgS8GUDfDy0+
	Z3wBA+YHhCx1QhF9Gk7vbHhRNCiByef8I0JQaFdGPPMt24D9wZFsoyAHZ//iZp6rLP2aXJr25fu
	sy+SJau2xCqOijKPCIaObaXvbxNW91GjWH1Fgmwnua+pK7R7LOwzcy6Jt6aPg9Jm2rW7sC6FL33
	ty9qYBsjVyFtdzFj3Y01hU4t95DKrdbpR/m5QnkwrrDHKDb0c0SwaIZuRgqCJ4V4bQU0dlYhTSs
	yPzil2WFnfCy08nqospQJKzmzQ22nsyQlypdj/f0hlB5J/db4sHjgeWTO09vJ540lZ4Qu5ldQlT
	BVckjNxu+t7m2xt7ilEVlTKhS8XlVVm7P
X-Google-Smtp-Source: AGHT+IFAupKvz9O/wuCtnXnXxMRJHbKl812eWEqI8f0zVIY0iSlRar4cC703T0t3jY9HyrPP2Y3ZzA==
X-Received: by 2002:a05:651c:2352:20b0:332:74a1:2a29 with SMTP id 38308e7fff4ca-33650deeb79mr5680611fa.15.1755877594226;
        Fri, 22 Aug 2025 08:46:34 -0700 (PDT)
Received: from [192.168.1.140] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5d1a6fsm56541fa.49.2025.08.22.08.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 08:46:33 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v2 0/3] gpio: mmio: Support IXP4xx expansion bus MMIO GPIO
Date: Fri, 22 Aug 2025 17:46:25 +0200
Message-Id: <20250822-ixp4xx-eb-mmio-gpio-v2-0-bd2edd4a9c74@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANGQqGgC/32NQQrCMBBFr1Jm7UgSaxtdeQ/pIsZpO2CTkEiJl
 Nzd2AO4+fA+/Pc3SBSZElybDSKtnNi7CurQgJ2Nmwj5WRmUUGehlUDOoc0Z6YHLwh6nUEMLrdu
 x643peqjLEGnkvFvvQ+WZ09vHz36yyl/737dKFChIdv3poq029vZiZ6I/+jjBUEr5AhOkclK3A
 AAA
X-Change-ID: 20250820-ixp4xx-eb-mmio-gpio-80884f67aa67
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Imre Kaloz <kaloz@openwrt.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.2

After Florian reminded me to do things properly, here are
fixups and additions to the MMIO GPIO bindings and a
tie-in to the IXP4xx expansion bus memory controller.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v2:
- Drop the bank-width binding, this was based on a misunderstanding.
- Drop the bank-width from the example as well.
- Collect ACKs.
- Link to v1: https://lore.kernel.org/r/20250820-ixp4xx-eb-mmio-gpio-v1-0-0e167398c8ac@linaro.org

---
Linus Walleij (3):
      dt-bindings: gpio-mmio: Support hogs
      dt-bindings: gpio-mmio: Add MMIO for IXP4xx expansion bus
      gpio: mmio: Add compatible for the ixp4xx eb MMIO

 .../devicetree/bindings/gpio/gpio-mmio.yaml        | 36 +++++++++++++++++++++-
 drivers/gpio/gpio-mmio.c                           |  1 +
 2 files changed, 36 insertions(+), 1 deletion(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250820-ixp4xx-eb-mmio-gpio-80884f67aa67

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


