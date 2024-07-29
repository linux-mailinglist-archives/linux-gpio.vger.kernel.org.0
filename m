Return-Path: <linux-gpio+bounces-8431-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63E4F93F363
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 12:58:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19B941F2216D
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Jul 2024 10:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2099F1459FE;
	Mon, 29 Jul 2024 10:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qm0yN3DE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0C3145340
	for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 10:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722250683; cv=none; b=cQwJFsn6U96gJkqc17b0rI10OcKyECi/aYZkOg0/5Xhq9fnSxIgW5766l5Xkh69PGfpA88VMUsaK70IbRv2A9wqcz+JL8Gq5yLeq5eU/vvQaLcwGA0t+3Tiz0AjFWIDtsCWc919uQXMUZlSmHa2ujC5Y6vA3JdN1q8E4nXvDNzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722250683; c=relaxed/simple;
	bh=COEAfx1YcnGHGtFxa6o0uAvSO5CYp2RoIsi9LKDmDgQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=swf8jLj83Sw4pIQq8PA+IDRwubKvynyr8kAOOaa+LnL0PPVJlZ7xvHgDMqUmv+nVWF8ggXVzZsp5WaE6fVTM7a/QNYZj6Uh/xcrr/9hkPQMMvmNEUcWny1n/r7k2Lu2UpSV37oL+mSrwqfEtDRUSipO9gnVi6q2haileSGGn/VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qm0yN3DE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-368712acb8dso1224674f8f.2
        for <linux-gpio@vger.kernel.org>; Mon, 29 Jul 2024 03:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722250680; x=1722855480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZpO6ulB1XVxuAXKDze55vCRaqEgtb0pPYQuuuGzg/6o=;
        b=Qm0yN3DE71BS9FhjUeaSl1q6nukfKe1XLGWXsYb5j9odHm/7Y4reRjueEv2GLAlfNT
         bladnOe3fN8qHitejkdUDqh+cS21rDMoedk+zunEQwZt+OkFU2Jzo7OC2oKr/YwHsst6
         iAI3vBYldQJI1kvNBx8VExB9rX1phJ1C/SYl7jcoAT+oaFHKkU8TS2UZ3bkOrP5ap0uP
         RmJlnfPWD/j1ypYtVByF/YDGc/5ridzopR1gX/VQZ1vv09hbbbmbwZN2RlgRKtpx/oVT
         b7TE7/fmxqJRHJGZrk43/u7egAXOg+LPErr0h4s0XIKX8SCAj1L7iMnp8WCU/zieCSsi
         mWDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722250680; x=1722855480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZpO6ulB1XVxuAXKDze55vCRaqEgtb0pPYQuuuGzg/6o=;
        b=QP2JfuIn3jD5uFpCVBj2oa/qn498BcpO6tdvVaMAn/Pp+rbFnGsOA6xVHc0x+/nWk5
         wa7WwK0h+z2IO8Qh3B+tkgC0pzSiFP8F9/Rb2gcZxmkymhdWtsFt1LKF3gdGJP9h5iAp
         /ZX44x+uweDpGqJ/Cw5KmDKgcFnDCBgInFouxzbId761fBApu9aBU6trDpM3jsg6Ja2J
         /jKzN3MkKH6YDL9VSakjU/wycPsRifYyozwOnSD0jfGozFpMUfPOhc7uzzFR4XXnwfyx
         vp/WtwGVosij8TI0sRvz/uPfkRt6G5xtvA0gslBqoSEnxRMox1NeY9rcpsAT3F2S/ecc
         XvZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhMdt6WvYqZizVPrXOrcfkN0c8WcxvIoCuY1HXKtZjdJ5tVCkE8QzDNZD31c92NDdPMITv3xZ2BB0dHMNPKbm2sWXOOld8sGfr2w==
X-Gm-Message-State: AOJu0YykCB8JXKv94vjLdIeM+1uD2bsHv6vY72epw5UdrO3a98s9ZQUf
	fJZbP14c5CoBnnjByoOljvmgwpW/zEIBgrq2kIkhf4YK1ZkUUZnn
X-Google-Smtp-Source: AGHT+IFmL47PMz1a21fDNn623XG2BAJbg1yybAhiv1By9KELryV5z4VmSvjKT9OiUVpPpBYn0DUJ5w==
X-Received: by 2002:a5d:6d8e:0:b0:366:ed80:d045 with SMTP id ffacd0b85a97d-36b5d0aeb1fmr5296498f8f.47.1722250680233;
        Mon, 29 Jul 2024 03:58:00 -0700 (PDT)
Received: from fedora.redhat.com ([67.218.243.111])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367fc8a7sm11858068f8f.59.2024.07.29.03.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 03:57:59 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: brgl@bgdev.pl
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	ipedrosa@redhat.com,
	javierm@redhat.com,
	perobins@redhat.com,
	linux-gpio@vger.kernel.org,
	warthog618@gmail.com
Subject: [PATCH libgpiod v2 0/4] Fix issues detected by static analyzer
Date: Mon, 29 Jul 2024 12:57:15 +0200
Message-ID: <cover.1722250385.git.ikerpedrosam@gmail.com>
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

v2 includes a number of fixes to issues highlighted by Kent Gibson
<warthog618@gmail.com>. 

Iker Pedrosa (4):
  bindings: python: gpiod: avoid use after free
  lib: line-info strings termination
  lib: chip-info strings termination
  tools: free to avoid leak

 bindings/python/gpiod/ext/chip.c | 6 ++++--
 lib/chip-info.c                  | 4 ++--
 lib/line-info.c                  | 4 ++--
 tools/gpioinfo.c                 | 4 +++-
 4 files changed, 11 insertions(+), 7 deletions(-)

-- 
2.45.2


