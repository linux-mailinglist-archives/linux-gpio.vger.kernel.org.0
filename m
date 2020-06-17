Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA0EF1FC472
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jun 2020 05:07:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726686AbgFQDHj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Jun 2020 23:07:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726568AbgFQDHj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Jun 2020 23:07:39 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E25A8C061573
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 20:07:37 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id v14so577838pgl.1
        for <linux-gpio@vger.kernel.org>; Tue, 16 Jun 2020 20:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LuM4REAU782s4ZzrC8p7CGcWXqCM3cN5VDFPmRGAvSQ=;
        b=Pmzfe8es0Bcjnks2MPV5WKe3uM1I9Tr4HqPJwcZijZgq9P2zEkQQWWXGyHXqpbQ9gO
         L0BWd4I3heK4jUWqfNCuM6SF9dfaygn7oYvqC31tSfcLQSdC4AcjOklBMBaJVyNT561k
         k9J7R92RrAH4rJ2TbU9kcRM2EhN+8HWU5MuodtxUAcTeJZbveaHGh2Qet1nF6fcQZbQp
         on/cEOiKo6GWnImYrE7dfFnvc6p4UpAu0XoWNhE/MDRwAsuQ9mnfn72wddddDhvmEP27
         0VRaLAReGIKIGSCV0m39LuRLiiV9CboAQLBVm4R2GoCM3x6BuU94lteh9hQDGuW04TBe
         97WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LuM4REAU782s4ZzrC8p7CGcWXqCM3cN5VDFPmRGAvSQ=;
        b=i6oIJRopw1I4yX7XlQkO9mUOLNGqlYfIZocJr0U8wS5jHkVfGV7+rGmSO6Jao7ctHQ
         eIDw31p3rPeFl0YCPixgGrWPY+Bx8qPofUdKr7Q/gFbNSF29MVsnTqMEzeM5Vkt7JKSi
         PcyH3YNa+CjkMKbrcYfWrwV3YjkYDziNSRiBwMek8lgtYjPiN8UQs7cVx2l6lL0wuzqa
         9PmYGK6eI+/9PhSTZXoiIuVgKW7KlMHm+Vr763i9BMnftHyoub/VHULxd13XoZUDrvqq
         MleDTovhu/njxidyPo8YkjJ6efzxnDc/x0jQxKA0l9LC0XfGEAnWngejzdFWhHtOna1u
         lC3A==
X-Gm-Message-State: AOAM531k8xKBSDrYp7q3lq7wcC2J48MF1LX4ekRTxQMHX5JnbIzFNjlj
        VVEL1aBv8MuZWP5AWAFS2TeXPqBobpo=
X-Google-Smtp-Source: ABdhPJy2OCwGjKNVYE7F+gUA/tBoEy5ndqmt59MRssSX4SV0WJbvs6L9fa1SdumSJlwqaRo90JRGcQ==
X-Received: by 2002:aa7:84cc:: with SMTP id x12mr4701481pfn.235.1592363256992;
        Tue, 16 Jun 2020 20:07:36 -0700 (PDT)
Received: from sol.lan (220-235-93-205.dyn.iinet.net.au. [220.235.93.205])
        by smtp.gmail.com with ESMTPSA id p6sm9185578pfb.152.2020.06.16.20.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 20:07:36 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        ml@ionscale.com
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH 2/3] tests: event: add tests for gpiod_line_get_value_bulk events
Date:   Wed, 17 Jun 2020 11:06:38 +0800
Message-Id: <20200617030639.27690-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200617030639.27690-1-warthog618@gmail.com>
References: <20200617030639.27690-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add tests to verify the behaviour of gpiod_line_get_value_bulk when
applied to a bulk of event lines.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

---

In v1.5 only the value of the first line is returned correctly.

 tests/tests-event.c | 110 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/tests/tests-event.c b/tests/tests-event.c
index b59c995..e323060 100644
--- a/tests/tests-event.c
+++ b/tests/tests-event.c
@@ -421,6 +421,116 @@ GPIOD_TEST_CASE(get_value_active_low, 0, { 8 })
 	g_assert_cmpint(ev.event_type, ==, GPIOD_LINE_EVENT_FALLING_EDGE);
 }
 
