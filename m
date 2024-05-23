Return-Path: <linux-gpio+bounces-6588-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E268CD212
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 14:16:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC8E81F218BA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 May 2024 12:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15F6A149012;
	Thu, 23 May 2024 12:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUftzFTj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83D13EFFB;
	Thu, 23 May 2024 12:14:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716466489; cv=none; b=sMNOQqzinO+XVCgrW2fOn+TmYtmHzIpikMeuPERyKT39jdTrSPWGL9ydUKqoOgZfTix9Cy4nXU4I92LAXk1WsJMnIP+6wBFCITCW0HNd1hh9G0v0213hcdxi7zUpXRQOYgJbTX6A/KT/ehOL8pr1Fjnquqq38mcegIkDSlFYB4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716466489; c=relaxed/simple;
	bh=tpZ43iLgwhzMpQ4jhyu4aR5C7L7JyFApng9aEdXunQY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Tri/12axAcr6un5MjC41cEc3DjrUvYMef+ckNG60q3HenGnebeDyDS3XoMcAnkO2LKKz3/HDIGZ6YpQmqifW8CSMb5B/bBJMhCVLLabUc3nN8y/nf0E0IljE7vliMqUSkT1yFJcyIi2ic6K8Jhv3Ypbyxd7aEPT1BNwqqrHIg2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUftzFTj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1e651a9f3ffso114023465ad.1;
        Thu, 23 May 2024 05:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716466488; x=1717071288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJJ+dpO9JAqVVNhYRIjTougt3/8fCcumUWusy1MIytw=;
        b=ZUftzFTjKaaGFIYFYr+TSGZ9ZnFpRPGYc5ILvTDTMQI2Nxe2h6C2i2Hj6oq8gPTCgm
         +ERsmouxrxc+R8m7SONBa5B0rMpqoDRIGLJnDyEjwLO+wQ8Sak/yhXrIF4ux9+AR6oYX
         h+hpwOQs6jkdr/rfGGE1ZVH5eznkOS69BsbGI7DtjDyeNsolE7nw8reS4GYemwRXe2D/
         6jSaZvj6LMLDJgRb+Wg2u3TTlY4n0KAyHl5F4OA/dLA5zJiiNP3Dts5GPYyoNZrvFU8E
         K5x68DO58E1S+qWEUduDdX6RPjEIntoTNWsvLXLCPZUWTu+WGVxCOuRoqRvfqvyRWhdJ
         rUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716466488; x=1717071288;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UJJ+dpO9JAqVVNhYRIjTougt3/8fCcumUWusy1MIytw=;
        b=EL+MS+8nB2ZCJRUb3m2QXqZi0P7t+XelHA70eMSEW+p7YKKg+q+RY4LjKbBIz24z1Y
         rYt3xrf7Gj98zj3ck2i2FZCw0DP9EiswVPW9nNsgr1cmaBkK3Cvw4Q39Gj6he9S09qOE
         DUTEOGH7w0HCzNVrDrIfYRpRVJfish7eNo0iPBmPThILhYSI0ztkp/5xKwHuCJq16nTT
         t7y6Wn7/MF75h1HWoMCMYfT5KIaMfBCErtFfdVAb0QDSJrcUXQX6FLXo723+rKLR4Nsm
         UM/suLQTrSajXw37d31Qwcv40MPo+cSo0xtXh9ZKDiZZ/Rz5/cPXm+2qGug+H46KS8XO
         D79w==
X-Forwarded-Encrypted: i=1; AJvYcCVfcc/yzkpPiKd61+UFzIWRy6J7MyqP7FQF8aVEnx05M+CPn5a6bmGRyhMXQA1XjlKoQSVmH6LwkK9UJmyiPUE8yaJmswXjMfRBcvvz
X-Gm-Message-State: AOJu0YyAkJaKLx57F7588Nxw09CU6Wu9eTfv8yOZcycXDOcgkVYjX5z/
	+b0Nn5Qw7bw6FjLGEm1ewmTDmxAHJEXSwoPg7T8Lq6MBS2taktv2
X-Google-Smtp-Source: AGHT+IFYcUzA5CwAJk5rfFUulo6YbuYiEap59lESbOBJQZWy5ULKulA7xz4H6F2E9uY0iN1e9Tacvg==
X-Received: by 2002:a17:902:c950:b0:1eb:788:b424 with SMTP id d9443c01a7336-1f31c9dc0a1mr52461245ad.43.1716466487955;
        Thu, 23 May 2024 05:14:47 -0700 (PDT)
Received: from VM-147-239-centos.localdomain ([14.116.239.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f33569120esm16554975ad.284.2024.05.23.05.14.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 May 2024 05:14:47 -0700 (PDT)
From: Yongzhi Liu <hyperlyzcs@gmail.com>
To: kumaravel.thiagarajan@microchip.com,
	vaibhaavram.tl@microchip.com,
	arnd@arndb.de,
	gregkh@linuxfoundation.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jitxie@tencent.com,
	huntazhang@tencent.com,
	Yongzhi Liu <hyperlyzcs@gmail.com>
Subject: [PATCH 0/2] Bugfix in the error handling of gp_aux_bus_probe()
Date: Thu, 23 May 2024 20:14:31 +0800
Message-Id: <20240523121434.21855-1-hyperlyzcs@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The error handling of gp_aux_bus_probe() invloves issues
related to double free and memory leak.

Yongzhi Liu (2):
  misc: microchip: pci1xxxx: fix double free in the error handling of
    gp_aux_bus_probe()
  misc: microchip: pci1xxxx: Fix a memory leak in the error handling of
    gp_aux_bus_probe()

 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.36.1


