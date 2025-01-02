Return-Path: <linux-gpio+bounces-14398-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA5D9FF6A3
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 08:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8BCBB188235D
	for <lists+linux-gpio@lfdr.de>; Thu,  2 Jan 2025 07:41:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F34B81925BA;
	Thu,  2 Jan 2025 07:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G9ObIS4E"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCCF1925AF
	for <linux-gpio@vger.kernel.org>; Thu,  2 Jan 2025 07:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735803689; cv=none; b=hqgLd4GZab+hPyBYtHhBvyJ4uG1k0eOjEVNWcoxbSAiRwTZrJRGAzGjnYa2heoMRiASBQ68MRmp322NxiIGu5U7cbzxsZv11+N8ShqbiZ7zXHlA9k6UjkeHIObXJoGJ3l774ocUKNdH8iM6tV8qZ9VNp9Sc1r9sp7DhJK9Wg1xc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735803689; c=relaxed/simple;
	bh=CHQHsx+uz3hESRXD7+egl2OXhjv5MBQ3u3ICrcGsVHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VcPnStxCwB/dJlbJ3uy6KK7/FvqGG9MmwBEVB0bwmO4FHZqBavg4JCzMGui/Jln1lumLI7oKMQYGAofZeJz5HDoEpnIc6vcUDqzFhZHkDsILhlGIHq/uM8tbyW4EXLuRlgk4ksn1oH9aGAlmtDzX30usygdIsZeJnwxOtub87Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G9ObIS4E; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf900cc7fbso112459166b.3
        for <linux-gpio@vger.kernel.org>; Wed, 01 Jan 2025 23:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735803686; x=1736408486; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ll/68bWAfkYg5zPM5PvyPirtG4JTyZk33sG1Rba4DuE=;
        b=G9ObIS4E1QR2l26TM3MGYD9Biqa/ODX/ceNJcUthcWYqgl/zgqZSGVXw9+UFV8sImX
         ROoTGtgSODKGI+hdSe/wnLSGIFPxuRbt94MsFfVPnMB7+GihA6bVs20ym9JH9aPZ23tN
         vwZEeLNcqkjXZRPO6W2q6J6+KlycNsMkLmmtK/Sh8raBKjQZgt7OCn/Rh8fdDNpiY0ho
         aaICTSJnJ2juyLjhF1g0vmIZC/kQXjUdy91sSLsSVqdqoeoN9N4tiPqYItckUxHcHfRB
         CqiX60Ey3Ecaw9Vrx4fPRDU+ZFrQtfBExSaJvLpNjSUtmhipbEwsRuYikaAusmKmo/6P
         xcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735803686; x=1736408486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ll/68bWAfkYg5zPM5PvyPirtG4JTyZk33sG1Rba4DuE=;
        b=Zf0eDanoOD22MgxkrBLFWZJkXeWRGSvqc1LQNKsbF3sEzsVB94WQT549UaM7LC//bh
         s6r4SvBXfJPsAP6pL9juQM4E/E99mnBG0IixwAtmf2hlGMA4iBSxpGSqHDUPLJiIeVty
         rZ1pxp4JkTCRumrzswyf7+M+X5DXaYvkd3ll1nML2CeH7fg7zWFqr5/d92Z/VGWfgvNN
         OrAu43tk5QrHjaIb32QqfOVTUNYsqjqUD5E373mZTls2XeE+ztEPeOGYAetyek0JeoqH
         TonX0fpDPZeLGnu9aH/rXaYRPVSghp0gkuobjNFHwL2LSXaGKWzxcFoihtwK13RpHEiS
         CQKw==
X-Gm-Message-State: AOJu0YwYvdlAlbcBUNB6zkXVV03K1tkS6gC1mAtdOY4SxTLKBspvAXvg
	W6bxmBxJcM2iiOfrwXAVVDEaVjgvMLhz/Wi7cU88WSc9D5MaJ7YZjUnh3FDo3KZ5G1TPJTU+6JT
	z
