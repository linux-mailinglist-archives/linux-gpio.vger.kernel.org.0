Return-Path: <linux-gpio+bounces-30002-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4D2CEA31E
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 17:40:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 315BD301D63C
	for <lists+linux-gpio@lfdr.de>; Tue, 30 Dec 2025 16:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 147073246F4;
	Tue, 30 Dec 2025 16:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PH7LuFAs";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QcCA+7eU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AF33242B4
	for <linux-gpio@vger.kernel.org>; Tue, 30 Dec 2025 16:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767112842; cv=none; b=c0clI8lbVvP79wqS/2sIM+SeWLRKImoocDUQgwxZ56tJ+wTRKYlscZFOifbjs2yw7PITCGM6zMJb0p0RB2Xy+BKiwpJ1wniFn+46msJyJ342wb7t31TfCeY6IR2z6yaVBrWQ64ub40phnaoOQZjnFGypwIKA8MQPzec7lccidDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767112842; c=relaxed/simple;
	bh=rJvyv/DkZDnTdlk5mMz+iorYKgEElNGmDI1t8E4mVas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcgWk93Ad0np285W+MSy2QmRlTopdhY6jH9An/M1uufMDolz2hQudXluJJ2hUQlYNMBEavLQrr4CmXoDuE/hNHo9QiYJDAmIm+l/AMszL+bbm45TamP+IeQa9Eai3Zt20TPY/9pfktCBCrD1uAjVIxt+NkeKKro2j8QGgX2ze2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PH7LuFAs; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QcCA+7eU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1767112840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RGewFge/6sMWyfD/6+VNEsuf36DWmJ0Q3xqEbJz+f7M=;
	b=PH7LuFAsj6XUk/4EbdGhLB7ISzz7kfm1g7oyx9y3XcUiyKMEa0BuFourlWUkkJpI7KaH6z
	zPLa7j7LiCDgNlBZNOKqezN6WUIounga/WNnWFpFmLc9Y+/VdByBk7jzhmhTHsxBRFbpX3
	TztSEUUMKL7FTjEWi8GQKqU1mw6Yh4w=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-27-To2GLP7jMlWBcl6L5Mq67g-1; Tue, 30 Dec 2025 11:40:38 -0500
X-MC-Unique: To2GLP7jMlWBcl6L5Mq67g-1
X-Mimecast-MFC-AGG-ID: To2GLP7jMlWBcl6L5Mq67g_1767112837
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4325cc15176so4728904f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 30 Dec 2025 08:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1767112837; x=1767717637; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RGewFge/6sMWyfD/6+VNEsuf36DWmJ0Q3xqEbJz+f7M=;
        b=QcCA+7eUvHQSy2dgFoIzSSIP++kP8Av+SYabpYIOYZ7166/HrUbm8Wno+lYddS7XTp
         pu4owh2Z3XIEfihGTtHc0VouJz2I4u6P2oJK77qlOPqpIXGrJuKYJq45XfPN6ZT2q6KF
         7CpCcVP1lwHuwAdPm+yWlId1+YfXzkTXN+2e96HhbGEh8HNerWSrWqwLJAQ8lDLbCZ8I
         i7/KnnYBnZO/cxr1ICKKJvD1hjBvU1YnimyFfTST5YTCCJwLe7fBZrfij1ORvxy5Q3Tx
         srQFSAFtQaumOEHLJiA3iZKM9yr3kTeeG2hdS3jXfIqmNnmCszDLRXgTTDAidcDg4R6o
         yHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767112837; x=1767717637;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RGewFge/6sMWyfD/6+VNEsuf36DWmJ0Q3xqEbJz+f7M=;
        b=ZCTLvazEXhfMInXT+JzyLp+BJuQzLLscvDC6yUDbZxD60EyS9IdiBH0832cn6y6hOv
         YeiqQ4qzh+ifN86a9EeBF3ij3RVe/Nhryzu8frhRUDRW/MlMaiVHq1CbBhONel67kOMM
         BvA/vLJOSBCq7/pI3B9wukD1xcg5IMl/HnyClcrkvijRpmNruXJyvjELHNw3a/+EG/Yz
         v5qIbhCwvAqlLV7q9zX5nGPeU2hX+LW2DmHXH9PhRNi921RYThFHV8Pv2k2602KODfPt
         LwhSu8kFL30utXGDTGqf3nlLreYv/515ObAIpPuGYf5CFzSkJbwI5BOHqhBVEPG/vX/p
         hzlg==
