Return-Path: <linux-gpio+bounces-31308-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIHzOuGMe2mlFQIAu9opvQ
	(envelope-from <linux-gpio+bounces-31308-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:37:53 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5893DB2474
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 17:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6B3EB30480D8
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Jan 2026 16:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E9FC5339865;
	Thu, 29 Jan 2026 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QgSpAU4y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD691BBBFC
	for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 16:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769704419; cv=none; b=U+1HvJJgRoC7Gonow0RmthEHKElInuMO+FUy+c0GnnmxWIAi2IHZvc5hT2suE5ZCEtCWanz83xhrmM7/oa3G4wuH0ySVN/mWJ2VeXflhTOnt3v5WB9LIJ/ERjKr3wgLKtlCMIJhe4P03EKdCAaQpjlFb7SZBaUTP4Hr8NPryPi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769704419; c=relaxed/simple;
	bh=VVRvg/i7603zdA3ChATakNNMAZLiJVVg+4U2c9LBt/g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XqHl7vLgNc0DGmAXaNjN2SP54uKt1/Xa6sfvYA9DCu5XN3fr4bORP2Lk4VrsNipwoSSZh5ovoJyp2+gyvmuc7MkhFKvvxhvUR4GVVQj2ZLjpRqEMK0hhf4eOszuM6wT/Pp1BKDOVeCXHS55x0mORql2nRMFGxcGoT65g1DI8nfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QgSpAU4y; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8230c33f477so592062b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 29 Jan 2026 08:33:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769704413; x=1770309213; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XIH45rQGqIP1Ogq5fIaP710aa36s5Usm0rCw4jXR/Kc=;
        b=QgSpAU4y8If3pWOax9OnVZoJgqye84UdBxSUc16D+R2sJJutfMTiSjGVR1O/75G6A2
         YDmKCXZyiDczl0R2YEXvMMueodBQaVdzMidiYf4+cqdaXgVbgQU1laB2jKCwgvztb0ls
         hAUq+XP9Xr9qVZdktPncjgiQX8q/u8Wzwd9NX4sAyIqC8CpeRggUQbL3HXsXW7QVw2Sg
         mWizHfMuSEUINnwth1x9zYwEwUCnZCRfZmwrdfzpNmK3Df3JH2da4/dIL7tM6DJS/vMs
         dTaizTQ7uT/oZZu12aIC+RCzN/zChvWyjGn/sJUht0zrGJXTYHxRhPUZocIZ6b9/6mh7
         3J7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769704413; x=1770309213;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XIH45rQGqIP1Ogq5fIaP710aa36s5Usm0rCw4jXR/Kc=;
        b=vB2bLWd9h88zLIvCLZ+2lR6xiwPcL+mZW69pLrIkvcl7tPt0IF+N4jCVYX4NDYdlpn
         JIOZsPJB+B/5ByXqEd/vKVgtktgV/oipp53Pmnq4vZ7YMdJj10Sy//9u6Uzqj1t0+pRX
         wICIg0cXSHvuppHCPFjPuxiZP/Bs0yJ8lqpuML8JP71r8Yg9oN+Jtj09BrIiiJN98Wtd
         zR3qcP3KQTbb/osZccAs9PluCGnTzdg6xLhBToDfZB9+OQzrzvbfAO427SK0ubjseWW/
         d9WzgZYq2kgpbcD+l6ZTiJX1sL8oHoZWWQM/sbhvhFFo+ADH+P28SQdDLSEHkDFW1XqL
         sJlg==
X-Gm-Message-State: AOJu0YzHNMZCvap9jJIRjLjpWtFUi9FkiRe0EbVMNxfcbp6jNcWaTrPr
	4kAsyHtZSXACPWzLS8p+QbCNgd4SmJaKC1JaGssAzsXxIYrJGLo2sjk6AN+Gnw==
X-Gm-Gg: AZuq6aKrYsqQlRzl+4VkKvbNGcRNS9w9IU2TIZg0YNQRkZ9wukxdID0N7AADKxukoQB
	FxNqoXflIWzS11LAM4DJ7eO7Gi0+zKFvsMSCRSYuRN2xi6kuJeNhpMgAIavnqfvveQrKD5cm3AH
	Xwr8lK6N7RrpWbd4Di//ejhPoZvKjAy4ML3lItIygj7AsGhviz+X3CZG1JlBG/WytNx2RQy39cQ
	TBbWrwbuUtG52JMy55adH+aPNYmQGhSMh9FyMsrNPdNnIKrJm37cJKast0Vr9As5FwudHqQGfXN
	Mkf5KSD0kwkLaXNxASxT18BuVpcEbrijloSi9xWwKiP2Zek3O37atfkLbztxrafiDZD+RCHwXPM
	pzc/17hbjE1UqjnN6oF9hu7IV422djZcjF+hXIhKLsEYsIWAkyf5eKCYFl1mOLtX67emBzRDryX
	GyltZLkB7Vg26Kv3mk8+ni1hDG1P9f
X-Received: by 2002:a05:6a21:4d8d:b0:366:584c:62ef with SMTP id adf61e73a8af0-38ec6546d0cmr8937201637.65.1769704413093;
        Thu, 29 Jan 2026 08:33:33 -0800 (PST)
Received: from shaarang-desktop.. ([2402:e280:222f:73c:9186:b405:241b:9796])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c642a3356a6sm5505332a12.18.2026.01.29.08.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 08:33:32 -0800 (PST)
From: shaarang.tyagi@gmail.com
To: linux-gpio@vger.kernel.org
Cc: shaarang.tyagi@gmail.com
Subject: [libgpiod][PATCH v3] tools: gpiomon: add initial-state option
Date: Thu, 29 Jan 2026 22:01:39 +0530
Message-ID: <20260129163139.7102-1-shaarang.tyagi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-31308-lists,linux-gpio=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shaarangtyagi@gmail.com,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_NO_DN(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5893DB2474
X-Rspamd-Action: no action

From: Shaarang Tyagi <shaarang.tyagi@gmail.com>

Add a gpiomon initial-state command line option to display
initial line states, this is diplayed before waiting for events.
And factoring out the gpioget line status printing code into tools-common.

Closes: https://github.com/brgl/libgpiod/issues/159
Signed-off-by: Shaarang Tyagi <shaarang.tyagi@gmail.com>
---
Changes in v2:
- allocation of "values" moved to if block.
- existing variable pollfds was freed.
- option -S changed to -I.
- Added to the unit test.
- Reuse of print_line_vals()

Changes in v3:
- Addition of -N/--numeric switch.
- Dropped "Initial line state(s):" text.
- Unit test now using dut_run and dut_kill.
- Dropped freeing of existing variable pollfds.
---
 tests/scripts/gpiod-bash-test-helper.inc |  0
 tools/gpio-tools-test.bash               | 13 ++++++++++
 tools/gpioget.c                          | 18 +-------------
 tools/gpiomon.c                          | 30 +++++++++++++++++++++++-
 tools/tools-common.c                     | 21 +++++++++++++++++
 tools/tools-common.h                     |  2 ++
 6 files changed, 66 insertions(+), 18 deletions(-)
 mode change 100644 => 100755 tests/scripts/gpiod-bash-test-helper.inc

diff --git a/tests/scripts/gpiod-bash-test-helper.inc b/tests/scripts/gpiod-bash-test-helper.inc
old mode 100644
new mode 100755
diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 898b348..6834f70 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -2235,6 +2235,19 @@ test_gpiomon_with_custom_format_unknown_specifier() {
 	output_is "%x"
 }
 
+test_gpiomon_with_initial_state() {
+	gpiosim_chip sim0 num_lines=8
+	gpiosim_set_pull sim0 2 pull-up
+	gpiosim_set_pull sim0 3 pull-up
+	gpiosim_set_pull sim0 5 pull-up
+	gpiosim_set_pull sim0 7 pull-up
+	local sim0=${GPIOSIM_CHIP_NAME[sim0]}
+
+	dut_run gpiomon --initial-state --chip "$sim0" 0 1 2 3 4 5 6 7
+	dut_read
+	dut_kill
+	output_is "\"0\"=inactive \"1\"=inactive \"2\"=active \"3\"=active \"4\"=inactive \"5\"=active \"6\"=inactive \"7\"=active"
+}
 #
 # gpionotify test cases
 #
diff --git a/tools/gpioget.c b/tools/gpioget.c
index bad7667..de1dbdf 100644
--- a/tools/gpioget.c
+++ b/tools/gpioget.c
@@ -139,12 +139,10 @@ int main(int argc, char **argv)
 	struct gpiod_line_config *line_cfg;
 	struct line_resolver *resolver;
 	enum gpiod_line_value *values;
-	struct resolved_line *line;
 	struct gpiod_chip *chip;
 	unsigned int *offsets;
 	int i, num_lines, ret;
 	struct config cfg;
-	const char *fmt;
 
 	set_prog_name(argv[0]);
 	i = parse_config(argc, argv, &cfg);
@@ -216,21 +214,7 @@ int main(int argc, char **argv)
 		gpiod_line_request_release(request);
 		gpiod_chip_close(chip);
 	}
-
-	fmt = cfg.unquoted ? "%s=%s" : "\"%s\"=%s";
-
-	for (i = 0; i < resolver->num_lines; i++) {
-		line = &resolver->lines[i];
-		if (cfg.numeric)
-			printf("%d", line->value);
-		else
-			printf(fmt, line->id,
-			       line->value ? "active" : "inactive");
-
-		if (i != resolver->num_lines - 1)
-			printf(" ");
-	}
-	printf("\n");
+	print_line_vals(resolver, cfg.unquoted, cfg.numeric);
 
 	free_line_resolver(resolver);
 	gpiod_request_config_free(req_cfg);
diff --git a/tools/gpiomon.c b/tools/gpiomon.c
index 88b5ccf..a62955b 100644
--- a/tools/gpiomon.c
+++ b/tools/gpiomon.c
@@ -32,6 +32,8 @@ struct config {
 	enum gpiod_line_clock event_clock;
 	int timestamp_fmt;
 	long long idle_timeout;
+	bool initial_state;
+	bool numeric;
 };
 
 static void print_help(void)
@@ -69,6 +71,8 @@ static void print_help(void)
 	printf("  -p, --debounce-period <period>\n");
 	printf("\t\t\tdebounce the line(s) with the specified period\n");
 	printf("  -q, --quiet\t\tdon't generate any output\n");
+	printf("  -I, --initial-state\t\tprint initial states of the lines\n");
+	printf("  -N, --numeric\t\tdisplay line values as '0' (inactive) or '1' (active)\n");
 	printf("  -s, --strict\t\tabort if requested line names are not unique\n");
 	printf("      --unquoted\tdon't quote line or consumer names\n");
 	printf("      --utc\t\tformat event timestamps as UTC (default for 'realtime')\n");
@@ -113,7 +117,7 @@ static int parse_event_clock_or_die(const char *option)
 
 static int parse_config(int argc, char **argv, struct config *cfg)
 {
-	static const char *const shortopts = "+b:c:C:e:E:hF:ln:p:qshv";
+	static const char *const shortopts = "+b:c:C:e:E:hF:ln:p:qshvIN";
 
 	const struct option longopts[] = {
 		{ "active-low",	no_argument,	NULL,		'l' },
@@ -136,6 +140,8 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		{ "unquoted",	no_argument,	NULL,		'Q' },
 		{ "utc",	no_argument,	&cfg->timestamp_fmt,	1 },
 		{ "version",	no_argument,	NULL,		'v' },
+		{ "initial-state",	no_argument,	NULL,		'I' },
+		{ "numeric",	no_argument,	NULL,		'N' },
 		{ GETOPT_NULL_LONGOPT },
 	};
 
@@ -197,6 +203,12 @@ static int parse_config(int argc, char **argv, struct config *cfg)
 		case 's':
 			cfg->strict = true;
 			break;
+		case 'I':
+			cfg->initial_state = true;
+			break;
+		case 'N':
+			cfg->numeric = true;
+			break;
 		case 'h':
 			print_help();
 			exit(EXIT_SUCCESS);
@@ -363,6 +375,7 @@ int main(int argc, char **argv)
 	int num_lines, events_done = 0;
 	struct gpiod_edge_event *event;
 	struct line_resolver *resolver;
+	enum gpiod_line_value *values;
 	struct timespec idle_timeout;
 	struct gpiod_chip *chip;
 	struct pollfd *pollfds;
@@ -423,6 +436,7 @@ int main(int argc, char **argv)
 	requests = calloc(resolver->num_chips, sizeof(*requests));
 	pollfds = calloc(resolver->num_chips, sizeof(*pollfds));
 	offsets = calloc(resolver->num_lines, sizeof(*offsets));
+
 	if (!requests || !pollfds || !offsets)
 		die("out of memory");
 
@@ -445,6 +459,20 @@ int main(int argc, char **argv)
 			die_perror("unable to request lines on chip %s",
 				   resolver->chips[i].path);
 
+		if (cfg.initial_state) {
+			values = calloc(resolver->num_lines, sizeof(*values));
+			if (!values)
+				die("out of memory");
+
+			ret = gpiod_line_request_get_values(requests[i], values);
+			if (ret)
+				die_perror("unable to read GPIO line values");
+
+			set_line_values(resolver, i, values);
+			print_line_vals(resolver, cfg.unquoted, cfg.numeric);
+			free(values);
+		}
+
 		pollfds[i].fd = gpiod_line_request_get_fd(requests[i]);
 		pollfds[i].events = POLLIN;
 		gpiod_chip_close(chip);
diff --git a/tools/tools-common.c b/tools/tools-common.c
index 8c2d5bc..b8d821a 100644
--- a/tools/tools-common.c
+++ b/tools/tools-common.c
@@ -402,6 +402,27 @@ void print_line_id(struct line_resolver *resolver, int chip_num,
 	printf(fmt, lname);
 }
 
+void print_line_vals(struct line_resolver *resolver, bool is_unquoted,
+			bool is_numeric)
+{
+	int i;
+	const char *fmt = is_unquoted ? "%s=%s" : "\"%s\"=%s";
+
+	for (i = 0; i < resolver->num_lines; i++) {
+		struct resolved_line *line = &resolver->lines[i];
+
+		if (is_numeric)
+			printf("%d", line->value);
+		else
+			printf(fmt, line->id,
+			       line->value ? "active" : "inactive");
+
+		if (i != resolver->num_lines - 1)
+			printf(" ");
+	}
+	printf("\n");
+}
+
 static int chip_dir_filter(const struct dirent *entry)
 {
 	struct stat sb;
diff --git a/tools/tools-common.h b/tools/tools-common.h
index bc63080..479373a 100644
--- a/tools/tools-common.h
+++ b/tools/tools-common.h
@@ -99,6 +99,8 @@ void print_event_time(uint64_t evtime, int format);
 void print_line_attributes(struct gpiod_line_info *info, bool unquoted_strings);
 void print_line_id(struct line_resolver *resolver, int chip_num,
 		   unsigned int offset, const char *chip_id, bool unquoted);
+void print_line_vals(struct line_resolver *resolver, bool is_unquoted,
+			bool is_numeric);
 bool chip_path_lookup(const char *id, char **path_ptr);
 int chip_paths(const char *id, char ***paths_ptr);
 int all_chip_paths(char ***paths_ptr);

