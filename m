Return-Path: <linux-gpio+bounces-8242-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 083D3933C69
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 13:38:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E4691F21364
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Jul 2024 11:38:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0903217F4E6;
	Wed, 17 Jul 2024 11:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PPZg+Rx5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36ED812E48
	for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 11:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721216280; cv=none; b=BR0VyqMJbNjMqb2NcwiRdtQxuaUJFbWuTPdjfbDnQrDZKioQIFwizZ4TXSS6EtYxXnOq7O5phLKttVlNW+1dsyaFWOQyP+WOdDYOs6ohEvaPIwg0oTet74TAwyj3ghOtErK1db/17zAeLANw0URA8yg1vkOHvgNYc0DGC6xexes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721216280; c=relaxed/simple;
	bh=CM3N+jFv4vMN9KapDjrCfWWY1Fo5h4ljDMkQVh6OC4g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LGYD8edA3/W4UdNBg5aB0K9o/0qcZOJLsj+VDvDNKxCfPokjP7z27ZvcHYeQwck14Xi7Y0CsZAkKk6o+nTTiRt39FxfG1VY6QI5lJnySB7gqtXRaxnbxxsWPhc/K/UEAQqoe6EOONK6/JNs0JZ9ZlLr1j2XUfyIqP+WWLPwTZ6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PPZg+Rx5; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2eea7e2b0e6so91050421fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 17 Jul 2024 04:37:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721216277; x=1721821077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wlB1iyWEb/+gttwZJ80uAWjEY9CPVp6N6GWQwI14RkA=;
        b=PPZg+Rx5uzHhKzgXDuZslG6o2bYGvgRVFZMZVAK7Hjw+nGL/lfwGbP2wyS7705F8Sv
         0ac7xwmRKmbLrzB2uhGiL+2uG6Czy18tb7TWPQKFkypYCPZXtQYf+aZstOSa5bvTVFqx
         /z6pQAn7AfAaUnqDuNmPq5+sMZxuMGlbOME5RGlPi7jzwnllTIURDkPn9FumJUol9uPK
         7rGafrl2DYHkrcXOeWByYk1QjC8LVYaNGoeOFY6s8RGDbrh/GPZAgeMNsicLvQOd9SbZ
         g/vwr23oa2MgCRUIUxsYQiMivBJt414M7U2n3RHUjn6RUVbYbaPOBf9/7bbFsVCoYqFR
         zubA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721216277; x=1721821077;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wlB1iyWEb/+gttwZJ80uAWjEY9CPVp6N6GWQwI14RkA=;
        b=dsirTQ2y8aEU0gDkmi298XHAeXnpasVS5voez3Wh9NtubASZbLS6YVaxYRoP9Bz88t
         7zOzGiLAUxmi7/cYPVCmM3/KnYXhSGvq5fk5YDC4LPt/5rA4jTtDK0R4WxPaSrA5C2ft
         vNHlSlGa1nmI5xISRvbYruIgPz1zx/jOOgOKrvG8EPSzOIcDzLHO3eC1PnItOnVPWjrI
         KiOzLu2+c0+LFVbCthzQ1XjvLPh9/v1nwfnrHZtAKy2zpt6BhR0M459VHebRZrnkarhZ
         8SeEXeQ3imULP8OI6I4k4yj/7blgIdiPAP7H75kIO8Rq2vKxCEv2dypoYSKB0BAuxv8k
         YOhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtcZTiH7R9mws1AUc1mSCcoBIc67DU+IzEINEVmCNQ6nk70I+zHr0JJS2FuIqjkMKdcHrnSq5VPClfN1yJ21vu+K+jQvJn/v9sog==
X-Gm-Message-State: AOJu0Yx/Kl46u1vtE6fMyuOJjB/VUWXJKFO/nERTU6Bgxz5nhs4/cb5S
	QbEBR/gyyiWeGqNjqQHUzWILt1uetFDyq37m3hcGAzQHT6vnIUfP
X-Google-Smtp-Source: AGHT+IGO1F7H1VakqT+ZRdo61OWPDW+Ee2StG2lspsSue4UxlbhU7i+JwP2QxxjWUqhrgKYFzy1Pkg==
X-Received: by 2002:a2e:a9a9:0:b0:2ee:8777:f86b with SMTP id 38308e7fff4ca-2eefd14c8eemr12959161fa.35.1721216276892;
        Wed, 17 Jul 2024 04:37:56 -0700 (PDT)
Received: from localhost.localdomain ([67.218.244.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5ef4617sm165705635e9.41.2024.07.17.04.37.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 04:37:56 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: brgl@bgdev.pl
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org
Subject: [libgpiod][PATCH 0/4] Fix issues detected by static analyzer
Date: Wed, 17 Jul 2024 13:36:40 +0200
Message-ID: <cover.1721039339.git.ikerpedrosam@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series contain a set of fixes for several issues detected by a
static analyzer tool. They are related to wrong pointers management and
string termination. 

Iker Pedrosa (4):
  bindings: python: gpiod: avoid use after free
  lib: line-info strings termination
  lib: chip-info strings termination
  tools: free to avoid leak

 bindings/python/gpiod/ext/chip.c | 6 ++++--
 lib/chip-info.c                  | 9 ++++++---
 lib/line-info.c                  | 6 ++++--
 tools/gpioinfo.c                 | 4 +++-
 4 files changed, 17 insertions(+), 8 deletions(-)

-- 
2.45.2


