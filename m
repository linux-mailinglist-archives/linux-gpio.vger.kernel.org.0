Return-Path: <linux-gpio+bounces-11693-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB4B9A53DF
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2024 13:52:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 724251C209D6
	for <lists+linux-gpio@lfdr.de>; Sun, 20 Oct 2024 11:52:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C2B018FC99;
	Sun, 20 Oct 2024 11:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFsRhguI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0BFEEC5;
	Sun, 20 Oct 2024 11:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729425118; cv=none; b=AsQ9gus2+d8eQdmhIfI6xHomS+ikt24Ts+35hGfVq2tPMo7CZwfffNxdxdM8EAROGt+fRfSmAtwoClYpMDK/KXBwBZHMq/ntAJePNkKWS0ESycIELFy4oayI0a7owoQPJSt8Tk1zOZTDvXhSY/cJhZAlv6Wc6kSJqE4t78Rnroo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729425118; c=relaxed/simple;
	bh=T8iiG/Je4+Qi/JWwQtIbKAWHmCuwpbawWoiq8xuFmx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRnlMFlQB/uFAvCE13DfziMrlJsdgqED8cGUd/jxEYwUwvfnuQOn4mGACLW71l34O/3/M240yXS3UlSukzKMJd8Nl7dW5MWWBZe8/SYvcb8Bz0Cray/Lg3GpXK/SesM3bdRECsFBGuMBM3VlQI9HZxXdhKPBlvGs6lvozVYRI1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFsRhguI; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cb89a4e4cso23930405ad.3;
        Sun, 20 Oct 2024 04:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729425116; x=1730029916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T8iiG/Je4+Qi/JWwQtIbKAWHmCuwpbawWoiq8xuFmx8=;
        b=YFsRhguIeB+UikntFsV86bQAOBzjHaQV8PEVK1imLTBqZoBK/8qRJ50J2DdJoKSRyF
         rOPmQcwc8QoDr+C9ERVuqm/yo/vmLuO8ae/8X+rL/mkTzNb3lAjQDQCa+nyXOn+Iphgz
         vcSug3L4VxTkFp13KQZGZMWPTgTwcesZYKlH2jXzAuBYLaerWaqcVlsvnNF2prlXvt5R
         CHGLxHHmyr5Zbnd44jGfkNNzs13a1vGur94sQ9+S5VocZT++a8W5AhGnFg4jgcNi3ubI
         tw4yohDjGXHsQR1Ne0ppHDRgD5S20re/m3JCH0P5yglLGBmDkCKCTDPFzp6x8jOxYTrt
         IIvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729425116; x=1730029916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T8iiG/Je4+Qi/JWwQtIbKAWHmCuwpbawWoiq8xuFmx8=;
        b=mI1y2YIPP/A5nqqsYpoYstrjig5iUFLbwyhX20teOUm2mDXbl/75KzR6vKb9WDpuq4
         If1HeYh2ZnA/r2x1veXfak1QWMRQK/ZINbsmKptr+f4/t5rNj90Ry/VbXQNN0tB9ghju
         7dJZ3GV7QnB5zR1ZolEwZAOs+kUHeBbO/3S4Q2T+51AyPd7LDycv2z6NF4k6stZVDnRK
         kf6dgBrUk37Bm18V6EPKHXDYtNRmEC0qOAWsbgs2AQgXhlUT4xoJ9LlkEirGZvMP03De
         F04+wM91nq34a+crg4Rif4Ltd3rG5qinYTj45zndimtQFTVzoy2NSTwPQPYoShGK8t7R
         ONAw==
X-Forwarded-Encrypted: i=1; AJvYcCUFaw9mOYd81ZAIrRdzPFsCTJbUyfkYH8T9N225LXnUIp+/l/lWxMUrCoUpLrEhpINJazJf0DUO2thM@vger.kernel.org, AJvYcCVHBA/EjG2AXwiEhIfu/at9PCwfbBwJAeg0BazJSdOfELQkPazqG3RvFCvcdd/0n3EuddqYN7K9YHueF0vU@vger.kernel.org
X-Gm-Message-State: AOJu0YzeD5s2039ElSBUjVVZw0q2CnItLq85drvbdrhvJN/AVl2+Ejcd
	zEG2sQMZwU/pI4zONAlWJ6Ig+vcndwRzyCOrOiXEl/aOGlsgkViN
X-Google-Smtp-Source: AGHT+IE6UghNvyaLOCk982ZscpMBAJkW+ZpAgLLsyfe913pnbNkJT+MvK2suLUtFv8JRjlMFxhlk0Q==
X-Received: by 2002:a17:902:fc4b:b0:20c:d5c5:4039 with SMTP id d9443c01a7336-20e5a71ede2mr116878515ad.10.1729425115645;
        Sun, 20 Oct 2024 04:51:55 -0700 (PDT)
Received: from rigel (60-240-10-139.tpgi.com.au. [60.240.10.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7eaeab1e5cdsm1135897a12.21.2024.10.20.04.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 04:51:55 -0700 (PDT)
Date: Sun, 20 Oct 2024 19:51:50 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v5 0/8] gpio: notify user-space about config changes in
 the kernel
Message-ID: <20241020115150.GA60526@rigel>
References: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018-gpio-notify-in-kernel-events-v5-0-c79135e58a1c@linaro.org>

On Fri, Oct 18, 2024 at 11:10:08AM +0200, Bartosz Golaszewski wrote:
> We currently only emit events on changed line config to user-space on
> changes made from user-space. Users have no way of getting notified
> about in-kernel changes. This series improves the situation and also
> contains a couple other related improvements.
>
> This is a reworked approach which gets and stores as much info (all of
> it actually, except for the pinctrl state) the moment the event occurrs
> but moves the actual queueing of the event on the kfifo to a dedicated
> high-priority, ordered workqueue.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.

