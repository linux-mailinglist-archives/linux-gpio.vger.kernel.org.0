Return-Path: <linux-gpio+bounces-7007-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4338D6357
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 15:46:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C43E428A9BC
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C39159205;
	Fri, 31 May 2024 13:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JmGaiY2J"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E732E7440B
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 13:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163157; cv=none; b=q9n2h51akrO64TmRV4Iz6pPYy1cFfNEaQx7ZcW2WTbeXmoucjIZ6FHFtUzBNriBdeNuBFjNkQ6twRQdOJeevkHcOFHWu3za7VCoJ+HNyVoZu/fabX1n3TeTFiswu1CSo+gM1MnfqfKoeD6uavCU8qIvXneMGzrb5DBZK6NbtE+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163157; c=relaxed/simple;
	bh=NGfG57z/OQC1Ci0PhSg3RgSmTPhNEZQtYwxKsaiT/jw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cuJVEdNn1F+N0RaJgRrJZKZBzhSgqTpAN4RBGjl6WEFxaS7dt+2kpmbns3cQvDE8OCnsLe7HPEh+h7afeM2hYKQxht5uDYvnDfTURPSBcBUD+wvJGv9lJrHW5e8Wy+bQ2cE40ds/BgF4Z4BkXY4NZxWZRGpar2OvcIIWh/sfnRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JmGaiY2J; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-70234843a67so1592203b3a.1
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 06:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163155; x=1717767955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fmU4EjHVCF4lsbIw7+P55SIWxIwS7BZv9Nx9m9Mjglk=;
        b=JmGaiY2J0HSg3Efqzl34YZGS6ltPv7c6wlQ/gZ9v4poDAhFR6RfQbLL2um91/56+WW
         uxF4iw/BeT5Yx9X++P/lMYj2XgaIIDSIrNWVEhKkthaRRcyy5VJbCRFu4rSu0n3+qKST
         +byFTtgLdr+zGZQwiih0zQvG9q7+N0PTu/kc2JdE7WtYkPtzLDgHx/c/pc/n9F++3Jza
         RHEuPmxQUVMCCN8TuV/bu+7GyrZE3xD6KZrlWTNt2ilj3nK7a96OrN6HgpWIbHOYtMgJ
         C+GBqnRISiUGU41lF2m4IgwVAbzofASo2ziqy7V0cPtyCRKwnlyfARFsPpELiOHN+v/l
         nlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163155; x=1717767955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fmU4EjHVCF4lsbIw7+P55SIWxIwS7BZv9Nx9m9Mjglk=;
        b=rRsDfMJyKgmO5NnJy4AzbJr7vkSL4CHay3FHZwSBuU18+n9BjdLLd5OPKgdBbSTWoH
         BtxlCpKh5Hd+53ZS37tdRxC/KHfVEIYoBdtZd7L/OlzgbNs80Gb94m6Wez65XXHEnceh
         3yKymBaDZBwzrNCc/HdSA1CZSJclikm1z/Brp1CNTKfPd8TkSfhcFr01794Rq2vgghxg
         CiEnJcVvL5jScZJjr86Q7pdh44310JTF8nOlB6wHbjn8cfbc8LCwKyhgz6taGsZ/U7EI
         iNeZxiXYPGZFSuCWa6l5sBSwlqsw83U/tQZxWFT9REdHDP1DBX1rf/y/eUzS5VDriO1H
         EKrA==
X-Gm-Message-State: AOJu0Yzbak1FsZfQjyzCH0vz3rR2gcpVcUl3saDhIT8p3XQLtBYG8774
	s1PiJmVdJlYjt5CuhJRA5oIfw/PhMH/wjd0xG+9gQ9b1isgvkr1qBFxg+Q==
X-Google-Smtp-Source: AGHT+IGR0I2ZkSxfw3OkJP1qnM1a10D9WOh76Kcj7xwh1PdWPNVuCBHbaKBqWOBHuh50plUF1WNalQ==
X-Received: by 2002:a05:6a00:27a1:b0:6fe:23eb:6cb6 with SMTP id d2e1a72fcca58-702478c70cfmr2059223b3a.25.1717163154789;
        Fri, 31 May 2024 06:45:54 -0700 (PDT)
