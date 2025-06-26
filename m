Return-Path: <linux-gpio+bounces-22244-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 454F6AE955D
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 07:52:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3DCF47B6A56
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jun 2025 05:50:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C888218858;
	Thu, 26 Jun 2025 05:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NCzK116a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62661991DD;
	Thu, 26 Jun 2025 05:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750917128; cv=none; b=jeeD9JBS7zr0Hca6tfP9BbvPKbX31eYSFS5JgCQj2ah8K2u2D8IEpwnol+cQCWMW1CgKPy6nYpfptj4snTu5WBejILrnY1Xw7whItufF/GXgEeXM03ATkTZqCbiJTdf8rxxfMNsxlI69LFx7DmFNGMHd392VscoqMcTk0Z6AH14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750917128; c=relaxed/simple;
	bh=hNPJEMTsFsqUm9I5awphhH34Sh3uiuaB/1FZv2vpLac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKChbvFGzeW7bwwlcFlqc0FOm4NMTjeT1SiR/Hcygd4Z54vMhIPG3URpVNZiauyLQX85qGUMPZ/tuBxe2/TIvn1RYH0T7bWopAPBNGdbFTF9mlDbhfDZEvG8FT6+gTbtJCSbEVs3kXX2zG1mDEGQL7aCoP4dfsEvF3b2w/rNPZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NCzK116a; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-235ea292956so6877585ad.1;
        Wed, 25 Jun 2025 22:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750917125; x=1751521925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=03rbcw70Cjwa+LI3Mb0xEq2L7smCgp7pL59V8YjN4FE=;
        b=NCzK116aySsARvbqCHGnxSHX+gQu5DnKgXCwicPLUz7Hyx5sEogUX2Egg/LEuuk8PD
         bUvFj4YHXEvYsobtbgAScf0O5dVgNGY461H/iGRmUaBI3xAZMLKxGi+Omgpiq+rUdGJK
         OFUjrLoCJTbkVf9uwRyDKHKXGaLaWgQ7yNoNC24jBDcXMQaKfUvDab6fVzk6gCEVI5iA
         DglUI+mztlKSP154mYGg8JSiKjmjYd+mvOy6gshDQK/aA4rQwTnz/mUXQOdSocTWR3XK
         aU7nUOqYUBXL9gTZmB6YYMSq3mGoXQA8nkn+3w+8JKMVDjmL1wgfERis049GI+jN5PnI
         Zqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750917125; x=1751521925;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03rbcw70Cjwa+LI3Mb0xEq2L7smCgp7pL59V8YjN4FE=;
        b=d5N7pmzN7fWxy9ocM2d+gZgA+MbAf1m1zEUbjdbEU2DHll1Il3+Xaakfgq3CaA+qpb
         13KiOKppFd+9peN6C3yVStZ6aivwGZ4Po0fDU5lOKhcF2HdAqvpDKYRHYw9txzs3bCoP
         WtWVGwFFbtv4FjZCcq5jzZN3dQqalbA8/HIRanxaJ0XHGIlV1BRpm/XHZhk0ghaoEdBf
         wxEd/3p8rxf9qKIHDG0W5//hZYiYjVcEmCGP1zH2CSG6PCfzaRLk8JUq4ZroTlZ87CN5
         hH4ry2/LzwxuHW9NYjEeor18/wHNe9B+pxtov0xKpc2WUEwNr7QVvnFVMzqZCZQ6fdYy
         8NKg==
X-Forwarded-Encrypted: i=1; AJvYcCUH9sbDQGkcUul5HAtLC0NjLfsvdNtcfr79XhOZ7W8hKc+sNBdvRoLbuiDDD5OXTe3H+u/FdNcta+2u@vger.kernel.org, AJvYcCWj4tpZLbgODNH8XUUm6/nKEwNxYlWbk5jou1iHDroUvxj4NwdK5yPo1pkSJbIwvaj1mjAarWzW8XCa6h4=@vger.kernel.org, AJvYcCXvtFsST2qiWpps/qRRBsoATSdg+z2W5o44+bJXLOGQn/hNI4OsCIxjVXag2+ABwofizUysmsjYB+T3bY6I@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9pH+EZCFcPuIrfTa6D6bhBJoM3q66Rfa3tXpL+wa84t689wAt
	+zsdcRYUO/qy43t4/0pxQY0YIIQ7qEJdbMLmXS1FHl9Q7X15rYbo0Q0Z
X-Gm-Gg: ASbGncsUduIPQZjEZ1eS+7BScOC8cCCAcAlZA1c+63tMzNnF5YwrVyfZh/zw6ljsbuv
	GlgBzotwlWwVvy2NdCKKrgqnxiR4TE/+mxaqPzxkEyAa0kJbQi45pELXIGDGuLiryd+RufMoAN9
	REdrRx8g3PJtU3okiztJNlxGzVeV7nsJtubLQMXs0d1GgO3SNhk8yfQeFduZBYdrU492/DlnXiP
	jP7NQI7r7J45auBzNlPCh3oyDEE4nwjU51EyMvhO8zaxIna045Xl1ScmqHlh0p4smKRSmny7EIy
	HrUkW8AxBYG2qlWsJd8K++6RDR/rXGm6jNID98q2HWIu2CvSwIHPM9+r6VYgycQ=
X-Google-Smtp-Source: AGHT+IHr94/R5pCu+7mS/rv2pYfh2pG9eSdsLkPE+QY2u4Js7UuxdBw8kelpLSS+jAthGc2drK/1+A==
X-Received: by 2002:a17:902:d2c6:b0:234:9cdd:ffd5 with SMTP id d9443c01a7336-238240446f3mr84023955ad.25.1750917124993;
        Wed, 25 Jun 2025 22:52:04 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:9c8f:acd3:efcb:bc3d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83d0bedsm147794215ad.67.2025.06.25.22.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:52:04 -0700 (PDT)
Date: Wed, 25 Jun 2025 22:52:02 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RESEND 3/3] Input: adp5589 - use new GPIO line value
 setter callbacks
Message-ID: <o4vmeugkdsmhwx2ikw2hsbwriak4psrkeyngbsgmjpf5ai5sop@x6t5lmliridq>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
 <20250610-gpiochip-set-rv-input-v1-3-5875240b48d8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-3-5875240b48d8@linaro.org>

On Tue, Jun 10, 2025 at 11:40:00AM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Thanks.

-- 
Dmitry

