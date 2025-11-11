Return-Path: <linux-gpio+bounces-28368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 141B2C4FED5
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 22:55:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8418189B53D
	for <lists+linux-gpio@lfdr.de>; Tue, 11 Nov 2025 21:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 625052F1FDF;
	Tue, 11 Nov 2025 21:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DYVgh0nx";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="i/xICTU6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C202E62A6
	for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 21:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762898113; cv=none; b=l1JmacwkZi7LE5beOCLeTqHqx6MLlKL66duzmd5odweuCHlCGTlosniBLGuBJ8AMEHINNDnxo4MLEBqFTOW3awY+z2R1d0PL8/ZQB49nsOlxoNrlHH+NY2+S8aH3aI1yTd4SWjanb6UNwrgoak5m9g2gqQBwb5CmWfm+/4uirLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762898113; c=relaxed/simple;
	bh=MdOVB+m45rMEFDn+Bq+cwePT0GndRxWDbiIFqpt2YCc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ihnVTEv5Qn5X6lVbCx+NuYYNeJojQKpWXkc1hZ4cAS4Y8u2XK7ZznhQlNunkRbh6yfYsuBEiL1sWj1P1KjPsqAU5uI+55HrnmKUJnU9IVqtMBs7TtCVGa5+oc2HgCeKkMbh4T5I+P8lLTAxs1aDAeIXPASebERa8NHxr9qLkPOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DYVgh0nx; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=i/xICTU6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762898110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sekYXjOrhbrEeTR1KVQQRJq/2k2UhXo++7CMidIcSxc=;
	b=DYVgh0nx7Wx8iAw/pxev1Z9Rfnxpdqedcte/3fPO5h4cYL9gtAoCVTgIyuJeDvW8GjCyfN
	uiQ7v7QuQKQNFUyHEdCOYE9H6OQpG6OOUonWhFehgiVblsPPWkAYpl+argkrNGsdfpYBxM
	nptBJwOAskctZ6SW4AcCcse5SUp8YMs=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-RxqY3VJ7MXOPNe4E_w1bgw-1; Tue, 11 Nov 2025 16:55:09 -0500
X-MC-Unique: RxqY3VJ7MXOPNe4E_w1bgw-1
X-Mimecast-MFC-AGG-ID: RxqY3VJ7MXOPNe4E_w1bgw_1762898109
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2640347c5so61187285a.3
        for <linux-gpio@vger.kernel.org>; Tue, 11 Nov 2025 13:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1762898108; x=1763502908; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sekYXjOrhbrEeTR1KVQQRJq/2k2UhXo++7CMidIcSxc=;
        b=i/xICTU6a9PFbTZ67fJO7jqs2qoiVXOdu4HOeWIrWrjtjMPX7EwLUxBkiL7pGwcg99
         6dP2VdrRRgGJgpKedNGDkgZgrgfTJ+rCd3L/blWfeirY254x/tqwQM27ZLyf3r4gFvEA
         0S7GZMp42JceWiGk1Xa+8kOvmPiJwcknRE2T2OPeoccPY9bddi6APktRpxmqpmldapAs
         SIqHw9JyF27DNppQDvCbV+WH9x1bxvyJdFR2DLAxi7YQ67NeoN9Y/yZwglML+gwx4OFt
         oc4GtdGCteMZqUkcHjMopny/5QR9TeG3Bgbg2glYE2Xx+bWtUaw2QnmQzeDgF1Y3cFL9
         jf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762898108; x=1763502908;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sekYXjOrhbrEeTR1KVQQRJq/2k2UhXo++7CMidIcSxc=;
        b=UpxlinS1DI4y0w3tXl+UlvaYQwIvMKVafJkra+s6Ot3jr/I2JD81I9gu1U2oxXsdFw
         dajN8NDQoUSRPFOgSzUnVQyd5XI1YimmS4PsrlC4wfF8kjjRbBh2NtoZiye28uPeMhEH
         bxEdI2oVML2yXdTTX6PaiBI9OZUgPzLwy5myZA4yOWn9I3tm+GRTX9gG/VI1U1ZMwd6E
         Ht7oEYyRuvQH5ooKfeEjmqP8shVG73rkeuYOedGNK0M5uNIawsqjeAKTve70ru/7strb
         bsc8iq6sW98ngUe4Fi9A0r1gGFlMLOPbhnhWR9mErbIo8VnIOvfSelLEzlKPL8DLwI69
         lfbQ==
X-Gm-Message-State: AOJu0Ywd2nZ5AuK0UACRL0ufI3lM87UKhDtI5YGvdd80wfd/4GhdRhWV
	ZfNcLVQj2KE5lYR/xfqLiAdH91MiecidSGjrEQjWlyK/dghZ+r5VXxk0gAM5tbrS90GY+TAsg4S
	YHCwxrUPvyE0eyLjcUUgyULPYYVAZDYk177cAij3MX+fAPImpP5zbr5zTRIoZqvaSVaEypqo=
