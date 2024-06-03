Return-Path: <linux-gpio+bounces-7068-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 763EC8D81C0
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 13:57:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 321A3289BF0
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Jun 2024 11:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02809126F27;
	Mon,  3 Jun 2024 11:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yvkr4wVY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ADE86ADC
	for <linux-gpio@vger.kernel.org>; Mon,  3 Jun 2024 11:57:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717415857; cv=none; b=h+VllK6t3p/qadYMtNQ8p/Tr3xOfX/nnAJ6cCZ81UUMPmksAuq67tU4cwuv0r/lA0DKC3V/T2tb/JHBEvpjykfg6qbCDrEKZoreb2GdtjxhhKgMcr+M4dVico9Q7VJtVBsSso1LmLldb0IypmSjN6zTucVHeauQkVAvWBUX9Vd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717415857; c=relaxed/simple;
	bh=9q1v1PgyHbF3kiLZDl8QU/McNErYCrE2oph+FlYx9xo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DvwP3W1KJ5OkzoBHTYG7u6xUlNJANzegyzb3ktOGZcgfb/EgU5SlKoi/bmPvZ1kK3tVD75GiXVFfbqB6C28FaFyxfuRCc134PPQzg+WuQOpnFwsKWZIfmB/HV3yURd4BUNA8yLuM8QJbZ5b7fZnYOqUlbUOWZUpQUet1RidphnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yvkr4wVY; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-6c4f3e0e3d2so2144525a12.1
        for <linux-gpio@vger.kernel.org>; Mon, 03 Jun 2024 04:57:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717415854; x=1718020654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYDobpXsuWyeB1dEUCH/FxgQqYH4TEmXvv8I/1NiRs8=;
        b=Yvkr4wVY/tKHfNkNObnZlKYHdlFq6OYCD0iLrxw4fm37g8AJ1X4qKkhcJUqVgOciFv
         kpVNVDlXc70D1a+XCXL/ETU4cpDNxg5jF4TMs7r4K9EEqvoGvM94viJK9PKNKylManFe
         iwizTbzglsxziqLWUqmk2FGSEYbk99U63dnP6z8jvkAQ3vzIclckEsK4lYD36ys8wliQ
         63QrPRbu31+m7s0J3cZKIlokLi+x/VqqcD63wdk9AT3GwhHVcZmQw4Mp3cK+gBhQl5ux
         etXhS9TrXrb1UIRjIM9YjAq6/VXuG7IkQaf6DWylqznaWAuWqE8w8tKYekL0b76yjokJ
         P25w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717415854; x=1718020654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYDobpXsuWyeB1dEUCH/FxgQqYH4TEmXvv8I/1NiRs8=;
        b=Rypdy/vit3xBdgHFiOG9NswcogmJiP4B5t0vUfBcSBsH7B2VBHB35Dyxa5UL5A27MZ
         CHqoXEf3sD3f9n0M997egH8kG644VCR8yf4UIqc5U2f1nZ9vULQkYArakSHOraw/+mbQ
         JNZMvQUYFD9Su/bg5Ow1IErJEfbKjvoZGTt6tVrpg9zdoqybwis4A0tuFjSd6v6su51F
         IbkZYPdt1yMK/jt12K6bnSYCK4wFEk+m7xjhxNiO9/YJRlj5abat/4dVZ+uRpjS8ilou
         tD4pIIXHgEQsH0DHNMEgtDraZUNdkR1UYHtGbeJwB2r6w3mIRzpgeDpmL/o9u0EBdHm+
         nA2Q==
X-Gm-Message-State: AOJu0YwGgS2WIBifuomaUJ+Fx4TIlP+ORIxQnEauOEXLJ3hQeGY0zFe8
	c1bsDoGtxktJdvkRBEQY6dC1PK1xrsEo4av/uF2e0q/GiYzYsrfg0trEZw==
X-Google-Smtp-Source: AGHT+IE0s76p3+rI311pSa7iZDssEnIem8MXlPI7NNdKxkmK4Iv0EGHzwA44p34Am09DRYN0JCVoJg==
X-Received: by 2002:a05:6a21:9202:b0:1aa:6167:b6d6 with SMTP id adf61e73a8af0-1b26f245b94mr10738196637.42.1717415854580;
        Mon, 03 Jun 2024 04:57:34 -0700 (PDT)
Received: from rigel.home.arpa (14-203-42-154.tpgi.com.au. [14.203.42.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702425e1a71sm5328492b3a.88.2024.06.03.04.57.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 04:57:34 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH v2 6/8] tools: tests: check exit code directly
Date: Mon,  3 Jun 2024 19:56:26 +0800
Message-Id: <20240603115628.102616-7-warthog618@gmail.com>
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

Fix shellcheck SC2181[1] - check exit code directly.

[1] https://www.shellcheck.net/wiki/SC2181

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpio-tools-test.bash | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index d9930f1..83b05ec 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -3069,8 +3069,7 @@ check_kernel() {
 check_prog() {
 	local PROG=$1
 
-	which "$PROG" > /dev/null
-	if [ "$?" -ne "0" ]
+	if ! which "$PROG" > /dev/null
 	then
 		die "$PROG not found - needed to run the tests"
 	fi
-- 
2.39.2


