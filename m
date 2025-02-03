Return-Path: <linux-gpio+bounces-15276-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD52A25AD2
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 14:25:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E79783A286C
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Feb 2025 13:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B35204F98;
	Mon,  3 Feb 2025 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="2ExKjSMU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75530204F67
	for <linux-gpio@vger.kernel.org>; Mon,  3 Feb 2025 13:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589137; cv=none; b=jrx/RzFiYaP7Pd82FuCoFuFt3SKXxBTh8PUMeDkxyfxh2U7vs+GyEx+iUG2RGs2peyh1XD/busZAtJhYv5KD08eJqzPVtftTsS0V/5Dccii6XpaoB+47Q9w/0Xir0eUkvCtgclPRr+tY+iUuad9xx14NakfHVz/Pp00iXp11Dj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589137; c=relaxed/simple;
	bh=hBI06y/n8scL5EmI10Tqvek9wfPCpagM73cwcR4CLDg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xq+zrpf96xyMpz8UZgZO4wx3EKWd4kE9V+SgPHRlQySvmaPWHnDe3mSR+/DkgxzBPWo2MWoR2shxvmCKrlm+9iE9dhQM7Geg8DSkj098LGgnVfNO5r31pxXTmxMud2LmPJt3dR7NT7p0xIMvNJy7A2MjD9fK6eEMS6Cw3SBPtoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=2ExKjSMU; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-385df53e559so3200361f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Feb 2025 05:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738589134; x=1739193934; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R2X/PwAXIzH+w3tTBNsiL63c0ElnmWupGJaZFwhRLYw=;
        b=2ExKjSMUG4x3fNBAlj2jQI5JPYoo6+jRooibbT/+1FgZ10o+/es/Y81exCxuiDVK1U
         dS8UJUzyMIa3AvdUtIyatxO1p4i9Tg7HKv2U3RBDpHdMXUfFoSDG8sGlhLFXVhXc7H1s
         MZ5iKn1j0y4TDGbNxsa+xKLUdoLK/WZiHiNWBZ2AFhooTyQ0HuHJmeC076aBrrhhWTs5
         OF7tY46fqwJGoq08FJ7aTBOcGhYHeoSWbu9Hmu5anAtBPSvYLP1wCGF8kOlD46MahMex
         cPPhloZxTJknasrOjN0ix32ynziyMLWXz0HGjZfUOW41nCcOwuIzM4K9JM6l4bJm+C8V
         Hk4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589134; x=1739193934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2X/PwAXIzH+w3tTBNsiL63c0ElnmWupGJaZFwhRLYw=;
        b=MtcpFfbNFWgfyuAr0xwVcGqXqS1rq/bSfpfGBuzpyxZpkrb8Q6R52K32uE++WQjTt5
         MZjjxxZd3oNGyPHfk7phYxQjuqkiNFGa4xxDd3oZC+UJQ41wBsd9/o+ODLneM9YEWNZ7
         aORwdcLs9+Q2un04aK514n4spgqsmuq3aWih8KBoiIOALcS4X4NGwy1gUJG4hs4jmofU
         ox5jjwSYrWPxtumsLZVKZbk3X2o35SkDzv1SItjFNFre5aLGWYk+Rts4GcYoYv/Dka2t
         KPgFa6d2RvgYUJD1TzyklDgH5dV5s/J4qH+sstO+TCMtYWmRekzJGdGgsECCSvX7lJKK
         XsRw==
X-Forwarded-Encrypted: i=1; AJvYcCVWmgtLDrDtXEdLFfmrlOPk35r74zF2cNbtX618CWq/2IqK+KFyKR3QtHAxSM6C9AQxmPUP1R35RMOF@vger.kernel.org
X-Gm-Message-State: AOJu0YyXsqGW7eIuxUgvML/exFsMPMSUvCYVOumdQa0XOFiJiD9/dYnz
	em5ZA/OjXxUZCyYl/+xv4L1WzI/T8xztm1ntNMVpgLldqxsXYcU7Far0qALiQBY=
X-Gm-Gg: ASbGnctX3vSU1Zri6/f4DGIS4TjJBB54ADW0JY9qEc0cmZpkaCFCbfYC/IIrNh6tQg5
	HIsOnQ2uWH6RTMZg60wGzwuw+vsdsys8Ea44EBeWBSK6zBxjlzIJG+Qemyc+aIZYBfhUhxVYd7f
	ODKgyZj72z9aR/JeGUDN32oxHMA6Z2Sk6otMBvtrGIdhHdbDYlF9/mDs4oc2kodeJrumKJruFAl
	P9FBttjsXYb0lRzP3GzSTTkBSkF579TMk6bnYtG5MlSMfKy7fQvhpjYTxO/yYPXRal+bt2aLlhr
	YEeYE1A=
