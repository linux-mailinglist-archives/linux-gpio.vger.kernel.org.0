Return-Path: <linux-gpio+bounces-17847-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB40A6B97B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:06:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89D933B813B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 11:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB06022173E;
	Fri, 21 Mar 2025 11:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="uN4VIv7+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A7C1F12F8
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 11:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742555139; cv=none; b=bqVwUTu52uWe8raz/WlARnqpWEA51iSYE/WQUV+QY+8jrZtNDNtgeRsZr2FAvKMObYT1MNY3godmyknk8U+CwrbuoITf0MfYGiPhLQIfnsY94nGFz+SOr/R+cEZw0EZqeFewkAMRhKJamEs7TlXbVe/UKD6LLcLdY9ZTj2utSxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742555139; c=relaxed/simple;
	bh=itgiOH58rAsdZg5JQ2TVNLgPQIOf3DZKju5UA9KEskQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A4/tz/VTtzVp3D0bH1AhHahplVqZl+va5wh28s9PHg/Lq8oKEcl8RKUnOp33eR27xvnYSpRpmy5DV+tPit67eSnSTPQ4/NTc8UGu4T1nttnXALgo+hpkHbNfxIcI05TOQb3JiHrUFpHn39hifg4Sj4wRF7l5O8uGW60x2iaVJ80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=uN4VIv7+; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39127512371so1213302f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 04:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1742555135; x=1743159935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WpTC7+qAcLVdX9IUJ9kSgNhT0yNgfMQMa7eoqdlCmJA=;
        b=uN4VIv7+SllOiPE9dkcd4WjHWV4J7KhvupSQPQk0umLqyGKM6u9eFCIqd1FbY7PxJm
         bqMCZKbdcru4MEKVVbA9VOj9pY+BaMnUJt1WbiwPdb5P4194JspgT/uoI35v6zTBcZZ+
         Tjyoyisa5NXROOulORzHtvu7KqMRYO7Mk8/VG9E8TN6COU4KMU/k6P19ITo23uFGBVaj
         LnqVKznhWLFzed+84r5K8zZeJKYi7JKGCcwGGjNhJPXQAmLSizrglfMTr6+wCajoYO11
         ozfI78vhNUGCYJXq8CGaZYc5bwY6fmNx3iRRe64wtHC+lMRQplcUCemU6sLZ5ckPnRiT
         qspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742555135; x=1743159935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WpTC7+qAcLVdX9IUJ9kSgNhT0yNgfMQMa7eoqdlCmJA=;
        b=CkIPADW2jz4gsjxmPpKpgdHNa1HnZz79TyVkMm+onmufIvz7OxNRJzSj9StdUfPe44
         vrrOKGyWPp5LIRAX7LrXa/aGQ8r75IBmxCVkfPkEUFeeCmD2wfRc66C1gH2bMqbJfw0e
         W1M48kkDRNECmmhcKlPDA7L2YdDaDaP/uzfJJaWZqWIOs22rGqICBUrijGrnMOkjRFtE
         N6yFJ20iaWutu81eLC0dooUh9iFVjVSK6PiSnHiI46TTes9+6gaT3jG6IOqsUPAUwKc7
         EAqbyIH7S2sMpHwxrdGQZZ2Us6xnSEZii3tNO1IM5kcmjeuqOsv3rSsVpFHlIEozm8K7
         WjPA==
X-Forwarded-Encrypted: i=1; AJvYcCVlrEkyVHK302DqX1f215N++1xvn7C8Y/60a6gm3ECo+uNG1yX0RYWbna6BVXPoQMjmEmDyZaPVpVli@vger.kernel.org
X-Gm-Message-State: AOJu0YwKnFR8S8Y4J/8ZDWruRpGJDi+/VMaYdf7sT3NoA7C/HcSOKJRe
	ztPgF7s52aHTx9Uql4MbJGgVT/VI9WNgQf8CO6gWzzRoMjcF8p2430HkGLxUFt1+/l11eL/AM9t
	t
X-Gm-Gg: ASbGncvJxEem0lwWPPRUv73Kz6Lmtl3l9Z/OXV5MtBOY3y3TTCyEJakjCRHEcON5W9t
	kqDM+eTUj9mUOFg8mmQAOY3h3bjp6ipQfKi+YHv/nzXM0x48fmvw93Uw1nmYDjgnvkSCo1J9fng
	JV4cF2E1nfHc79sOevSxkX3u4OjoQvkk1mdJtXqmhBu9xyNmqjgXKpk9DmHc0PhDqwYOxmpT054
	DBCM5DgSTH/K1EUloDhhS4nCFq/WFdQpoPyyOW2VQPEfQVSwXzc2KFZ0CcYCU1cO1m4I+CUUpxj
	wHOvPPmaS7lSqzabpakkyrkYaBRy9ZyZ8yydVw==
