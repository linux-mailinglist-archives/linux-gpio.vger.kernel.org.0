Return-Path: <linux-gpio+bounces-6650-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0848F8CFF8A
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 14:03:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B7ADF280C00
	for <lists+linux-gpio@lfdr.de>; Mon, 27 May 2024 12:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3C3515DBCE;
	Mon, 27 May 2024 12:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YZd78l2I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C741581E2
	for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 12:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716811379; cv=none; b=BZhKl7QCdSoyIH0r416algP19Ms4NnLNLdZOlD0DpuHOXrjNhoz+LvncIknUIWy6Ap+/4MXhhLexbBpB+Y8gcvR7Kz6KM5AKRSXBu9l8hMS6uqxcLA/YVAdWiNRjKyDr+Kk5oiBj476WNguoaJ7hpVtWhQTHOkxETS7MKq5oVI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716811379; c=relaxed/simple;
	bh=NmG631ApAO2y8FXHWt2FWrhUAlR9PoMLGzYSbUTYlLw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0+BKonyJibz0mJ7EYfdsCXGrnkTKaC9lK7qJZqZ+3BIyOR+x7LAL9UKfw8or120Mtckqvp4jYr8ygP13mP7zMWsK5Cjh/yQ/eom36azwdmWOz7LwfRwHqeA5t0Z0tb9QikfumNlpuaVX+Q4EK23Ev8Sju1Z1VDpnFsC5H3iN3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YZd78l2I; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-354de97586cso6462870f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 27 May 2024 05:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716811376; x=1717416176; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crqrDM/Ld1FeTI+4fx+PvI/unEa3ngpJ1Vw3fQFFpJ0=;
        b=YZd78l2IjgpmbBMyC5JSo7nUcaJ3NQl+By2wAA/9xKJYaeZUkDPXaSB2XUwx0rNNDK
         DLky69Qs2AOqau+VE5ryYWrsSEBuoLoAyETUKDvEl8OLrI+ggS/A8Z5Xk1E1mL1Yfzt3
         PqOyNbMVtv5PlgPmI+HmRQ9RC3IAcjSuw3vLu/N++GCVJNkXza+OqDvUt0k1fNRNSHbF
         9XeNnIvj2dj08yz3j8S81SSJj/Uf1MBA2rpvqPlv/oeGVZHja/MLeBt4kvbGpdl1Gwa2
         C6NlH+cXxaI2twmRJ4BcQXGpdYWVmGOntNPwEDKKIVZtfowYce6KieGN4AU7q/bB9aWf
         rN9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716811376; x=1717416176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=crqrDM/Ld1FeTI+4fx+PvI/unEa3ngpJ1Vw3fQFFpJ0=;
        b=spftetTzXiltgXW+1qzmDB+sP5sQifoQ+FYAXW+prBEMnD+QyCERWj46fVOFe2CA8J
         aM3kuCyapSjeHDHoOca0FQMZ6TZOmTEy/+nTjDmUrr/tq5++XtCdGdb11oVTlhm7A+oS
         bKiWqCQ7PoYqtd1vN+ojL+WbcxINK/VSM0ollL5NCabpbqjv5sCUafJhjeeqqsKpBrei
         kEwktG+dFraX3cxvBXGsY3WSLvbjLsQPKSjmTPcSMv3k5iNbaNmcpnYJf+/Hl7At5zup
         D69H3xoSrpnE04yr6Lnc6nDJAicY1PkZdmq5bAE+HOKw0l98dcuNNR0Gr24rENDl3Gji
         T38A==
X-Forwarded-Encrypted: i=1; AJvYcCWmMJU6VvkyfiIJjTjO1CiZ6EfdTlA14r3pU0k4c1BJQlKoQDLH+jxALyR5O7Vx4kVPnkrwMDNW/+5evKkfFIK+AZn0brQsOsEklw==
X-Gm-Message-State: AOJu0YzWEu9hDoAujevawsq2CG99pZHxU3ZLBqf4B6xvR9MUWS+Kzz3P
	ESJbE5L9Z8VLujkkdlSUVLoFNScYvkQgVbgwK6HGel0BMnm52TciWtsikNA3O0g=
