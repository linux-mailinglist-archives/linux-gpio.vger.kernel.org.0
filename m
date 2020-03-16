Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BCCD71873A0
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Mar 2020 20:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732441AbgCPTvB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 16 Mar 2020 15:51:01 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39484 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732366AbgCPTvB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Mar 2020 15:51:01 -0400
Received: by mail-wr1-f65.google.com with SMTP id h6so2471855wrs.6;
        Mon, 16 Mar 2020 12:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wO/Nb/2+NoykPSO+BGAUWCC7Mgu0S7xLsgIvGsI0kww=;
        b=dA75tfGhHbXLw4stenGMywz2mptw3aKK1hPHtpmfrFFj/wKU1vRhuYMChBVx+Bh1ZI
         6wCFBSAUSPlIfcvpEJxJJwRiEIlYBzREHEmLuUeBYz5Y3bk0jgz/qGy0wy1XyJzSu8oM
         hEZK3XBg7sjOYmzaTYGFmGRGBnpFwk7K5l7/Xn/PzcDcCzp72Eq3MD7e4GCjR8NlSjWV
         68vA97lKB6bY2GFG3peokQTpsT4n6gHfLzWpDNaln/vQxrDHoxU2A/dLT7L98v9wWS5b
         0MrJnnVBfP8iL/NinajqWyVPy7GjE8eYyiHcqIFlTq8zfjLqkKCxyc3ryIL2MkFWg9z0
         9cfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wO/Nb/2+NoykPSO+BGAUWCC7Mgu0S7xLsgIvGsI0kww=;
        b=TyTnA/Mp9BS5lR32P3BKBS9P6nQ/kdzvEXVKyiw32h8sJHj4JrhDbvmqu2kEf+RbUa
         3gliSfeGA/VYaPCtcFOJIv+vC51Rpj8XD7E57rsyAHorscfa3eQozcnJgddqlEEz7VUH
         BP877DnUa5jsRYgceBwGfhynpjDeWuwb9wLfcGHw9cCNwsjxAB2iDIomgOUeZOh1TP8T
         VZgy2LONTRRrvRFlAvxmZ2NapzY9wSQvgBDrTni0XYNxCdX2NoR55TV9KLBkXAaAlnEx
         P2CCsx8/D2pHD/Ig/PrswmQx2DR4uGGXn4Gp1yK242vi2Px8c1FVxsxIeVuCEq1eW64/
         59cA==
X-Gm-Message-State: ANhLgQ38m/6B5WVElkHsijm48waQn0Hn2mKesfpKcr+V7ljKv2R3WFK/
        LX0CQe6IBx7LnjR+S/z/B/w=
X-Google-Smtp-Source: ADFU+vs8LU1PFj34RIidHS3VPIyB4R8HBLOd+JwsmyPBR1vszBKvS72lMJXZRUu3qDS06lZCx/PZiQ==
X-Received: by 2002:adf:df85:: with SMTP id z5mr1080108wrl.39.1584388258538;
        Mon, 16 Mar 2020 12:50:58 -0700 (PDT)
Received: from gabrielDell.net ([82.102.16.195])
        by smtp.gmail.com with ESMTPSA id w204sm930080wma.1.2020.03.16.12.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2020 12:50:57 -0700 (PDT)
From:   Gabriel Ravier <gabravier@gmail.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gabriel Ravier <gabravier@gmail.com>
Subject: [PATCH] gpio-hammer: Apply scripts/Lindent and retain good changes
Date:   Mon, 16 Mar 2020 20:50:48 +0100
Message-Id: <20200316195048.2592199-1-gabravier@gmail.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

"retain good changes" means that I left the help string split up instead
of having this weird thing where it tries to merge together the last three
lines and it looks **really** bad

Signed-off-by: Gabriel Ravier <gabravier@gmail.com>
---
 tools/gpio/gpio-hammer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
index 0e0060a6eb34..51a65f8149ea 100644
--- a/tools/gpio/gpio-hammer.c
+++ b/tools/gpio/gpio-hammer.c
@@ -77,7 +77,7 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
 
 		fprintf(stdout, "[%c] ", swirr[j]);
 		j++;
-		if (j == sizeof(swirr)-1)
+		if (j == sizeof(swirr) - 1)
 			j = 0;
 
 		fprintf(stdout, "[");
-- 
2.24.1