+GPIOD_TEST_CASE(get_values, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line_bulk bulk;
+	struct gpiod_line *line;
+	gint i, ret, vals[8];
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_init(&bulk);
+	for (i = 0; i < 8; i++) {
+		line = gpiod_chip_get_line(chip, i);
+		g_assert_nonnull(line);
+		gpiod_test_return_if_failed();
+
+		gpiod_line_bulk_add(&bulk, line);
+		gpiod_test_chip_set_pull(0, i, 1);
+	}
+
+	ret = gpiod_line_request_bulk_rising_edge_events(&bulk,
+							 GPIOD_TEST_CONSUMER);
+	g_assert_cmpint(ret, ==, 0);
+
+	memset(vals, 0, sizeof(vals));
+	ret = gpiod_line_get_value_bulk(&bulk, vals);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(vals[0], ==, 1);
+	g_assert_cmpint(vals[1], ==, 1);
+	g_assert_cmpint(vals[2], ==, 1);
+	g_assert_cmpint(vals[3], ==, 1);
+	g_assert_cmpint(vals[4], ==, 1);
+	g_assert_cmpint(vals[5], ==, 1);
+	g_assert_cmpint(vals[6], ==, 1);
+	g_assert_cmpint(vals[7], ==, 1);
+
+	gpiod_test_chip_set_pull(0, 1, 0);
+	gpiod_test_chip_set_pull(0, 3, 0);
+	gpiod_test_chip_set_pull(0, 4, 0);
+	gpiod_test_chip_set_pull(0, 7, 0);
+
+	memset(vals, 0, sizeof(vals));
+	ret = gpiod_line_get_value_bulk(&bulk, vals);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(vals[0], ==, 1);
+	g_assert_cmpint(vals[1], ==, 0);
+	g_assert_cmpint(vals[2], ==, 1);
+	g_assert_cmpint(vals[3], ==, 0);
+	g_assert_cmpint(vals[4], ==, 0);
+	g_assert_cmpint(vals[5], ==, 1);
+	g_assert_cmpint(vals[6], ==, 1);
+	g_assert_cmpint(vals[7], ==, 0);
+}
+
+GPIOD_TEST_CASE(get_values_active_low, 0, { 8 })
+{
+	g_autoptr(gpiod_chip_struct) chip = NULL;
+	struct gpiod_line_bulk bulk;
+	struct gpiod_line *line;
+	gint i, ret, vals[8];
+
+	chip = gpiod_chip_open(gpiod_test_chip_path(0));
+	g_assert_nonnull(chip);
+	gpiod_test_return_if_failed();
+
+	gpiod_line_bulk_init(&bulk);
+	for (i = 0; i < 8; i++) {
+		line = gpiod_chip_get_line(chip, i);
+		g_assert_nonnull(line);
+		gpiod_test_return_if_failed();
+
+		gpiod_line_bulk_add(&bulk, line);
+		gpiod_test_chip_set_pull(0, i, 0);
+	}
+
+	ret = gpiod_line_request_bulk_rising_edge_events_flags(&bulk,
+			GPIOD_TEST_CONSUMER, GPIOD_LINE_REQUEST_FLAG_ACTIVE_LOW);
+	g_assert_cmpint(ret, ==, 0);
+
+	memset(vals, 0, sizeof(vals));
+	ret = gpiod_line_get_value_bulk(&bulk, vals);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(vals[0], ==, 1);
+	g_assert_cmpint(vals[1], ==, 1);
+	g_assert_cmpint(vals[2], ==, 1);
+	g_assert_cmpint(vals[3], ==, 1);
+	g_assert_cmpint(vals[4], ==, 1);
+	g_assert_cmpint(vals[5], ==, 1);
+	g_assert_cmpint(vals[6], ==, 1);
+	g_assert_cmpint(vals[7], ==, 1);
+
+	gpiod_test_chip_set_pull(0, 1, 1);
+	gpiod_test_chip_set_pull(0, 3, 1);
+	gpiod_test_chip_set_pull(0, 4, 1);
+	gpiod_test_chip_set_pull(0, 7, 1);
+
+	memset(vals, 0, sizeof(vals));
+	ret = gpiod_line_get_value_bulk(&bulk, vals);
+	g_assert_cmpint(ret, ==, 0);
+	g_assert_cmpint(vals[0], ==, 1);
+	g_assert_cmpint(vals[1], ==, 0);
+	g_assert_cmpint(vals[2], ==, 1);
+	g_assert_cmpint(vals[3], ==, 0);
+	g_assert_cmpint(vals[4], ==, 0);
+	g_assert_cmpint(vals[5], ==, 1);
+	g_assert_cmpint(vals[6], ==, 1);
+	g_assert_cmpint(vals[7], ==, 0);
+}
+
 GPIOD_TEST_CASE(wait_multiple, 0, { 8 })
 {
 	g_autoptr(GpiodTestEventThread) ev_thread = NULL;
-- 
2.27.0

