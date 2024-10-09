Return-Path: <linux-gpio+bounces-11081-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC10995CDF
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 03:17:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 621661C21708
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 01:17:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C632BB0D;
	Wed,  9 Oct 2024 01:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="A6YwTmDr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244971CD2C
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 01:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728436664; cv=none; b=GjiZjQj51Q2ieB/vBORcLWzj+FMOWME52GCyN2QLt863MS41hSJDFEDAz9JGOCI1ln2WvDQMrqXokL47k1CzJWl0W9GDyVmTftZgt4IAMRKl3ZgQP7k+iXVUXZ0bFTJ1R6300u7XrW8u84TdgMWzIDNRMoP3UwK6XHGcE65gD7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728436664; c=relaxed/simple;
	bh=F0fzJk3goWwHbOnHvEHn53C9HzZ826eUmoIuPWYk1H8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XUPtaeYTWvnJdKh/retGFqQCyhhGgfXDPoYFxlEj8zEhlSicFJUEteKsiNn/m1yPfgVTXebS46dAEGWzxC56nBAWcMOGSkCF+NqupZDX54Hlvts3V1UMb5C452BPUpTm3TiSk8mfVcdfq6EJNYSu98M3Qws98XAk+Y7dRr/Cndc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=A6YwTmDr; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-20b8be13cb1so67391115ad.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 18:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728436662; x=1729041462; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A0aqH8Nz3YTxyf3WOUwJPMSHP7Sz01anRaWLkW9KhzE=;
        b=A6YwTmDreT8WhJmngBFDMbrFkVfQYjqM4kKYymCdM+sOROt9OhGDjuBHqkGpor3kdR
         cccyflIMAOSf/hB8OiQculKZP5KSS2AVk9c62/tzIPbMQkJlTfcZ7y7qji5LSvwZSDDl
         7eMRgog+MMS2EXMhx/35OeR0mAJkVShB+qcKTglLfO1enlHi/ggt9kdecAP4MSKunS8W
         b8Ezo41TnqkXU/TXo2Rro54/PWcelpIouu/XnolPwPj/2opRLfGhHkYfq72OGZRXKMsh
         WS7NTsQ2qk/2jc34RaHiOpApygrGyp6237NONZDgXH0Q+lIPaM7y/mFnKWz59Wgpca4W
         IdhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728436662; x=1729041462;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A0aqH8Nz3YTxyf3WOUwJPMSHP7Sz01anRaWLkW9KhzE=;
        b=q6j5UiRUHRrk4H47LmovtT2hfPzzEexghZsxWdObhhBkw1u6fikBCsUvXL/SderNKB
         YJ8S60ACKFjuWzyyqpVp+BMluO+1jlB+1kMJj3ODHpb+EMlLdb55P22perON2u9yRGtB
         9ziASaZDWsBgVA+U+l66COwSUJ0JQ7Ch1sZfJKF/eaAh9BZ9MX5YkHWzaJCHyL/DMBAU
         KRqPWZeuOY4pWze0glEPP2ik6+w3v2Yvws2UAyVU6JgvDpS1KkIIn6PqBQruXn/5JYGy
         2/2/oayTu38b5BpqwTRY3eOBMoogJeAmlTY/kQAUINf2B5CaIOMljK4Z3MAh2UYCu7GX
         BlEg==
X-Forwarded-Encrypted: i=1; AJvYcCVW5BtynDgaw9KYSE8pgujf1XN/EzxhV1gBxJjkVSdsdRjrrsV1oGd+xEwcPYiv/1ajKQKUDa4RhAcw@vger.kernel.org
X-Gm-Message-State: AOJu0YygK6DBx1zafoO/6ksWWR1YMBZZStPYmZEdtF3f6SIFaHDMNeNK
	Ya8iuLkfOuJR3RuHSU1bTCuN2fBiBLJB2rZanBq1eBIk6IUuuTILJ0lyg/1PWiQ=
X-Google-Smtp-Source: AGHT+IGI9taZWLdFpMIE4dgnATWsHC+Qt+VhRQuoR+YZVLfax+9lGozJReoLif1bhqH7Lg+Rw73W4g==
X-Received: by 2002:a17:903:1107:b0:205:6a9b:7e3e with SMTP id d9443c01a7336-20c639172b2mr13200455ad.56.1728436662596;
        Tue, 08 Oct 2024 18:17:42 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbbc2sm61076365ad.78.2024.10.08.18.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 18:17:42 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Tue, 08 Oct 2024 18:16:47 -0700
Subject: [PATCH v3 2/3] pinctrl: th1520: Convert thp->mutex to guarded
 mutex
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-th1520-pinctrl-fixes-v3-2-5b60db446a49@tenstorrent.com>
References: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
In-Reply-To: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

Convert th1520_pinctrl_dt_node_to_map() to use guarded mutex for
thp->mutex.

Suggested-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 drivers/pinctrl/pinctrl-th1520.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-th1520.c b/drivers/pinctrl/pinctrl-th1520.c
index 265a75a78d5a..7ed3f82b9339 100644
--- a/drivers/pinctrl/pinctrl-th1520.c
+++ b/drivers/pinctrl/pinctrl-th1520.c
@@ -444,7 +444,7 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 		return -ENOMEM;
 
 	nmaps = 0;
-	mutex_lock(&thp->mutex);
+	guard(mutex)(&thp->mutex);
 	for_each_available_child_of_node(np, child) {
 		unsigned int rollback = nmaps;
 		enum th1520_muxtype muxtype;
@@ -531,7 +531,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 
 	*maps = map;
 	*num_maps = nmaps;
-	mutex_unlock(&thp->mutex);
 	return 0;
 
 free_configs:
@@ -539,7 +538,6 @@ static int th1520_pinctrl_dt_node_to_map(struct pinctrl_dev *pctldev,
 put_child:
 	of_node_put(child);
 	th1520_pinctrl_dt_free_map(pctldev, map, nmaps);
-	mutex_unlock(&thp->mutex);
 	return ret;
 }
 

-- 
2.34.1


