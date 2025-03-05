Return-Path: <linux-gpio+bounces-17118-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 350E6A50090
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 14:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75A2B3AAC0B
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Mar 2025 13:31:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 076FA230BC6;
	Wed,  5 Mar 2025 13:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ixMfqL77"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42202C2ED
	for <linux-gpio@vger.kernel.org>; Wed,  5 Mar 2025 13:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741181513; cv=none; b=N9DA+6upyQb3xORH94UkhEZsaFaplDhFP68nqCK9NyryIeEARSTM9WShWMAAtKPFGDO0jHUDV7yJ74Nb/u9jFuF7ymBNQK02JJkGrVH2XtgktyzuxriTPAM97mlrcj42ZsjXMn3CqU5Bw/6TLhzqr9X1pDcGLaZQ6FFIOpequ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741181513; c=relaxed/simple;
	bh=u2oWUXx1pOYjOKkp+cRuBclke+M/qTXSU/sDancxH1A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bULGJD5PIyuXM1jdA5ZX5MxS7X93zTbOm9rYtPYLaWjtl+ZcaFJgHbRshUCJbE3aKWWA4qVOkfoY9TG6DiAX+fp4CpQnadNPxDIJtn1QUn5IBfokIHpYSZkJ3peLnZBMzqAN16NQ98QAkRBNCBB4+eHwAwkC1QzhIW6LMOP81DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ixMfqL77; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741181511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0dqn34a07lKcr5dJFV5JIso+d1clQqATo1u77Mk28XM=;
	b=ixMfqL77o04kWdrF/qK5cKQJNhc7GeCKyRgH3FYAT9OfWZ4sBwQbflieqvHW/u0eDoiIKw
	HvOrrozQrmgqlzyngCv/QiHuK1T4rT79ygC4+lB/uYJkbRc/X65mEA2jBTQrxvwnfE0TyY
	0g544QbjKAFyXw5ALJKfcUChH7dhjSM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-512-sy2L3v9OMvSUTgaDunmOmA-1; Wed, 05 Mar 2025 08:31:50 -0500
X-MC-Unique: sy2L3v9OMvSUTgaDunmOmA-1
X-Mimecast-MFC-AGG-ID: sy2L3v9OMvSUTgaDunmOmA_1741181509
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43bcde3f887so12180265e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 05 Mar 2025 05:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741181509; x=1741786309;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0dqn34a07lKcr5dJFV5JIso+d1clQqATo1u77Mk28XM=;
        b=D9xKAbjM0r39DBOEhaHrk2dor8H5MSdSe0Ytinl68grxPXqqhNvHdF7JD04o5hr9Gu
         dUB4kIGIsFM+sEsBPxKlUpfZ7B6Ouh/o6vlwXz4U4HO5L01y6MvwoSzCqTFr84J37355
         w4c+F2AUmFl6U7+x/qNpTiieQg05JM/prAebNKH7nQCCzzP2E8qjcIAWV58oNQx9FC7B
         SP927Z2UkboXJmAK5ydy0fS5Y3hp7sQIbNzDxHJw9YDsanDKu1p9MFb/O3YG9+cMBWB9
         pmTLCKxdaRuvEIsBH0GAr5J2ZhS6vedIhtCMlg88kTd8n3otH9ZoXuU7ydtDcMxYwshx
         LLSw==
X-Gm-Message-State: AOJu0YypP97Ei03R29j9QQrpF/3h3OWItAodnArkxVGdTyTNZvgeUyDC
	78n8sGyEJqVpf2AgQ9QCjvFkyAYZHqNPiY2Xc753DMYCJ4iBYw+n20bDiAh70upgXVWaeWJuAI8
	79AZmqrUfxY+GJtU6n2dgXPUDh89ABoX713oivVO0JgvLdpfDbd2a5CObsos=
X-Gm-Gg: ASbGncsHdo4yM+4ppsehIqY5jCCXZc1+nZ97mGsn3EslmrpCiLAV2uAjCgsQAgZsRBq
	ie96rtNu12C4YtaxrzX2Ad6BxLiuazPAGAYGt0fExn/LvX7hVztVTT9eJ6SYC0ZzfJA1Ua1qIQF
	M0PgkyLDwOcOGFo3f8MBJlVCw8QISxetVEVMl+WnGJyHwFGw9WIMQwkJ10+qM/ZHEBVpm7AOwXX
	+vE3dAghJP7GQ15KpJNFEzYe1E3XDsxVm5WJrSfSqDlDkI5Jsy2e0BhyetDjL4n6GJT1LXQ44p9
	7NDSTvyuPEj+LWUZdOW0kQ55n/VbMtQ8VKOurPBVmtCFRu1b+hGXVE8i21zKOmpx1+0UQvGxnQ=
	=
X-Received: by 2002:a05:600c:4ece:b0:43b:c94d:e1e2 with SMTP id 5b1f17b1804b1-43bd2ae54bcmr21140235e9.25.1741181508717;
        Wed, 05 Mar 2025 05:31:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG7F9v/2ONxk8xFOjzjpCwwBkyc6Bvd4KwZ9m8e5e3MHZoEGLxssf5K5UetRRU+tpmyYly/Lw==
X-Received: by 2002:a05:600c:4ece:b0:43b:c94d:e1e2 with SMTP id 5b1f17b1804b1-43bd2ae54bcmr21140075e9.25.1741181508323;
        Wed, 05 Mar 2025 05:31:48 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390e4795da5sm21372477f8f.15.2025.03.05.05.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:31:47 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij
 <linus.walleij@linaro.org>, Yixun Lan <dlan@gentoo.org>
Cc: linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] pinctrl: spacemit: destroy mutex at driver detach
In-Reply-To: <20250305102710.52762-1-brgl@bgdev.pl>
References: <20250305102710.52762-1-brgl@bgdev.pl>
Date: Wed, 05 Mar 2025 14:31:45 +0100
Message-ID: <878qpj8uym.fsf@minerva.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Bartosz Golaszewski <brgl@bgdev.pl> writes:

> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> The mutex initialized in probe() is never cleaned up. Use
> devm_mutex_init() to destroy it automatically.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