X-Google-Smtp-Source: AGHT+IFSr/DNlTxH7TbyGRVW8+i5Sww9ceXIjNfZ+B6Tdk87GQxJG7apffaF+pJIqYcCvmCntCpuKw==
X-Received: by 2002:a05:6000:144d:b0:38a:88ac:ed0d with SMTP id ffacd0b85a97d-38c51941b32mr16177451f8f.12.1738589133482;
        Mon, 03 Feb 2025 05:25:33 -0800 (PST)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:62d7:938e:c76:df44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c1b547csm12913959f8f.62.2025.02.03.05.25.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:25:33 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 03 Feb 2025 14:25:03 +0100
Subject: [PATCH libgpiod 1/3] bindings: cxx: tests: disable GPIO simulator
 before releasing it
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-fix-gpiosim-in-bindings-v1-1-d2c9e0f3a29d@linaro.org>
References: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
In-Reply-To: <20250203-fix-gpiosim-in-bindings-v1-0-d2c9e0f3a29d@linaro.org>
To: Vincent Fazio <vfazio@xes-inc.com>, Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Erik Schilling <erik.schilling@linaro.org>, 
 Phil Howard <phil@gadgetoid.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
 Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=842;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=PmkvCKfqIDVcYWaOgw3vMQTdwET7duLNXaHSymMdufs=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBnoMPLs360569Bxx3n0MJVoW+YuQg+2TMaKKAZo
 lB1NFbCO3GJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ6DDywAKCRARpy6gFHHX
 cr+pEACgAMN6zIprVAtXvcoALTffqDqkQE3T/cBRuB2cZr4EujUuKNG4Do20CRbd40pECChsQ9U
 FkY8XC1v4eQoU3KZGMxRyewX1BfIgNR3WyZNSM8bKV3YqVhe2QOc1NL3iXzRoLOAZZ+FDgxh6Xx
 dobgHgPVp7MlCJnelqizZanABsrk4zsXDNBNkPXon7Q/Tk8Ot0Qfpg1ecpqrxpkdLX6DUfY0NK+
 m2DWNyZZTI0g93mCOohQoxRPf0Hr+uGfPNq5oYu9IyeNWXNBaFYTbLH5LH2Qud/5j2jErnmHtGa
 hu4YqfhpbXN/VwD5FdaSSUp5+/KAGXwQ1CkjU4I0MpHcvLABVbT5D+J5m4CFjuUNN7Ib3tlQgHr
 WMBwGNQPtBHrIeS4N2HXTehVusq9x51cxiv6Kji72jqFvVkLeOKxdGTnm9+vEoK9q9ZLhRIBinf
 4t9Vg+RQ9JC7nE7qp3wAwpemYzzNg+CC60Ys1jr9COco27F8yWV0+rVLHlMd9ooZPirI6ofhfdV
 NuGV3YVUTbUCryrPFg/1M+tRRIJcsP85hxMX/k6J9pIRJ//9w1Hw5khL1zV9og9dpuKX+BJVN3l
 OEkueOFp7RBj3+H03mREtwA/V0DfveZnS+oYeJnAgXW14gr2g4uXVL0uUu0L7Z28CTQLMMkiFVJ
 zEyWdLTavWoY9Tw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Linux kernel commit 8bd76b3d3f3a ("gpio: sim: lock up configfs that an
instantiated device depends on") uncovered an issue in C++ bindings
tests where the GPIO simulator device is not disabled before removing its
configfs entries. Add a call to gpiosim_dev_disable() to the
gpiosim::chip's destructor.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 bindings/cxx/tests/gpiosim.cpp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/cxx/tests/gpiosim.cpp b/bindings/cxx/tests/gpiosim.cpp
index 4bda5a2..cdecd8d 100644
--- a/bindings/cxx/tests/gpiosim.cpp
+++ b/bindings/cxx/tests/gpiosim.cpp
@@ -115,7 +115,7 @@ chip::chip(chip&& other)
 
 chip::~chip()
 {
-
+	::gpiosim_dev_disable(this->_m_priv->dev.get());
 }
 
 chip& chip::operator=(chip&& other)

-- 
2.45.2


