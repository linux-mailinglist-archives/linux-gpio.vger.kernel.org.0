Return-Path: <linux-gpio+bounces-5571-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D5B8A766D
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 23:29:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1FAC01C209C7
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Apr 2024 21:29:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 634256BFD2;
	Tue, 16 Apr 2024 21:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="hbXEizj0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFBE06EB4B
	for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 21:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713302516; cv=none; b=X905qxGwp+kpcoRoKRf2eBDj4Oy8nSwP37TmeBeSxOYnbOw5ujpnOWNunON4cnV9AqiYncRH0HdDJEc8Qrk85Q+ZQGGO2sZ8z7sA5joRGaO/R8sB23rtJAtpxswqWAAKHCdL4WL8Bo9GEKYygFcWSNSs5WNZ0phAxgbal2Jdd+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713302516; c=relaxed/simple;
	bh=ogo6wVhlo9Cw7QEj66KZ0dUW+xuSZ/FeZsU99GRdCw4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E5xalWf/g2BLGmipKEOHy7OgHwORantZGYE2h4yoMOvufQZrGjthAs2hfSuinEUZXrJQQxyUQYru8WS8wJBDRTW36WUDABhNaKEanKiiqhu8mtgvrbs350dhl8DXWYsypfLOQqk5a7Z5OfQdlJBDAoXshLvzweegZsF+qjvYf7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=hbXEizj0; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6ed267f2936so3899553b3a.3
        for <linux-gpio@vger.kernel.org>; Tue, 16 Apr 2024 14:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1713302514; x=1713907314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9AegF1Pguh+130A0C7jC8SfQQKeiXn5tzZ820ncx6Uo=;
        b=hbXEizj07Xlom88v/9zeUd4PZy2wbqvO2rVo12hfXc2MAxUZIXZoFGhhgjprobsYQL
         TzEO+ytyT0wBOuBTxg5j1JYH6Wa3wCOLK4SnJf1Js+6ctyTKT+bt40Gvil8s3E+lIIvA
         qJvVFk7e3wWpz07gVkoOkBNNSmHxjyQgEW4DpNOljpc6C3hW43RqQ2++bDVQuOU6FjgX
         5Mw47/l4NXItA3uSfIfDyRh0BOPjHID/nLWySET0RagufwwXqLvBgpzt5H12FQ4heqsX
         KSqr6CqIJb/6DSqm9DUI4OZa82lLxnm7wDSGvmQMjBXPIk4CEZVKwCp2dKaqpqVPoFQn
         o6BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713302514; x=1713907314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9AegF1Pguh+130A0C7jC8SfQQKeiXn5tzZ820ncx6Uo=;
        b=bv1FH5JnnLNbLRz/34oJv3XsGvBt2cGlbHEmnA1gcB+a+cBgjVBPDC06jdoEz/ov+C
         b08QgHxguIMRYhovsRfq0kvifcCdsD4137vca05mw8Ctvi7CEq3I+47SR8UpZ9nP9iAu
         QJugRiCGV7RWtW9uXmb0Cv159D4yCPTRX73UIQeqL6qEfFYSw7HVMiciUQ0zXkLDxpvy
         YuqcH328Ez/zCt1bU/W+3xjiIjkrcB+Tt8XXE9RpuEN/Vcd9GbxAlzfWvw8C/Ps6gaHU
         7l8BngrqkKRRlOp1b+fpYze5zNkXK5OC/ssMsRpJl/iSwszpGfxOSJay2Q78qvdCuLo4
         20xQ==
X-Gm-Message-State: AOJu0YzmNbpK3SLpuSg/zhtUPYF/PV4LddQIOjh0wVcOfrmqITiERZcN
	zYpEZmEZIo8JQ1BYXW1oxSa6EQkxPmpG0JtKMZAzjwXTCzG0ZBez9jdquEpdrciV9VrKmh2PmHD
	/7W4=
X-Google-Smtp-Source: AGHT+IFX66m3YVGFXZKWPm0L7cfQGFYFibAudxGSyR27RIUSrV9GPvRnhwjuuoLPBfscha3XaKwBpA==
X-Received: by 2002:a05:6a21:3a81:b0:1aa:4d10:db46 with SMTP id zv1-20020a056a213a8100b001aa4d10db46mr3455036pzb.36.1713302513997;
        Tue, 16 Apr 2024 14:21:53 -0700 (PDT)
Received: from brgl-uxlite.. ([24.75.208.145])
        by smtp.gmail.com with ESMTPSA id c19-20020aa78813000000b006e6b3c4e70bsm9792840pfo.171.2024.04.16.14.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 14:21:53 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Kent Gibson <warthog618@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Grant Likely <grant.likely@linaro.org>
