Return-Path: <linux-gpio+bounces-14122-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8CC9F9DE0
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Dec 2024 03:01:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC9C716402B
	for <lists+linux-gpio@lfdr.de>; Sat, 21 Dec 2024 02:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6C61F949;
	Sat, 21 Dec 2024 02:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QRs0VzKI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73EB012B94
	for <linux-gpio@vger.kernel.org>; Sat, 21 Dec 2024 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734746469; cv=none; b=LZI2lKipoYIMog3erC0zAdH7oGhvM3wqdF6ef9M7SLiFdqagQ2M3XWiSZsJif6mj07PEq+EDGuk1SELf8Q7mgt8nYM6XtKPzTG67rCZEHCPU82x0ukcYvMI/CpOUWK4+3Z9f9t93eTu+ZtYF97kcsIQVv73Ej7rnWFZrkbl2lMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734746469; c=relaxed/simple;
	bh=3UJ2H/nMU1E2ApT5AELAtUkPkdawmhnwh/bKM680xEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glXor+KvcmOQOblFKTBzyd0y6+2XuHfSkmh3UG9P/pE5b0iaoAHZ/lnpz/B6EnybquzxxAd6e7H8X7RP6eb+EX6hynsCZWCGEa3qoZFyofedrHQIcb1rqRzjOy5XWQPPhMvOQyZgBSUKVqbxA394OUeZCJx1a/y8090/jWlftCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QRs0VzKI; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-218c80a97caso22128125ad.0
        for <linux-gpio@vger.kernel.org>; Fri, 20 Dec 2024 18:01:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734746468; x=1735351268; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dQlJ7yfIaF1wqoe970Lowt9khYAljRExZ8KwFvcKezc=;
        b=QRs0VzKIkGMHHyZ7aGUp/PJiuDgamwYhO8vPudeMCBQU+eKueexPTDWYT1hsn0GPDX
         JPs9s1J/vGtZu3EEBbgbCgk9fYPKvDSancHAGpv9heZS5fn7pp2TVh8QefPDjLlRBa4h
         1J61iVCQJfanHT3AYPO5k8AL0+zjeaYiK3rDt97EVEr3DwSAKufGaq4b7XeuKYAGSIyy
         osv+gSlzYb4bMQyleuZRO/23xBjG/tFjRAG8pGU/uXW84Q3Z+8BKTvs8eXbrhc04LvRD
         F9+vjODDZ/pihsVjOksFr1y7GGYKS47nqHoUgD94QXL9+xmJmSqoP51QsGo1IiwB6rL/
         YTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734746468; x=1735351268;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQlJ7yfIaF1wqoe970Lowt9khYAljRExZ8KwFvcKezc=;
        b=qiIUmMVdaICLa0KxmjqqocjgO52J0ezk8bTmVkONUNnytYCcLpV06NKEVyKn0trzky
         cjEOxoLvZiHpAZWNjgc0+yjuI4Va79TBsNFSILo2dDzNFHKStWhBd8rhowPP7zqQ5wa9
         u7D7YbqoM67umSSrQ3nikDH1wSdJddscwIu7//81NEjvNZe5wFj7yYSZ4pb417GE423O
         WP9or452oBLR+1VYjLQFq5qJjO1OXOlEWQJECICLxO/86+mu4f2OqfL/AafxxXOEmt1+
         joZsA5tj4KbafvI8eAdtStjaxQ5ak+Adw8ZrqSU64OW0u3wRP7XXhCa6MVafDkzrwEj/
         8QbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUC3HWSYj7SqxAwuyQL+FW7pbS4XxVB14p3sQKGx9XXnD+x/e56KDCNYQ8cdqEKa1JLD3OMV53WqyDi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy56m8RIHLIoCn0f44lh63IIrw3bFRHvVPRyBFF9RKZ0B3c00fs
	BPot/MNXMJozMZ65zZ6T4Kw9J6DRWVKoI+07aenfFRZrcGmSgWq9
X-Gm-Gg: ASbGncuKdSlm0RDlmYnP/4qsY4mI0IsvrpyCElj/yvtOZNcXdxBUlAikbZzcOOUbR0U
	poA4YLCf3IZGVqhWsYvOLw+azlTYW07DwZVA6jcJcjk+OohjOE3xSYwoSonEkOj6SPQ2R4AITyQ
	rXAZCCDxhweyMPJgratPsiq6ZSvPrBjHYW7TF0fvlFJbYdf7AGoIN7n1+PLZr8YSk2b1f0nT3TD
	k0M80wAqnp7jvJvpm4QEN7ebhqpkzMQ8ryGvUaacmjFbmU9F50SgQ5AMqNFjwbKrxiBkqP/H8kI
X-Google-Smtp-Source: AGHT+IFMGgDzmLMcbIMDOqaQanCzNk3/pnKsdQw36PE6zOqXlLiV5A91Lf6tQF7c+rKWZU/cizkjiA==
X-Received: by 2002:a17:902:ecc7:b0:215:401b:9535 with SMTP id d9443c01a7336-219e70dbe4bmr67202035ad.47.1734746467690;
        Fri, 20 Dec 2024 18:01:07 -0800 (PST)
Received: from rigel (60-240-216-120.tpgi.com.au. [60.240.216.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f693asm35324045ad.224.2024.12.20.18.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 18:01:07 -0800 (PST)
Date: Sat, 21 Dec 2024 10:01:02 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
	Erik Schilling <erik.schilling@linaro.org>
Subject: Re: build warning in libgpiod rust bindings with rust 1.83
Message-ID: <20241221020102.GA45199@rigel>
References: <CAMRc=Me-QNmJ2L1K-gGzFtVZacsDiLsNUfh3QaWPdbVzyxUduA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMRc=Me-QNmJ2L1K-gGzFtVZacsDiLsNUfh3QaWPdbVzyxUduA@mail.gmail.com>

On Fri, Dec 20, 2024 at 05:25:16PM +0100, Bartosz Golaszewski wrote:
> Hi Viresh et al,
>
> I noticed the following warning when building libgpiod rust bindings
> with rust 1.83:
>
> warning: elided lifetime has a name
>   --> libgpiod/src/line_request.rs:234:26
>    |
> 231 |     pub fn read_edge_events<'a>(
>    |                             -- lifetime `'a` declared here
> ...
> 234 |     ) -> Result<request::Events> {
>    |                          ^^^^^^ this elided lifetime gets resolved as `'a`
>    |
>    = note: `#[warn(elided_named_lifetimes)]` on by default
>
> Could you please take a look as I have no idea what that means?
>

clippy is complaining that the lifetime of the returned object is implicit.

Try:

--- a/bindings/rust/libgpiod/src/line_request.rs
+++ b/bindings/rust/libgpiod/src/line_request.rs
@@ -231,7 +231,7 @@ impl Request {
     pub fn read_edge_events<'a>(
         &'a self,
         buffer: &'a mut request::Buffer,
-    ) -> Result<request::Events> {
+    ) -> Result<request::Events<'a>> {
         buffer.read_edge_events(self)
     }
 }

to make it explicit.

Cheers,
Kent.

