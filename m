Return-Path: <linux-gpio+bounces-30001-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 28889CEA321
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 17:40:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9F31F302BD19
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 16:40:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F15A322B75;
	Tue, 30 Dec 2025 16:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CDo8618x";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="tGsVd1OR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BFC31A807
	for <linux-gpio@vger.kernel.org>; Tue, 30 Dec 2025 16:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767112839; cv=none; b=KAfi4ShUwstDoaUw+5eBXVGjw6lbICO7FQjegwPSqz+SYqT8J7dmd331OJu2ENmIW/OaxaMbuC92hemovNYoKaJmzIXYnioPSBG4OUH2HDP9IT75iYTGK9Eskc8BPOVciXKl4rA4GDXq/6lNcFBG6p9He192S+c6LgfDLYB1zdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767112839; c=relaxed/simple;
	bh=R3ssxNR/IfKvvzigNkiBKuIwzZmdFCE30Vek2VE5a/c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IMBE9Wexaz9DEiH9YdrB+vmLT1Ex+H0lVkfR8/V65Hp0Wk6HlBeGK2BNyRGlZdhYzuoCuw+igQFwa/e1ASQvxs6mzj5bfFMYf7+6SgU9nEP2cuACmTmvagUhXWT9xmZJzvnzc5+7uZeqqOjX1onF59UgazB4vCglVkJPrIZtb+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CDo8618x; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=tGsVd1OR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767112836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7J8z1fD7DSMGZ6iKBx0OqXIx7XfW+ZYePKweShXuH2A=;
	b=CDo8618xqajMYlrIganDweT8AiGYtCkoWL2waz6M6UJJ78xULg6Xf2r37MrUCzU18evdkK
	YPMeCIqdnKCMkyIKoc9m3X1R86c2sn8+7/6qBkCYPvCl68I17EVe+Rpai7To6YzRaVdRAF
	9xDz/cUdBFkP/auH7HPtWHP0TFdclfw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-zWFJb6YzN5CrV8Dxau86rQ-1; Tue, 30 Dec 2025 11:40:34 -0500
X-MC-Unique: zWFJb6YzN5CrV8Dxau86rQ-1
X-Mimecast-MFC-AGG-ID: zWFJb6YzN5CrV8Dxau86rQ_1767112833
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-430ffa9fccaso7916529f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Dec 2025 08:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767112833; x=1767717633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7J8z1fD7DSMGZ6iKBx0OqXIx7XfW+ZYePKweShXuH2A=;
        b=tGsVd1ORU0Eh9v8efXZT1lh+FgCYbl5O7LiFefA28EVmRKhFwjKIK+BkIFPA+HquNW
         I/iCySQ/Hi/bFw5TujZNT95fbDuwnDGI5r2pHqghiLDrfJvQvWAK2OtX6kVUYKSdDHP5
         MzILer/dNKCGfsj9rQs5AUI4Y6CUNV8J6pMAB2WE94zrFEkLHx9rWvO9YDwfm5VrO+VR
         Kl3R35DSLBsN9u6Q9JLMx2Ew0qnQqn4QpfMGN6a9DbosJnFKLKUNTjaoDhXVO+Oh0812
         dSSgXSlQks9mbZxqnSW/569qUnJLt2nbu1hdPQdOW8Hob/Bsg2dhVoSViq+DAHYiHGpJ
         1LGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767112833; x=1767717633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7J8z1fD7DSMGZ6iKBx0OqXIx7XfW+ZYePKweShXuH2A=;
        b=n3N86L5THTpWpZAOoUN/OMx1K+LY84Kj9VL6MqnksUlv4rb+19oCzQllT/EaQx6v7V
         F29IzkMSTlLrxOKhoDRueumwdEnSqilSE7uCrj6pbG2g3LxRnn9DdIHDb8xjpx67uff+
         hA4PiOcdKOHxqmGwrJBHU3mqX5E9RMQ4DgKIz1lgJRxs4TYnzOQAGQwcGoHcOQbOz8JF
         BN717tbbZesG2q0bVTQbTbR0VqREvNf3w5a6vAHV/kZVKj3Ze58bsUwZ5gyxpvA2Q1M7
         MVFu9vNzkgTSVK0vEIxqQ7Hs4dQNQGLxV1S/MjZPWPyduX0ddiHehgtnhAd4haZLvGr4
         l6eg==
X-Forwarded-Encrypted: i=1; AJvYcCVsskHqpqCju9m/t0/yJX6jDt/83qYgIkRSjWaCSnVlTHE1uSn6T5bYcwiebmeJkAZV4r1ty1nz3DNH@vger.kernel.org
X-Gm-Message-State: AOJu0YyR9XvY0QF/1cJVny80YJ3aVIOF5CSloKKQ+GLacRN3quG9GGIa
	P3QzFzoZanM/Ni9pLpLQhOeMm2FF5VxVm6gtRD9k7hEupiPAr8KQj7uxch5dK+PWElabVPCNVXQ
	2flfkoiYHXM3s5mjKRcN+wyyVC7boEtwoXB4dK9H/ubr3Xdnbdgp+epo732Zbf2s=
