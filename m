Return-Path: <linux-gpio+bounces-9408-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CB67A965047
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 21:57:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 807481F215D8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2024 19:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2289E1BF31D;
	Thu, 29 Aug 2024 19:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+wGJm11"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B801BE86B;
	Thu, 29 Aug 2024 19:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724960984; cv=none; b=NGD95BA5Q0LcdDb26YoSPMEY5aaMjyxvQ8pB0wkRdjWgbRMHVg4yXkX5BqOQGELJmvYgKv/7E7hYCiA6qk5OqnTAVUcHtKswc9k38imyRfXWXpLfY0BscsXof7eVxH+qIe3SsvzaP1SyUlGvm4uSGBblzUH7YPQTYNXfn1nMVWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724960984; c=relaxed/simple;
	bh=B+VZDW+reSUQK5nS9FdJvYKmz4zjkV/Qi9Nb4rURoyk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r2aNoo9zOkLPu/0ikQIMdV6+jnAj/x5W9C54jPhh87+eWMPi3ntfZv5v3UKDIFElir+vaaF/e9pDe0D7C3Vp46Q8xJuVfO3wiHoBNlXhdNwGkjdNhRi/yoweeC+hDz+hp9AscFyLN/aBfaZaWORKIDfkNr5ziTIO8bLSN0uaXz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+wGJm11; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-42ab880b73eso9695575e9.0;
        Thu, 29 Aug 2024 12:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724960982; x=1725565782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G3vyW/lW31RInU1/dRiaphnS1coo72kCEE0tF1KlQGg=;
        b=B+wGJm11yQxwz46Fsibd0pCgXVqpkunHT9tpuS9K+CR8tm6ROlFZBAh2qKpsEaISLn
         ieJknpJwsQGIPM7u0bbwsSQJ+QzshsQuPLpD6HaM6TmqE8HxHh/vnizUhqxkBhbUOMVr
         bspj5HfWr3OFJ2Hz7mun7h1Oa8dyxhpm9LMYAegRbQJcjIkR31d6THWrWSkOiKTBVFEl
         HfgjSidqxijlfw36dQxiqmZTdGdmcWX2H8oZP7y5sffdyEVvUat4xpzefzRjLnYkAb1Z
         PCRMxBsan/XtNruV+vWz5B7MvGq8dXnseiCm3TbbpBVDsrE+m3uLTLU9hr/M2CE3iuiL
         qPug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724960982; x=1725565782;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3vyW/lW31RInU1/dRiaphnS1coo72kCEE0tF1KlQGg=;
        b=r+yAu8yFt80C4/9whyX7hphJh2h08wE/ZaJxxN9xKkA25aXEsreiPdfNzdFCII4cbz
         TYzzf8GEkATvSZOgWYt0qBZdyAIer8KUVzB1IjhX9kPZb9C07giC88y0SymGMy1GXEuc
         Cqd9RyBPbGbWcgxWi7/Q7G7ALc5fcu7j50E5P5ifo3EHvrctiSft3jUQl269/b5juq03
         Zdwss+kT3svVrUTmlFSSV7UcWj83mObG2ujP+6o+/1K3fIp7e2hGCNNK/rRG3yw3OS2/
         D1KPvOYc0HiOgThEWOopDdSPU03RmWtz/Ar7sZ6Z8Bkqct/02iR6hLNyvBl2K1NeaNQT
         hQ0A==
X-Forwarded-Encrypted: i=1; AJvYcCW77Kr2Kx03VBWqK/l/wYZVdhn5CzfCoPmctTbkSL3mAyAMRg96Eb6Vls24yWqBnpySb8CiiDXpkjHf@vger.kernel.org, AJvYcCWmjnPBwwJNgy6u8WoEmpZ6WVcPvgV1pOyQ5Iwxal02DrrVfWB66AK6+4fEQrAzBTjL4816J8FbLVJ63pjY@vger.kernel.org
X-Gm-Message-State: AOJu0YyIMAEJeopR3+Tf/YFkClVYey8m4GwK2KFzi+t4S6i5rOASbeXa
	cfMXZV64HuyXHzt6cySb2JTAZSCl3+2sOIauOfqbf0ntOg0y0FKN
X-Google-Smtp-Source: AGHT+IEwHxx9NOiifjtLbLki7BYfJTty+CSK4JLbFAqKfs/FcfAZUB0W675krBSMFOZw7eBWGV5/0A==
X-Received: by 2002:a05:6000:402a:b0:368:37d5:3f2e with SMTP id ffacd0b85a97d-3749b54d465mr3248523f8f.32.1724960981503;
        Thu, 29 Aug 2024 12:49:41 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:a26f:c074:4086:5001])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c226c6a327sm1027891a12.4.2024.08.29.12.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2024 12:49:40 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/2] pinctrl: renesas: rzg2l: Simplify noise filter cfg macro
Date: Thu, 29 Aug 2024 20:48:38 +0100
Message-Id: <20240829194841.84398-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series simplifies noise cfg macro, by just adding single macro
for configuration and while at it simplified rzg2l_pinctrl_pinconf_set()
function.

v1->v2
- Updated commit description
- Collated RB tag
- Replaced `pinconf_to_config_argument(_configs[i])` with arg in
  PIN_CONFIG_POWER_SOURCE and PIN_CONFIG_DRIVE_STRENGTH_UA switch
  cases

Cheers,
Prabhakar

Lad Prabhakar (2):
  pinctrl: renesas: rzg2l: Introduce single macro for digital noise
    filter configuration
  pinctrl: renesas: rzg2l: Move pinconf_to_config_argument() call
    outside of switch cases

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 66 +++++++++----------------
 1 file changed, 23 insertions(+), 43 deletions(-)

-- 
2.34.1


