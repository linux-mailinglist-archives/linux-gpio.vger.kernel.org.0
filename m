Return-Path: <linux-gpio+bounces-30163-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A408CF4E55
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 18:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D488E301D949
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 17:05:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581B8322A00;
	Mon,  5 Jan 2026 17:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzCaOEoB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5CBC31D75C
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 17:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767632710; cv=none; b=GsMHWtiw1kkwECYBOzb249rENUmz9feaXFsbKOKS2NA4QP2mGHk667wi1l9FvpWHj7bFdPOUE5HZ3dP4dF2J2mjlLy2jsX9YtDEOXI5/D5ik2pqFR7kU7t4BaxAiv/5BxmI4JwY4+cfRxLzDXy7ce6bbsgD7A12psHE+i6YFhD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767632710; c=relaxed/simple;
	bh=i39J6pADpKYSowYFfGVJ2QOXJm9rS5rtrtPoRNXKfXI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RAU+R5BQ3GTCYA2qh4P4BK5iEDF/t5IQ0X1mUrw8uOASJLT3CTb59TvjDa2YvbfxWxQ06yBJGgkSKJjJYli4ZtOUlLaBYoZDMXe2sC8YPdWnBrTjWjb/DWSSLyTiI7yxd4bvTDNHa9jpVJ6WHAFRo1PTyX/EnXlpZVcLJMOKadc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzCaOEoB; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7b89c1ce9easo168663b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 09:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767632706; x=1768237506; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sNeOHRHiRJa1qsgV74idbgLEoOdg+przLrk38iGYaXk=;
        b=FzCaOEoBwjsUHMDUslLaAMeBcp50M9cgGg/HOW+jvv9xBjFjQcI29bbvEBloM+S511
         2c9KdyHfkg9arHJMMYiNDxQ8fk59+NJbXnGmdvoj838N3jJP7IW8tipT3K+JixxeiAg7
         wh+qS25nBhzba/sLkFO7ByPRBS/g6YMd8Nk3zS7XPjPi07OcgIBGtvfKOfN2f0zo8a6m
         D5sbWjIlmOTVcrzun24d/h5ehvTVOTn94RRLGbjYnjH30p00m3nA0MpsCjtE8cdmsEFW
         bsCXumq+lk5h5UywKGJg6GkIr8FRBq4CrPCYpgd/oXyHUkP28FsF2me0XKuZjhk0tUyh
         jWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767632706; x=1768237506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sNeOHRHiRJa1qsgV74idbgLEoOdg+przLrk38iGYaXk=;
        b=sfB1GLrHqMbngM0TBtHkR33hymjoyA/DfojIMisPDBCshANeSidAsSkMYarj9SjceC
         DpU2XL7eG81aiMby2aKX2YyB2uNY3Sudl4lmdpnW5TUv833WB2yA00bllwWSKIH2uWq1
         iY1gnNsTb/ey0DFAq0bhTCO7t4tPiAJbwouYvtaO/90zoJgEauoYm9CWUsXLsRkSQbtl
         b0AABho4j3HDMiCWMdyjBxQlwXMr/4AmSyNeTUSLfn/04xb8R1mEADlL5sfdWCf1bZ+C
         pVy9h5q9j8V8Rk1NKJhbU6CF1CF3iOE1T0Gd57KW4+WVZTqAkS+/AhRRp/J4hB9mSePR
         i5vg==
X-Gm-Message-State: AOJu0YxDPRMqhGkV6GSQV9OU2dyrWc/hJ1woOq+uIuSXr8N/WIOhVEP3
	YJuVlzQPQHLvtBzgVuUXevegPrW6IYF1crthwTvuX2chyjPPOuBKjQfsu8ITrw==
X-Gm-Gg: AY/fxX7Q0cZjRpUtfyW+HNIyhWIDEvafHudTmpFPwzlNryGYSGJKKIiGVRXZsZRTEOL
	TgFPXLdfCwIVK3DhyE1CyAdKqVwBrPIgwFlJi4L9hCfZeTuLNB0B+pVzQoYkeQ0e0U5gKK6Fr9k
	NC4soDze8pFgf+PH7VtR1S/qxFcw5oKue/3ocD9/BFgVEkv7pn7RUqI5pwfk32Qskc9CVdYag2C
	qk3fazNAN7RfU4VAvCbYdmNba2KO7OAAZycdAyXHgvEubN2m78RWvIyuDHu/3J/E8lhfiX+zGKl
	8/pNFJ539l3FXrXpqlopkjmyeqD0YNQ1dQFRJ1klMLj7+s40pJwJfFUEPSLY7Ae2TFeCuYm1GtQ
	9lWQqnGMTCfg6wuPE1D2BASj4RxU8TpLxwePsXz4sv9qh21H/erEGHpz30OliJO7JObcV952pWP
	cUfMDlATmLSLL8TwtpgLyEnANDlullxYtx/ciqw8sIcDA=
X-Google-Smtp-Source: AGHT+IHYC0LaEJMoHUgcu+Nff8jg2FHfOG5q/V4fLrt7fbUnmt1rFVAqG7P8Uk49+PCdRrItZGUhOA==
X-Received: by 2002:a05:6a00:1da2:b0:7e8:4471:ae7a with SMTP id d2e1a72fcca58-818830d603cmr280872b3a.70.1767632705911;
        Mon, 05 Jan 2026 09:05:05 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c65:6b7c:c1a0:5917:f723:e9b4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8187a525ffbsm282291b3a.67.2026.01.05.09.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 09:05:05 -0800 (PST)
