Return-Path: <linux-gpio+bounces-7012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C98B8D6362
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 15:47:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D6B31C26EC2
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 13:47:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E04B515A4BD;
	Fri, 31 May 2024 13:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alnIWfwu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62943158DD7
	for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 13:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717163207; cv=none; b=mclZuAvfIGq3of24MstNRBLAdmd3Hi4H0GOwnO5OJKvlxk1YTUFDIlPGBuiQ4XEZoBVsftdTGSKpmzu+TqbYvrQhpCOaMO47dAC/yO/FBEAaSdEE7TvYLCnzNXSJSA55hA8dQ4DqTQfJGX2VAPlO5ocfp8w5mY/YAZMbLKySwRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717163207; c=relaxed/simple;
	bh=3NSFlM50L4A3RxVIELWOIuBlocMdJAFv/6xGAHutO+Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SoAkoKmGlGDVJbD1rYgz6X2XBksTGXHIbB5bPMGIdooei3TgVsnOpdzAnBi/orDj1V7uU/1irziFpbNSUm0qeQxcr4iBf1ouTi8X+gZxAMyrH0+89eigSrDJ9flrULQzqnyah9CJgXsHwlD8wlRbFFVab1JCApERwN4TVDwSHpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alnIWfwu; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7022e0cd0aeso1948446b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 31 May 2024 06:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717163205; x=1717768005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DErrST+C3yVnqrJU+UI475MP73jBv5E3rTTr51hfLbs=;
        b=alnIWfwu3dKI6pYrSM+4xhKx2rGgn4N0th1qKYZGRsGS4j9nDkv2Sd9rolKn4b8x97
         PTE2XjGjh2aTWPKyhX0e6qxZyk7erUfxwK8iPpkPk7bN2imnwgQCpkjCtwyVYOr/UyMN
         60CB1hzUkqb88kd0olI65fsb3d83eeRcR702rsupc6kCEc2cJrfmJRdMpNLNnFgiqSe5
         znA/8n19ClsHOn5ueos0YlNK4eyYoc+D++7+32RjCrr5VTnX/aNZSmoDNxlmylpPoZe+
         Sy66D73BbwbwVMD9nD+fT8nq+70wbU6WhKWru0nc0OOwx+A+bZ/A9yQWHcQmz1Nmkahg
         Et0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717163205; x=1717768005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DErrST+C3yVnqrJU+UI475MP73jBv5E3rTTr51hfLbs=;
        b=fhcFrl5BkSg5ThdSigg3+nXHotPWfpSH7/NF9LjkV1ADWde/3dinBWEmWb7cLhisbs
         MH5QDSdz2cemS9Ndln3ciJe+gJrKgkiDE+qlMlvv53NMrkppdSrkcicA2/OMW6bwi8lv
         yhR1j6VfkeyVO4UoJl/yOVNiiH8DzWSrMd+h+LXfD1oR7QE0E81prykGH4IUmgQy1/0r
         GQOfC8vQ/YfH7SzhGIEyCfyQ/rySnsKDdnJelrqYv37nOhoLrEbpHugmjCxO06IIeFyT
         uB//VxxAjiv18XEhoxD8hLZzEx8I+Rm0sWhTfch/0fZo0oBenI73hIoObUDR21O8udJD
         BQ/A==
X-Gm-Message-State: AOJu0YypG2iOntXx4Eq/iveYuYDwEnZeQ4yUQYh5Er14+9H5YVb6soaW
	t6WiKXu1FGnmT5VdVE0C7osRlE6I4Vmmwirf3+qZDz8SCxbsMBg5Ipxvlg==
X-Google-Smtp-Source: AGHT+IHi164pJEPKH+xuDVW9dPTDFemJoDkktCr0xYujxatiUYkXMRtL6lvbCWglGuA4qT6BHp8Fcw==
X-Received: by 2002:a05:6a20:3ca3:b0:1b0:3698:3d4 with SMTP id adf61e73a8af0-1b26f205940mr2242063637.28.1717163205324;
        Fri, 31 May 2024 06:46:45 -0700 (PDT)
Received: from rigel.home.arpa (110-175-132-92.tpgi.com.au. [110.175.132.92])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423c7bf0sm1389825b3a.42.2024.05.31.06.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 06:46:45 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: linux-gpio@vger.kernel.org,
	brgl@bgdev.pl
Cc: Kent Gibson <warthog618@gmail.com>
Subject: [libgpiod][PATCH 7/8] tools: tests: shellcheck don't follow sourced file
Date: Fri, 31 May 2024 21:45:11 +0800
Message-Id: <20240531134512.443850-8-warthog618@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240531134512.443850-1-warthog618@gmail.com>
References: <20240531134512.443850-1-warthog618@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix shellcheck SC1091 - not following.

Use a directive to prevent shellcheck complaining about sourcing
shunit2, which we don't care to check.

Signed-off-by: Kent Gibson <warthog618@gmail.com>

[1] https://www.shellcheck.net/wiki/SC1091
---
 tools/gpio-tools-test.bash | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/gpio-tools-test.bash b/tools/gpio-tools-test.bash
index 83b05ec..4551dc2 100755
--- a/tools/gpio-tools-test.bash
+++ b/tools/gpio-tools-test.bash
@@ -3087,4 +3087,5 @@ modprobe gpio-sim || die "unable to load the gpio-sim module"
 mountpoint /sys/kernel/config/ > /dev/null 2> /dev/null || \
 	die "configfs not mounted at /sys/kernel/config/"
 
+# shellcheck source=/dev/null
 . shunit2
-- 
2.39.2


