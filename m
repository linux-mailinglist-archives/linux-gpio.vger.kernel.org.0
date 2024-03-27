Return-Path: <linux-gpio+bounces-4684-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 893BA88D9CC
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Mar 2024 10:13:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 26FD61F285F3
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Mar 2024 09:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2837936B0A;
	Wed, 27 Mar 2024 09:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OqvcAHOs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8426F1C11
	for <linux-gpio@vger.kernel.org>; Wed, 27 Mar 2024 09:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711530822; cv=none; b=r1AFcyFNHuTHFXJuxnwK00j1UjFkX+CuGfLPJ/Ekj/Jgs+s2gDgvDks0Ds186OWAmePARTzdJmJpTOx+OSCTqng4tfBvc+m+m4vnf514yBJEH4ZYfmat5M/kofgRiur0NdO4csJiQBhkw9dr8pCYz8cpvdgoYeFwPcQ5QTltQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711530822; c=relaxed/simple;
	bh=PjDcWxabCM5zhojYO64Rjs9rcFKOjg+P9yQ2hF4+9bw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c1LcPFxOBzc4opjdr6hgOOpBAcUdreHFivvLiiRSspj76gm8cOW9fufWjFefZf8Pon/vgLLzbtnj0etiSUuQZf7UFPSFh4r3JVYfkOUuDF5X8RSgdE8+Oan7RRX/JvXc2UokEQ40eJRVO3oMP98jRWJ7iml9Cdo1TdKboBLs3zI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OqvcAHOs; arc=none smtp.client-ip=209.85.160.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-22215ccbafeso3149001fac.0
        for <linux-gpio@vger.kernel.org>; Wed, 27 Mar 2024 02:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1711530820; x=1712135620; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mxElVZwgDSK1YSb8hGRkSJE7Hq+zmgPYXh8LPg2gT3Q=;
        b=OqvcAHOsm5DHICqRPV1TBh7v9tcWsaLNgTuW2k5xXnDrPPlK/Ihh04JzxtK6RlXupR
         NPm6zR1HOvT+4ZAS4MW6TzgtKwuSWPdUda7xtzPqbyLqYmrFpyoqLeb5XLD4wWlER4M+
         yy9obZHcHNBQmoo/jPNQSWJK/MHLFOiSbVOdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711530820; x=1712135620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mxElVZwgDSK1YSb8hGRkSJE7Hq+zmgPYXh8LPg2gT3Q=;
        b=DsMtRWuhFQ3vRZux/KiNeQpJAiiPuF5ja6Ft6HZHleTOqDGRA8eX6xJL0kaotCDNXb
         kT+MLIxkHJWWnRDK/z6Dzqw/r/7gVREsKNIpNfOQ5HwcZbw+TOACP8Es5yHfYMudKmVr
         Q9LUobjZaXK3NIz4CsRSLgM8TjgZ41nZ/xQNysE7HvfRd4YbYGIq+BJgS6SfXdpLVXX3
         c7/3U37jQH440Rbtigndh/JOWctt818s6KAjK+zpOaiHxi2WFAWgz+X4Qq2o57bEEcWr
         utquBDybJUbSHkSbdKEoFAvSS4eiweYqdk5BpmQHbOulI+XAOP+tXQRFFYoCm1nbhra8
         zr7g==
X-Forwarded-Encrypted: i=1; AJvYcCXf4LZq1cO0vv/I5xUDllABTEAT502Q6I9NSU9MfCllkTsYY+/5YxaAnMWGxAJibxxFZ6Q2WbCPVmC6GWvFjE4ux52mq3oVtBxvRg==
X-Gm-Message-State: AOJu0YyjQW+NmJjhKrh5myDrlQzdiP/AtwjaUwhDrsb0KKeuXxcBjJHj
	0PKS12zOZkG2lAXxqTlRJ5CCII1IRTAjM2PRzpP460n4EmLfkiDDH4YO29EB3Q==
X-Google-Smtp-Source: AGHT+IEb932ORwMZAWuJMDZYxzAxef8XwPiw/kk7kOZAgwvVteC2Tlm4yt0lNUvQ8BGf1TisMGWnlQ==
X-Received: by 2002:a05:6870:1c8:b0:229:f61d:7e52 with SMTP id n8-20020a05687001c800b00229f61d7e52mr6040680oad.34.1711530820771;
        Wed, 27 Mar 2024 02:13:40 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74c2:3606:170b:52f3])
        by smtp.gmail.com with ESMTPSA id fa31-20020a056a002d1f00b006e69cb93585sm7342911pfb.83.2024.03.27.02.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 02:13:40 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] pinctrl: mediatek: paris: More pin config cleanups
Date: Wed, 27 Mar 2024 17:13:32 +0800
Message-ID: <20240327091336.3434141-1-wenst@chromium.org>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Here are a couple more pin config cleanups for the MediaTek paris
pinctrl driver library.

Patch 1 fixes readback of PIN_CONFIG_INPUT_SCHMITT_ENABLE. The function
was passing back the disabled state incorrectly.

Patch 2 reworks support for PIN_CONFIG_{INPUT,OUTPUT}_ENABLE, following
discussions on the bcm2835/bcm2711 pinctrl drivers [1]. The driver is
made to follow the definitions of each option as described in the DT
bindings and pinctrl core.

Please have a look and merge if possible.


Thanks
ChenYu

[1] https://lore.kernel.org/linux-arm-kernel/CAGb2v66XpjvDnTpi2=SPbeAPf844FLCai6YFwvVqvmF9z4Mj=A@mail.gmail.com/

Chen-Yu Tsai (2):
  pinctrl: mediatek: paris: Fix PIN_CONFIG_INPUT_SCHMITT_ENABLE readback
  pinctrl: mediatek: paris: Rework support for
    PIN_CONFIG_{INPUT,OUTPUT}_ENABLE

 drivers/pinctrl/mediatek/pinctrl-paris.c | 40 ++++++++----------------
 1 file changed, 13 insertions(+), 27 deletions(-)

-- 
2.44.0.396.g6e790dbe36-goog


