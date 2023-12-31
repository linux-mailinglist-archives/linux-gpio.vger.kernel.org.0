Return-Path: <linux-gpio+bounces-1942-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1453820982
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 03:02:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B91681C2154E
	for <lists+linux-gpio@lfdr.de>; Sun, 31 Dec 2023 02:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5549A50;
	Sun, 31 Dec 2023 02:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h4PotlQh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F94AA41
	for <linux-gpio@vger.kernel.org>; Sun, 31 Dec 2023 02:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-7ba834684abso400767639f.2
        for <linux-gpio@vger.kernel.org>; Sat, 30 Dec 2023 18:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703988153; x=1704592953; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ehcSKmQ1dQlrIWswkaqwu7XFqi0EhtwPipuC3J2hg6s=;
        b=h4PotlQhsIRmksvHrSDkr06UCqkfL1r+p45xopDRaJ/ITCGnAOfxUMnPW5HyEENNRO
         4BJReixmbp0cdAcnuCdZO0PGjgLvs9nMCX1EPdqsuv+4n5KaV3k6iaIh30/cDycNcwzv
         EeTdUF23BpCTTnvKHt0f2RURBh6962f5cRe0BLgIdYOBFCai2FoVSNrOYGeVZ0dFDjuF
         YhCeyNavLSlnfiLHL67Nd1d9nfHNB9JjeJLMCAujdLLWChiUkpIUmXzHA9jJHB8HkoQX
         raUldp8AwvsSfUIwWxInU9UuU00QKwBSlsNEg5LtRAFJkCKUhOQk4M80cKKwzxfogDm/
         1DpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703988153; x=1704592953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ehcSKmQ1dQlrIWswkaqwu7XFqi0EhtwPipuC3J2hg6s=;
        b=YEIOKz1gMDn+RkcI3annw7fddUFAV8r2Z5C5vlfCGIkZeh5HdAjZ8yICgg30Qth1v2
         V8uHCN5UFUHbg+96jZjaW6rrg1dCkln22GVGC28poJXjgX3lBbu5cjohI0AQEe1zV5gi
         xlQdgEsqS1JCEZDoazhlJGbM09JSRcxSly0msuqa9c9XtwjRnKsQgS08wlkfReuDvh/i
         LYpLgb2EjOA5vo+WfcO32usvT8c+Cf7DSt9PjXY5RVVuN1R/JaN/eOwy3sld1BKWA3Rq
         7LieRHsxu48d3ghpi08nTCiia8qcTwEvdPC176yNOD9qQMX/2GbQ/DoyWMY+FfWZP8iD
         lasA==
X-Gm-Message-State: AOJu0Yw/EMK879hEcNHsasWZNw5dyhmRiTQrJgvOZDgu+Evm2qI3a4Hd
	fGm+AFj82cREbTFFZ+CCxUuAUufU0Qw=
X-Google-Smtp-Source: AGHT+IEViy9STGDjSN897ehqt0ba70gMSS5gTqlCUrXLH4QHzWl56e+wQ46Xec0MH0moraZ+85T3ag==
X-Received: by 2002:a5e:d714:0:b0:7bb:398d:d789 with SMTP id v20-20020a5ed714000000b007bb398dd789mr6707807iom.11.1703988153374;
        Sat, 30 Dec 2023 18:02:33 -0800 (PST)
Received: from rigel (60-241-235-125.tpgi.com.au. [60.241.235.125])
        by smtp.gmail.com with ESMTPSA id v3-20020aa78503000000b006d7f1ae421csm17996878pfn.145.2023.12.30.18.02.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Dec 2023 18:02:33 -0800 (PST)
Date: Sun, 31 Dec 2023 10:02:28 +0800
From: Kent Gibson <warthog618@gmail.com>
To: "J.A. Bezemer" <j.a.bezemer@opensourcepartners.nl>
Cc: linux-gpio@vger.kernel.org, brgl@bgdev.pl
Subject: Re: [libgpiod][PATCH] line-config.c: Fix library enum used for
 kernel flags bitfield
Message-ID: <20231231020228.GA8143@rigel>
References: <Pine.LNX.4.64.2312301347330.29540@wormhole.robuust.nl>
 <20231231015727.GA3304@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231231015727.GA3304@rigel>

On Sun, Dec 31, 2023 at 09:57:27AM +0800, Kent Gibson wrote:
> On Sat, Dec 30, 2023 at 01:48:53PM +0100, J.A. Bezemer wrote:
> > Library enum was used to sanitize kernel flags.
> >
>
> Rephrase to make imperative and better describe what is being fixed.
> e.g.
>
> "Fix deselection of output direction when edge detection is selected in
> make_kernel_flags(). Use correct flag to perform deselection rather than
> a library enum."
>

While I think if it, that also applies to the subject line.
And that should probably begin with "core:" as it indicates the section
of the code tree being modified.

Sorry - more nitpicking.

Cheers,
Kent.