X-Gm-Gg: ASbGnctqZfls8Lg6tcJIP46oWmRSceOQ0A8+oym5dlA1LWbN+5BOEy0xCzEl6ZhbEHP
	1nmI9lN/zvqI46o+rUYJjfxWAzF2adETs/vyegyf2+SDIpC5tSKVk47iklWrmbpxqAHfFpuUrxy
	cl7bAYpAUK+DfE17POr9wRSx5pCcL+M2BgsH79Wv/0loxD2px/3uqGG0u97lfBqcaQt89UCfTdl
	VX8tvqPD5VRTZHdZU2ByHAymP0dqzy0yLmFkQQCiKadNS62Dmw=
X-Google-Smtp-Source: AGHT+IFv2X3Yp/meEBWlFe5mc4ny38Pk/NTx6wA4HTDdlwyiDR4Rosh3V3RP6jPoiX6y2/lA6rMjaA==
X-Received: by 2002:a17:907:1c93:b0:aa6:2b8b:20c6 with SMTP id a640c23a62f3a-aac2ad8a628mr3141531366b.20.1735803686398;
        Wed, 01 Jan 2025 23:41:26 -0800 (PST)
Received: from [192.168.1.127] ([2001:9e8:d593:2300::f39])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d80701b2absm17785949a12.81.2025.01.01.23.41.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jan 2025 23:41:25 -0800 (PST)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Thu, 02 Jan 2025 08:40:53 +0100
Subject: [PATCH libgpiod 3/3] bindings: rust: libpgiod: fix
 clippy::empty_line_after_doc_comments lint
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250102-lifetime-fix-v1-3-313a6bc806c4@linaro.org>
References: <20250102-lifetime-fix-v1-0-313a6bc806c4@linaro.org>
In-Reply-To: <20250102-lifetime-fix-v1-0-313a6bc806c4@linaro.org>
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Kent Gibson <warthog618@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735803680; l=1331;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=CHQHsx+uz3hESRXD7+egl2OXhjv5MBQ3u3ICrcGsVHY=;
 b=n9yPxdkd4YeKpC6RwolGsnVAggW/gHZnBKu4N7C9icYglmYjAH1boR2U++/pQvZZPLrYtu0cA
 6lfc34YAvxlCpMDwZFdEUC/tbjwkkaV/ozX9X4EVGgfMmPoCO2vE4Y+
X-Developer-Key: i=erik.schilling@linaro.org; a=ed25519;
 pk=/nNqy8/YOEdthj1epXl5FgwCTKEiVqTqqnVN1jVal7s=

clippy warned about this:

    warning: empty line after doc comment
      --> libgpiod/src/event_buffer.rs:15:1
       |
    15 | / /// An iterator over the elements of type `Event`.
    16 | |
       | |_
    17 |   pub struct Events<'a> {
       |   --------------------- the comment documents this struct
       |
       = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#empty_line_after_doc_comments
       = note: `#[warn(clippy::empty_line_after_doc_comments)]` on by default
       = help: if the empty line is unintentional remove it
---
 bindings/rust/libgpiod/src/event_buffer.rs | 1 -
 1 file changed, 1 deletion(-)

diff --git a/bindings/rust/libgpiod/src/event_buffer.rs b/bindings/rust/libgpiod/src/event_buffer.rs
index 68d6e2f9a875e6b55a2df163cc99a0b9594f51ff..13fa7ba2c8870e0a325e251c073d6d73bb8c4374 100644
--- a/bindings/rust/libgpiod/src/event_buffer.rs
+++ b/bindings/rust/libgpiod/src/event_buffer.rs
@@ -9,15 +9,14 @@ use super::{
     request::{Event, Request},
     Error, OperationType, Result,
 };
 
 /// Line edge events
 ///
 /// An iterator over the elements of type `Event`.
-
 pub struct Events<'a> {
     buffer: &'a mut Buffer,
     read_index: usize,
     len: usize,
 }
 
 impl<'a> Events<'a> {

-- 
2.47.1


