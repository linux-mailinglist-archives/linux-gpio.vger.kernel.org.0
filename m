Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5AA9B4A7E9A
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Feb 2022 05:22:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241568AbiBCEWs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Feb 2022 23:22:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233605AbiBCEWs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Feb 2022 23:22:48 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06650C061714
        for <linux-gpio@vger.kernel.org>; Wed,  2 Feb 2022 20:22:48 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id x3so1146821pll.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Feb 2022 20:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CTz+Zb3nuM0Ml5tqTW0KFgwUKo8tuquiqWfmc9a7zWM=;
        b=GP7Xu0PPrPVuUDoCu+EauxaWMOXtKM+TuM1rdENtdoJhyaPJTnJC/y/OX54YXi6Iv4
         kOlzrWbeHD4GSnUNtVaXMcRoROYP+JKIIAP9ln4pYOm3SnjQPcbaYtm8/2r41kCdS8VD
         Xa/lGe+pyKERhfftv6AU8iCmOZ1iwaMnVkj708r0jktX6xV3gKBPKyLGJu/CLOAM7HRu
         2ywnUaLlhD9250TD5T09dAg9a204EU434nlrY0K0jbWF6PTxFiXs5ktlIt+mWyVj4bqN
         PjQDdTY+8OPKkcEgT0OqmrMhOD6hNfqDlvAZzFiJZH+aGbpBK11Dc/a1HBYzEFswC5zy
         v4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=CTz+Zb3nuM0Ml5tqTW0KFgwUKo8tuquiqWfmc9a7zWM=;
        b=vutjPzQ3ecVNkqQ4FctF8M2tfHlZrQ7W29HbugBHaMgibY8OAPk8B0oNK4OcwolTOE
         RqedANABc1vMGpamQptAFrIiK+0Dpsjk+sp857+aktvuwTZOA3kJO/9vZhYPI1OHjX1G
         koWH9AFtRPmQN0dF9sEiv5cqInz+A3jQ4BrstUX8++XiFpSj663SHz4lyQPV+8j9ru/J
         3g1MXzYixi1v38ZRILWfu7GpnBeOf6I1mdVJD2AlGjBFzOGJgVonsG0/8WjUU0Fphp8M
         RDND9npZdEdlSOsgE1wLWq1usqQAxZiCylnNTark+AHpO+0gFdBMcTWIeWjOytjTM+1b
         7dlA==
X-Gm-Message-State: AOAM532KsjM+ZoN4YsIPxuHMQ99vU3BHD3urnkJ8D9rWkFE+uMzrCMRf
        G3zUjT3qvww6WSX4mD33ACo=
X-Google-Smtp-Source: ABdhPJxDzWOsRyxe5mSn3a/UD/9d3xuAuJSzJ2mUKRREPvxopLXuNZHxlSaDPRdLr3K3IPX05frTcg==
X-Received: by 2002:a17:903:92:: with SMTP id o18mr33494314pld.62.1643862167534;
        Wed, 02 Feb 2022 20:22:47 -0800 (PST)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id mp22sm7814137pjb.28.2022.02.02.20.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 20:22:46 -0800 (PST)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org
Cc:     Andrew Jeffery <andrew@aj.id.au>, Zev Weiss <zweiss@equinix.com>,
        openbmc@lists.ozlabs.org
Subject: [libgpiod PATCH 1/7] tools: Clean up scandir memory allocations
Date:   Thu,  3 Feb 2022 14:51:28 +1030
Message-Id: <20220203042134.68425-2-joel@jms.id.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203042134.68425-1-joel@jms.id.au>
References: <20220203042134.68425-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The code copied from gpiofind didn't free the memory from scandir.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 tools/tools-common.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/tools-common.c b/tools/tools-common.c
index 0dc3d52668d7..c83e68a2c1e4 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -190,12 +190,17 @@ struct gpiod_chip *chip_by_line_name(const char *name)
 
 			die_perror("unable to open %s", entries[i]->d_name);
 		}
+		free(entries[i]);
 
 		offset = gpiod_chip_find_line(chip, name);
-		if (offset >= 0)
+		if (offset >= 0) {
+			free(entries);
 			return chip;
+		}
+		gpiod_chip_unref(chip);
 	}
 
+	free(entries);
 	return NULL;
 }
 
-- 
2.34.1

