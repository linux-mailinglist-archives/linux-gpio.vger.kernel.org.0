Return-Path: <linux-gpio+bounces-6176-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DAF8BD95B
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 04:21:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C142283D82
	for <lists+linux-gpio@lfdr.de>; Tue,  7 May 2024 02:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E672E4C6B;
	Tue,  7 May 2024 02:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tt4Z8jAa"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AEAB10F2
	for <linux-gpio@vger.kernel.org>; Tue,  7 May 2024 02:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715048472; cv=none; b=jY/i5ETfe95VrOuOVUWjhcxHm4kl9O7fPsOZzJUj3FOtTh64EpGznRXfIYi1PRuwSv6TRjFTOAKCsnfvWVXmFZZZZkYGY94ONMkDPWmRqgQYzgzqxpRvPsnVV9172M4Ld1ieGId0ukITV/B0X3HqanWBXYdWadIRGNcRXfADMCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715048472; c=relaxed/simple;
	bh=Ge3JevKO47oC1tvWtGBHLAEVqOQwPJWczm8zrCtGWm0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GRjBYYti18P0gJabM7Y6g/iOVU88vtoywgf2/Rqkx8JtLj5i/h0EvZ5sYrfCjfChMoTIaWxv9hpVToCYL4cvIHEV9bJDSgjhtFSTr5bVWazhe7qZlh2Z3za7EGtflvPTFEsR+bDrFbv8JK3FpvFxvE37ofQjPhMbnlwSvI1GC3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tt4Z8jAa; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f44881ad9eso2074233b3a.3
        for <linux-gpio@vger.kernel.org>; Mon, 06 May 2024 19:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715048471; x=1715653271; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FbrrCEZq7+2htqDN6803THiAx0hhELu9ZM/tn9kyGJ4=;
        b=Tt4Z8jAaWec0wuiVcV6/kG7GL4fQvNO0A42oj7IJ82AD5QNuCP6/nH8T+/v54hsoGP
         G86yMzgNe4AA+lHnBFPRqhXfLH5ukX2gPWQeN63vvAMJhw+9geYVev7yu/Blmn4TJf2c
         r4DaF98Uz7CFh91A+x5ysdO2QWEeIyugEFHqQPnDOIfSHYEVwvfF6lZWFhRPtGeL0Fu+
         no1IY06i6lXRlo+FIPnLGpZeuz4Rm8Gtlv7H0nuPIy+MyuRunK6xhmX2XQP1FD09OXh/
         Ar3TNfryC/cNZSCAxMMnE2wVsn6ha5bCER5lb6JOUgxckwd0VKxyc45M7kZhswbEpdLd
         yTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715048471; x=1715653271;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FbrrCEZq7+2htqDN6803THiAx0hhELu9ZM/tn9kyGJ4=;
        b=Vk6c0fxburQnh75Mv1sGRMnR4VMq4kALuoSMkj/9S8BqYlHjas3C4fUZ+VqLipWZZp
         UMzVyj7dP18/zxBRzeztwe3jTnnK1RlfbULpa+zbGdSowz2E4gwl+O9L3mxHT01/QFKS
         /+jYHjHm17D++nrVJu+vPUuCa8OVW/FyobPfTGqpZTJuXf7u9xq52W359TK95FN34oBj
         wJ9WH90rDcjK5V5zO10i4Y/J6OJ0pTLFPM/3gY4iDzKiggEacE4OMCTTmflAG9yNl90m
         TU4vWZWoun5x7tOzxa0LZEAvCp0OwZ4u7U0Wm6zxuq7KA+1ekLV1h5HQ7FpUnAAw351H
         cmkw==
X-Gm-Message-State: AOJu0YyIGWGPZrUImCMNJtaVMyYRXdprStORsazoolccbdLdZ7lGyAHo
	b5yZOu+HsTO9zjRqx420VSgQz2Qlj08wtogTuVLopmMx4+NIHQ+4D3r22g==
X-Google-Smtp-Source: AGHT+IGJMHYnI31Z6n24Su2+zjueI1nrTEWH0Xq5dw0aB5uPMQuKvHBbUn4R9I6lotanPfoUEIPq4w==
X-Received: by 2002:a05:6a00:3a27:b0:6ec:f9d3:d0c6 with SMTP id fj39-20020a056a003a2700b006ecf9d3d0c6mr13686122pfb.16.1715048470585;
        Mon, 06 May 2024 19:21:10 -0700 (PDT)
Received: from rigel (14-200-166-65.static.tpgi.com.au. [14.200.166.65])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7838a000000b006f456b23f90sm5235159pfm.31.2024.05.06.19.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 May 2024 19:21:10 -0700 (PDT)
Date: Tue, 7 May 2024 10:21:06 +0800
From: Kent Gibson <warthog618@gmail.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org
Subject: [libgpiod][RFC] helper functions for basic use cases
Message-ID: <20240507022106.GC26136@rigel>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bart,

I realise you want to keep libgpiod minimal, but in my latest survey of the
problems that new or potential users are finding with libgpiod the most
common one was that it is way too complicated to do simple things.
They just want to request an input or output line and play with it.
They think that should be an easy thing to do, and will completely write
off libgpiod because it is not - the learning curve is too steep.
And they have a point.

I've raised this before, but I think libgpiod is in need of a small (and I
emphasize small) set of helper functions to simplify basic use cases,
like just requesting a single input or output line.  Maybe functions to
control setting bias, edge detection and debounce on inputs (using
reconfigure after the initial request).
The functions would be separated from the existing functions by naming,
e.g. gpiod_helper_XXX, or some such, so there would be no confusion with
the existing.

Any chance your position has changed since last I asked?

Cheers,
Kent.