X-Google-Smtp-Source: AGHT+IFXNUz2xrtCIjit+0t2ADxKmsepvko8MyaP8aPbCuW909A/oThZabUYnX1T5sJn/hApHwiYZg==
X-Received: by 2002:a05:6000:402a:b0:356:5ac3:7d07 with SMTP id ffacd0b85a97d-3565ac37dc6mr5955268f8f.25.1716811376296;
        Mon, 27 May 2024 05:02:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:c322:131e:ff9d:ef41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35579d7ed6fsm8948032f8f.9.2024.05.27.05.02.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 05:02:55 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 27 May 2024 14:02:36 +0200
Subject: [PATCH libgpiod v2 4/4] tools: tests: remove dependency on grep
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240527-fix-bash-tests-v2-4-05d90cea24cd@linaro.org>
References: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
In-Reply-To: <20240527-fix-bash-tests-v2-0-05d90cea24cd@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1106;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=hXoKF47O5mVoTcbhHk5Uz4SJfZejXvCwwUptshf7ock=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmVHZqj+IDO0L6+iKLOzkha4PSJ1TYpwdFQTVUN
 zlrnTikgRSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlR2agAKCRARpy6gFHHX
 coxWD/9cOTGyV2TNf5zRDcCHc0Xu4jVr2K279PLzoWilWVVYEX50/tce/2Lx0J+NeV/FaQ9uGql
 3hjGPLgYbXK8iSFrXf7bCXyhS8t1f8ar4qXgg+mdQUwygBW+tq/5H8fn7/NUMoIBiI6uxjTrAwx
 B7lGpbbAcoMukXJGWSm2UdDO0soGsGn2aEPfsvcFlIqUHJoO9HKCl8MNNITPK6AAXZjGcjRjfBw
 MB9htCWI2CTIq5eBQjE/UZ6xOHe0zOkpgC/IAuEQGEAidNXNPjclQ4yMztUbQHp/yG20MM9gmDh
 3h71QiYv/qs4K+SWyr1KQ81iv1SGAKiUx9KwntZg/0pyUqWeOLvrz6GXRI1rrJD5TyFMZhSkb3B
 Y1m+N4SG2228SUjnLRhrNxc8WSkTc37IcMjYWo7xCZwF9h+ghRjt5HEZaXq0G4krZG0F3wUA800
 Fws83XnUuYootwAqyJEc4y6ZqH3/27Kb067L0L13trGiNXU+SruYfxJaiHXGIzXCU7ZLTgl4aBF
 xM+ZwhWocV6fpodsxQbSsbaG+tyj3ce8nUEtYyoOVQ7ClV/NoIBuR8FYaM2UxDho3CANEBmatv9
 egpzxRGLLCC+ApwUs0LIBwpbLLvYda0eG7ACslB7M/G2HolW18wj7alNMC8ePuhIZOja7eOUKUB
 aF6sMmPVIA66cnw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We only use grep in one place where we can use the -regex option of find
instead. Switch to using find --regex and drop grep entirely from the
tools test-suite.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpio-tools-test.bash | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index ff4dea6..61bfa8f 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -162,7 +162,7 @@ gpiosim_cleanup() {
 		ls $BANKPATH/line* > /dev/null 2>&1
 		if [ "$?" = "0" ]
 		then
-			for LINE in $(find $BANKPATH/ | grep -E "line[0-9]+$")
+			for LINE in $(find $BANKPATH/ -regex ".*line[0-9]+$")
 			do
 				test -e $LINE/hog && rmdir $LINE/hog
 				rmdir $LINE
@@ -3078,7 +3078,6 @@ check_prog() {
 check_prog shunit2
 check_prog modprobe
 check_prog timeout
-check_prog grep
 
 # Check if we're running a kernel at the required version or later
 check_kernel $MIN_KERNEL_VERSION

-- 
2.43.0


