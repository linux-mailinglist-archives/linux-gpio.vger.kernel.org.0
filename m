Return-Path: <linux-gpio+bounces-23678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7532B0EEB9
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 11:46:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6E42541FD4
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Jul 2025 09:46:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 545551F1302;
	Wed, 23 Jul 2025 09:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YqHCRFSz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF942E36FF
	for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 09:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753264004; cv=none; b=EcL4F/4wllhhdXFL+OOt5RmP2T34RyevrGjzuqJIyYQubtOu8Zzz4rx1EDtWrHoh8xQKNnElgzZWYG9aGRnGL2Bak43Nibu/9JD69AgAeFcsIDbjkGmn9PqMvuV1pZBQW54c5QUKc3IQMSCnq8UnV+56SFm46tRij0oiK+R+iXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753264004; c=relaxed/simple;
	bh=X/PR0PRgA4e2fuEyDa+coiF1KzAW9znsEBQitg3bbmg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wotndvr2V/JIL51Ke3r7vmuRHdN7+mmdWS9z/kd0act+t88T39ZwwYvv45EJSk8nlhR9e+SdBLOqeitYNMkE+WMCSuzFGJpM86haojMGcciaUDKOZ9Qr0tSlP7xMZEqwIMrIY8Euei7jcLgwEmwPdUBzCuvhyuQgskycnvtvDo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YqHCRFSz; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b3bcb168fd5so5513084a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 23 Jul 2025 02:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753264002; x=1753868802; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jno4kb+0r3Eh0JmMv+de6pmIxPvv6kLDVryCSktYOVI=;
        b=YqHCRFSzCPes20FROwex8DIu45L0mBzDBHDre+LjvdnFyI/7Smrad0Q3D5eapv6IDU
         xGkh6qpHsaKNknXgd1lyLc4yHaly8kKe0vQm6I+bkjrx06WW4HGkQ0+34C6BgKK06xRQ
         OsMDjg8KGWi5+4pIaIHEbh3iYD1ri7sAFep4qwsapgcqX10PcWUTmrjTqSj3Gx6XIKsp
         xEHKJVFj1TL21wSHlulOB2wPCrdCUJWlMpvH/ODolCpi9I/KR9FmYHhjoyQQlwfH7HVW
         eNqKeCrBZF8V1lXTtaWIMHTl6J6xIt3RfXr0elWKdni4uUV6A8qTMfDDENxJraoX8E0m
         E6zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264002; x=1753868802;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jno4kb+0r3Eh0JmMv+de6pmIxPvv6kLDVryCSktYOVI=;
        b=gktHKTxA1YSSw1W7MjTo1EaigEIFR+sj0gVEmq4Kg/AlIAIfWscR5tTmlAHfc/FZ/F
         cH+zcfP6sJdBRljLhWHibsBUl9uYpEFz493l9NVc48z+F6ReE4uj1FYF05QClnerHT52
         K0WwQJYaOxvMd5EKBGeE63SwgmHBcXSwLXEr3GdgVFBOA3Zjs/g5bQ5O1DM27ZJzUWOc
         skP8NfY5SwysSx3igLQWQqVvSFtr0zZUIwcagc8/02F3h0cKzFk2GbhRfLvLmPqJgU0e
         rR9hZj65FaaeKK1PgiNcEB1oKRZyXMBz5k1cFEZmAbeUfTixlOh55uwL7IQSVNSk2v88
         4/3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWEqgoLm2QyJIEUtRvY1voL+iZTIAhGJ8U/nk2Ge3z+G7iZ9ndheB6RfKFeAuZXXPMe+18mfdbknd3@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9sRzmjoKffJvWD69yBYLmUsjdxx8a+q/d8mpLqH0APbb1h0aS
	edBFVLWzXOkltrGTUoDLgg5k9rSkQJ3WqOQs3T48mGrDIiV82XCXOCu0Ksgy2wJiTUE=
X-Gm-Gg: ASbGncsD6yLEdxQOAcIYq1aXpt87EQCt8D9NKYRvBcPPJ7sjzuceFfcR2/9t37XmimB
	1cOjSkWGd7BjRqQHlvRm9N5my5p/UDIRYfVJvsFz0Rm7+XQ68UBgcNNrpJvb+wNVsExkZ6QFVbY
	bY6hPo9fWk09ZzWk73DVkuEkNnnHev04/jFaLe81kAxvmrqHwhBCkegixynE6VSOz52sYFiBG5G
	IS8onkV9hxz4q7RB0kedtyyo6ws/NlGm7sYh0sXojrtB2V1Zm/rfBcYMjHVRhclDWRxppjMoI5l
	n+Zo9Qr2pmt14e4aKhY3fq3hvA9PiiRZqsUYzXF6/52AANJpULpvx+UPcIqa2+6+mMm6stz7U1G
	TOWJb9HetqgQOcU77RSDrlRo=
X-Google-Smtp-Source: AGHT+IFdw+7+WsFMpQgZ6qMfcrb6OBuYDYZ+ZzE+z9KjPLyhgS7a47T9gZVM3wOQ+9LKHCFjd1+3QQ==
X-Received: by 2002:a17:90b:6cb:b0:313:1a8c:c2d3 with SMTP id 98e67ed59e1d1-31e508172ebmr2883625a91.22.1753264001884;
        Wed, 23 Jul 2025 02:46:41 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31e51a12413sm1261833a91.23.2025.07.23.02.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 02:46:41 -0700 (PDT)
Date: Wed, 23 Jul 2025 15:16:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Erik Wierich <erik@riscstar.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH libgpiod 0/2] bindings: rust: update examples
Message-ID: <20250723094638.i45h6swammhipw3a@vireshk-i7>
References: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723-rust-examples-imports-v1-0-4c87e07a9b79@linaro.org>

On 23-07-25, 10:16, Bartosz Golaszewski wrote:
> Here are two small updates to rust examples. Fix automatic formatting
> with rustfmt and unify the way examples import modules.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
> Bartosz Golaszewski (2):
>       bindings: rust: fix formatting in examples
>       bindings: rust: unify imports in examples

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh

