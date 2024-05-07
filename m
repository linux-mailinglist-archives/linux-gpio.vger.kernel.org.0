Return-Path: <linux-gpio+bounces-6175-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D5B8BD8F4
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 03:31:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3AE76B215D8
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 01:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB74F1C32;
	Tue,  7 May 2024 01:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gqJvTNDr"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624A3139F
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 01:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715045496; cv=none; b=dIQ2mRbRu2+wv7dvCHnojPZ6nmxRJHYUW7h6/vXn6o94exlS7iAfYPPxbI7q7wjUmLYlp/qgtP2t8G91+v96Is0tBgstefj7NzTHDk5siDoVJnIuCPTNPq88Sfp51/aXXCfG0GF5QapQ+Lb4qwXVgCo3xBkMv/txnUW9+WWI0Ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715045496; c=relaxed/simple;
	bh=KV5VwEs5QbL2wXFB/twg+hitFwNKDTSC1n176L1sBYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qr4Efp6LOndC6EXN5h/q+i5moKuQDjXDlZlJ07htvHicvu3kg4/hXn0+CwVwOyzynxQtS750IOdLk4Ap7PJUdsrx+IfX6+a5zh7K6nCBoFqbawOpUnqWKBfQjyqh/94xkJJi8RNP76uW7Tj/rZKsAwm/xvlIJHoiOaWADNP0FXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gqJvTNDr; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-53fa455cd94so2140471a12.2
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2024 18:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715045495; x=1715650295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KV5VwEs5QbL2wXFB/twg+hitFwNKDTSC1n176L1sBYU=;
        b=gqJvTNDr/l9QgPzFOq4olo1XpqR1K6wk9/Hwp01jfsOUgMA5EU1JfLIMEeAUSpxZDp
         5TN0yiaq6sWGHy1Ht8HeXo86n88jHlUB1N3K7Pj6q4wuXe28mJdO6Xu0zciAeWNqF4mp
         eA1AY08uZNdC3aHztDHjdMr3CRYhJuxib3kCoMpNUm9+xo5tol+ARAWotWYlchKHDa/L
         +g9A4/ysOYEjq4vXRPyH8NbzRYDpS6108IkKi/Mo1VXlv3S4oQuBWmMsQxhXUjAV/nHx
         Xa7+01zl6U6Txsy9yC825ijOUhpQHvZP1KYPSVu0l71k+bCA/rqux/GZ0nbkGIfTiuFY
         2xmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715045495; x=1715650295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KV5VwEs5QbL2wXFB/twg+hitFwNKDTSC1n176L1sBYU=;
        b=U1a+EAqaM1N+BkeZ9PAWZPY3w3LGXLf0syW8f7hY9gyC4jikwAPEArUNJEWMQNpdag
         Z/Fg3v/7gBWDkNiDbTfD3PwJ1uN18lx9hAnl+W7wWAb3GMV20G0QyJnS3Xhtm/HpSAQ9
         6EjXK1lMI/EmaTd95ycUmBWkCTpUbU9o+2m7pYOiZoj21nPG+spIFz38ursyrsruaa+w
         wXYqpLgzp0mryurG831qm1nXbrdkeMLkYjgJHz5V4pLNL53gxTZXYdUHdNKNMRFR5d2f
         XcWXd5oefqgiGvDGRMwDLVv/cBHcCFgrX9BR0YFWKTQwGvhiaj8rVpYTuy3V1TwsSAwR
         xLAA==
X-Forwarded-Encrypted: i=1; AJvYcCUGTLkuoSvkg3zHVVP89ZBwdV43fnKA5dwRlszmwSRcThBFrh2hDS6JeX8/ehhgB0OBcwu4lOWX6ZfdSS6a5zttO63kbzsLCURUmg==
X-Gm-Message-State: AOJu0YzhuAuMI0/jeO7BrL/WF8y92I1KOKe5NSv2YsWy+sLByyXd0iRa
	BYIFjooGENt9dxLGJxWKxvAiCU23tkOdBTkiSeftkEPMkHaNqRL6
X-Google-Smtp-Source: AGHT+IFN3nOXdD/tM4Gd+H39ov7qZTbPvyeKfLU4Vbk0tUvj6imeMjwiscvJbvYL/KhSB15PO3NMdg==
X-Received: by 2002:a05:6a20:6f0e:b0:1ae:a5bf:341b with SMTP id gt14-20020a056a206f0e00b001aea5bf341bmr11452528pzb.6.1715045494493;
        Mon, 06 May 2024 18:31:34 -0700 (PDT)
Received: from rigel (14-200-166-65.static.tpgi.com.au. [14.200.166.65])
        by smtp.gmail.com with ESMTPSA id x3-20020aa79183000000b006f473177c92sm3259350pfa.196.2024.05.06.18.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 18:31:34 -0700 (PDT)
Date: Tue, 7 May 2024 09:31:29 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] tools: tests: accept the new gpio-sim label
 format in test cases
Message-ID: <20240507013129.GB26136@rigel>
References: <20240506162506.176935-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240506162506.176935-1-brgl@bgdev.pl>

On Mon, May 06, 2024 at 06:25:06PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Since kernel commit 840a97e2fbaf ("gpio: sim: delimit the fwnode name
> with a ":" when generating labels") the gpio-sim automatic labels are
> generated by delimiting the device name and the fwnode name with ':'
> instead of '-' for better readability. This will break the tests once
> linux v6.9 is out. Act in advance and accept both forms.
>

Fair enough.

Reviewed-by: Kent Gibson <warthog618@gmail.com>

Cheers,
Kent.

