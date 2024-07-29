Return-Path: <linux-gpio+bounces-8433-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4565E93F365
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 12:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF92E1F21FAE
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 10:58:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A546814533F;
	Mon, 29 Jul 2024 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dK8uyuwf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96841459F8
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 10:58:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250685; cv=none; b=GzJIhhqrsHSphKuYmKhjbUqZYcKCgQ9SmjX/q/OiQG/ReecS4xzxcxrXMGP5bQfzsI4d6FaJvGqPONaJgGv8hkcwfFRUyxyKAu3BQeWTaRNr+Ka8GuV6G4vqjHo2P/rYAf/lKrTsm3A2HZb+YCzouN1StuFv+y0Q81HgHrTCptU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250685; c=relaxed/simple;
	bh=CjcglEjj5maZHTGMPRYlVfVRYbNXXqvyJvzKiP4ymPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ETz7FA1qans0avuP2hb0qIa8yJCi8kvDRj4AEqNi8/ewFRQivhSoKZ5fsYPHfrDn/pVR1yID3EwpMBYhtk0tzPHbEQidPVp14Shrs2uYp+M8/XtUALwYtQPpd73Z1A/Z/Hjz+AoOPy+8qRT6LIyjClfqeSCH6TiTtBEWolH+M7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dK8uyuwf; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4281abc65daso8627275e9.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 03:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722250682; x=1722855482; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwZGphjLSMzYA/JQp2KpfNJjuPVCH40cB4KhBRZbxPc=;
        b=dK8uyuwff090ms51dW0fo7GjarKHAyyA5lnFUnbA/oUG82T2zAGM4d4pernmgMbJ/+
         r6Buoq1p96mtErhjnrG8WwAGgH0a/qdkmSgl5VH6PR/hEsrO1/2KO0s6QPJ6IxqNRME2
         iR73Ve9tkoWONjKZ5J0MziOgFAojJc8zQRnh4IHYtqsg0AhFKro1NqohwYDmOUU6dVsv
         Hp+jLb+UEVCiFLU4LAlf5tupDJu3G4z2ViFmFbZl26mMmc88PannitvBSJq9mAMg1kZq
         WX+15bIG3X0REWRSwMF+OCD92X1bo+5OuFYgtgONf7WnOXd0qZqFWdZdUt+5p43pgabH
         bnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722250682; x=1722855482;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwZGphjLSMzYA/JQp2KpfNJjuPVCH40cB4KhBRZbxPc=;
        b=OQ06lBCJYq8QmdIBA9diytr+ct3pwd5voyua2Z6zrFFIgV8B1Jhgt+S04FuMMYWcgv
         CT/8ee2ve0JKWeIDpq8aMDyzqhE2ZQ4NH7YpwUXLnzqEg5oFnf8WOiWiFJDtf+sXSoMD
         4TJXrL/gQg4mc0l9VSXNLthj+Vq1TSt2T/treKgMp63ubVMMdpXUqufRs4g1/YGP4UbS
         seFoz2cWE29um35+Kidk/N0+UJSQ6YIMENDZe8TgjRBljDTY3DEx/ObQ5t97mkyyaZ+1
         ZggrkZr5cYhUe4EIrdjHA+I2hE+4KNxDQTViMbLPiYCt9uPYQwhCL0GEqh6RH42MCgco
         FEzQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNTOZMH2LB+Q77jpUmog0TrToP1ROtLTCcVVSyM5923uhZPcyNIFl3jTfzaCfUXjPq+juKDE025UbJUOno9JvzEcgMVwVkNvoqTA==
X-Gm-Message-State: AOJu0YwvSxA1XApjtX0phB+dz71TAkBNCp01/u8Q6IclPTF6fD8HIZ7d
	8noqjpicxmZ5NbqAbPPbGofu22o0Y0IRrDyIAiNT5xZJOS/4UNrlERm14S1x
X-Google-Smtp-Source: AGHT+IFhO8XbluIeaB/uyD1tLl7H4Uyd1V0DOHMLHH8TVwYFcnibo2ettezgb36xK/1PmhW/3Twuhw==
X-Received: by 2002:a05:6000:1043:b0:367:9988:7300 with SMTP id ffacd0b85a97d-36b5d08eb12mr4352019f8f.45.1722250681944;
        Mon, 29 Jul 2024 03:58:01 -0700 (PDT)
Received: from fedora.redhat.com ([67.218.243.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fc8a7sm11858068f8f.59.2024.07.29.03.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 03:58:01 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: brgl@bgdev.pl
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org,
	warthog618@gmail.com
Subject: [PATCH libgpiod v2 2/4] lib: line-info strings termination
Date: Mon, 29 Jul 2024 12:57:17 +0200
Message-ID: <84db7bbe2c84b2d880052a05f8b1cc123d60c2dc.1722250385.git.ikerpedrosam@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722250385.git.ikerpedrosam@gmail.com>
References: <cover.1722250385.git.ikerpedrosam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() truncates the destination buffer if it isn't large enough to
hold the copy. Thus, let's increase the size of the destination strings
to add the NULL character at the end.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 lib/line-info.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/lib/line-info.c b/lib/line-info.c
index 9f53b04..a7c6241 100644
--- a/lib/line-info.c
+++ b/lib/line-info.c
@@ -10,9 +10,9 @@
 
 struct gpiod_line_info {
 	unsigned int offset;
-	char name[GPIO_MAX_NAME_SIZE];
+	char name[GPIO_MAX_NAME_SIZE+1];
 	bool used;
-	char consumer[GPIO_MAX_NAME_SIZE];
+	char consumer[GPIO_MAX_NAME_SIZE+1];
 	enum gpiod_line_direction direction;
 	bool active_low;
 	enum gpiod_line_bias bias;
-- 
2.45.2


