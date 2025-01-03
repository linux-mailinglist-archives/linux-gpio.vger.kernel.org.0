Return-Path: <linux-gpio+bounces-14471-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B57AA00AF5
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 16:00:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18710163C0E
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jan 2025 15:00:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A43BF1FA8F5;
	Fri,  3 Jan 2025 15:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fqVGZQWj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACE4C1FAC3D
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jan 2025 15:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735916435; cv=none; b=QPQzWlk8BxA1KsvNuI+nrhBefmyDcd0M71j0HwvAxpdQyKvcBOTrPFtwIAAdWliLgZCHUF+Ma5Kmwe8RpOm3qqsQ/Nq1Bs6pAKdmLqKyvkv6nC27mAiRODQq8L0XiBY+amsHrzBu+X2ro3m7FMmM1UBwD2/M9w+A09aVrsldPiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735916435; c=relaxed/simple;
	bh=DJKvnVXuYC+eJwpALJsvAw70oCOlYp8/LbRRHrdJ8jY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AVvmFkEDbQcxZ4TYnR2UWkg2I8pMlkG2Janj65ZKV9A8nac4GcehIq9yODPE63dvOwlgcBExtCCtr9R3PH4RJVwClQKYylgoHLEAGhQfi248oNOVw754Eu48P2GM1xISbwq6x/qTVwsaGMU3dKm+Vu4qypmb1KNNKh8lYXRNlm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fqVGZQWj; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5d3d0205bd5so18414926a12.3
        for <linux-gpio@vger.kernel.org>; Fri, 03 Jan 2025 07:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735916430; x=1736521230; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wfkfkC74ZztoDGnVsg2h6JBMGya/+7qO61kKfLeH23Y=;
        b=fqVGZQWj9YQOhKbIK3mutkS1DGzdiRHppdjTO5hrNgSO92G/Wxlf4VCEiiHXj+ViAZ
         cCu3JiEyju2W8xE+SP/7T1U0xgVcQ4WHiwcwwgjY1UszB8t5leDvUsMkK2UwNFuYMWSZ
         04u1i5cOIWQc+Nq8xRhX9nTMnTUZQvezDhbGavSvztzPyCdhcx1F8CvR9q/QnYvW0h5j
         BBfRp8AKacNPgcsvW9WpcvOBPnBs5UjvB1785OdQURY32aKUYRuBoFbIb+TtCr5RaNiB
         PDCj9uBI7RzpR+mg4yN2xRqP1gQsZs70HNvd7fjgBQ9Cs74Vpbz1IZCW9ryWDc4BA4nr
         FuXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735916430; x=1736521230;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wfkfkC74ZztoDGnVsg2h6JBMGya/+7qO61kKfLeH23Y=;
        b=lZAgjqo9NfELrMi9vwvCT/6ws4RM8at0P92Pwk1ZvRs/sr9eokv1Jb0cD3lBhEerLU
         7cFiVcTxUSgG3c5v2viokAGRfopTDrXIeHGZT+rf5zBGRr2gJY87haeW2XK4McNrbDJ2
         bzP1uZ+2zteqoinYDzyJDTKPUukgE5SYvZup5T7ArRnW3qhB2YbVejLebpOkWp8RhdTV
         K4xCAffUXbkPwxvTxmSnTYn56sOdxDN8wv1ma6hHa2OEpkJNDcn01ndamBQ3mn+2VT+B
         PdKuhdd5ytravNdPpomuPUYLUHtCugvhprTpu8VZExUQFz7zYswIipxNT8LaInYSxKJ1
         J09g==
X-Gm-Message-State: AOJu0YzcSwJ/X0iAPcdKsasx+M5G1LxomwYkDZvz0VKTVM8EuOC0LUYh
	o6TnZ4+2tjMndNMo/q4Y+ACMD0oi2tPjVpKCV2GBLiF7sBFzVOGoaJ8fJy7YcPw=
X-Gm-Gg: ASbGncskqs8ScCYEKNqxkAq+hwVLdrqIOnMGlojyNCQVLp9SlHAGPs3ksT+0Foz1aIh
	geTAQk8O6bD7tBbti73wJxFNwaMchqRAZauJZjfy7OJlICFK2dETMZcVN6lWCGDsnH7DsjqcmKa
	TzQumAqlAks35qeNI/tsq5i8uBRDvxCICFkt/rbNyA1kZOUNHnN+cQcaLkPKvAGy0Uy/KNyt5gV
	bx5A1Zbp19+eNvpFZKqtozB0CVwkKRhOfk3InH9pwBSBFIOkBM=
X-Google-Smtp-Source: AGHT+IHu3waNJhzA/vLTQvYJusSxaIi5YCSUjAwQVylJ8izgBt+NN4ETavLTL3YILLtSBjcM8BrLAQ==
X-Received: by 2002:a17:907:36ce:b0:aa6:7165:504b with SMTP id a640c23a62f3a-aac2d41ebc3mr5271049466b.31.1735916429770;
        Fri, 03 Jan 2025 07:00:29 -0800 (PST)
Received: from [192.168.1.127] ([2001:9e8:d5a1:be00::35e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aaf4a841749sm693078166b.137.2025.01.03.07.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2025 07:00:29 -0800 (PST)
From: Erik Schilling <erik.schilling@linaro.org>
Date: Fri, 03 Jan 2025 16:00:17 +0100
Subject: [PATCH libgpiod v2 3/3] bindings: rust: libpgiod: fix
 clippy::empty_line_after_doc_comments lint
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-lifetime-fix-v2-3-63902dc8cae1@linaro.org>
References: <20250103-lifetime-fix-v2-0-63902dc8cae1@linaro.org>
In-Reply-To: <20250103-lifetime-fix-v2-0-63902dc8cae1@linaro.org>
To: Linux-GPIO <linux-gpio@vger.kernel.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Erik Schilling <erik.schilling@linaro.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Kent Gibson <warthog618@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735916426; l=1392;
 i=erik.schilling@linaro.org; s=20230523; h=from:subject:message-id;
 bh=DJKvnVXuYC+eJwpALJsvAw70oCOlYp8/LbRRHrdJ8jY=;
 b=9wuqAMAvu3gZe61jC3Y98EbABHppZdkLqGOnu6+ZC8hrYVeY2QxW8KXxEjEwrzSDh7xOsMXOl
 GmGesxIrKURCmI0P3kVhOVI+MPgzpxOQUL0Ytl8SFDIX6TNLwBEkegT
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

Signed-off-by: Erik Schilling <erik.schilling@linaro.org>
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


