Return-Path: <linux-gpio+bounces-14397-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 780D19FF6A2
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 08:41:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1E0F816187C
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 07:41:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 035F419258A;
	Thu,  2 Jan 2025 07:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qGCJAk3a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2A18E379
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 07:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735803687; cv=none; b=LDXXD509Z2MrBt9znmfzuYik2xQABkFxAdWlTl4EE1GLxPJpe9RmNzlziMhNJW3qfHK/RBeT/FR14GMLDXwUaKwk6SD6OofQDA/I8lIJOD4rmlZGB3JqXAyj7ZFZvZ8LjYz1J4XDN5DEKNPkIqh5vTV00Xh5XpXqD3gXH5yCtvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735803687; c=relaxed/simple;
	bh=lQLsSYWNZvGs2rYwIl+38ssaLDFx9lchskmlaF3m+3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lWJfnEmelps1smg2GtBxdeWsGJjh8pzXWEDv1TDauBWFQfc9gzptIEfozxuFYczZyNU9sc81bDh/jBAdQ6ZeHRUGbYe6yYLpy9dKBnfk7c3mYtvFJRf8OzqISs0G0gXmQRQdqKasx5Zggzf04gzKKtwypwhOOyaaThlIKf8RudM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qGCJAk3a; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5d0ac27b412so14798887a12.1
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jan 2025 23:41:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735803684; x=1736408484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wQwVOalxLLmfy0RfruAJjAra20Go47JNeVSP73WVJFE=;
        b=qGCJAk3aWEtuMjDoQhD/kwOkkF1PGvde4ONMVzRShlXDIJ5Ftbckn3BdGUmKjVmWY5
         B7EU/JeC9mOiuNq1pm5lmkkXj9RkVEqCUrBeOmq8IaGM+c8Rq+1Wc2FraYC0ssEqWeBX
         b29IPbz+fGRRhIxPJuCDVqIGJjbSLwylemJn8L6K6tjmrJD26YZf+ADUOyeH14cdqcrT
         jRL1A4qUQUBpAbyIF92V2avuR+BOnh8/yCafhUUm3P2iA/p3UzItoPVdqWZelvd2o9Z/
         XRNsZTgNu2PhfmRiTdjqO4wQQtyX9s6pbbGICNtDUprWWjAlyrd0XJxb5In87oSEXQM2
         dcRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735803684; x=1736408484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wQwVOalxLLmfy0RfruAJjAra20Go47JNeVSP73WVJFE=;
        b=M7lBeXWI+9V2++zbOcH1CQc3JHsyOaRCroEY6YZHFnDN1n98EodmiJ8GofOq7UpoTc
         xefJt+ksUSupopR1l1aSgZhvaTH8mP+P/7jY1LXGdVfd82HAZMz5Kev9ffiRjinzR8me
         bwTo9+/fzr4MnupEW1Fph9Mv7TQbgJMzIJVsUyneOy111hUqXCh0uwhiFNtvdL5B8B5f
         VHin3wOhtLwaEi+GSZRKSykLwSh0Q6I5/BMaTm+pP6qJM27RDXZKJH0cazf4OMuTMdID
         tSKb0RjBusQIfcIE+/nfIYTeCrkLq0nY0arlBiYR+KvRYeOMGGMADhYjuPN/NWe1LKpE
         L/HQ==
X-Gm-Message-State: AOJu0YxC2QW9ZrkwmsjyHFEkP2rA99SHxtip5C4NK0tPlfGfsq2IBhg8
	cuJrkilVrUnEMM0Drltxmw1FTCS+yARdNyceJw6sYifAuHnc7aef4pkK7+oNyeQMpZBRGQ1DQk5
	b
X-Gm-Gg: ASbGncs367KruLcdKXhOjOAAT6wIl7862nPunjCN7Qfi7LZRWylsf1Az/VV28SBf5gU
	K+g/txCWLQcfA/DWOQD+4db+A7hMGCHdlyO9JN40G3/1DgnlfghVWggqm9TyM3dsaZwaIX7GyF9
	EUC4YDrn0JF8awYd+JuiUAOjQCjbUQCego1EUcsW97s2O9PmAf4KAv4g3Dd04RTQNfW0aJUaVGS
	nXXTd7sJlX0cLrC3XflAQCb7qyNIM/J/zzzb5wgNXltmk2xwDA=
X-Google-Smtp-Source: AGHT+IFm5MPKy36/9/N00+WLuypuo/RRJWuh/7AXyi/XZJ10oAj6qWp4swZJttHgyocUGNGhj5Yqkw==
X-Received: by 2002:a05:6402:3510:b0:5d3:d4cf:fea0 with SMTP id 4fb4d7f45d1cf-5d81ddffae0mr33841354a12.21.1735803684366;
        Wed, 01 Jan 2025 23:41:24 -0800 (PST)
Received: from [192.168.1.127] ([2001:9e8:d593:2300::f39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701b2absm17785949a12.81.2025.01.01.23.41.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 23:41:23 -0800 (PST)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Thu, 02 Jan 2025 08:40:52 +0100
Subject: [PATCH libgpiod 2/3] bindings: rust: libgpiod: turn standalone doc
 comment into normal comment
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-lifetime-fix-v1-2-313a6bc806c4@linaro.org>
References: <20250102-lifetime-fix-v1-0-313a6bc806c4@linaro.org>
In-Reply-To: <20250102-lifetime-fix-v1-0-313a6bc806c4@linaro.org>
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Kent Gibson <warthog618@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735803680; l=1888;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=lQLsSYWNZvGs2rYwIl+38ssaLDFx9lchskmlaF3m+3w=;
 b=XiXJoSiM8tktAzrauoEnMafAaS+MDymhXMs2B7IMfgJR9BAntSgpUXRnFkZI1vpVIFXaKS51p
 cIPEQJQ2gu8Djc1jCYtvfjaLqDBpgj89b1v+86sNK2gBfJhfxe/cwCE
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