X-Gm-Gg: ASbGncu17ki7O08HPUdrsU1okckQrwuFFfPE+4DtmYGLPbtEScL9bS2fGJ11I38GZhl
	9luB5KocwNX41Ozg2G5sYo1hSCNsoG4BIQgIetszxm6xoCpCmf+ASIseR30Tm8kFQQrwSZCHLm8
	Vl1062btdzsbsu2kuQxtOJRgpieC+GHjBlUch0ZW0M7Cl8uyveU54eRAnObN9C81iGpHHFzQNjl
	ZEt4DejGTt8laAzVuhPIT5SQcrqPuzl4cYbgq+Vupt5fMtNozFOzLoIRA6hjLje+xN57MVLTRMR
	8JFsZX7SHe3i8w2LPDMizj4PlbP8MuJr1HoNk++CgqaRBdgBAcNn/rVZIC5/RhDlz1T9IDQCiui
	WMXmjp1GyQarz883+4fqRTzgDZ/Q/Zjk=
X-Received: by 2002:a05:620a:1997:b0:891:c122:4296 with SMTP id af79cd13be357-8b29b7daae7mr119516985a.41.1762898108656;
        Tue, 11 Nov 2025 13:55:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3q6RJGL4tXdFv0MBpLJ0zIlSCrqGboU4B0wfcb2rJgjVxJ9n2CSCtq7Mqu5LGBcREsoJ/Cw==
X-Received: by 2002:a05:620a:1997:b0:891:c122:4296 with SMTP id af79cd13be357-8b29b7daae7mr119514385a.41.1762898108252;
        Tue, 11 Nov 2025 13:55:08 -0800 (PST)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4403:8750:d964:d6a9:f204:ed2b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b29aa032fcsm61335085a.49.2025.11.11.13.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Nov 2025 13:55:07 -0800 (PST)
From: Jared Kangas <jkangas@redhat.com>
Subject: [PATCH 0/2] pinctrl: s32cc: fix uninitialized memory issues
Date: Tue, 11 Nov 2025 13:54:10 -0800
Message-Id: <20251111-pinctrl-s32cc-alloc-init-v1-0-071b3485b776@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIKwE2kC/x3MSQqAMAxA0atI1gY6OIBXERc1phooVVoRQby7x
 eVb/P9A5iScYageSHxJlj0W6LoC2lxcGWUpBqNMq7Xq8JBIZwqYrSFCF8JOKFFOpFk1PBP1xls
 o+ZHYy/2vx+l9P8MHwpZqAAAA
X-Change-ID: 20251106-pinctrl-s32cc-alloc-init-cb04ebcc72f3
To: Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jared Kangas <jkangas@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762898106; l=2516;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=MdOVB+m45rMEFDn+Bq+cwePT0GndRxWDbiIFqpt2YCc=;
 b=AdTasHXTJYSkS585uvDHRJ55IZFnrgZJSfaxnaDSGB/RTgB+JoI7jS7M+GDTllmpRwiXRd6KK
 tUaoDvX0B3UCOC4ZPo6dQSBEoeXz6M5/Hr0bB51+McJESjBxOOOBew7
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=

This is a small series that fixes some uninitialized memory issues in
pinctrl-s32cc. As an example of how these can affect the kernel, when
probing i2c-imx, a memory allocation may fail because of the
uninitialized memory giving a junk allocation size, which prevents chips
on one of the I2C buses from being detected:

        # i2cdetect -l
        i2c-1   i2c             401ec000.i2c                            I2C adapter
        i2c-2   i2c             402dc000.i2c                            I2C adapter
        i2c-0   i2c             401e4000.i2c                            I2C adapter
        # i2cdetect -y 0
             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
        00:          -- -- -- -- -- -- -- -- -- -- -- -- --
        10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        20: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        40: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        50: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        70: -- -- -- -- -- -- -- --

Compared to when no failure occurs:

        # i2cdetect -l
        i2c-1   i2c             401ec000.i2c                            I2C adapter
        i2c-2   i2c             402dc000.i2c                            I2C adapter
        i2c-0   i2c             401e4000.i2c                            I2C adapter
        # i2cdetect -y 0
             0  1  2  3  4  5  6  7  8  9  a  b  c  d  e  f
        00:          -- -- -- -- -- -- -- -- -- -- -- -- --
        10: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        20: -- -- UU -- -- -- -- -- -- -- -- -- -- -- -- --
        30: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        40: -- -- -- -- -- -- -- -- 48 -- -- -- -- -- -- --
        50: -- 51 -- -- -- -- -- -- -- -- -- -- -- -- -- --
        60: -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
        70: -- -- -- -- -- -- -- --

Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
Jared Kangas (2):
      pinctrl: s32cc: fix uninitialized memory in s32_pinctrl_desc
      pinctrl: s32cc: initialize gpio_pin_config::list after kmalloc()

 drivers/pinctrl/nxp/pinctrl-s32cc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
---
base-commit: e9a6fb0bcdd7609be6969112f3fbfcce3b1d4a7c
change-id: 20251106-pinctrl-s32cc-alloc-init-cb04ebcc72f3

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>


