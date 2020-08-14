Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50AF32443D8
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Aug 2020 05:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726691AbgHNDGM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Aug 2020 23:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgHNDGL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 23:06:11 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53AB0C061757;
        Thu, 13 Aug 2020 20:06:11 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id u128so3863477pfb.6;
        Thu, 13 Aug 2020 20:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HaME3Z5uLAfT5ND31CqQyrNIC7MORGaQXez8ygNaWV4=;
        b=jLR45Gl2DA2rRti+GMEvcjlEkZd1G7TuZhTfwWhzE3Btu5YqhkcgLUPpyCGdLywjPa
         H8IDLJsaUlE2XRq3ZIWT8rWakHVFkOPn0PLs9w96njhg44kwwDJgM9zaN6tar1oRBdlW
         ocoPeppftFJ1v3pzC7J89x8POwTNDrlCHoxdgJW+OzM+ctn3TgnGRZeCZWW5xIt6q7O8
         5CyQ/U4dwcAKCHiMhFOdGssaU4sErtGYKjva1d3Q3TkspQgsQ7L186yhXL0hOLhtOLdT
         DHqcU5nF1ZjQeRZS6f62yIAFqi7UhMmaIg0G0YFo0fa8qhGiOuLoJuiTlCIOavEX7NFh
         P09Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HaME3Z5uLAfT5ND31CqQyrNIC7MORGaQXez8ygNaWV4=;
        b=rv6U0CDrEgmPK9bm+XDYriq9kMT9+ZhbFToXlgxjit4JL8cOPfs9lIcGjf3oVZKqcz
         hcyBpx/3YgRQqwvm3C3Rqdn7thP6/uakHNcKL+RHOIb6HHADekZ2eJLsgepV/FOohcD8
         mDFsj5u4Xd3GMjy1a/Pry6+OqUUL3RxrHlSd7eOw/13ncK6/YqNvN5FiwmNhzHg7Gj6/
         gFpa0nNwB5dtGow9MB/vbUIKv73DWx3gqy0Lk9DyGF7zQLdSa3UXxlMqt4u/zyGnLX0D
         dGocfBR1L0pxROQ1wsrO6uwZiyqkibXjfJ4ciSx9P0dft3l6DcUmWoKuuH/MTVuUElW5
         MQIw==
X-Gm-Message-State: AOAM533mWDxVv/fZbhRYPETGVxlPVdaswmO2ErgJgT3h29MKkCBnROqD
        IBH7BxSwzjuFVCnNpxg/VpJnrKpf
X-Google-Smtp-Source: ABdhPJz8DjcUkVYhxph2GyoOQXwR3+ubl84dJguupmyyxcpV9poz45BszY08LNYRQZ4Qu3DAfqRy7g==
X-Received: by 2002:a63:2324:: with SMTP id j36mr437494pgj.221.1597374370373;
        Thu, 13 Aug 2020 20:06:10 -0700 (PDT)
Received: from sol.lan (106-69-161-64.dyn.iinet.net.au. [106.69.161.64])
        by smtp.gmail.com with ESMTPSA id z3sm6522231pgk.49.2020.08.13.20.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2020 20:06:09 -0700 (PDT)
From:   Kent Gibson <warthog618@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        bgolaszewski@baylibre.com, linus.walleij@linaro.org
Cc:     Kent Gibson <warthog618@gmail.com>
Subject: [PATCH v4 20/20] tools: gpio: add debounce support to gpio-event-mon
Date:   Fri, 14 Aug 2020 11:02:57 +0800
Message-Id: <20200814030257.135463-21-warthog618@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200814030257.135463-1-warthog618@gmail.com>
References: <20200814030257.135463-1-warthog618@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for debouncing monitored lines to gpio-event-mon.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio/gpio-event-mon.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/tools/gpio/gpio-event-mon.c b/tools/gpio/gpio-event-mon.c
index e50bb107ea3a..bd5ea3cc6e85 100644
--- a/tools/gpio/gpio-event-mon.c
+++ b/tools/gpio/gpio-event-mon.c
@@ -148,11 +148,12 @@ void print_usage(void)
 		"  -s         Set line as open source\n"
 		"  -r         Listen for rising edges\n"
 		"  -f         Listen for falling edges\n"
+		"  -b <n>     Debounce the line with period n microseconds\n"
 		" [-c <n>]    Do <n> loops (optional, infinite loop if not stated)\n"
 		"  -?         This helptext\n"
 		"\n"
 		"Example:\n"
-		"gpio-event-mon -n gpiochip0 -o 4 -r -f\n"
+		"gpio-event-mon -n gpiochip0 -o 4 -r -f -b 10000\n"
 	);
 }
 
@@ -167,11 +168,12 @@ int main(int argc, char **argv)
 	unsigned int num_lines = 0;
 	unsigned int loops = 0;
 	struct gpio_v2_line_config config;
-	int c;
+	int c, attr, i;
+	unsigned long debounce_period = 0;
 
 	memset(&config, 0, sizeof(config));
 	config.flags = GPIO_V2_LINE_FLAG_INPUT;
-	while ((c = getopt(argc, argv, "c:n:o:dsrf?")) != -1) {
+	while ((c = getopt(argc, argv, "c:n:o:b:dsrf?")) != -1) {
 		switch (c) {
 		case 'c':
 			loops = strtoul(optarg, NULL, 10);
@@ -187,6 +189,9 @@ int main(int argc, char **argv)
 			lines[num_lines] = strtoul(optarg, NULL, 10);
 			num_lines++;
 			break;
+		case 'b':
+			debounce_period = strtoul(optarg, NULL, 10);
+			break;
 		case 'd':
 			config.flags |= GPIO_V2_LINE_FLAG_OPEN_DRAIN;
 			break;
@@ -205,6 +210,15 @@ int main(int argc, char **argv)
 		}
 	}
 
+	if (debounce_period) {
+		attr = config.num_attrs;
+		config.num_attrs++;
+		for (i = 0; i < num_lines; i++)
+			gpiotools_set_bit(&config.attrs[attr].mask, i);
+		config.attrs[attr].attr.id = GPIO_V2_LINE_ATTR_ID_DEBOUNCE;
+		config.attrs[attr].attr.debounce_period = debounce_period;
+	}
+
 	if (!device_name || num_lines == 0) {
 		print_usage();
 		return -1;
-- 
2.28.0

