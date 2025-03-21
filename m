Return-Path: <linux-gpio+bounces-17851-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E77A6BA1B
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 12:45:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C181188BAEE
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Mar 2025 11:44:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D4A322423F;
	Fri, 21 Mar 2025 11:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dCQbG+IM"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A981F7076
	for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742557464; cv=none; b=U1xJ6kHVTLGvtBzOtdycqM+AooZXfhQhX1l34GAtUAXmSJd+Kua1qMjACFdYOJZYUsSve+qIgHc7GMpLKg9RuBVgU8IvWqYIjWGHOK5O0ZaMSQyKUWMyd5tblmzQbuFKCQ4oev2n8+JSRDkLmgEd4TrWC8150vZB3clpJDhuahY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742557464; c=relaxed/simple;
	bh=ZvNS1txJNjJVzP/lH6e4QBl8rDjZqb0MoHPK4KrqUt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QEhN1/qB2jBehIpnmZdb8xwKY0VWmf34V4QQ5XXDWRbBpgFCRymwP0qhTaSRA19Aef84wWvOMZyQbP+gKEhY0J0h7+3+yDtMiJpfr6C2n6Y8wxnnMKXc14mk/1ELPaSkRcoHLC/2j+q7jr+Ax/M6fhLeEdasxt9IQPdBzmT7IlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dCQbG+IM; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-223fb0f619dso37190685ad.1
        for <linux-gpio@vger.kernel.org>; Fri, 21 Mar 2025 04:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742557462; x=1743162262; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yXvARB72qddG396IUEqXC/X8CSb4UVCgYqmGBuJ5qgI=;
        b=dCQbG+IM6PHRf10sZMC4ckuWvslNcuOeKD6GFxy1RAc4QJagCeuP1cvQXMrt5mrevp
         SD4EaIuEWodxQbHadk7QrlLVliCjjR3yOuG4iy+/gABFOk06KV0rCiqKuVt8wOBdZijr
         0wOsErIdvFnD07855zdFQ0q+Bj7rzTMuZVRlA+cHHRaUIxVIf9XkHG1tbjDVCaGTIp9l
         YpgzUahJ65wos8BLFSZ53bCJchABdaLIt3oQkLXs7xOiVvtvoIUQQ6PjgZBHHjkvAjGe
         CLewGR9F0lE5zShyPfpxQL15/A9thrwTWEj9/zToSXcAWwNm57IL9YaQdmEk1xYQGqR8
         WccA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742557462; x=1743162262;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXvARB72qddG396IUEqXC/X8CSb4UVCgYqmGBuJ5qgI=;
        b=EG2aZLidvUjYFVEClAQtul8F6NzOHpduCBca2qBejuF9sDyyvTe3dFQVHIdMC2m687
         ezCK31Ibn6/sIw7z09M8OFzQDfVSALV3bJzxaXDxgokCZ3B+YwHJ8gvBuSvhzEQetgwG
         2PL8BWm8DoQWsaBqvk6x3IodG1ur4XkOVsB7EACnxeEAB92tqCIjFjQj5Z3MUsVZjL6j
         itGKzoSqvKi+HxgFAcL3JPf6kXl4+lw9Hdq08FRuTHJ8Ec01638/Tb3nQO/0hxojIZP1
         NT9m9L99JzHiPEPd5H/fVnqu3I1AjQvhee2Z83o/YGfnfF7LYRyMi8jOBaJW2IjBEsO4
         7lRQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1R2Ftjrm0JQrdltVQxget+MhIcTUXlL/JEk0SonRSdeaF412vX7zKsZMllw+W+RTlZSaOnsX3bGKC@vger.kernel.org
X-Gm-Message-State: AOJu0YzfeSs6QsXQtpXn2cIHhy0rhlbVCD8HL2jCuoHx643aQ4340kHw
	SkOvcamLnAAiLs19iI7qIL5LJpkfpI60iaaRubY1ICoIGUn1YG/jvNYc/lDc
X-Gm-Gg: ASbGncshKSlWYbEWQvTgESMmLgTKnnxrvWA6W1W3ICnJYYwYCsTSogJNMPh2a/43QB/
	XAXrqNiiJzX2V37T8AcGWuzuqrT4MgomfEUCD+zHlvdJdbgC6Z6g1Lg7p2xooNXo2d2828veUZM
	Ro64uDhf2iveJU/rUMn9GPTcNPmCzGI81JbocQqonjyV2DAgsVQ2QBOB6KFCCN0bq4xfuPSyJ24
	GNmjPidwSjl9DubkW1bCjdIt7A9TmtBhIar5nmsSHQ5asFQWcZfa+XWhSgWxvhAO1TkNaO3U4Vz
	NDoqEoI40Y4UOvf8VVo1Z4SXZvLGxuZ4tIbXapS8qsH9YzVu
X-Google-Smtp-Source: AGHT+IFz4Je9VkzSh6yNybgnk2UwqvTjK/+LCd/GJsujy3BcsZIK82ZhS008wekCOKcgXwUtTKN1FA==
X-Received: by 2002:a05:6a00:4648:b0:730:927c:d451 with SMTP id d2e1a72fcca58-73905a234f3mr5316361b3a.20.1742557461498;
        Fri, 21 Mar 2025 04:44:21 -0700 (PDT)
Received: from rigel ([115.131.241.66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7390614de5fsm1618802b3a.127.2025.03.21.04.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 04:44:21 -0700 (PDT)
Date: Fri, 21 Mar 2025 19:44:16 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH libgpiod 1/2] tools: gpioinfo: don't implicity unquote
 unnamed lines
Message-ID: <20250321114416.GA150664@rigel>
References: <20250321-gpioinfo-unnamed-quotes-v1-0-a806e9027adf@linaro.org>
 <20250321-gpioinfo-unnamed-quotes-v1-1-a806e9027adf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250321-gpioinfo-unnamed-quotes-v1-1-a806e9027adf@linaro.org>

On Fri, Mar 21, 2025 at 12:05:24PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Consider the following output of `gpioinfo`:
>
> gpiochip1 - 2 lines:
>         line   0:       "foo"                   output
>         line   1:       unnamed                 output
>
> Now let's run:
>
>     gpioset --chip=gpiochip1 0=active 1=active
>
> The output of `gpioinfo --unquoted` is correct:
>
> gpiochip1 - 2 lines:
>         line   0:       foo                     output consumer=gpioset
>         line   1:       unnamed                 output consumer=gpioset
>
> However, without the `unquoted` switch, it's inconsistent:
>
> gpiochip1 - 2 lines:
>         line   0:       "foo"                   output consumer="gpioset"
>         line   1:       unnamed                 output consumer=gpioset
>
> This is because gpioinfo drops the quotes for all subsequent attribute
> strings when it encounters an unnamed line. We should instead keep a
> separate instance of the `unquoted` flag just for the line name and pass
> the original value of `unquoted_strings` down to
> print_line_attributes().
>

Oh nuts, originally the consumer was a separate field, so the line name
was the only string in the info.
I didn't consider that when making the consumer an attribute :(.

The fix and test look good to me.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.

