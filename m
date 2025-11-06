Return-Path: <linux-gpio+bounces-28228-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D76C3DE9F
	for <lists+linux-gpio@lfdr.de>; Fri, 07 Nov 2025 00:57:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 503713AB3B5
	for <lists+linux-gpio@lfdr.de>; Thu,  6 Nov 2025 23:57:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63F123563D5;
	Thu,  6 Nov 2025 23:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeIZVAh5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E71033C53E
	for <linux-gpio@vger.kernel.org>; Thu,  6 Nov 2025 23:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762473444; cv=none; b=Q2eP03vqAc5NM+cBYkdPao9K5ltZ4pbGfEnwfm7zo/OxQ5oY62NoaWbfK50NZcvxzH5YKfDntPt/n970copuTRvC4+Cs9grPVqeQMehFPnHZgUA3e34UFUiOXg2fymmk2bNgIM37uS0D/WbvLhuAWleuCIBCgBQXozvxnmNJKNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762473444; c=relaxed/simple;
	bh=kxhtXm1Zg30ysGEEDhfA5TG/xjp0CNhZzJEgLe168qw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y+DX4oJYzfmMek7nNnCdkH4JOHnXO24YiafgOqGgBu0pq95Fh1cPy8HmIQ7tcQr54RpBq0nZWUU3CHuyy2uJ73AnsdYo1gM8IiUnIB66VKbX5hZPFaQkq03VZNPbICpZx/izuy0ZBGCXU4Bv8J+w+Kc03E+mq/en2CeqcUYqgX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeIZVAh5; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47758595eecso774605e9.0
        for <linux-gpio@vger.kernel.org>; Thu, 06 Nov 2025 15:57:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762473439; x=1763078239; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tPLPPimuMG7kUU5D7ROePR6mzkYaE95eVKvbR5javJk=;
        b=VeIZVAh5A7wAqLcDEmPTUqVBZnomrt1GDZfCPoZCNLjbiQLA1zuHb+D7OsxtUjl0w0
         LqsaUe9xtnWxN/Pf+nViFATfL4Mpv1+0v6nDaAwS4QP+kujMu0RV8GlEJolQnGDDQdD8
         yj4k+iBjA0Dmd/ukDhdlm55vzSlzEA47jWVSSvfxxZMZLVZ6qTfk2OdckKbGftEuoNMV
         WcoA+Y0iq8L33TqGLtb9R5IcVSGS35wb/9i8QOvNXg1JAOaUu2UWE50ijovMBbd686Tc
         r06qxdQPsPbZd2xpvTOTYfPdwQNpC5czw+mGyrveO8GYvyfJ2FKCIPqovLVeUHGZe3iY
         upgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762473439; x=1763078239;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tPLPPimuMG7kUU5D7ROePR6mzkYaE95eVKvbR5javJk=;
        b=ZDh8fxEddZ5wLgPnAsQw46RpD5zlrkgYUeMfEKxOKeL8YwBwNcUpflPVUghNIpmv8Q
         EWr9B+nlb6wr4I6tgiaCcgeZl1RvymmgOdmOqOz+eiE5kqjg8q8ogJO2DeDrq34SYD9w
         JrVpvkp5k7LjUmZL55B9S4bnvejIh1AMHv7V3HLbHYCdq12tA22WazMfw984xkq1sNn3
         UiV17E+GhABtluewyy4UyhrjSq2jenpGCVvHVkgF1w7vAMWTISugN4D6Krufkn2IM96r
         t41Xbq/9xcQYawI/ElKcrZGPe/QwSLIsy4EOW0OvvbH0vfnx3Lew640oQWDsIPh6tthA
         RbMg==
X-Forwarded-Encrypted: i=1; AJvYcCVPNpQsGKO1PvWsIVCRovLa1sRbcVcRYw1fyF7O1TkYmZtNuTPu/XlD7hrDPZyScveMLUyfYqw3gHZE@vger.kernel.org
X-Gm-Message-State: AOJu0Yxrfh3IwIwWk66YUFt62pHu3kB+6Wogk8jaF3UCXZRu1FDhSyCu
	/t4yKlK2kg5AdHibglHQT9yE5xz65PAU54/LrJRb9CBwaezWOhvLzZOd
X-Gm-Gg: ASbGncvvgXWQ+PHAMZ7K3L4VN2+riCZKUd39sVrtjROhTWQE5xL0Yl7topA1VJa7ITf
	mrcqboUHpROXcyKWCq+gfvasiPPtb2DAxVx8JEs4CaYpm3ymmM2o3TRxYWAPJwqLZpBNUO2g+TX
	UzN4s87B8bfz8vWqNv+8xwGNzWdxg4Uw41+wgRawZkOWe/FVAPwwhdTIGA1Xk/SEWncxxlN1onR
	waz0erenNZrHxhcFuRTrionAaLQ3J2kR5gmGQIqHPOUBnnzUh6+S8hJB9pWGCtaLUrDgmY2b/sR
	XJcovLkc8VCl43+it4fUvXvJsy/thFfzS78Xk6qZaybx1WRsrCG9H9v/4UxCjL3WkktyD3V1Mbr
	2h84erVPq1yf0x5HXh4R+shc/NzBNqmZNTS2ubFreqELu+hHnz4Lxj4S4Oc9PwJaJh0PJjRMo19
	djGCgMTbWVfVuwGuk7gUsQ7w86F8j8pg==
X-Google-Smtp-Source: AGHT+IEkxef+2RXJnVv1MDtMP+PBPYplJlT6jEtLbLvDmINhz/OHYKIorQbjuGU7uu0HwrhH5KQd7w==
X-Received: by 2002:a05:600c:1381:b0:475:dd9d:297b with SMTP id 5b1f17b1804b1-4776bcd2cd2mr7382915e9.33.1762473439445;
        Thu, 06 Nov 2025 15:57:19 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4775cd45466sm129470525e9.0.2025.11.06.15.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Nov 2025 15:57:18 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 0/5] pinctrl: airoha: add Airoha AN7583 support
Date: Fri,  7 Nov 2025 00:57:03 +0100
Message-ID: <20251106235713.1794668-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This small series introduce support for Airoha AN7583 pinctrl
support.

Most of the changes are generalization and cleanup of the Airoha
pinctrl driver. These are needed as all the array in the inner
function were hardcoded to EN7581 and didn't reference stuff
from the priv groups.

Everything is changed to match_data and priv struct so
adding AN7583 is just a matter of adding the structs.

Also the schema is generalized where needed to address
for the small difference between AN7583 and EN7581.

Christian Marangi (5):
  pinctrl: airoha: generalize pins/group/function/confs handling
  pinctrl: airoha: convert PHY LED GPIO to macro
  pinctrl: airoha: convert PWM GPIO to macro
  dt-bindings: pinctrl: airoha: Document AN7583 Pin Controller
  pinctrl: airoha: add support for Airoha AN7583 PINs

 .../pinctrl/airoha,an7583-pinctrl.yaml        |  402 +++
 drivers/pinctrl/mediatek/pinctrl-airoha.c     | 2523 +++++++++--------
 2 files changed, 1706 insertions(+), 1219 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml

-- 
2.51.0


