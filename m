Return-Path: <linux-gpio+bounces-8435-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD8693F367
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 12:58:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC1E71F221B1
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 10:58:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3764A14534B;
	Mon, 29 Jul 2024 10:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KU9B4g0Z"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AFC2145335
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 10:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250687; cv=none; b=JomUQs0MAkcnBKGBF+vyTxydKUiNM1idFi3q1ACpcKOqZ/ymlKCC52j8rb5Y4nENAtr6RlOfcwwWeii9EHuHcTB6HASZjHnkJNFyzzllSOL9VrWn0PmWTAanu5q5H1W51Q2mNaFIE9DwrSIDoz82xInh7KlP0JStvZsQUoWNAcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250687; c=relaxed/simple;
	bh=648WPwSypI01dozL3GPxYcKmchkxukmUVr2UadNI6VY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ngnGSAeOW28LnEliNY3QR/AMyOTBcQtVzyhJeUV55WH/6zfumrMJrZzGpTpb64j4o+2Qh0klHOjhQh+UAd/5sJGQYS/wPeKfey3GALJbpMhhZMja853X+akSchk0zb8T5W5NuC5u5JisNsfMrY+/jMYX5bxAXDany/4PqgeLiPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KU9B4g0Z; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4280bca3960so15639015e9.3
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 03:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722250684; x=1722855484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6itGH4T9eUxyrVDIKCTbm8yTTmvQOv43V6XixxxIn4=;
        b=KU9B4g0Zy9j0QFwjBdCZM6ThG0U2YqsXVrVPWcKLc+EF051gqV/cEWVxXl3Y7qVqPB
         DBUCgVh/mr0XldeRPUDpYaTO/3AFbRx9LyIRNNQb5LzbuxqlDmMqE6imKuWZaifaRegz
         3PObaqtAbVTq/ZIQpFoSHqwaCfo4cbYGdF9GdGwctTez8ZWR0+JNHmEq9lWL4yU7Wl4i
         zh3bS4Rv6dqq7auXGPL31DAQegnkmZ+IsZzmF+emiir93uaiXh/Ojt4sgtp8covJdzT3
         lghJ69bh9Kz5qXoONXF5fgOkdhiAZ3KgkwgjkFUD+FBpi1Ae9GFHe9FHfEv1LlCLTzFB
         rvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722250684; x=1722855484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T6itGH4T9eUxyrVDIKCTbm8yTTmvQOv43V6XixxxIn4=;
        b=OXoTvZm7FHOp6TXnm4ravzW2GjTLVCmJye4ozLyQDbz8h4EhYDF43y/Y4jZI48G3Pm
         OCvRSP9OQ4owD11wYgxlAszKSiRg5kSHUjCREf0MuMkRD7agdtB+w823LzYt5wFzvpjq
         c5w0KF6dR8HHTDNJhm5NnGev2X9Ej37z/hiNx/ZoA64BqY5bHvivn8UU1y6YKRpKSnCb
         08qcjOUTTX+xk6Hl8adkoHoNqQWCay+aUXn9b4J85mmjudefZsEJS2i4qRRJP/BwDLbt
         pXmLqOGY6khjomvIbQRA8xzPn4RRFaQ9LjWaeT4P+PZXNTc+BE3vo3mPLFvZJ1viTuYz
         dbKA==
X-Forwarded-Encrypted: i=1; AJvYcCUal7SwZU+WJr0/ffDWBVxetCdtwqLsKU5xKy/8ZnxE1Nbt35HsdDpoZ97akQWAlqYe72eR5cMXO7neOaZDqhFt6DrrG1P5VbgQMQ==
X-Gm-Message-State: AOJu0Yz38GY1611My2j09m4H+YBmnq4UHsZz0KprQ9mSfQE4DuWi9/iF
	eEZwZHXnPih8ru+h9pB92MNlM7MhLHzPPupC+VAX6A3aexl9HDKU
X-Google-Smtp-Source: AGHT+IGnrunNf4IEPH84qImEPyBm3e2kMJAZ0S47dYkkaQnZe5AXkKF2xl/446JFsGP+0m39QODTjw==
X-Received: by 2002:adf:e74e:0:b0:367:83e9:b4a5 with SMTP id ffacd0b85a97d-36b5d092cc5mr5370814f8f.49.1722250683653;
        Mon, 29 Jul 2024 03:58:03 -0700 (PDT)
Received: from fedora.redhat.com ([67.218.243.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fc8a7sm11858068f8f.59.2024.07.29.03.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 03:58:03 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: brgl@bgdev.pl
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org,
	warthog618@gmail.com
Subject: [PATCH libgpiod v2 4/4] tools: free to avoid leak
Date: Mon, 29 Jul 2024 12:57:19 +0200
Message-ID: <418b4fa7b6279b15ea10936d65ce45e01675e491.1722250385.git.ikerpedrosam@gmail.com>
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

`info` variable is allocated, but never freed when the loop continues.
Free it so that it isn't leaked.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
Reviewed-by: Kent Gibson <warthog618@gmail.com>
---
 tools/gpioinfo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index 44d1c8c..d5e4751 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -195,8 +195,10 @@ static void list_lines(struct line_resolver *resolver, struct gpiod_chip *chip,
 				   offset, gpiod_chip_info_get_name(chip_info));
 
 		if (resolver->num_lines &&
-		    !resolve_line(resolver, info, chip_num))
+		    !resolve_line(resolver, info, chip_num)) {
+			gpiod_line_info_free(info);
 			continue;
+		}
 
 		if (resolver->num_lines) {
 			printf("%s %u", gpiod_chip_info_get_name(chip_info),
-- 
2.45.2


