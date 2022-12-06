Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83200643F46
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Dec 2022 10:04:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234507AbiLFJEt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 6 Dec 2022 04:04:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234513AbiLFJEr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Dec 2022 04:04:47 -0500
X-Greylist: delayed 1124 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 06 Dec 2022 01:04:43 PST
Received: from www530.your-server.de (www530.your-server.de [188.40.30.78])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03C3D1DF18
        for <linux-gpio@vger.kernel.org>; Tue,  6 Dec 2022 01:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=geanix.com;
        s=default2211; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
        Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References;
        bh=8Lbu0znad4w6QSWpTch8G6hazeaVzQ17hjaxiLhQpeY=; b=TAC2Uq+ejFauiep1iLIk8Or7L1
        nZ/6r1d0DX3Cd328eOLwGLIlgwK1Jtqz+rdh0jdBVH+vHxNCt41dRMDsADap33XkBIKLCeDWJi6oq
        QtqMGoUepJjVROLxb9b5J61aPheB4PPFUy/jnhu1lqeRzyAE9OQUtPKvKYy09cLfTE8oxqhmgitwn
        z2zZpQ7Gi1i+c55zNs09UTQyFD4LFYtcuAeHkhvhKhTECbSsmIILUQiF+WXTSs2eFY88Nm0HOlym0
        H8XoQgzsZwAfNxK7DPxMS42scKWu2XrMqPw7Zy0AI7YW+xXbkmIjhfI17j/5edf2YaG1yurE3iHEr
        9Cahe9bw==;
Received: from sslproxy06.your-server.de ([78.46.172.3])
        by www530.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <esben@geanix.com>)
        id 1p2Tb4-000FGc-5l
        for linux-gpio@vger.kernel.org; Tue, 06 Dec 2022 09:46:38 +0100
Received: from [87.49.146.167] (helo=localhost)
        by sslproxy06.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <esben@geanix.com>)
        id 1p2Tb3-00021l-VT
        for linux-gpio@vger.kernel.org; Tue, 06 Dec 2022 09:46:38 +0100
From:   Esben Haabendal <esben@geanix.com>
To:     linux-gpio@vger.kernel.org
Subject: [PATCH] gpioset: fix memory leak in interactive mode
Date:   Tue,  6 Dec 2022 09:46:37 +0100
Message-Id: <f36e4eeee8c5bb96cddcad31a3762c10406a99e9.1670316057.git.esben@geanix.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: esben@geanix.com
X-Virus-Scanned: Clear (ClamAV 0.103.7/26742/Tue Dec  6 09:18:20 2022)
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Even when readline() returns an empty buffer, we still need to free() it to
avoid leaking memory.

Signed-off-by: Esben Haabendal <esben@geanix.com>
---
 tools/gpioset.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tools/gpioset.c b/tools/gpioset.c
index c49d229870d2..f087003af1c9 100644
--- a/tools/gpioset.c
+++ b/tools/gpioset.c
@@ -768,8 +768,12 @@ static void interact(struct gpiod_line_request **requests,
 		fflush(stdout);
 
 		line = readline(PROMPT);
-		if (!line || line[0] == '\0')
+		if (!line)
 			continue;
+		if (line[0] == '\0') {
+			free(line);
+			continue;
+		}
 
 		for (i = strlen(line) - 1; (i > 0) && isspace(line[i]); i--)
 			line[i] = '\0';
-- 
2.38.1

