Return-Path: <linux-gpio+bounces-22185-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 162A1AE83AB
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 15:07:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 413F71BC7013
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 13:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5ECA262FD8;
	Wed, 25 Jun 2025 13:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="icm/Mvd2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFB32627F5;
	Wed, 25 Jun 2025 13:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750856839; cv=none; b=Qi6zFOKOccF8SuBCnWPzwTmf60wvH7vBAKIaqAPBrnMwZwdtxGAlfvf1yeCN3fmKE5ZmbngQGGCH8IscPkqdSzALbpxqV+i+mAMP8gnZUk9JDkC+Z69GIFNEDpKNvtNFKy/mUDHal1vzM5zA9M+lY72zRPuptVV/4XAIrno+hFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750856839; c=relaxed/simple;
	bh=bbUnagd6HgP2mLqisv6Njp0QVtUfIwOqRrCeKLQBu68=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NCMp43oQIKp/F0Snrw1Z1Hwarn4cEKl+zd6tI+69nwG8dPIRlttLe+WLqOexnKMWJGdQdOhoeWgOf3KnGoLfe5ALJ1BIVt/BdeaRMuWXuCUxSdj5BlqxPYtIIeHIbKyKJ1/s8ShVAPJoW8PbKuNnz89yJw5n0aaqDAVJuFGo3hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=icm/Mvd2; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso10542205e9.1;
        Wed, 25 Jun 2025 06:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750856836; x=1751461636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aodqOxMsoiNB/ZkiQC9pL2VvEAv3ip8ElAT4EIwNH9I=;
        b=icm/Mvd2QbE0B01ijA5MCLhItL587kK1CmavRUgsFtbfxPPnQQQ5xDKBGXWv8B03jK
         /xXUpjHNbJwFBKobVTf15YRdDx5GGhXxOacs/bQ3W14SYuWNSjJ8DLKstCXVdYKe5toH
         zactmlAwUlyE7VNgccMJBYCaW55/ErehWOiSrNcD8FVuv4yLbldmV6B2KWfvpVf/DDDm
         299afXTWPOPoNLJr/xB3bLd1l77j9HhI4EB0faSwI2syrB8slUl81+bQSCp1GOQg9nJ2
         NuoNOO4qVvO2QXiBxKXe+5XO1cUWiq5hWO+6lJp9n4RzuJk+ZEfjvAEg6eLTY6IR5vzC
         AKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750856836; x=1751461636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aodqOxMsoiNB/ZkiQC9pL2VvEAv3ip8ElAT4EIwNH9I=;
        b=F9wIS40iNFBiPgiibxjva2Xg/Y7qOrTWcqGgMYMAcm37B41LssR48C1eqWyfeR0V8c
         225fk8+55hTZ4YuaFej10D2wVyRiUkQl0JiWiQg8Ds+NJY7LsTMfFJ3iie+hRey/M2u9
         L0uxlgGqv2Ok6inr62zonvnMwYKUiz204qvUVlsiBeyiDlzjuAi6id3Bq2S2Lq/EX/JJ
         SZNH69COhO4G+5mBL0jTAOaCS4VDq7eL79TAgOxuduorsv8LWE8OjYR4tSL8yo5MJUIn
         scsAATeGnIW0i/XZtZVe9WkHKJ3N6NiuV45dPFHFJhGkYWsV8DDnZaFZdaL+QrtTM2Mo
         U9sA==
X-Forwarded-Encrypted: i=1; AJvYcCV3vMCD90VpPIynuV8KtnBgEBzdjudCWApudD0mB3+AK5CwjlZPP6h/Ri8tnR3tzftexsjFKoDGqzLfRA==@vger.kernel.org, AJvYcCVuSdVzB8grujyyKp05i+HpZZyy5LgOfDlJqffirslksEJ27le9JKZVHLgfOhpqvvGuHizM3EnuCZfx2air@vger.kernel.org, AJvYcCXahOQiJxvbn71BZBG0YoeoifHIaRLcWDcAHZnFFBH/PwLz9Vz7+8pguRVNHTRLx9XI9LnrSmQ5dHTF@vger.kernel.org
X-Gm-Message-State: AOJu0YxDKs3Zg45aHoRHpWZRwutAqezZFwgn/vfAFaoF+G7qSnXSgoj4
	a9+ULnWAZ91vhzIW4OwhPTpLP8yWzVpGhofse2nx/403miOp+czIpr6N
X-Gm-Gg: ASbGncsnfENzmQAA8fGPmFwY6SG6no0sTw3EBxACcYAh+6Z6OVxS7L8kqj7L7AbIiiw
	ztUxyQoEeM3ggVR7FIbRTNIUJBgcdwPtcBEql1YpX3gVLhL19+dQK1L0SywrzVrWEQHxssrxuU3
	SsVKQ5PK6tBUJL1jwd6HnERQlyoENt3IJTYZ8sTWeKEUM9Yavlf9kDBh+NtVSgL3zYqmZ7wXaVH
	EbV9dWa7ibZlP5FAc1EOGkXM3puxF2poZublLxyWcDXfXixDuCR1rRX7JI9GA0L5O5mL+v1K9Od
	qisZzYJAYMWdoKoL6RXr5bPXj+5klsOd9cZZa/F94IaP8eVMlK6lwuTnmitRMnvX10De1CSq6E8
	N1DEXGM7QsC32kWAYRyx2
X-Google-Smtp-Source: AGHT+IFQpKwYwphL26lLM9bt6iRvWEtZmsaqufhlRzBgKYMgVU2DLIDSC6VGjQhS31A2sFga03jWcg==
X-Received: by 2002:a05:600c:4594:b0:450:c20d:64c3 with SMTP id 5b1f17b1804b1-45381ae454fmr32156195e9.18.1750856833965;
        Wed, 25 Jun 2025 06:07:13 -0700 (PDT)
Received: from iku.example.org ([2a06:5906:61b:2d00:c47e:d783:f875:2c7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810977esm4548501f8f.83.2025.06.25.06.07.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 06:07:13 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/3] Add pinctrl driver for RZ/T2H and RZ/N2H SoCs
Date: Wed, 25 Jun 2025 14:07:09 +0100
Message-ID: <20250625130712.140778-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

Add pinctrl driver support for the Renesas RZ/T2H and RZ/N2H SoCs. The
RZ/T2H SoC supports 729 pins, while the RZ/N2H supports 576 pins. Both
share the same controller architecture, and the series includes
documentation, device tree bindings, and the driver implementation.

v1->v2:
- Added a new DT binding file
- Added support for RZ/N2H SoC

Cheers,
Prabhakar

Lad Prabhakar (2):
  dt-bindings: pinctrl: renesas: document RZ/T2H and RZ/N2H SoCs
  pinctrl: renesas: rzt2h: Add support for RZ/N2H SoC

Thierry Bultel (1):
  pinctrl: renesas: Add support for RZ/T2H

 .../pinctrl/renesas,rzt2h-pinctrl.yaml        | 132 +++
 drivers/pinctrl/renesas/Kconfig               |  14 +
 drivers/pinctrl/renesas/Makefile              |   1 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c       | 816 ++++++++++++++++++
 .../pinctrl/renesas,r9a09g077-pinctrl.h       |  22 +
 5 files changed, 985 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzt2h-pinctrl.yaml
 create mode 100644 drivers/pinctrl/renesas/pinctrl-rzt2h.c
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

-- 
2.49.0


