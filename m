Return-Path: <linux-gpio+bounces-9595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F02DF969057
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 01:16:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4CD4BB209F8
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Sep 2024 23:16:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FA0B18735F;
	Mon,  2 Sep 2024 23:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXSRt7P8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84CD4CE13
	for <linux-gpio@vger.kernel.org>; Mon,  2 Sep 2024 23:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725318984; cv=none; b=hhnQhLiMSC5nyV+TH2nMyNGIHw5hIhOiFL1iNyf9uP0vZBanJ4Ey67/nwQNQOXyOuXi9tESHQ8by7sApePmCUCJwcNrvXkir2gWZDOlkK7V0F42u98L2QYgAFtHPBtudmte7bd1PjOScIfgbI+6qgc3FXbQ5Xc+QroNi66iCBvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725318984; c=relaxed/simple;
	bh=lsCIxxKAGNHzlqa1YRiqPDuHKPLpb07ejDxffdcxY6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbWwsuWL0XtrlC5GurO8rhzGuUJ6KqZfdlmvdTpMdOO34s3TwNoNgtwtdzjjKkXdFfSyML4OPiPHAP+MDwd1g/0BVqnRrLEMWhaRh3YD2jOhxfKs6xH1v4YVJnkDrUa/dgrHUbUsvHV9xnGA+gaqbyM1dJ/OuIWl4LR6rxts7dA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXSRt7P8; arc=none smtp.client-ip=209.85.210.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f42.google.com with SMTP id 46e09a7af769-70930972e19so1624602a34.3
        for <linux-gpio@vger.kernel.org>; Mon, 02 Sep 2024 16:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725318982; x=1725923782; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lsCIxxKAGNHzlqa1YRiqPDuHKPLpb07ejDxffdcxY6Q=;
        b=iXSRt7P8NR9fneOooalZzqmb1CFubLnDQrrKMcObAB3RDVAzaWTOaV6gJlT6JceFhY
         hyyLBjwlyZIu01W1xxuDe2zkyWM5SHCLC8gpJzcqVNoBTv/9Px5pc+iQ6afRTCQHxyVv
         IKi6EATxrrvbU90gEM6EautTIAFqi66D+N2gCQ3LFjtqRQ3mckZYCspvBEpOo+4S1SLw
         s9y15jaf+rcydvYh51rpCihQT+sTBKs/EmHxKLx8mUgLojQ08LoO/zuU0U52zkCehS7t
         SSpVJ+zpyWGrW+Afeth8n8KKciEn/chnX9ZYt4llCwYLWIapcVmhe7U/6OskxDjc0YSW
         yeUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725318982; x=1725923782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsCIxxKAGNHzlqa1YRiqPDuHKPLpb07ejDxffdcxY6Q=;
        b=AgWkTLJl6gvZE16BjXhKvA6yOyAQlE8WUi3kVKu/0Kv3RfcWIslwIgtC8GF7DFA+wq
         LlwcYEVbinR8gDwf9+hQEXbOJ9KeRLYAtYZLv+1gTjWYjc1RikcQU/WjtGhgEu4JKibO
         UtYBj3skr+8zhIJnFCDk52HeEIGB1TrKGEi5wlDNABwRTGQ+3ZTZ8b6oeuImVsReis1q
         fNo8hhWJm8MmDZZ1kAN+/x2remuAz2LJl8VOwZJRbgjIwwkoS2Xd4geBJr1RjVfWXsv9
         +rSJrZBJFfJGmxz6Q7oHhhHQqat+z6YGGm97lNTWQWyBI/ePZjWMqJ4ydBkIN4vLwVQB
         esvA==
X-Forwarded-Encrypted: i=1; AJvYcCW7VCgCarxjsyI6Fk1mJv5d7ifopBCn5OLmNZS/zBefKnIqchw6sGVDSk3FmYGZUhWEkle2riyJK25c@vger.kernel.org
X-Gm-Message-State: AOJu0Yz38xG7w4jB+EovaCW3Xe41PA7xjncvplHqbztSJTStiljKuHXK
	FutyKuh1NeYJzs+spaT9bjfWWXQk/ynYSMgoGLqSzgDR9T4xU2qN5eDMtQ==
X-Google-Smtp-Source: AGHT+IGYG1e5mVrROA4fO9zXSliwW5SMb0VQlvtAJ0miQw5xcpHc18Vsd8Rj2kRk7MQy1uxvD79AkQ==
X-Received: by 2002:a05:6358:5498:b0:1b5:eda9:963f with SMTP id e5c5f4694b2df-1b603ccaed3mr1728776255d.29.1725318981715;
        Mon, 02 Sep 2024 16:16:21 -0700 (PDT)
Received: from rigel ([203.63.211.120])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e575c4efsm7338266b3a.193.2024.09.02.16.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 16:16:21 -0700 (PDT)
Date: Tue, 3 Sep 2024 07:16:16 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Douglas Silva <doug.hs@proton.me>
Subject: Re: [libgpiod][PATCH] README: add --enable-bindings-glib as required
 argument to build D-Bus
Message-ID: <20240902231616.GA11036@rigel>
References: <20240902165636.43268-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240902165636.43268-1-brgl@bgdev.pl>

On Mon, Sep 02, 2024 at 06:56:36PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> GLib bindings to libgpiod are required to build D-Bus and both
> --enable-dbus and --enable-bindings-glib options must be passed to
> configure so make it clear in the README.
>

I would prefer to have --enable-dbus automatically imply its
--enable-bindings-glib dependency - you shouldn't have to pass multiple
flags to build one thing.

Cheers,
Kent.