From: shaarang.tyagi@gmail.com
To: linux-gpio@vger.kernel.org
Cc: shaarang.tyagi@gmail.com
Subject: [libgpiod][PATCH] tools: gpiomon: add initial-state option
Date: Mon,  5 Jan 2026 22:34:51 +0530
Message-Id: <20260105170451.7496-1-shaarang.tyagi@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Shaarang Tyagi <shaarang.tyagi@gmail.com>

Add a gpiomon initial-state command line option to display initial line states,
this is diplayed before waiting for events.

Closes: https://github.com/brgl/libgpiod/issues/159
Tested-by: Shaarang Tyagi <shaarang.tyagi@gmail.com>
Signed-off-by: Shaarang Tyagi <shaarang.tyagi@gmail.com>
---
 tools/gpiomon.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 88b5ccf..4d109c3 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -32,6 +32,7 @@ struct config {
 	enum gpiod_line_clock event_clock;
 	int timestamp_fmt;
 	long long idle_timeout;
+	bool initial_state;
 };
 
 static void print_help(void)
@@ -69,6 +70,7 @@ static void print_help(void)
 	printf("  -p, --debounce-period <period>\n");
 	printf("\t\t\tdebounce the line(s) with the specified period\n");
 	printf("  -q, --quiet\t\tdon't generate any output\n");
+	printf("  -S, --initial-state\t\tprint initial states of the lines\n");
 	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
 	printf("      --unquoted\tdon't quote line or consumer names\n");
 	printf("      --utc\t\tformat event timestamps as UTC (default for 'realtime')\n");
@@ -113,7 +115,7 @@ static int parse_event_clock_or_die(const char *option)
 
 static int parse_config(int argc, char **argv, struct config *cfg)
 {
-	static const char *const shortopts = "+b:c:C:e:E:hF:ln:p:qshv";
+	static const char *const shortopts = "+b:c:C:e:E:hF:ln:p:qshvS";
 
 	const struct option longopts[] = {
 		{ "active-low",	no_argument,	NULL,		'l' },
@@ -136,6 +138,7 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		{ "unquoted",	no_argument,	NULL,		'Q' },
 		{ "utc",	no_argument,	&cfg->timestamp_fmt,	1 },
 		{ "version",	no_argument,	NULL,		'v' },
+		{ "initial-state",	no_argument,	NULL,		'S' },
 		{ GETOPT_NULL_LONGOPT },
 	};
 
@@ -197,6 +200,9 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		case 's':
 			cfg->strict = true;
 			break;
+		case 'S':
+			cfg->initial_state = true;
+			break;
 		case 'h':
 			print_help();
 			exit(EXIT_SUCCESS);
@@ -353,6 +359,24 @@ static void event_print(struct gpiod_edge_event *event,
 		event_print_human_readable(event, resolver, chip_num, cfg);
 }
 
+static void initial_line_values_print(struct line_resolver *resolver,
+			struct config *cfg)
+{
+	printf("\nInitial line state(s): ");
+	int i;
+	const char *fmt = cfg->unquoted ? "%s=%s" : "\"%s\"=%s";
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		struct resolved_line *line = &resolver->lines[i];
+
+		printf(fmt, line->id,
+		line->value ? "active" : "inactive");
+		if (i != resolver->num_lines - 1)
+			printf(" ");
+	}
+	printf("\n");
+}
+
 int main(int argc, char **argv)
 {
 	struct gpiod_edge_event_buffer *event_buffer;
@@ -363,6 +387,7 @@ int main(int argc, char **argv)
 	int num_lines, events_done = 0;
 	struct gpiod_edge_event *event;
 	struct line_resolver *resolver;
+	enum gpiod_line_value *values;
 	struct timespec idle_timeout;
 	struct gpiod_chip *chip;
 	struct pollfd *pollfds;
@@ -423,7 +448,9 @@ int main(int argc, char **argv)
 	requests = calloc(resolver->num_chips, sizeof(*requests));
 	pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
 	offsets = calloc(resolver->num_lines, sizeof(*offsets));
-	if (!requests || !pollfds || !offsets)
+	values = calloc(resolver->num_lines, sizeof(*values));
+
+	if (!requests || !pollfds || !offsets || !values)
 		die("out of memory");
 
 	for (i = 0; i < resolver->num_chips; i++) {
@@ -445,6 +472,14 @@ int main(int argc, char **argv)
 			die_perror("unable to request lines on chip %s",
 				   resolver->chips[i].path);
 
+		if (cfg.initial_state) {
+			ret = gpiod_line_request_get_values(requests[i], values);
+			if (ret)
+				die_perror("unable to read GPIO line values");
+			set_line_values(resolver, i, values);
+			initial_line_values_print(resolver, &cfg);
+		}
+
 		pollfds[i].fd = gpiod_line_request_get_fd(requests[i]);
 		pollfds[i].events = POLLIN;
 		gpiod_chip_close(chip);