Cc: linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [libgpiod][PATCH 2/2] doc: add a file explaining the contribution process in detail
Date: Tue, 16 Apr 2024 23:21:41 +0200
Message-Id: <20240416212141.6683-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240416212141.6683-1-brgl@bgdev.pl>
References: <20240416212141.6683-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Add a separate document explaining the contribution process for libgpiod
with emphasis on the Developer's Certificate of Origin.

I based the text of this document on the one written by Grant Likely[1]
and adjusted it for libgpiod.

[1] https://github.com/glikely/obs-ptz/blob/main/CONTRIBUTING.md

Suggested-by: Grant Likely <grant.likely@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 CONTRIBUTING.md | 88 +++++++++++++++++++++++++++++++++++++++++++++++++
 README          |  2 ++
 2 files changed, 90 insertions(+)
 create mode 100644 CONTRIBUTING.md

diff --git a/CONTRIBUTING.md b/CONTRIBUTING.md
new file mode 100644
index 0000000..79b3d80
--- /dev/null
+++ b/CONTRIBUTING.md
@@ -0,0 +1,88 @@
+Contributing
+============
+
+Master copy of this project is hosted at kernel.org:
+https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/
+
+Anyone may contribute to this project. Contributions are licensed under GPLv2
+for programs and LGPLv2.1 for libraries and must be made with a Developer
+Certificate of Origin [DCO] "Signed-off-by:" attestation as described below,
+indicating that you wrote the code and have the right to pass it on as an open
+source patch under the GPLv2 license. Patches that are not signed off will not
+be accepted.
+
+Send patches using `git send-email` to the linux-gpio mailing list[2] by
+e-mailing to linux-gpio@vger.kernel.org (add the [libgpiod] prefix to the
+e-mail subject line). Note that the mailing list quietly drops HTML formatted
+e-mail, so be sure to send plain text[3].
+
+Also, please write good git commit messages. A good commit message looks like
+this:
+
+```
+section: explain the commit in one line (use the imperative)
+
+Body of commit message is a few lines of text, explaining things
+in more detail, possibly giving some background about the issue
+being fixed, etc etc.
+
+The body of the commit message can be several paragraphs, and
+please do proper word-wrap and keep columns shorter than about
+74 characters or so. That way "git log" will show things
+nicely even when it's indented.
+
+Make sure you explain your solution and why you're doing what you're
+doing, as opposed to describing what you're doing. Reviewers and your
+future self can read the patch, but might not understand why a
+particular solution was implemented.
+
+Reported-by: whoever-reported-it
+Signed-off-by: Your Name <you@example.com>
+```
+
+Where that header line really should be meaningful, and really should be just
+one line. That header line is what is shown by tools like gitk and shortlog,
+and should summarize the change in one readable line of text, independently of
+the longer explanation. Please use verbs in the imperative in the commit
+message, as in "Fix bug that...", "Add file/feature ...", or "Make plugin ...".
+
+DCO Attestation
+---------------
+
+To help track the origin of contributions, this project uses the same [DCO]
+"sign-off" process as used by the Linux kernel. The sign-off is a simple line
+at the end of the explanation for the patch, which certifies that you wrote it
+or otherwise have the right to pass it on as an open-source patch. The rules
+are pretty simple: if you can certify the below:
+
+### Developer's Certificate of Origin 1.1
+
+By making a contribution to this project, I certify that:
+
+        (a) The contribution was created in whole or in part by me and I
+            have the right to submit it under the open source license
+            indicated in the file; or
+
+        (b) The contribution is based upon previous work that, to the best
+            of my knowledge, is covered under an appropriate open source
+            license and I have the right under that license to submit that
+            work with modifications, whether created in whole or in part
+            by me, under the same open source license (unless I am
+            permitted to submit under a different license), as indicated
+            in the file; or
+
+        (c) The contribution was provided directly to me by some other
+            person who certified (a), (b) or (c) and I have not modified
+            it.
+
+        (d) I understand and agree that this project and the contribution
+            are public and that a record of the contribution (including all
+            personal information I submit with it, including my sign-off) is
+            maintained indefinitely and may be redistributed consistent with
+            this project or the open source license(s) involved.
+
+then you just add a line saying:
+
+        Signed-off-by: Random J Developer <random@developer.example.org>
+
+[DCO]: https://developercertificate.org/
diff --git a/README b/README
index ec60ea1..7a92a49 100644
--- a/README
+++ b/README
@@ -298,6 +298,8 @@ discussions and although PRs can be submitted and discussed, upstreambound
 patches need to go through the mailing list nevertheless while release
 tarballs should be fetched from kernel.org[8].
 
+For more information, refer to CONTRIBUTING.md in this repository.
+
 [1] https://github.com/kward/shunit2
 [2] http://vger.kernel.org/vger-lists.html#linux-gpio
 [3] https://docs.kernel.org/process/email-clients.html
-- 
2.40.1


