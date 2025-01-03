Return-Path: <linux-gpio+bounces-14470-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FC8A00AF4
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 16:00:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDED4163BF8
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947471FAC42;
	Fri,  3 Jan 2025 15:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mnFBJu6/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE8DC1FA8FF
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 15:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735916433; cv=none; b=Ilu3pnnf5dnKJWytxXAydnBmPdApDan3mklF/uvYSFDNX7OlChueSnatm3OkVy+mqGYTZc3JkmIYFnnBzFpYPmt8yu8C368P/yh7aOMpGQclLb3dlL/ylim2Xr0qlZizgdOTeAz+WN0iBL/ZY+OGXHdcrnSpDLyjVzKRZokVRYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735916433; c=relaxed/simple;
	bh=g/WJuBL8UjLqo0EUOJQ3gr62AB70Cy7sObWBDQ8yDTg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j9eQ1r0svOtjB9f/CWp4ARTAd5B+vGvAfNTF3j/sgtATFmPuvHzpF9t2QDubxyK24K8bT6m/xsQLKPWs7gN0Cc74CgbP2YQMVwrARs7cJN2ZdpwINgcJlLOP73x0nQkd7HqpMspcYEtEX6ymXbZ96mwOLrHR4QpeCIsEqsgelCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mnFBJu6/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so23448825a12.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 07:00:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735916429; x=1736521229; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjGu/26j65+bOKpNxK05ee3qx04QgcB6ZhLfS51NiIw=;
        b=mnFBJu6/ClQwGoD/phd4ZBA0l7oYGtHE3wvRe83znP2nv9teFneyD0t3vuffJZoOMU
         aI4oMhJbpPvrv3DyW2zzmObEt+pHuiow5/CM52IkPrW6PPbzYD1PvJL98J8TrZ4OaaLc
         aZAG7KVC0/fxg89mk5DTeSGnIlkp5gcbLWcseGbFgfl3lwW2hPivf+qI+1SnjAW5/WhW
         nxBZQBItOJkXnWyP2qVIRS1DbVHlUCyqivODZfT4GjB5ZZUU8i811hNBKeHvo33xG/dN
         2CCK0/mEg9geHapDS+JdSPnx9vHF2YkiqMCp2nikcVoPMEirJ7aeQ21InnRhWA4j0NT2
         a3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735916429; x=1736521229;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjGu/26j65+bOKpNxK05ee3qx04QgcB6ZhLfS51NiIw=;
        b=HycR6NiUsxaDqyZ1oGMOZ1/WIMgJTogUpk8o50hu3tQcVUWKAiooj+HUqfqJgE36ah
         yK3RTt67565pgTwOfNuPX4DNJIz3yyggsikqqyKLucyP1nxg5x1XkMtqVs9YaUlnfWHY
         wZGo62sRIhfOzWCgucppl83ZiMNhtHPjrHVJv8mJWb8Ly8n+PCUACpgdtfMgOkvWwS21
         KnNBMFJQpbBI7yqVwGEEkLUz6SwTKVx4R3VZzoNz5IsOi7xiGerKU86EZRCVD+Slzz4q
         wohOO6xeKLvevVk2r7z6/g9XqEDqVLztck5D6NxRlpM50VQkw7GlbslZ4DvyF4nVBHLe
         bQsQ==
X-Gm-Message-State: AOJu0YyAqUn6utrEFyNgCLDv4MmP+bKXzS33yOzAe5gk36n9/0GgLh/Z
	Y4zJmubUe2dJ3pzUjUddUfeXEePyLOCIx3AOSjfwmM281Fowio1GRa3/ywBJQWg=
X-Gm-Gg: ASbGncszk2525ProUZwNkwrlCGchrbNHgAp1KGZjUrxm8Ey1Rh0ZiCOwQpkLNsRTFbP
	3itAKK7gmlwd9XmHeUNhOaPV98LSE4xDbuNjNT3IVeKmcTGw38vr/M1ANuaQ37m4ugnh3jGSwTP
	jPDl0jfXTXSgOfQaKc3UdLPQCs7ehv8fTbMgzinAeiGHGSA4IS1N68ARrnZH75Vov+VbtyXk5ZC
	xx8MF4sakEcoICbTsR8bFO9de41QVPx/IqT1xw0lFfacscNgwo=
X-Google-Smtp-Source: AGHT+IHLVNoVhJemiYFq+h9hgMbENG4CWMrkLkgRdfPxHsXawExOos+ZE1brwUvrOvi/m1FP3rL2Ig==
X-Received: by 2002:a17:907:2d92:b0:aa6:bedc:2e4c with SMTP id a640c23a62f3a-aac08101008mr5045424766b.3.1735916428747;
        Fri, 03 Jan 2025 07:00:28 -0800 (PST)
Received: from [192.168.1.127] ([2001:9e8:d5a1:be00::35e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm693078166b.137.2025.01.03.07.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:00:28 -0800 (PST)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Fri, 03 Jan 2025 16:00:16 +0100
Subject: [PATCH libgpiod v2 2/3] bindings: rust: libgpiod: turn standalone
 doc comment into normal comment
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-lifetime-fix-v2-2-63902dc8cae1@linaro.org>
References: <20250103-lifetime-fix-v2-0-63902dc8cae1@linaro.org>
In-Reply-To: <20250103-lifetime-fix-v2-0-63902dc8cae1@linaro.org>
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Kent Gibson <warthog618@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735916426; l=1949;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=g/WJuBL8UjLqo0EUOJQ3gr62AB70Cy7sObWBDQ8yDTg=;
 b=8/WGEd67ISqHggMWSHzUYYlQbjGZicf5Y4EcPVUVLPWW/um7DIfcCskxrhdRO05G2Jkk9xmMk
 ueZJmx+4wp6CBA71N7z2/oR1BcIGmGzy9IGN7xDY9f8PnmG9ZjK4AS8
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=

This was complained about by clippy:

    warning: empty line after doc comment
       --> libgpiod/src/lib.rs:461:1
        |
    461 | / /// Various libgpiod-related functions.
    462 | |
        | |_
    ...
    467 |   pub fn is_gpiochip_device<P: AsRef<Path>>(path: &P) -> bool {
        |   ----------------------------------------------------------- the comment documents this function
        |
        = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_line_after_doc_comments
        = help: if the empty line is unintentional remove it
    help: if the documentation should include the empty line include it in the comment
        |
    462 | ///
        |

The comment more seems to be of structural matter and should not be tied
to the function immediately below it. So lets turn it into a normal
non-doc comment.

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
---
 bindings/rust/libgpiod/src/lib.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/lib.rs b/bindings/rust/libgpiod/src/lib.rs
index fd95ed2ac3fe0bac2042ca58f66263408013457c..c03831bce62b287c08804e2d9d96aea7320dec7c 100644
--- a/bindings/rust/libgpiod/src/lib.rs
+++ b/bindings/rust/libgpiod/src/lib.rs
@@ -454,15 +454,15 @@ pub mod line {
                 GPIOD_EDGE_EVENT_FALLING_EDGE => EdgeKind::Falling,
                 _ => return Err(Error::InvalidEnumValue("EdgeEvent", kind as i32)),
             })
         }
     }
 }
 
-/// Various libgpiod-related functions.
+// Various libgpiod-related functions.
 
 /// Check if the file pointed to by path is a GPIO chip character device.
 ///
 /// Returns true if the file exists and is a GPIO chip character device or a
 /// symbolic link to it.
 pub fn is_gpiochip_device<P: AsRef<Path>>(path: &P) -> bool {
     // Null-terminate the string

-- 
2.47.1


