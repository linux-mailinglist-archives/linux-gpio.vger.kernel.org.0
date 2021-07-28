Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B13F43D99B5
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jul 2021 01:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232723AbhG1Xqs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 28 Jul 2021 19:46:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232641AbhG1Xqr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Jul 2021 19:46:47 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714F8C061757
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 16:46:44 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id r16so5548669edt.7
        for <linux-gpio@vger.kernel.org>; Wed, 28 Jul 2021 16:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mind.be; s=google;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=SqzlOQoruA4cDrriOLZHv3esgk4CPVFvYkuXgSL7oWk=;
        b=ImiBP8CUgu4ubPvgrB3gbyVYtZZiRTgRdCEbZ8ZuwuhVK3AytgBATXoBoApg0WDioF
         4ZjoPxFRlS013daakxxRw+iK1HnLaxAPLKxKQjZww3wdaqS5PhQr2TcaEVglXZfl35yr
         o1Ck3WwoOHmm52c8cOolDtbcWiuh7jscOGni5VcPuoqgF4n7osdBgpTtld9PN6VgkUlA
         jtIpDryNv/871YxJc0kD1tWxEMDqpJ0/5Qh7Z+Yrf15bs/EHAvbzuidgMOgaDE7H8Y8O
         isqll5kKnFAG0EXntRGT1qkiT4l7A/TI3ba8shm8xBp97vjaz3TocfT5FatVF6FrnW9b
         qrXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=SqzlOQoruA4cDrriOLZHv3esgk4CPVFvYkuXgSL7oWk=;
        b=beZvSVgx9UsP2a3PFRPbUkB5rgsvuZC3yctI+7TjMzHzaAgg3IE85oAgNO48S2jA8D
         Rh6AanNUZvFqMkZL4Hz0cRChd+G8pRoD+vekSCVpasa4Sohaf0g5sbZnm6E1JHIoSb5J
         94k6S7pH/QgU5/1y2S/tCI/OW2tfMSCnupq5pbN1cAeE27vlxKq0DSyqf0DUPvEK/pTo
         2A1V3KqNuY4p/24NqoDvSGd/bNxRwu1bAG2AN/brgvP0NwBlCpvLnqtru59NAY1P+0E6
         sSxGR9zDp0vN6I574TrdotTXc761r0hcHDWnv+A9cow6veV7AuJWr8YNRd4BdKR38/XX
         UMHA==
X-Gm-Message-State: AOAM530tErzx+mdgen/HfkjZ9YsR5KbWZIMNeZe6V7tR42k7kXsLRU/G
        P9lzH3XVcZyyqRAqS65k7bp5v3nxCxfqAQ==
X-Google-Smtp-Source: ABdhPJy/D0IqVxyeGpGs0t2VeO4A0SJpfLJEf00AviA7L7Emy4SR+YWiMY5JgyEoTM27ie12iOc8XA==
X-Received: by 2002:a05:6402:1a4c:: with SMTP id bf12mr2766412edb.137.1627516003142;
        Wed, 28 Jul 2021 16:46:43 -0700 (PDT)
Received: from cephalopod (168.7-181-91.adsl-dyn.isp.belgacom.be. [91.181.7.168])
        by smtp.gmail.com with ESMTPSA id d8sm468918edy.83.2021.07.28.16.46.42
        for <linux-gpio@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 16:46:42 -0700 (PDT)
Date:   Thu, 29 Jul 2021 01:46:41 +0200
From:   Ben Hutchings <ben.hutchings@mind.be>
To:     linux-gpio@vger.kernel.org
Subject: [PATCH libgpiod-v2] gpiomon: Add option to set debounce period
Message-ID: <20210728234640.GD14442@cephalopod>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With the v2 API it's now possible to enable debouncing of an input.
Add an option to enable debouncing with a specific period.

Signed-off-by: Ben Hutchings <ben.hutchings@mind.be>
---
 tools/gpiomon.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index df86a46..074af6d 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -22,6 +22,7 @@ static const struct option longopts[] = {
 	{ "version",		no_argument,		NULL,	'v' },
 	{ "active-low",		no_argument,		NULL,	'l' },
 	{ "bias",		required_argument,	NULL,	'B' },
+	{ "debounce",		required_argument,	NULL,	'd' },
 	{ "num-events",		required_argument,	NULL,	'n' },
 	{ "silent",		no_argument,		NULL,	's' },
 	{ "rising-edge",	no_argument,		NULL,	'r' },
@@ -31,7 +32,7 @@ static const struct option longopts[] = {
 	{ GETOPT_NULL_LONGOPT },
 };
 
-static const char *const shortopts = "+hvlB:n:srfbF:";
+static const char *const shortopts = "+hvlB:d:n:srfbF:";
 
 static void print_help(void)
 {
@@ -46,6 +47,7 @@ static void print_help(void)
 	printf("  -l, --active-low:\tset the line active state to low\n");
 	printf("  -B, --bias=[as-is|disable|pull-down|pull-up] (defaults to 'as-is'):\n");
 	printf("		set the line bias\n");
+	printf("  -d, --debounce=PERIOD: enable debouncing with period in microseconds\n");
 	printf("  -n, --num-events=NUM:\texit after processing NUM events\n");
 	printf("  -s, --silent:\t\tdon't print event info\n");
 	printf("  -r, --rising-edge:\tonly process rising edge events\n");
@@ -157,6 +159,7 @@ int main(int argc, char **argv)
 	unsigned int offsets[64], num_lines = 0, offset, events_wanted = 0,
 		     events_done = 0;
 	bool watch_rising = false, watch_falling = false, active_low = false;
+	unsigned long debounce_period = 0;
 	struct gpiod_edge_event_buffer *event_buffer;
 	int optc, opti, ret, i, edge, bias = 0;
 	uint64_t timeout = 10 * 1000000000LLU;
@@ -195,6 +198,11 @@ int main(int argc, char **argv)
 		case 'B':
 			bias = parse_bias(optarg);
 			break;
+		case 'd':
+			debounce_period = strtoul(optarg, &end, 10);
+			if (*end != '\0')
+				die("invalid number: %s", optarg);
+			break;
 		case 'n':
 			events_wanted = strtoul(optarg, &end, 10);
 			if (*end != '\0')
@@ -263,6 +271,8 @@ int main(int argc, char **argv)
 	if (active_low)
 		gpiod_line_config_set_active_low(line_cfg);
 	gpiod_line_config_set_edge_detection(line_cfg, edge);
+	if (debounce_period)
+		gpiod_line_config_set_debounce_period(line_cfg, debounce_period);
 
 	req_cfg = gpiod_request_config_new();
 	if (!req_cfg)
-- 
2.20.1
