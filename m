Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC4F91FC473
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 05:07:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726715AbgFQDHp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 23:07:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgFQDHp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 23:07:45 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0B4C061573
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 20:07:43 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id s88so345927pjb.5
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 20:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AEISxpaXV8eRVTTApqSFU1sLhZp/tNdHYnbvEcBU7bk=;
        b=O0TuReXEoUkgJo3zt0QaPLLRQcxBoHj5kn1wAHnmnKoEj0dNcf5N5gY0w46MNQMjwi
         vsw40fsPRbuwKdMQrWP2YOAnXUt3An9CUegLIhvWmUf69PoCdQ8qhv7R8yMlAS9jtuMy
         Nd47GckEUNvql71K3srtVn4jnb65MVReSRSKdD7ll3/QnhMOjABgAgQFbKixamYQto6F
         kp1A2HrN3u/b12suFCTnkSpOPQ+jZk/wwthbBBzo/zkmhxWrS5u1/feeKo7yn3jByFIv
         uE/tdF1RXoIECh3jznjphkeMmE7OwDSt9y5phTH8Hjui/OLnDW1gXt+wlKhE1ZanMxdk
         QnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AEISxpaXV8eRVTTApqSFU1sLhZp/tNdHYnbvEcBU7bk=;
        b=GqXcKBJujxxkAOWWDkj4noP2XZfKuzPMPZwe00mr07W4WNCK7Vuxqd7eQrpb1KXdcZ
         8DLytrrOA725jo4Yno1zvFHWFUHBKY81XGqnTLt8lEA/hHzMRF5E2fkoT/FL08934VNW
         PX8S3FJ6hfcIaZcVsJXxOlh4Y8f6VZMXkuaRpPzpZyQVlRkC43+RpnIue+zHJGcMlAi4
         J0LSfKFolZROjQw30EgrOOA3BR7DIcXoLECBHZrIat5+UBfqR+MgKH7IA6FiDdct6M4L
         DrjQdOiED+lZoiRv5zDLYhS63bfPu6Mgy7YAtCoi1ty08mnWuhWrVzpfUjlLn+yGnDlb
         D5Dg==
X-Gm-Message-State: AOAM53309dzDxXmDHcbVRNYwbAseTuOW+RFxTYJ5+RHSMKZwRw2VGTbo
        Iw8Bvqnl1YK6Kip85cxdmrg95fpWScA=
X-Google-Smtp-Source: ABdhPJzpOKNirnklnheTYZQpe0Pa6xqDX3UEhXzoWY0iTIgyRqrXwbEq86mEtj5wvfi/YzpgOaE7OQ==
X-Received: by 2002:a17:90a:2c06:: with SMTP id m6mr5924986pjd.216.1592363262352;
        Tue, 16 Jun 2020 20:07:42 -0700 (PDT)
Received: from sol.lan (220-235-93-205.dyn.iinet.net.au. [220.235.93.205])
        by smtp.gmail.com with ESMTPSA id p6sm9185578pfb.152.2020.06.16.20.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 20:07:41 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        ml@ionscale.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 3/3] core: fix gpiod_line_get_value_bulk for events
Date:   Wed, 17 Jun 2020 11:06:39 +0800
Message-Id: <20200617030639.27690-4-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617030639.27690-1-warthog618@gmail.com>
References: <20200617030639.27690-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extend gpiod_line_get_value_bulk so that it works for bulks of
lineevents, not only linehandles.

Reported-by: Gerrit Wyen <ml@ionscale.com>
Signed-off-by: Kent Gibson <warthog618@gmail.com>

---
 lib/core.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/lib/core.c b/lib/core.c
index f704b44..ad76051 100644
--- a/lib/core.c
+++ b/lib/core.c
@@ -773,26 +773,41 @@ int gpiod_line_get_value(struct gpiod_line *line)
 int gpiod_line_get_value_bulk(struct gpiod_line_bulk *bulk, int *values)
 {
 	struct gpiohandle_data data;
-	struct gpiod_line *first;
+	struct gpiod_line *line;
 	unsigned int i;
 	int rv, fd;
 
 	if (!line_bulk_same_chip(bulk) || !line_bulk_all_requested(bulk))
 		return -1;
 
-	first = gpiod_line_bulk_get_line(bulk, 0);
+	line = gpiod_line_bulk_get_line(bulk, 0);
 
-	memset(&data, 0, sizeof(data));
+	if (line->state == LINE_REQUESTED_VALUES) {
+		memset(&data, 0, sizeof(data));
 
-	fd = line_get_fd(first);
+		fd = line_get_fd(line);
 
-	rv = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
-	if (rv < 0)
-		return -1;
+		rv = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
+		if (rv < 0)
+			return -1;
 
-	for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
-		values[i] = data.values[i];
+		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++)
+			values[i] = data.values[i];
 
+	} else if (line->state == LINE_REQUESTED_EVENTS) {
+		for (i = 0; i < gpiod_line_bulk_num_lines(bulk); i++) {
+			line = gpiod_line_bulk_get_line(bulk, i);
+
+			fd = line_get_fd(line);
+			rv = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
+			if (rv < 0)
+				return -1;
+			values[i] = data.values[0];
+		}
+	} else {
+		errno = EINVAL;
+		return -1;
+	}
 	return 0;
 }
 
-- 
2.27.0