X-Google-Smtp-Source: AGHT+IG/q9B08DqeVIqFf9iEmz86oRgkdFIy3nG9r3Wjj8QsKdYHaPTtAPuEjmrqdLxhzrmvt8+chA==
X-Received: by 2002:a05:6000:1f8f:b0:391:27f1:fbf8 with SMTP id ffacd0b85a97d-3997f8f5d54mr2299110f8f.4.1742555135115;
        Fri, 21 Mar 2025 04:05:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:1aa4:f3ec:847a:32d1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9ef23esm2037797f8f.81.2025.03.21.04.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:05:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 21 Mar 2025 12:05:24 +0100
Subject: [PATCH libgpiod 1/2] tools: gpioinfo: don't implicity unquote
 unnamed lines
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-gpioinfo-unnamed-quotes-v1-1-a806e9027adf@linaro.org>
References: <20250321-gpioinfo-unnamed-quotes-v1-0-a806e9027adf@linaro.org>
In-Reply-To: <20250321-gpioinfo-unnamed-quotes-v1-0-a806e9027adf@linaro.org>
To: Kent Gibson <warthog618@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1989;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=V/yWxp2DePD3xEkLNJKkrNP3ycWmuiYPfi+dMcFwWBk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn3Uf9e6iiCCdlRwZmLjASAuZWWcqgcv6nZkie8
 nMJnqIn7wCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ91H/QAKCRARpy6gFHHX
 cmSPD/4+/pg18vBBkkGOOOMxPIBGIoa74/JTHJwGoH9+G/XtH1tCB30asAgq9WXSZ1p7liVxQ5z
 gHOJO4raCWkZEx5t0geYyt6rPVH9Uoya73ffw251SdTZQSD1x1JMkSBmDHUVXaJhWylL2vb3xss
 HoXwHNTJEej6BpN71vk0kgxq8hdRJhlm1BPBA+q70YpYPNLoFIClTln0Wi5OzPaQK3SfTWXVATE
 pzi4lSOsKmHmMolSWbB0uj7VJ+g9WdCXCfdR20vY6tJh+CSgiSYnlZQ+oPA4Bg6nRNzMI2rCmwO
 ztR/aMhUe6R+tvE2t2lzYH1Ii9vWkj2cWTck1VjeIzCtWAnWNbWRkQkbIzltkZcGkAn39ioj9hv
 Hbu3ea8/Qcbk5BRPV7+t86Op8tYg2y5ssxa1hSdxeeM4WSyX2VOS3bxyJGEfKMKPBcfxo9uyK5g
 2GUQFmceH7X4e2qAt7wHSpBc1Dfkr29tO1VVus8L3QxSkJlUD71KwC5oTvQzW0URJsJtkeIiWtG
 HGjVD59al2P6cVbD8PDFm904HLH2v8fXRwvpVQqs3JVbicHeA9tJv5d3Cwa6z4cqKeXRq7I203P
 EuHHopHBQt8pHZdtzjHal17le+QDRHurj22xhaxDxcySXQD9OkGYqRAjZeX6rwUCnsLBYqWY5L5
 i3C415R2GTk3Axg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Consider the following output of `gpioinfo`:

gpiochip1 - 2 lines:
        line   0:       "foo"                   output
        line   1:       unnamed                 output

Now let's run:

    gpioset --chip=gpiochip1 0=active 1=active

The output of `gpioinfo --unquoted` is correct:

gpiochip1 - 2 lines:
        line   0:       foo                     output consumer=gpioset
        line   1:       unnamed                 output consumer=gpioset

However, without the `unquoted` switch, it's inconsistent:

gpiochip1 - 2 lines:
        line   0:       "foo"                   output consumer="gpioset"
        line   1:       unnamed                 output consumer=gpioset

This is because gpioinfo drops the quotes for all subsequent attribute
strings when it encounters an unnamed line. We should instead keep a
separate instance of the `unquoted` flag just for the line name and pass
the original value of `unquoted_strings` down to
print_line_attributes().

Fixes: 8ffb6489286f ("tools: line name focussed rework")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 tools/gpioinfo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/gpioinfo.c b/tools/gpioinfo.c
index d5e4751..4619ca7 100644
--- a/tools/gpioinfo.c
+++ b/tools/gpioinfo.c
@@ -137,6 +137,7 @@ static bool resolve_line(struct line_resolver *resolver,
 
 static void print_line_info(struct gpiod_line_info *info, bool unquoted_strings)
 {
+	bool unquoted_name = unquoted_strings;
 	char quoted_name[17];
 	const char *name;
 	int len;
@@ -144,10 +145,10 @@ static void print_line_info(struct gpiod_line_info *info, bool unquoted_strings)
 	name = gpiod_line_info_get_name(info);
 	if (!name) {
 		name = "unnamed";
-		unquoted_strings = true;
+		unquoted_name = true;
 	}
 
-	if (unquoted_strings) {
+	if (unquoted_name) {
 		printf("%-16s\t", name);
 	} else {
 		len = strlen(name);

-- 
2.45.2


