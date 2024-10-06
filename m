Return-Path: <linux-gpio+bounces-10905-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7790992011
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 19:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0673C1C20FC1
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Oct 2024 17:43:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 548CB18A6A8;
	Sun,  6 Oct 2024 17:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="dI1KmE5g"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C776101F2
	for <linux-gpio@vger.kernel.org>; Sun,  6 Oct 2024 17:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728236606; cv=none; b=iXL/A2KweLVNPUw86hUvYieroA7xnAvj6S8DsBs/2pr3ymAAqdV5nB/iBSMp1tNZ5SF7c/uT/EprEqCxplmKb4GcEwBBT0AFiY2cWQColhiqv3bT6yJhKxEQSrZ5rIB/d7jSIi9pTiZwlipViSgRSG1IaHxTrYoijRKA86eJ1nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728236606; c=relaxed/simple;
	bh=iF5IaUjbFHWZvRREAbEepoAFURE11s/pMqmogjiDuvM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UEL6JWekTo1lXK1Uhjy70i8ikyFyklEoB7s+xg6c/Y3KLde8sWUNcxSOVlUKbeY8WByoEXizg/f0DjP2/uiT9tcX0Pk4xPt46WpjlNMImxejRk1xrcK96CX0AqdKm24zbgWdZTmzHTxOHx7FFt1RfuJt0IFHUoygWzAb0woKQ4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=dI1KmE5g; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-71ddfc61c78so2347681b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 06 Oct 2024 10:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1728236603; x=1728841403; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spALRDUsYOwVLjrj+itG5SK1W6mJ4BemNUJT/dXw+2w=;
        b=dI1KmE5guor3Dabk6JaNuXA0zx+FQaoplEbg2OMK6bMbxvPU+f59KMCUkUmyYHNNJ8
         pzYOxIXr5zj/g7paCV17g+0bWGrRf4AZBqcQVUAhdByD+UQkhp+KsfKk7I1NjUGrUkVY
         tb1IVEdl5nxx+V/hhr1aMAULWXR0s0fk9jbLmWvHsIW9J3khvba0jvtRmJTPVwxkccrQ
         WWOp+PqGx+wft07pjHfUtLC4T3ff4lwwHFekn0bmopoY9fBywR0Nlrlz23BFcxj/icG5
         h7z6FmRcmalp2oCdgmLrjey/bPDZ5VYeMH47hnArLEWxsTvxjd5jfbo3r0ucADBnqK3V
         Qk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728236603; x=1728841403;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=spALRDUsYOwVLjrj+itG5SK1W6mJ4BemNUJT/dXw+2w=;
        b=Z5Uf7gMTibcmSAVYS5/EvXQp6AVdXhh37CKojki0WTtgz1IzgKkOc2jAx3o+fW48PH
         JHfgau/CqaZ/0QHkjW0PAHYlZEl4j3NTZ2WW0uA8qa4ESsOKpVQOkfrGtfVIcrIsRgfR
         9nL9VZTe5ytQrNoloLgM0S6gY8cTz0xgLc2CzPH9x3aLaOjgGxgET1EoDor0gvbJPzKn
         Eb6ErpO6cmODNz8PeNq25o8ogXF5k4eKOKRoAB0x9anyG/GySkrYOJw17xi+kuJpBkFJ
         xbEeiB4Sc8gxI39yV0YcZdJXhvxeMIn66w5VIP7iSN+gDHG4fIWkNGFp1O1Yq7Y7fEcj
         GPCg==
X-Forwarded-Encrypted: i=1; AJvYcCVk+azVd9XDOJVZcnFhWec6JQQZQCSeEY6b1VtGVGDobXs/QpQRrjYxNOmJ/ru9oYkXFmfov0za25Ru@vger.kernel.org
X-Gm-Message-State: AOJu0YwKUJAx2uvEWrcQq+KF1nClp0MLtVyn6VcGXy75XYaxVsgMjvu7
	FM1ptM6edh03eACnqkIh6JdqXhyi53MaRXz6n7ZegkWhL6XCQhqKdi8v5BGktbU=
X-Google-Smtp-Source: AGHT+IGMq3wabIJdCjVaKWXN4FS9fMNNTljNtGBedaNmcPo1nYMUBIfKrJpWTH3HdQf2za7dBdMOLQ==
X-Received: by 2002:a05:6a20:6f91:b0:1d2:f00e:47bb with SMTP id adf61e73a8af0-1d6dfa417a1mr13006921637.21.1728236602914;
        Sun, 06 Oct 2024 10:43:22 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71df0d6526bsm2999591b3a.159.2024.10.06.10.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 10:43:22 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v2 0/3] pinctrl: th1520: Improve code quality
Date: Sun, 06 Oct 2024 10:43:20 -0700
Message-Id: <20241006-th1520-pinctrl-fixes-v2-0-b1822ae3a6d7@tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADjMAmcC/4WNQQrCMBBFr1Jm7cgkmlhceQ/poiYTO6BpSUJRS
 u9u2gu4fP/z/l8gcxLOcG0WSDxLljFW0IcG3NDHJ6P4yqBJnxWRwTIoowknia6kFwb5cEavyT9
 se2ovbKGqU+K9qOa9qzxILmP67i+z2tI/g7NCQuOs8SH05IluheO2kTiWoxvf0K3r+gPvOrexv
 gAAAA==
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
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

Changes since v1:
- Move the scoped iterator conversion to a separate patch and remove the
  child put operations as they are no longer needed
- Link: https://lore.kernel.org/lkml/20241005-th1520-pinctrl-fixes-v1-0-5c65dffa0d00@tenstorrent.com/

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
Drew Fustini (3):
      pinctrl: th1520: Fix return value for unknown pin error
      pinctrl: th1520: Convert thp->mutex to guarded mutex
      pinctrl: th1520: Convert dt child node loop to scoped iterator

 drivers/pinctrl/pinctrl-th1520.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)
---
base-commit: 2694868880705e8f6bb61b24b1b25adc42a4a217
change-id: 20241005-th1520-pinctrl-fixes-d20db68387e6

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


