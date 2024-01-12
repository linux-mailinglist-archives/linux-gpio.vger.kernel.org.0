Return-Path: <linux-gpio+bounces-2174-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A40BD82C2ED
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 16:40:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4A8CBB22188
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Jan 2024 15:40:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35A96EB69;
	Fri, 12 Jan 2024 15:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnPVMybY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460076EB4B
	for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 15:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6dac225bf42so3671376b3a.0
        for <linux-gpio@vger.kernel.org>; Fri, 12 Jan 2024 07:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705074035; x=1705678835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+VTeLuD/DkQbJiNOofn8cuFIbDm25Gcx5oYeWEYznk=;
        b=cnPVMybYlQulGTFvWQBIeEkoamYidcpwJG8Q50jd+mtfDi525aTcQobU+7/K3nq7Q3
         vweoIcCpLDnoKdFuTEiUS9A3F+7SGF26q2Pp3Kh/+ooSsPpZhVK1wGGjXi5sUJf7tN9y
         GUs4gSFffx4ct6t1M3abOA3pD1wyr8vbmqo+Jy93X3C7fnS/gP7NgJVpjjHWipC9s2nz
         CI21rVeKwhKsw7QjrDlk3QoLA4ikccMU1pkQ5sETvYR2XKBgbKvJIY8+9hg6RlGpzfRC
         oyz3wp3LL1z6yMqD5bb+vNuFb3FjSseyegctHseEmuV/Y8EaEECvMg4iNZI7vkiYVNeQ
         MPyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705074035; x=1705678835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+VTeLuD/DkQbJiNOofn8cuFIbDm25Gcx5oYeWEYznk=;
        b=T6cwLPHniwrPCNHjl+8LYBuXu3XnzUcO+wPFgBb9+xyPyMzvEMe9oPCZv9zBjGKcYY
         ov2h4ErNh+ieIDC5Xwl3KuKeEIDWEZnzZCvcj6CvWkl4VN4adtAERBWlJ3fAKtwZ25sy
         6mcEA3DnqnrRHz0s1fH6JF+D+dUXgeaWY4Ekf+9nUARuMFWtX1ueD7kwoktmT/FFsIc0
         jmy1hUp1gVnpaS1lK8X4vICToiFelBypAiu2tNYiST1fLAPjBuIDrXJLyjume73SKRlw
         63rhqCg37qyk1NA5JoryUcc88+n3Ss9BLtTh7SLsjEQtQ8QFi5bJ9hhtmjZOL/bLy3YC
         /LCQ==
X-Gm-Message-State: AOJu0YyM56vc1diuQpKoeFxxpn+3/msjRdiQh5M/sm3iyfKaq4xsNWas
	cb+DwWdyJ63Ddj2CxY+h1aI=
X-Google-Smtp-Source: AGHT+IG7xgG9oSqb08AI29Aa/Urq88KZulJWe4qqXG6i1u52DaN4E9YsBZwRZMSzgKO0TpXYyRlsYA==
X-Received: by 2002:a05:6a00:390e:b0:6da:b959:c9e with SMTP id fh14-20020a056a00390e00b006dab9590c9emr1210669pfb.29.1705074035548;
        Fri, 12 Jan 2024 07:40:35 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id bj18-20020a056a02019200b005c2420fb198sm2894973pgb.37.2024.01.12.07.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jan 2024 07:40:35 -0800 (PST)
Date: Fri, 12 Jan 2024 23:40:30 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Phil Howard <phil@gadgetoid.com>, linux-gpio@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [libgpiod][PATCH] README: add info about the github page
Message-ID: <20240112154030.GA94712@rigel>
References: <20240112150546.13891-1-brgl@bgdev.pl>
 <20240112152502.GA92656@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240112152502.GA92656@rigel>

On Fri, Jan 12, 2024 at 11:25:02PM +0800, Kent Gibson wrote:
> On Fri, Jan 12, 2024 at 04:05:46PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > The github page over at https://github.com/brgl/libgpiod has been reopened
> > for bug reports and discussions. Add a link and a mention to the README
> > file.
> >
>
> No problem with the patch, but the github page itself seems to have
> Issues and Discussions disabled.  And the Wiki might be useful too?
>

The Releases section could use updating - it lists the latest as v0.3
from June 2017!

And unless you intend to handle everything that lands there yourself you
might want to add some of us as collaborators, with appropriate permissions
for what you would like us to help out with.

Cheers,
Kent.