X-Gm-Gg: AY/fxX6Uz482vretpHf362+XutfkuMx/xsKhojMmVHSV8BWlfeOnOX77yVQEdEXXSII
	hhguGhk7qC3NWxXiuloethaeqsHINf2kxvzFPT3WZyVdL4nF/jxVHn8fHpyIqwUSETcIVPx5LVW
	10jzRMhBuS3lw0l+EYdM69rx2Nv9v4NnTdLIbg11/uinfweclRWsfeHyI1FYdvRf4Vv+w70tv54
	7Qex+hwiqNDCYqTUUt6f2ShCfd0IjZqSrHozv094bjTUZrW4807iZWSI7UQZrZI7dhtnEEHu9n1
	nyb+JH+MTF/Najk6xuR4rlXdS1djivyCvK5YsOIh3391gLQSolPEczUJmdw7raSWD853JhtHQAC
	f9TRExQt5UH2No6Z5Kcc137NJInCyVZVMUA==
X-Received: by 2002:adf:f144:0:b0:431:855:c791 with SMTP id ffacd0b85a97d-4324e4c1501mr32588437f8f.3.1767112833335;
        Tue, 30 Dec 2025 08:40:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECVSdNBMTG9k8N96cOa931b+MOajxv263SWbXaTmkKbkTS3ub+IC9yjT+L/YMFbjvC3biqWw==
X-Received: by 2002:adf:f144:0:b0:431:855:c791 with SMTP id ffacd0b85a97d-4324e4c1501mr32588393f8f.3.1767112832791;
        Tue, 30 Dec 2025 08:40:32 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1aef7sm69573295f8f.7.2025.12.30.08.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 08:40:32 -0800 (PST)
Date: Tue, 30 Dec 2025 11:40:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Cong Wang <xiyou.wangcong@gmail.com>, Jonathan Corbet <corbet@lwn.net>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Jason Wang <jasowang@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Petr Tesarik <ptesarik@suse.com>,
	Leon Romanovsky <leon@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-doc@vger.kernel.org, linux-crypto@vger.kernel.org,
	virtualization@lists.linux.dev, linux-scsi@vger.kernel.org,
	iommu@lists.linux.dev, kvm@vger.kernel.org, netdev@vger.kernel.org,
	"Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Subject: [PATCH RFC 14/13] gpio: virtio: fix DMA alignment
Message-ID: <6f2f2a7a74141fa3ad92e001ee276c01ffe9ae49.1767112757.git.mst@redhat.com>
References: <cover.1767089672.git.mst@redhat.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1767089672.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent

The res and ires buffers in struct virtio_gpio_line and struct
vgpio_irq_line respectively are used for DMA_FROM_DEVICE via virtqueue_add_sgs().
However, within these structs, even though these elements are tagged
as ____cacheline_aligned, adjacent struct elements
can share DMA cachelines on platforms where ARCH_DMA_MINALIGN >
L1_CACHE_BYTES (e.g., arm64 with 128-byte DMA alignment but 64-byte
cache lines).

The existing ____cacheline_aligned annotation aligns to L1_CACHE_BYTES
which is now always sufficient for DMA alignment. For example,
with L1_CACHE_BYTES = 32 and ARCH_DMA_MINALIGN = 128
  - irq_lines[0].ires at offset 128
  - irq_lines[1].type at offset 192
both in same 128-byte DMA cacheline [128-256)

When the device writes to irq_lines[0].ires and the CPU concurrently
modifies one of irq_lines[1].type/disabled/masked/queued flags,
corruption can occur on non-cache-coherent platform.

Fix by using __dma_from_device_aligned_begin/end annotations on the
DMA buffers. Drop ____cacheline_aligned - it's not required to isolate
request and response, and keeping them would increase the memory cost.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/gpio/gpio-virtio.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 17e040991e46..32b578b46df8 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/completion.h>
+#include <linux/dma-mapping.h>
 #include <linux/err.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
@@ -24,8 +25,12 @@
 struct virtio_gpio_line {
 	struct mutex lock; /* Protects line operation */
 	struct completion completion;
-	struct virtio_gpio_request req ____cacheline_aligned;
-	struct virtio_gpio_response res ____cacheline_aligned;
+
+	__dma_from_device_aligned_begin
+	struct virtio_gpio_request req;
+	struct virtio_gpio_response res;
+
+	__dma_from_device_aligned_end
 	unsigned int rxlen;
 };
 
@@ -37,8 +42,9 @@ struct vgpio_irq_line {
 	bool update_pending;
 	bool queue_pending;
 
-	struct virtio_gpio_irq_request ireq ____cacheline_aligned;
-	struct virtio_gpio_irq_response ires ____cacheline_aligned;
+	__dma_from_device_aligned_begin
+	struct virtio_gpio_irq_request ireq;
+	struct virtio_gpio_irq_response ires;
 };
 
 struct virtio_gpio {
-- 
MST


