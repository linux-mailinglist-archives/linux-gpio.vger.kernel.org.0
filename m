Return-Path: <linux-gpio+bounces-7064-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD528D81B9
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:57:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCAE6285D9C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7955C86ADC;
	Mon,  3 Jun 2024 11:56:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dDggDbvc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B8386AFB
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 11:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415817; cv=none; b=CWzouC4IeGcgObqgvMeFZKKdeD4xe5Ndwe+UOy40sf+OnvFj26SUR+68wVZO2iXl7fm3gzbmpCvPlBxSD/M8sBLWN+aprpcZHgTQ0wkjctOoyBYwVqAwBb7DdyZFLjvzW0gHghLAtTma6Eak2elHoSEs0d/aNY+A1tpiy+PaUhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415817; c=relaxed/simple;
	bh=6eCjg/V+kwlNl8kfKQR58UwRH55N9f+vgZ3vz4egIeo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fUSP6m3UBuIVIxOu7JYkxmDMNl/I9n4lLwLy39vFXYWlDuHUeSaSa5IBMRf6hcZVaYgSTHrQBVRsAvjtWuDkSYq8X5Tpj0nOdYl1vEcAJ+dYbjEa55cWXBYpFPAzsl0sGzDzyDVpmmAkcVFXqJyclqYu9vAnqrmOXAriizsrKLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dDggDbvc; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-6570bd6c3d7so2343810a12.0
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 04:56:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717415815; x=1718020615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ry7sfna3orle+zXzrk0ZdW3l4LBSUpFBb6+Ja1Szbb8=;
        b=dDggDbvc0SiB3kR4DlroOvXFUeEDo5fTFiSL8C1W+k+xr9LflPcZdP2Nx87Xhs17zX
         lqiWiB1xTcQJvK6btWs5YWSb9VnOHXiepplie38gyytTK7mL3AmBVBJ456P6I6Y506Xf
         x/JKxETy2L2+5UKp8XXFSquEcB91RdnEvtsPnTS9onDwJ9tXrzB7i3xZuNlONnTSHvGE
         MIDNfbW+xsklW1ohKhJKO8KvsQcPpaEQQmI/b5v9UkfxbR8mSa6crRN52Oqktymm3m60
         zHAnDO2cuitHLZ/AAYXbeynRZpCP8SVPMrB9+FiGBMqmy/osZa9L+4M6RSWIi0qDVzsp
         VRZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415815; x=1718020615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ry7sfna3orle+zXzrk0ZdW3l4LBSUpFBb6+Ja1Szbb8=;
        b=Kn/yZ5R+J6m+X9J4Zx3QGRaCJkMeOLFCJFLIDf8qK1Tvrw7TCJCFwE10GtWNlz0W0Q
         UDwoVUw1CwPv+vmaE2SNcjLqRVKiYYuHdf2CpDwFAq012NFjN9xWWmR0c++7LrTZEtjF
         Dc4I0BnaJxW5Auj7L8P12UnTaWuWmj8NBx1jPXeaRqZj7lc0gcnyNaAXOiwKZrsux7wy
         YnPUSgcjVkIRDJx4Snk7Q3Mr1uaOdyNM3EtULYfu4B6DcYH0Kp93ELgpElxTp92XVQO5
         F3Vxz6L1L2m1eJ+pRP2SmwObpWf/DDvicxt68T0zI4grbTgIVCl6/nh9vwCJtiUoLDjX
         Qkrw==
X-Gm-Message-State: AOJu0Yx+sA2kWKKJAcsZRhvi5n3+tOP3AITzgYGZuhAjsa8amsoWkaog
	bP2HjekhGgZhvuGzqnZcAOkt/ouyIZNUxj4mvTYt1qlWRkdRJW3fQYjwcw==
X-Google-Smtp-Source: AGHT+IG2T/58ar2SWf5V+7bdVdkJ3i9dOFPWehvT/JhSU3JOyGS6tRBVJxDnxZrzkupozAXmtswCdg==
X-Received: by 2002:a05:6a21:32a1:b0:1b2:3fc:9ab2 with SMTP id adf61e73a8af0-1b26f17db14mr10174953637.1.1717415814939;
        Mon, 03 Jun 2024 04:56:54 -0700 (PDT)
Received: from rigel.home.arpa (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e1a71sm5328492b3a.88.2024.06.03.04.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:56:54 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 2/8] tools: tests: declare and assign separately
Date: Mon,  3 Jun 2024 19:56:22 +0800
Message-Id: <20240603115628.102616-3-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240603115628.102616-1-warthog618@gmail.com>
References: <20240603115628.102616-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix shellcheck SC2155[1] - declare and assign separately to avoid
masking return values.

[1] https://www.shellcheck.net/wiki/SC2155

Signed-off-by: Kent Gibson <warthog618@gmail.com>
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