Received: from rigel.home.arpa (110-175-132-92.tpgi.com.au. [110.175.132.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7bf0sm1389825b3a.42.2024.05.31.06.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:45:54 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 2/8] tools: tests: don't declare and assign separately
Date: Fri, 31 May 2024 21:45:06 +0800
Message-Id: <20240531134512.443850-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531134512.443850-1-warthog618@gmail.com>
References: <20240531134512.443850-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix shellcheck SC2155[1] - declare and assign separately to avoid
masking return values.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

[1] https://www.shellcheck.net/wiki/SC2155
---
 tools/gpio-tools-test.bash | 28 +++++++++++++++++-----------
 1 file changed, 17 insertions(+), 11 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 34ea744..6bbb06c 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -49,7 +49,8 @@ output_is() {
 
 num_lines_is() {
 	[ "$1" -eq "0" ] || [ -z "$output" ] && return 0
-	local NUM_LINES=$(echo "$output" | wc -l)
+	local NUM_LINES
+	NUM_LINES=$(echo "$output" | wc -l)
 	assertEquals " number of lines:" "$1" "$NUM_LINES"
 }
 
@@ -73,16 +74,18 @@ gpiosim_chip() {
 
 	for ARG in "$@"
 	do
-		local KEY=$(echo $ARG | cut -d"=" -f1)
-		local VAL=$(echo $ARG | cut -d"=" -f2)
+		local KEY VAL
+		KEY=$(echo "$ARG" | cut -d"=" -f1)
+		VAL=$(echo "$ARG" | cut -d"=" -f2)
 
 		if [ "$KEY" = "num_lines" ]
 		then
 			echo $VAL > $BANKPATH/num_lines
 		elif [ "$KEY" = "line_name" ]
 		then
-			local OFFSET=$(echo $VAL | cut -d":" -f1)
-			local LINENAME=$(echo $VAL | cut -d":" -f2)
+			local OFFSET LINENAME
+			OFFSET=$(echo "$VAL" | cut -d":" -f1)
+			LINENAME=$(echo "$VAL" | cut -d":" -f2)
 			local LINEPATH=$BANKPATH/line$OFFSET
 
 			mkdir -p $LINEPATH
@@ -92,10 +95,11 @@ gpiosim_chip() {
 
 	echo 1 > $DEVPATH/live
 
-	local chip_name=$(<$BANKPATH/chip_name)
-	GPIOSIM_CHIP_NAME[$1]=$chip_name
-	GPIOSIM_CHIP_PATH[$1]="/dev/$chip_name"
-	GPIOSIM_DEV_NAME[$1]=$(<$DEVPATH/dev_name)
+	local CHIP_NAME
+	CHIP_NAME=$(<"$BANKPATH/chip_name")
+	GPIOSIM_CHIP_NAME[$1]=$CHIP_NAME
+	GPIOSIM_CHIP_PATH[$1]="/dev/$CHIP_NAME"
+	GPIOSIM_DEV_NAME[$1]=$(<"$DEVPATH/dev_name")
 }
 
 gpiosim_chip_number() {
@@ -3044,14 +3048,16 @@ die() {
 # Must be done after we sources shunit2 as we need SHUNIT_VERSION to be set.
 oneTimeSetUp() {
 	test "$SHUNIT_VERSION" = "$MIN_SHUNIT_VERSION" && return 0
-	local FIRST=$(printf "$SHUNIT_VERSION\n$MIN_SHUNIT_VERSION\n" | sort -Vr | head -1)
+	local FIRST
+	FIRST=$(printf "$SHUNIT_VERSION\n$MIN_SHUNIT_VERSION\n" | sort -Vr | head -1)
 	test "$FIRST" = "$MIN_SHUNIT_VERSION" && \
 		die "minimum shunit version required is $MIN_SHUNIT_VERSION (current version is $SHUNIT_VERSION"
 }
 
 check_kernel() {
 	local REQUIRED=$1
-	local CURRENT=$(uname -r)
+	local CURRENT
+	CURRENT=$(uname -r)
 
 	SORTED=$(printf "$REQUIRED\n$CURRENT" | sort -V | head -n 1)
 
-- 
2.39.2