X-Forwarded-Encrypted: i=1; AJvYcCUUf2NobESTv1yQ5MOQW+Gz5sk8kIf9LPU7WZuUxRKpxF/qA6lk31Ek0F4heJB8PVRWWhtgHbqXevmV@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy0cBWCRFRe4cph57WrwcDw82lxhGmcJPP5DmjGjxURRW3zPKw
	YW2reeSJAVAwrvCEgUqR/4NsN5F2Fq4gJKLlODviwvnH6qUPV4i5YmazUJFxQBX2zcuFaUtObnw
	crMqajAAQ056IipuP1G7GRqH4kVpG0dMCOt3BWi8CWxhufK/LU8re+n/+IhmkSt4=
X-Gm-Gg: AY/fxX5aVY5SqDLNkz+ETy9Wcz7PlDlPCVxFcCdbqTB0WQaHlm+TuuiiqzMxSJKUcS9
	6/fVnc/oPAJOSwigX4vXpd752cdAa4AvBnXmwBoZbBSojWUJQkaVwUowm8fVpeh47xryrwHPXJV
	A4+g0T8ww/453DyKRKYHIuR2ZKopLIAgxWfRu5+zHP30Vv03vqhJRNoYkRQGmfiby+W67NHVq3k
	Ir0KYiiwViIIe7Nt4za3EOTQXlRNlIhs3aPPP8MgH7YGH00LzfzbBNLwWUSle3BlCkYVGupBCp+
	rmJBTnNR4Ami9ktp4KiHrhOsEk9NaV5DmDTaKLi8AM8iCdFR9hxAlU1k1K8fT/OTzGpvGMqIu4c
	3O+QzCSylVAacj70WmAZg1vlP+SfWJveYBw==
X-Received: by 2002:a05:6000:1865:b0:42f:b9f6:f118 with SMTP id ffacd0b85a97d-4324e4cc03bmr47308983f8f.15.1767112837169;
        Tue, 30 Dec 2025 08:40:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHJgojb32FwsKVmHhWZwfLhjoCLU41JBrW58xQS8ik2FTwcPC3e2aYiOOV4nGFH+isXC/64yA==
X-Received: by 2002:a05:6000:1865:b0:42f:b9f6:f118 with SMTP id ffacd0b85a97d-4324e4cc03bmr47308928f8f.15.1767112836647;
        Tue, 30 Dec 2025 08:40:36 -0800 (PST)
Received: from redhat.com (IGLD-80-230-31-118.inter.net.il. [80.230.31.118])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1af2bsm69151255f8f.1.2025.12.30.08.40.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 08:40:36 -0800 (PST)
Date: Tue, 30 Dec 2025 11:40:33 -0500
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
Subject: [PATCH RFC 15/13] gpio: virtio: reorder fields to reduce struct
 padding
Message-ID: <55e9351282f530e2302e11497c6339c4a2e74471.1767112757.git.mst@redhat.com>
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

Reorder struct virtio_gpio_line fields to place the DMA buffers (req/res)
last. This eliminates the need for __dma_from_device_aligned_end padding
after the DMA buffer, since struct tail padding naturally protects it,
making the struct a bit smaller.

Size reduction estimation when ARCH_DMA_MINALIGN=128:
- request is 8 bytes
- response is 2 bytes
- removing _end saves up to 128-6=122 bytes padding to align rxlen field

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/gpio/gpio-virtio.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index 32b578b46df8..8b30a94e4625 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -26,12 +26,11 @@ struct virtio_gpio_line {
 	struct mutex lock; /* Protects line operation */
 	struct completion completion;
 
+	unsigned int rxlen;
+
 	__dma_from_device_aligned_begin
 	struct virtio_gpio_request req;
 	struct virtio_gpio_response res;
-
-	__dma_from_device_aligned_end
-	unsigned int rxlen;
 };
 
 struct vgpio_irq_line {
-- 
MST


