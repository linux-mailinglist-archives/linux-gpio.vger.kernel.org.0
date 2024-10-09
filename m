Return-Path: <linux-gpio+bounces-11079-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C585995CDB
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 03:17:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E11B1C2165A
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 01:17:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7401F1F95A;
	Wed,  9 Oct 2024 01:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="Ed5PNegE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872D31C6BE
	for <linux-gpio@vger.kernel.org>; Wed,  9 Oct 2024 01:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728436663; cv=none; b=XucpYpNmtzeK/9DrQZ8YMcAFtBimWXLcX3Yd2ZX8iQNd5gsx2ZPe/KBSRuBqQFauocuQlhz9/Io0mEUo6U9K3l5yciEWtTN55CzKivRrCF6BkbqhROl65mqKnAzWtST2SZu8u76R9WmYNN0MzG14AA+HCwFqraS7nahQe20tGi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728436663; c=relaxed/simple;
	bh=7ubliB8JusR2RI2wLStwhyZ3dp/eNFEcPKxo60r52SM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RElD9EZkNpmjoy/V+HvCa7MLGVpg3g/EjYpc7/MmJRcpERHD+CzOreL+nFlD6TANMz0IqM2topL582gXIqBMNf/qaPQQZjBX+x8X/H0nGz1g2mX6Ek+x/1/rfuJqc3NgcjZy+cDGaBUdC3XSa7XCRzv2YiT/+DP7y3tMQ0P7cEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=Ed5PNegE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20b78ee6298so40293685ad.2
        for <linux-gpio@vger.kernel.org>; Tue, 08 Oct 2024 18:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728436661; x=1729041461; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5gXIoKwehMAZvKSi1ZW9gJSgNU8emklB6JJg58GCOnA=;
        b=Ed5PNegE6KJB2T+ajipMvvma4d/+2xrvGh93xwVrMjUQXC/G0F6eNMQ2ywq5s1Wlfm
         ql7xfK8myy2K+oG0V1bbS/i8FxiZ8qAB2PjGQC7HSv0MsTdFuX8JjHsG0m9sIuqTMeXJ
         NVYeWMxgsJ5CONIMFcBf2DLAqmCwVrJMD4bJoOR1Lk1afhACNV7EtLeJ/c20F3Io4vJW
         0NBo5gM9DUr46eZUfRAJKYdeDDyQ0vaoUJUgP5HwuE6EilPjhGhZFQKcoTSrrDkd2gjc
         ShlFPRJaQxM80XeRAFmo8g6pn9ybnDn3VWMYmHKHHFqtYSqQb0iOE8sfaOyNNANJEol2
         xchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728436661; x=1729041461;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5gXIoKwehMAZvKSi1ZW9gJSgNU8emklB6JJg58GCOnA=;
        b=UYCdZh2YomeWzH5HCI+p269mom1ifoeDkpZxB9cpPmQYWLN4BINmX2A1xCBTnbrA0k
         cgv6hJOR+v+lRqfSVLAvsjcABXKgF7qlVX8WdDFVVYxR9+taKST85PnbVoemZVRIr760
         TO4YFYTfrxrsJuTxwghqvkEiphI61t+nfeSE7vwBMizOePWKtZw8V4HMeuMZj6KDsLnP
         8ThxcfHUkFBbSQTFabRg7sVogZ0KP4JmZpwJhPcrd+9jZS6a37H2vwvXsOwzxmJUVYXL
         F8KwaP+A1Ou0jCD8Z01oCyIX2zDFfiZfJPzvYqoYsdvcZtoBX7oA2dC/jYszLHq+gQnX
         CK3A==
X-Forwarded-Encrypted: i=1; AJvYcCX+IO03zxtWsQzvfQV9LQlEEj9dUHZ9Aq5iOGWl8He8Zn+BVCSW43wNdPt4Fl2fGuJ7aQwGv6SAqiot@vger.kernel.org
X-Gm-Message-State: AOJu0YwInRvgFiDXTil4Hs45qIMoTgfch9F/DXp0FxSmxNi54yJnhyQ1
	QfoNxj8yArQbvTFNeQfjgxpE3Gfm6A8cZvDyZ+hwqm5s2Yy6DVOikQFD8ht4uZc=
X-Google-Smtp-Source: AGHT+IEnse84BySsrxxDqF+rx4nHQxQNoK1aENuWT8okmvAHlh6k+aHET6PvGLInmguwwhVposdu7Q==
X-Received: by 2002:a17:902:d504:b0:20c:5d78:4d88 with SMTP id d9443c01a7336-20c6379ae73mr11464655ad.60.1728436660857;
        Tue, 08 Oct 2024 18:17:40 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c138cbbc2sm61076365ad.78.2024.10.08.18.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 18:17:40 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v3 0/3] pinctrl: th1520: Improve code quality
Date: Tue, 08 Oct 2024 18:16:45 -0700
Message-Id: <20241008-th1520-pinctrl-fixes-v3-0-5b60db446a49@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH3ZBWcC/4XNQQrCMBAF0KuUrI1MpiYtrnoPcZEmUxvQtCQhK
 KV3N+1KEHH5//DfLCxScBTZuVpYoOyim3wJ9aFiZtT+RtzZkhkCngSA5GkUEoHPzpsU7nxwT4r
 cIthetXXbkGJlOgfaD2V5uZY8upim8Nq/ZLG1f8AsOHBplLTDoMECdIn8ZgTy6WimB9vYjJ+U+
 kFhoXrRImqqtbLNN7Wu6xtU7pvcCQEAAA==
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1

This series contains code quality improvements for the new TH1520
pinctrl driver [1]:

 - Fix smatch warning that the return value is not correctly set when an
   unknown pin error occurs
 - Linus suggested using guarded mutexs so I've converted the thp->mutex
   lock to that usage.
 - Linus also suggested using a scoped iterator for the DT for-each
   child node loop: for_each_available_child_of_node_scoped.

The series is based on the linusw devel branch [2].

[1] https://lore.kernel.org/lkml/CACRpkdavPAv2sPRREQhx_A7EtOj6Ld_n+NcO+vH0QCnfVedXKw@mail.gmail.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel

Changes in v3:
 - Remove declaration of 'child' in th1520_pinctrl_dt_node_to_map() as
   the macro for_each_available_child_of_node_scoped already includes the
   declaration of 'child'.
 - Link to v2: https://lore.kernel.org/r/20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com

Changes in v2:
 - Move the scoped iterator conversion to a separate patch and remove the
   child put operations as they are no longer needed
 - Link to v1: https://lore.kernel.org/lkml/20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com/

---
Drew Fustini (3):
      pinctrl: th1520: Fix return value for unknown pin error
      pinctrl: th1520: Convert thp->mutex to guarded mutex
      pinctrl: th1520: Convert dt child node loop to scoped iterator

 drivers/pinctrl/pinctrl-th1520.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)
---
base-commit: 2694868880705e8f6bb61b24b1b25adc42a4a217
change-id: 20241005-th1520-pinctrl-fixes-d20db68387e6

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


