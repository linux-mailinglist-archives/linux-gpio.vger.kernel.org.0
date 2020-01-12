Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F0E4C1386CB
	for <lists+linux-gpio@lfdr.de>; Sun, 12 Jan 2020 15:33:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732923AbgALOdZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 12 Jan 2020 09:33:25 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:45159 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732841AbgALOdY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 12 Jan 2020 09:33:24 -0500
Received: by mail-pl1-f196.google.com with SMTP id b22so2783166pls.12;
        Sun, 12 Jan 2020 06:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVg/F2RNpDB9kBXeS+NVyoBtj6BWxNkqjrNEvbi9DZk=;
        b=KEEn1sRjtTmXw5h+uBGaJmzi+EsGLLNHvw4zux4GqzAHSDN8+GkM/qO09wTHBjxTT2
         k0Ai5OophxVwOmtczeMSnie7Nxnr66oyZMatSN14dxQtEiY9jMUYfIXEzL3PEW4b1T1f
         Z7dffQN9cxipKaVhC0eMtnnrBw8Vf3HqYBfFtvNX1alySxeNxkeXJsdj8VVED4OB9enF
         d/sOK3HFYGEXmTiPyQS1vIbbYYKxnz+XcKEcNFZUdL1l8/j0EJrWeoejl/Blhv95g0To
         D7FRAp2UKYLbr+eLBW/3EROjnJsb71EGyZoD3xrcsM8MQKX63/H2Yjxk0wjeM8+b4UHn
         Z/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UVg/F2RNpDB9kBXeS+NVyoBtj6BWxNkqjrNEvbi9DZk=;
        b=FfgY9mvEdaV1c4E9wPufHN8MF5PYtoT2wFBfw2u2Y1YOEDIoPLCCKHpnEZPzZho/aV
         uay9bE3cmRmjywtzG7SHV9WZ1pRhjprSAtz4qC2yZ3rR0ay0SUTarZkpe+UuLxrJsYmk
         vaYErPGqFuSsoFr8Qm1YyKd+IPIt0Ma2sCJCWZ6shJOQkRnvODF7m0nylLhhE/xUE3Yr
         S6Qi+PW0xmH/kNZAE9rGD9QBXA/WPs7JtJCZU3FRAZzIykwQyjfeZBYBQYg9nQ6Tr8m/
         jceZ5C0CXNy/Y7lUOQ9K/aUVOl98z8sVams/b1OZfnQjOjGEa15zBDDZD1TOe8V8x8CA
         eTKA==
X-Gm-Message-State: APjAAAUWrGxa8pjbh4Max7UWM7CULdUZ5N85BXZcl7xoFbCbt7g71Wco
        0wZ6O2L4bHGORBIgf251mUc=
X-Google-Smtp-Source: APXvYqzG4NH4BoSyqQj+gBN4li8QAnYRWgGx9+iZvgxidRhEmKte0t5pq+i6/vrc580B9MqEeyBJnQ==
X-Received: by 2002:a17:90a:1a14:: with SMTP id 20mr17451826pjk.33.1578839604114;
        Sun, 12 Jan 2020 06:33:24 -0800 (PST)
Received: from localhost.localdomain ([183.82.121.105])
        by smtp.gmail.com with ESMTPSA id w187sm10738921pfw.62.2020.01.12.06.33.21
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 12 Jan 2020 06:33:23 -0800 (PST)
From:   sachin agarwal <asachin591@gmail.com>
X-Google-Original-From: sachin agarwal <sachinagarwal@sachins-MacBook-2.local>
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sachin agarwal <asachin591@gmail.com>
Subject: [PATCH] GPIO: vx855: fixed a typo
Date:   Sun, 12 Jan 2020 20:03:12 +0530
Message-Id: <20200112143312.66048-1-sachinagarwal@sachins-MacBook-2.local>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Sachin agarwal <asachin591@gmail.com>

we had written "betwee" rather than "between".

Signed-off-by: Sachin agarwal <asachin591@gmail.com>
---
 drivers/gpio/gpio-vx855.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-vx855.c b/drivers/gpio/gpio-vx855.c
index 4ff146ca32fe..3bf397b8dfbc 100644
--- a/drivers/gpio/gpio-vx855.c
+++ b/drivers/gpio/gpio-vx855.c
@@ -71,7 +71,7 @@ static inline u_int32_t gpio_o_bit(int i)
 		return 1 << (i + 13);
 }
 
-/* Mapping betwee numeric GPIO ID and the actual GPIO hardware numbering:
+/* Mapping between numeric GPIO ID and the actual GPIO hardware numbering:
  * 0..13	GPI 0..13
  * 14..26	GPO 0..12
  * 27..41	GPIO 0..14
-- 
2.24.0

